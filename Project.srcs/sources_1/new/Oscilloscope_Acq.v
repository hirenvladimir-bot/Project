`timescale 1ns / 1ps
//=============================================================================
// Oscilloscope_Acq — Single-Channel XADC Acquisition Module
// Ported from pocketscope_sim2_0 reference design.
//
// Single XADC channel on VAUXP[2]/VAUXN[2] (J5 pins 9-10 on EGO1).
// DRP FSM with startup calibration wait (~5ms), EOC-driven readout,
// DRDY timeout watchdog, and rising-edge trigger with holdoff.
//
// XADC Timing (XC7A35T, 100MHz DCLK, continuous sequencer mode):
//   ADCCLK = DCLK/2 = 50MHz (20ns period)
//   Conversion time ≈ 26 ADCCLK cycles ≈ 520ns
//   Sample rate ≈ 1.92 MSPS (single channel)
//=============================================================================

module Oscilloscope_Acq
(
    input  wire        clk,                // 100MHz DCLK
    input  wire        rst_n,              // Active-low reset
    input  wire        ch1_en_n,           // CH1 enable (active low, 0=enabled)

    // XADC analog inputs — CH1 on VAUXP[2]/VAUXN[2]
    input  wire        vauxp_ch1,
    input  wire        vauxn_ch1,

    // Trigger threshold (12-bit, runtime-configurable from UI)
    input  wire [11:0] trigger_level,

    // Data output (12-bit full XADC resolution)
    output wire [11:0] ch1_data,
    output wire        ch1_valid,

    // Trigger output
    output wire        trigger_fired,

    // Debug outputs (for ILA monitoring)
    output wire        dbg_drp_drdy,
    output wire        dbg_drp_den,
    output wire        dbg_den_pending,
    output wire        dbg_startup_done
);

    //=========================================================================
    // XADC bus mapping — CH1 on VAUXP[2]/VAUXN[2]
    //=========================================================================
    wire [15:0] xadc_vauxp, xadc_vauxn;
    assign xadc_vauxp = {12'd0, 1'b0, vauxp_ch1, 2'b0};
    assign xadc_vauxn = {12'd0, 1'b0, vauxn_ch1, 2'b0};

    //=========================================================================
    // XADC Primitive Instantiation
    //=========================================================================
    wire [15:0] drp_do;
    wire        drp_drdy;
    wire        drp_eoc;
    wire [6:0]  drp_daddr;
    wire        drp_den;

    XADC #(
        // INIT_40: Configuration Register #0
        //   bit12 (CAL1) = 1 → enable offset calibration
        //   bit5  (CAL0) = 1 → enable gain calibration
        //   bit4  (CHSEL) = 1 → enable sequencer mode
        //   bits[3:0] (SEQ) = 0010 → continuous sequencer cycling
        .INIT_40(16'h1032),
        .INIT_41(16'h2000),
        .INIT_42(16'h0000),
        // INIT_48: VAUXP[7:0] channel enable — bit 2 = VAUXP[2]/VAUXN[2]
        .INIT_48(16'h0004),
        // INIT_49-4F: channel sequencer averaging (1=16 samples averaged)
        .INIT_49(16'h0004),
        .INIT_4A(16'h0000),
        .INIT_4B(16'h0000),
        .INIT_4C(16'h0000),
        .INIT_4D(16'h0000),
        .INIT_4E(16'h0000),
        .INIT_4F(16'h0000),
        // INIT_50-58: calibration coefficients (from XADC wizard defaults)
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
        .SIM_MONITOR_FILE("xadc_stimulus.txt")
    ) u_xadc (
        .DCLK       (clk),
        .RESET      (~rst_n),
        .VAUXP      (xadc_vauxp),
        .VAUXN      (xadc_vauxn),
        .VP         (1'b0),
        .VN         (1'b0),
        .CONVST     (1'b0),          // continuous mode, no external trigger
        .CONVSTCLK  (1'b0),
        .DI         (16'h0000),
        .DADDR      (drp_daddr),
        .DEN        (drp_den),
        .DWE        (1'b0),
        .DO         (drp_do),
        .DRDY       (drp_drdy),
        .EOC        (drp_eoc),
        .CHANNEL    (),
        .BUSY       (),
        .EOS        (),
        .JTAGBUSY   (),
        .JTAGLOCKED (),
        .JTAGMODIFIED(),
        .OT         (),
        .ALM        (),
        .MUXADDR    ()
    );

    //=========================================================================
    // DRP Control — EOC-driven, Reference-style
    //
    // Flow:
    //   1. Wait for startup calibration (~5ms)
    //   2. On EOC → assert DEN to read channel data
    //   3. On DRDY → latch data, deassert DEN, pulse valid
    //   4. Goto 2
    //=========================================================================

    // Fixed DRP address — single channel VAUXP[2]/VAUXN[2] (AD2)
    localparam SINGLE_CH_ADDR = 7'h12;
    assign drp_daddr = SINGLE_CH_ADDR;

    // Internal signals
    reg         den_pending;
    reg         den_sent;
    reg [11:0]  ch1_hold;
    reg         ch1_vld;

    // Startup delay: XADC needs ~4ms after reset for auto-calibration
    // (UG480: calibration completes ~4ms after DCLK stable).
    // 500,000 cycles = 5ms at 100MHz — safe margin.
    localparam STARTUP_MAX = 19'd500_000;
    reg [18:0]  startup_cnt;
    wire        startup_done = (startup_cnt == STARTUP_MAX);

    // DRDY timeout watchdog: if DRDY doesn't arrive within ~10µs after DEN,
    // re-trigger DEN. Prevents FSM hang.
    localparam DRDY_TIMEOUT = 10'd1000;
    reg [9:0]   drdy_timeout_cnt;

    // DEN is asserted when: pending AND startup done
    assign drp_den = den_pending && startup_done;

    assign ch1_data  = ch1_hold;
    assign ch1_valid = ch1_vld;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ch1_hold         <= 12'h800;
            ch1_vld          <= 1'b0;
            den_pending      <= 1'b0;
            den_sent         <= 1'b0;
            startup_cnt      <= 0;
            drdy_timeout_cnt <= 0;
        end else begin
            ch1_vld <= 1'b0;

            // --- Startup delay ---
            if (!startup_done) begin
                startup_cnt <= startup_cnt + 1'b1;
                if (startup_cnt == STARTUP_MAX - 1) begin
                    den_pending <= 1'b1;  // kick off first conversion
                    den_sent    <= 1'b0;
                end
            end

            // --- DEN: assert pending, track when sent ---
            if (den_pending && drp_den) begin
                den_pending      <= 1'b0;
                den_sent         <= 1'b1;
                drdy_timeout_cnt <= 0;
            end

            // --- DRDY timeout watchdog ---
            if (den_sent && !drp_drdy) begin
                if (drdy_timeout_cnt == DRDY_TIMEOUT - 1) begin
                    den_pending      <= 1'b1;
                    den_sent         <= 1'b0;
                    drdy_timeout_cnt <= 0;
                end else begin
                    drdy_timeout_cnt <= drdy_timeout_cnt + 1'b1;
                end
            end

            // --- EOC: start next conversion ---
            if (drp_eoc && startup_done) begin
                den_pending <= 1'b1;
                den_sent    <= 1'b0;
            end

            // --- DRDY: latch data ---
            if (drp_drdy) begin
                den_sent  <= 1'b0;
                ch1_hold  <= drp_do[15:4];  // upper 12 bits of 16-bit XADC DO
                ch1_vld   <= 1'b1;
            end
        end
    end

    //=========================================================================
    // Trigger Logic — Rising Edge on CH1
    //=========================================================================
    reg [11:0] ch1_data_d1;
    reg        trigger_armed;
    reg        trigger_fired_reg;
    reg [15:0] trigger_holdoff_cnt;

    localparam TRIGGER_HOLDOFF = 16'd50000;  // ~0.5ms at 100MHz

    assign trigger_fired = trigger_fired_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ch1_data_d1        <= 12'd0;
            trigger_armed      <= 1'b1;
            trigger_fired_reg  <= 1'b0;
            trigger_holdoff_cnt <= 0;
        end else begin
            trigger_fired_reg <= 1'b0;

            if (ch1_vld)
                ch1_data_d1 <= ch1_data;

            // Hold-off countdown
            if (trigger_holdoff_cnt > 0)
                trigger_holdoff_cnt <= trigger_holdoff_cnt - 1'b1;

            if (!ch1_en_n) begin  // channel enabled
                if (!trigger_armed) begin
                    // Re-arm when signal goes below trigger level
                    if (ch1_vld && ch1_data < trigger_level[11:0])
                        trigger_armed <= 1'b1;
                end else begin
                    // Fire on rising edge crossing + hold-off expired
                    if (ch1_vld &&
                        ch1_data_d1 < trigger_level[11:0] &&
                        ch1_data >= trigger_level[11:0] &&
                        trigger_holdoff_cnt == 0) begin
                        trigger_fired_reg  <= 1'b1;
                        trigger_armed      <= 1'b0;
                        trigger_holdoff_cnt <= TRIGGER_HOLDOFF;
                    end
                end
            end else begin
                trigger_armed <= 1'b0;
            end
        end
    end

    // Debug outputs
    assign dbg_drp_drdy    = drp_drdy;
    assign dbg_drp_den     = drp_den;
    assign dbg_den_pending = den_pending;
    assign dbg_startup_done = startup_done;

endmodule
