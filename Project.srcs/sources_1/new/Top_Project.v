`timescale 1ns / 1ps
//=============================================================================
// PocketScope — Integrated Multi-function Instrument
// EGO1 (XC7A35T-1CSG324C) Top Module
//
// Architecture ported from pocketscope_sim2_0 reference design.
// Signal generator → J2 dacOUT only (VGA blanked).
// Oscilloscope → single-channel XADC + wave_ram + waveform_display.
// Lissajous / Kaleidoscope → separate display modules.
//
// Switch mapping (direct, matches pocketscope_sim2_0):
//   sw[1:0] = device_mode (00=SigGen, 01=Scope, 10=Lissajous, 11=Kaleidoscope)
//   sw[4:2] = sub-mode / wave type
//   sw[7:5] = frequency coarse range
//   dip[7:0]= frequency fine adjust
//=============================================================================

module Top_Project (
    input  wire        sys_clk,         // 100MHz system clock
    input  wire        sys_rst_n,       // Active-low reset

    // ---- Physical keys and switches ----
    input  wire        btn_center,
    input  wire        btn_left,
    input  wire        btn_right,
    input  wire        btn_up,
    input  wire        btn_down,
    input  wire [7:0]  sw,              // 8 slide switches: {coarse[2:0], sub[2:0], mode[1:0]}
    input  wire [7:0]  dip,             // 8 DIP switches: frequency fine adjust

    // ---- DAC0832 physical output ----
    output wire [7:0]  dac_data,
    output wire        dac_ile,
    output wire        dac_cs_n,
    output wire        dac_wr1_n,
    output wire        dac_wr2_n,
    output wire        dac_xfer_n,

    // ---- VGA physical output ----
    output wire        vga_hs,
    output wire        vga_vs,
    output wire [3:0]  vga_r,
    output wire [3:0]  vga_g,
    output wire [3:0]  vga_b,

    // ---- Analog switch control ----
    output wire        ch1_range_sel,
    output wire        ch1_acdc_sel,
    output wire        ch1_switch_en_n,
    output wire        ch2_range_sel,
    output wire        ch2_acdc_sel,
    output wire        ch2_switch_en_n,
    output wire        sg_en_n,
    output wire        sg_out_sel,

    // ---- XADC differential analog inputs ----
    input  wire        vauxp_ch1,
    input  wire        vauxn_ch1,
    input  wire        vauxp_ch2,
    input  wire        vauxn_ch2
);

    //=========================================================================
    // Clock generation — 100MHz input → 100MHz + 25MHz (clk_wiz_0)
    //=========================================================================
    wire clk_100m, clk_25m, clk_locked;

    clk_wiz_0 u_clk_gen (
        .clk_in1  (sys_clk),
        .resetn   (sys_rst_n),
        .clk_out1 (clk_100m),
        .clk_out2 (clk_25m),
        .locked   (clk_locked)
    );

    wire global_rst_n = sys_rst_n & clk_locked;

    //=========================================================================
    // Switch bus — direct mapping to ui_ctrl (matches pocketscope_sim2_0)
    //
    // sw[1:0]   = main mode (00=sig gen, 01=scope, 10=lissajous, 11=kaleidoscope)
    // sw[4:2]   = sub-mode / wave type in sig-gen mode
    // sw[7:5]   = frequency coarse range
    //=========================================================================

    // DIP bus — directly connected (was previously hardcoded)
    wire [7:0] sw_dip_bus = dip;

    // 5-bit button bus for ui_ctrl (matches pocketscope_sim2_0 PBs)
    // PB0=right/amplitude+, PB1=down/amplitude-, PB2=center/mod_depth+,
    // PB3=left/mod_depth-, PB4=up/trigger_level+
    wire [4:0] btn_bus = {btn_up, btn_left, btn_center, btn_down, btn_right};

    //=========================================================================
    // UI Controller (from pocketscope_sim2_0) — debounce + mode + parameters
    //=========================================================================
    wire [1:0]  device_mode;
    wire [2:0]  sig_gen_submode;
    wire [1:0]  mod_type;
    wire        mod_enable;
    wire [23:0] frequency_ftw;
    wire [7:0]  amplitude;
    wire [7:0]  mod_depth;
    wire [2:0]  scope_timebase;
    wire [7:0]  scope_trigger_level;

    ui_ctrl #(.PHASE_WIDTH(24)) u_ui (
        .clk                (clk_25m),
        .rst_n              (global_rst_n),
        .btn                (btn_bus),
        .sw                 (sw),
        .sw_dip             (sw_dip_bus),
        .device_mode        (device_mode),
        .sig_gen_submode    (sig_gen_submode),
        .mod_type           (mod_type),
        .mod_enable         (mod_enable),
        .frequency_ftw      (frequency_ftw),
        .amplitude          (amplitude),
        .mod_depth          (mod_depth),
        .scope_timebase     (scope_timebase),
        .scope_trigger_level(scope_trigger_level)
    );

    //=========================================================================
    // Analog switch control — derived from device_mode
    //=========================================================================
    // Scope modes (01,10,11): acquisition enabled, sig-gen disabled
    // SigGen mode (00):      acquisition disabled, sig-gen enabled
    wire is_scope_mode  = (device_mode == 2'b01) || (device_mode == 2'b10) || (device_mode == 2'b11);
    wire is_siggen_mode = (device_mode == 2'b00);

    assign ch1_switch_en_n = ~is_scope_mode;
    assign ch2_switch_en_n = ~is_scope_mode;
    assign sg_en_n         = ~is_siggen_mode;
    assign sg_out_sel      = 1'b0;

    // Range and AC/DC — fixed defaults (can be adjusted via HW)
    assign ch1_range_sel = 1'b0;
    assign ch1_acdc_sel  = 1'b0;
    assign ch2_range_sel = 1'b0;
    assign ch2_acdc_sel  = 1'b0;

    //=========================================================================
    // Recalculate frequency in Hz from switches (for display overlay in ui_ctrl)
    //=========================================================================
    wire [2:0]  sg_coarse = sw[7:5];
    wire [15:0] sg_freq_unclamped =
        (sg_coarse == 3'd0) ? (16'd100  + {8'b0, sw_dip_bus} * 16'd20) :
        (sg_coarse == 3'd1) ? (16'd2000 + {8'b0, sw_dip_bus} * 16'd20) :
        (sg_coarse == 3'd2) ? (16'd4000 + {8'b0, sw_dip_bus} * 16'd20) :
        (sg_coarse == 3'd3) ? (16'd6000 + {8'b0, sw_dip_bus} * 16'd20) :
        (sg_coarse == 3'd4) ? (16'd8000 + {8'b0, sw_dip_bus} * 16'd20) :
        16'd1000;
    wire [15:0] freq_hz =
        (sg_freq_unclamped < 16'd100)   ? 16'd100   :
        (sg_freq_unclamped > 16'd10000) ? 16'd10000 :
        sg_freq_unclamped;

    //=========================================================================
    // DDS Signal Generator
    //=========================================================================
    wire [1:0] dds_wave_type;
    assign dds_wave_type = sig_gen_submode[2] ? 2'b00 : sig_gen_submode[1:0];

    wire [7:0]  dds_wave_out;
    wire [23:0] dds_ftw_in;

    // Modulation
    wire [23:0] fm_ftw;
    wire [7:0]  mod_signal_out;

    modulation #(.PHASE_WIDTH(24)) u_mod (
        .clk        (clk_25m),
        .rst_n      (global_rst_n),
        .mod_type   (mod_type),
        .mod_enable (mod_enable && is_siggen_mode),
        .base_ftw   (frequency_ftw),
        .carrier_in (dds_wave_out),
        .mod_depth  (mod_depth),
        .fm_ftw_out (fm_ftw),
        .signal_out (mod_signal_out)
    );

    assign dds_ftw_in = (mod_enable && mod_type == 2'b01) ? fm_ftw : frequency_ftw;

    dds_core #(.PHASE_WIDTH(24), .LUT_ADDR_W(10), .LUT_DATA_W(8)) u_dds (
        .clk       (clk_25m),
        .rst_n     (global_rst_n),
        .ftw       (dds_ftw_in),
        .wave_type (dds_wave_type),
        .wave_out  (dds_wave_out)
    );

    //=========================================================================
    // DAC Output — Bipolar ±3.3V with amplitude control
    //=========================================================================
    localparam DAC_VREF_MV = 3300;
    localparam DAC_VOUT_MV = 2900;
    localparam AMPL_CAL    = (DAC_VOUT_MV * 256) / DAC_VREF_MV;  // ≈ 225

    wire [15:0] ampl_scaled = amplitude * AMPL_CAL;
    wire [7:0]  ampl_eff    = ampl_scaled[15:8];

    wire [7:0] dac_data_raw;
    assign dac_data_raw = mod_enable ? mod_signal_out : dds_wave_out;

    // Bipolar amplitude scaling with saturation
    wire signed [8:0]  dac_dev   = $signed({1'b0, dac_data_raw}) - 9'sd128;
    wire signed [17:0] dac_prod  = dac_dev * $signed({1'b0, ampl_eff});
    wire signed [9:0]  dac_sum   = $signed(dac_prod[17:8]) + 10'sd128;
    wire [7:0]         dac_data_in = dac_sum[9] ? 8'd0 :
                                      dac_sum[8] ? 8'd255 :
                                                   dac_sum[7:0];

    // DAC update rate divider (25MHz / 24 ≈ 1.04MHz)
    wire dac_update;
    reg [4:0]  dac_rate_cnt;
    reg        dac_update_trig;

    always @(posedge clk_25m or negedge global_rst_n) begin
        if (!global_rst_n) begin
            dac_rate_cnt    <= 0;
            dac_update_trig <= 0;
        end else begin
            dac_update_trig <= 0;
            if (dac_rate_cnt == 23) begin
                dac_rate_cnt    <= 0;
                dac_update_trig <= 1;
            end else begin
                dac_rate_cnt <= dac_rate_cnt + 1'b1;
            end
        end
    end

    assign dac_update = dac_update_trig && is_siggen_mode;

    dac0832_ctrl u_dac (
        .clk         (clk_25m),
        .rst_n       (global_rst_n),
        .dac_data_in (dac_data_in),
        .dac_update  (dac_update),
        .dac_d       (dac_data),
        .dac_ile     (dac_ile),
        .dac_cs_n    (dac_cs_n),
        .dac_wr1_n   (dac_wr1_n),
        .dac_wr2_n   (dac_wr2_n),
        .dac_xfer_n  (dac_xfer_n)
    );

    //=========================================================================
    // Oscilloscope Acquisition — Single Channel XADC (from pocketscope_sim2_0)
    //
    // XADC on VAUXP[2]/VAUXN[2] (J5 pins 9-10 on EGO1).
    // CH1 only; CH2 tied to mid-scale for display purposes.
    //=========================================================================

    wire [11:0] adc_ch1_raw;
    wire        adc_ch1_vld;
    wire        adc_trigger_fired;

    // Debug signals from XADC DRP FSM
    wire dbg_drp_drdy, dbg_drp_den, dbg_den_pending, dbg_startup_done;

    Oscilloscope_Acq u_osc_acq (
        .clk            (clk_100m),
        .rst_n          (global_rst_n),
        .ch1_en_n       (ch1_switch_en_n),
        .vauxp_ch1      (vauxp_ch1),
        .vauxn_ch1      (vauxn_ch1),
        .trigger_level  ({scope_trigger_level, 4'd0}),
        .ch1_data       (adc_ch1_raw),
        .ch1_valid      (adc_ch1_vld),
        .trigger_fired  (adc_trigger_fired),
        .dbg_drp_drdy   (dbg_drp_drdy),
        .dbg_drp_den    (dbg_drp_den),
        .dbg_den_pending(dbg_den_pending),
        .dbg_startup_done(dbg_startup_done)
    );

    //=========================================================================
    // CDC Bridge: 100MHz → 25MHz
    //
    // XADC valid pulses are 1 cycle wide at 100MHz (10ns) — too narrow for
    // 25MHz logic (40ns period). Pulse stretching in the source domain +
    // 2-stage synchronizer in the destination domain ensures safe capture.
    //=========================================================================

    // --- 100MHz domain: pulse stretching + data hold ---
    reg [3:0]  ch1_stretch_cnt;
    reg        ch1_valid_sys;
    reg [11:0] ch1_data_sys;

    always @(posedge clk_100m or negedge global_rst_n) begin
        if (!global_rst_n) begin
            ch1_stretch_cnt <= 0;
            ch1_valid_sys   <= 0;
            ch1_data_sys    <= 12'h800;
        end else begin
            if (adc_ch1_vld) begin
                ch1_valid_sys   <= 1'b1;
                ch1_stretch_cnt <= 0;
                ch1_data_sys    <= adc_ch1_raw;
            end else if (ch1_valid_sys) begin
                if (ch1_stretch_cnt == 4'd7) begin
                    ch1_valid_sys   <= 1'b0;
                    ch1_stretch_cnt <= 0;
                end else begin
                    ch1_stretch_cnt <= ch1_stretch_cnt + 1'b1;
                end
            end
        end
    end

    // --- 25MHz domain: 2-stage sync + edge detect + data capture ---
    reg        ch1_v_s25_1, ch1_v_s25_2, ch1_v_s25_prev;
    reg [11:0] adc_ch1_synced;

    always @(posedge clk_25m or negedge global_rst_n) begin
        if (!global_rst_n) begin
            ch1_v_s25_1    <= 0;
            ch1_v_s25_2    <= 0;
            ch1_v_s25_prev <= 0;
            adc_ch1_synced <= 12'h800;
        end else begin
            // 2-stage synchronizer
            ch1_v_s25_1 <= ch1_valid_sys;
            ch1_v_s25_2 <= ch1_v_s25_1;
            ch1_v_s25_prev <= ch1_v_s25_2;

            // Rising-edge detect + data capture
            if (ch1_v_s25_2 && !ch1_v_s25_prev)
                adc_ch1_synced <= ch1_data_sys;
        end
    end

    // Synchronized valid flag and 8-bit data in 25MHz domain
    wire       adc_ch1_vld_25m = ch1_v_s25_2 && !ch1_v_s25_prev;
    wire [7:0] adc_ch1_8b      = adc_ch1_synced[11:4];

    // CDC for trigger_fired (100MHz → 25MHz)
    reg        trig_fired_stretched;
    reg [2:0]  trig_stretch_cnt;

    always @(posedge clk_100m or negedge global_rst_n) begin
        if (!global_rst_n) begin
            trig_fired_stretched <= 0;
            trig_stretch_cnt     <= 0;
        end else begin
            if (adc_trigger_fired) begin
                trig_fired_stretched <= 1'b1;
                trig_stretch_cnt     <= 0;
            end else if (trig_fired_stretched) begin
                if (trig_stretch_cnt == 3'd7) begin
                    trig_fired_stretched <= 1'b0;
                    trig_stretch_cnt     <= 0;
                end else begin
                    trig_stretch_cnt <= trig_stretch_cnt + 1'b1;
                end
            end
        end
    end

    reg trig_sync1, trig_sync2, trig_sync_prev;
    reg trigger_fired_25m;

    always @(posedge clk_25m or negedge global_rst_n) begin
        if (!global_rst_n) begin
            trig_sync1        <= 0;
            trig_sync2        <= 0;
            trig_sync_prev    <= 0;
            trigger_fired_25m <= 0;
        end else begin
            trig_sync1 <= trig_fired_stretched;
            trig_sync2 <= trig_sync1;
            trig_sync_prev <= trig_sync2;
            trigger_fired_25m <= trig_sync2 && !trig_sync_prev;
        end
    end

    //=========================================================================
    // Waveform Storage (Single Channel)
    //
    // Trigger resets write address to align trigger point with screen center
    // (center = 512 pixels into the 1024-sample buffer).
    //=========================================================================
    wire       de;
    wire [9:0] pixel_x, pixel_y;

    wire trigger_reset;
    assign trigger_reset = trigger_fired_25m && (device_mode == 2'b01);

    // Sequential write address: increments on each CH1 valid
    reg [9:0] sample_wr_addr;

    always @(posedge clk_25m or negedge global_rst_n) begin
        if (!global_rst_n)
            sample_wr_addr <= 10'd0;
        else if (trigger_reset)
            sample_wr_addr <= 10'd512;  // align trigger point to buffer center
        else if (adc_ch1_vld_25m)
            sample_wr_addr <= sample_wr_addr + 1'b1;
    end

    // Display read address: show the last 640 samples before current write pos.
    // pixel_x=0 → oldest visible sample; pixel_x=639 → newest visible sample.
    wire [9:0] display_addr = (sample_wr_addr - 10'd640 + pixel_x);

    wire [7:0] wave_ch1, wave_ch2;

    wave_ram_ch1 u_ram_ch1 (
        .clk    (clk_25m),
        .we     (adc_ch1_vld_25m),
        .wr_addr(sample_wr_addr),
        .din    (adc_ch1_8b),
        .rd_addr(display_addr),
        .dout   (wave_ch1)
    );

    // CH2 tied to mid-scale (single-channel mode)
    wave_ram_ch2 u_ram_ch2 (
        .clk    (clk_25m),
        .we     (adc_ch1_vld_25m),
        .wr_addr(sample_wr_addr),
        .din    (8'd128),
        .rd_addr(display_addr),
        .dout   (wave_ch2)
    );

    // Legacy dual-channel wires for display modules
    wire [7:0] adc_ch2_8b      = 8'd128;              // CH2 tied to mid-scale
    wire       adc_ch2_vld_25m = adc_ch1_vld_25m;     // reuse CH1 valid for CH2 display

    // Sample rate display (kHz)
    wire [15:0] sample_rate_disp = 16'd1920;  // ~1.92MSPS at 100MHz DCLK
    wire        trigger_armed    = 1'b1;      // always armed (trigger handled in Oscilloscope_Acq)

    //=========================================================================
    // Waveform Analyzers (Frequency, Vpp, Type, RMS, Avg, Max)
    //
    // Calibration based on EGO1 extension board:
    //   Signal chain: BNC → 10kΩ + 100kΩ trimmer → MCP6002 (G=1.1×) → XADC VAUXP2
    //   XADC: 12-bit 0-1V, code uses adc[11:4] (8-bit, 0-255)
    //   ADC LSB (8-bit) = 1V/256 = 3.90625mV at XADC input
    //   → CAL_MV_X1024 = round(3.90625×1024) = 4000
    //
    // Frequency calibration (single-channel, ~1.92MSPS):
    //   GATE_MAX = 10000 samples, sample_rate ≈ 1.92MSPS
    //   Gate time = 10000/1920000 ≈ 5.2ms
    //   FREQ_CAL_X10 = sample_rate × 10 / GATE_MAX = 1920
    //=========================================================================
    localparam FREQ_CAL_X10_CH   = 1920;  // frequency cal (×10): 1920 for ~1.92MSPS
    localparam CAL_MV_X1024_VAL  = 4000;  // mV cal (×1024): 4000 → 3.90625 mV/LSB

    wire [15:0] freq_ch1, freq_ch2;
    wire [15:0] period_ch1, period_ch2;
    wire [7:0]  vpp_ch1, vpp_ch2;
    wire [7:0]  vmin_ch1, vmin_ch2;
    wire [2:0]  type_ch1, type_ch2;
    wire [6:0]  duty_ch1, duty_ch2;
    wire [7:0]  rise_time_ch1, rise_time_ch2;
    wire [10:0] crest_ch1, crest_ch2;
    wire        meas_valid_ch1, meas_valid_ch2;
    wire [7:0]  rms_ch1, rms_ch2;
    wire [7:0]  avg_ch1, avg_ch2;
    wire [7:0]  max_ch1, max_ch2;
    wire [15:0] vpp_mv_ch1, vpp_mv_ch2;
    wire [15:0] vmin_mv_ch1, vmin_mv_ch2;
    wire [15:0] rms_mv_ch1, rms_mv_ch2;
    wire [15:0] avg_mv_ch1, avg_mv_ch2;
    wire [15:0] max_mv_ch1, max_mv_ch2;

    wave_analyzer #(
        .FREQ_CAL_X10(FREQ_CAL_X10_CH),
        .CAL_MV_X1024(CAL_MV_X1024_VAL)
    ) u_analyzer_ch1 (
        .clk            (clk_25m),
        .rst_n          (global_rst_n),
        .wave_data      (adc_ch1_8b),
        .wave_valid     (adc_ch1_vld_25m),
        .frequency_hz   (freq_ch1),
        .period_x100us  (period_ch1),
        .vpp            (vpp_ch1),
        .vmin_val       (vmin_ch1),
        .wave_type_det  (type_ch1),
        .duty_cycle     (duty_ch1),
        .rise_time_us   (rise_time_ch1),
        .crest_factor_x100(crest_ch1),
        .meas_valid     (meas_valid_ch1),
        .rms            (rms_ch1),
        .avg_val        (avg_ch1),
        .max_val        (max_ch1),
        .vpp_mv         (vpp_mv_ch1),
        .vmin_mv        (vmin_mv_ch1),
        .rms_mv         (rms_mv_ch1),
        .avg_mv         (avg_mv_ch1),
        .max_mv         (max_mv_ch1)
    );

    // CH2 analyzer fed with constant mid-scale (single-channel mode)
    wave_analyzer #(
        .FREQ_CAL_X10(FREQ_CAL_X10_CH),
        .CAL_MV_X1024(CAL_MV_X1024_VAL)
    ) u_analyzer_ch2 (
        .clk            (clk_25m),
        .rst_n          (global_rst_n),
        .wave_data      (adc_ch2_8b),
        .wave_valid     (adc_ch1_vld_25m),
        .frequency_hz   (freq_ch2),
        .period_x100us  (period_ch2),
        .vpp            (vpp_ch2),
        .vmin_val       (vmin_ch2),
        .wave_type_det  (type_ch2),
        .duty_cycle     (duty_ch2),
        .rise_time_us   (rise_time_ch2),
        .crest_factor_x100(crest_ch2),
        .meas_valid     (meas_valid_ch2),
        .rms            (rms_ch2),
        .avg_val        (avg_ch2),
        .max_val        (max_ch2),
        .vpp_mv         (vpp_mv_ch2),
        .vmin_mv        (vmin_mv_ch2),
        .rms_mv         (rms_mv_ch2),
        .avg_mv         (avg_mv_ch2),
        .max_mv         (max_mv_ch2)
    );

    //=========================================================================
    // VGA Controller
    //=========================================================================
    vga_ctrl u_vga (
        .clk    (clk_25m),
        .rst_n  (global_rst_n),
        .hsync  (vga_hs),
        .vsync  (vga_vs),
        .de     (de),
        .pixel_x(pixel_x),
        .pixel_y(pixel_y)
    );

    //=========================================================================
    // Display Modules
    //=========================================================================

    // 1) Oscilloscope mode — dual-channel waveform display with metrics bar
    wire [3:0] scope_r, scope_g, scope_b;

    waveform_display u_scope_display (
        .clk                (clk_25m),
        .de                 (de),
        .pixel_x            (pixel_x),
        .pixel_y            (pixel_y),
        .wave_ch1           (wave_ch1),
        .wave_ch2           (wave_ch2),
        // CH1 metrics
        .freq_ch1           (freq_ch1),
        .period_ch1_x100us  (period_ch1),
        .vpp_ch1            (vpp_ch1),
        .vmin_ch1           (vmin_ch1),
        .type_ch1           (type_ch1),
        .duty_ch1           (duty_ch1),
        .rise_time_ch1      (rise_time_ch1),
        .crest_ch1_x100     (crest_ch1),
        .rms_ch1            (rms_ch1),
        .avg_ch1            (avg_ch1),
        .max_ch1            (max_ch1),
        .vpp_mv_ch1         (vpp_mv_ch1),
        .vmin_mv_ch1        (vmin_mv_ch1),
        .rms_mv_ch1         (rms_mv_ch1),
        .avg_mv_ch1         (avg_mv_ch1),
        .max_mv_ch1         (max_mv_ch1),
        // CH2 metrics
        .freq_ch2           (freq_ch2),
        .period_ch2_x100us  (period_ch2),
        .vpp_ch2            (vpp_ch2),
        .vmin_ch2           (vmin_ch2),
        .type_ch2           (type_ch2),
        .duty_ch2           (duty_ch2),
        .rise_time_ch2      (rise_time_ch2),
        .crest_ch2_x100     (crest_ch2),
        .rms_ch2            (rms_ch2),
        .avg_ch2            (avg_ch2),
        .max_ch2            (max_ch2),
        .vpp_mv_ch2         (vpp_mv_ch2),
        .vmin_mv_ch2        (vmin_mv_ch2),
        .rms_mv_ch2         (rms_mv_ch2),
        .avg_mv_ch2         (avg_mv_ch2),
        .max_mv_ch2         (max_mv_ch2),
        // Sample rate + trigger
        .meas_valid         (meas_valid_ch1),
        .sample_rate_hz     (sample_rate_disp),
        .trigger_armed      (trigger_armed),
        .trigger_level      (scope_trigger_level),
        .vga_r              (scope_r),
        .vga_g              (scope_g),
        .vga_b              (scope_b)
    );

    // 2) Lissajous X-Y mode
    wire [3:0] liss_r, liss_g, liss_b;

    lissajous_display u_liss (
        .clk        (clk_25m),
        .rst_n      (global_rst_n),
        .de         (de),
        .pixel_x    (pixel_x),
        .pixel_y    (pixel_y),
        .ch1_data   (adc_ch1_8b),
        .ch2_data   (adc_ch2_8b),
        .ch1_valid  (adc_ch1_vld_25m),
        .ch2_valid  (adc_ch2_vld_25m),
        .freq_ch1   (freq_ch1),
        .freq_ch2   (freq_ch2),
        .vga_r      (liss_r),
        .vga_g      (liss_g),
        .vga_b      (liss_b)
    );

    // 3) Kaleidoscope mode
    wire [3:0] kalei_r, kalei_g, kalei_b;

    kaleidoscope u_kalei (
        .clk        (clk_25m),
        .rst_n      (global_rst_n),
        .de         (de),
        .pixel_x    (pixel_x),
        .pixel_y    (pixel_y),
        .ch1_data   (adc_ch1_8b),
        .ch2_data   (adc_ch2_8b),
        .ch1_valid  (adc_ch1_vld_25m),
        .ch2_valid  (adc_ch2_vld_25m),
        .vga_r      (kalei_r),
        .vga_g      (kalei_g),
        .vga_b      (kalei_b)
    );

    //=========================================================================
    // Mode MUX — select which display drives VGA
    //
    // Signal generator mode (00): VGA blanked — signal goes to J2 dacOUT only.
    // Other modes: drive VGA with the corresponding display module.
    //=========================================================================
    assign vga_r = (device_mode == 2'b00) ? 4'h0 :
                   (device_mode == 2'b10) ? liss_r   :
                   (device_mode == 2'b11) ? kalei_r  : scope_r;

    assign vga_g = (device_mode == 2'b00) ? 4'h0 :
                   (device_mode == 2'b10) ? liss_g   :
                   (device_mode == 2'b11) ? kalei_g  : scope_g;

    assign vga_b = (device_mode == 2'b00) ? 4'h0 :
                   (device_mode == 2'b10) ? liss_b   :
                   (device_mode == 2'b11) ? kalei_b  : scope_b;

endmodule
