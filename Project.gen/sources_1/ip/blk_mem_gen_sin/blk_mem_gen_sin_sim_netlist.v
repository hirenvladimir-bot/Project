// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jun  6 12:05:03 2026
// Host        : siyunyumo running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/FPGAProject/TASK/Project/Project.gen/sources_1/ip/blk_mem_gen_sin/blk_mem_gen_sin_sim_netlist.v
// Design      : blk_mem_gen_sin
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_sin,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_sin
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
  blk_mem_gen_sin_blk_mem_gen_v8_4_5 U0
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
