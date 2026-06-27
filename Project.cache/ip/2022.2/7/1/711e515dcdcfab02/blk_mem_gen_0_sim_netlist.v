// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jun  6 11:39:01 2026
// Host        : siyunyumo running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [23:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
        .regcea(1'b0),
        .regceb(1'b0),
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29408)
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
