`timescale 1ns / 1ps
//=============================================================================
// VGA Controller — 640×480 @ 60Hz
// Pixel clock: 25MHz
// Reference timing from pocketscope_sim2_0 / standard VESA
//=============================================================================

module vga_ctrl
(
    input  wire         clk,          // 25MHz pixel clock
    input  wire         rst_n,

    output reg          hsync,
    output reg          vsync,

    output wire         de,

    output reg  [9:0]   pixel_x,
    output reg  [9:0]   pixel_y
);

//==================================================
// 640×480@60Hz — standard VESA timing
//==================================================

localparam H_VISIBLE = 640;
localparam H_FRONT   = 16;
localparam H_SYNC    = 96;
localparam H_BACK    = 48;
localparam H_TOTAL   = 800;

localparam V_VISIBLE = 480;
localparam V_FRONT   = 10;
localparam V_SYNC    = 2;
localparam V_BACK    = 33;
localparam V_TOTAL   = 525;

//==================================================
// Counters
//==================================================

reg [9:0] h_cnt;
reg [9:0] v_cnt;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        h_cnt   <= 10'd0;
        v_cnt   <= 10'd0;
        hsync   <= 1'b1;
        vsync   <= 1'b1;
        pixel_x <= 10'd0;
        pixel_y <= 10'd0;
    end else begin
        //---- Horizontal counter ----
        if (h_cnt == H_TOTAL - 1) begin
            h_cnt <= 10'd0;
            if (v_cnt == V_TOTAL - 1)
                v_cnt <= 10'd0;
            else
                v_cnt <= v_cnt + 1'b1;
        end else begin
            h_cnt <= h_cnt + 1'b1;
        end

        //---- HSYNC ----
        if (h_cnt >= (H_VISIBLE + H_FRONT) &&
            h_cnt <  (H_VISIBLE + H_FRONT + H_SYNC))
            hsync <= 1'b0;
        else
            hsync <= 1'b1;

        //---- VSYNC ----
        if (v_cnt >= (V_VISIBLE + V_FRONT) &&
            v_cnt <  (V_VISIBLE + V_FRONT + V_SYNC))
            vsync <= 1'b0;
        else
            vsync <= 1'b1;

        //---- DE and pixel coordinates ----
        if ((h_cnt < H_VISIBLE) && (v_cnt < V_VISIBLE)) begin
            pixel_x <= h_cnt;
            pixel_y <= v_cnt;
        end else begin
            pixel_x <= 10'd0;
            pixel_y <= 10'd0;
        end
    end
end

assign de = (h_cnt < H_VISIBLE) && (v_cnt < V_VISIBLE);

endmodule
