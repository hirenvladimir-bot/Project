// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jun  6 12:06:02 2026
// Host        : siyunyumo running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_triangle_sim_netlist.v
// Design      : blk_mem_gen_triangle
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_triangle,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_triangle.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_triangle.mif" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19376)
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
