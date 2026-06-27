`timescale 1ns / 1ps
//=============================================================================
// PocketScope — Multi-function Pocket Instrument
// EGO1 (XC7A35T-1CSG324C) Top Module
//=============================================================================
// Modes: 00=Signal Gen, 01=Oscilloscope, 10=Lissajous, 11=Kaleidoscope
//
// Clock architecture:
//   sys_clk (100MHz) → VGA controller + display modules (pixel clock)
//   sys_clk (100MHz) → clk_div_25m → 25MHz → DDS, DAC, UI, analyzers
//   sys_clk (100MHz) → XADC DCLK (Oscilloscope_Acq internal)
//
// VGA: 1600×900 @ 60Hz, pixel clock = 100MHz
//   H: 1600+48+32+80=1760, V: 900+3+5+39=947
//=============================================================================

module top
(
    input  wire          sys_clk,       // 100MHz system clock (matches EGO1.xdc)
    input  wire          rst_n,
    output wire [3:0]    vga_r, vga_g, vga_b,
    output wire          hsync, vsync,
    // DAC0832
    output wire [7:0]    dac_d,
    output wire          dac_ile, dac_cs_n, dac_wr1_n, dac_wr2_n, dac_xfer_n,
    // XADC analog inputs — VAUX2 (CH1) + VAUX10 (CH2)
    input  wire          vauxp_ch1, vauxn_ch1, // VAUXP[2]/N[2], EGO1 pins B16/B17
    input  wire          vauxp_ch2, vauxn_ch2, // VAUXP[10]/N[10], EGO1 pins A15/A16
    // UI
    input  wire [4:0]    btn,
    input  wire [7:0]    sw_in,
    input  wire [7:0]    sw_dip,
    // Status / loopback
    output wire [2:0]    led_speed,
    output wire [3:0]    loop_tx,
    input  wire [3:0]    loop_rx,
    // Analog switch control (74HC4053, active-low enables)
    output wire          ch1_switch_en_n,
    output wire          ch2_switch_en_n,
    output wire          ch1_range_sel,
    output wire          ch2_range_sel,
    output wire          ch1_acdc_sel,
    output wire          ch2_acdc_sel,
    output wire          sg_en_n,
    output wire          sg_out_sel
);

//=============================================================================
// Clock generation: 100MHz → 25MHz
//=============================================================================
wire clk_25m;

clk_div_25m u_clk_div (
    .clk_100m(sys_clk),
    .rst_n(rst_n),
    .clk_25m(clk_25m)
);

// Debug
wire dbg_clk25m = clk_25m;

//=============================================================================
// UI Controller
//=============================================================================
wire [1:0] device_mode;
wire [2:0] sig_gen_submode;
wire [1:0] mod_type;
wire       mod_enable;
wire [23:0] frequency_ftw;
wire [7:0]  amplitude;
wire [7:0]  mod_depth;
wire [2:0]  scope_timebase;
wire [7:0]  scope_trigger_level;

ui_ctrl #(.PHASE_WIDTH(24)) u_ui (
    .clk(clk_25m), .rst_n(rst_n),
    .btn(btn), .sw(sw_in), .sw_dip(sw_dip),
    .device_mode(device_mode), .sig_gen_submode(sig_gen_submode),
    .mod_type(mod_type), .mod_enable(mod_enable),
    .frequency_ftw(frequency_ftw), .amplitude(amplitude), .mod_depth(mod_depth),
    .scope_timebase(scope_timebase), .scope_trigger_level(scope_trigger_level)
);

// Debug
wire [23:0] dbg_freq_ftw  = frequency_ftw;
wire [7:0]  dbg_amplitude = amplitude;

// Recalculate frequency in Hz from switches (for signal gen display overlay)
// Same formula as ui_ctrl — avoids adding output port to ui_ctrl interface
wire [2:0]  sg_coarse = sw_in[7:5];
wire [15:0] sg_freq_unclamped =
    (sg_coarse == 3'd0) ? (16'd100  + {8'b0, sw_dip} * 16'd20) :
    (sg_coarse == 3'd1) ? (16'd2000 + {8'b0, sw_dip} * 16'd20) :
    (sg_coarse == 3'd2) ? (16'd4000 + {8'b0, sw_dip} * 16'd20) :
    (sg_coarse == 3'd3) ? (16'd6000 + {8'b0, sw_dip} * 16'd20) :
    (sg_coarse == 3'd4) ? (16'd8000 + {8'b0, sw_dip} * 16'd20) :
    16'd1000;
wire [15:0] freq_hz =
    (sg_freq_unclamped < 16'd100)   ? 16'd100   :
    (sg_freq_unclamped > 16'd10000) ? 16'd10000 :
    sg_freq_unclamped;

//=============================================================================
// DDS Signal Generator
//=============================================================================
wire [1:0] dds_wave_type;
assign dds_wave_type = sig_gen_submode[2] ? 2'b00 : sig_gen_submode[1:0];

wire [7:0]  dds_wave_out;
wire [23:0] dds_ftw_in;

// Modulation
wire [23:0] fm_ftw;
wire [7:0]  mod_signal_out;

modulation #(.PHASE_WIDTH(24)) u_mod (
    .clk(clk_25m), .rst_n(rst_n),
    .mod_type(mod_type),
    .mod_enable(mod_enable && (device_mode == 2'b00)),
    .base_ftw(frequency_ftw),
    .carrier_in(dds_wave_out),
    .mod_depth(mod_depth),
    .fm_ftw_out(fm_ftw),
    .signal_out(mod_signal_out)
);

assign dds_ftw_in = (mod_enable && mod_type == 2'b01) ? fm_ftw : frequency_ftw;

dds_core #(.PHASE_WIDTH(24), .LUT_ADDR_W(10), .LUT_DATA_W(8)) u_dds (
    .clk(clk_25m), .rst_n(rst_n),
    .ftw(dds_ftw_in), .wave_type(dds_wave_type),
    .wave_out(dds_wave_out)
);

// Debug
wire [7:0] dbg_dds_out   = dds_wave_out;
wire [7:0] dbg_mod_signal = mod_signal_out;

//=============================================================================
// DAC Output — Bipolar ±3.3V with RMS Amplitude Control (0–2Vrms)
//=============================================================================
// DAC0832 bipolar configuration: Vout = Vref * (D - 128) / 128
// EGO1 Vref = 3.3V (measured), full-scale output = ±3.3V (6.6Vpp).
// Digital compensation maps amplitude=255 → 2Vrms (2.828V peak for sine):
//   AMPL_CAL = round(256 * 2.90V / 3.30V) ≈ 225
//   (2.90V > 2.828V compensates for integer truncation, ensuring ≥2Vrms)
//   0x80 = 0V; amplitude=255 → ampl_eff≈223 → DAC output≈±2.83V peak
// Actual Vrms depends on waveform:
//   Sine:     max ≈ 2.00Vrms (≥ 2Vrms requirement met)
//   Square:   max ≈ 2.83Vrms (≥ 2Vrms)
//   Triangle: max ≈ 1.64Vrms (physical limit: Vrms = Vpeak/√3)

localparam DAC_VREF_MV = 3300;   // DAC reference voltage (mV, measured)
localparam DAC_VOUT_MV = 2900;   // Target peak mV (slightly > 2828 for truncation)
localparam AMPL_CAL    = (DAC_VOUT_MV * 256) / DAC_VREF_MV;  // ≈ 225

// Scale UI amplitude (0-255) by compensation factor
wire [15:0] ampl_scaled = amplitude * AMPL_CAL;
wire [7:0]  ampl_eff    = ampl_scaled[15:8];   // effective amplitude: 0 ~ 224

// Select signal source: DDS direct or modulated
wire [7:0] dac_data_raw;
assign dac_data_raw = mod_enable ? mod_signal_out : dds_wave_out;

// Bipolar amplitude scaling with saturation (prevents wraparound distortion)
// dac_data_in = saturate(128 + (dac_data_raw - 128) * ampl_eff / 256, 0, 255)
wire signed [8:0]  dac_dev   = $signed({1'b0, dac_data_raw}) - 9'sd128;
wire signed [17:0] dac_prod  = dac_dev * $signed({1'b0, ampl_eff});
// Use dac_prod[17:8] — bit 17 is the true sign bit, avoids fragile
// sign-extension that relied on bit[16]==bit[17] for limited amplitude range
wire signed [9:0]  dac_sum   = $signed(dac_prod[17:8]) + 10'sd128;
wire [7:0]         dac_data_in = dac_sum[9] ? 8'd0 :        // negative → clamp to 0
                                  dac_sum[8] ? 8'd255 :       // >255 → clamp to 255
                                               dac_sum[7:0]; // 0–255 pass through

wire dac_update;

// DAC update rate divider (25MHz / 24 ≈ 1.04MHz)
// 24-cycle period = 960ns, WR# pulse = 16 cycles (640ns), gives 320ns idle gap.
// Increased from 64 (390kHz) to reduce square-wave edge jitter and improve
// waveform fidelity. DAC0832 settling time ~1µs limits useful update rate.
reg [4:0]  dac_rate_cnt;
reg        dac_update_trig;

always @(posedge clk_25m or negedge rst_n) begin
    if (!rst_n) begin
        dac_rate_cnt <= 0;
        dac_update_trig <= 0;
    end else begin
        dac_update_trig <= 0;
        if (dac_rate_cnt == 23) begin
            dac_rate_cnt <= 0;
            dac_update_trig <= 1;
        end else begin
            dac_rate_cnt <= dac_rate_cnt + 1'b1;
        end
    end
end

assign dac_update = dac_update_trig && (device_mode == 2'b00);

dac0832_ctrl u_dac (
    .clk(clk_25m), .rst_n(rst_n),
    .dac_data_in(dac_data_in), .dac_update(dac_update),
    .dac_d(dac_d), .dac_ile(dac_ile), .dac_cs_n(dac_cs_n),
    .dac_wr1_n(dac_wr1_n), .dac_wr2_n(dac_wr2_n), .dac_xfer_n(dac_xfer_n)
);

//=============================================================================
// Signal Generator Waveform Buffer (2048-sample ring buffer)
// Captures DDS output at ~1.56MHz for stable VGA preview (1600-wide screen).
//=============================================================================
reg [7:0] sg_ram [0:2047];
reg [10:0] sg_wr_ptr;
reg [4:0]  sg_sample_div;

always @(posedge clk_25m or negedge rst_n) begin
    if (!rst_n) begin
        sg_wr_ptr     <= 11'd0;
        sg_sample_div <= 5'd0;
    end else if (device_mode == 2'b00) begin
        if (sg_sample_div == 5'd15) begin
            sg_sample_div <= 5'd0;
            sg_ram[sg_wr_ptr] <= dds_wave_out;
            sg_wr_ptr <= sg_wr_ptr + 1'b1;
        end else begin
            sg_sample_div <= sg_sample_div + 1'b1;
        end
    end else begin
        sg_sample_div <= 5'd0;
    end
end

// Ring-buffer read address: 1600-sample window ending at current write position.
// pixel_x runs at 100MHz; register it in 25MHz domain to avoid CDC glitches.
reg [10:0] pixel_x_25m;
always @(posedge clk_25m)
    pixel_x_25m <= pixel_x;

wire [10:0] sg_rd_addr = (sg_wr_ptr - 11'd1600 + pixel_x_25m);

reg [7:0] sg_rd_data;
always @(posedge clk_25m)
    sg_rd_data <= sg_ram[sg_rd_addr];

// Map 8-bit sample to Y coordinate (waveform area y=0..859, 860px height)
wire [10:0] sg_y = 11'd859 - ((sg_rd_data * 11'd860) >> 8);

//=============================================================================
// Signal Generator Parameter Text Overlay
//=============================================================================
// Text bar at y=860-899 (40 rows, 5 char-rows of 8px each)
//   Row 0: "SG F:#####Hz A:### W:XXXX"
//   Row 1: "   MOD:XX DEP:###"
//   Row 2: "   PB0/1:Amp PB2/3:Dep"
//=============================================================================
wire sg_in_bar = (pixel_y >= 11'd860);

// Character generator addressing
wire [2:0] sg_char_row  = pixel_y[2:0];
wire [2:0] sg_char_col  = pixel_x[2:0];
wire [7:0] sg_char_cx   = pixel_x[10:3];     // 0..199 (8-bit)
wire [2:0] sg_char_cy   = (pixel_y - 11'd860) >> 3;  // char row 0..4

// Frequency digits
wire [3:0] sg_f_d5 = (freq_hz / 16'd10000) % 4'd10;
wire [3:0] sg_f_d4 = (freq_hz / 16'd1000)  % 4'd10;
wire [3:0] sg_f_d3 = (freq_hz / 16'd100)   % 4'd10;
wire [3:0] sg_f_d2 = (freq_hz / 16'd10)    % 4'd10;
wire [3:0] sg_f_d1 = (freq_hz)             % 4'd10;

// Amplitude digits
wire [3:0] sg_a_d3 = (amplitude / 8'd100) % 4'd10;
wire [3:0] sg_a_d2 = (amplitude / 8'd10)  % 4'd10;
wire [3:0] sg_a_d1 = (amplitude)          % 4'd10;

// Mod depth digits
wire [3:0] sg_md_d3 = (mod_depth / 8'd100) % 4'd10;
wire [3:0] sg_md_d2 = (mod_depth / 8'd10)  % 4'd10;
wire [3:0] sg_md_d1 = (mod_depth)          % 4'd10;

function [7:0] sg_d2a;
    input [3:0] d;
    begin
        sg_d2a = {4'h3, d};
    end
endfunction

// Waveform type string
function [7:0] sg_wave_char;
    input [2:0] submode;
    begin
        case (submode[1:0])
            2'b01:   sg_wave_char = 8'h53;  // 'S' = Square
            2'b10:   sg_wave_char = 8'h54;  // 'T' = Triangle
            default: sg_wave_char = 8'h4E;  // 'N' = siNe
        endcase
    end
endfunction

// Modulation type string
function [7:0] sg_mod_char;
    input [1:0] mt;
    begin
        case (mt)
            2'b00: sg_mod_char = 8'h41;  // 'A' = AM
            2'b01: sg_mod_char = 8'h46;  // 'F' = FM
            2'b10: sg_mod_char = 8'h50;  // 'P' = SPWM
            default: sg_mod_char = 8'h20; // space
        endcase
    end
endfunction

reg [7:0] sg_char;
always @(*) begin
    sg_char = 8'h20;  // default: space
    case (sg_char_cy)
        // Row 0: "SG F:#####Hz A:### W:X"
        2'd0: begin
            case (sg_char_cx)
                7'd0:  sg_char = 8'h53;  // 'S'
                7'd1:  sg_char = 8'h47;  // 'G'
                7'd2:  sg_char = 8'h20;  // ' '
                7'd3:  sg_char = 8'h46;  // 'F'
                7'd4:  sg_char = 8'h3A;  // ':'
                7'd5:  sg_char = sg_d2a(sg_f_d5);
                7'd6:  sg_char = sg_d2a(sg_f_d4);
                7'd7:  sg_char = sg_d2a(sg_f_d3);
                7'd8:  sg_char = sg_d2a(sg_f_d2);
                7'd9:  sg_char = sg_d2a(sg_f_d1);
                7'd10: sg_char = 8'h48;  // 'H'
                7'd11: sg_char = 8'h7A;  // 'z'
                7'd12: sg_char = 8'h20;  // ' '
                7'd13: sg_char = 8'h41;  // 'A'
                7'd14: sg_char = 8'h3A;  // ':'
                7'd15: sg_char = sg_d2a(sg_a_d3);
                7'd16: sg_char = sg_d2a(sg_a_d2);
                7'd17: sg_char = sg_d2a(sg_a_d1);
                7'd18: sg_char = 8'h20;  // ' '
                7'd19: sg_char = 8'h57;  // 'W'
                7'd20: sg_char = 8'h3A;  // ':'
                7'd21: sg_char = sg_wave_char(sig_gen_submode);
                default: sg_char = 8'h20;
            endcase
        end
        // Row 1: "   MOD:X DEP:###"
        2'd1: begin
            case (sg_char_cx)
                7'd0:  sg_char = 8'h20;
                7'd1:  sg_char = 8'h20;
                7'd2:  sg_char = 8'h20;
                7'd3:  sg_char = 8'h4D;  // 'M'
                7'd4:  sg_char = 8'h4F;  // 'O'
                7'd5:  sg_char = 8'h44;  // 'D'
                7'd6:  sg_char = 8'h3A;  // ':'
                7'd7:  sg_char = mod_enable ? sg_mod_char(mod_type) : 8'h4F;  // 'O'=Off
                7'd8:  sg_char = mod_enable ? 8'h20 : 8'h46;  // 'F'
                7'd9:  sg_char = mod_enable ? 8'h20 : 8'h46;  // 'F'
                7'd10: sg_char = 8'h20;
                7'd11: sg_char = 8'h44;  // 'D'
                7'd12: sg_char = 8'h45;  // 'E'
                7'd13: sg_char = 8'h50;  // 'P'
                7'd14: sg_char = 8'h3A;  // ':'
                7'd15: sg_char = sg_d2a(sg_md_d3);
                7'd16: sg_char = sg_d2a(sg_md_d2);
                7'd17: sg_char = sg_d2a(sg_md_d1);
                default: sg_char = 8'h20;
            endcase
        end
        // Row 2: "   PB0/1:+/-A PB2/3:+/-D"
        2'd2: begin
            case (sg_char_cx)
                7'd0:  sg_char = 8'h20;
                7'd1:  sg_char = 8'h20;
                7'd2:  sg_char = 8'h20;
                7'd3:  sg_char = 8'h50;  // 'P'
                7'd4:  sg_char = 8'h42;  // 'B'
                7'd5:  sg_char = 8'h30;  // '0'
                7'd6:  sg_char = 8'h2F;  // '/'
                7'd7:  sg_char = 8'h31;  // '1'
                7'd8:  sg_char = 8'h3A;  // ':'
                7'd9:  sg_char = 8'h41;  // 'A'
                7'd10: sg_char = 8'h6D;  // 'm'
                7'd11: sg_char = 8'h70;  // 'p'
                7'd12: sg_char = 8'h20;
                7'd13: sg_char = 8'h50;  // 'P'
                7'd14: sg_char = 8'h42;  // 'B'
                7'd15: sg_char = 8'h32;  // '2'
                7'd16: sg_char = 8'h2F;  // '/'
                7'd17: sg_char = 8'h33;  // '3'
                7'd18: sg_char = 8'h3A;  // ':'
                7'd19: sg_char = 8'h44;  // 'D'
                7'd20: sg_char = 8'h65;  // 'e'
                7'd21: sg_char = 8'h70;  // 'p'
                default: sg_char = 8'h20;
            endcase
        end
        default: sg_char = 8'h20;
    endcase
end

// Char gen for signal generator overlay text
wire sg_char_on;
char_gen u_sg_char (
    .clk(clk_25m),
    .char_code(sg_char),
    .char_row(sg_char_row),
    .char_col(sg_char_col),
    .pixel_on(sg_char_on)
);

//=============================================================================
// Oscilloscope Acquisition — Inferred BRAM 2048×24, continuous XADC sequencer
//=============================================================================

wire [23:0] bram_dout;

Oscilloscope_Acq u_osc_acq (
    .clk_100m        (sys_clk),
    .rst_n           (rst_n),
    .ch1_en_n        (1'b0),         // CH1 always enabled
    .ch2_en_n        (1'b0),         // CH2 enabled
    .vauxp_ch1       (vauxp_ch1),
    .vauxn_ch1       (vauxn_ch1),
    .vauxp_ch2       (vauxp_ch2),
    .vauxn_ch2       (vauxn_ch2),
    .bram_read_addr  (display_addr),
    .bram_dout       (bram_dout)
);

//=============================================================================
// BRAM data extraction
// bram_dout[23:0] = {ch2_data_reg[11:0], ch1_data_reg[11:0]}
//   wave_ch1_12b: full 12-bit for waveform display (centered Y mapping)
//   wave_ch2_12b: full 12-bit for waveform display
//   wave_ch1_8b:  8-bit for wave_analyzer (compatibility, same as original)
//   wave_ch2_8b:  8-bit for wave_analyzer
//
// bram_dout is registered inside Oscilloscope_Acq (2-cycle read latency).
// bram_dout_25m captures at 25MHz for analyzer domain (stable CDC).
//=============================================================================

// 100MHz domain — 12-bit for display
wire [11:0] wave_ch1_12b = bram_dout[11:0];
wire [11:0] wave_ch2_12b = bram_dout[23:12];

// 25MHz domain — 8-bit for analyzer (captured from 100MHz BRAM output)
reg [23:0] bram_dout_25m;
always @(posedge clk_25m)
    bram_dout_25m <= bram_dout;

wire [7:0] wave_ch1_8b = bram_dout_25m[11:4];
wire [7:0] wave_ch2_8b = bram_dout_25m[23:16];

// Sample rate display (kSPS)
// New ADC rate: ~1,136,000 SPS per channel (continuous sequencer, dual-channel)
wire [15:0] sample_rate_disp = 16'd1136;
wire        trigger_armed    = 1'b1;   // trigger internal to Oscilloscope_Acq

// Vertical gain select: mapped from scope_timebase[1:0] for oscilloscope mode
// 00=×1, 01=×2, 10=×5, 11=×10
wire [1:0] vert_gain = scope_timebase[1:0];

//=============================================================================
// Waveform Display Readout
// display_addr = pixel_x directly (100MHz domain, both in same clock domain)
// pixel_x scans 0..1599 during active video, reading through BRAM linearly
//=============================================================================
wire        de;
wire [10:0] pixel_x, pixel_y;

wire [10:0] display_addr = pixel_x;

//=============================================================================
// VGA Controller — 1600×900@60Hz, 100MHz pixel clock
//=============================================================================
vga_ctrl u_vga (
    .clk(sys_clk), .rst_n(rst_n),
    .hsync(hsync), .vsync(vsync),
    .de(de), .pixel_x(pixel_x), .pixel_y(pixel_y)
);

//=============================================================================
// Waveform Analyzers (Frequency, Vpp, Type, RMS, Avg, Max)
//
// Calibration based on EGO1_Oscilloscope_Gen extension board:
//   Signal chain: BNC → 10kΩ + 100kΩ trimmer → MCP6002 (G=1.1×) → 74HC4053 → XADC VAUXP0
//   XADC: 12-bit 0-1V, 8-bit value uses adc[11:4] → 0-255
//   ADC LSB (8-bit) = 1V/256 = 3.90625mV at XADC input
//   CAL_MV_X1024 = round(3.90625×1024) = 4000
//
// Frequency calibration:
//   New ADC rate: ~1,136,000 SPS (continuous sequencer, 50MHz ADCCLK)
//   Analyzer sees data at 25MHz (4:1 decimation from 100MHz display scan)
//   Effective sample rate seen by analyzer: 100MHz / 4... the compression
//   factor from ADC rate to analyzer rate is ~88:1.
//   FREQ_CAL_X10 = ADC_rate / 8000 ≈ 142 (for 1,136,000 SPS)
//   Needs empirical tuning — adjust by observing known-frequency signal.
//=============================================================================
localparam FREQ_CAL_X10_CH = 142;    // frequency cal (×10): tuned for ~1.136MSPS
localparam CAL_MV_X1024_VAL = 4000;  // mV cal (×1024): 4000 → 3.90625 mV/LSB

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
    .clk(clk_25m), .rst_n(rst_n),
    .wave_data(wave_ch1_8b), .wave_valid(1'b1),
    .frequency_hz(freq_ch1), .period_x100us(period_ch1),
    .vpp(vpp_ch1), .vmin_val(vmin_ch1),
    .wave_type_det(type_ch1), .duty_cycle(duty_ch1),
    .rise_time_us(rise_time_ch1), .crest_factor_x100(crest_ch1),
    .meas_valid(meas_valid_ch1),
    .rms(rms_ch1), .avg_val(avg_ch1), .max_val(max_ch1),
    .vpp_mv(vpp_mv_ch1), .vmin_mv(vmin_mv_ch1),
    .rms_mv(rms_mv_ch1), .avg_mv(avg_mv_ch1), .max_mv(max_mv_ch1)
);

wave_analyzer #(
    .FREQ_CAL_X10(FREQ_CAL_X10_CH),
    .CAL_MV_X1024(CAL_MV_X1024_VAL)
) u_analyzer_ch2 (
    .clk(clk_25m), .rst_n(rst_n),
    .wave_data(wave_ch2_8b), .wave_valid(1'b1),
    .frequency_hz(freq_ch2), .period_x100us(period_ch2),
    .vpp(vpp_ch2), .vmin_val(vmin_ch2),
    .wave_type_det(type_ch2), .duty_cycle(duty_ch2),
    .rise_time_us(rise_time_ch2), .crest_factor_x100(crest_ch2),
    .meas_valid(meas_valid_ch2),
    .rms(rms_ch2), .avg_val(avg_ch2), .max_val(max_ch2),
    .vpp_mv(vpp_mv_ch2), .vmin_mv(vmin_mv_ch2),
    .rms_mv(rms_mv_ch2), .avg_mv(avg_mv_ch2), .max_mv(max_mv_ch2)
);

//=============================================================================
// Display Modules — all clocked at 100MHz (sys_clk = VGA pixel clock)
//=============================================================================

// 1) Oscilloscope mode (dual-channel waveform display)
wire [3:0] scope_r, scope_g, scope_b;

waveform_display u_scope_display (
    .clk(sys_clk), .de(de),
    .pixel_x(pixel_x), .pixel_y(pixel_y),
    .wave_ch1(wave_ch1_12b), .wave_ch2(wave_ch2_12b),
    .vert_gain(vert_gain),
    // CH1 metrics
    .freq_ch1(freq_ch1), .period_ch1_x100us(period_ch1),
    .vpp_ch1(vpp_ch1), .vmin_ch1(vmin_ch1), .type_ch1(type_ch1),
    .duty_ch1(duty_ch1), .rise_time_ch1(rise_time_ch1),
    .crest_ch1_x100(crest_ch1),
    .rms_ch1(rms_ch1), .avg_ch1(avg_ch1), .max_ch1(max_ch1),
    .vpp_mv_ch1(vpp_mv_ch1), .vmin_mv_ch1(vmin_mv_ch1),
    .rms_mv_ch1(rms_mv_ch1), .avg_mv_ch1(avg_mv_ch1), .max_mv_ch1(max_mv_ch1),
    // CH2 metrics
    .freq_ch2(freq_ch2), .period_ch2_x100us(period_ch2),
    .vpp_ch2(vpp_ch2), .vmin_ch2(vmin_ch2), .type_ch2(type_ch2),
    .duty_ch2(duty_ch2), .rise_time_ch2(rise_time_ch2),
    .crest_ch2_x100(crest_ch2),
    .rms_ch2(rms_ch2), .avg_ch2(avg_ch2), .max_ch2(max_ch2),
    .vpp_mv_ch2(vpp_mv_ch2), .vmin_mv_ch2(vmin_mv_ch2),
    .rms_mv_ch2(rms_mv_ch2), .avg_mv_ch2(avg_mv_ch2), .max_mv_ch2(max_mv_ch2),
    // Sample rate + trigger
    .meas_valid(meas_valid_ch1),
    .sample_rate_hz(sample_rate_disp),
    .trigger_armed(trigger_armed),
    .trigger_level(scope_trigger_level),
    .vga_r(scope_r), .vga_g(scope_g), .vga_b(scope_b)
);

// 2) Lissajous X-Y mode
wire [3:0] liss_r, liss_g, liss_b;

lissajous_display u_liss (
    .clk(sys_clk), .rst_n(rst_n), .de(de),
    .pixel_x(pixel_x), .pixel_y(pixel_y),
    .ch1_data(wave_ch1_8b), .ch2_data(wave_ch2_8b),
    .ch1_valid(1'b1), .ch2_valid(1'b1),
    .freq_ch1(freq_ch1), .freq_ch2(freq_ch2),
    .vga_r(liss_r), .vga_g(liss_g), .vga_b(liss_b)
);

// 3) Kaleidoscope mode
wire [3:0] kalei_r, kalei_g, kalei_b;

kaleidoscope u_kalei (
    .clk(sys_clk), .rst_n(rst_n), .de(de),
    .pixel_x(pixel_x), .pixel_y(pixel_y),
    .ch1_data(wave_ch1_8b), .ch2_data(wave_ch2_8b),
    .ch1_valid(1'b1), .ch2_valid(1'b1),
    .vga_r(kalei_r), .vga_g(kalei_g), .vga_b(kalei_b)
);

// 4) Signal Generator preview — waveform from ring buffer + parameter overlay
reg [3:0] sggen_r, sggen_g, sggen_b;

always @(*) begin
    sggen_r = 4'h0;
    sggen_g = 4'h0;
    sggen_b = 4'h0;

    if (de) begin
        //---- Text overlay bar (y=860..899) ----
        if (sg_in_bar) begin
            // Dark background
            sggen_r = 4'h1; sggen_g = 4'h1; sggen_b = 4'h1;

            // Separator line at top of text bar
            if (pixel_y == 860) begin
                sggen_r = 4'h8; sggen_g = 4'h8; sggen_b = 4'h8;
            end

            // Row 0 background: warm tint
            if (sg_char_cy == 2'd0) begin
                sggen_r = 4'h2; sggen_g = 4'h1; sggen_b = 4'h0;
            end
            // Row 1 background: cool tint
            if (sg_char_cy == 2'd1) begin
                sggen_r = 4'h0; sggen_g = 4'h1; sggen_b = 4'h2;
            end
            // Row 2 background: dim
            if (sg_char_cy == 2'd2) begin
                sggen_r = 4'h1; sggen_g = 4'h1; sggen_b = 4'h1;
            end

            // Character pixels — bright green for rows 0-1, dim for row 2
            if (sg_char_on) begin
                if (sg_char_cy == 2'd0) begin
                    sggen_r = 4'hF; sggen_g = 4'hF; sggen_b = 4'h0;  // yellow
                end else if (sg_char_cy == 2'd1) begin
                    sggen_r = 4'h0; sggen_g = 4'hF; sggen_b = 4'hF;  // cyan
                end else begin
                    sggen_r = 4'h8; sggen_g = 4'h8; sggen_b = 4'h8;  // gray
                end
            end
        end
        //---- Waveform Area (y=0..859) ----
        else begin
            // Grid — 10×10 divisions (160×86 pixels each)
            if ((pixel_x % 160) == 0 || (pixel_y % 86) == 0) begin
                sggen_r = 4'h2; sggen_g = 4'h2; sggen_b = 4'h2;
            end
            // Center cross
            if (pixel_x == 800 || pixel_y == 430) begin
                sggen_r = 4'h4; sggen_g = 4'h4; sggen_b = 4'h4;
            end
            // Waveform trace from RAM buffer — 3-pixel wide green line
            if (pixel_y >= ((sg_y > 1) ? sg_y - 1 : 0) &&
                pixel_y <= ((sg_y < 858) ? sg_y + 1 : 859)) begin
                sggen_r = 4'h0; sggen_g = 4'hF; sggen_b = 4'h0;
            end
        end
    end
end

//=============================================================================
// Mode MUX — select which display drives VGA
//=============================================================================
assign vga_r = (device_mode == 2'b00) ? sggen_r :
               (device_mode == 2'b10) ? liss_r   :
               (device_mode == 2'b11) ? kalei_r  : scope_r;

assign vga_g = (device_mode == 2'b00) ? sggen_g :
               (device_mode == 2'b10) ? liss_g   :
               (device_mode == 2'b11) ? kalei_g  : scope_g;

assign vga_b = (device_mode == 2'b00) ? sggen_b :
               (device_mode == 2'b10) ? liss_b   :
               (device_mode == 2'b11) ? kalei_b  : scope_b;

//=============================================================================
// Status LEDs & Loopback
//=============================================================================
assign led_speed[0] = (device_mode == 2'b00);   // Sig Gen
assign led_speed[1] = (device_mode == 2'b01);   // Scope
assign led_speed[2] = (device_mode == 2'b10 || device_mode == 2'b11);  // XY modes

// Loopback: echo rx to tx for self-test
assign loop_tx = {loop_rx[3:1], 1'b0};

//=============================================================================
// Analog Switch Control — dual-channel, scope mode
// 74HC4053 enables are active-low
//=============================================================================
assign ch1_switch_en_n = ~(device_mode == 2'b01 || device_mode == 2'b10 || device_mode == 2'b11);
assign ch2_switch_en_n = ~(device_mode == 2'b01 || device_mode == 2'b10 || device_mode == 2'b11);
assign sg_en_n         = ~(device_mode == 2'b00);
assign sg_out_sel      = 1'b0;
assign ch1_range_sel   = 1'b0;         // 1x range
assign ch1_acdc_sel    = 1'b0;         // DC coupling (default; AC via software control)
assign ch2_range_sel   = 1'b0;
assign ch2_acdc_sel    = 1'b0;

//=============================================================================
// ILA Debug — disabled
//=============================================================================

endmodule
