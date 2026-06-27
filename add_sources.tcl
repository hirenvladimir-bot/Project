#=============================================================================
# Add missing PocketScope source files to the Vivado project
# Run this in Vivado Tcl Console: source add_sources.tcl
#=============================================================================

# Add Verilog design sources
add_files -norecurse -fileset sources_1 {
  C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new/ui_ctrl.v
  C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new/modulation.v
  C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new/dds_core.v
  C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new/dac0832_ctrl.v
  C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new/vga_ctrl.v
  C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new/char_gen.v
}

# Add hex LUT files needed by $readmemh in dds_core.v and modulation.v
add_files -norecurse -fileset sources_1 {
  C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new/sine_lut.hex
  C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new/mod_lut.hex
}

# Mark all as used in synthesis, implementation, and simulation
set_property used_in_synthesis    true [get_files -of_objects [get_filesets sources_1] {ui_ctrl.v modulation.v dds_core.v dac0832_ctrl.v vga_ctrl.v char_gen.v sine_lut.hex mod_lut.hex}]
set_property used_in_implementation true [get_files -of_objects [get_filesets sources_1] {ui_ctrl.v modulation.v dds_core.v dac0832_ctrl.v vga_ctrl.v char_gen.v sine_lut.hex mod_lut.hex}]
set_property used_in_simulation   true [get_files -of_objects [get_filesets sources_1] {ui_ctrl.v modulation.v dds_core.v dac0832_ctrl.v vga_ctrl.v char_gen.v sine_lut.hex mod_lut.hex}]

puts "Done. Added 8 files to sources_1."
puts "Now run: reset_run synth_1 ; launch_runs synth_1"
