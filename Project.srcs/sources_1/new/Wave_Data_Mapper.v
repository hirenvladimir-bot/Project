`timescale 1ns / 1ps

module Wave_Data_Mapper (
    input  wire        clk_vga,        // 25MHz VGA����ʱ��
    input  wire        rst_n,          // ȫ�ָ�λ

    // ---------------- �Դ� BRAM ��ȡ�ӿ� (Port B) ----------------
    output wire [9:0]  bram_read_addr, // ����ַ (0~1023)
    input  wire [23:0] bram_dout,      // ���������� {CH2[11:0], CH1[11:0]}

    // ---------------- VGA ��ǰɨ������ (����ʱ������) ----------------
    input  wire [9:0]  hcount,         // ��ǰɨ�����Ļ X ����
    input  wire [9:0]  vcount,         // ��ǰɨ�����Ļ Y ����
    input  wire        display_mode,   // 0=˫����, 1=������ģʽ

    // ---------------- �����������ĻĿ������ ----------------
    // ˫����ģʽ�¼������Ŀ�� Y ����
    output reg  [9:0]  ch1_target_y,
    output reg  [9:0]  ch2_target_y,

    // ������ģʽ�¼������Ŀ�� (X, Y) ����
    output reg  [9:0]  lissajous_target_x,
    output reg  [9:0]  lissajous_target_y
);

    // =========================================================================
    // 1. ���ݽ�����ַ�����߼�
    // =========================================================================
    wire [11:0] ch1_raw = bram_dout[11:0];
    wire [11:0] ch2_raw = bram_dout[23:12];
    reg [9:0] lissajous_scan_addr;
    // ����ͨ˫����ģʽ�£�������(ʱ��)��Ϊ BRAM ��ַ
    // Ϊ�˷�ֹ�������������ǿ��Ը��ݴ���λ�ü���ƫ�ƣ���������򵥵�ֱ��ӳ��
    // (������Ļ���� 640 �㹻��ʾ 0~639 ��ַ������)
    assign bram_read_addr = (display_mode == 1'b0) ? hcount : lissajous_scan_addr;
                            // ��������ģʽ�£���ַ��Ҫ������ hcount ����ѭ������
                            // ����Ԥ����������ĸ���ɨ������� (������ϸ˵��)
                            

    // =========================================================================
    // 2. ������ģʽר���������ĸ���ɨ���ַ������
    // =========================================================================
    
    always @(posedge clk_vga or negedge rst_n) begin
        if (!rst_n) begin
            lissajous_scan_addr <= 10'd0;
        end else if (display_mode == 1'b1) begin
            // ֻҪ��������ģʽ�£��Ͳ�ͣ�ط�����ѯ 1024 ����
            lissajous_scan_addr <= lissajous_scan_addr + 1'b1;
        end
    end

    // =========================================================================
    // 3. Coordinate Mapping (with signed arithmetic fix + clamping)
    // =========================================================================
    // XADC data range: 0 ~ 4095 (12-bit). Mid-scale = 2048 = 0.5V reference.
    //
    // Dual-channel mode: right-shift by 4 → 0-255, map to split-screen regions.
    // Lissajous mode:    right-shift by 3 → 0-511, signed offset from mid-scale.

    // Signed offset computation (shared between modes)
    wire signed [9:0] ch1_signed = $signed({1'b0, ch1_raw[11:3]}) - $signed(10'd256);
    wire signed [9:0] ch2_signed = $signed({1'b0, ch2_raw[11:3]}) - $signed(10'd256);

    // Lissajous raw coordinates (may be out of bounds)
    wire signed [10:0] lx_raw = $signed({1'b0, 10'd320}) + $signed({ch1_signed[9], ch1_signed});
    wire signed [10:0] ly_raw = $signed({1'b0, 10'd240}) - $signed({ch2_signed[9], ch2_signed});

    always @(posedge clk_vga or negedge rst_n) begin
        if (!rst_n) begin
            ch1_target_y       <= 10'd0;
            ch2_target_y       <= 10'd0;
            lissajous_target_x <= 10'd0;
            lissajous_target_y <= 10'd0;
        end else begin
            // -----------------------------------------------------------------
            // A. Dual-channel waveform target Y (split-screen)
            // -----------------------------------------------------------------
            // CH1: upper half, center ~120.  adc=128(0.5V) → Y=112
            // CH2: lower half, center ~360.  adc=128(0.5V) → Y=352
            ch1_target_y <= 10'd240 - {2'b00, ch1_raw[11:4]};
            ch2_target_y <= 10'd480 - {2'b00, ch2_raw[11:4]};

            // -----------------------------------------------------------------
            // B. Lissajous figure target coordinates (clamped to screen)
            // -----------------------------------------------------------------
            // X from CH1, Y from CH2. Center = (320, 240).
            // Clamp signed raw values to [0, 639] × [0, 479].
            // lx_raw, ly_raw are 11-bit signed. MSB=1 → negative.
            if (lx_raw[10]) begin                       // negative → clamp to 0
                lissajous_target_x <= 10'd0;
            end else if (lx_raw[9:0] > 10'd639) begin   // > 639 → clamp
                lissajous_target_x <= 10'd639;
            end else begin
                lissajous_target_x <= lx_raw[9:0];
            end

            if (ly_raw[10]) begin                       // negative → clamp to 0
                lissajous_target_y <= 10'd0;
            end else if (ly_raw[9:0] > 10'd479) begin   // > 479 → clamp
                lissajous_target_y <= 10'd479;
            end else begin
                lissajous_target_y <= ly_raw[9:0];
            end
        end
    end

endmodule