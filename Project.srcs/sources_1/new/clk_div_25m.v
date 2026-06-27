`timescale 1ns / 1ps
//=============================================================================
// clk_div_25m — Simple clock divider: 100MHz → 25MHz (divide by 4)
//=============================================================================
module clk_div_25m
(
    input  wire  clk_100m,
    input  wire  rst_n,
    output wire  clk_25m
);

    reg [1:0] counter;
    reg       clk_out;

    always @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 2'd0;
            clk_out <= 1'b0;
        end else begin
            counter <= counter + 1'b1;
            if (counter == 2'd1)
                clk_out <= ~clk_out;
        end
    end

    assign clk_25m = clk_out;

endmodule
