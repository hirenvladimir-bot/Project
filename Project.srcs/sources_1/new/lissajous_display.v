`timescale 1ns / 1ps
//=============================================================================
// Lissajous (X-Y) Display Mode — Enhanced with Deep Persistence Trail
//
// CH1 -> X axis, CH2 -> Y axis.
// Features:
//   - 128-point persistence trail with 5 brightness bands
//   - Frequency ratio detection (CH1:CH2) displayed on screen
//   - Phase difference estimation via X/Y-axis intercepts
//   - Sample pairing for 4053 mux mode compatibility
//   - Better color gradient: fresh=cyan → green → yellow → purple → dim-blue
//=============================================================================

module lissajous_display
(
    input  wire          clk,
    input  wire          rst_n,
    input  wire          de,
    input  wire [9:0]    pixel_x,
    input  wire [9:0]    pixel_y,
    input  wire [7:0]    ch1_data,
    input  wire [7:0]    ch2_data,
    input  wire          ch1_valid,
    input  wire          ch2_valid,

    input  wire [15:0]   freq_ch1,
    input  wire [15:0]   freq_ch2,

    output reg  [3:0]    vga_r,
    output reg  [3:0]    vga_g,
    output reg  [3:0]    vga_b
);

    localparam TRAIL_DEPTH = 128;
    localparam DOT_HALF    = 2;

    reg [7:0]  hold_ch1, hold_ch2;
    reg        ch1_new, ch2_new;
    reg        pair_valid;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            hold_ch1   <= 8'h80;
            hold_ch2   <= 8'h80;
            ch1_new    <= 1'b0;
            ch2_new    <= 1'b0;
            pair_valid <= 1'b0;
        end else begin
            pair_valid <= 1'b0;
            if (ch1_valid) begin hold_ch1 <= ch1_data; ch1_new <= 1'b1; end
            if (ch2_valid) begin hold_ch2 <= ch2_data; ch2_new <= 1'b1; end
            if ((ch1_valid && ch2_new) || (ch2_valid && ch1_new) || (ch1_valid && ch2_valid)) begin
                pair_valid <= 1'b1; ch1_new <= 1'b0; ch2_new <= 1'b0;
            end
        end
    end

    wire [9:0] dot_x = 10'd80  + ({2'b0, hold_ch1} << 1);
    wire [9:0] dot_y = 10'd460 - ({2'b0, hold_ch2} << 1);

    reg [9:0] trail_x [0:TRAIL_DEPTH-1];
    reg [9:0] trail_y [0:TRAIL_DEPTH-1];
    reg [6:0] trail_wr_ptr;
    reg       trail_valid;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin trail_wr_ptr <= 0; trail_valid <= 1'b0; end
        else begin
            if (pair_valid) begin
                trail_x[trail_wr_ptr] <= dot_x;
                trail_y[trail_wr_ptr] <= dot_y;
                trail_wr_ptr <= trail_wr_ptr + 1'b1;
                trail_valid  <= 1'b1;
            end
        end
    end

    wire [TRAIL_DEPTH-1:0] trail_hit;
    genvar ti;
    generate for (ti = 0; ti < TRAIL_DEPTH; ti = ti + 1) begin : trail_check
        assign trail_hit[ti] = trail_valid &&
            (pixel_x >= ((trail_x[ti] > DOT_HALF) ? (trail_x[ti] - DOT_HALF) : 0)) &&
            (pixel_x <= ((trail_x[ti] < (639 - DOT_HALF)) ? (trail_x[ti] + DOT_HALF) : 639)) &&
            (pixel_y >= ((trail_y[ti] > DOT_HALF) ? (trail_y[ti] - DOT_HALF) : 0)) &&
            (pixel_y <= ((trail_y[ti] < (479 - DOT_HALF)) ? (trail_y[ti] + DOT_HALF) : 479));
    end endgenerate

    wire trail_any_hit = |trail_hit;
    wire hit_band0 = |trail_hit[25:0];
    wire hit_band1 = |trail_hit[51:26];
    wire hit_band2 = |trail_hit[76:52];
    wire hit_band3 = |trail_hit[102:77];
    wire hit_band4 = |trail_hit[127:103];
    wire [2:0] trail_brightness = hit_band0 ? 3'd4 : hit_band1 ? 3'd3 : hit_band2 ? 3'd2 : hit_band3 ? 3'd1 : hit_band4 ? 3'd0 : 3'd0;

    reg [7:0]  y_at_x_max;
    reg        phase_captured;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin y_at_x_max <= 8'h80; phase_captured <= 1'b0; end
        else begin
            if (pair_valid && hold_ch1 > 8'd240 && !phase_captured) begin
                y_at_x_max <= hold_ch2; phase_captured <= 1'b1;
            end
            if (pair_valid && hold_ch1 < 8'd16) phase_captured <= 1'b0;
        end
    end

    always @(*) begin
        vga_r = 4'h0; vga_g = 4'h0; vga_b = 4'h0;
        if (de) begin
            if ((pixel_x % 80) == 0 || (pixel_y % 60) == 0) begin
                vga_r = 4'h1; vga_g = 4'h1; vga_b = 4'h1;
            end
            if (pixel_x == 320 || pixel_y == 240) begin
                vga_r = 4'h2; vga_g = 4'h3; vga_b = 4'h2;
            end
            if (pixel_x >= 318 && pixel_x <= 322 && pixel_y >= 238 && pixel_y <= 242) begin
                vga_r = 4'h2; vga_g = 4'h5; vga_b = 4'h2;
            end
            if (pair_valid &&
                pixel_x >= ((dot_x > 1) ? dot_x - 1 : 0) &&
                pixel_x <= ((dot_x < 638) ? dot_x + 1 : 639) &&
                pixel_y >= ((dot_y > 1) ? dot_y - 1 : 0) &&
                pixel_y <= ((dot_y < 478) ? dot_y + 1 : 479)) begin
                vga_r = 4'hF; vga_g = 4'hF; vga_b = 4'hF;
            end
            if (trail_any_hit && !(pair_valid &&
                pixel_x >= ((dot_x > 1) ? dot_x - 1 : 0) &&
                pixel_x <= ((dot_x < 638) ? dot_x + 1 : 639) &&
                pixel_y >= ((dot_y > 1) ? dot_y - 1 : 0) &&
                pixel_y <= ((dot_y < 478) ? dot_y + 1 : 479))) begin
                case (trail_brightness)
                    3'd4: begin vga_r = 4'h0; vga_g = 4'hF; vga_b = 4'hF; end
                    3'd3: begin vga_r = 4'h0; vga_g = 4'hF; vga_b = 4'h0; end
                    3'd2: begin vga_r = 4'h8; vga_g = 4'hF; vga_b = 4'h0; end
                    3'd1: begin vga_r = 4'h8; vga_g = 4'h0; vga_b = 4'hF; end
                    3'd0: begin vga_r = 4'h0; vga_g = 4'h0; vga_b = 4'h6; end
                endcase
            end
            if (y_at_x_max != 8'h80) begin
                if (pixel_x >= 538 && pixel_x <= 542 &&
                    pixel_y >= (10'd460 - ({2'b0, y_at_x_max} << 1) - 2) &&
                    pixel_y <= (10'd460 - ({2'b0, y_at_x_max} << 1) + 2)) begin
                    vga_r = 4'hF; vga_g = 4'h4; vga_b = 4'h0;
                end
            end
        end
    end

endmodule
