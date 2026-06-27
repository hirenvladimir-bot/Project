`timescale 1ns / 1ps

module Signal_Generator (
    input  wire        clk,          // 系统时钟 100MHz (来自时钟 IP 核)
    input  wire        rst_n,        // 全局复位，低电平有效

    // ---------------- 控制参数输入 (来自 Global_Ctrl 状态机) ----------------
    input  wire [31:0] fcw,          // 频率控制字 (Frequency Control Word)
    input  wire [31:0] pcw,          // 相位控制字 (Phase Control Word, 用于 PSK)
    input  wire [1:0]  wave_sel,     // 波形选择: 00=正弦, 01=三角, 10=方波
    input  wire [7:0]  amp_ctrl,     // 调幅系数: 0~255 (255为满幅，用于 AM)
    input  wire [7:0]  duty_ctrl,    // 方波占空比百分比: 0~99
    input  wire        sg_en_n,      // 信号源使能 (低有效)

    // ---------------- 物理硬件输出 (连接至 DAC0832) ----------------
    output reg  [7:0]  dac_data,     // 输出给 DAC 的 8-bit 数据
    output wire        dac_clk       // 提供给 DAC 的同步时钟 (可选，视硬件连接而定)
);

    // =========================================================================
    // 1. 32位 相位累加器 (Phase Accumulator)
    // =========================================================================
    reg [31:0] phase_acc;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            phase_acc <= 32'd0;
        end else if (!sg_en_n) begin  // 只有在使能时才累加
            phase_acc <= phase_acc + fcw; 
        end
    end

    // =========================================================================
    // 2. 相位加法器 (Phase Adder) -> 引入初始相位偏移
    // =========================================================================
    wire [31:0] phase_sum;
    assign phase_sum = phase_acc + pcw;

    // 提取高 10 位作为 ROM 的查表地址 (因为我们的 ROM 深度是 1024)
    wire [9:0] rom_addr = phase_sum[31:22];

    // =========================================================================
    // 3. 例化波形 ROM IP 核 (使用前 10 位地址查表)
    // =========================================================================
    wire [7:0] sine_data;
    wire [7:0] triangle_data;

    // 正弦波 ROM 例化 (请确保模块名与你生成的 IP 核一致)
    blk_mem_gen_sin u_rom_sine (
        .clka  (clk),
        .ena   (1'b1),
        .wea   (1'b0),
        .addra (rom_addr),
        .dina  (8'd0),
        .douta (sine_data)
    );

    // 三角波 ROM 例化 
    blk_mem_gen_triangle u_rom_triangle (
        .clka  (clk),
        .ena   (1'b1),
        .wea   (1'b0),
        .addra (rom_addr),
        .dina  (8'd0),
        .douta (triangle_data)
    );

    // =========================================================================
    // 4. 波形选择器 (MUX) & 方波生成
    // =========================================================================
    wire [15:0] duty_scaled = duty_ctrl * 8'd255;
    wire [7:0]  duty_threshold = (duty_ctrl >= 8'd99) ? 8'd255 : (duty_scaled / 8'd100);
    wire [7:0]  square_data = (phase_sum[31:24] < duty_threshold) ? 8'd255 : 8'd0;
    
    reg [7:0] selected_wave;

    always @(*) begin
        case (wave_sel)
            2'b00: selected_wave = sine_data;
            2'b01: selected_wave = triangle_data;
            2'b10: selected_wave = square_data;
            default: selected_wave = 8'd128; // 默认输出中点直流电压 (静音)
        endcase
    end

    // =========================================================================
    // 5. 调幅乘法器 (Amplitude Modulation) -> 任务图中的最后一个乘法器
    // =========================================================================
    // 将选择的 8 位波形数据与 8 位调幅系数相乘，得到 16 位结果
    // 调幅系数 amp_ctrl=255 时代表 100% 满幅，0 代表无输出
    wire [15:0] mult_result = selected_wave * amp_ctrl;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dac_data <= 8'd128; // 复位输出中点直流
        end else if (!sg_en_n) begin
            // 取乘法结果的高 8 位作为最终的 DAC 缩放输出
            dac_data <= mult_result[15:8] + ((8'd255 - amp_ctrl) >> 1);
        end else begin
            dac_data <= 8'd128; // 未使能时输出直流 0V (中心电平)
        end
    end

    assign dac_clk = clk;

endmodule

