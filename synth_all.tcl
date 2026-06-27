#=============================================================================
# Standalone synthesis script — reads all sources directly, bypasses project.
# Run in Vivado Tcl Console:  source synth_all.tcl
#=============================================================================

# Create in-memory project
create_project -in_memory -part xc7a35tcsg324-1
set_property target_language Verilog [current_project]
set_property default_lib xil_defaultlib [current_project]

# ---- All Verilog source files ----
set src_dir C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new

read_verilog -library xil_defaultlib {
  ${src_dir}/Oscilloscope_Acq.v
  ${src_dir}/Wave_Data_Mapper.v
  ${src_dir}/Top_Project.v
  ${src_dir}/ui_ctrl.v
  ${src_dir}/modulation.v
  ${src_dir}/dds_core.v
  ${src_dir}/dac0832_ctrl.v
  ${src_dir}/vga_ctrl.v
  ${src_dir}/char_gen.v
}

# ---- IP cores ----
read_ip -quiet C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
read_ip -quiet C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci

# ---- Hex LUT files (for $readmemh in dds_core.v and modulation.v) ----
add_files -norecurse {
  ${src_dir}/sine_lut.hex
  ${src_dir}/mod_lut.hex
}

# ---- Constraints ----
read_xdc C:/Users/sgzmd/Desktop/Project/Project.srcs/constrs_1/new/all.xdc

# ---- Synthesis ----
synth_design -top Top_Project -part xc7a35tcsg324-1

# ---- Reports ----
write_checkpoint -force Top_Project_synth.dcp
report_utilization -file Top_Project_utilization_synth.rpt
puts ""
puts "================================================"
puts "Synthesis complete. Checkpoint: Top_Project_synth.dcp"
puts "================================================"
