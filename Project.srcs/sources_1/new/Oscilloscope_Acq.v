`timescale 1ns / 1ps
//=============================================================================
// Oscilloscope_Acq — Dual-Channel XADC via XADC Primitive
//
// Architecture:
//   - XADC primitive in continuous sequencer mode, VAUX2+VAUX10
//   - DRP channel sequencing (EOC-driven)
//   - 1ms startup delay for auto-calibration
//   - Inferred BRAM (1024×24bit, simple dual-port) for waveform storage
//   - Rising-edge trigger on CH1 with fixed level (2048)
//
// XADC Timing (XC7A35T, 100MHz DCLK):
//   ADCCLK = DCLK/2 = 50MHz (20ns period)
//   Conversion time ≈ 26 ADCCLK cycles ≈ 520ns per channel
//   Dual-channel sample rate ≈ 961 kSPS per channel
//=============================================================================

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
    output wire [23:0] bram_dout
);

    //=========================================================================
    // XADC VAUX bus mapping
    // VAUXP/VAUXN are 16-bit buses: bit N drives VAUXP[N]/VAUXN[N]
    //   CH1 → VAUXP[2] / VAUXN[2]   (bit 2)
    //   CH2 → VAUXP[10] / VAUXN[10] (bit 10)
    //=========================================================================
    wire [15:0] xadc_vauxp, xadc_vauxn;
    assign xadc_vauxp = {5'd0, 1'b0, vauxp_ch2, 7'd0, 1'b0, vauxp_ch1, 1'b0};
    assign xadc_vauxn = {5'd0, 1'b0, vauxn_ch2, 7'd0, 1'b0, vauxn_ch1, 1'b0};

    //=========================================================================
    // XADC Primitive Instantiation
    //
    // INIT_40 = 16'h1032:
    //   bit12 (CAL1) = 1 → enable offset calibration
    //   bit5  (CAL0) = 1 → enable gain calibration
    //   bit4  (CHSEL) = 1 → sequencer mode (channels read via SEQ bits)
    //   bits[3:0] (SEQ) = 0010 → continuous sequencer cycling
    //
    // INIT_48 = 16'h0404:  VAUXP[2] (bit2) + VAUXP[10] (bit10) enabled
    // INIT_49 = 16'h0404:  VAUXN[2] (bit2) + VAUXN[10] (bit10) enabled
    // INIT_4A-4F = 0:      No averaging on any channel (max sample rate)
    //=========================================================================
    wire [15:0] drp_do;
    wire        drp_drdy;
    wire        drp_eoc;
    wire [4:0]  drp_channel;
    wire        drp_eos;
    wire        drp_busy;

    // DRP control signals
    reg  [6:0]  drp_daddr;
    reg         drp_den;
    reg         drp_dwe;

    XADC #(
        .INIT_40(16'h1032),      // Continuous sequencer, calibration enabled
        .INIT_41(16'h4100),      // Default alarm/config
        .INIT_42(16'h0000),      // Default
        .INIT_48(16'h0404),      // VAUXP[2] + VAUXP[10] enabled
        .INIT_49(16'h0404),      // VAUXN[2] + VAUXN[10] enabled
        .INIT_4A(16'h0000),      // No averaging VAUXP[0]
        .INIT_4B(16'h0000),      // No averaging VAUXP[1]
        .INIT_4C(16'h0000),      // No averaging VAUXP[2]
        .INIT_4D(16'h0000),      // No averaging VAUXP[3]
        .INIT_4E(16'h0000),      // No averaging VAUXP[4]
        .INIT_4F(16'h0000),      // No averaging VAUXP[5]
        .INIT_50(16'hB5ED),      // Calibration coefficients
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
        .SIM_MONITOR_FILE("xadc_stimulus.txt")
    ) u_xadc (
        .DCLK       (clk_100m),
        .RESET      (~rst_n),
        .VAUXP      (xadc_vauxp),
        .VAUXN      (xadc_vauxn),
        .VP         (1'b0),
        .VN         (1'b0),
        .CONVST     (1'b0),          // continuous mode, no external trigger
        .CONVSTCLK  (1'b0),
        .DI         (16'd0),
        .DADDR      (drp_daddr),
        .DEN        (drp_den),
        .DWE        (drp_dwe),
        .DO         (drp_do),
        .DRDY       (drp_drdy),
        .EOC        (drp_eoc),
        .CHANNEL    (drp_channel),
        .BUSY       (drp_busy),
        .EOS        (drp_eos),
        .JTAGBUSY   (),
        .JTAGLOCKED (),
        .JTAGMODIFIED(),
        .OT         (),
        .ALM        (),
        .MUXADDR    ()
    );

    //=========================================================================
    // Startup — wait ~1ms at 100MHz for XADC auto-calibration
    //=========================================================================
    localparam STARTUP_MAX = 17'd100_000;  // 1ms at 100MHz
    reg [16:0] startup_cnt;
    wire       startup_done = (startup_cnt == STARTUP_MAX);

    always @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n)
            startup_cnt <= 0;
        else if (!startup_done)
            startup_cnt <= startup_cnt + 1'b1;
    end

    //=========================================================================
    // DRP FSM — EOC-driven, dual-channel sequencing
    //
    //   Sequencer order: VAUX2 (CH1) → VAUX10 (CH2) → repeat
    //   On each EOC, initiate DRP read for the corresponding channel.
    //   Track with `expecting_ch1` state — toggles each time we latch data.
    //
    // States:
    //   IDLE  → EOC fires → DEN (assert DEN with current daddr)
    //         → DRDY fires → LATCH (capture data, toggle channel)
    //         → back to IDLE
    //=========================================================================
    localparam ADDR_CH1 = 7'h12;   // VAUXP[2] / VAUXN[2] result register
    localparam ADDR_CH2 = 7'h1A;   // VAUXP[10] / VAUXN[10] result register

    reg         expecting_ch1;      // 1 = next EOC is CH1, 0 = CH2
    reg         den_pending;
    reg [1:0]   fsm_state;

    localparam [1:0] ST_IDLE  = 2'd0;
    localparam [1:0] ST_DEN   = 2'd1;   // DEN asserted, waiting for DRDY
    localparam [1:0] ST_LATCH = 2'd2;   // DRDY received, latching data

    // DRP DADDR: always set to the channel we're expecting next
    always @(*) begin
        drp_daddr = expecting_ch1 ? ADDR_CH1 : ADDR_CH2;
    end

    always @(*) begin
        drp_dwe  = 1'b0;
        // Assert DEN when: FSM in DEN state AND startup done AND EOC was seen
        drp_den  = (fsm_state == ST_DEN) && startup_done;
    end

    // Data capture registers
    reg [11:0] ch1_data_reg;
    reg [11:0] ch2_data_reg;
    reg        data_pair_ready;

    // FSM
    always @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            fsm_state       <= ST_IDLE;
            expecting_ch1   <= 1'b1;     // sequencer starts with VAUX2 (CH1)
            ch1_data_reg    <= 12'h800;
            ch2_data_reg    <= 12'h800;
            data_pair_ready <= 1'b0;
        end else begin
            data_pair_ready <= 1'b0;

            if (!startup_done) begin
                fsm_state     <= ST_IDLE;
                expecting_ch1 <= 1'b1;
            end else begin
                case (fsm_state)
                    ST_IDLE: begin
                        // EOC means a conversion just finished
                        if (drp_eoc)
                            fsm_state <= ST_DEN;
                    end

                    ST_DEN: begin
                        // DEN is asserted combinationally; wait one cycle then
                        // move to latch-waiting. The XADC takes a few cycles
                        // to respond with DRDY.
                        fsm_state <= ST_LATCH;
                    end

                    ST_LATCH: begin
                        if (drp_drdy) begin
                            // Data is valid — latch into the correct channel
                            if (expecting_ch1) begin
                                ch1_data_reg <= drp_do[15:4];
                                expecting_ch1 <= 1'b0;   // next EOC will be CH2
                            end else begin
                                ch2_data_reg <= drp_do[15:4];
                                expecting_ch1 <= 1'b1;   // next EOC will be CH1
                                data_pair_ready <= 1'b1; // both channels updated
                            end
                            fsm_state <= ST_IDLE;
                        end
                    end

                    default: fsm_state <= ST_IDLE;
                endcase
            end
        end
    end

    //=========================================================================
    // Trigger + BRAM write control (single-channel: CH1 only)
    //=========================================================================
    reg [9:0]  bram_write_addr;
    reg        bram_write_en;
    reg        trigger_armed;
    reg [11:0] ch1_data_d1;

    localparam TRIGGER_LEVEL = 12'd2048;   // mid-scale

    always @(posedge clk_100m or negedge rst_n) begin
        if (!rst_n) begin
            bram_write_addr <= 10'd0;
            bram_write_en   <= 1'b0;
            trigger_armed   <= 1'b1;
            ch1_data_d1     <= 12'd0;
        end else if (!ch1_en_n) begin
            if (data_pair_ready) begin
                ch1_data_d1 <= ch1_data_reg;

                // Rising-edge trigger: was below, now above threshold
                if (trigger_armed &&
                    (ch1_data_d1 < TRIGGER_LEVEL) &&
                    (ch1_data_reg >= TRIGGER_LEVEL)) begin
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

    //=========================================================================
    // Inferred BRAM — 1024×24bit simple dual-port
    // Write: {CH2(12'h800 fixed), CH1(12-bit)}
    // Read:  bram_dout[11:0]=CH1, [23:12]=CH2
    //=========================================================================
    (* ram_style = "block" *) reg [23:0] bram [0:1023];
    reg [23:0] bram_dout_r;

    always @(posedge clk_100m) begin
        if (bram_write_en)
            bram[bram_write_addr] <= {12'h800, ch1_data_reg};
        bram_dout_r <= bram[bram_read_addr];
    end

    assign bram_dout = bram_dout_r;

endmodule
