// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jun  6 11:49:13 2026
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
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
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
