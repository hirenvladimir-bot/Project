# =============================================================================
# EGO1 / pocket instrument constraints
# Top module: Top_Project
# =============================================================================

set_property PACKAGE_PIN P17 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
create_clock -add -name sys_clk_pin -period 10.000 -waveform {0.000 5.000} [get_ports sys_clk]

set_property PACKAGE_PIN P15 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# Buttons, mapped as required by FPGA�ڴ����������ֲ�.md.
set_property PACKAGE_PIN R15 [get_ports btn_center]
set_property PACKAGE_PIN V1  [get_ports btn_left]
set_property PACKAGE_PIN R11 [get_ports btn_right]
set_property PACKAGE_PIN U4  [get_ports btn_up]
set_property PACKAGE_PIN R17 [get_ports btn_down]
set_property IOSTANDARD LVCMOS33 [get_ports {btn_center btn_left btn_right btn_up btn_down}]

# Slide switches (8x, EGO1 built-in) — matches pocketscope_sim2_0
#   sw[1:0] = main mode, sw[4:2] = sub-mode, sw[7:5] = freq coarse
set_property PACKAGE_PIN R1 [get_ports {sw[0]}]
set_property PACKAGE_PIN N4 [get_ports {sw[1]}]
set_property PACKAGE_PIN M4 [get_ports {sw[2]}]
set_property PACKAGE_PIN R2 [get_ports {sw[3]}]
set_property PACKAGE_PIN P2 [get_ports {sw[4]}]
set_property PACKAGE_PIN P3 [get_ports {sw[5]}]
set_property PACKAGE_PIN P4 [get_ports {sw[6]}]
set_property PACKAGE_PIN P5 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[*]}]

# DIP switches (8x, EGO1 built-in) — frequency fine adjust
set_property PACKAGE_PIN T5 [get_ports {dip[0]}]
set_property PACKAGE_PIN T3 [get_ports {dip[1]}]
set_property PACKAGE_PIN R3 [get_ports {dip[2]}]
set_property PACKAGE_PIN V4 [get_ports {dip[3]}]
set_property PACKAGE_PIN V5 [get_ports {dip[4]}]
set_property PACKAGE_PIN V2 [get_ports {dip[5]}]
set_property PACKAGE_PIN U2 [get_ports {dip[6]}]
set_property PACKAGE_PIN U3 [get_ports {dip[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dip[*]}]

# VGA 4:4:4 RGB output.
set_property PACKAGE_PIN F5 [get_ports {vga_r[0]}]
set_property PACKAGE_PIN C6 [get_ports {vga_r[1]}]
set_property PACKAGE_PIN C5 [get_ports {vga_r[2]}]
set_property PACKAGE_PIN B7 [get_ports {vga_r[3]}]
set_property PACKAGE_PIN B6 [get_ports {vga_g[0]}]
set_property PACKAGE_PIN A6 [get_ports {vga_g[1]}]
set_property PACKAGE_PIN A5 [get_ports {vga_g[2]}]
set_property PACKAGE_PIN D8 [get_ports {vga_g[3]}]
set_property PACKAGE_PIN C7 [get_ports {vga_b[0]}]
set_property PACKAGE_PIN E6 [get_ports {vga_b[1]}]
set_property PACKAGE_PIN E5 [get_ports {vga_b[2]}]
set_property PACKAGE_PIN E7 [get_ports {vga_b[3]}]
set_property PACKAGE_PIN D7 [get_ports vga_hs]
set_property PACKAGE_PIN C4 [get_ports vga_vs]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_r[*] vga_g[*] vga_b[*] vga_hs vga_vs}]

# DAC0832 output bus and control pins.
set_property PACKAGE_PIN T8 [get_ports {dac_data[0]}]
set_property PACKAGE_PIN R8 [get_ports {dac_data[1]}]
set_property PACKAGE_PIN T6 [get_ports {dac_data[2]}]
set_property PACKAGE_PIN R7 [get_ports {dac_data[3]}]
set_property PACKAGE_PIN U6 [get_ports {dac_data[4]}]
set_property PACKAGE_PIN U7 [get_ports {dac_data[5]}]
set_property PACKAGE_PIN V9 [get_ports {dac_data[6]}]
set_property PACKAGE_PIN U9 [get_ports {dac_data[7]}]
set_property PACKAGE_PIN R5 [get_ports dac_ile]
set_property PACKAGE_PIN N6 [get_ports dac_cs_n]
set_property PACKAGE_PIN V6 [get_ports dac_wr1_n]
set_property PACKAGE_PIN R6 [get_ports dac_wr2_n]
set_property PACKAGE_PIN V7 [get_ports dac_xfer_n]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[*] dac_ile dac_cs_n dac_wr1_n dac_wr2_n dac_xfer_n}]

# XADC analog inputs on VAUX2 and VAUX10.
set_property PACKAGE_PIN B16 [get_ports vauxp_ch1]
set_property PACKAGE_PIN B17 [get_ports vauxn_ch1]
set_property PACKAGE_PIN A15 [get_ports vauxp_ch2]
set_property PACKAGE_PIN A16 [get_ports vauxn_ch2]
set_property IOSTANDARD LVCMOS33 [get_ports {vauxp_ch1 vauxn_ch1 vauxp_ch2 vauxn_ch2}]

# AFE and analog switch controls. CD74HC4053 enables are active low.
set_property PACKAGE_PIN G14 [get_ports ch1_range_sel]
set_property PACKAGE_PIN H14 [get_ports ch2_range_sel]
set_property PACKAGE_PIN D17 [get_ports ch1_acdc_sel]
set_property PACKAGE_PIN E17 [get_ports ch2_acdc_sel]
set_property PACKAGE_PIN J13 [get_ports ch1_switch_en_n]
set_property PACKAGE_PIN K13 [get_ports ch2_switch_en_n]
set_property PACKAGE_PIN H17 [get_ports sg_en_n]
set_property PACKAGE_PIN G17 [get_ports sg_out_sel]
set_property IOSTANDARD LVCMOS33 [get_ports {ch1_range_sel ch2_range_sel ch1_acdc_sel ch2_acdc_sel ch1_switch_en_n ch2_switch_en_n sg_en_n sg_out_sel}]
