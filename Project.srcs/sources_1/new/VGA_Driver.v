`timescale 1ns / 1ps

module VGA_Driver (
    input  wire        clk_vga,        // 25MHz VGA像素时钟
    input  wire        rst_n,          // 全局复位

    // ---------------- 来自全局状态机 Global_Ctrl 的交互总线 ----------------
    input  wire [1:0]  work_mode,      // 00=纯示波器, 01=纯信号源, 10=双工模式
    input  wire [1:0]  param_focus,    // 00=频率, 01=步长, 10=波形, 11=幅度
    input  wire [1:0]  step_idx,       // 00=1Hz, 01=10Hz, 10=100Hz, 11=1kHz
    input  wire [1:0]  wave_sel,       // 00=正弦, 01=三角, 10=方波
    input  wire [7:0]  amp_ctrl,       // 调幅系数 (0~255)
    input  wire [7:0]  duty_ctrl,
    input  wire [1:0]  disp_wave_sel,
    input  wire [3:0]  disp_freq_thousands,
    input  wire [3:0]  disp_freq_hundreds,
    input  wire [3:0]  disp_freq_tens,
    input  wire [3:0]  disp_freq_ones,
    input  wire [3:0]  disp_duty_tens,
    input  wire [3:0]  disp_duty_ones,
    input  wire [3:0]  disp_amp_ones,
    input  wire [3:0]  disp_amp_tenths,
    input  wire        display_mode,   // 来自SW2: 0=双波形, 1=李萨如

    // ---------------- 来自 Wave_Data_Mapper 的波形坐标 ----------------
    input  wire [9:0]  ch1_target_y,       
    input  wire [9:0]  ch2_target_y,       
    input  wire [9:0]  lissajous_target_x, 
    input  wire [9:0]  lissajous_target_y, 

    // ---------------- 输出给 VGA 物理管脚 (EGO1 4-bit RGB) ----------------
    output reg         vga_hs,         
    output reg         vga_vs,         
    output reg  [3:0]  vga_r,          
    output reg  [3:0]  vga_g,          
    output reg  [3:0]  vga_b,          

    // ---------------- 输出给 Mapper 的当前扫描行场坐标 ----------------
    output wire [9:0]  hcount_out,
    output wire [9:0]  vcount_out
);

    // =========================================================================
    // 1. 标准 VGA 640x480@60Hz 时序发生器
    // =========================================================================
    localparam H_SYNC   = 10'd96;  localparam H_BACK   = 10'd48;  
    localparam H_ACTIVE = 10'd640; localparam H_FRONT  = 10'd16;  
    localparam H_TOTAL  = 10'd800;

    localparam V_SYNC   = 10'd2;   localparam V_BACK   = 10'd33;  
    localparam V_ACTIVE = 10'd480; localparam V_FRONT  = 10'd10;  
    localparam V_TOTAL  = 10'd525;

    reg [9:0] h_cnt; reg [9:0] v_cnt;
    always @(posedge clk_vga or negedge rst_n) begin
        if (!rst_n) begin h_cnt <= 10'd0; v_cnt <= 10'd0; end
        else if (h_cnt == H_TOTAL - 1) begin
            h_cnt <= 10'd0;
            if (v_cnt == V_TOTAL - 1) v_cnt <= 10'd0;
            else v_cnt <= v_cnt + 1'b1;
        end else h_cnt <= h_cnt + 1'b1;
    end

    always @(posedge clk_vga or negedge rst_n) begin
        if (!rst_n) begin vga_hs <= 1'b1; vga_vs <= 1'b1; end
        else begin vga_hs <= ~(h_cnt < H_SYNC); vga_vs <= ~(v_cnt < V_SYNC); end
    end

    wire video_active = (h_cnt >= (H_SYNC + H_BACK)) && (h_cnt < (H_SYNC + H_BACK + H_ACTIVE)) &&
                        (v_cnt >= (V_SYNC + V_BACK)) && (v_cnt < (V_SYNC + V_BACK + V_ACTIVE));
    wire [9:0] pixel_x = h_cnt - (H_SYNC + H_BACK);
    wire [9:0] pixel_y = v_cnt - (V_SYNC + V_BACK);

    assign hcount_out = pixel_x;
    assign vcount_out = pixel_y;

    // =========================================================================
    // 2. 纯发波模式 (MODE_SIG) 专属：硬件控制面板绘制逻辑
    // =========================================================================
    // 建立一个位于屏幕中央的波形监视框：X[120~520], Y[60~260] (400x200)
    wire sig_box_border = (pixel_x == 10'd120 || pixel_x == 10'd520 || pixel_y == 10'd60 || pixel_y == 10'd260);
    wire sig_box_interior = (pixel_x > 10'd120 && pixel_x < 10'd520 && pixel_y > 10'd60 && pixel_y < 10'd260);

    // 计算内部相对坐标
    wire [9:0] rel_x = pixel_x - 10'd120; // 0 ~ 399
    wire [9:0] rel_y = pixel_y - 10'd60;  // 0 ~ 199

    reg panel_wave_pixel;
    always @(*) begin
        panel_wave_pixel = 1'b0;
        if (sig_box_interior) begin
            case(wave_sel)
                2'b00: begin // 正弦波代数描点 (利用周期性质画简易波形)
                    if (rel_y == 10'd100 + (rel_x[6] ? -10'd40 : 10'd40)) panel_wave_pixel = 1'b1; 
                end
                2'b01: begin // 三角波描点
                    if (rel_x < 10'd200) begin
                        if (rel_y == 10'd150 - (rel_x[8:1])) panel_wave_pixel = 1'b1;
                    end else begin
                        if (rel_y == 10'd50 + ((rel_x - 10'd200) >> 1)) panel_wave_pixel = 1'b1;
                    end
                end
                2'b10: begin // 方波描点
                    if (rel_x == 10'd0 || rel_x == 10'd200 || rel_x == 10'd399) begin
                        if (rel_y >= 10'd50 && rel_y <= 10'd150) panel_wave_pixel = 1'b1;
                    end
                    if ((rel_x < 10'd200 && rel_y == 10'd50) || (rel_x >= 10'd200 && rel_y == 10'd150)) begin
                        panel_wave_pixel = 1'b1;
                    end
                end
                default: panel_wave_pixel = 1'b0;
            endcase
        end
    end

    // ---------------- 菜单项区域定义与光标高亮框 ----------------
    // 菜单总区域：X[120~520], Y[290~430]
    // 焦点 0 (频率)：Y[300~320] | 焦点 1 (步长)：Y[330~350] | 焦点 2 (波形)：Y[360~380] | 焦点 3 (幅度)：Y[390~410]
    wire focus_box_0 = (param_focus == 2'd0) && (pixel_x >= 10'd130 && pixel_x <= 10'd510) && (pixel_y >= 10'd300 && pixel_y <= 10'd320);
    wire focus_box_1 = (param_focus == 2'd1) && (pixel_x >= 10'd130 && pixel_x <= 10'd510) && (pixel_y >= 10'd330 && pixel_y <= 10'd350);
    wire focus_box_2 = (param_focus == 2'd2) && (pixel_x >= 10'd130 && pixel_x <= 10'd510) && (pixel_y >= 10'd360 && pixel_y <= 10'd380);
    wire focus_box_3 = (param_focus == 2'd3) && (pixel_x >= 10'd130 && pixel_x <= 10'd510) && (pixel_y >= 10'd390 && pixel_y <= 10'd410);
    
    wire any_focus_border = (focus_box_0 && (pixel_x == 10'd130 || pixel_x == 10'd510 || pixel_y == 10'd300 || pixel_y == 10'd320)) ||
                            (focus_box_1 && (pixel_x == 10'd130 || pixel_x == 10'd510 || pixel_y == 10'd330 || pixel_y == 10'd350)) ||
                            (focus_box_2 && (pixel_x == 10'd130 || pixel_x == 10'd510 || pixel_y == 10'd360 || pixel_y == 10'd380)) ||
                            (focus_box_3 && (pixel_x == 10'd130 || pixel_x == 10'd510 || pixel_y == 10'd390 || pixel_y == 10'd410));

    // ---------------- 步长指示块绘制 ----------------
    // 根据 step_idx 在特定位置绘制一个指示方块
    wire [9:0] step_block_left = 10'd200 + {5'd0, step_idx, 3'd0}; // 根据档位向右平移
    wire step_indicator = (pixel_y >= 10'd334 && pixel_y <= 10'd346) && (pixel_x >= step_block_left && pixel_x <= step_block_left + 10'd20);

    // ---------------- 幅度进度条条绘制 ----------------
    // 根据 amp_ctrl (0~255) 动态控制进度条长度
    wire [9:0] amp_bar_width = {2'b00, amp_ctrl}; // 将 255 转化为像素宽度
    wire amp_bar_pixel = (pixel_y >= 10'd395 && pixel_y <= 10'd405) && (pixel_x >= 10'd200 && pixel_x <= 10'd200 + amp_bar_width);

    // =========================================================================
    // 3. 动态多模式颜色混合渲染矩阵
    // =========================================================================
    // 色彩系统

    // ---------------- Text overlay for signal-generator mode ----------------
    localparam TXT_X       = 10'd145;
    localparam TXT_TITLE_Y = 10'd272;
    localparam TXT_WAVE_Y  = 10'd302;
    localparam TXT_FREQ_Y  = 10'd332;
    localparam TXT_DUTY_Y  = 10'd362;
    localparam TXT_AMP_Y   = 10'd392;

    reg        sig_text_line;
    reg [2:0]  sig_text_row;
    reg [9:0]  sig_text_y0;

    always @(*) begin
        sig_text_line = 1'b0;
        sig_text_row  = 3'd0;
        sig_text_y0   = TXT_TITLE_Y;
        if (pixel_y >= TXT_TITLE_Y && pixel_y < TXT_TITLE_Y + 10'd16) begin
            sig_text_line = 1'b1;
            sig_text_row  = 3'd0;
            sig_text_y0   = TXT_TITLE_Y;
        end else if (pixel_y >= TXT_WAVE_Y && pixel_y < TXT_WAVE_Y + 10'd16) begin
            sig_text_line = 1'b1;
            sig_text_row  = 3'd1;
            sig_text_y0   = TXT_WAVE_Y;
        end else if (pixel_y >= TXT_FREQ_Y && pixel_y < TXT_FREQ_Y + 10'd16) begin
            sig_text_line = 1'b1;
            sig_text_row  = 3'd2;
            sig_text_y0   = TXT_FREQ_Y;
        end else if (pixel_y >= TXT_DUTY_Y && pixel_y < TXT_DUTY_Y + 10'd16) begin
            sig_text_line = 1'b1;
            sig_text_row  = 3'd3;
            sig_text_y0   = TXT_DUTY_Y;
        end else if (pixel_y >= TXT_AMP_Y && pixel_y < TXT_AMP_Y + 10'd16) begin
            sig_text_line = 1'b1;
            sig_text_row  = 3'd4;
            sig_text_y0   = TXT_AMP_Y;
        end
    end

    wire        sig_text_x_area = (pixel_x >= TXT_X) && (pixel_x < TXT_X + 10'd360);
    wire [9:0]  sig_text_rel_x  = pixel_x - TXT_X;
    wire [5:0]  sig_text_col    = sig_text_rel_x / 10'd12;
    wire [9:0]  sig_text_cell_x = sig_text_rel_x - (sig_text_col * 10'd12);
    wire [3:0]  sig_text_cell_y = pixel_y - sig_text_y0;
    wire [2:0]  sig_font_col    = sig_text_cell_x[3:1];
    wire [2:0]  sig_font_row    = sig_text_cell_y[3:1];
    wire [7:0]  sig_text_char_code;
    wire [4:0]  sig_font_bits;

    function [7:0] bcd_char;
        input [3:0] value;
        begin
            bcd_char = 8'h30 + {4'd0, (value > 4'd9 ? 4'd9 : value)};
        end
    endfunction

    function [7:0] sig_text_char;
        input [2:0] row;
        input [5:0] col;
        begin
            sig_text_char = 8'h20;
            case (row)
                3'd0: begin
                    case (col)
                        6'd0: sig_text_char = 8'h53; 6'd1: sig_text_char = 8'h49;
                        6'd2: sig_text_char = 8'h47; 6'd3: sig_text_char = 8'h4E;
                        6'd4: sig_text_char = 8'h41; 6'd5: sig_text_char = 8'h4C;
                        6'd7: sig_text_char = 8'h47; 6'd8: sig_text_char = 8'h45;
                        6'd9: sig_text_char = 8'h4E;
                        default: sig_text_char = 8'h20;
                    endcase
                end
                3'd1: begin
                    case (col)
                        6'd0: sig_text_char = 8'h57; 6'd1: sig_text_char = 8'h41;
                        6'd2: sig_text_char = 8'h56; 6'd3: sig_text_char = 8'h45;
                        6'd4: sig_text_char = 8'h3A;
                        6'd6: sig_text_char = (disp_wave_sel == 2'd1) ? 8'h54 : 8'h53;
                        6'd7: sig_text_char = (disp_wave_sel == 2'd0) ? 8'h49 : ((disp_wave_sel == 2'd1) ? 8'h52 : 8'h51);
                        6'd8: sig_text_char = (disp_wave_sel == 2'd0) ? 8'h4E : ((disp_wave_sel == 2'd1) ? 8'h49 : 8'h52);
                        default: sig_text_char = 8'h20;
                    endcase
                end
                3'd2: begin
                    case (col)
                        6'd0: sig_text_char = 8'h46; 6'd1: sig_text_char = 8'h52;
                        6'd2: sig_text_char = 8'h45; 6'd3: sig_text_char = 8'h51;
                        6'd4: sig_text_char = 8'h3A;
                        6'd6: sig_text_char = bcd_char(disp_freq_thousands);
                        6'd7: sig_text_char = bcd_char(disp_freq_hundreds);
                        6'd8: sig_text_char = bcd_char(disp_freq_tens);
                        6'd9: sig_text_char = bcd_char(disp_freq_ones);
                        6'd11: sig_text_char = 8'h48; 6'd12: sig_text_char = 8'h5A;
                        default: sig_text_char = 8'h20;
                    endcase
                end
                3'd3: begin
                    case (col)
                        6'd0: sig_text_char = 8'h44; 6'd1: sig_text_char = 8'h55;
                        6'd2: sig_text_char = 8'h54; 6'd3: sig_text_char = 8'h59;
                        6'd4: sig_text_char = 8'h3A;
                        6'd6: sig_text_char = bcd_char(disp_duty_tens);
                        6'd7: sig_text_char = bcd_char(disp_duty_ones);
                        6'd9: sig_text_char = 8'h25;
                        default: sig_text_char = 8'h20;
                    endcase
                end
                default: begin
                    case (col)
                        6'd0: sig_text_char = 8'h41; 6'd1: sig_text_char = 8'h4D;
                        6'd2: sig_text_char = 8'h50; 6'd3: sig_text_char = 8'h3A;
                        6'd5: sig_text_char = (disp_amp_ones == 4'd10) ? 8'h31 : 8'h30;
                        6'd6: sig_text_char = (disp_amp_ones == 4'd10) ? 8'h30 : bcd_char(disp_amp_ones);
                        6'd7: sig_text_char = 8'h2E;
                        6'd8: sig_text_char = (disp_amp_ones == 4'd10) ? 8'h30 : bcd_char(disp_amp_tenths);
                        6'd9: sig_text_char = 8'h2F; 6'd10: sig_text_char = 8'h31;
                        6'd11: sig_text_char = 8'h30;
                        default: sig_text_char = 8'h20;
                    endcase
                end
            endcase
        end
    endfunction

    function [4:0] font5x7;
        input [7:0] ch;
        input [2:0] row;
        begin
            font5x7 = 5'b00000;
            case (ch)
                8'h20: font5x7 = 5'b00000;
                8'h25: case (row) 3'd0: font5x7=5'b11001; 3'd1: font5x7=5'b11010; 3'd2: font5x7=5'b00100; 3'd3: font5x7=5'b01000; 3'd4: font5x7=5'b10110; 3'd5: font5x7=5'b00110; default: font5x7=5'b00000; endcase
                8'h2E: if (row == 3'd6) font5x7 = 5'b01100;
                8'h2F: case (row) 3'd0: font5x7=5'b00001; 3'd1: font5x7=5'b00010; 3'd2: font5x7=5'b00100; 3'd3: font5x7=5'b01000; 3'd4: font5x7=5'b10000; default: font5x7=5'b00000; endcase
                8'h3A: case (row) 3'd1: font5x7=5'b01100; 3'd5: font5x7=5'b01100; default: font5x7=5'b00000; endcase
                8'h30: case (row) 3'd0: font5x7=5'b01110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10011; 3'd3: font5x7=5'b10101; 3'd4: font5x7=5'b11001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b01110; default: font5x7=5'b00000; endcase
                8'h31: case (row) 3'd0: font5x7=5'b00100; 3'd1: font5x7=5'b01100; 3'd2: font5x7=5'b00100; 3'd3: font5x7=5'b00100; 3'd4: font5x7=5'b00100; 3'd5: font5x7=5'b00100; 3'd6: font5x7=5'b01110; default: font5x7=5'b00000; endcase
                8'h32: case (row) 3'd0: font5x7=5'b01110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b00001; 3'd3: font5x7=5'b00010; 3'd4: font5x7=5'b00100; 3'd5: font5x7=5'b01000; 3'd6: font5x7=5'b11111; default: font5x7=5'b00000; endcase
                8'h33: case (row) 3'd0: font5x7=5'b11110; 3'd1: font5x7=5'b00001; 3'd2: font5x7=5'b00001; 3'd3: font5x7=5'b01110; 3'd4: font5x7=5'b00001; 3'd5: font5x7=5'b00001; 3'd6: font5x7=5'b11110; default: font5x7=5'b00000; endcase
                8'h34: case (row) 3'd0: font5x7=5'b00010; 3'd1: font5x7=5'b00110; 3'd2: font5x7=5'b01010; 3'd3: font5x7=5'b10010; 3'd4: font5x7=5'b11111; 3'd5: font5x7=5'b00010; 3'd6: font5x7=5'b00010; default: font5x7=5'b00000; endcase
                8'h35: case (row) 3'd0: font5x7=5'b11111; 3'd1: font5x7=5'b10000; 3'd2: font5x7=5'b11110; 3'd3: font5x7=5'b00001; 3'd4: font5x7=5'b00001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b01110; default: font5x7=5'b00000; endcase
                8'h36: case (row) 3'd0: font5x7=5'b00110; 3'd1: font5x7=5'b01000; 3'd2: font5x7=5'b10000; 3'd3: font5x7=5'b11110; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b01110; default: font5x7=5'b00000; endcase
                8'h37: case (row) 3'd0: font5x7=5'b11111; 3'd1: font5x7=5'b00001; 3'd2: font5x7=5'b00010; 3'd3: font5x7=5'b00100; 3'd4: font5x7=5'b01000; 3'd5: font5x7=5'b01000; 3'd6: font5x7=5'b01000; default: font5x7=5'b00000; endcase
                8'h38: case (row) 3'd0: font5x7=5'b01110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b01110; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b01110; default: font5x7=5'b00000; endcase
                8'h39: case (row) 3'd0: font5x7=5'b01110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b01111; 3'd4: font5x7=5'b00001; 3'd5: font5x7=5'b00010; 3'd6: font5x7=5'b11100; default: font5x7=5'b00000; endcase
                8'h41: case (row) 3'd0: font5x7=5'b01110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b11111; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b10001; default: font5x7=5'b00000; endcase
                8'h44: case (row) 3'd0: font5x7=5'b11110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b10001; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b11110; default: font5x7=5'b00000; endcase
                8'h45: case (row) 3'd0: font5x7=5'b11111; 3'd1: font5x7=5'b10000; 3'd2: font5x7=5'b10000; 3'd3: font5x7=5'b11110; 3'd4: font5x7=5'b10000; 3'd5: font5x7=5'b10000; 3'd6: font5x7=5'b11111; default: font5x7=5'b00000; endcase
                8'h46: case (row) 3'd0: font5x7=5'b11111; 3'd1: font5x7=5'b10000; 3'd2: font5x7=5'b10000; 3'd3: font5x7=5'b11110; 3'd4: font5x7=5'b10000; 3'd5: font5x7=5'b10000; 3'd6: font5x7=5'b10000; default: font5x7=5'b00000; endcase
                8'h47: case (row) 3'd0: font5x7=5'b01110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10000; 3'd3: font5x7=5'b10111; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b01110; default: font5x7=5'b00000; endcase
                8'h48: case (row) 3'd0: font5x7=5'b10001; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b11111; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b10001; default: font5x7=5'b00000; endcase
                8'h49: case (row) 3'd0: font5x7=5'b01110; 3'd1: font5x7=5'b00100; 3'd2: font5x7=5'b00100; 3'd3: font5x7=5'b00100; 3'd4: font5x7=5'b00100; 3'd5: font5x7=5'b00100; 3'd6: font5x7=5'b01110; default: font5x7=5'b00000; endcase
                8'h4C: case (row) 3'd0: font5x7=5'b10000; 3'd1: font5x7=5'b10000; 3'd2: font5x7=5'b10000; 3'd3: font5x7=5'b10000; 3'd4: font5x7=5'b10000; 3'd5: font5x7=5'b10000; 3'd6: font5x7=5'b11111; default: font5x7=5'b00000; endcase
                8'h4D: case (row) 3'd0: font5x7=5'b10001; 3'd1: font5x7=5'b11011; 3'd2: font5x7=5'b10101; 3'd3: font5x7=5'b10101; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b10001; default: font5x7=5'b00000; endcase
                8'h4E: case (row) 3'd0: font5x7=5'b10001; 3'd1: font5x7=5'b11001; 3'd2: font5x7=5'b10101; 3'd3: font5x7=5'b10011; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b10001; default: font5x7=5'b00000; endcase
                8'h50: case (row) 3'd0: font5x7=5'b11110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b11110; 3'd4: font5x7=5'b10000; 3'd5: font5x7=5'b10000; 3'd6: font5x7=5'b10000; default: font5x7=5'b00000; endcase
                8'h51: case (row) 3'd0: font5x7=5'b01110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b10001; 3'd4: font5x7=5'b10101; 3'd5: font5x7=5'b10010; 3'd6: font5x7=5'b01101; default: font5x7=5'b00000; endcase
                8'h52: case (row) 3'd0: font5x7=5'b11110; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b11110; 3'd4: font5x7=5'b10100; 3'd5: font5x7=5'b10010; 3'd6: font5x7=5'b10001; default: font5x7=5'b00000; endcase
                8'h53: case (row) 3'd0: font5x7=5'b01111; 3'd1: font5x7=5'b10000; 3'd2: font5x7=5'b10000; 3'd3: font5x7=5'b01110; 3'd4: font5x7=5'b00001; 3'd5: font5x7=5'b00001; 3'd6: font5x7=5'b11110; default: font5x7=5'b00000; endcase
                8'h54: case (row) 3'd0: font5x7=5'b11111; 3'd1: font5x7=5'b00100; 3'd2: font5x7=5'b00100; 3'd3: font5x7=5'b00100; 3'd4: font5x7=5'b00100; 3'd5: font5x7=5'b00100; 3'd6: font5x7=5'b00100; default: font5x7=5'b00000; endcase
                8'h55: case (row) 3'd0: font5x7=5'b10001; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b10001; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b10001; 3'd6: font5x7=5'b01110; default: font5x7=5'b00000; endcase
                8'h56: case (row) 3'd0: font5x7=5'b10001; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b10001; 3'd4: font5x7=5'b10001; 3'd5: font5x7=5'b01010; 3'd6: font5x7=5'b00100; default: font5x7=5'b00000; endcase
                8'h57: case (row) 3'd0: font5x7=5'b10001; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b10001; 3'd3: font5x7=5'b10101; 3'd4: font5x7=5'b10101; 3'd5: font5x7=5'b10101; 3'd6: font5x7=5'b01010; default: font5x7=5'b00000; endcase
                8'h59: case (row) 3'd0: font5x7=5'b10001; 3'd1: font5x7=5'b10001; 3'd2: font5x7=5'b01010; 3'd3: font5x7=5'b00100; 3'd4: font5x7=5'b00100; 3'd5: font5x7=5'b00100; 3'd6: font5x7=5'b00100; default: font5x7=5'b00000; endcase
                8'h5A: case (row) 3'd0: font5x7=5'b11111; 3'd1: font5x7=5'b00001; 3'd2: font5x7=5'b00010; 3'd3: font5x7=5'b00100; 3'd4: font5x7=5'b01000; 3'd5: font5x7=5'b10000; 3'd6: font5x7=5'b11111; default: font5x7=5'b00000; endcase
                default: font5x7 = 5'b00000;
            endcase
        end
    endfunction

    assign sig_text_char_code = sig_text_char(sig_text_row, sig_text_col);
    assign sig_font_bits = font5x7(sig_text_char_code, sig_font_row);

    reg sig_font_dot;
    always @(*) begin
        case (sig_font_col)
            3'd0: sig_font_dot = sig_font_bits[4];
            3'd1: sig_font_dot = sig_font_bits[3];
            3'd2: sig_font_dot = sig_font_bits[2];
            3'd3: sig_font_dot = sig_font_bits[1];
            3'd4: sig_font_dot = sig_font_bits[0];
            default: sig_font_dot = 1'b0;
        endcase
    end

    wire sig_text_pixel = sig_text_line && sig_text_x_area &&
                          (sig_font_col <= 3'd4) && (sig_font_row <= 3'd6) && sig_font_dot;

    wire sig_text_focus_pixel = sig_text_pixel &&
        (((param_focus == 2'd0) && (sig_text_row == 3'd1) && (sig_text_col >= 6'd6) && (sig_text_col <= 6'd8)) ||
         ((param_focus == 2'd1) && (sig_text_row == 3'd2) && (sig_text_col == (6'd6 + {4'd0, step_idx}))) ||
         ((param_focus == 2'd2) && (sig_text_row == 3'd3) &&
             (((step_idx == 2'd0) && (sig_text_col == 6'd6)) || ((step_idx == 2'd1) && (sig_text_col == 6'd7)))) ||
         ((param_focus == 2'd3) && (sig_text_row == 3'd4) &&
             (((step_idx == 2'd0) && ((sig_text_col == 6'd5) || (sig_text_col == 6'd6))) ||
              ((step_idx == 2'd1) && (sig_text_col == 6'd8)))));

    localparam RGB_BLACK    = 12'h000; localparam RGB_WHITE    = 12'hFFF;
    localparam RGB_CH1_YLW  = 12'hFF0; localparam RGB_CH2_CYN  = 12'h0FF;
    localparam RGB_LIS_MAG  = 12'hF0F; localparam RGB_FOCUS_RED = 12'hF22; // 红色高标框
    localparam RGB_BAR_BLU  = 12'h25F; // 蓝色参数条
    
    localparam RGB_OSC_AXIS = 12'h0A0; localparam RGB_OSC_GRID = 12'h020; // 示波器绿网
    localparam RGB_DUP_AXIS = 12'h05A; localparam RGB_DUP_GRID = 12'h012; // 双工蓝绿色网

    always @(posedge clk_vga or negedge rst_n) begin
        if (!rst_n) begin
            {vga_r, vga_g, vga_b} <= RGB_BLACK;
        end else if (video_active) begin

            case (work_mode)
                // -------------------------------------------------------------
                // 模式 00: 纯示波器模式 (全屏网格 + 显存波形渲染)
                // -------------------------------------------------------------
                2'b00: begin
                    if (display_mode == 1'b0) begin // A. 正常时域双波形
                        if (pixel_y == ch1_target_y || pixel_y == ch1_target_y + 1) 
                            {vga_r, vga_g, vga_b} <= RGB_CH1_YLW; // CH1 黄色
                        else if (pixel_y == ch2_target_y || pixel_y == ch2_target_y + 1) 
                            {vga_r, vga_g, vga_b} <= RGB_CH2_CYN; // CH2 青色
                        else if (pixel_x == 10'd320 || pixel_y == 10'd120 || pixel_y == 10'd360) 
                            {vga_r, vga_g, vga_b} <= RGB_OSC_AXIS; // 中心轴
                        else if (pixel_x[5:0] == 6'd0 || pixel_y[5:0] == 6'd0) 
                            {vga_r, vga_g, vga_b} <= RGB_OSC_GRID; // 暗绿网格
                        else 
                            {vga_r, vga_g, vga_b} <= RGB_BLACK;
                    end else begin // B. 李萨如图形 (X-Y 模式)
                        if ((pixel_x == lissajous_target_x || pixel_x == lissajous_target_x + 1) &&
                            (pixel_y == lissajous_target_y || pixel_y == lissajous_target_y + 1))
                            {vga_r, vga_g, vga_b} <= RGB_LIS_MAG; // 李萨如品红
                        else if (pixel_x == 10'd320 || pixel_y == 10'd240)
                            {vga_r, vga_g, vga_b} <= RGB_OSC_AXIS; // 单中心十字轴
                        else
                            {vga_r, vga_g, vga_b} <= RGB_BLACK;
                    end
                end

                // -------------------------------------------------------------
                // 模式 01: 纯信号源模式 (关闭采集，渲染带硬件预览的控制面板)
                // -------------------------------------------------------------
                2'b01: begin
                    if (sig_text_focus_pixel)
                        {vga_r, vga_g, vga_b} <= RGB_CH2_CYN;    // Highlight selected editable digit
                    else if (sig_text_pixel)
                        {vga_r, vga_g, vga_b} <= RGB_WHITE;      // Text labels and numeric values
                    else if (any_focus_border)
                        {vga_r, vga_g, vga_b} <= RGB_FOCUS_RED;  // 动态光标红框
                    else if (sig_box_border) 
                        {vga_r, vga_g, vga_b} <= RGB_WHITE;      // 监视器白边框
                    else if (panel_wave_pixel) 
                        {vga_r, vga_g, vga_b} <= RGB_CH1_YLW;    // 黄金预览波形线
                    else if (step_indicator)
                        {vga_r, vga_g, vga_b} <= RGB_WHITE;      // 选中的步长指示块
                    else if (amp_bar_pixel)
                        {vga_r, vga_g, vga_b} <= RGB_BAR_BLU;    // 幅度蓝色能量条
                    else if (pixel_y >= 10'd290 && pixel_y <= 10'd430 && pixel_x >= 10'd120 && pixel_x <= 10'd520)
                        {vga_r, vga_g, vga_b} <= 12'h111;        // 控制区深灰色底板
                    else 
                        {vga_r, vga_g, vga_b} <= RGB_BLACK;
                end

                // -------------------------------------------------------------
                // 模式 10: 双工联动模式 (收发全开自环测试，网格自动更换为深蓝色)
                // -------------------------------------------------------------
                2'b10: begin
                    if (display_mode == 1'b0) begin
                        if (pixel_y == ch1_target_y || pixel_y == ch1_target_y + 1) 
                            {vga_r, vga_g, vga_b} <= RGB_CH1_YLW;
                        else if (pixel_y == ch2_target_y || pixel_y == ch2_target_y + 1) 
                            {vga_r, vga_g, vga_b} <= RGB_CH2_CYN;
                        else if (pixel_x == 10'd320 || pixel_y == 10'd120 || pixel_y == 10'd360) 
                            {vga_r, vga_g, vga_b} <= RGB_DUP_AXIS; // 更换为蓝绿联动轴
                        else if (pixel_x[5:0] == 6'd0 || pixel_y[5:0] == 6'd0) 
                            {vga_r, vga_g, vga_b} <= RGB_DUP_GRID; // 更换为联动暗蓝网格
                        else 
                            {vga_r, vga_g, vga_b} <= RGB_BLACK;
                    end else begin
                        if ((pixel_x == lissajous_target_x || pixel_x == lissajous_target_x + 1) &&
                            (pixel_y == lissajous_target_y || pixel_y == lissajous_target_y + 1))
                            {vga_r, vga_g, vga_b} <= RGB_LIS_MAG;
                        else if (pixel_x == 10'd320 || pixel_y == 10'd240)
                            {vga_r, vga_g, vga_b} <= RGB_DUP_AXIS;
                        else
                            {vga_r, vga_g, vga_b} <= RGB_BLACK;
                    end
                end

                default: {vga_r, vga_g, vga_b} <= RGB_BLACK;
            endcase

        end else begin
            {vga_r, vga_g, vga_b} <= RGB_BLACK; // 消隐区强制清黑
        end
    end

endmodule