// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Sat Jun 27 08:16:12 2026
// Host        : MOSS550W running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_11,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_11 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29424)
`pragma protect data_block
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
XLnG1Q/ShWOoHS9N
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
