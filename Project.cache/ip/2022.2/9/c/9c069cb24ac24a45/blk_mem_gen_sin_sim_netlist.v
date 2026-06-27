// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jun  6 12:05:03 2026
// Host        : siyunyumo running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_sin_sim_netlist.v
// Design      : blk_mem_gen_sin
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_sin,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
  wire ena;
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
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.35165 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_sin.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_sin.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
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
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19360)
`pragma protect data_block
kETIGecr9BRmn7TgBNNN0+g+UfU0jmTqacKub/eTyh8Q0VNgqtBCjjAGYzijzZUxhvZ3gbvJDsAd
xKpqrpbtHHk80lZmgaSNAMjAc6Sn1JVvk46eHU4YRmP1lo2Vs1f1X4F4eE9HVN+gna03xcD+BvBp
elZHxllv+QOpODxq/eIYZ5EdM+yY3PpGAlwO2TqQ9BB6MJnHd7wSmX2BUTPJWoloE3m/VXZ0emgH
R4zjwPUAbL9MRRRt+4swggLp9QeT8f0KPKRdHdfuh2f+NjC4ENLF0ZzC8T/a9GPDPWkPoFkrNNed
57qFb3rnQ8gz7qz74+8OBHgvuhdiLxeNpoYre564GPaTSETjyaAJDG3OdgNYFvqRXiXHx0aBGMnV
OgBCe4GEsS3l4NhqBOpfrSYDE7Gms1/VZywN6sNU7hxD2vAPfAP+Fi0sYSvggcHx/JK7Yyp8xfdn
z7ft/5+mrMzGKYUasU9TiP3FS29Wtbkw6rz0L/2CgKlQLyecISpyim81NSG4EF7sqmoj12xiK6CO
18K4iSttqcTzTzxAmpxSbtMi401FvlsZsvmM0jKyTv5704w/2MT4N9MnsTpyzFvXtYf+GPL23UgU
O6MRAgj/llnS+846G4Xfm3e0mo5BePzoGuwP6zNKNzVQ80EZPJslY4X/XZM3dczvDk/An7hndZ1c
H6ZjwE+LCu/FoIWNsD+yK1OIycXfZTLSUUsKTG+lsCbIGm23TjMJtFAOKarqp1STc64nb50yC/DV
oZw+zm72/etAPC7g3HveJuZxPpXmdahuAmrly1lBEIXOUl4NW16sOXDc18aVHnCGQHlIcqf77gaB
n+WwjhHEA8I+MEo1BXlrvFPEpthAufEFR4Hze91NUJbS69XcucnazbqpCljKz7J2Ymt1pp6lzau8
W8N3PgJ8wdNdalsUPRnZ/N1sPPdjT+APS4zIpGYrTtpLworsvHkCnGHSbzkyUQ/zKSJWKCc5zHjG
nJq0XWlUeGVRe+3bQ+mYjZ//RorG31OSDpVJpF4NQV8qyJuLSjRHjlbEuEjnt4Nk0sZiBQaebaeH
77kUIRR7RjKkVamphXIxDhxXaUKRfarZBiJkGfFn0/7SXbMXGk2Sf2ca0k90FGt7ZhrA/G+Wp+rt
4PVhKuX5P27WETgz6qm3vMkiXyoZN0kwoHLiPSaz1cspAm/A5C4FmVOXe7j5zcEFGUyKSM5PeaDY
AgT/ZV23jZM9mwpnQ/Lx7UYJZdJH0emdrZhkvVdHAcdnPPkQrSqGaUAUqY55zDA8Ee0Pf+8HEdJi
g+wvKGmbvzmFAa31i9b/DSstHnizXs+veSSsJUL6o7RFWNxnmsR4N8ktA7uqFGwSxmrENXFiL0E4
2DT2865z2yJjztkIpkNxgDMWvT6Z7KZe5FfVErDlAVwcUlZ4PFIh7yxHHTNP1rWClDvqq2JKT3De
Sd4h94PNvfNYjE1tMazBEmRK1UeoMR4K7s1Occ0cuTFr1ubFLO54jIC/letqsB8W5QFV91Zqvzay
gp9CqrwyUfjn3o1/MgAhEL6wpVi7ihMxgqjyHgNMYNXWJpxB2e8JDhcGZ9oFE6pIXO7ncqauchuu
M/I+nN6sppZisRroJwmzfw27A1Hpo/NeZZUx8pP/LcC/f9xdurHWGMPG/QCpzSFQavPNdDKE2jVN
KJwJ7BoqdPf6/u//nDBxiu77lPyRyDHnGwchjpSBqVMigS5h8XAoj/o3opyeEM1BzIltqBjDMEix
zcJ2yMZdB/vk54dy5h6Mh18s5bMxH1H9LItkEYH51E4EsypMr60Pc5T3agc0W7t03hG305jE1uQW
OiLfeUATqT5mM3KM9K8jnksi4rCOZUrK1iU6/TNygbRsDXucnufyB0xZXwqMXmlkysqfhZzhEhg9
ocmUZFUl/qpG8NQaykNSAhGBlMk1IWayKbAdzkD9pSqnOmxfChj9EFD5szbPEJzBadQAeOziVCUA
aVmVGRJZPeT+1/Xl2WP7rL2qM7nZli3Ibe77+XZrgk/zRePFn96UviUQn4CupuIeiBDYt15I+PSb
NWswe07ixzZIuSBIO7QrKzUtArZILU4r7F445W8xBfVxwAkivUbJujnUtTDLs+LvYnR0Oeu+M1ml
n46gaKp/4BxKBUnsOoQ2HMBSmFc+mv7vursuz1N1Wt7ECmTzqEMH3O/p0CjFarJKf5YAu97F254w
aGFEeolrf8NxZQTLX/vSYWXhPNVNMDvRkpX0sSKTUaDCevPoE70wdEG84fpDR0Vsw9WMhCVJfSuQ
xXUvfd4LOiKHwPjdgdsTPOE4wZ2HDVRgWZTGgLgA/ILKoW4ugtQZz8iPPQ/HgUMi3vIGvhqSlPsi
fc4KcVZAKCxn3p9vTRRGTqBQn+RES597o0tNETEy9BQaFcPxhz5eskNqVdkZ74NXQDg9VKvM6+op
6MH08ga60U63WhaJDsrIlTNaLcUU1Z7GlFnvI450wZvc5Pk8OfI4LnAlgVgH8InjF6D248vQujf6
bXry6ZmAM0UKdRxInnTrXjKBWAu4CedOHAWOY/cigJcbolEF1dm2cVJGSRhu/J9YhIUu6jNBSIBu
q0dEj18dTq9k4HIDIW2AzKxxqVrQ5n49ttZwOCGMrg3mal+MuevI19u6j0YO2b7GiYA8E8p1g+JS
x2MNZFXtIAt6dJQhvL52HlIN5cWV1PMnAPhIskVI3mBajHzjIHy0d5VJXxO7Js1nu57BLJadctmx
xh9NSp6ezaCX6lV7z382Y1uAZ8h0U9EEFMZnpvYt1H8XjJ9bOVdj37tp0+KW30BSixNLOZQydXTU
049cFJzqGFv1SFeK3ouVDdk1b6QAbsCPopkOWbtQJy0Cjhurlt5Tv7ZEbtAvOJ59l4qHlf1afnKR
nlVzOA3UZPjq6AFLowQDbu5eqdVttZOqsFgJ1bnZfeahefoWagAsf8T3mPjENf2StDb/AJ4AC2dq
6MzPMnyHrthBTgb7/gUIaNROp+cgYrufFK4QONA8pGvgGya/ojTd7j06363zq4Gr6vboiUU8EVUW
dDs9pnTPZgZaulW0E/M0W2uqoU1LJ1aPgp6tjxLTsq++iy/+4VMX/91GWWzaKYY2fBHZwDA0yUxZ
g1Qf15ML3dmBJCnNs+9eWobR9hmNYJv6kRS5Fzg0xGXa5Tc8yMs5F4Yk5XdJUNkSJiqIffoMyJEa
Qky2/FCNV1ZU9hdqr7Dnsgxl7+yBCEH5AvfumoX05JF/d6P32uvt1DGB7Zg+qGVsbxYdfa6unWna
nGzpga99TLdGxKP7LicwcqmWYtC/2ozvXISnLQLImeBKJW4wNa7pKWo41t9AdOEDBxSisLra596z
fVdmD2DJPcCs2/GIYvVZjXWe2xiRmB9YEfr0Nh0V3FVM9JV3zcndThg13X8J7Br+oaUsuSt5cgRR
1FmaJY382EkhDdBgQhEBix9BpnrtolIc6rk6fkIVBi7JpCQbc+aQVrskkynKAhVZFLjV5z3D/2vX
BUUNZCKsE7i4cBPOG9qYIz4IVyEFg6b8Dde0MLv3U6agjiCKS/xaLPk3iG67/k6p+kRCq8uGeU9h
iyKt6cHzvqeITnIfnxVBAqbhFK/fHawCE+XYSe6/72XVS4zW59ESADeRky/eO4sTLVkoQsNd0oBo
mDPgLrOF8vwXkhBAzIfYyxo2kxPSLfjQLqqNC5DslnjG5bn6R4g3WhT5nUJMoC+8ZZUhBZAD7aK9
1/RiBp8NZEtYEox0ckVDBeHxs/frG/fx+a/QzXtm5B62LOYq6UBJuFJYZfPfT83erMeywZ+Qd+ET
EX1MezuydfggkOCyLhQOSK5gMy92U9Mfd1DCxaF7jmx3DXRqnpwoxveRKQWctzLomFmNoRjO0z2w
YRM4Mob6YVcl24ldWQZBuyqn1AJcpQACbacigSWdUwg37JU57YXbBjtvv6Q858ZeIjSYamYoz9qM
la4ltv+FqHxEHaFa1glOvMA9h8HTS1ZdnH/bl1JR/OPX7Uzauar98nhtNjwQyVd1GTBRX/Cwr0a9
BlXovgvovUZy+EMZfjxx+ujrmT5MSiywZ5OLqrxwgc0ltAkdm94UUd2vxrqwnwX0GWS7snOrBNue
wP8hQre0aGNc50LT+ZID/zgck5maMtanpbcZG9GjPDRqyTzb+e/rttqqgUXCivFJcbLiTNYAUPtR
kCWSurbEVEKQ5Act70W0RBAaa4H4aGHxkOQgLsyja3A5/d3SwXM2I6GD80pMqesFgo7NN2AffceI
BooGPqJDzKEHgAV33T6gbOlkVsO89yb6rJ2g31GKgpqzL4N6i5OZ8OvaFgd/6KId9aQvxpsY+RGQ
dwH86ITKhvhhyjWGj3HsZv7TgZw4KcdPpAX/+YGm6UypWGpCPueFXcR96SVmTtz0+YSVu09fRm5N
ROs8rYKtTN5oKs14uR9s0Mc98IUfvXgXwaVMvpE1deO+yCA2XJGdUS7UCHTTrreR6k8PM5V+fZBy
ajSxofQXv2XEicS6TTG7+nnmHH0SDnKlqIHbmLI/wy5FlHyusi8T+iCcZnCMzL6D6hM7jXZMtLz9
TZ+GPj6NGOXa2Ly+BR/7EJw8tF48hgBGw9rDtfm6STaRLUc+GxQhtAiE6l0YMCcKmx0N+IWLJnbO
lWnEdlkhso4nhdj6Lts66rvqsuwwq8Ui7qVsDqXtlZ2yeDklX7F1npCAVnzks11nuo50l/Uy5sdu
Wwk3iyPkUuB7/4OXRDyRPjdljGKOwxFPG8yO1VybXB/SSvpqEzrb57YbwCHHqJaMaO9oq7zAMWNW
kbc0I1AmxpP/zHhbejQWX54YApHamgwQlHkIfNwa/EwqR/E2clCfdkHRukKJ8YlG6rLq3xJVe2H/
4GZIIIxUZkk39coXnqazOw9qV/a6ei+0BaREXnWU5U1DJEt4FfqtJUYv3MGt1kx9STaun5/Jy7aP
JQlIA9KeYznSKwkkVjsrk2p/uQZsGtLndfRbE3fiMqBK9xOnln+VmGxm/gTKhSkyyyK/FTBpsTEH
4m5bFJNF9vivdQvUDpRhUxDxd2H3LDEPOGZPRZtdCHgNuNFPy/e1B310htsVOWH2B6MOTOeY9Txt
ieurHibKxM28lGtnJhY1ur5th3OCc1yN3w4LvwPVIVO2h1rI8fhqPk47NJtzW8Gzk/D5zp7jYtPH
0ZyMS2jgg1QV+4ElFeiV6tq9bsApcmU7PRJnDKfah0f8BmdE/gBI/Yu7PF0yjaBE6Q7M80mkmcXG
ZZkQr9uA0FeRd4IQqIKJ13n8qz/z8wxFjq4tGrHVw3EGS3jUg8dwVW4sV1iBMBFcB08gCyhZcVFJ
qMjFvLhAr6JdJesY34XIXO83yNevu8uNfOxMOOBtEHWuA/tyCoBCsSPptHikdfgNuicskSoOm5CU
KadDdUOcQGF1OGMSkUVqUE15PvSnspFuUfOtWf6Uk1WIs1bS2WKX0MhjtBAWED9LoPnoWCIXDBS9
1T/jEBh3XavEyf7I+W2sEBXt7uEtO/HD3siiQa4TgCDpyKoIFzpjglU0dn2ZyjiEaNvQuN1oNZzQ
cwkjyGd5AFNDEDrYV4JtJWY6XVzbAYpPz2LlLgCeiNAWoo8jS7o7VDMjINvSK8R1hUke9T4rkkXc
5cPu6gDJdw2M51fYF4XL4/+FBf31oX9QhSaNWIUusXe0EBg5XrJop1VXISDr7mzJLcgZVbH439q0
/W5LNuhCsS2yF/lkRlt+4jqPUxRqM+CGeeLIzLKcX7P/YwXTpbBoAPX6pJcmMUo+XGU2JzdAic6s
FMLSOs9CumF8TKqkW1pOxhTfXuYRIC6+XD70PxHe6zyJ7avuTiu+sDrEJD67Jsl6lY1V1im3bejg
JV/zTWeUU2mBcU9E4TS5EB9M8cajGi8KlN6F0tOnwmM6pzPNuR7OTQByvRAo0iGW1Q47QVBel1lM
dH2yoCrkAeMEeHmSXHz6dFmo9wO8WzXpMEE9KtnvTGW9oX7YR2ULOBypxh1RNAnyd3ldknXgukql
9Eom//gdmK7scgDZIcozuU26QanuNy7BtXI28ihbC9Jnh4f27KU5GfmkqKk4sjtbU3kHTQvf0EvK
QQpBhhOLXoxCqaMM7AakPC+q8QBcJdS+1eOhAPjyQrphYBx6Qg3lI20b52sxNiSUyJgbsEBLO5RH
Wfi5vzm4zq6bdYsqdQ8PJEvim4ktcD9i+/QDm2eTc41bJCiUSMxM2MbN7YnEUeSGdR4kZMzCMMX1
/TkoiarRUjqsBnhABtk5PpbK3MeJC0kLRW0zS130pN8PxpyI0u+ozN4Iw0QjEyO6NjZiArpwlgXu
r5fGfFEcPLKjtsz/Su7DOoccgNoEipQqlRmQGVjfzPqWFbURyd6L1Mtw4KIYqDbAt5h2TkEZ4iPq
lCGzQHv2yrhAYQNjZYV9vfmZajdcvB/NYpODSl4TOfbevZZ7JR9HwXcuajAxcHjNLHtpzzHvLfOY
J29ZR5TxjV7DPfFOfvTl1yeyQAjxAaGF4gVSZkCfTSTL7GurYRsEU7WeGpmq3eln6M+kU7bV2hIk
MLkKB6MA//c7Piy8yBwTcU1+3/o7p8xQXq4Hu09IltauuRynihuVsrCxJTZ4i+SXA1JaU3b2BZKc
DTuAIh/Vo6NJeGRd7VJ820aqzPMs+z4oSGcqE9B4UIZQF/zr0YFmx7kmGh7cstVhNTrgRhHfCOI3
gYhWHnB0AoEbTZ4bYMwXLDxaZ2NJ+SDWZcExJMQZRFXGPNIr0yQenuPbuF8uKOdMj2i8hc5LweGC
ORAfvVrqkjbga8KID8OUCyJHloLF+b59r1ntKVRu4EWngKO9+sACXFQhkoWLAgDsH6Emfrw+3J05
QtCESDq5kHQ4Bw/L+GBPaOBYAAByJytpdwprpDBST3/S1zpfJeDz7FF7e52jxfbdj8wWULsZLX74
hLUq/ogokhR2GAyD1/+bdpSr5gtu75L0KZ2bY/rFOs3jZia48Xp2ePGwHiDCI7hK8Gt2QO1E9PTh
sHxlhykN1QLpO26gmsYBmy/cjjYpEdsCTcNutOZG0bxbUeiKEIodOvpuAmSAJ9BnF24ku+zJJLDE
POJO69uOp2iquxYNg4o7kQk6rMIPitzrOd48WnWlCKGKmd+iWJZYIcXqM5GsFCG98TVfGUCkKhO/
gr7wsUAetPJwTiHVkVv2BRJbPSKbW5z41/yn04FAge2rz6t1q8XVL0/Qj9Z3dsa0lQFpwzSDVHuw
HDah/9lX4cRU2T58KsDazX7wV5jm1znYygLnui9ebbqV1jPE5noWabXcLny4kb4S31ZFEx0I/Vdg
jMlir+ilBHWMrGYP6upjgoI31WZ4vtW/xRKoIaMrWAKzLsr5KZvw+7MqOYZpRHKlSMkQVPfHzU8y
SFSf9x/5DJgdXw9Lp77sth5Wg5z1EORIWEeYBYciOmcgUGHquDMMgI4NeMuWCs7jG0Prg814WP6C
GrYVGqypK/XBSfPjbiqhwVuer0vzthi6Gc3AzTw1t4z7Bn29cF328NKaz96w/+Pq+IIhgUSet/hr
jQ36OdsxL91MI5tLcetdXi5qwcf0Wc76H4Wn1WjswNwMWrtRvJes5Huz38tTDl2UDcpgybFHcJym
rMpO0khPa1i0n1SsGc3dyQkYJqapmIfVSUapO886ereACP1UKKDjej5KUQlSSBnfmRA2f+Y/lx/K
U9IGSRQTMGILR3YSoqeqjc1tufLqYGVi7sKSxuwlCIyEXXYcKvf3mmwMSMfzSeIu4IfJuXDi8dK8
c6ZNTK7zy914A2yWgUaARPl2lPgaLhYdHybBRKGfPmHHpXFKwWqyq5gPSsBGskAX+5MAS7ojf3FF
BauXM2/T1PkWM7hMWwXbZ22vosxydQ/o82dPy2TjY7avCnVYiq0bGevwnFsmfQxqJYHLo2ZvhYbN
HRCA8GeAe7C+B1vtlMn3Z1/2i+Yk4Vo0VBtBP8S1QgXsEaUjJ1h68jb65DmgvoD8uO7UgWRaqjPQ
ZA3K1CSEVMMnECI+46pJpPumUGDYekVZvUWkGEn0zcFaYEv7FYrjbWbGeEGY3YW2/t4XjwQDqkOz
nyVppXEqhL4dHB3JXI0Mewh3BCYDT/C3buJ9wz5NcMJ1ulqhMuZIDMVw0Ii7gW8V1cylzVM04ucf
XpNV3wZhdanDf3heswUW+Q25U3USTCOMfC0Fb4x79xF8PuE5PcI0czuJcLw3TqGkQzksbawPYu/M
ZH1D5HGMWUTjg29zc55J0WrlLjUlDr8x7IBgqdJqrqqfpS9SbLBc1MrQrtPMyHJZcy2ydtkVxMd6
HKT73BR6+XtotqiK15AuVU45EdUe6luuO4tRzqpaBeVsnWJw2iyzUlN8yD6dPLG8Pyiez8cG5c61
g6dPaaZN6Vv1S6MOc/ZP/M4g2S5nTLINEvb/oDmOUUN0vGsZezZz3b7xucRzRTsPa2n3xw5OsjLY
oFkfHFdCPtJDmcgFhLLXEg/hNW3Mg3wFCiqNmBbsjn6J3pdkftrqSeIDz1/YkwtllGyYbNCXUh/4
VQl2yjJIM9QyEW9yP1W4HlWFIVPHc+YG99uEN860QChwWKnUmzf3ZaAa20cMB68o6bMWGzPBTRRf
5L+O+S5LE0YBtQ9OStCIGBibawQxsiHgVze4kfVnGag6FKLsh9Spj60RELaOn1HDVaTJd1wXs1z2
61nEkecDcn+zBJ1SKOb2NdrqNU7OsWNNX8S0D/yaQPLTRRlslmIG+J0FTnCjLjqCOQ4SlN49DJKj
L6ZPXanVfJPjwrt1nq2mo9khxbWFImej+eMNssIMkI+dTsM6goKVMaRPr54PenuCHoI52CcmW9yp
IjAXmqEuM4ICcW4lL0koOtd71r27Wok0++Kfo/MpezpP95O/SXkiWJCozzOeJeavTsLLs4jCikzs
Ae4eBEVVSBM0WOrrOH+/9G+oK6XKlIaWNrMkmvbaEkPSEgm2UxbB3phZ6B1guT+oHlvzB4joZF3v
G7+ry9Lfrj+rHH84jEAJZgtFdgiasf0fJ+s2hQpWEB9AgqheJ74T81F7qKq2sVZIJMD+ODxpnXAL
Qd/zgLR4hfOKP1uxMo048s6R6gGNWSWsicDOUTI0cBQHsLp07IFPjlxW8Qgybnf6tm0bcLJnKT3r
W2dWHPZgFJ23w98U4kBygXvdYoIthzYh7WtXEZq5AXEgvtOLo2KdRGcASsEZMNlWLWbdE/mUUHF4
rKTsY2hnUzc8pBU2rqOXcgWhrJB0xcrJ0aDUOIqN46/s+ewBf6cdyzyTopMnL0a1CeOVF/UAhfyv
mBWZcKk/smJvdOF95V1/wIg7Klg9AD3v+WZVrCXkgBoVbUEYOpgJ9a9DcybW3ewjr0jMgwjQrvvy
GfIGPFNBWQdf7qaBMICp+i72sgbiP9m1N8c/AKveg7r+P09ji29mQS0qiShA2mKjyigxf4Hw38hk
nnq6j1oSCUqlw1n1PSuruD1oJID0lOTEqS5JEo9vjbJ3KteWri7zAkXBUpi934Lyby4UP42Tn4Mt
PBLZ7QmhjDCLwSu34Zrygl6z1KJXkTTPa1tyH9M7ToYfDldgWx2WDpRexwnJhbi8iSY18HEFJTJi
Vk9q0kEYWeTL10EdYfmsb14y/CVgVZlFRHobSzbAdBfmgwqCqBFlpzoq6Unlf/2dJwMpU6cYRhPt
oallbjZ1WINFgAPuyHApd/pm3hQELIFuH/TXTtghq8zfjKGDYRcyGUEstHb2NFPptcjmJHlsxt3d
Az5lFGyPOeRPONYF6PD46o3dg8p2+joQ2SIspXxQiS0XLR+yXyRcoCfm4OQ8orLji5ZUklF8HQlq
bzPnNqhpWUxDLQ51gtAUtb4eEWRvh0gTK7WtdmxU8S+bThy2zCNjlEZ1Ltbk2Toup6d7ULuNUSKp
PBB0AmMBkgVftGY9aJSBDYnCW8NuY0whqx3g43dDlSAfTr83FiNwcTihGoH5lsc4KXg7Ep0eRZKo
z3Xblb3YwOSDU+K4qCksh1SHHf0I2MR2GfmArYYz8GL0a/ekkTdK+1XApPlBNqq0Z4MHWefFPqmh
ic2T99Yp64FJzMUJNCYAbkFSd4ASPjE0IGjV0N2u7tf0EJT6lfN21jm53fa6meoD/n4M0pqon22Q
leI9YkKCJL8fmgJo2Ync33BbvWr7Z43CTCKXfPP07Dnzf12IBJcQVSkPdxVJqS5mSbuVZc5cbjHK
WKiTDgZl9GAkz2uyPIjkWQ1fjNen6cRFlYz7AFAmW55RiSOzMly+P84IgoiSa1vWn2gurfeT2vOD
w0Ncav5pKd+pDBTlUKnbm71EQGwBi1tVoltXNYQsaAPhGJwPvj63rnQrlH6w4zHRKJjcJuiumtTI
qGAd352Nsd0vMwtW/e/HbJub1K494IaCsMz3un08hlY2Fy4y/FuSVx87w28L+bsQMXBLEotq+hD/
QWoFpksyZnpAAgI73eoxpXr/udRdj41tyvz5JbHgGuXH9AuM711L37PunQOKLh8/pXZ2UAiKmvFI
qFAIbBASVNY4g8I1cv4LC5vSci2EMX/oOZGd/tATyrRdLwdwzq6mOMtnZYExTIhV3zS0/ezRvaY6
VBVSqYLuWresDmsY0FMyQkPLYM6GPc2b1F36bx7F27v2nK8aAhXqghzlkJBZg548zjTupEcxpSgU
XLn2C56eHx6E6IKu6gGVe195OX1rU2RzVkkxniQdvEusKN1lT5N57HPBuSE+llGaSPs6Im5PjenI
3mTro8C5ddqu9hce+I9I4440gkkZspE+lQhaJmtKtA0GCEH2s4HyPqjlY034emDpVqHskQWx387b
bnxn9M1BG/pPXdAFaCY42gTkQAuRCGUBuxEkAgtcW941VA/N2m2iy/bSJ2Ph+ozBl+k5x3A3/KDF
NTsvpeZ9Yduw5uqdMv4/A8mxPpqNzIlE3j1Svz5SszJaPOQ1gbRCDhsn1CBE5Y0tifkdJEI/Vni3
jebq6TV8kXtegJovwtNhyR1wAxJk3eggolSs3EzoLXT8maS/3lSpWfKWtKOLn/7nny5IOTrW9Fuy
p7J8h1uqOM0kohfxgql2i4TRBtJXwD/LDhxE1GBxCJOKr2+IniXpeYMiEkgKDtaPzwpMEVsEWkgz
kqVO4w/OiuYsWya3ahFYNhvmK/495Sen6Y6IKmoFu3ggwFGSWZE75WGLb3HGianCMy879TuKtQ/g
ZPEiR7V3YcBg//mQ1CNIG4KRPysZLtcduzxr4jJKJajln7r4plsIHUHq3UgHH81RHDxO5ZFnPuMb
8Sz0LvH4wU3C0MXNwa7qPR6SemoAeoshhJtdC8T2l7SneXTBBYf5DCxrYGI0RDNH56pb32B6DbdT
1z+Cv+wpHyniqthi+vOsP6FLrXfDCfD0ARUVYnIL0fRUl+G0ri0h8mggRW5KNmZISPTv95U/qo07
tqD+ucvZph76ni67hKYIuPfLiiDjb90i1+AN5rnX2miVfTYeu2ti98whapmyE04rxere80xNPlIF
u3eRD8GAwcpQSJl2c+Um51a9lhsIct8ADxM0T/q2G1MFvjr3F92wACewMGkUeFExvBjZ9NLqr1Is
VLBMVvgMbLNsXTEh75CvEHJDhk5AF4bjEbpuI5WbEb1tH88FBsiPsgAIj1pSCP9lhA0JqHBq+Hs+
+1du5fTz7AnaA/XHKRGgCcPxj0rFM+njInqH3E5WBSoMOmj1x2gXv2kri9ywXmwqYYxTRzHvDAmO
htV7lU4u7Lc8i2VtycvEJJPd1buutHIbSlsfPnOm2R4pOfwRWPxqG/YDZjuiidk+aBxO4kuLNBgU
Bq7HdJKzjo7zCEyCsfwVVvwrNi0ecA0FeY4RfunlTOHyMbPMDlzevgyHcPd+vYw/8F5oyBoQEOi3
p3Yn2BnNyFwx0DEuoE1b+upxskeTf5HWJhNBY+8uE3gYJxUmO5/tQrOoV2gOXlyiHRhGH7RWLpER
Fnks+O3LhxgEj+rhTKxWS/OQYYyKuHGepSBskNaSwqdc/02JpL/eIvFOrlDE0sh31Lz9O+02Km77
dOgK16C0An1HUyFp3LCW9wW71T9tFPNpU5THoVTEgWtdWHBtENNr06fXV7tMvMMOLoqxNpvKx6Gj
b1HaQMPLsPDdkEf4qjWpMTXAwEv1+wxobxPALu9OEET2eK9iWWzdIwkxsannrda1LFkv02exeFpr
u1r4zVqYHCYGp+Bff/0H5GTA/iTFYyTnVT9p1sMT3M1ozFapzkisMPDT/8oEolXiGDZQ4Zh19dJC
RmSF0eJ1x+LAvRrpJYjcJcL2N9EJUG3Krbcs84IbrlT6nzHXNCKA+VmxoZNzCTEEBJKdWasKhYvf
lRng41RWx6Y7cg+EriWR/78o16txtOlFc/V/PqgF1yA5Z023o8Ce3TP6nb7G435/xv3SiCnSYIA9
1eFBVYsHotBhIyoRWjK6eOST5TL0p1fIJhfSDbWjcvptxo8dl4bS4jdxXD25Uf+zLpmnrfAuAOsa
TigOdDp4tNPl1W4ybtiaKa385bvcQDqZ0fy2JE6bLhzsxu8c0/16JQau8WKY+BvM182kay38QJY/
2Md/xPb2TKqDDwvd7pWqmDx9EwtJs1jhyWzAnzeI5jYMfpncNwvqKfy7xOJCXQJE8hkDEcNaBwkT
n/G92P0QqIAorV0EP2O7QtgtjQwWkdNbMV0Bdo/yBgekgtRgM9i1q4xRPxvitA8Uc1J9HVwndryd
x6uiev74yGf1cLs34kVuf+NyU8dzyRtog7qxlKv1ilotsb47M0Aed/b1iaUbNo/gnrgr3kv6kQfO
b65mQSW86LqRUfmNmNqQ1Pra6jQ7zWs2mFRagmWUCe8mD2MLumrGiqdCSCsfSeRhtB1i8IqZZOgw
lZ4DSV7TBrC78sbLjLipDF2WWKhFbA+aYxj9rql9hmMDFms+8LHv9A/nL0SZb69FWRlHrLF2yqfN
IL85HVC2OAjzFWOszg72HhrLgwIBbQ+fGK/s1WT3ahcb7dVY0AdcRNRbzPJ/Rd54/ILNhiObRg3e
YuuukmOrmzvqWC2YcAAexnk3SbCzHizrGGxvlx/iV8bXtebqzBuVi2VzqbC6KymA3J/hclpGC7Y1
zDx6ZCj1BACl+0xml6nRAYLxwiJ8cnBV6IXTn/QX724CEW5vRk4vwoagCTA4N8WCw78nDHT/kX1P
SP45jEx33uQ9jlPTvvx2MF/EQIZEUPyV+mK4jB6oSzNOZaliV+fT2HtIvBN9/QB9X5HUI+35g811
n8dk6uuTW2cYWLNZasAdCTvsYNGqju2tyEwsEXizn7Urs56lDc1Ezulf7/xUBt7vILvM2fv9Q812
n+l28xL9UyF87aNh8ZhjUYHgXSBJi2JIz3sCBMVwbYyA74JBd4e0nFN2Mvl5x99qWbO+Kc0QUZRj
/WfixJ+6DSzfdLIvNfYAk5jSPVYBMF4Ljk38VwB32I9Ozp4iIgS/OOmYKTcVlUF0yNETotDfKlcF
Y2vHWW9dmTJ+vGISOgwwW93O5hXPOrv36VNDMYLyJJ/aP0BTEbBBJH7TOKRWpknK2397yytSZ8hQ
vA9fFgEmV7bToxLR2XMBcSDHD8RH2hf67DlqUq/PyLd+qKMmhWYS/ln7tdTjhjsuy/fJpZ2tujiG
moig1lJLF5EWVy2/F4DIcmDy+OI0iv6EUrEaJ26rvoaihU9CeLPlk06SFeGH+AqqgbT/pGPu+Ylz
xpmh45/ze0tLvREgOotZc0Crf9FptjkzvfA3LAAHUuD6pOgQqwrOLs98ZNdIqbYKxp0/1afuI5kL
2Oj12ou9p//rPGuGeSF01sWIak2eWhds0Z8M/BpuLjoAkLNT9unlRfmaO23FmkyLWAYxN5COLrJt
T0b2CXYbEpp16ubQy4rS0E0uNuKrUZYQJnQf6ugxq1XF/Mi8ffBSovV9acQI68XyLzRqrO9mbitM
VWlpNwNVrgJ83Bhijz0qhtKpZbb740GwalIO73rmn1gKQ6VoEGxQNu5FpyCXSbbdDo5FZkEPnoTR
xSi+Tb0m4NSrCwstUAxO/+UTcshKm0GkooNjIRE2xzSmGUNkVAHzMccLO17xoFLxFvGKm2enLhZh
POb6TTDsglyPYH2mLPrJ9UudgxRIseTZ2zJ7Dq6JE+1JhazctWFP/QPxM3nCX90BoZsXORuP+BJH
yftFfSvVZXm2aQybSpq7yBMub8UYoWPAz9qSKrghEqWJldOjeAK+edlTyz3loOBoiSo63D/xA1tx
fuYiisYL7USd4utEiq32AehyiuAbhdUXUHdpkfwe1tFbxQiHbf6tyI5pfLnwO6uNiYKIm9j/gcZq
4Qx0zEdw+BVqDhEhqRPPA2rk1hkzSznZqeqT52gEgunqmJlhOXqooFFPw7VBsFrwN9dq4/y8I86f
0EETVuPWupGVg5ES03zrLnxQO1HdcL/O3IL2uVGfbS3Brv910P4RobxazDGG65TsBmjGFC2NuUBu
aakuFDCk6TYhU9xZdb/XlMfzdyrf9bW9PH3drW/mIkawcIQ4GXhPE+6A1usymH8FKKTrFMlwqwCE
WRXn61kNfIXd2+NeMhie9cix9k+UZIsEcoY/nwPKfikCrESZQh5yl/ja3gRWNw0wbwQt7A8zx1+2
x99wq7+MIQPiTPMuEAx4JwL0xrOC+o1hUzJjM+OjV7nvfvZNfSqHjDqo7ou/ousIch0Osg5yHpSo
7Y9QSIDH9W70G7jy/s9UofsgTXeBbjDI2bgK33nL1q5w+DHr3qQkvt+4Nlziq+XyV6iNXMhrANg5
go3pwQD49UiDrcNBXfXbDTi93lqJqe6n49MI+dQLqTZ5tdOhDoAj2ryRdM2Hey2c6Q1xKbsOUgZc
iN93TwXruF2Kh1OKL1QnNtp/liA7Bp4RvW4Ccms2hlPPCKxs6mYXNSPdy+5IFq1RJnlWZi+5dZDZ
iz/5pGXSr0RXmzd4T0qCdLvOR/vKTvfYcdCLq2aSCfN48sX8TLwFQcsPNuoIoxJi1eISoaX4vszM
F8ufFY+5d3/Gghdo+qzUDvdOnI0FuFb6/OyzfgBa3WaQdcVFGOZ7W5mixSLNvKR8jdhEol76Bh00
vf3E0reWUXa3pwum8Sbt29D+BVbDFSL6FeFe2bk/3lHF4kpSBz4o+O/TuPUWKfeuWqwe27h/kFol
QaMvjg2etb+S4rbmWj8hwfiyRylr/nCo4kD6jA0J01jj/8kqHMC4Y3UAk4dY/I1D8Bc/5MQc5Q9M
EyvKPnlPYbha+g8LfGuMIpPQ2zI/hJPz1sF1feBwgKTZ0Hy/rZM0d6tAPOvNomv/qKlKs1XaM6tn
+k6TZywBXxQwBqoFUZYnD5Tb4VVXLEf6ZpetnRI62TWC1SAfvF7UXgMDHLI+5g8GP8fN8XpRjCnK
qQZ+Ctxml1VGJi+ql0o0/JnxFNlbLu6FAlmbmAxcPssWkuWEp/K/y0A64+EdM064DwdZtjig7hrx
1wc/DvFxQl4ofG/l1jBDLsXFZT0r6jdZlGBjf45pC/yqi9gza2Iki/LtIlA1pRXLkS8zJTPuHob0
+HKU7r00sATfy2dE9VAtNj+MuE0aHynd5GImnBVGRWr7puRMyMhALl/owv7cPeFdQGOZT04Z7Q9h
nl6s8OL2kv3rfJEsU9itoxsbp+vkNXYVNhnx0ExDG8wTWRq2R+FsqZOY3ll5gsVCOnl1LIc0+OuC
zWX9CCEXlouO1TwUngwwIJI5SgkzvMNCkDp8gSQYPGUTuJKNHewU7Bwi2e2L2fxtp0iM4mYsRohk
pLc/J+QTFJAYZDzhrhZROMgT7brr4iVWjTlW8VrN1NUYpYeNT58z5T4go4iTlR6ghcEcWbWfafvA
EHrFDjVmTU0ahvjlRu4dB6tAjw18EMJgT8GVQVDUGFdN7LeNcVi/heipeQd3KAIUPEWelXl9BCee
3yEoVHcTIhoUTxv7Y3xWXSSQZ7YT89zINhbXyGSEo5q/gmzoRqc+INhI/McF9cMkCff5aOQNZ/YK
/vMzW2JXexnS80MrMt/+JrHrUZzuUTtjyAreqbPriGtYPCQTdXdr2qWZVPcyNn4nDV7GN84HRXr0
g7Vy+J4OKnkkLOKtStzcStguVJPWYWnkDsboSl0I1z6OyzrAzVkc3Ylfd5PxATV5KvV9MaxVk8YG
6AdChn8eiHq4jf1TCdwcHXcH+fhqCKuDmaEEN34Ul6Esj8BmBHA12lkdKKJuooQWTifTXK67351b
HFfETUQ6vN4fUh8+1RlZtJ+qfmOXO4TtWfHQHofsfYzOAV+FIVd1YHSah6bdBk/U4EWqUs9jrqqs
zVUh8eWGueDOgUk8HtGJITNBd0LjShijsxMKk7kPz85hWkwNYlqQmNoVzVQpvlln3fi8ljzyaOH4
bqMCZd0hS2YVVzUK68P9kLtjMI0bQ5dpVA5EdfzSjPa9vbQcDZUfgOz5iXBPTXE/wvwHhcpthLSZ
nd0eO1VUGYYVK+RjS+qkfMOXAbYFlqn0j3IIlOVGcsqe9zmC5faAh1r2YQpT3EOGRnTOrq1vKsP+
Mx9ARlKDbedjB7J5gg9n5S3QR+p+DvrSU4KkuhsIqCyrq4u4VP6wLsvnFx0A5++oZ/X2QFE2Rxcc
9ae6xQUA98SASaokpDjNqWXbmYTw3oE6Q+alolkQNmnE68Kk3j8aKKunCCPMh25lqqDVwG0WvfTA
vSZuDJVT7Q/v3DlPzxlQQMSq1jbM9stq0ofFBg65P5DdbEPFMuhNFdSoPS31jAtBY4IA9qJNoD7f
K6gW2GBdKggPfQe2s/R2oJAyF1n/5/BhlmtKgE5UWKn6naYs2jbmgmPjjEJ5yGVbokK9uq+GNNzD
fBIdkx3aK6mLQqT6TtFKp7+EQqqP06Wgq+j31kNPNjdYsz3P9+DxcnESJoK5Mab1xYBX9rGSBHeS
qwbIMsKJoauqsu8k4jrJw2I0B7dqHSNJV8w5zNJCfMEA4NMUho1P1mL3rBlvicvF50SMqOCEYQoD
gWpz1VngrxEIuHcAmsyk1NdyEFf6FBTF72FN1M9WFAQ8LleCIfmxEtjwhZ3o1exTEFKWfwxmu/ot
iYPc8Qv7/OZHF4HNnaywsSaNJANW3dHihMG+2tVxTZ1JaIK1CMpX72aElLwOz5Ir5TG30MtIzdr5
C1whTZzqpKu95HT2DiTbUSdQf5TsQ+9m0ZNBpBPwBQ6dSZSBHA4yM5jawq6QcJf7zAqoJrIHigJX
NU87lXbAdIIilv8y6X5BPCGUzK9CB/cuKDiyk7/Wc91d/T2ehWj6pHavgQpK4yeamJrz3q3OEF29
EAaZA/WFl62/1C3tsIPve40Ov3mqaFh4DkdtFpKwGrPYmiIGRLISNj6pKypLt+/s7Tls0M38vQFy
jPLHTecGikgBzDDYXop+W/t+oQQh0NRBTbfM49PGr93+4TVoyn4Sh0EkyCALe6sz+Wu4SgdUXXER
tGjH1rn1l+To3jJLn8foL24onpOYZ7PpsCmmX4thgbAjT2P3p+FO2UHBw6FwSmOQR5Sc+/XZHZcb
h73guqzUrIf9KkJxcMvzGDz1pDIY7eNiX+ScfcTUAJ79OhXcdNVNxBY50y8sPKbOq9425hJru5DI
0afbLoTYJXLBaw/4vl2JnZIO69KB/SaHp7v8+4TUPux5WlItOouEag1Svg0KcVog5IAZC+z+79OE
GmFolRbqaDM6qLC3KHpcaiwNH08pu71wrf3po0BrU1ZChPfFACb/KqB16xoRgDVqxWvyCO+C/hpx
VKR4a27NzHRrf4vCfyLUEJCcgAlhNuVEbe6/Zj53EBkr+ncV80Fr3kVd+UV9TM1jrbCii7DMUafs
nEsARJ72fcnH65s51RLESbsrZld+m8qcWc6sLOlnBqUV01P9MM0Tox+2W52eFn/uDtfycffPCQjQ
PgUHKkY7mNxrxYW4iLcPZdF7ZOLaWUZFEtz7768Kd/q22TBCZ7xhiDSq7dCp6Pcr1lgEl+M4PNOS
gwnZo6ccPremqTyPN+6OVw+qN7m5FR0nYcl0BVjTfCVaCMvb03fBXAMvDjM9xzbr68676Rioip8E
8TRJF5ILL6epjHZkgeyD5aM/i+vPMIW33CQInLlyRkMHelDS6mpmPHao9Z3i8n+OtLMeUZCWtqC4
+Z41AabNA8f+pZ8iq5Wb6pgxfCPfYo1CUg7jJP74SEdhuJ8mZsswSxOljQ8cGQ2nIsOuBXQmI7M2
ntoGUAHOK8DIwGnkkC1GaYlkyXnLOU3VKMWMHDj2wcVZca+LDzJ5O+Ia4VONF+lUnmadPMzy+vhK
7MsExQN6s2nm63UpKZGaz4jV/DH5lF11nni2Eg1XPO8YHJSvLqKgonKnB2VoBDAGmOz9QIWabBHF
M/FnDU1bP9CjB5UCtuZm9Ax8Wmt3Dmg4RFUqrs342HqL8N18GoIfEhWjmKUOfNAY/+jJlSj17uVc
Z7sEUO/Q7cBxT7tcZ5Fa19puDVV2VOG9p9OJhibJ2jGq1g2UhTJek3xP6CrZuxA1uXwabkPcSycZ
VO7QJNINujtxGASm+BZsOLQmNw6EUgHB8S6MAZu4Z6ubWChcfa4NZ3BRjGGa3lBXsGJ1mT7p5QFv
/gq0j4HWffaTzJyxzo51p/b3NB2a7BeSyDooceaH68X1I0jYh5ILtVWascbQLXyljkORgFY6LfY2
RzzbRovX23FYuDVYyDEn+3xO2D/fjMpBo1eEHamvYK68q5NxN/f5BSiILYMH8vpMwqsnBFFH3Dm3
XNqRM0HSySPvIYz6U7kumooJyN7MwLKj/9N0KMEgGpsIIs4NOYoKvaFXRNOMIbQM9gv3AxaUtV9f
LvQSz490ewJq8sDiItpTjN609wVgHcayQy1ZuLUi7k1LCGQjwt8qCzMEDfXlHClf+VzjD7AoJnIz
IDy75tJJDA+CgtazKvsSUVQdLelSPVLVHyzfkFyl4iTFGlVMZEwx77Q1UFRdZeFUcocvVRKjYovh
ZAxCrgT1J2td50CyX9sM7hLohLI33adrFFrJ+bxZfrcp2TqqLpzGBNxeKLLuQS65KNKNSai0QmZ1
L0U2wwC731MdALCRPNjO8UKD0S/otLqaXC+VSfF5q2Z1FKWq2KzqM7dh9hSUvbdy0t3Et+E+32qP
HVEBJpqM04kC2zlS6gpcsFngTgxAoQ6a/X0wAh8ivyo6i2+ezMwxuo+iyGkcdxvNvzJLkKEnMYGU
KVg9mhS17dujPuW9w5xUm1EBZYvRyYtPocCledvEAPPomqfUig72D6GAaR4q92ICtYU0w1Po/W4F
gU8ngS3k0p/zzkPFGynPfQFE69ZCA9ZHLqJMs6eBtysPsK0cjfB5MqwoAQG5y9CYBJ6AH66xCu3U
R561190zKKxR/ubu+yUo1vxpYGjaKaPAtvBgOzBtyKOSyH2Lso+XYCXUBX7Wzt0qoFWWh0Ac1KWW
DhmbiFQmTOSTqEzPs217F7G05i2Bdkf8P9FMSsrtBbkE3AhbqhdWQEbsaSNEJYiyX4140SRMC2di
P8X/dlfxiMRQX9Zkza/Zvz86hqCHLe7esWug2AsNl17h7GmHkTV5pd1kyZhcGjf95g9aUmCCDy7w
qtv3Y9gqWlkmlozyD7lEwHS4iXrl8FtlLCuipl4gBZoPF6v9AYZvWWzDYezlCGPyM39vh/JCqpOa
qzWxuaPxjH3Ul8FRn+3bYPI4S0xaARNErbIS0hgMqlnO44PCzlEGih5joSSfx5Cr2rqVwZePXvDZ
t84xFZgq4l16kWSQDYvsCpHEdJ13KtehGSC5yO2H6ZMl+nAXV2eYKI6hkNo8eCctAbLIBeOJJC0Q
gSAou8U1JM5tQAz7Ak+v16pJFl8sPwUeEGqBCxbUAEP2VZ9o8h0mfYeICs4U/kQoCYwSlj0FdxOE
c0zkkIswNESf+v2isNG4+E3thynmCnob9DiYsvhWAgZMrif1yBgeQ4GSzj2gUMlYRMMZeP436zND
pa5YVellEUpXRWCx8Fic0yTWE1oRZeGrEXshEv6339O/cD5jwlqk8CAzTY1Pib7+IRAhlnYjcO5k
yVcLTifKYwI4tlyFo/2mH4J/1Nz7qhd+rDEiwTDb6IpJ6MZDvW3pa+VGnBumouyaFSsMNEa9KA7Y
PcjdrHVpZrNLHYFFtVw3RK+9pvcjbwdVnyU030fvqr4AzFXf26EHabaTKxOivWsmDBFPHYE1pON6
5UTb2oTg/BhvSK16jZjwtxa5oeE3xlEjAxUKLoFNoH4+X//gR2oKUOD3iPuqR7gVjWq2/XnCmaXe
SprEZh/2rpR3nEVUoX/sSRQJwGYsPtSl1aEYgb5zxnuZMkAImb+1OhTkDElsFosSf1tuNsqQ/tvp
WT9GMiSuXedp8mGHKnVhciaP1hY71rLl1oihGRfAjVOgHQGbA+U0h83CUegAv5iehp/wdDdsPXbs
dz5GqtYSiqpzNTKv6Os55/tL0SfOVFhxkaoyFO3hpmOe+k8G3Rh/TkWbfnimEnECSx6kLBhxmqMw
2HX0AnXzOk2aw+IHwUY4voLFfYkHxH/DIBFGoZ+HzVpfbexvzz5U47Wpqq2/Ba08s5li45JMFmgQ
oqSD+FgN315Dt0zaZ4e62pjsXksJeW972mbsBxVbRFAAYAG2HFqEoVv6X52p5PhJNKdld41b+XTs
okVm5SQ+WMxXIBatZr9zk8F31Q6SiboLTlEJEzrV47WbPVV9zOz8FgQMiIOVrhvWDTeWnGgmboM/
EMA6UqnqwJu6lUwpFozlO6YFSg6Gj0XhLC4GkhrR+j9Ommw0kCd1mzdto4wPaRufEu/Yj3YvLm+G
WsP/nptvvlHxvvTItFgRWhWZcYeQl+qcSwgcHI9xa/ylyKVIJWAl+ZEg4cpvJv+i/dUUdUMjazxr
u3Vi14PATuZpOqjUcY4JPCF7NLldHQVhvT/7X2NVOkC+eBhsI7mJuNRR84hWZv8HcjUJsUFWRofQ
LK27XblJC1nAbXU8S/Au7YbKRu48Wx2cZXN9P151E36u+KeVs7/A7/Zbmb2QPjc8s0GsrBqySzDU
p9r1t7nFl7ftwpeSh4KNB8A6uMexX/I9PJskvMPGi5Y+FkPXoLQr33DsmEbgFQijnDK/XO48bDOq
Sv76zlSxGQHT2u+sLt1P7KYuCnVt3uyrYcVUmw3zxEzgzuTSU5zw2EId3xCol189vXyyHTQs7Rg/
PbhE8jIwgut1NBfNiyb13g76ju9FEyNZhy+lqCfpgctRcrwTynxRRC+TjtJcuDKN3PS7xHyGxQTW
FGniEDsy/CSqYLYpEZx2gY55R6uoajvVIICk6+LphlysBKSHHmPtNW+dAOtMxJDDjQDNX7zkUIVj
+DzXfIqmbYSgkVBo/5L1YwWSCosD7k3ohVDE2C3s0y2dRNSah05RqMQv6qfy2p81TVwAhp/3cUGd
DH0yWN/9BgcRWFyMxllZ4BvSi/AXmD0wsYVecF6j0S4RFO3EbNTdl82aPjZocpdIa0OqLZDr64CU
ouQbwwAs3qa5fqiys7liqNr5gKQR2dwd44zBdD0tMRcZY/l4S7Yi7LvI9A6Qgi+MR5SjNeIq9vp8
XC2DyiZsmTpnu8SO74x0ka4iShnEx3yFPceOuW85KLRznbMTRMURoNlc0OiaSkFjtbnf17da2Uc1
TWYDAU/qM2ivhe0qj94A4aY8/N37+lL5gXq6Imz74+EBmNrKBjxwqxhWX6qHxvT/+tq6OTB+bL5Q
9K5FGIpXUEG/JV26yTUHJl4/KW6kuC6iwzxEBwdcRujf8KgPPAftCuFVVyVTSDLZG1GLKxQLA7gi
m6j2gg+5SkSBskvvg6A7GZ6mN//R2SrcGc6XNsXZh9h48lRzkWDJ4D6R3lLPeYy/C9E4Rt1UaWyR
yLbgSka1x0dqjvTpwVLFVgHUnWGzVgdhi9AQk8wr8UJc5PuekkDIDln2UDNKcxsrFZDe6D//ejG0
WdpAnM9XUexVJrIBpUjNHgxugifVQMV/Fg7KsviO7uvAsUyHuIiul/1kKBkyLoJYqM+l4tiIWYuR
/RACsqqXfIt9yvKKnr7kAObAsbGoxkniC90KUBr/5HjRSuiG3119aA2JfXSWmOYYdwd0SMPj2wi9
tm/45H6ogxQc/grxTQlj0g4v7eqaOXbATbj5TRpSnS15/TE+B48MMZmEHNp1YbdSeXFy/R8yZMPO
MLgUqx/N0GPe6pjTk9hEMe9+9sndIXxP20NA6xlCmnRJ1x+MsMfvniF2Yf9s//6HZV0QURavrQVi
+/2ohA68XKEUWk2qS3O4zx9T8mRt3pchr0GO4VOz7zht6lANQIA9+UO5J8ABHXHJMzO4ngyWSyu2
IAX2ZXouRVCCtX6dvYzKf92aoT6epN1B1SOe7aSqr+umZSu7V3515vJ1AlM77hmmu4g8ORdeqohs
5GsgpCvdrsWsTlBugeYX7db3sLXl0xLmY3t0zJsIY1omXpOIHcephKPrATTFwDQYMi6xgnF3bOWs
CxgdO5GGjIJVLlP2jA9QltI+4f807LutzT7iWU32gSqaWLOgB9uDlznwtZGxoUG49ZmTVR5E/XYa
tBXjX960OfvY2R3dGIRvqiHY6hVlklpG95uow/CKahXj6STGBwPyxfzQXuLQ8fwO8nKcP6WNzpmJ
rIWxa4QlL81EKmNztnQc+p61zmXXsvCr+wMKWxdtpzsMRsY+lk8htZbH9BCnWFj8TfWMNTEmoFkH
x++b/dsn4dKi1YMMlceAy/FajpXgYSUXVFWxYHuDlMg7ySITasiq2sXVayGriLB3CQJk/iV1+4kv
lopD5Lqk0LpkMULAcG350/4Kja4fQGF+bf3zd/MqHKri1U+z4k3zllXOTwOSmT259FIqS7DVvwQu
f4rtidY1BGPEnTIeso6QZWaJ5Q3OUdpkmQb+lV42lHP4OtAM8NSexD29yMyC7Ln77xDimqEZjfI0
GFFMxtenWmFhojZwdksqygbbAFA9EOlzXPu57QHpHQNwxr/whzyp/cQT4WsNzvUoLNyWi0AG8eq3
JvfDf5+PJHCIf2MSmSSUiQdtYYGLX2233tdrgguPF1KUhhR2F+GqoseFQmfb7BgbOfg6RaNqLwxH
P89hIlISLz896he/8Ly13RVrtO2Z5xHgg5lKzCwCsmSqaK7OcpTLLddagaE1k9ffi/1d09p2X1ug
OJqMe2e95cccZCNFjimZqXKpGTHsFANCkX96GwdFkXSZQ0wrOngzJC2uqvJC9m++MqKNDOOH8v2a
qlAQ4XWhVUCiqxbbFvHFuMz10pydR6To2RaBHNc1j55+zZ8QRe91/CvtPP8YbtmeV1MA3NCo4HV4
vjieEaWv4WEDSq419hVIsaK4PyiQo+QMGYzpp+n8AodN0B5ju3dVjAzfVs7K0I8awRuU3VYqPEUb
s5y0f18hdiSNHvcepOFtBm74uHxYLgHPb/uEIuQ11SyKyO4IEMXcYLud/r6PcEBgKmjCR4aMTFuK
f+m76rwnbvs2a8ipywBft5SDv2e/upkd0zhlmw5sg09LhOxApW2VY26z2/S+ziGhHDJOmHKPZ6Jx
pLW2wiKRhdekthlNiOjeh/+SKfM8/QLMZbPQ/3XOKyaH4DBtCvMc4fEKSrIkHVBkEPimKOMgcTX3
69qcE+kPGk2he3FoK+fTRbcDaeh4pnLuyVRJV2gSOH5hp0VvycMdwnXHETCO1nlnC+huC0WK/I6q
NYSsC5pBQGxsQt9Lq3kZERDIgbaT+U9ip3YiViPr9ITtDESQK7ty/jf6YgIth5A1U5L6eh2VbvJG
H3AepgaShBaR8WZ61atNh+Hr+EsIO/l6j+VjOh4emGHFI0zvTin0TeDPAcKYxLcXpt9n/4Gug+SS
2JOiKvcNaTiljU93xc+LXOCIAnn+uh0r/uxmCCgN8h9eS6FTWaVdM/KMuKa/oVYeZD4ysyVorowU
2DDgOAR0HkXTScniyoWUiBHpChxh2GtDTRjf0QJu504qQRXynUY7liIaCo2hAIJ4SVnpnMDYMid4
PEuwxSSyQupEGyPbAJ+ZrxpKbqNl7J2XBS77Hh9Eq93OOJH9glqQ0iJCodLMsnhB14mIPRlNRtd+
AnHw0HzfA8sTmyZn/Xl4wP6cNeiNQ+8QZAL9zl5F6VgVNH6yDzA/T1SHzmTlnpn7DjSJV3oye1Aa
F2vFTzWXgYIrHtyWSYQg2w/8AYqqc7lg70IEOrG+IWkwrMEkARSz5PjTFJQdWw5fR2myutQZJJKJ
6q8SdKJZSTtTs/ptQonWz+rEkhZdmMBjViuT9D3UJCFP54/fjQA1Bg8X9MTCoyoh87rRivnlyOQj
W+5bZo+oIqf796ZRofFc9wbzCw+bIPfjEQH5HygTxlCtd9gQJrxuSSuxEzk/JxQPyx6Ie2O98txv
3fUK4Q82i/4aP1bWaQ+zTN+4imyOLj5NjhGV+TAXQfD2gB6sKtszKT3G2Et+cpV8lUOxG2dCYfn0
DLocZg2ZZcUnWP6ZpPrNln+JVI+jW07JTO+/MG4/bJwSLL0fjndQx9NNRLxYC5XEfNfJ1/6d2PNm
OboHywSy8zkIph+EyytI0RSIeXS8b6Xp3LSMg/hzhWAMPuJkDKM3c8oYr+fbwjZerpaPrzFnCxpH
4ZmX22JWxPdg087WbkD4oSk70Ncm64DuMZ/FOMwvBP8kHSpwUhiORTeenF6RkVBvpewlRBCUyk+z
3t4MmGxmNKEL/+50ziFXjqsZIkxN+zs3uEK2raOFTwqXNNOJM1qWu3ZK5ywvv6dZ0AaTQu7bktA5
6yZty4y5y4Gd8mul5+mbetkT65DAZkr30PeFPvMTmTr+ygyEo92eyzdDQDybfV6CAUHA6kdFGRqw
VocYID3REva33IVziI1ZjGA0j1wk3b+pqcnWaNe2VzfuorQsPKprL7oMgiPjuGms++IEPQDK/w06
ESJ5cGAf01bWQDLpetbKZ2OvgRZ1zODXpCjVWQq1CeNRfeTTO9DEvfTsGI/ZmzXosKPRfcg79QfQ
rFahfd1X66cpJjZ95EG9EpBY1aK1iIfcVwW2qvIL/wHsk9wup9dpV54oA3e4pzixee4DsKNQgm2Y
DWfMV707wtgpHbCpsagQxPt9gQRGJN9B4D9QvORLyVWBijpXzIDQfMv05xhbQHGuzMRCRCvToEdm
buXYIjsQr1i/2BfEFon7qSLJGgf7WB+2hNVYWtHba2e8VKOstSKAmiutGmXAe/8DP6689FpR9p0t
rKCwiv+N8TRx8WPo8sWpZIdtoaSJZ8dI37idjm6ng694/nioCcSJTO5FYvfeqGengP75Dh31S21z
8NXSLrYGOZ/bkvienEOnR/FeY7jotymlzwXpJ04Tpx7xO41N6788W6zJ8Q9oKoid7tneZsJ4F/Pg
6t5ra6iMGsoDs8GWKlz4117mQNKupQ7CMmK3H7pgNilyJbJQ1Y8CQ41TZPGnDd/ZpkkBhuREVfYs
Cw4WdG/ih3J/VaJTKU4Y4Vc0qXvNtLqdec2Bf9tLeNqH5V8A1RbdEX3nJp+5d/ZmDGIjCmJAnfJo
BsZi2flbGhoF8O2IilajSCyBurLhVbsotA+ECMxc2/PbH24KXCaAQ4q+0oRTj/dUhxzwQ+mOXPD1
b4YDavUfUPBcltdDCWj+O+bmzOu/OnmoL0iDbbUYxJqSIbVBjWPYCCZb51BuqK2wcqkF/ul+8Mwv
iuUmp3x/QnC30oI6hly38+aCc1enciOOgUOz9KannbXKK2T/TiwDjmK4m/1HAbOS7/Y7f1nj7zdx
cwVxjVtc2Rf693tKENpGCw9i6M/DymNzS+bkzriKnmEhwpod3TN0smdNBY99EVLNEw0j6yosUwyZ
jooqMcsac4WJRcwtyyzWWLEZjul7bUAx8UVxw/cKXtRBgnwRgg==
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
