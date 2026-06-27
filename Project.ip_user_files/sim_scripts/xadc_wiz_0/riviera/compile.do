transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+D:/FPGA/2025.1/Vivado/data/rsb/busdef" -l xpm -l xil_defaultlib \
"D:/FPGA/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/FPGA/2025.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"D:/FPGA/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+D:/FPGA/2025.1/Vivado/data/rsb/busdef" -l xpm -l xil_defaultlib \
"../../../../Project.gen/sources_1/ip/xadc_wiz_0/xadc_wiz_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

