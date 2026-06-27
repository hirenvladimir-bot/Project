`timescale 1ns / 1ps
//=============================================================================
// Waveform Analyzer — Optimized Lab-Oscilloscope Measurements
//
// Measurements (GATE_MAX = 10000 sample gate, ~20ms at 500kSPS):
//   Frequency:   zero-crossing counter, freq_hz = zc × FREQ_CAL_X10 / 10
//   Period:      estimated from zero-crossing spacing (in 100µs units)
//   Vpp:         peak_max − peak_min over gate (raw ADC + calibrated mV)
//   Vmin/Vmax:   valley / peak values in gate (raw + calibrated mV)
//   RMS:         sqrt(Σ(wave−128)² / 8192) — AC RMS (raw + calibrated mV)
//   Average:     Σ(wave) / 8192 — DC level (raw + calibrated mV)
//   Duty Cycle:  time-above-midpoint / total-time × 100% (square waves)
//   Crest Factor: Vpeak / Vrms × 100 (sine≈141, square≈100, triangle≈173)
//   Rise Time:   estimated 10%→90% transition time (µs)
//
// Waveform Type Detection (histogram + shape analysis):
//   3'b000: Sine    3'b001: Square   3'b010: Triangle
//   3'b011: Sawtooth 3'b100: DC       3'b101: Noise/complex
//
// Calibration:
//   ADC LSB (8-bit) = 1V/256 = 3.90625mV at XADC input
//   CAL_MV_X1024 = 4000 → raw × 4000 / 1024 ≈ raw × 3.90625 mV/LSB
//
// Changes from previous version:
//   - Single shared gate_cnt replaces 4 redundant counters
//   - Rise time uses stable vpp/vmin_val from last completed gate
//   - Rise time thresholds: Vpp×26>>8 (≈10.2%) and Vpp×230>>8 (≈89.8%)
//   - Period division pipelined (capture → divide, 1-cycle latency)
//   - Removed dead rt_vpp/rt_vmin tracking registers
//=============================================================================

module wave_analyzer
#(
    // Frequency calibration: freq_hz = zc_count × FREQ_CAL_X10 / 10
    parameter [15:0] FREQ_CAL_X10  = 100,
    // Voltage calibration: mV = raw × CAL_MV_X1024 >> 10
    parameter [15:0] CAL_MV_X1024  = 4000,
    // Gate sizes
    parameter [13:0] GATE_MAX      = 10000,   // freq, Vpp, type, duty gate
    parameter [12:0] RMS_GATE      = 8192     // RMS, AVG, MAX gate (2^13)
)
(
    input  wire          clk,
    input  wire          rst_n,
    input  wire [7:0]    wave_data,
    input  wire          wave_valid,

    // ---- Frequency, Vpp, Type, Duty (GATE_MAX samples) ----
    output reg  [15:0]   frequency_hz,
    output reg  [15:0]   period_x100us,      // period in units of 100µs
    output reg  [7:0]    vpp,
    output reg  [7:0]    vmin_val,            // minimum (valley) raw
    output reg  [2:0]    wave_type_det,       // 3-bit: sine/square/tri/saw/dc/noise
    output reg  [6:0]    duty_cycle,          // 0-100%
    output reg  [7:0]    rise_time_us,        // estimated 10→90% rise time (µs)
    output reg  [10:0]   crest_factor_x100,   // Vpeak/Vrms × 100
    output reg           meas_valid,

    // ---- RMS, Average, Max (8192-sample gate) — raw ADC counts ----
    output reg  [7:0]    rms,
    output reg  [7:0]    avg_val,
    output reg  [7:0]    max_val,

    // ---- Calibrated outputs in millivolts ----
    output reg  [15:0]   vpp_mv,
    output reg  [15:0]   vmin_mv,
    output reg  [15:0]   rms_mv,
    output reg  [15:0]   avg_mv,
    output reg  [15:0]   max_mv
);

    //=========================================================================
    // Integer square root (combinational, 8-cycle unrolled)
    // Input: 0-16125, output: 0-127
    //=========================================================================
    function [7:0] sqrt_int;
        input [15:0] x;
        reg [15:0] r;
        reg [7:0] q;
        reg [9:0] t;
        integer i;
        begin
            r = 0;
            q = 0;
            for (i = 7; i >= 0; i = i - 1) begin
                r = {r[13:0], x[2*i+1], x[2*i]};
                t = {q, 2'b01};
                if (r >= t) begin
                    r = r - t;
                    q = {q[6:0], 1'b1};
                end else begin
                    q = {q[6:0], 1'b0};
                end
            end
            sqrt_int = q;
        end
    endfunction

    //=========================================================================
    // Derived constants
    //=========================================================================
    // Sample rate = FREQ_CAL_X10 * GATE_MAX / 10
    //   With FREQ_CAL_X10=500, GATE_MAX=10000: sample_rate = 500kSPS
    localparam [31:0] SAMPLE_RATE   = (FREQ_CAL_X10 * GATE_MAX + 16'd5) / 16'd10;
    localparam [15:0] PERIOD_DIV    = (SAMPLE_RATE + 5000) / 10000;  // round

    //=========================================================================
    // Shared gate counter — replaces gate_cnt, peak_cnt, total_duty_count,
    // hist_cnt which all counted 0..GATE_MAX-1 on the same wave_valid.
    //=========================================================================
    reg [13:0] gate_cnt;
    wire       gate_done = (gate_cnt == GATE_MAX - 1);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            gate_cnt <= 0;
        end else if (wave_valid) begin
            if (gate_done)
                gate_cnt <= 0;
            else
                gate_cnt <= gate_cnt + 1'b1;
        end
    end

    //=========================================================================
    // Frequency measurement (zero-crossing, GATE_MAX samples)
    // Also track zero-crossing spacing for period estimation.
    //
    // Period division is pipelined: capture operands at gate_done, then
    // compute in the following cycle to ease timing closure.
    //=========================================================================
    reg [15:0] zc_count;
    reg        prev_sign;
    wire       curr_sign = (wave_data >= 8'd128);

    // Period tracking
    reg [15:0] zc_spacing_sum;
    reg [15:0] zc_spacing_cnt;
    reg [15:0] last_zc_sample;

    // Pipeline stage for frequency & period division
    reg [31:0] freq_num_pipe;       // zc_count * FREQ_CAL_X10 + 5
    reg [15:0] period_sum_pipe;
    reg [31:0] period_denom_pipe;   // zc_spacing_cnt * PERIOD_DIV
    reg [15:0] period_zc_pipe;
    reg        div_pending;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            zc_count        <= 0;
            prev_sign       <= 1'b0;
            frequency_hz    <= 0;
            period_x100us   <= 0;
            zc_spacing_sum  <= 0;
            zc_spacing_cnt  <= 0;
            last_zc_sample  <= 0;
            meas_valid      <= 1'b0;
            freq_num_pipe   <= 0;
            period_sum_pipe <= 0;
            period_denom_pipe <= 0;
            period_zc_pipe  <= 0;
            div_pending     <= 1'b0;
        end else begin
            meas_valid <= 1'b0;

            // ---- Pipeline stage 2: division completes ----
            if (div_pending) begin
                div_pending <= 1'b0;

                // freq_hz = (zc_count × FREQ_CAL_X10 + 5) / 10
                // freq_num_pipe max ≈ 10000×500+5 = 5_000_005 (23 bits).
                // Constant divisor /10 synthesizes to a lightweight multiply+shift.
                frequency_hz <= freq_num_pipe / 16'd10;

                // Period: avg_spacing × 10000 / SAMPLE_RATE
                //        = zc_spacing_sum / (zc_spacing_cnt × PERIOD_DIV)
                if (period_zc_pipe > 1 && period_denom_pipe > 0)
                    period_x100us <= period_sum_pipe / period_denom_pipe;
                else if (period_zc_pipe == 1)
                    period_x100us <= (GATE_MAX * 10000) / SAMPLE_RATE;
                else
                    period_x100us <= 0;

                meas_valid <= 1'b1;
            end

            // ---- Stage 1: accumulate during gate, capture at gate_done ----
            if (wave_valid) begin
                // Zero-crossing detection (rising edge through 128)
                if (curr_sign && !prev_sign && gate_cnt > 0) begin
                    zc_count <= zc_count + 1'b1;
                    if (zc_count > 0) begin
                        zc_spacing_sum <= zc_spacing_sum + (gate_cnt - last_zc_sample);
                        zc_spacing_cnt <= zc_spacing_cnt + 1'b1;
                    end
                    last_zc_sample <= gate_cnt;
                end
                prev_sign <= curr_sign;

                if (gate_done) begin
                    // Capture operands for pipelined division
                    freq_num_pipe   <= zc_count * FREQ_CAL_X10 + 16'd5;
                    period_sum_pipe <= zc_spacing_sum;
                    period_denom_pipe <= zc_spacing_cnt * PERIOD_DIV;
                    period_zc_pipe  <= zc_count;
                    div_pending     <= 1'b1;

                    // Reset accumulators
                    zc_count        <= 0;
                    zc_spacing_sum  <= 0;
                    zc_spacing_cnt  <= 0;
                    last_zc_sample  <= 0;
                end
            end
        end
    end

    //=========================================================================
    // Peak-to-peak detector (GATE_MAX samples) + Vmin + calibrated mV outputs
    //=========================================================================
    reg [7:0]  peak_max, peak_min;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            peak_max <= 8'h00;
            peak_min <= 8'hFF;
            vpp      <= 0;
            vpp_mv   <= 0;
            vmin_val <= 8'h80;
            vmin_mv  <= 0;
        end else if (wave_valid) begin
            if (wave_data > peak_max) peak_max <= wave_data;
            if (wave_data < peak_min) peak_min <= wave_data;
            if (gate_done) begin
                vpp      <= peak_max - peak_min;
                vpp_mv   <= ((peak_max - peak_min) * CAL_MV_X1024) >> 10;
                vmin_val <= peak_min;
                vmin_mv  <= (peak_min * CAL_MV_X1024) >> 10;
                peak_max <= 8'h00;
                peak_min <= 8'hFF;
            end
        end
    end

    //=========================================================================
    // Duty Cycle measurement (GATE_MAX samples)
    // Counts samples above midpoint (128) vs total samples.
    // duty = (high_count * 100 + GATE_MAX/2) / GATE_MAX  →  0..100%
    //=========================================================================
    reg [13:0] high_count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            high_count <= 0;
            duty_cycle <= 7'd50;
        end else if (wave_valid) begin
            if (wave_data >= 8'd128)
                high_count <= high_count + 1'b1;

            if (gate_done) begin
                duty_cycle <= ((high_count * 7'd100) + (GATE_MAX >> 1)) / GATE_MAX;
                high_count <= 0;
            end
        end
    end

    //=========================================================================
    // Rise Time estimation — stable thresholds from registered vpp/vmin_val
    //
    // Uses the vpp/vmin_val registers (updated at gate_done) as stable
    // threshold references for the entire gate period. Thresholds:
    //   rt_10 ≈ vmin_val + Vpp ×  26 / 256  (≈ 10.2%)
    //   rt_90 ≈ vmin_val + Vpp × 230 / 256  (≈ 89.8%)
    //
    // FSM: IDLE → wait for rising edge through 10% → COUNT until 90% or abort
    // Multiple edges are captured per gate; the average rise time is reported.
    //=========================================================================
    localparam RISE_IDLE  = 1'b0;
    localparam RISE_COUNT = 1'b1;

    reg        rise_state;
    reg [7:0]  rise_cnt;
    reg [7:0]  rise_acc;
    reg [3:0]  rise_evt_count;
    reg        rise_below_10_d1;    // previous sample was below 10% threshold

    // Stable thresholds from last completed measurement
    wire [7:0] rt_10 = vmin_val + ((vpp * 8'd26) >> 8);
    wire [7:0] rt_90 = vmin_val + ((vpp * 8'd230) >> 8);
    wire       rt_valid = (vpp > 8'd10);   // require meaningful Vpp

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rise_state      <= RISE_IDLE;
            rise_cnt        <= 0;
            rise_acc        <= 0;
            rise_evt_count  <= 0;
            rise_time_us    <= 0;
            rise_below_10_d1 <= 1'b1;
        end else if (wave_valid) begin
            // At gate end, publish the average rise time
            if (gate_done) begin
                if (rise_evt_count > 0) begin
                    // avg_samples → µs: ×2 for 500kSPS (1 sample ≈ 2µs)
                    rise_time_us <= ((rise_acc / {4'b0, rise_evt_count}) << 1);
                end
                rise_acc       <= 0;
                rise_evt_count <= 0;
            end

            // Track previous-below state for edge detection
            rise_below_10_d1 <= (wave_data < rt_10);

            if (rt_valid) begin
                case (rise_state)
                    RISE_IDLE: begin
                        // Rising edge through 10% threshold
                        if (wave_data >= rt_10 && rise_below_10_d1) begin
                            rise_state <= RISE_COUNT;
                            rise_cnt   <= 1;   // this sample counts as first above 10%
                        end
                    end

                    RISE_COUNT: begin
                        rise_cnt <= rise_cnt + 1'b1;

                        // Reached 90% → record measurement
                        if (wave_data >= rt_90) begin
                            rise_acc       <= rise_acc + rise_cnt;
                            rise_evt_count <= rise_evt_count + 1'b1;
                            rise_state     <= RISE_IDLE;
                            rise_cnt       <= 0;
                        end
                        // Fell back below 10% without reaching 90% → abort
                        else if (wave_data < rt_10 && !rise_below_10_d1) begin
                            rise_state <= RISE_IDLE;
                            rise_cnt   <= 0;
                        end
                        // Timeout guard (>200 samples ≈ 400µs)
                        else if (rise_cnt == 8'd200) begin
                            rise_state <= RISE_IDLE;
                            rise_cnt   <= 0;
                        end
                    end
                endcase
            end else begin
                // Signal too small for meaningful rise-time
                rise_state <= RISE_IDLE;
                rise_cnt   <= 0;
            end
        end
    end

    //=========================================================================
    // Waveform Type Detection (histogram + shape analysis, GATE_MAX samples)
    //
    // Bins: near_peak  (>192, top 25%),  near_valley (<64, bottom 25%),
    //       near_mid   (112-144, center 12.5%),
    //       zc_rapid   (rapid zero-crossings for noise detection)
    //
    // Classification:
    //   Square:   many at extremes, few in middle
    //   Triangle: uniform spread, significant mid-count
    //   Sawtooth: asymmetric — moderate mid + unbalanced duty
    //   DC:       Vpp < 5 (nearly flat)
    //   Noise:    small Vpp + high zero-crossing rate
    //   Sine:     default fallback
    //=========================================================================
    reg [13:0] near_peak, near_valley, near_mid;  // widened from 10-bit to prevent overflow
    reg [15:0] zc_rapid;
    reg        prev_sign2;
    reg        rms_valid;       // set after first RMS measurement completes

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            near_peak        <= 0;
            near_valley      <= 0;
            near_mid         <= 0;
            zc_rapid         <= 0;
            prev_sign2       <= 1'b0;
            wave_type_det    <= 3'b000;
            crest_factor_x100 <= 11'd141;
            rms_valid        <= 1'b0;
        end else if (wave_valid) begin
            // Histogram bins
            if (wave_data > 8'd192)                          near_peak   <= near_peak + 1'b1;
            if (wave_data < 8'd64)                           near_valley <= near_valley + 1'b1;
            if (wave_data > 8'd112 && wave_data < 8'd144)    near_mid    <= near_mid + 1'b1;

            // Rapid zero-crossing count for noise detection
            if (curr_sign != prev_sign2)
                zc_rapid <= zc_rapid + 1'b1;
            prev_sign2 <= curr_sign;

            // Track whether RMS has been computed at least once
            if (rms_cnt == RMS_GATE - 1)
                rms_valid <= 1'b1;

            if (gate_done) begin
                // ---- Crest Factor ----
                // crest × 100 = (Vpp/2) × 100 / RMS
                if (vpp > 8'd10 && rms > 8'd0 && rms_valid) begin
                    crest_factor_x100 <= (({3'b0, vpp[7:1]} * 11'd100) / {3'b0, rms});
                end else begin
                    crest_factor_x100 <= 11'd141;   // default: sine ≈ 1.414 × 100
                end

                // ---- Waveform Classification ----
                if (vpp < 8'd5) begin
                    wave_type_det <= 3'b100;  // DC
                end
                else if (vpp < 8'd15 && zc_rapid > 5000) begin
                    wave_type_det <= 3'b101;  // Noise
                end
                else if (near_peak > 3500 && near_valley > 3500 && near_mid < 800) begin
                    wave_type_det <= 3'b001;  // Square
                end
                else if (near_peak < 3000 && near_valley < 3000 && near_mid > 1500 &&
                         duty_cycle > 7'd35 && duty_cycle < 7'd65) begin
                    wave_type_det <= 3'b010;  // Triangle
                end
                else if (duty_cycle < 7'd30 || duty_cycle > 7'd70) begin
                    if (near_mid > 800)
                        wave_type_det <= 3'b011;  // Sawtooth
                    else
                        wave_type_det <= 3'b000;  // Sine (distorted)
                end
                else begin
                    wave_type_det <= 3'b000;  // Sine
                end

                near_peak    <= 0;
                near_valley  <= 0;
                near_mid     <= 0;
                zc_rapid     <= 0;
            end
        end
    end

    //=========================================================================
    // RMS, Average, Max accumulators (RMS_GATE = 8192 samples) + calibrated mV
    //
    // Uses its own rms_cnt (different gate size from GATE_MAX).
    //=========================================================================
    reg [27:0] sum_sq_acc;    // sum of (wave_data - 128)^2
    reg [20:0] sum_acc;       // sum of wave_data
    reg [7:0]  rms_peak;      // max value during RMS gate
    reg [12:0] rms_cnt;       // 0..8191

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sum_sq_acc <= 0;
            sum_acc    <= 0;
            rms_peak   <= 0;
            rms_cnt    <= 0;
            rms        <= 0;
            avg_val    <= 0;
            max_val    <= 0;
            rms_mv     <= 0;
            avg_mv     <= 0;
            max_mv     <= 0;
        end else if (wave_valid) begin
            // Accumulate: (wave-128)^2 and wave
            sum_sq_acc <= sum_sq_acc + ((wave_data >= 8'd128)
                          ? (wave_data - 8'd128) * (wave_data - 8'd128)
                          : (8'd128 - wave_data) * (8'd128 - wave_data));
            sum_acc    <= sum_acc + {13'b0, wave_data};
            if (wave_data > rms_peak) rms_peak <= wave_data;

            if (rms_cnt == RMS_GATE - 1) begin
                // avg = sum / 8192 = sum[20:13]
                avg_val <= sum_acc[20:13];

                // rms = sqrt(sum_sq / 8192) = sqrt(sum_sq[27:13])
                rms     <= sqrt_int({1'b0, sum_sq_acc[27:13]});

                // max = peak
                max_val <= rms_peak;

                // Calibrated mV outputs: mV = raw × CAL_MV_X1024 >> 10
                avg_mv  <= (sum_acc[20:13] * CAL_MV_X1024) >> 10;
                rms_mv  <= (sqrt_int({1'b0, sum_sq_acc[27:13]}) * CAL_MV_X1024) >> 10;
                max_mv  <= (rms_peak * CAL_MV_X1024) >> 10;

                // Reset accumulators
                sum_sq_acc <= 0;
                sum_acc    <= 0;
                rms_peak   <= 0;
                rms_cnt    <= 0;
            end else begin
                rms_cnt <= rms_cnt + 1'b1;
            end
        end
    end

endmodule
