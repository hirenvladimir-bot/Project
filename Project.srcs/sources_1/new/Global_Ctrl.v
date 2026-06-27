`timescale 1ns / 1ps

module Global_Ctrl (
    input  wire        clk,
    input  wire        rst_n,

    input  wire        btn_center,
    input  wire        btn_left,
    input  wire        btn_right,
    input  wire        btn_up,
    input  wire        btn_down,
    input  wire        sw0_r1,
    input  wire        sw1_n4,
    input  wire        sw3_r2,

    output wire [1:0]  work_mode,
    output reg  [31:0] fcw,
    output reg  [1:0]  wave_sel,
    output reg  [7:0]  amp_ctrl,
    output reg  [7:0]  duty_ctrl,
    output reg  [1:0]  param_focus,
    output reg  [1:0]  step_idx,
    output wire [1:0]  disp_wave_sel,
    output wire [3:0]  disp_freq_thousands,
    output wire [3:0]  disp_freq_hundreds,
    output wire [3:0]  disp_freq_tens,
    output wire [3:0]  disp_freq_ones,
    output wire [3:0]  disp_duty_tens,
    output wire [3:0]  disp_duty_ones,
    output wire [3:0]  disp_amp_ones,
    output wire [3:0]  disp_amp_tenths,

    output wire        sg_en_n,
    output wire        sg_out_sel,
    output wire        ch1_en_n,
    output wire        ch2_en_n,
    output reg         ch1_range_sel,
    output reg         ch1_acdc_sel,
    output reg         ch2_range_sel,
    output reg         ch2_acdc_sel
);

    localparam MODE_OSC = 2'b00;
    localparam MODE_SIG = 2'b01;

    localparam ROW_WAVE = 2'd0;
    localparam ROW_FREQ = 2'd1;
    localparam ROW_DUTY = 2'd2;
    localparam ROW_AMP  = 2'd3;

    wire pulse_center;
    wire pulse_left;
    wire pulse_right;
    wire pulse_up;
    wire pulse_down;

    Key_Debounce u_db_center (.clk(clk), .rst_n(rst_n), .key_in(btn_center), .pulse_out(pulse_center));
    Key_Debounce u_db_left   (.clk(clk), .rst_n(rst_n), .key_in(btn_left),   .pulse_out(pulse_left));
    Key_Debounce u_db_right  (.clk(clk), .rst_n(rst_n), .key_in(btn_right),  .pulse_out(pulse_right));
    Key_Debounce u_db_up     (.clk(clk), .rst_n(rst_n), .key_in(btn_up),     .pulse_out(pulse_up));
    Key_Debounce u_db_down   (.clk(clk), .rst_n(rst_n), .key_in(btn_down),   .pulse_out(pulse_down));

    assign work_mode = sw3_r2 ? MODE_SIG : MODE_OSC;

    assign ch1_en_n = sw3_r2 ? 1'b1 : 1'b0;
    assign ch2_en_n = sw3_r2 ? 1'b1 : 1'b0;
    assign sg_en_n  = sw3_r2 ? 1'b0 : 1'b1;

    assign sg_out_sel = (wave_sel == 2'd2);

    reg sw3_d1;
    wire mode_changed = (sw3_d1 != sw3_r2);

    reg [1:0] shadow_wave;
    reg [3:0] freq_thousands;
    reg [3:0] freq_hundreds;
    reg [3:0] freq_tens;
    reg [3:0] freq_ones;
    reg [3:0] duty_tens;
    reg [3:0] duty_ones;
    reg [3:0] amp_ones;
    reg [3:0] amp_tenths;

    assign disp_wave_sel        = shadow_wave;
    assign disp_freq_thousands  = freq_thousands;
    assign disp_freq_hundreds   = freq_hundreds;
    assign disp_freq_tens       = freq_tens;
    assign disp_freq_ones       = freq_ones;
    assign disp_duty_tens       = duty_tens;
    assign disp_duty_ones       = duty_ones;
    assign disp_amp_ones        = amp_ones;
    assign disp_amp_tenths      = amp_tenths;

    wire [13:0] shadow_freq_hz =
        (freq_thousands * 14'd1000) +
        (freq_hundreds  * 14'd100)  +
        (freq_tens      * 14'd10)   +
         freq_ones;

    wire [7:0] shadow_duty_percent = (duty_tens * 8'd10) + duty_ones;
    wire [7:0] shadow_amp_tenths   = (amp_ones * 8'd10) + amp_tenths;

    function [31:0] hz_to_fcw;
        input [13:0] hz;
        reg [45:0] scaled;
        begin
            // Calibrated from hardware: previous coefficient made output about 2.5x high.
            // 2^32 / 100MHz / 2.5 = 17.179869184, stored as 171799 / 10000.
            scaled = hz * 32'd171799;
            hz_to_fcw = (scaled + 46'd5000) / 32'd10000;
        end
    endfunction

    function [7:0] amp_to_ctrl;
        input [7:0] amp_tenths_in;
        reg [15:0] scaled;
        begin
            scaled = amp_tenths_in * 8'd255;
            amp_to_ctrl = scaled / 8'd100;
        end
    endfunction

    function [1:0] next_row;
        input [1:0] row;
        input [1:0] wave;
        begin
            case (row)
                ROW_WAVE: next_row = ROW_FREQ;
                ROW_FREQ: next_row = (wave == 2'd2) ? ROW_DUTY : ROW_AMP;
                ROW_DUTY: next_row = ROW_AMP;
                default:  next_row = ROW_WAVE;
            endcase
        end
    endfunction

    function [1:0] prev_row;
        input [1:0] row;
        input [1:0] wave;
        begin
            case (row)
                ROW_WAVE: prev_row = ROW_AMP;
                ROW_FREQ: prev_row = ROW_WAVE;
                ROW_DUTY: prev_row = ROW_FREQ;
                default:  prev_row = (wave == 2'd2) ? ROW_DUTY : ROW_FREQ;
            endcase
        end
    endfunction

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sw3_d1         <= 1'b0;
            param_focus    <= ROW_WAVE;
            step_idx       <= 2'd0;

            shadow_wave    <= 2'd0;
            freq_thousands <= 4'd0;
            freq_hundreds  <= 4'd1;
            freq_tens      <= 4'd0;
            freq_ones      <= 4'd0;
            duty_tens      <= 4'd5;
            duty_ones      <= 4'd0;
            amp_ones       <= 4'd5;
            amp_tenths     <= 4'd0;

            fcw            <= hz_to_fcw(14'd100);
            wave_sel       <= 2'd0;
            amp_ctrl       <= amp_to_ctrl(8'd50);
            duty_ctrl      <= 8'd50;

            ch1_range_sel  <= 1'b0;
            ch1_acdc_sel   <= 1'b0;
            ch2_range_sel  <= 1'b0;
            ch2_acdc_sel   <= 1'b0;
        end else begin
            sw3_d1 <= sw3_r2;

            if (mode_changed) begin
                param_focus <= ROW_WAVE;
                step_idx    <= 2'd0;
            end else if (!sw3_r2) begin
                if (!sw0_r1 && pulse_up) begin
                    ch1_range_sel <= ~ch1_range_sel;
                end
                if (!sw1_n4 && pulse_down) begin
                    ch2_range_sel <= ~ch2_range_sel;
                end
                if (pulse_left) begin
                    ch1_acdc_sel <= ~ch1_acdc_sel;
                end
                if (pulse_right) begin
                    ch2_acdc_sel <= ~ch2_acdc_sel;
                end
            end else begin
                if (pulse_left) begin
                    if (step_idx == 2'd0) begin
                        param_focus <= prev_row(param_focus, shadow_wave);
                        step_idx <= (prev_row(param_focus, shadow_wave) == ROW_FREQ) ? 2'd3 :
                                    (prev_row(param_focus, shadow_wave) == ROW_WAVE) ? 2'd2 : 2'd1;
                    end else begin
                        step_idx <= step_idx - 1'b1;
                    end
                end

                if (pulse_right) begin
                    case (param_focus)
                        ROW_WAVE: begin
                            if (step_idx >= 2'd2) begin
                                param_focus <= ROW_FREQ;
                                step_idx <= 2'd0;
                            end else begin
                                step_idx <= step_idx + 1'b1;
                            end
                        end
                        ROW_FREQ: begin
                            if (step_idx >= 2'd3) begin
                                param_focus <= (shadow_wave == 2'd2) ? ROW_DUTY : ROW_AMP;
                                step_idx <= 2'd0;
                            end else begin
                                step_idx <= step_idx + 1'b1;
                            end
                        end
                        ROW_DUTY: begin
                            if (step_idx >= 2'd1) begin
                                param_focus <= ROW_AMP;
                                step_idx <= 2'd0;
                            end else begin
                                step_idx <= step_idx + 1'b1;
                            end
                        end
                        default: begin
                            if (step_idx >= 2'd1) begin
                                param_focus <= ROW_WAVE;
                                step_idx <= 2'd0;
                            end else begin
                                step_idx <= step_idx + 1'b1;
                            end
                        end
                    endcase
                end

                if (pulse_up) begin
                    case (param_focus)
                        ROW_WAVE: begin
                            param_focus <= prev_row(param_focus, shadow_wave);
                            step_idx <= 2'd0;
                        end
                        ROW_FREQ: begin
                            case (step_idx)
                                2'd0: freq_thousands <= (freq_thousands == 4'd9) ? 4'd0 : freq_thousands + 1'b1;
                                2'd1: freq_hundreds  <= (freq_hundreds  == 4'd9) ? 4'd0 : freq_hundreds  + 1'b1;
                                2'd2: freq_tens      <= (freq_tens      == 4'd9) ? 4'd0 : freq_tens      + 1'b1;
                                default: freq_ones   <= (freq_ones      == 4'd9) ? 4'd0 : freq_ones      + 1'b1;
                            endcase
                        end
                        ROW_DUTY: begin
                            if (step_idx == 2'd0) begin
                                duty_tens <= (duty_tens == 4'd9) ? 4'd0 : duty_tens + 1'b1;
                            end else begin
                                duty_ones <= (duty_ones == 4'd9) ? 4'd0 : duty_ones + 1'b1;
                            end
                        end
                        default: begin
                            if (step_idx == 2'd0) begin
                                amp_ones <= (amp_ones == 4'd10) ? 4'd0 : amp_ones + 1'b1;
                                if (amp_ones == 4'd9) begin
                                    amp_tenths <= 4'd0;
                                end
                            end else if (amp_ones != 4'd10) begin
                                amp_tenths <= (amp_tenths == 4'd9) ? 4'd0 : amp_tenths + 1'b1;
                            end
                        end
                    endcase
                end

                if (pulse_down) begin
                    case (param_focus)
                        ROW_WAVE: begin
                            param_focus <= next_row(param_focus, shadow_wave);
                            step_idx <= 2'd0;
                        end
                        ROW_FREQ: begin
                            case (step_idx)
                                2'd0: freq_thousands <= (freq_thousands == 4'd0) ? 4'd9 : freq_thousands - 1'b1;
                                2'd1: freq_hundreds  <= (freq_hundreds  == 4'd0) ? 4'd9 : freq_hundreds  - 1'b1;
                                2'd2: freq_tens      <= (freq_tens      == 4'd0) ? 4'd9 : freq_tens      - 1'b1;
                                default: freq_ones   <= (freq_ones      == 4'd0) ? 4'd9 : freq_ones      - 1'b1;
                            endcase
                        end
                        ROW_DUTY: begin
                            if (step_idx == 2'd0) begin
                                duty_tens <= (duty_tens == 4'd0) ? 4'd9 : duty_tens - 1'b1;
                            end else begin
                                duty_ones <= (duty_ones == 4'd0) ? 4'd9 : duty_ones - 1'b1;
                            end
                        end
                        default: begin
                            if (step_idx == 2'd0) begin
                                amp_ones <= (amp_ones == 4'd0) ? 4'd10 : amp_ones - 1'b1;
                                if (amp_ones == 4'd10) begin
                                    amp_tenths <= 4'd9;
                                end
                            end else if (amp_ones != 4'd10) begin
                                amp_tenths <= (amp_tenths == 4'd0) ? 4'd9 : amp_tenths - 1'b1;
                            end
                        end
                    endcase
                end

                if (param_focus == ROW_WAVE) begin
                    shadow_wave <= step_idx;
                end

                if (shadow_wave != 2'd2 && param_focus == ROW_DUTY) begin
                    param_focus <= ROW_AMP;
                    step_idx <= 2'd0;
                end

                if (pulse_center) begin
                    fcw       <= hz_to_fcw((shadow_freq_hz > 14'd10000) ? 14'd10000 : shadow_freq_hz);
                    wave_sel  <= shadow_wave;
                    duty_ctrl <= (shadow_duty_percent > 8'd99) ? 8'd99 : shadow_duty_percent;
                    amp_ctrl  <= amp_to_ctrl((shadow_amp_tenths > 8'd100) ? 8'd100 : shadow_amp_tenths);
                end
            end
        end
    end

endmodule

module Key_Debounce(
    input  wire clk,
    input  wire rst_n,
    input  wire key_in,
    output reg  pulse_out
);
    localparam CNT_MAX = 21'd2_000_000;

    reg [20:0] delay_cnt;
    reg key_sync1;
    reg key_sync2;
    reg key_stable;
    reg key_stable_d1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            key_sync1 <= 1'b0;
            key_sync2 <= 1'b0;
            delay_cnt <= 21'd0;
            key_stable <= 1'b0;
            key_stable_d1 <= 1'b0;
            pulse_out <= 1'b0;
        end else begin
            key_sync1 <= key_in;
            key_sync2 <= key_sync1;

            if (key_sync2 != key_stable) begin
                if (delay_cnt == CNT_MAX - 1'b1) begin
                    key_stable <= key_sync2;
                    delay_cnt <= 21'd0;
                end else begin
                    delay_cnt <= delay_cnt + 1'b1;
                end
            end else begin
                delay_cnt <= 21'd0;
            end

            key_stable_d1 <= key_stable;
            pulse_out <= ~key_stable_d1 & key_stable;
        end
    end
endmodule
