// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Jun  6 12:06:02 2026
// Host        : siyunyumo running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/FPGAProject/TASK/Project/Project.gen/sources_1/ip/blk_mem_gen_triangle/blk_mem_gen_triangle_sim_netlist.v
// Design      : blk_mem_gen_triangle
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_triangle,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_triangle
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
  blk_mem_gen_triangle_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19424)
`pragma protect data_block
zgFqdBCUm2KNKPsvBdWAlOATl2VQbcS/ejU61YcZm8XLI7667SuzPspPv7zjrUW5W8pwCgFyzIVi
i2xaoz3E0FZ3Cq+5JvbacnQbq6usF18glR9coxQG0+GRAPTTT7yY7ERRNAYc/rXhxI49sGnht6D2
ICTBk+DIp7O7VW66pR8jA8zxnbOBId6Stpw+lr/FcZiqvAF8dX1mnuRnsEAxcrljZDpRBLNtuxHM
6hJdJDRF35s0t3B25QXmofh+Lj1BhhCf654pAapodi/3g6magPazCvpd0xxbAQhBWKpWYSo1RByT
lV/WUx2bNAVJs6r2CBuGmlN31YwMBQcbWwFIVVYheWH2x7cMSk/9yfx2YGJ9JB3FKjBgRNyJQj6J
PvDEdGHTTSag57PYfpQ4OuaiiuCjIriwE5nFfwzok3CThUnBC+X3L4MGX9AWISdK6VL7OsIfSofd
EP5NJvnClLuF5GHnr3mVcudS6kKinMKblTrlgbUlEoYAj2uJruCYMXy3hAmIClKxX2fdl/Ro7QiR
KUq5QdLce+coipsNzgCMA4kKAiKwejkd6sd34/2XMGHl5LTCXuuIHiBt5q4my/P7T/YhNVs8hLzU
iSvzxK8sqDflOKVhyQ5lkrsCb2jWXMsWb+Ah3rMqHZnakXvCx46Ebrr5LRLIvxSX1uSepJ+54Qih
p0WKgpMZt8XtEolNboQ3jfLJspuPLp+DxDeJlQO0+NDIcpLwLlMHcIdOjNjKwpjmHcH2RsZKPIEm
eVxeQYbiunfKMZabOufWbkr9VWrFzkGD6UiBe/RfHJUwrI0MRXNCAwUN1FhrliXNBKJkl+1VkqJX
mRDw1FyJjixoChY3IVi3o7AxJjZhU1euXqLVEhiBuxj+O/wekEvn0RDqjgu6MylgzMD60OK4OFDl
paYcHfu3cj/0KW934dXccBefT7n1Yf4rO0sX7wfVONtAdogtmo65FNLwXUg+CAb+QLcw/JkI00bD
4MUs5F/oEKDrEgfyMMdRfggNL+ABGY66FVmFR0PEVnYPXe3W5UrG4lpyjECFlPgKZ8+lubKTVOSE
sdnL4+poUdtTlCX0JVxRG+4GHzAxNzsG5QrOD+/gY3+Q4MTe3StcUH7ZNPTtuZRAFBHraiUX88cK
sKMbz704G1ekWnMyzg4K52MwA0uFkyfn264L+yh1ITWu7JszMqc2DssU6gdmWmdr1QRXkqgyUuKD
3vv8968B7JhppTblSaeSpIjtVzhWHaReivY4EKimBP4oYnfom4wlV+VwX9lCT/iKfef147s6L8JE
S+lmX06xzlVrB71xjVQlUY8fEdKda/mODc1E7bE+0FD/uIol/7uZTYYzDhh5AIRP1bzLQvVLtVmW
A4Tu1mnFFFr2lwncLOEjnNptYnXzEmkOgLun8eU/B7DwFCroGkehiUCdGGkFshSJBErOYI+IkyvY
3jLXcSinFd4hx3BA0k1ts4aeZkgnnJr3DpLcfER4pSoUzygizWPyDlMrVIXpASirgvfrbSXz1rx2
4IBqk/HqJ4AWZB2Cmv0rnWobBGhK2Kjl/5iZFwpIlnPRgF96Z/lpXqAbwVKMFqrRrNI5c9VIP/YG
YyhBudGM+dArm0jQ2jrJi/nNItT1iaigkTgZZbqUuLqyZbWVU/Nkr5OtHI6bxnAkBO+jpy8q1Hky
RxSnWsI8giO08QTs9eP05oC1Wv1ot3UABquAhQNyuqQfWrN+qS8+ZE8ZPAhrPh/ZwEqBbiVwYi0V
NoOkH9/jjIebC+t7PBc0VtEc0DlADprGz2eKEs+DAv5haD2mm10cSMx4XJkywygJILDI6jLjtJI0
7B5XPBCwP6tdTLAFASq4O3w9ZEqs8GUEkgCaLWdb7zONh62KHEhnejMaGMBAt4/TuC6P76bKpTSL
I8AVGLoHFooe6tSrhsnxgCnofl7FRgYpXiFiIX9uzZT231Z8rhs9jYWVzRShpUsxkAeLhh8rTrb7
fXT7LgsEqKXxyu9eay2wIZO0SRd9AQt8XTYYOZd59JIND2ScJv/Y8vvPOHYIpOnJv5EIXq65qrTD
7gesCK8LSigO6tGF5E96mgN2jn9dFzHBkvfaDuyofSmYMWZCPh3yGPwle2G8rOmJjG89gkh7uLpr
EHYexHpXDcGMoxg4V30g0s+nmdFIVPmvsj6hfkGPiBNUmUQlzmKV8hEatGsGZl7e5MuGLZEWlVKd
dEBlJVXOgu+YvJrwBlx20XPwtaHe16Q/7nlWFMv+Oaotwj48DGEQJc2eEZs3/hT6RSrhWKEtKA8C
dkiAYrTH1yBCXFlTpYTSyQCNWW5BwyNYyhM8xqAny8/3dx0q9i+8KOL+OITM44hVkV1n7WJYcljy
5+1GT0xZWDwRUxv0oeJPt8IsjO2Om6T9jJOA/GyWbUtPr7nxUHt/fv2gjSmsIcbse8+MRJzXckoY
lVyltC3bpObUQ1m6shzGJI8GCQXTkygN0GlHKi+J+AIQnzooIf6MtcdMHT8rff+rZQrVpJMjOnZh
UnaodGEGTuNnTSZdTGP/JZzz3t6Ib9rRyBiAE3c7a5lQ6jU3uBEpl30UeXxyXsIJbhIy+7riUT34
T0v3jAA6EWTf6ugLTOU/KI+gL31WShlLLHrp2nl2F5TkK5+jMtMUnkytTZNKWz/OkVuDSZCXsGzZ
EfWDJpxLyEJqO5WSE/sjlYGqSW1ApwjZuumJ7Up9Qwh/IxIb6Fa8WSfGDK76zimj78M5BJfg+at0
C3iZy9kIGIyYhlQi2En7+OgmxrVnWvHwQvVjLsMQe9F/b7DPs5LiCAZ15tbEvLA3J4s6pRIp42Ew
rnLW8Ed0I2ILutc7hOj2TP6BVjexvyzHAhVKGyLjNqYK74AtK5J8FzElG22JUQcNisGFfl0WuZVR
CpbUH2Irb8cCiRyC2P0jBhtbXmV3Pfx0IUBkB0RaGV5qum346b/KOZd7ugjeoNrcscmML4YS6Wa7
th5ugmgJ4plGiQQQNWq429xresf9vKVSRJP9xz24PVk4wSngecb1fErCzYzymuv7cYbTjuijzTuB
kM/ca9fg8IFBCjvnB/s5fzEaHwIwPCD0ucyqW70OJEGGZKIvwqncLRdnqwkgNdeYXAXJdKrajgKM
tRsRAESIQXaaAiV/ykfc9DwKcFr4VltRlLTLfeJ9B7sjh4Oopcpr6rOVsPpc5DqNmZv5YmhKp3Lr
cFSjOugiJLxhCu0vsKtNXveOVUpRREZpvsT7Zk12JIq0+iJDs23XQVGIifiH64lrB+X6ZfWjbHgK
l14yMdkxPeIUJ7FGxHz4+k1CUybsXBnljmxfFUSUsBZUatnwm10QVv8pgCj8hMKFJ0h7uOf2TTqQ
izetmrLDDD6PogenD+S1ZHuWsUYC8uWYCiQ7fEzd2wXKCxi3SR0N5g5g3zjgAPe9ExtAiXd5/Zss
4BErr/gAOi1Mh63/Yb6MGcFc5oFDETWDDfwicYHAX4Pa8a1q6RL5Tf+z5VPiBBxpU76Xp/t9Pmlu
TFmTP9dY9SSifC5Gkw5R62GgsaGqZ5KJ/Yg4YZvQaX0Dsmv/EuyQlhK2/n/vr4pssSDTGDdRcKJQ
7QsxebkxQ8vR1PMu8u7YOnkDwTMsWEhCWUSpbfCK5LOUPldfijc67Dzje51ISGBpWjNiR55BqmR3
3Hi1pfScC5/QNjZA7noh4+epcOfutaFp4gJFBrFmKtJ7iB320PXg5IZT+PVaaaSm+vPiiFgrZAJi
IygowSwgNStWb4wAGtzgFNCftFPxkfz6dUzqFssz6Ryv8unOAlIG9aBgGSwDCtQnrxx4GVdZhCF0
ZEVejXxvcG8bIqc6nnEd81YhSys00IUtTfSYI0JtiIHmSguq+c/AVH+QLodbKmPUZR06cs7jzQuX
zZCYJRfv6OtKEsmriuMvgU+3wXQc6vkkjikyA9uJiQ4TQdeB3tyAOru+JdZuoljO5BAxl/cjFTEW
uh5kUB0WBhZ0q97phtgg6+jTbzaZWag1x55xbtMxyb44koUPsOXu3C376CREV/TPuVZGWmYTD1Lv
7sqGT9jU55eBIfZpn1MnDvSj+8enkQPj8SjAoFCkFB/dx5wB4ZwOOX7DyxnvWZPxsaw2WRZ7wxx9
GXQQ4OqHhhwYcAKqgeC9O1KAzwX5nyFQhhnJqGsplc8EEh9AWEuQUtPHaIIeDy0Ux7ZL30La2KhC
uTgowDg3IuiggmhJtB+ulxHb5vEY5kSCa0z0qxqsN0iz9lnAQWvX1z94XbL2CNWBNmMOb0Zi4SKJ
6tuOGIQ0Kv3dwhhPp44vClxNylaK3YUHvZWZsXTR5CEA489HqA7ucXtSR+X7tmGOSYHj98yq2KrR
vBKgNQjdxfIsPRERzXSql+NezQrWk7+kKg13P4++Stp/kvAYzqGqGZl7J5FcTKe//XVN+/A8G8s7
qVSxd3CpoOGSSaNBuNMeBFE31zfUG878Sg9OTYBBboFe/lUOy9BC7fQNnZxQQtwnwTZIGBqwEDQO
et4FeerQZFgdiOB4CHY2RUpgfOk3fPcZcGiT/pew5hfkAC9uxBLCstnNgkFfWV42qlxNjp6wjRpV
sf/eruZd9iT1hPA/jCRpFmajrBIYtSWKKc6Y3nF8OrGJF66Dfe09PEIPciVIZ1OMdCZRTjnZSZSp
6DiPFk74+eMXHNxeNEqcDsAJbfZeEsl2nIfaSbQCNb/3eLoT8nOO35qtb3dinFvNbOmn8FSmhycl
C/2M1fW2v7keIu2EHtSRMXyfNxPrX25bgykyfhe5DZaTDJ4ihFc/nrh6fZWA2fJU0GCka5IWop3J
BZBIQM9//MW+SkxcEFYExRiNrOFxog5yTall9+/InOrieoDyMkewX1Ph7oyXb8SrjFilIf4qHZku
0qTPZIG2w6m0VMxfmJ8wXZp7+DkDlMmQe8XfplhyU34NxtVSeAeksFTZd581ujKQ8M6ELgXyWmvu
pIWBZVCJytuVIeJYLdsfZr0odRdeOGlhUZ53s2elYq8MBp8vNdBRPtKF6FtuuF0Ra7aOl2dGSZOu
mwKASyQgBAQvtNEiBJxBlVozxHklA7WFrQjHhKaLBkxqQSBX3FEb7zIaLLt/91h4qrXurYdeNGE0
G2zwQGRhYw/bmBNZJdWjfRo09hc57PFzxQFSVvpFsOEgJtScYhDvz7qsXyCEtzMBK2eiVzUUAPRi
OEwPDaQwlYSFAXxBJJuK1wP5nKwbS7ttBgvXQ59JJA74+5j/h6bugOht7pfJPLZXffc1fWisCQGu
GXOypDZjUmbvTT16hJjnhB2AF9CZ4XlNv4Z2bLR0Y6fD6xg/olM5eY9JlTq7aV11onYg3cG8JSt1
z1VtQJ6TLtGM3wdNzLVbgVCS5K00f6Kyf50QBgJ4FvWD3BTXn4Ok2zmDUovmc3wh30V2CGHdgQDX
wZlTEJPEdBdXM6XWrwlktY1kjXZk5wtSwsmXIikA6U/6YYy/S1s1TM8EsRTBatcj7A/abfbm8Hfh
zTLo894hJUpgHFQK1FV5o7NuvCp9QY6zSIgGssMf0N+h9YxsTZ7HT2w3Rfnv5nr77QMBcc6EzPYX
b6Dr/k6fIBHv70SVaKZHg5+vXxl34GbOm7D1X4mPvm4awHlVdsRcLudjYtMlEFgPNkfTCaNSdIGW
p+f35rjWr3IbsYlrIptCpp0wx/80E4iXqJpLK6HpBO4jicII8AKAi+rx5UvUsgGl/zfWj72anJAA
E64l1ZGdHYVOVcY0CzgHs4yDCrD63//Hypmt5ZpZnfh7anb3lFJULgCtNUPL/vK3dHbPd5Powh3J
X//87wauTBSxNX/LqbIPJEWXi4t4bJsBui3kH/kCiD6AnbaepHzOkVI1T99feRJf5nES2f94rwiP
uAYhScqsifY423zTGsunJID4VTj4M7y5N0Hvy7VL3XPhl33tdQxwvhEMn2SFtJuJRlhsb1l8qr7G
I5MnwwKTtSftdJx5eOxN0d8CigQ8f0S/8zgTBPU36txVJfqggiTYta6uL5pOZA3Joc4svqhGwuIj
6MoJ2h3lLHksRcT3JabYOUaR43bL51r5Jun0GEPt4+l8QeThs/APWSSEZyyf/KwVk8zH8nnxrlAo
HKC6wsbmPoQZ9Th5h+g50Ajd4QRrj3OB9B36OC3YSgRLHBbYWcV5gghh35uj3sUrRsxQiePOS9IX
1E77x/l+xlKVRbGHq6OGvbUy5jpUeqUx/4Fv8RdZXUA6iL4LKw36ANzUIlhSuVCy/lsl2qsy/B/C
XiPF2+9+adZFcOcLnjMu1+2Mqdh2JQcGJAVJKhu3ACqU8iXLFrnDlz+aXN2xFjLgMTH1BEavlAAq
6S19Sm+IWm7uAadZim3FanTsAeTPJKPTtyG9kkW6cmL4Oj4Lcf8LRgi7NPUpM9zf4VxZO67QZyeE
Z2OKQsSoXXY10WpRhZ/BR4lXyNoD0tk46UxR0o6yFh5mTLjhFwr98yZC+rCOrGaWZdatlZMKTmLQ
0k7PcL6kf/JWo3MvThg+Zy3WqcauYXTh34Zcv3Dlks6uGJhCjoLeXivwmk5MgRyeWKzuVD9wtUvC
EnNVFvgj/3CoUtdsvfamUAb/naLwZVx+7naocO2GUra4N/LzhUdy6bkEpy4isj+zbJchn8RZQ9ss
b4eyyTDyU8tMPiAEZCILqinGEc8+NTfc6Ij+QLgPpsnqr5laBU8faVMw+SOIff2VRflMu59c7cFj
wqPcuf9mPIc2mMb+fykEmvLhUAS7kRD1BqfxormLXHpp8duvf4adq+LVi754kFf7IDwuPx2h2H+Q
9782eiZZKKbHW7ZPRSN1g6SFiJS9wUeYDG8b7nAqUTKuRjQI9T5XOXWxmYI9g3ePaPDlGWoVsBdp
bPBRToYVi/8/CgxBu8lYjtV+t/0MpRhBEjG93bvPS5IgKVoR9caKPS+7YlEcf+kKunmuLz3zyVIp
rmValvXITHIQFpuzCyfHbx1ToXiyC2nLqr9hOrXxAxEH0HlnNqf9BZ5ONv0t+OldWaycJ78DKjN5
MXIhaXjnAaDwPo27DbAUo33r+H5B3CgE36uDhVs28ZDMM/x0CBqZdbseuxBTuCEb3bERZXX2RnMz
9LvcNKbhwN8ROJUn2Zks1dnRiez17cihK9cBj5xt3H4bZSMag4J1uriwh7l6GfiA/He/gcflslCq
0lX7hCbzYr7wyGU2GubWn3dow2lWrkbUZnbMteQ99PWozm21BwqO7IYNHbnv0/HgLygZdilhCpOz
2l9Rw91Cd1Q3SHA7dJP7LDBUQAPPWRatfk3h//WGfLxMJLIBE27+9A16+STCx5OdvR/Mktej5hMO
oeDpEiNfO6EqZDMA5blBfHOFY7pPvYcIWSNF+80BKOlvtpIFc+0gLPb7drgkSmt6hItnH55xMSby
c5TR9Q+WC6j/nDKbN37PUmr6g7wSlr7jcCbtGT0SgqGtU5OAKIPlHO1lBKePXb3nbmUCDXTcHtaL
DxSwBwpAyP5mrLUJsvBGjvE2OXtM7i5YgwUrLt+izBj/XuajzZO3+wD8GqP7BPP6HOJne9hIfxU8
e6UTT8GewDJbME+d4frtukYIJZ02fvMbs6O4VOTn+kjmBd4J52OgSraDcPN+y2HEDPHXNqtRpogd
HB1ZiSWpE3OWgYBWN+yibLIoPe55Ne0La1360X7MWkEPnwy6U6XMfPxRsCAPrepU0+ljEIUUv54O
EhboWc8jMmagCIZGFJiHab5qzSQl21PYdZrxd3R/fFaYxmBTZM4JPrWlGZtQu4s3aWxxhS51z0KE
7mX6A/HA0NHRttrkL0v7OCnk0WtRkr+his5Yd40tpq6I/zmVXyMdLUaYaqHAFeaD/TnegATjV91d
dAcTCWXerZ3NGzLDqCwYWjUR5h69oig+J5nI5XuaW1nsTpNSyMXDSzsOD0OUfwmfgWNdEorXWKJ0
6MJTQoTozgofhNs9DkWMU4aqkkh/Xvv/+lJlVlQG5am//kqTqSiQAL8XzZcQkmhWvW3y0ykfRe8p
m0+FK/dYOdgesOCw3xpW0evdBuYqiSOKaVOLVLBObUlcn4DmOkwbaDtGMtUIbsrWSN1OeeSA8PSs
LricbXwnUMJPSP6aRNJ11tEdPwKVdAjMK/4JIud+MGynvNNqNDsQpYM0thCFdf42pkbldDgvCpz4
uzvEuZyOTL55H6hsXClOPasTk29ksLQE9R29Y8mXnlxdhK+klq7UeHEN33+/LEdKQc+UadUg+aol
UhHQL29iVXGkU+ZJ2E7rJfdeTDxy/+pfyP1O4Spl6H3/jN2jQ9CZpn+eTWjdFXly7vBwRh9z6aQZ
CpHM2k7GAzVmbYwv6OqBX05paWS2Li2CjMFx3JpGDJaqYFgh1Xrs8IPrM9eAMATKFxl9zuKoXUX3
K+zNosvyK4yBx8k4XzuwQOz/OuBvLSNS/4S0GsHLJ1QyaRYBJ9j9gqnEqMCIp9KX2bmxymAJmF1R
LH9tAvAE0DqgS83w/zGeWgz8rUp+ntZXnJ5ztGfwcr9XzBpVjN5gkswoA+7SnCltEjwieNZkmP68
75uZEA/Bj+UL4oO73+p3PY4c2pY8exFA2u4JmDwKt6w/8pez26xYgvrLd0SjiAGHlPaYI9LlHcIt
3y9PK9rHbOFSslbe3vcqhlFdOlJEap2VWjOHN6GB2d3Zw56jfbm6Zzr9RgjdWPfI4M3GK3QpIyYy
AV5a7h0bMXdoqk2L1GQeqGC5q4gcjUuN8sUyEjr8uEdEPTxVbYtAZFrclg2fjy3foGyNttiVxnEY
9tO1GbiACJVMf6l5oJfi42fLrTJI+us3lMf8ehg92kbaLRdkETbE51Nze9dollVL1Lz08oYOWcFK
aB/QuD7DQkJq6c/fMc/RIGWYU1Q0UtLtl5kxJ7JsYqoahT3/Fg2dq7BDSLesMVLDCBLNqldfwFgc
5v60rGwHpweqARA/6BCIxQT3ptEP6iSekXfD/BLsxIXz9wWrhEQCSHOTyJKcfLv5s7Xroi3cq/Yn
wE8OqiIKwTa5pZPNT8h8Z0UedVhukLf4qA887NaZ4uzCeozjuilfK08KGjf+SdtlIO1gdiqHUbZb
bCSBt2EFOnr7cwrVlUZPl+kc0DPxzROcWwPGM9r/Vce2uG6MHQ0RRoKkaouqpsCgEO0gpd4QCQpq
v9DgBXjrpMqsAlCdpzzy1dPq7dzMJxLiwWZcBj1v7KuYj6JHYee0bUw7+0a7XHxwjpypUy1BQVf2
kpZfRW8vLs4BIboT/jxsz87wotK8UVBGRenLfYVbqExbwvM1ZgJ/9pD+ZCMqeU8ZhEdxpEa+8Imc
vkAw7wbmy3KQbpCUiMEtwRk6BpAVPErJgzCQWyYJOHRjdWgdJWMjKQcPwDB12apxosNQzIvSyQM8
BLreRl4CAbOPDetIp6eP0LKVeifqmz6OR/69T8/CJIqrE0/+jytqPc46Tx5/Tlbw1SJ/9q0RuDNA
Ri+aEl0MAOT2c/2Ic+zcQyxkmlSpQksnGAG3Pq2XYiG6Q2DSPwtvjxrx48gyQX59e81so7GHDoLI
jus2Yp3elK4n4vRLDoTNYGnyBHoLCUEjo10TGek8pnNGuJo12QgLUwV1X6FF+eO4ihYAy3dz5bjO
djGf35qS+Xh5kCK1o9tlFJNXvEDBpTduTKZjTFyo+Y9vBbICHQfabqbJHD01WPNCT6y+ktaNTG0b
8rFQw4kFfruEXQz+TTVt5BH+vWaTZ9kWIUbDbMh3G+Shm1Xf/KF4uN6CJIDZeN7wF8H5Mqotbd3S
hl1MsGp1m6ol5pIRQwnF3c4Brg+5RcH7YX9pgZ+QwbMA0pQgw87OcY24ztEftPdlYEOOGptKR8FT
mpaFz/61COmacSmosn2nCS+Llk1NC6Y4XCjKs//MCdG7kZrPasUXztMXWql5kNRnXtnHpugTLvjx
JftmxbbSsXFsDkq5NwYV9erc8Gje2xDhBkSJabEVli6eZBdYLlcuD5dAc0EobgZe3Tbuhi5k2DIF
myjlXr8uhdPBiBr9kUkB5NPOLIeldXMVInxVG0J1fyMXKqx9QGuMn3nmZbNGqOXOEmeDsZi7ddvl
ud0jwGZwUs+WVS25nTdihwbhiAipp1k2f92kcok2oqIafjru/AHXGpC0QMq5UW9bLG9hkoN8QznS
80A5L9MQCDJ4cF2nCrYIa0Qkkpp9VkO+Z1Q7yoEFzftjpbANseOXBC4nwwxgMzHdNyscsuB1WZBv
lhbnMjCOE2qYS1FvrsK9E4SJpOhHjPOgnvkk1B69T3OPfsoHp1DaYsKpFZBpEcJsb59eTMoYUVVo
ZwfDcw/L70WAikKWkjCS0m8JyOryV2XC8IGcpSj1wrev2IjdK2eEpzeH+DB4fXAwwhBk8v/cbniM
ttZzlJmbg78yhndQt8KRT+qmlKKDpXrULgghcsdOxakZn7iL6ttJlbOPRKmdND4Doyyz0fNtKcaU
f+U9LvtBUhKwkLrAxHgmB78me3Waa/yM4DHnG81FsBer3/bgqmSaVpebXFNwvjRyTYObDffI7/1X
xnFDqW+laS1OrZwwtm2QzB02+gQQo1G8Y/DO/061NMVF5oM1fURAgaVCaDpwXXkJDxKLMObDqekl
F6WkZs8DS0v7kySeaBcu8/1LUxg2pihouQZE9S4FxY+lqaeT+90hPy78Vj413QZH33Rdy/y0wsvj
xJ1LrOdPqkEp138ZX5DxJn0x8byhj/VNl3eLe5L8O13PoaQajKjZnwGj58xzNhBWxpLXgUFaTHn7
CXZ0eUVGo8cWIQlU2NAwo7wa6fJKVKYkS3RmFPzD3OaNgu+F8pvTZWZ+DCNe+xkl1XvD/9TLqR2b
fWfhsBQk+SDc4knCaPGTCyRUVVgPA3EvANc6nB/67ZyIkbUn0bXqTT/fQsLqfNGwtgvHzhPpMMjR
r6e/cCC7VTN2nBkHO/qCY3hQvhfYCA2YLcUL8EoljaiE1TcMHOKVt1B9RBrq1fcLr4waYio1Fhe6
0F+PWowsi17IJgsdi9/KZnynbLFAXv/mmGGzyQlvjF2NBgnlDVBJY833YTF0/CeW0wWpKeHVEg2G
xqLeEE2zwqYDO3lIHCwaNwwBy6QtOxW6E2FYvNu03Kbm99DgheOzh1pEeIpuP/BBcza3ksxpe/xM
3T7Hpfj8/ukYXysa4Xgv3RHZOZv3i3VQBXjen7ssTqpUNU7XuaPnMayWJ/F+vsG/5naSIc2DRUuK
Se3UZdKJKaK6IsCnLg9/WYofy7Gx1smYzCaJ+0gycJ+VE3A90S5MVIvtuSr5emJyoPf/6TEeSZqk
JqndAyNTxE5FsJN+R9II48UfcwrqCwDf2ozHDuqoeM/FihG0Gg5NlechisztZiIvVfCa7k/r07LI
5wK66FzF2AkN0pXIoQLwHmw4dSIJeege3O90P3CEsaFsez/3Rb7F/MPYubAJ3R7KJ8rNf5RXo6zb
IW4ZEnyJpJjpN94AAMcMyZwYpD2djJyNRuVGnU/R2CZdcw91fbl5VX58TCwqAqqonq8/3vXTrrJz
+ireIzvAjGaNtT6Wtl0jw1CC/jztKMz3S7E86/lssdSitFZi1bR5hStKamXPG74Ij0I5wVDs36e2
1okPXBUzI/FPlLmjNR7lJkT3XL7U6+MtVuc1oO7npWJXCyx1PnlT5+QVEtbnnBzsIguu5nJA8iOA
Qxbq3uak0y7uVvm7xg7DsSh//c3Pt1ibh0cE8yZznBFVmQwbglcQ36kPxmErLO5xqkCdLd/mpkM6
jnkbd3yt1H7Ds/6IJnXENNtsEvX+NmJ5nln/756NpnWAB5EJbUCEofksz72bFj/aw+Fkt5exyXti
uxlUD18RPwWeoWSZjoKlQEnMpvRGqqVl7kCm2IfP0gUhQhl7gitXjEGrKxsgqVStJnOyAOskgq3Z
xg7UVQv7vprxWtIGtgbX0nMNZKIKejelA/yUv93P3kZdHRSVEe4Fod6E5WUAnhrhgrQi4Kgi/mZ3
V/DQOJCZpM4FjBisMaaxwfahn8Ds90q3WC1yrRVEXvH7SdZDLioQN9SeKLQfcS/iBNvZl8+rihqZ
OoThgBH2pI2zrz9CXPuZQfkexM2VL+/BH6kzztWtfxXO1acvcAqaLB5oVhf7WSDvlD8EGJo0R8mx
dYdT7swLYf4uraesFBk1qEMC0uShIR7XETqk8Fil01i1yNIiDeN/nNg+wLkkE3Iqjpkw0qkREw0V
+y0DIgF6qZyL/Adf9NxkI9Onc8rZyich+pNKdPXtY3EHdGpseGKuFQn74itOfiY2Tvk+E8aUTdeD
+ykykQG7ddV+lprQkmuvS4XkKhd85FikxggURNCAZLwp5dhXjUIqGxqoxY3gEgf0/iO45u6aG4Ln
QyB6KkGcO3XSiRuNR2TRUx4EnNi4FHeDp8b8q57I0dkJhE+24u4FvydtLTsPvNFpH4pQJ0gGlYRw
VuZ1GIPyLL6/qNRbf7x+SnYrXW6DvB9jirbSn9KvAlnErBXdwl3J3inx4WDGOByDYO5h56IPAcrw
/FBHoTHFjHxU0g/5ehyzfcVn+5vFj2ygQ1jJRR1n6ramIZcZSLSGcOSCZwI9lKIjeRkwUOf9b/Kr
/fNQuSUfyD/fjvQy4jI1tOPX60NYMMLmw/uaT3v+Jcqk7vtI0zr74wQHmrcD1pxhzRnZndG8GL0p
ogYh30M7PXYsxAUMp9RskFwJjd73S2itnnA5JHG/ilwQZurHc28quvOvnYD6snJkl8jt2HoM71Je
OwvT69kHZKD1voySLSXC8lqkTOhjeQU7qm7kuSMp973/duF7UrtZlQcEbPMtR6aYnI7uS8olnhra
T+3biW9fhdo6WpB3246+YCKPRrIMXWHdolsyd2CPQe3LlEW/xaZfRJhZwxH14c1k4bSr/AD6p2TW
pReHaE+9/lsdbwwZi5U25KxVnYhsKF98F5Eo0h4xKdYgGNjjqTpxac7dFK74EwqMpvD8YjC7oJyK
d9b5Q04Aog+gdLtWzAUWcGPPhj+piX0S6Nz1P3wbiYJywjBphBKNpEFp6+RXXM0Q4d8G3nxL9A6c
Fjy+QqWGndAaUCtKo3MyHDT+3Rxm+f6qAQE2T8oaChiYkkf02dcX1l1yZWYx/E6FS6Y22vigiLqU
TwbSM0rtqlz8dszBvbI3TpjtUFQb6yHv1BXxUDfefnoQ3DZjxG9SObMtIEyf9WTLhduXe/rgnCFE
YbZXFXqlNfZ/9Ge0v5rKLGKw71T0cVkZ5JIUUqMdKwFkZ86aQ22ORuWekClHnOHhxNsN4Eywu/7C
nGlrItsvF0hNP1oDnXNrjBISFl1EMMymFlqs+oVi6RzYW2WumlQ19hliIU3DzA4NnzGA/U2QwYDE
/4XPt/Qox1EJf4qOrr5DW6HdEqr1TFrhL28/qhUdRmf4q8+/mwkiXZ2GI0iq0zdhjSzskam7pYFd
8hxFfJfdygO9t2Q/zXU8wBuLy9uXneqHpzF2rzQnxoKjJFgRASzqa35fAbxBlqtijXIApYeOUkqG
0Ioulj1+bd/xDpDPPjfOce6C9Za6LiGRV0gfo6pbRGqukQGgMjvODaq7Vo2rzexhnvRI5kXD+8F7
dKb9VLO8pEScoAUXxiXYLWFsRWAeAcd2TxCTReHRVJ6u0KYxDNOymm26rrHoFUckm7I0IHn+dkW8
LTHcUZkYV2hW8/eIezIU1V7Cv8knkmYKbYOD9tPqPKani+XdOpl2kWyhhIFZXzKynsfF4kC8la0e
pP1R6QAXD/ehUvFAvgUexa1dlIRBY53CEE614pPkcfnMoDa8p0HoaWl35Uv3eESWJvm0rGLwiK7O
PAxKn/PGSE4Q5e8g7SPeC3pYxQ6M5chVyfkVe2OGM9HzROeipMnZ1A2YA5ytXyK2IEdAm7DurA1E
4zn3mSb+kTxDeZW0Mn0tUiN/AieHzel5Ym8zH9SALy++Tu943gSOiTAeVP8UxICTZe25PStr7Q92
nROeJiNC4KHFMTrrsGW2Gb4tTwbEiA8OYetiXrA3BQbBsSnw8TFwCMunjNSqqcQwgvF9j9VPwHTG
LtyhbaJhFAsEzUvVDwyTZb8x9hhbTPPFlzZBzodDpetsWu/tjsYuEtGIpHwnRdUrsV7IrQXjQfNS
vXFYCxNhkajJClR/Jg02y2dZGTTFOFKinY/EpsRJagGDF1Z0Zalg71Uc32fmRiRzDZkSkonwARMX
5jzYREiiX+7+VCzSd5lvxefs24TZhBWuGg0tMzLHbz2uR2LDt1F2R5Me42bFYVZAiiprSf44J9UK
CZJu+HpU+ITYx3Hcm/z+kFrpaIQ2ZaH96C+FiaGYLekMKyCtBCARZY4UFGi/4aeu1EtkjGWgqfpK
18HJeet+zWW4pADFWBO/3c6UlsMpV+bTBmEg/9IyZ9PlDeVcIcJRbJ6JUpPPYluOBE0QnoxPDhy5
rOJnmRMr30obS63gW5l/td/BYwpp71w+euv+0mo9JFAFcykbCpY927g31NAVRT6Y0tjI25MjWhXX
8fSrR8mB6gSJFf2GGPD1ICi9DOtRT/nG6ALVzxXXUMUC653VBNMIiOtXLkMVmNJ4ZsgLaeQWxQtX
RPURU7D33gIDdlU6IbHpEouUvjIfvVUiJ0DSZnUhIhyYG3WQ7O0zbrKWCeZ2+DPF+PCGalaJwhAx
V/ZQOjB4qrt5VhqwLsudEXq03SycgwHi37jgdoWOTcNKClnCU+t5vkPcWy1IcIdZJkjjyk9j5aek
U2QpUHhl5e/109G9WRmk8JEsTEPi+s/f6ciONbX6+fgNr0+RxlG22aTWKnAy1/jtycpPqM7k6k8y
8SncjlOCztfmrUaKqCP/vtTAe3yRXlZclRZo0kFyz2VE3Yq2GRe2LR88v0LusL0mxqTmAzpaKdJ8
mfhehpjNmXmJMhoi18fyI3DNMyq9q6Vf0MZXNtgXnLRrQWm50RMQxquWUt6mnzJ7YyqVUQf16UEn
DuMH3qQJiOrHz2Qa8oAL9uAADmKA00lv3ZCsllotMhFwIc/5Q0qG1Jw07IVk6HQAXOxjErpwiNzy
NEe/nK166cAnEkAVkBSeu2GEas5tbgb9WWpUZmdFkGljt+6y7j+ZvCgHVBoMwqSpCye76qoWgxIk
MEzGfjDn6/f7LmXU2Rqcl2qmdFkma0QCJDU4MKi+OVDcqCE6wM/RZQnRGanHOXQ14s7Z7Kxx1Q7Y
aGLU2IqqR6MciA+bzxLBQcKa75Nv6nuUWcH9ExSp7QP6I7+35hESs2OmIZzlxgqs4V4QR1k6S0yH
VDM+dLmudL6fF0WyGVPubrgZaApAAMrEUNt6pHz0NljgrzL6hcn4IqEO0uTl4o4SvF5JGZUTW7CS
7gZkdaes10s9LkpwiH7hBDpH0rhnAmowL2TAZWV/5u3AONqaafoY+3s6AxTf1MRGI2Qs/9cVOrlS
DAMR6fvaBOKc+aIWAgiTNFU/ZQ0RlMIG61fdiBXcSp2F7Cbs9R01jbIxO24+cpDZKiF70Kj3nbRc
6B12kXQVRYQcp71lQJDRwOtb6vdriZh4mv5Ohe2igG235arPDCL1yBV3HTNr2P4b4TW1FPBvupsy
Wn39gn5AeVmLXt+1N2BDMm8zKGnKBvs5RyN4V/hWIFY9JpGFjoS8I0DRCxDMBaBx9H+sCiZ53W17
Zq5ydR5PXbgHAwTdmeSAzvruNUW+ls1ycc6yRc/KUdRbykbdJrsifsljnty1auTznwyiWViwyIlQ
e1FJgK2x5ca++Z3v+UqtCCOzuD+WszzEvSWxUsLu4psLZoW3P36qHPAdJs0s5XkydRwLwOGInNOS
23xez07IsJ0UuhCQVBYkBMb1QWwgHrJAKaeRJC3alz2dKZXxKv4a93GGxR+XcHCODAF5u3qTS/ef
/oi4lNogz5vtrx/D8qRUdw06QSSvjH1sZ5LPIs5atRRPsxctV3WDBYP25OcgKHuEyPSLi9jI0ZCM
E+s1vjErEkaAYcArVsNAManLb4dJj5v1VYUVmLCMjPqLFwo55mHgR/aj2UZpaIVp2EjeiUzuAO3/
31tPdVdvW3AurbU1Vl11RE9aoDvUzKVX9/cZtjzU7xaftsGcZ20Wtg3JI/ykoxPlPLXeDRkSL521
swGmlR38hE2RYAMvKotlqA8Tm8QUxRM/8QcQNHGZGQTAF3oUL6tYiQtlhRV9f1hyTdiXQAESa10L
HCGzzfFH1J0PUTGbVoHfVi67L9Q1pDAmUqCWA167Wmtmsd8p7i0xVfV5cimj753p0nZcubyxkSxH
RZMj/lQqmahcQqbRPIvN8Ko+9pJ6pirAZiYAwwNrX8pE1cxItVz7xFj3038rFE1/P6JmshBy+HPj
5+ndJVRql6p5M2UoGjEu7F0UqIo7aRIL5kXKbtTsuOvFz1MgqyNH1kznQ8LXpjMJB6bWvlsW31Xx
l8WaRWL7xlBxshMtg5r9+qPvWDQ5AiCsIuRwqotofvzSNUu9/kPjJtAQfFc3MWqjscEcDms5+EnW
k1Yrcmmq3rRCXXHvAlWZJNFwUmLiIzUoUKkJhpDKX5OLQQVwUlqetmVw14NyudGgXOGk8+ttFt0b
kY9fEP0HDh10bN0iikqKKQMW3dwVEl+qsB9UIp72yoNwezYhNUGt8eAdHseDG7aBHdu81Xkq9qla
DvhLpCncWRi+Jw0t2wvgNUXYTqihhP1bAKsAImokJehbVbVHIiSGUhUxDaWezwoR1ubTSHcLPDGR
j80fI6Sypn8G42HpW+QVpgn0/T38l2D4FUxbjVf0YmTH5C2TTwhkPxXlboAeQFr4yvUAYcMXqTVp
GxjOse6HnFBGfff1c1AF0Us5a7KSolLSFCDQFOdje9omDw2DZxnEZcOFaRy9h9NEmUkXOqclnrub
lcI/vUVZGmH0qnXaxZgHUOYkMCH4FJd3W21NcRhdJWZ7aXMjFJPlKvXF6nQo9ZtlTJ4wl5w/JBBn
AmrfDFOKciVE1NvxHbGnJAM4jZ3e1nwMZWlEc5QGTaVbMN1TEWoBG6mjQykeESNrQv+Pgs6k1Ik/
dkHlea1KgEGQqRIWxFZiKrYrizvq+xdbi99jE8A4ylgPaTRiWPxUPVdcRrU1wHwGAXJM2o8ohmfn
+mUBtSD0HEsnlZdqwhY+T+55pZA1+tun7vGMYI5XzE2dPecYbKwbVj6QNazgsDeUBkCpSwj02lyc
/plew2fP3jyRCZBJPOjd7YVKOp3gQlu1nmNYgrwVJmv8TnjMWczgERztg3+v4OdO45WTs7lzoPWH
9Iqi0A6kf9zA+DbJzGoRoTf1rudvPghgtSDtvc+8BSCt4+g5B52rKErxhUMv501WYoZHNy0Ino9w
W4OXdA2ZnDN8CS0ez/uvGrbhM8SSeiO7s7ZUvhKXw8j6r00JU4OTi3/F82SCBn2JtNmu06PqNzkV
HVF/8LAp42RAoi4fzoVd28s7HKeWHA+X63gvtfeUE6JOtG7sYgoBxh3LHyDgZM1lRpezdqln7eCt
SIyF4jY1vlcAbUm41flwvfZvl0xniAfta816wWKqJ/OJ4GhOYc3KcGPiqPp9j3KH1iqqpBcg+4Nr
y7vYWJBDY2ZZsGqSdPH8CLn40OsMAu5Gb2UIl/9Tji4I23b/8Wjz+OnVuG8JKRN23qt+CO8Qgoz1
nmLNyzcpGEKvqNKRtlIuEYZkifbnISjEa7/7QlXW/9KVUe98aAgZFDzh9uIbXJNGrDDmTFHVreo/
hRscGCFdYbJHUAe2xxaMr8jQi19Hc7ZYhlsu1kpQ3fpgUU9gROEbdm3+uhTqWtAmTCgjrVc/vFY3
56OOm1WVgKVjQtROA6cneFQx7oq6NYZxlwdKqT96OmIuIti4Vj+ypjU4uoOXkKHP+EbNjlqs7zRt
rd0zSXhyI+jhc7XhmqEL0Mwt8oZdDcmdxyWBXESsHeW7zwPasMqFO1mzDSprc8BtlOxPlNHQOZSG
+cLz21+c63PKBbVceispvq2qr5yve1n+gmc2kSSBjcZ7SzPDyQLzof4hTyZxlms6xG0+pdeiw+5Q
FH9y5PHrOdixkIPFGE/3fQVpaI7b5T9CPj0FwU09RCA4YUi85R1IVuD0nJWK3b+7CDAqeSSsvCy7
OTF+t2RkaKJtxLXgAXzDoGowU9eh0gR8u3VvVmzP4IePtX3KMbfng5Ef9m/whFqxto0DmPR31Z2X
dat54jiiXxmOMOanNUuM0jLhdfbALkGHaGIVgk+9lJv3jlHRFyanvj8lenfG4EawZlFdu734gIfv
wueu68jUDn3o40w0z2kwbpAgsCw0+Nd+35i8yLh3h8JmrIDaKyuAcPSS+RIaz8oQlTiihjKYD0o+
u0hqNPI03jyO2j5MZfQCnIkfUGvbC6hA9j2IRIrcUmAGHLIGgxo8/2j2VjjOOz0TtyXDbXYksk/w
zqFORcbkLkioUBp6QWcmMm2IwqojK9KRONo7nRh4nDzW4tEReq65mriPHX8YKs9Ir5Tr8QbOt/6Q
GqztHqQkfxWvYAizJjLum5dIM92inXiCpB+mm14+slOeFuLPWeJIOtDVIXYtRxK7u7+lr+UrNzf4
Cr5FH7CrgJclBzkZ0mbMMEd2E9jtvUat+mhf43Q5YQlhIdB3jD+vEgu+3MMV7P+30mTk04Fqv+y7
YRU7LizW3wu7YaOGt+mVEvL36OTCsZvFy1UuSqrPornWOnJQlUFUhzCq4t0YgCRzn3Jh/hjN/coT
Qdn94cL05xv2NydHCe9ftOzjxtIYL92J0HTyMQMic3LS+v/yl/uNIepTpz+uQ3XEWZcr2Q+kWLuC
hQy4WQnDr0ptLPjxPcygPfX8OPDxJ/P/1uWEWGVWC0WO0QAkuZXhEAOk2PiWrdzhRCy1hrWQ/8tB
QvPinlwxGKTC0qq2ECNzxZAJ4VVPnrIFHUWqRz+Q68aznlych5Pbd8AcdVpYF0MUNs3LjFwBg0u1
7szv3DeAbWV1BXRxCrNDo7fxGZsSZWY3gcMzsUGQ37afsTVwZCf3pmpiWrzUyNWIQ8P/6o0EyPnZ
lZY3E664akr/4tBi9wQ7kWcc255t/XdliCbMLViLXAXBNs6aOem/fSvLkd35/yJduTqMMLBz/K4P
bb6tNaJ3Ue4CpTUpQMPGASA4Xo+16luO+aRcUAW8+B6Tiy8iASVq1i6KA0bbUM3u4CrY8PsGiLFl
a25735HuG1RD2g5ZChpZv9wz7n44CJZMbDP2gIiGsWzcG6hLGarWqKuwyDFPOEdqBYMdrEXjFd/d
20kEfQFy8WTe/NhstCXs/TNcs6TVDCIAymRBrbq90/uyG4MOv3XQi+RLdH73iltlkDWG4HccvvRB
8YfxAJhrDfOOM/9fci8DjY9+hlSVCUl4dGQlukwABk6CwuoAaGZpW0iYY3+6QJ+Md0USRZYji8y6
1Ea6P9X+KwaSJt+tnYVOw7IgFynXKCpOAoB5SH54/R3URxiUYW2Rzh12qwmHScUy+PCP4+SSedav
O4uN7nP7y6IgLD3Kz7OKmZAd3MV99jwBIWJFZYwRO0aN55ioUD6dzE0wcERWAfZYTg7Fvo8lsFHF
iENYXzS7RyMsiWpBAzzFvyejn3oCixDBhh3IIP1F7qc57UXIq0rBsWhNbf1B8vp4HQQHiZCmuXK0
+RBIN0yd4izuExZJKeuNtMHCC8kiqNsiXvvMv2uBFFb028tpN0cBKorr157dWPgeQx6OTUBT7l6p
0zGk3KRu9nt9+wfl2LuDc8SppDy4CR20Rf3rS/+NUhKT6X3EqVkJTiUlZn95tKOrmy//LeYIPu/B
/6+FTDLMZeu6IXogowUwMtUnnLPoNu4nndD99Z11sYZS8Z63gY7lu+drSJGUvwZU9YygtZt1FLvX
fQBDwF7nUJ27ilMMq+5LLhIlOaYbPxwdy3RmX8zruDR1PN0lJfK4eBFMEYDWTtyXLmYHtEmgWcSU
LPP4YKL82d618EH6YzzjrayrwCSuRdKJSPOq7SSUeYfccNy/94neu1rhOTX4f3lAvtgTn7y4UY+y
runwNiX3riBTaCKlXYRmBWdCNF4Hf/X3+QoPJZIWf22IFk2MNZDZjFrOfNfy0ZgogpAiU+2xrxY9
cXnE9JXj3RLGj9OX5Fmq3sbZ2NkpClr3LaEb5OL35V+P08lo9zX53MWKraTyRhQmagBYryn221Aj
mz9wgQFIvjJO3CDy+wMl37JckdNe49IamibSzhdgJy+dRJcPKTNyux8roGCpypsbxnbhZmkwv23X
KYecRGB/f+oOn2hr7skjKhianLWLKbWXmyA7WaF/h+rpOVLxTfF6Esxvhr+ffCXUxT0cuMP7gaqn
ti9IpsFWGh334M5yLj3GST/e4CEmZumF9hpR15gwH7lz3rHVrsYAr1LCy8SLO749HaOISi3oyXtN
e8FIVmiuzlRj4Vh1KonhDJCs45reDu0Y47DIzQ4pqJ/MkWv+HhXkie6aD24AdGIj+g7/Owt53jHS
V+rduCnfWGB6wmHsijqcNpw656j8Vfv+4VubAbYbQ+CJacBvWwUTtU3BZMawl6ELkG7HYrnJTMoe
qZuseGORneLMF7Jy26CVoAQhXi3uNyki0vDK/K/T6Lo/hq9FBdo1jWDXtUO9IImYg2J8JXDVRY+d
3MzovPT2aLA6or5vtrY8xpnk2HZZUZc80TC6Ype2ckxfCDt/L5GYZTM5R6f2O7q+U+2GXWknKAVk
IyQVVFqkCcdjsomY9KQatdJ0NxLDuGl9XsrwvWDek7OUxd45LJXo7JLHytnTSxA4/UULfPKJRrX2
8FFrm06FSipf7DYyJ2db3OjMrOH5J7ZsTcab/suUe+KQqC6uE4IOZzDGkhC7mVgTAKK0rxXGtUmP
Yo5x1LRoA2fyPQOI6Aj4U8DUILFe9lIM2mwqef1WnmoxkXV0H7Vrmjv+QapkNLqoFvje/gaUJiYe
ZyYPQDhLyeBEJ0m8HT+/ISEYPgcXs3bfNr9ETGgV/QJqEldPKscSem/+zypvf+3mTuo7v+RGvxqq
ySyobgns0PJz1nZkcpZpNTRZpvPovgDLiiRqB6ISXqmr1/DOmLm9zcySqHH+3eOtoFPZhrN1VF3j
PdNYZRJGJ0cFcjAsXUO0FUViB/C6r4J20BJ/rCBwViIJre7d4U90lgqLjYD/6CBXFWeFSutIeUfG
+/tbK+uNwZ2nmG4KdWFbLIkuHGBBBwGPs7r874mEJ8fNaHZZ9CIh9umgs+AB8KeOiDWMoJGltPb3
OP+x4Ll7ioxtNlaxg9iucC/hDDEgTc5BIIu+7pFXlo18HC0uWkZgeX5yMYcI3mTGpDEr6F0WkFx/
coqwVdpF8f54KdjpiF6kQ/t4pW7b+TKk8W49VykryYLpeQz9RSL+unImwXwxEuKXQzAexcQzglEp
E/r5aMNQ+vC6/j6h/ZyQZZ5KsTs62lkbEXVCPWu4U96SHpUUZf9gAyr6HDVz9eILTubbZDkx/4rM
7je6Y+o40ExkQPDM7W4AAg4r+ga5UmzGzosWcGFqJ5lYStkn7xhiVjhseP7Afi8offQGtP3sV7HX
UkKdzqf2TygdCIDuPQsm8SKV814B+/7egrhFtbjqJQjXvNkmWVUYOO4z89BEg5nelbhNwtyE/yi7
Oi/bauCBWfyJJWqGx7cTijmYWsXDxJpuP3VPT6HKNb5X61dLDqRkc7KjfxNyj2UrD758Y6Hre+AW
uu5ttWOXjwaX2bAWdK7R5GF/KLBtD3u1d0XdjWl7MzkXORgJW47WZQZL7B83NMhLQAQptsWlsJlO
SCOIZkmKfgBneMBzQxoWeoQs5sbRh69ZIwukpRqTP3QNjCj2FJbhrPIF885IKFvzZYVt1r4Nw0+5
VRXdozq7OOuIgPrrIzv6kKpsa+ekH31eSbiJtln4CZh88Ghr6dTldTpgAEZ+5z/M2Guy5Y6noTUT
2P90ReTnKDkfMRJbFRmoJq4xh2uS2ebcgM6D8KWU0YTNH7vZzQnDXxWygFooWa2xpGw258lah8NK
dGEht1PkUA3D5VZWWNeWzkSE2T2P6yPpCyeopRfxyUGyHekbtk4eUDahEyCTWztwOPCS/kui2QqF
39BgBDFjGJ22JLy9YZuGbg/cjV/T+MjHCLWWSrnTBvpaqm4BG+m0aBfS2NiaE7z6k9QrlFe2tSIz
mGhkGrPRXa1XIJBIoHCfK5yLNK/txTPjbtHC3ekLx3EcIMExSOmRtkezhfgIyx3nDcauoRdt2ENb
DYP1R/NrNMkLo4rzVZlupGtgSGOuH15B0gxnTQErsEoDtdRLSwx5pG/Uw/uqYk0OxbD0PTx9KM2C
Av/SfUuAmtt1Xlc+WYz+/k8bT3TxToQQXnHO6hZU+1pEAUhLEeNEnY/mJMSpTu7RwbzJ1yPQUfQY
bt8UTVOx7pUT4QBA9alk8VbQX1g1BIZYM6b2c0SD7OdQGMq1Mc8VVF582wNAtlkTgYXLuL5M8eFu
G4y4RUpeXYU9B5XFLpQX6hgigw2SCkoPl4VyhK5CCHKehy36uOcMo5uCcdGARK8OaN/9O1Wt1/QF
NpzZ5ZHRzxsGM1+65KdSsZ+yvZHL/04WUVAMlX0ou9mX/Uyxz2LZV/jrFT/xGJ+El0Uyur4+VkCr
ektZzn8SEvJDnbDvtBUHNJcOwfIK2fotISDnvH45mlEfVEA2PzSQA1JbIPPArM08QozNiROFVQsJ
0Sa78oVjAP2bqe4Vga8hnQfAtmIebjqyEeLxVjLsLkefTFd8f3E1A3YR8RUA9cEs/t7DkDFsJs3P
j7IG/4SEvExXTRXGZdVYfifm9y1VoZrBhVbEG2GWMjwbqkLbEccrHm7OLZq7pNdO2iEkqwwgodYx
Vwyn6LTQ+HciOZQy15A1ycvVlpC8qWA65bb/+0khODrPnLWQ5bjw+34sfwT8F7DP7axYC5cWGSsn
8kFLYLWQuDVb1bMsdJ6LhIXOjV6Xb7y64HMWiX3J7sPJqVtu6bsI8kzEA5UEITYVan2tfY9vMTre
tr2zhEMo7WLb2jgjubTLmIQGiHUgPDB+kAX44Mn/a2cRY5BsweXKpS5tZr468MM6RPp9DbKgNE/C
0mJ+jAGvUqZSiIjEipT8pwgi1PAy6g9q/ax9H4IeECG7tbZ032xEX6d49ckBuhbamAY/gEHAmjqj
s1hkA9fUpty7ZRmt3U+Z//SqYT7P+7+/5ojAJoe9umgWIuiE33pzjps0pCI0BlKvqycs2ddVUcvD
IAfBsZUSt/Mm4ZrPaTTNLfZtbHMK2pt8i/hmAB0/d61WA+qXaMDCPri9keQJ6cJ3YnUk+9rRqYQm
xwDg7AmY40MbT8xR1BGzeu8Rkyyv5g0Q5nn96HAYO+0bWxLgnGoUcbud7vTE7iBJEmSMYsF3l1/O
P2g4KRaOvjW6UaZNrqfGQ72qrfgowzBABYvE5H6MsP4kHqHNV9QVbPzX/au9JOeOmuVlKeR2f7xm
FMcThKopNo6+OrxMuQiMVwEIlH+vdYnfb+XG0woNAcUURqzWsKnHO2lsDufN2+GniBwD0OZ5N8Ow
iuWnUE9EhiThdHqSdd50OU/jZ/KL5TYknsQBE3ar4Bz3pPhxMex6Db1S94Qcsq5TEkvFPxo9JmU5
AQQ03Gytm/1G90c1i0zJQIavMxTYybPGUEUMAeJRT1K4QIyiol3kIEoO+2YRLXEPJidGE6vNKgDQ
8Q79GQuYvmHbZG6huC04KTkablLMbQK+OM8+uwfVEIyDHhiGo7pyjDLbqA/NSKgu1lvLTB7n7ulJ
DLSBQmDqM88NPEyonOdnC3ee9mg3EBNQP9o9BQw/XoIFr7e80AQBwg4uTeLGs3LjhjJvyrgZqj+C
bIh/ULyCAHd5bysj7Bw0+NtZfEKffinKUZRwe8kDHmZ2dFcLlKB14qSZFy0QXPOl9gGkXeMYLPHM
ZafxbMxo4QPJ+SwmfiSERYuc7jo4yYfEpf2iG+3Qecy3VCgfpHDJj+QAHtFBr2JtFnMLUYkxUBoO
WXpHrkNy4zobXm+MLkcbisGzMIrrLyKiyWPLjqqBdnkgvidqFNDsBvmNVHQFjYdszQst51EX195a
HZ+gjQw7y8FCZgCXxi84fPj5R8w/TqkqcHdh27EaCNQbPd2dfbQ0oAQy5kHtBje8tTP5SUDXvhmN
fwW1AgPg27aBBWGdwpnZ4vJ4ZjjYRfxrkgnS9j/huUryuhOgOv24HZWcL1tJtsO6PEy4q+9S1VPu
MIBz3jCEsKkvup0AX4Yc05/cYI2MPqDRfg5a2+HxtpotfJvXEECtV6pnOllUhm47/vbpDVDAPtAq
dec3pWNTrdlAJfyGy4RioMbW/kpJeuNZv+7EsN7JGZa37hCe8juVDR/J/4PvNKMzY5dnfrK0lFE8
jJc6K/VBurE2g8mJkQoGFpiAGKrrAtzp9av3dsIGNmeXVl7d1txuZ+uDzPLv5SWflQhiARsPW+7I
ajXUg+kXySNhuQ8EuH/GU11tN7URN9ll31+8XA4qeCiwvYetlsp5/nOfvE/17sPuc2ilsiuARyOT
Mzza9MLrv1AiTp8ZMUFE4XW+domRdeflrSZymY4apWnSJa9jFJL9BfDrR8fzRT9TAae3yuv511Jl
i+/bwDfxYc5n+SeH7/IjSvFAHWBHD5JRM1v6F5gNds9bAjpjzX8eZClrlSUHjSMtYTkrQNl5fv0z
XItcOapirxVcFdS6lOJ7BXKkbzlvfsIQpVqgO2b+SWMVeXjDZK/P129jApZLPbKcjzptF0FoxFnU
dcYmR0yc834cSqDKUofm4T4RNkyNLQs07MgNkZQ84Px8ZhK0kvCRBxMbFcvOJ214UTevMo2lYdLg
aSpD53gFQnov3E263glnrOJ6VIniBt6ntVNzbNfO3oNXilgGznmsBc+PxT+Vf8c2sD1ym/XXGpz8
mjHsNUfOslrCf3cQ9jxyuO82TWB8Gj3X2ivKDooV9IfQqtKSVGezk3WijigS7PQBrpCAT+0qxDHu
Ezb0KtZ5cJiKob+pHRZeNHllkjGB47kKqPt6m4/IItJeeH9/E8pg48NprRdue0d8+ZygDjNkbxfK
Y8wFSx36TkZV8Vw6VoVzHxBb7vuGtaKO+UOoG3WmEAG9D8hVhYsMTtEXvRoWQvSnKliHHO37Ccps
Ar4+uYlqoPD3gRYCKQ0lQGuY8AM/c9rje8xSFgI6MLYxOHugQfPHf140iCsUNubO2btnAcOH5Gbi
HlkqB4uIUf7xE6TdF2xehckWMPHGiSPMMkvsBcwFOvetwZeAk5vCaUvzRR3+e3i+VH6ihmdVlkri
8vJZJKwzdTS1wB35cTLanwqQEBgzlT28Ohxi02gTdiitppOiXmw20iatqAJXhzKfWsIY8e0+GvCj
s0mFWM//WwT/L2Z2CeFkEnVCQ9fQUm0gZKBAyNnXGluXP9D9QHFtnrcyNUNYQSn3Eam/CRdWK3+K
oMPMGmR7pLlbDiUaqUGxiU8kgB6pSCqu2kHASmtaRFZS25Xt+mK0rA/qMl56UuWu5okwrjTcPz+g
dLtV+wzC98YM9j4LtZg3ec2yowXMlYLhQTFunZftHePKcgJPELF6oxKg1SFZuORzd4w4YrmzCJRx
GahgDB6Q6NHOiL8P4cmuQ53EpzjB+BExkgZwPpoWRRkFfwzNacymNtU/Dn8ksGUJeMZeA61L+ZW8
xZLjCiuky6+NqrUWWgBMeXw6YkC41TKR27HLL2CPVMy/P9va/XPIJHfIXhuCHxojeB8pJ1iEkNLj
hn+XA/w0+pTSnwDPRfe+rLNGSCbqtBz7gf0E/zurvKbIQ/h7Fqxsg/m6FoIm0jTgshSnnlwPiZ5Y
22ouFWx8E1w1bjRdPtsTHYGwXXhvl4Kx+VaqED1lJKvAra/bwaHUex3zvo02lXyROk1yf2c6RvMU
KzX+ThwFTD6Rl8LPzIJICinWAW8OtRfkEmtNw72cHFGdJvStNBsqhZsVt0QThUVE4V6FuDpFwdcV
iFPdxJHnniHNd+It5ezvtCK3seNXaec5ldkmh666lJGosmHrMUQv16uhWZc=
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
