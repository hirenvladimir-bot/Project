`timescale 1ns / 1ps

module Oscilloscope_Acq (
    input  wire        clk_100m,
    input  wire        rst_n,
    input  wire        ch1_en_n,
    input  wire        ch2_en_n,

    input  wire        vauxp_ch1,
    input  wire        vauxn_ch1,
    input  wire        vauxp_ch2,
    input  wire        vauxn_ch2,

    input  wire [9:0]  bram_read_addr,
    output wire [23:0] bram_dout,

    // ---- External analog-switch control (IO-18P / H17) ----
    output reg         adc_mux_sel,     // 0=CH1, 1=CH2

    // ---- Raw measurement data output (for wave_analyzer) ----
    output wire [7:0]  meas_ch1_data,
    output wire [7:0]  meas_ch2_data,
    output wire        meas_data_valid
);

    localparam ADDR_CH1 = 7'h12;
    localparam ADDR_CH2 = 7'h1A;

    wire [15:0] xadc_do;
    wire [4:0]  xadc_channel;
    wire        xadc_drdy;
    wire        xadc_eoc;
    wire        xadc_eos;
    wire        xadc_busy;
    wire [7:0]  xadc_alarm;

    reg [6:0] xadc_daddr;
    reg       xadc_den;
    reg       channel_sel;   // latched at EOC: which channel was JUST converted
    reg       cap_valid;     // 1=next DRDY data is clean, 0=skip (mux settling)

    // XADC always samples VAUX2 (ADDR_CH1). The external analog switch
    // controlled by adc_mux_sel routes either CH1 or CH2 into VAUX2.
    //
    // Mux settling optimization:
    //   adc_mux_sel toggles at EOC. External analog mux needs ~200-400ns to
    //   settle. The XADC starts its next conversion immediately after EOC,
    //   so the first sample after toggle is dirty (mux was transitioning).
    //   We skip every other DRDY to guarantee clean settled data.
    //
    //   cap_valid cadence: 1 → capture CH1 → 0 → skip dirty → 1 → capture CH2 → ...
    //   channel_sel is latched only on cap_valid EOC edges (clean conversions).
    always @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            xadc_daddr  <= ADDR_CH1;
            xadc_den    <= 1'b0;
            adc_mux_sel <= 1'b0;
            channel_sel <= 1'b0;
            cap_valid   <= 1'b1;   // first conversion after reset is clean
        end else if (xadc_eoc) begin
            xadc_den    <= 1'b1;
            if (cap_valid) begin
                // Just finished a clean conversion. Toggle mux for next channel.
                channel_sel <= adc_mux_sel;       // latch which channel was sampled
                adc_mux_sel <= ~adc_mux_sel;      // toggle external mux NOW
            end
            // On dirty cycles: don't toggle, don't latch — mux is settling
        end else if (xadc_drdy) begin
            xadc_den    <= 1'b0;
            xadc_daddr  <= ADDR_CH1;          // fixed — single-channel ADC scheme
            cap_valid   <= ~cap_valid;         // alternate: clean → dirty → clean → ...
        end else begin
            xadc_den <= 1'b0;
        end
    end

    wire [15:0] aux_channel_p;
    wire [15:0] aux_channel_n;

    assign aux_channel_p[0]  = 1'b0;  assign aux_channel_n[0]  = 1'b0;
    assign aux_channel_p[1]  = 1'b0;  assign aux_channel_n[1]  = 1'b0;
    assign aux_channel_p[2]  = vauxp_ch1; assign aux_channel_n[2]  = vauxn_ch1;
    assign aux_channel_p[3]  = 1'b0;  assign aux_channel_n[3]  = 1'b0;
    assign aux_channel_p[4]  = 1'b0;  assign aux_channel_n[4]  = 1'b0;
    assign aux_channel_p[5]  = 1'b0;  assign aux_channel_n[5]  = 1'b0;
    assign aux_channel_p[6]  = 1'b0;  assign aux_channel_n[6]  = 1'b0;
    assign aux_channel_p[7]  = 1'b0;  assign aux_channel_n[7]  = 1'b0;
    assign aux_channel_p[8]  = 1'b0;  assign aux_channel_n[8]  = 1'b0;
    assign aux_channel_p[9]  = 1'b0;  assign aux_channel_n[9]  = 1'b0;
    assign aux_channel_p[10] = vauxp_ch2; assign aux_channel_n[10] = vauxn_ch2;
    assign aux_channel_p[11] = 1'b0;  assign aux_channel_n[11] = 1'b0;
    assign aux_channel_p[12] = 1'b0;  assign aux_channel_n[12] = 1'b0;
    assign aux_channel_p[13] = 1'b0;  assign aux_channel_n[13] = 1'b0;
    assign aux_channel_p[14] = 1'b0;  assign aux_channel_n[14] = 1'b0;
    assign aux_channel_p[15] = 1'b0;  assign aux_channel_n[15] = 1'b0;

    XADC #(
        .INIT_40(16'h0000),
        .INIT_41(16'h4100),
        .INIT_42(16'h0400),
        .INIT_48(16'h0800),
        .INIT_49(16'h0004),
        .INIT_4A(16'h0000),
        .INIT_4B(16'h0000),
        .INIT_4C(16'h0000),
        .INIT_4D(16'h0000),
        .INIT_4E(16'h0000),
        .INIT_4F(16'h0000),
        .INIT_50(16'hB5ED),
        .INIT_51(16'h57E4),
        .INIT_52(16'hA147),
        .INIT_53(16'hCA33),
        .INIT_54(16'hA93A),
        .INIT_55(16'h52C6),
        .INIT_56(16'h9555),
        .INIT_57(16'hAE4E),
        .INIT_58(16'h5999),
        .INIT_5C(16'h5111),
        .SIM_DEVICE("7SERIES"),
        .SIM_MONITOR_FILE("design.txt")
    ) u_xadc_primitive (
        .CONVST(1'b0),
        .CONVSTCLK(1'b0),
        .DADDR(xadc_daddr),
        .DCLK(clk_100m),
        .DEN(xadc_den),
        .DI(16'h0000),
        .DWE(1'b0),
        .RESET(~rst_n),
        .VAUXN(aux_channel_n),
        .VAUXP(aux_channel_p),
        .ALM(xadc_alarm),
        .BUSY(xadc_busy),
        .CHANNEL(xadc_channel),
        .DO(xadc_do),
        .DRDY(xadc_drdy),
        .EOC(xadc_eoc),
        .EOS(xadc_eos),
        .JTAGBUSY(),
        .JTAGLOCKED(),
        .JTAGMODIFIED(),
        .OT(),
        .MUXADDR(),
        .VP(1'b0),
        .VN(1'b0)
    );

    reg [11:0] ch1_data_reg;
    reg [11:0] ch2_data_reg;
    reg        data_pair_ready;

    // channel_sel is latched at clean EOC edges (pre-toggle adc_mux_sel).
    // cap_valid indicates whether the current DRDY data is clean (1) or dirty (0).
    // Both are set in the control block on the previous EOC; this block sees the
    // stable values at DRDY time.
    always @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            ch1_data_reg <= 12'd0;
            ch2_data_reg <= 12'd0;
            data_pair_ready <= 1'b0;
        end else begin
            data_pair_ready <= 1'b0;
            if (xadc_drdy && cap_valid) begin    // only capture clean (settled) samples
                if (!channel_sel) begin          // CH1 data
                    ch1_data_reg <= xadc_do[15:4];
                end else begin                   // CH2 data
                    ch2_data_reg <= xadc_do[15:4];
                    data_pair_ready <= 1'b1;     // both channels now fresh
                end
            end
        end
    end

    reg [9:0]  bram_write_addr;
    reg        bram_write_en;
    reg        trigger_armed;
    reg [11:0] ch1_data_d1;

    localparam TRIGGER_LEVEL = 12'd2048;

    always @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            bram_write_addr <= 10'd0;
            bram_write_en   <= 1'b0;
            trigger_armed   <= 1'b1;
            ch1_data_d1     <= 12'd0;
        end else if (!ch1_en_n && !ch2_en_n) begin
            if (data_pair_ready) begin
                ch1_data_d1 <= ch1_data_reg;

                if (trigger_armed && (ch1_data_d1 < TRIGGER_LEVEL) && (ch1_data_reg >= TRIGGER_LEVEL)) begin
                    trigger_armed   <= 1'b0;
                    bram_write_addr <= 10'd0;
                end

                if (!trigger_armed) begin
                    bram_write_en <= 1'b1;
                    if (bram_write_addr == 10'd1023) begin
                        trigger_armed <= 1'b1;
                    end else begin
                        bram_write_addr <= bram_write_addr + 1'b1;
                    end
                end else begin
                    bram_write_en <= 1'b0;
                end
            end else begin
                bram_write_en <= 1'b0;
            end
        end else begin
            bram_write_en <= 1'b0;
            trigger_armed <= 1'b1;
        end
    end

    blk_mem_gen_0 u_vga_bram (
        .clka  (clk_100m),
        .ena   (1'b1),
        .wea   (bram_write_en),
        .addra (bram_write_addr),
        .dina  ({ch2_data_reg, ch1_data_reg}),
        .clkb  (clk_100m),
        .enb   (1'b1),
        .addrb (bram_read_addr),
        .doutb (bram_dout)
    );

    //=========================================================================
    // Raw measurement data outputs — XADC 12-bit → 8-bit
    // data_pair_ready is a single-cycle pulse when both CH1 & CH2 are fresh
    //=========================================================================
    assign meas_ch1_data  = ch1_data_reg[11:4];
    assign meas_ch2_data  = ch2_data_reg[11:4];
    assign meas_data_valid = data_pair_ready;

endmodule
