// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Sat Jun 27 08:16:12 2026
// Host        : MOSS550W running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0 -prefix
//               blk_mem_gen_0_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_11,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [23:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [23:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [23:0]dina;
  wire [23:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [23:0]NLW_U0_douta_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [23:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.112224 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "24" *) 
  (* C_READ_WIDTH_B = "24" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "24" *) 
  (* C_WRITE_WIDTH_B = "24" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_11 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[23:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[23:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
gydSV72FvW4hnoyUt6yZFJHfJqjRQWPUfYIuDKP0fpjrPOkLRbJGBr4Z9msYTvoIHRlYtXJ2YMY0
d1TIQb+FK4gKsTRru9wr397OxuFBsTRf4e+ZjpYZEdsnqYWcgMSzhN4yhPvO06GyZO15y/LKBxa8
3OKwxVlOLYXhv+sxdXg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WHB6Zbfa5Qi47krP9T4L8UnPOlr881dWx7UcYaZfNGIQQM0gadcoXbhucIpRaUuyOKxv6yhKveRN
h0l+N9+KX6rbZ6+TRhP9JAMuPhlpI7T42QtRv5zx9+m3ct5S0NMszbFaK8zeTAYra5BGP7BHmtkr
MpKfLK5sFyaTE/A7ACtAace9MwFTHDZdl9uUs4aY6KJlm6GaypKduiqkNugukJp5vlFPX/ZapJqG
KMtMhI6grhcuYb1FJrwRZ4jW7hs9HxddSdGLzsZ0HsBcO/qaCPTst+ZA0YIQfd5ULlFmPqq39FfO
p1P+2hEH2n+LycbMj5cn4Dxfqv2R8eucM78R3w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SmAzQA1VEuJXtJi5vXa2Jg7YvRqAJs6PX9HTZ1YqrJw4VfonBW3726gJ81BjlizpMkcf/Uk5sFIK
aPedVhEs4xCIZylz7gXYDshtytOA/pXUID2qV9nXr8qfI+FydSADUF3ScYDZmlkclFqlZrGq6DQ7
da3lJAzt2h/iR+cczrA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iAph5JWb/chMQpLPX1UoLjQDxN5l2I8McM/k2xN5wRht7HXoE6F5yV8luDjn3zkI6vnfUYo7BaI1
mogRRx+R3XcwxvhHr+lngh4+/YLVex1TFncl+kiUMAsu3M/FjFSiqGMVMdKTNLDqr35DuZJVyuiF
lTwXob/KkbQDJiJjBEoxbt+968rKRKRyJGcqIjm4mqRBdqMcgo3HOJFG74SFsWAQrxvXfBhdLSG3
OfoLfls9XDojBjp7G83k0h82g1eeWgBfydm/OcX9o48Pst93NvI4ua8WShZL8MCvRWYqWZrrjrWi
cfUjXAF5SDACjq1/OU6arz/Idz6/a7AP/jmexw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BY49GZBxBT/gjZDPyaSWlti/sctckoR7jK6NuWdhnF9tiyNfVU7BqjjwxSnyMi0Uucv1BKHXC18h
8hQbFWnNtrq71ilURotXux7sssHlVJ2i1CsJWU18DOcBWxm2ai89uwvxDJh3TJkBJixB5KPvsDhL
lWOjTvZWPoR+Ixy+Tzo+U5Vx7z7SOakRwTrn3u7+c3vmCEBphE+HKeJExhBAoOEd0SXK5iwXaByW
D7Wb7zq6NNUmnCyaJ2BG9kGxLVsf+md7SlocuaFsYyaRZhwPyTucxIlz1tLYwcytKzx0ovoax3no
nYgzlzP/F0/PDWk9BqXgr/tuclc4EZYX0cf4ng==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qGnCvL35qO7cbUEKCL50yDv1UvezcqBz601zctKop1954QlcjemzZWZHg1zJ00nJaToNdH2S8AKX
n8hNJvbQ+x5HEGL5DoSU9m5qjXd8xxocnZ0yzuZX/dGCT8kDn3gWJR2Gz13pT+w2LQUno1fX+MsC
ehgwvjBBT6GeYjdxHi+aybQUP9AblSxX/z3vh857SGCPohEWvghOgORCHAe45YD+ZWnL62FLxMM2
c+Ozq/Au/Q4q1Yzlzcfv8Mnsvg7OqOeEamQHbuYOfdkJUuYqOwsskEWW348u7FXtsf8m7P3pZyyz
IWyTDAW4igGguMPLHfbtK/twZx8ScJQmOKzglg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hz+6K8+wh5/fukU4ZWNDXGsq6hreSVCSPP67nA6kUz9Vpjy4TtTnOrrl1BWY0ivEC7Ldyw8VI60A
VO/WPlt409LdAZdMZGsEZ1JuTZ0m9LPcgu9CPCyoMECctmd8LHE+otY6etTmYABB9syY61rk2hrv
RgbcyT/HCK9TzWxSm+XMqvx2nvagCLkMDPh/JZv51fj2zcKaBPnxsz8rnDipaeo0fEyVRC3Y1F/V
U3RmXojBjIumPHSJkQ537dENJEIA0Ra65u8EM/+ItUn1bcryLcIbKy1xGadrHmHdHRUoRcAodO2C
B48bNVeL0VnGg8P9ACIB04lMNzn5p6A1tPOb4Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
YDpb+UeT0rJ543Q8wCo2xSS3gpVAT+JoStgBlV5IMjJoUOWkiOPn691FGChmDi3BTq5NxC73KHHR
1galACCjeTGq6cv+0Zc2Ocm1oobdrnSPHp7TMDr5Zle8FX6WywJCiGdoWBODggZSlbOASIK/PVfY
cZM2z60M6RSvzsi3TnYHiKYHpju8THVoSgRd6r31GcbiSy9TjjARERXan0OVc79jGuAg90mmDEEq
91eqmn6NZ9yLI2fgBjFUZbtFCpmJ8WGxOL1h39niWnRK3ZXnk8jcpnZUlxLbYTPO0Z3vVr1zrvcn
RVQloU0OLqg7M95zSs7NtX5Vzvb6jGbMehWV+WMMyxWmxL2XOwsAwPSeX2dI2r77pioY7X6VzH7f
/JxMAnq9udra3WGPsUkD1G0CvPkCC3zdxjpVaflY37ztX9UONhKtzMQa8lJc1IL8GhXRY3R9Lg2c
HIeXSGkpNNuFDqKT6Khe/6Casq+SjFJq+IH9IUtz6RUZTkbFb0Xhgm2P

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q+63zFEYw/LeMgxa7g8g79GGvSyIKDKD8RvvC4DHDQuGObf6n9OGZX4e17v/E/+EDEwUhsWQHFDI
Lp/aH+6fNRmhu9BEWVjxq2WRrQSl4eQjfIaSOXu2dlYh3JjRJwiUp4LteVh8RFAf5t5sRQO4dRIK
x+h28yliSgibaWEAv5FaJQ1EFbNwmgedAaSYjgf2A3afBUcBh5Uy9VHbW/zRzdhhJdsVNBjZYcFy
CVLOcf1toCRp8J4U5FlnFMOzFegUbdXFQhq2VmIhPRxWjrfTk6iR4BcMEN9UMij/5IHRAeBdksyD
CqEKsyFxosbI5KVMRZ1Ln75Zipn0JdsGekHkxg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DPUa5DLPYRWvbPnX0U412yoWvvvHyuq43DrYmDJGTK0cR5U4U6th8icYgizC1/hUAEzt19kM/hVa
zZh7bXSWACYLpcfhPY8dRTVGDZVjpbkraw0ceBryLP7jc6Jt5JdNw88tZtZpprCB7nQ25lUL82Hf
WTwL1ZqgGIvtfHhxO0JF5L5ES5giedwQ6u5ffXG3UB6ELcpQD1NvpW5lAz4mfXyvVDCAPZN581TF
tlAy79iKbPKlJ2zFn1BS2cuRIHHe2JRxwPo+0n5VD5CXVgg+lCYxTnCxI8CdyFaTumbs4IfAKwVI
wSN/btbwDUhW9hAHWHIRo+BpdJ4qeGcTDPKtsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mf5hcf6JE6yLm0jNCQnHMVmogjLlPz6re0FwG67yvOJ3FuEorru0emIeAKEwgOoxjUYNWvcM7QAH
/UEeB2EIdjLl6glPAUda0HjtaCU2rdncVdM8k6DSMBggc4yo18Qx5F+1TD/RoBgoo0jNkMdDy6wJ
JHjqlN+R01z3yYIMQ9f2z6ZaYncbBYEp4+YAb7g1D7CSMxP5cFRpQznRpYp0JwqJfT9CHzlKgdab
8B288NxeLM66iYodiTS+GSRGLGtDWXpz9yeiuiPe6kJxae2GJyHIMSfluO/0Slc3m24DQNdbojf8
jdc0G2UnrDe5mCUTfYiDmpOWTUJOdYo0FK0N2g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29104)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
