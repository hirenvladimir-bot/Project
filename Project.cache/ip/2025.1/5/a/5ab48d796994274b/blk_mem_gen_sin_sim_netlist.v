// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Sat Jun 27 03:56:04 2026
// Host        : MOSS550W running 64-bit major release  (build 9200)
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
