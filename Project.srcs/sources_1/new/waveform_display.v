`timescale 1ns / 1ps
//=============================================================================
// Waveform Display Module — Laboratory Oscilloscope Style
// Dual-channel display with professional graticule, traces, and metrics.
//
// Screen layout: 640×480
//   Waveform area: y=0..431 (432 rows — 8 vertical divisions × 54 pixels each)
//   Metrics bar:   y=432..479 (48 rows — 6 character rows of 8px each)
//
// Grid: 8×10 divisions (80×54 pixel cells) with center crosshair
//
// Y MAPPING FIX (referencing Wave_Data_Mapper):
//   Original:  Y = BOTTOM - (adc * HEIGHT) >> 8    → 0V at bottom
//   Fixed:     Y = CENTER - ((adc - offset) * HEIGHT) >> 8
//   With offset=128 (midscale), 0.5V → center, full 0-1V fills screen.
//   Offset controlled by trigger_level input.
//=============================================================================

module waveform_display
(
    input  wire          clk,
    input  wire          de,
    input  wire [9:0]    pixel_x,
    input  wire [9:0]    pixel_y,

    // Waveform RAM data
    input  wire [7:0]    wave_ch1,
    input  wire [7:0]    wave_ch2,

    // ---- Metrics from wave_analyzer ----
    // CH1
    input  wire [15:0]   freq_ch1,
    input  wire [15:0]   period_ch1_x100us,
    input  wire [7:0]    vpp_ch1,
    input  wire [7:0]    vmin_ch1,
    input  wire [2:0]    type_ch1,
    input  wire [6:0]    duty_ch1,
    input  wire [7:0]    rise_time_ch1,
    input  wire [10:0]   crest_ch1_x100,
    input  wire [7:0]    rms_ch1,
    input  wire [7:0]    avg_ch1,
    input  wire [7:0]    max_ch1,
    input  wire [15:0]   vpp_mv_ch1,
    input  wire [15:0]   vmin_mv_ch1,
    input  wire [15:0]   rms_mv_ch1,
    input  wire [15:0]   avg_mv_ch1,
    input  wire [15:0]   max_mv_ch1,

    // CH2
    input  wire [15:0]   freq_ch2,
    input  wire [15:0]   period_ch2_x100us,
    input  wire [7:0]    vpp_ch2,
    input  wire [7:0]    vmin_ch2,
    input  wire [2:0]    type_ch2,
    input  wire [6:0]    duty_ch2,
    input  wire [7:0]    rise_time_ch2,
    input  wire [10:0]   crest_ch2_x100,
    input  wire [7:0]    rms_ch2,
    input  wire [7:0]    avg_ch2,
    input  wire [7:0]    max_ch2,
    input  wire [15:0]   vpp_mv_ch2,
    input  wire [15:0]   vmin_mv_ch2,
    input  wire [15:0]   rms_mv_ch2,
    input  wire [15:0]   avg_mv_ch2,
    input  wire [15:0]   max_mv_ch2,

    input  wire          meas_valid,

    // Sample rate + trigger (trigger_level reused as vertical offset in scope)
    input  wire [15:0]   sample_rate_hz,
    input  wire          trigger_armed,
    input  wire [7:0]    trigger_level,

    // VGA output
    output reg  [3:0]    vga_r,
    output reg  [3:0]    vga_g,
    output reg  [3:0]    vga_b
);

    //=========================================================================
    // Grid parameters — 8×10 divisions
    // Waveform area: 640×432 (y=0..431). V_div=54px, H_div=80px.
    // Center: (320, 216)
    //=========================================================================
    localparam WAVEFORM_TOP    = 10'd0;
    localparam WAVEFORM_BOTTOM = 10'd431;
    localparam WAVEFORM_HEIGHT = 10'd432;  // 0..431 inclusive
    localparam CENTER_X = 10'd320;
    localparam CENTER_Y = 10'd216;

    localparam H_DIV = 10'd80;   // pixels per horizontal division
    localparam V_DIV = 10'd54;   // pixels per vertical division (432/8=54)

    //=========================================================================
    // ADC value -> Y coordinate
    //
    // Reference Wave_Data_Mapper approach:
    //   ch1_target_y = 240 - adc_value   (centers waveform in its area)
    //
    // Our approach:
    //   Use trigger_level as vertical offset (default 128 = midscale).
    //   With offset=128: adc=128 → Y=216 (center), adc=0 → Y=431 (bottom),
    //   adc=255 → Y=1 (top). Full 0-1V fills full screen.
    //   For DC 0V signal: set offset=0 to see it at bottom,
    //   or offset=128 to center it (as if AC coupled).
    //=========================================================================
    wire [7:0] vert_offset = trigger_level;   // reuse trigger_level as position

    // Compute signed offset from midscale, then scale by height
    wire signed [9:0] ch1_centered = $signed({2'b0, wave_ch1}) - $signed({2'b0, vert_offset});
    wire signed [9:0] ch2_centered = $signed({2'b0, wave_ch2}) - $signed({2'b0, vert_offset});

    // Y = CENTER - (centered * HEIGHT / 256)
    // offset=128, adc=0:   centered=-128, Y=216-(-128*432/256)=216+216=432→bottom
    // offset=128, adc=128: centered=0,    Y=216
    // offset=128, adc=255: centered=127,  Y=216-(127*432/256)=216-214=2→top
    wire signed [19:0] ch1_scaled = ch1_centered * $signed({10'b0, WAVEFORM_HEIGHT});
    wire signed [19:0] ch2_scaled = ch2_centered * $signed({10'b0, WAVEFORM_HEIGHT});

    wire signed [10:0] ch1_offset = $signed({1'b0, CENTER_Y}) - $signed(ch1_scaled[19:8]);
    wire signed [10:0] ch2_offset = $signed({1'b0, CENTER_Y}) - $signed(ch2_scaled[19:8]);

    // Clamp to waveform area
    wire [9:0] wave_y_ch1 = ch1_offset[10] ? 10'd0 :
                             (ch1_offset > 10'd431) ? 10'd431 : ch1_offset[9:0];
    wire [9:0] wave_y_ch2 = ch2_offset[10] ? 10'd0 :
                             (ch2_offset > 10'd431) ? 10'd431 : ch2_offset[9:0];

    //=========================================================================
    // Grid & Graticule — Professional oscilloscope style
    //=========================================================================
    wire major_grid_x = ((pixel_x % H_DIV) == 0);
    wire major_grid_y = ((pixel_y % V_DIV) == 0) && (pixel_y < WAVEFORM_HEIGHT);

    wire minor_grid_x = ((pixel_x % 20) == 0);
    wire minor_grid_y = ((pixel_y % 13) == 0) && (pixel_y < WAVEFORM_HEIGHT);

    wire center_line_x = (pixel_y == CENTER_Y) && (pixel_y < WAVEFORM_HEIGHT);
    wire center_line_y = (pixel_x == CENTER_X);

    //=========================================================================
    // Waveform hit detection (3-pixel wide traces, clamped to waveform area)
    //=========================================================================
    wire hit_ch1 = (pixel_y >= ((wave_y_ch1 > 1) ? wave_y_ch1 - 1 : 0)) &&
                   (pixel_y <= ((wave_y_ch1 < (WAVEFORM_BOTTOM - 1)) ? wave_y_ch1 + 1 : WAVEFORM_BOTTOM));
    wire hit_ch2 = (pixel_y >= ((wave_y_ch2 > 1) ? wave_y_ch2 - 1 : 0)) &&
                   (pixel_y <= ((wave_y_ch2 < (WAVEFORM_BOTTOM - 1)) ? wave_y_ch2 + 1 : WAVEFORM_BOTTOM));

    wire clip_ch1_high = (wave_ch1 >= 8'd252) && hit_ch1;
    wire clip_ch1_low  = (wave_ch1 <= 8'd3)   && hit_ch1;
    wire clip_ch2_high = (wave_ch2 >= 8'd252) && hit_ch2;
    wire clip_ch2_low  = (wave_ch2 <= 8'd3)   && hit_ch2;

    //=========================================================================
    // Metrics Bar Area (y=432..479, 48 rows = 6 char rows)
    //=========================================================================
    wire in_metrics_bar = (pixel_y >= 432);

    //=========================================================================
    // Character Generator addressing
    //=========================================================================
    wire [2:0] char_col = pixel_x[2:0];
    wire [2:0] char_row = pixel_y[2:0];
    wire [6:0] char_cell_x = pixel_x[9:3];
    wire [2:0] char_cell_y = in_metrics_bar ? ((pixel_y - 10'd432) >> 3) : 3'd0;

    // Pipeline registers — break the long combinational path through the
    // metrics_char mux + char_gen font ROM to meet 25MHz pixel clock timing.
    // char_col/char_row are delayed one cycle to align with registered char_code.
    reg [2:0]  char_col_d1;
    reg [2:0]  char_row_d1;
    reg [7:0]  metrics_char;

    always @(posedge clk) begin
        char_col_d1 <= char_col;
        char_row_d1 <= char_row;
    end

    //=========================================================================
    // Helper: BCD digit to ASCII
    //=========================================================================
    function [7:0] digit_to_ascii;
        input [3:0] digit;
        begin
            digit_to_ascii = {4'h3, digit};
        end
    endfunction

    //=========================================================================
    // Waveform type display string — 5 characters
    //=========================================================================
    function [39:0] type_string;
        input [2:0] t;
        begin
            case (t)
                3'b001:  type_string = {8'h53, 8'h51, 8'h55, 8'h41, 8'h52}; // "SQUAR"
                3'b010:  type_string = {8'h54, 8'h52, 8'h49, 8'h20, 8'h20}; // "TRI  "
                3'b011:  type_string = {8'h53, 8'h41, 8'h57, 8'h20, 8'h20}; // "SAW  "
                3'b100:  type_string = {8'h44, 8'h43, 8'h20, 8'h20, 8'h20}; // "DC   "
                3'b101:  type_string = {8'h4E, 8'h4F, 8'h49, 8'h53, 8'h45}; // "NOISE"
                default: type_string = {8'h53, 8'h49, 8'h4E, 8'h45, 8'h20}; // "SINE "
            endcase
        end
    endfunction

    function [7:0] type_byte;
        input [39:0] str;
        input [2:0]  idx;
        begin
            case (idx)
                3'd0: type_byte = str[39:32];
                3'd1: type_byte = str[31:24];
                3'd2: type_byte = str[23:16];
                3'd3: type_byte = str[15:8];
                3'd4: type_byte = str[7:0];
            endcase
        end
    endfunction

    wire [39:0] type_str_ch1 = type_string(type_ch1);
    wire [39:0] type_str_ch2 = type_string(type_ch2);

    //=========================================================================
    // Extract decimal digits from frequency (16-bit, 0-65535)
    //=========================================================================
    wire [3:0] f1_d5 = (freq_ch1 / 16'd10000) % 4'd10;
    wire [3:0] f1_d4 = (freq_ch1 / 16'd1000)  % 4'd10;
    wire [3:0] f1_d3 = (freq_ch1 / 16'd100)   % 4'd10;
    wire [3:0] f1_d2 = (freq_ch1 / 16'd10)    % 4'd10;
    wire [3:0] f1_d1 = (freq_ch1)             % 4'd10;

    wire [3:0] f2_d5 = (freq_ch2 / 16'd10000) % 4'd10;
    wire [3:0] f2_d4 = (freq_ch2 / 16'd1000)  % 4'd10;
    wire [3:0] f2_d3 = (freq_ch2 / 16'd100)   % 4'd10;
    wire [3:0] f2_d2 = (freq_ch2 / 16'd10)    % 4'd10;
    wire [3:0] f2_d1 = (freq_ch2)             % 4'd10;

    wire [3:0] p1_d4 = (period_ch1_x100us / 16'd1000) % 4'd10;
    wire [3:0] p1_d3 = (period_ch1_x100us / 16'd100)  % 4'd10;
    wire [3:0] p1_d2 = (period_ch1_x100us / 16'd10)   % 4'd10;
    wire [3:0] p1_d1 = (period_ch1_x100us)            % 4'd10;

    wire [3:0] p2_d4 = (period_ch2_x100us / 16'd1000) % 4'd10;
    wire [3:0] p2_d3 = (period_ch2_x100us / 16'd100)  % 4'd10;
    wire [3:0] p2_d2 = (period_ch2_x100us / 16'd10)   % 4'd10;
    wire [3:0] p2_d1 = (period_ch2_x100us)            % 4'd10;

    wire [3:0] vpp1_d4 = (vpp_mv_ch1 / 16'd1000) % 4'd10;
    wire [3:0] vpp1_d3 = (vpp_mv_ch1 / 16'd100)  % 4'd10;
    wire [3:0] vpp1_d2 = (vpp_mv_ch1 / 16'd10)   % 4'd10;
    wire [3:0] vpp1_d1 = (vpp_mv_ch1)            % 4'd10;

    wire [3:0] vpp2_d4 = (vpp_mv_ch2 / 16'd1000) % 4'd10;
    wire [3:0] vpp2_d3 = (vpp_mv_ch2 / 16'd100)  % 4'd10;
    wire [3:0] vpp2_d2 = (vpp_mv_ch2 / 16'd10)   % 4'd10;
    wire [3:0] vpp2_d1 = (vpp_mv_ch2)            % 4'd10;

    wire [3:0] d1_d3 = (duty_ch1 / 7'd100) % 4'd10;
    wire [3:0] d1_d2 = (duty_ch1 / 7'd10)  % 4'd10;
    wire [3:0] d1_d1 = (duty_ch1)          % 4'd10;

    wire [3:0] d2_d3 = (duty_ch2 / 7'd100) % 4'd10;
    wire [3:0] d2_d2 = (duty_ch2 / 7'd10)  % 4'd10;
    wire [3:0] d2_d1 = (duty_ch2)          % 4'd10;

    wire [3:0] rms1_d3 = (rms_mv_ch1 / 16'd100) % 4'd10;
    wire [3:0] rms1_d2 = (rms_mv_ch1 / 16'd10)  % 4'd10;
    wire [3:0] rms1_d1 = (rms_mv_ch1)           % 4'd10;

    wire [3:0] rms2_d3 = (rms_mv_ch2 / 16'd100) % 4'd10;
    wire [3:0] rms2_d2 = (rms_mv_ch2 / 16'd10)  % 4'd10;
    wire [3:0] rms2_d1 = (rms_mv_ch2)           % 4'd10;

    wire [3:0] avg1_d3 = (avg_mv_ch1 / 16'd100) % 4'd10;
    wire [3:0] avg1_d2 = (avg_mv_ch1 / 16'd10)  % 4'd10;
    wire [3:0] avg1_d1 = (avg_mv_ch1)           % 4'd10;

    wire [3:0] avg2_d3 = (avg_mv_ch2 / 16'd100) % 4'd10;
    wire [3:0] avg2_d2 = (avg_mv_ch2 / 16'd10)  % 4'd10;
    wire [3:0] avg2_d1 = (avg_mv_ch2)           % 4'd10;

    wire [3:0] max1_d3 = (max_mv_ch1 / 16'd100) % 4'd10;
    wire [3:0] max1_d2 = (max_mv_ch1 / 16'd10)  % 4'd10;
    wire [3:0] max1_d1 = (max_mv_ch1)           % 4'd10;

    wire [3:0] max2_d3 = (max_mv_ch2 / 16'd100) % 4'd10;
    wire [3:0] max2_d2 = (max_mv_ch2 / 16'd10)  % 4'd10;
    wire [3:0] max2_d1 = (max_mv_ch2)           % 4'd10;

    wire [3:0] vmin1_d3 = (vmin_mv_ch1 / 16'd100) % 4'd10;
    wire [3:0] vmin1_d2 = (vmin_mv_ch1 / 16'd10)  % 4'd10;
    wire [3:0] vmin1_d1 = (vmin_mv_ch1)           % 4'd10;

    wire [3:0] vmin2_d3 = (vmin_mv_ch2 / 16'd100) % 4'd10;
    wire [3:0] vmin2_d2 = (vmin_mv_ch2 / 16'd10)  % 4'd10;
    wire [3:0] vmin2_d1 = (vmin_mv_ch2)           % 4'd10;

    wire [3:0] cf1_d4 = (crest_ch1_x100 / 11'd1000) % 4'd10;
    wire [3:0] cf1_d3 = (crest_ch1_x100 / 11'd100)  % 4'd10;
    wire [3:0] cf1_d2 = (crest_ch1_x100 / 11'd10)   % 4'd10;
    wire [3:0] cf1_d1 = (crest_ch1_x100)            % 4'd10;

    wire [3:0] cf2_d4 = (crest_ch2_x100 / 11'd1000) % 4'd10;
    wire [3:0] cf2_d3 = (crest_ch2_x100 / 11'd100)  % 4'd10;
    wire [3:0] cf2_d2 = (crest_ch2_x100 / 11'd10)   % 4'd10;
    wire [3:0] cf2_d1 = (crest_ch2_x100)            % 4'd10;

    wire [3:0] rt1_d3 = (rise_time_ch1 / 8'd100) % 4'd10;
    wire [3:0] rt1_d2 = (rise_time_ch1 / 8'd10)  % 4'd10;
    wire [3:0] rt1_d1 = (rise_time_ch1)          % 4'd10;

    wire [3:0] rt2_d3 = (rise_time_ch2 / 8'd100) % 4'd10;
    wire [3:0] rt2_d2 = (rise_time_ch2 / 8'd10)  % 4'd10;
    wire [3:0] rt2_d1 = (rise_time_ch2)          % 4'd10;

    wire [3:0] srate_d5 = (sample_rate_hz / 16'd10000) % 4'd10;
    wire [3:0] srate_d4 = (sample_rate_hz / 16'd1000)  % 4'd10;
    wire [3:0] srate_d3 = (sample_rate_hz / 16'd100)   % 4'd10;
    wire [3:0] srate_d2 = (sample_rate_hz / 16'd10)    % 4'd10;
    wire [3:0] srate_d1 = (sample_rate_hz)             % 4'd10;

    wire [15:0] trigger_mv = (({8'b0, trigger_level} * 16'd4000) + 16'd512) >> 10;
    wire [3:0]  trig_d3 = (trigger_mv / 16'd100) % 4'd10;
    wire [3:0]  trig_d2 = (trigger_mv / 16'd10)  % 4'd10;
    wire [3:0]  trig_d1 = (trigger_mv)           % 4'd10;

    //=========================================================================
    // Character selection mux
    //=========================================================================
    reg [7:0] metrics_char_comb;

    always @(*) begin
        metrics_char_comb = 8'h20;
        case (char_cell_y)
            3'd0: begin
                case (char_cell_x)
                    7'd0:  metrics_char_comb = 8'h43; 7'd1:  metrics_char_comb = 8'h48;
                    7'd2:  metrics_char_comb = 8'h31; 7'd3:  metrics_char_comb = 8'h20;
                    7'd4:  metrics_char_comb = 8'h46; 7'd5:  metrics_char_comb = 8'h3A;
                    7'd6:  metrics_char_comb = digit_to_ascii(f1_d5);
                    7'd7:  metrics_char_comb = digit_to_ascii(f1_d4);
                    7'd8:  metrics_char_comb = digit_to_ascii(f1_d3);
                    7'd9:  metrics_char_comb = digit_to_ascii(f1_d2);
                    7'd10: metrics_char_comb = digit_to_ascii(f1_d1);
                    7'd11: metrics_char_comb = 8'h48; 7'd12: metrics_char_comb = 8'h7A;
                    7'd13: metrics_char_comb = 8'h20; 7'd14: metrics_char_comb = 8'h54;
                    7'd15: metrics_char_comb = 8'h3A;
                    7'd16: metrics_char_comb = digit_to_ascii(p1_d4);
                    7'd17: metrics_char_comb = digit_to_ascii(p1_d3);
                    7'd18: metrics_char_comb = digit_to_ascii(p1_d2);
                    7'd19: metrics_char_comb = digit_to_ascii(p1_d1);
                    7'd20: metrics_char_comb = 8'h75; 7'd21: metrics_char_comb = 8'h73;
                    7'd22: metrics_char_comb = 8'h20; 7'd23: metrics_char_comb = 8'h56;
                    7'd24: metrics_char_comb = digit_to_ascii(vpp1_d4);
                    7'd25: metrics_char_comb = digit_to_ascii(vpp1_d3);
                    7'd26: metrics_char_comb = digit_to_ascii(vpp1_d2);
                    7'd27: metrics_char_comb = digit_to_ascii(vpp1_d1);
                    7'd28: metrics_char_comb = 8'h6D; 7'd29: metrics_char_comb = 8'h56;
                    7'd30: metrics_char_comb = 8'h20; 7'd31: metrics_char_comb = 8'h44;
                    7'd32: metrics_char_comb = 8'h3A;
                    7'd33: metrics_char_comb = digit_to_ascii(d1_d3);
                    7'd34: metrics_char_comb = digit_to_ascii(d1_d2);
                    7'd35: metrics_char_comb = digit_to_ascii(d1_d1);
                    7'd36: metrics_char_comb = 8'h25; 7'd37: metrics_char_comb = 8'h20;
                    7'd38: metrics_char_comb = 8'h57; 7'd39: metrics_char_comb = 8'h3A;
                    7'd40: metrics_char_comb = type_byte(type_str_ch1, 3'd0);
                    7'd41: metrics_char_comb = type_byte(type_str_ch1, 3'd1);
                    7'd42: metrics_char_comb = type_byte(type_str_ch1, 3'd2);
                    7'd43: metrics_char_comb = type_byte(type_str_ch1, 3'd3);
                    7'd44: metrics_char_comb = type_byte(type_str_ch1, 3'd4);
                    default: metrics_char_comb = 8'h20;
                endcase
            end
            3'd1: begin
                case (char_cell_x)
                    7'd0:  metrics_char_comb = 8'h20; 7'd1:  metrics_char_comb = 8'h20;
                    7'd2:  metrics_char_comb = 8'h20; 7'd3:  metrics_char_comb = 8'h20;
                    7'd4:  metrics_char_comb = 8'h56; 7'd5:  metrics_char_comb = 8'h72;
                    7'd6:  metrics_char_comb = 8'h6D; 7'd7:  metrics_char_comb = 8'h73;
                    7'd8:  metrics_char_comb = 8'h3A;
                    7'd9:  metrics_char_comb = digit_to_ascii(rms1_d3);
                    7'd10: metrics_char_comb = digit_to_ascii(rms1_d2);
                    7'd11: metrics_char_comb = digit_to_ascii(rms1_d1);
                    7'd12: metrics_char_comb = 8'h20; 7'd13: metrics_char_comb = 8'h56;
                    7'd14: metrics_char_comb = 8'h61; 7'd15: metrics_char_comb = 8'h76;
                    7'd16: metrics_char_comb = 8'h67; 7'd17: metrics_char_comb = 8'h3A;
                    7'd18: metrics_char_comb = digit_to_ascii(avg1_d3);
                    7'd19: metrics_char_comb = digit_to_ascii(avg1_d2);
                    7'd20: metrics_char_comb = digit_to_ascii(avg1_d1);
                    7'd21: metrics_char_comb = 8'h20; 7'd22: metrics_char_comb = 8'h56;
                    7'd23: metrics_char_comb = 8'h6D; 7'd24: metrics_char_comb = 8'h61;
                    7'd25: metrics_char_comb = 8'h78; 7'd26: metrics_char_comb = 8'h3A;
                    7'd27: metrics_char_comb = digit_to_ascii(max1_d3);
                    7'd28: metrics_char_comb = digit_to_ascii(max1_d2);
                    7'd29: metrics_char_comb = digit_to_ascii(max1_d1);
                    7'd30: metrics_char_comb = 8'h20; 7'd31: metrics_char_comb = 8'h56;
                    7'd32: metrics_char_comb = 8'h6D; 7'd33: metrics_char_comb = 8'h69;
                    7'd34: metrics_char_comb = 8'h6E; 7'd35: metrics_char_comb = 8'h3A;
                    7'd36: metrics_char_comb = digit_to_ascii(vmin1_d3);
                    7'd37: metrics_char_comb = digit_to_ascii(vmin1_d2);
                    7'd38: metrics_char_comb = digit_to_ascii(vmin1_d1);
                    7'd39: metrics_char_comb = 8'h6D; 7'd40: metrics_char_comb = 8'h56;
                    default: metrics_char_comb = 8'h20;
                endcase
            end
            3'd2: begin
                case (char_cell_x)
                    7'd0:  metrics_char_comb = 8'h43; 7'd1:  metrics_char_comb = 8'h48;
                    7'd2:  metrics_char_comb = 8'h32; 7'd3:  metrics_char_comb = 8'h20;
                    7'd4:  metrics_char_comb = 8'h46; 7'd5:  metrics_char_comb = 8'h3A;
                    7'd6:  metrics_char_comb = digit_to_ascii(f2_d5);
                    7'd7:  metrics_char_comb = digit_to_ascii(f2_d4);
                    7'd8:  metrics_char_comb = digit_to_ascii(f2_d3);
                    7'd9:  metrics_char_comb = digit_to_ascii(f2_d2);
                    7'd10: metrics_char_comb = digit_to_ascii(f2_d1);
                    7'd11: metrics_char_comb = 8'h48; 7'd12: metrics_char_comb = 8'h7A;
                    7'd13: metrics_char_comb = 8'h20; 7'd14: metrics_char_comb = 8'h54;
                    7'd15: metrics_char_comb = 8'h3A;
                    7'd16: metrics_char_comb = digit_to_ascii(p2_d4);
                    7'd17: metrics_char_comb = digit_to_ascii(p2_d3);
                    7'd18: metrics_char_comb = digit_to_ascii(p2_d2);
                    7'd19: metrics_char_comb = digit_to_ascii(p2_d1);
                    7'd20: metrics_char_comb = 8'h75; 7'd21: metrics_char_comb = 8'h73;
                    7'd22: metrics_char_comb = 8'h20; 7'd23: metrics_char_comb = 8'h56;
                    7'd24: metrics_char_comb = digit_to_ascii(vpp2_d4);
                    7'd25: metrics_char_comb = digit_to_ascii(vpp2_d3);
                    7'd26: metrics_char_comb = digit_to_ascii(vpp2_d2);
                    7'd27: metrics_char_comb = digit_to_ascii(vpp2_d1);
                    7'd28: metrics_char_comb = 8'h6D; 7'd29: metrics_char_comb = 8'h56;
                    7'd30: metrics_char_comb = 8'h20; 7'd31: metrics_char_comb = 8'h44;
                    7'd32: metrics_char_comb = 8'h3A;
                    7'd33: metrics_char_comb = digit_to_ascii(d2_d3);
                    7'd34: metrics_char_comb = digit_to_ascii(d2_d2);
                    7'd35: metrics_char_comb = digit_to_ascii(d2_d1);
                    7'd36: metrics_char_comb = 8'h25; 7'd37: metrics_char_comb = 8'h20;
                    7'd38: metrics_char_comb = 8'h57; 7'd39: metrics_char_comb = 8'h3A;
                    7'd40: metrics_char_comb = type_byte(type_str_ch2, 3'd0);
                    7'd41: metrics_char_comb = type_byte(type_str_ch2, 3'd1);
                    7'd42: metrics_char_comb = type_byte(type_str_ch2, 3'd2);
                    7'd43: metrics_char_comb = type_byte(type_str_ch2, 3'd3);
                    7'd44: metrics_char_comb = type_byte(type_str_ch2, 3'd4);
                    default: metrics_char_comb = 8'h20;
                endcase
            end
            3'd3: begin
                case (char_cell_x)
                    7'd0:  metrics_char_comb = 8'h20; 7'd1:  metrics_char_comb = 8'h20;
                    7'd2:  metrics_char_comb = 8'h20; 7'd3:  metrics_char_comb = 8'h20;
                    7'd4:  metrics_char_comb = 8'h56; 7'd5:  metrics_char_comb = 8'h72;
                    7'd6:  metrics_char_comb = 8'h6D; 7'd7:  metrics_char_comb = 8'h73;
                    7'd8:  metrics_char_comb = 8'h3A;
                    7'd9:  metrics_char_comb = digit_to_ascii(rms2_d3);
                    7'd10: metrics_char_comb = digit_to_ascii(rms2_d2);
                    7'd11: metrics_char_comb = digit_to_ascii(rms2_d1);
                    7'd12: metrics_char_comb = 8'h20; 7'd13: metrics_char_comb = 8'h56;
                    7'd14: metrics_char_comb = 8'h61; 7'd15: metrics_char_comb = 8'h76;
                    7'd16: metrics_char_comb = 8'h67; 7'd17: metrics_char_comb = 8'h3A;
                    7'd18: metrics_char_comb = digit_to_ascii(avg2_d3);
                    7'd19: metrics_char_comb = digit_to_ascii(avg2_d2);
                    7'd20: metrics_char_comb = digit_to_ascii(avg2_d1);
                    7'd21: metrics_char_comb = 8'h20; 7'd22: metrics_char_comb = 8'h56;
                    7'd23: metrics_char_comb = 8'h6D; 7'd24: metrics_char_comb = 8'h61;
                    7'd25: metrics_char_comb = 8'h78; 7'd26: metrics_char_comb = 8'h3A;
                    7'd27: metrics_char_comb = digit_to_ascii(max2_d3);
                    7'd28: metrics_char_comb = digit_to_ascii(max2_d2);
                    7'd29: metrics_char_comb = digit_to_ascii(max2_d1);
                    7'd30: metrics_char_comb = 8'h20; 7'd31: metrics_char_comb = 8'h56;
                    7'd32: metrics_char_comb = 8'h6D; 7'd33: metrics_char_comb = 8'h69;
                    7'd34: metrics_char_comb = 8'h6E; 7'd35: metrics_char_comb = 8'h3A;
                    7'd36: metrics_char_comb = digit_to_ascii(vmin2_d3);
                    7'd37: metrics_char_comb = digit_to_ascii(vmin2_d2);
                    7'd38: metrics_char_comb = digit_to_ascii(vmin2_d1);
                    7'd39: metrics_char_comb = 8'h6D; 7'd40: metrics_char_comb = 8'h56;
                    default: metrics_char_comb = 8'h20;
                endcase
            end
            3'd4: begin
                case (char_cell_x)
                    7'd0:  metrics_char_comb = 8'h43; 7'd1:  metrics_char_comb = 8'h46;
                    7'd2:  metrics_char_comb = 8'h31; 7'd3:  metrics_char_comb = 8'h3A;
                    7'd4:  metrics_char_comb = digit_to_ascii(cf1_d4);
                    7'd5:  metrics_char_comb = digit_to_ascii(cf1_d3);
                    7'd6:  metrics_char_comb = digit_to_ascii(cf1_d2);
                    7'd7:  metrics_char_comb = 8'h2E; 7'd8:  metrics_char_comb = digit_to_ascii(cf1_d1);
                    7'd9:  metrics_char_comb = 8'h20; 7'd10: metrics_char_comb = 8'h43;
                    7'd11: metrics_char_comb = 8'h46; 7'd12: metrics_char_comb = 8'h32;
                    7'd13: metrics_char_comb = 8'h3A;
                    7'd14: metrics_char_comb = digit_to_ascii(cf2_d4);
                    7'd15: metrics_char_comb = digit_to_ascii(cf2_d3);
                    7'd16: metrics_char_comb = digit_to_ascii(cf2_d2);
                    7'd17: metrics_char_comb = 8'h2E; 7'd18: metrics_char_comb = digit_to_ascii(cf2_d1);
                    7'd19: metrics_char_comb = 8'h20; 7'd20: metrics_char_comb = 8'h52;
                    7'd21: metrics_char_comb = 8'h54; 7'd22: metrics_char_comb = 8'h31;
                    7'd23: metrics_char_comb = 8'h3A;
                    7'd24: metrics_char_comb = digit_to_ascii(rt1_d3);
                    7'd25: metrics_char_comb = digit_to_ascii(rt1_d2);
                    7'd26: metrics_char_comb = digit_to_ascii(rt1_d1);
                    7'd27: metrics_char_comb = 8'h20; 7'd28: metrics_char_comb = 8'h52;
                    7'd29: metrics_char_comb = 8'h54; 7'd30: metrics_char_comb = 8'h32;
                    7'd31: metrics_char_comb = 8'h3A;
                    7'd32: metrics_char_comb = digit_to_ascii(rt2_d3);
                    7'd33: metrics_char_comb = digit_to_ascii(rt2_d2);
                    7'd34: metrics_char_comb = digit_to_ascii(rt2_d1);
                    7'd35: metrics_char_comb = 8'h75; 7'd36: metrics_char_comb = 8'h73;
                    default: metrics_char_comb = 8'h20;
                endcase
            end
            3'd5: begin
                case (char_cell_x)
                    7'd0:  metrics_char_comb = 8'h41; 7'd1:  metrics_char_comb = 8'h44;
                    7'd2:  metrics_char_comb = 8'h43; 7'd3:  metrics_char_comb = 8'h3A;
                    7'd4:  metrics_char_comb = digit_to_ascii(srate_d5);
                    7'd5:  metrics_char_comb = digit_to_ascii(srate_d4);
                    7'd6:  metrics_char_comb = digit_to_ascii(srate_d3);
                    7'd7:  metrics_char_comb = digit_to_ascii(srate_d2);
                    7'd8:  metrics_char_comb = digit_to_ascii(srate_d1);
                    7'd9:  metrics_char_comb = 8'h6B; 7'd10: metrics_char_comb = 8'h53;
                    7'd11: metrics_char_comb = 8'h2F; 7'd12: metrics_char_comb = 8'h73;
                    7'd13: metrics_char_comb = 8'h20; 7'd14: metrics_char_comb = 8'h54;
                    7'd15: metrics_char_comb = 8'h52; 7'd16: metrics_char_comb = 8'h47;
                    7'd17: metrics_char_comb = 8'h3A;
                    7'd18: metrics_char_comb = digit_to_ascii(trig_d3);
                    7'd19: metrics_char_comb = digit_to_ascii(trig_d2);
                    7'd20: metrics_char_comb = digit_to_ascii(trig_d1);
                    7'd21: metrics_char_comb = 8'h6D; 7'd22: metrics_char_comb = 8'h56;
                    7'd23: metrics_char_comb = 8'h20; 7'd24: metrics_char_comb = 8'h53;
                    7'd25: metrics_char_comb = 8'h54; 7'd26: metrics_char_comb = 8'h41;
                    7'd27: metrics_char_comb = 8'h3A;
                    7'd28: metrics_char_comb = trigger_armed ? 8'h41 : 8'h57;
                    7'd29: metrics_char_comb = trigger_armed ? 8'h52 : 8'h41;
                    7'd30: metrics_char_comb = trigger_armed ? 8'h4D : 8'h49;
                    7'd31: metrics_char_comb = trigger_armed ? 8'h45 : 8'h54;
                    7'd32: metrics_char_comb = 8'h44;
                    default: metrics_char_comb = 8'h20;
                endcase
            end
            default: metrics_char_comb = 8'h20;
        endcase
    end

    // Pipeline register — clock metrics_char_comb into metrics_char
    // to break the long combinational path: char_cell mux → font ROM
    always @(posedge clk) begin
        metrics_char <= metrics_char_comb;
    end

    //=========================================================================
    // Char gen instance — uses delayed col/row to align with pipelined char_code
    //=========================================================================
    wire char_pixel_on;

    char_gen u_char_gen (
        .clk(clk),
        .char_code(metrics_char),
        .char_row(char_row_d1),
        .char_col(char_col_d1),
        .pixel_on(char_pixel_on)
    );

    //=========================================================================
    // Main Display Output
    //=========================================================================
    always @(*) begin
        vga_r = 4'h0;
        vga_g = 4'h0;
        vga_b = 4'h0;

        if (de) begin
            if (in_metrics_bar) begin
                vga_r = 4'h1; vga_g = 4'h1; vga_b = 4'h1;
                if (pixel_y == 432) begin
                    vga_r = 4'h8; vga_g = 4'h8; vga_b = 4'h8;
                end
                if (char_cell_y == 3'd0) begin
                    vga_r = 4'h2; vga_g = 4'h2; vga_b = 4'h0;
                end
                if (char_cell_y == 3'd1) begin
                    vga_r = 4'h1; vga_g = 4'h1; vga_b = 4'h0;
                end
                if (char_cell_y == 3'd2) begin
                    vga_r = 4'h0; vga_g = 4'h1; vga_b = 4'h2;
                end
                if (char_cell_y == 3'd3) begin
                    vga_r = 4'h0; vga_g = 4'h1; vga_b = 4'h1;
                end
                if (char_cell_y == 3'd4) begin
                    vga_r = 4'h1; vga_g = 4'h0; vga_b = 4'h1;
                end
                if (char_cell_y == 3'd5) begin
                    vga_r = 4'h1; vga_g = 4'h2; vga_b = 4'h0;
                end
                if (pixel_y == 448) begin
                    vga_r = 4'h4; vga_g = 4'h4; vga_b = 4'h4;
                end
                if (pixel_y == 464) begin
                    vga_r = 4'h3; vga_g = 4'h3; vga_b = 4'h3;
                end
                if (char_pixel_on) begin
                    if (char_cell_y <= 3'd1) begin
                        vga_r = 4'hF; vga_g = 4'hF; vga_b = 4'h0;
                    end else if (char_cell_y <= 3'd3) begin
                        vga_r = 4'h0; vga_g = 4'hF; vga_b = 4'hF;
                    end else if (char_cell_y == 3'd4) begin
                        vga_r = 4'hF; vga_g = 4'h8; vga_b = 4'hF;
                    end else begin
                        vga_r = 4'h0; vga_g = 4'hF; vga_b = 4'h0;
                    end
                end
            end
            else begin
                if (major_grid_x) begin
                    vga_r = 4'h1; vga_g = 4'h2; vga_b = 4'h1;
                end
                if (major_grid_y) begin
                    vga_r = 4'h1; vga_g = 4'h2; vga_b = 4'h1;
                end
                if ((pixel_x % 10) == 0 && (pixel_y % 9) == 0 && !major_grid_x && !major_grid_y) begin
                    vga_r = 4'h1; vga_g = 4'h1; vga_b = 4'h0;
                end
                if (center_line_x) begin
                    vga_r = 4'h3; vga_g = 4'h4; vga_b = 4'h3;
                end
                if (center_line_y) begin
                    vga_r = 4'h3; vga_g = 4'h4; vga_b = 4'h3;
                end
                if (center_line_x && center_line_y) begin
                    vga_r = 4'h4; vga_g = 4'h6; vga_b = 4'h4;
                end
                if (hit_ch1) begin
                    vga_r = 4'hF; vga_g = 4'hF; vga_b = 4'h0;
                end
                if (hit_ch2) begin
                    vga_r = 4'h0; vga_g = 4'h6; vga_b = 4'hF;
                end
                if (hit_ch1 && hit_ch2) begin
                    vga_r = 4'hF; vga_g = 4'hF; vga_b = 4'hF;
                end
                if ((clip_ch1_high || clip_ch1_low) && !hit_ch2) begin
                    vga_r = 4'hF; vga_g = 4'h2; vga_b = 4'h0;
                end
                if ((clip_ch2_high || clip_ch2_low) && !hit_ch1) begin
                    vga_r = 4'hF; vga_g = 4'h2; vga_b = 4'h4;
                end
            end
        end
    end

endmodule
