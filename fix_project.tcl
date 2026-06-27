#=============================================================================
# MUST run in Vivado Tcl Console with project OPEN:
#   source C:/Users/sgzmd/Desktop/Project/fix_project.tcl
#
# This registers all missing files into Vivado's internal database.
# After this, both GUI "Run Synthesis" and Tcl will work.
#=============================================================================

# ---- 1. Add Verilog sources ----
set src_new C:/Users/sgzmd/Desktop/Project/Project.srcs/sources_1/new

add_files -fileset sources_1 -norecurse \
  ${src_new}/ui_ctrl.v \
  ${src_new}/modulation.v \
  ${src_new}/dds_core.v \
  ${src_new}/dac0832_ctrl.v \
  ${src_new}/vga_ctrl.v \
  ${src_new}/char_gen.v

# ---- 2. Add hex LUT files ----
add_files -fileset sources_1 -norecurse \
  ${src_new}/sine_lut.hex \
  ${src_new}/mod_lut.hex

# ---- 3. Mark for synthesis/implementation/simulation ----
set new_files [get_files -quiet \
  ${src_new}/ui_ctrl.v \
  ${src_new}/modulation.v \
  ${src_new}/dds_core.v \
  ${src_new}/dac0832_ctrl.v \
  ${src_new}/vga_ctrl.v \
  ${src_new}/char_gen.v \
  ${src_new}/sine_lut.hex \
  ${src_new}/mod_lut.hex]

if {[llength $new_files] > 0} {
  set_property used_in_synthesis true    $new_files
  set_property used_in_implementation true $new_files
  set_property used_in_simulation true   $new_files
  puts "Added [llength $new_files] files to sources_1"
} else {
  puts "WARNING: get_files returned empty. Checking individual files..."
  foreach f {ui_ctrl.v modulation.v dds_core.v dac0832_ctrl.v vga_ctrl.v char_gen.v sine_lut.hex mod_lut.hex} {
    set full [file join $src_new $f]
    if {[file exists $full]} {
      puts "  EXISTS: $full"
      add_files -fileset sources_1 $full
    } else {
      puts "  MISSING: $full"
    }
  }
}

# ---- 4. Update compile order ----
update_compile_order -fileset sources_1

# ---- 5. Reset synth run so it regenerates the Tcl with all files ----
if {[get_runs -quiet synth_1] ne ""} {
  reset_run synth_1
}

puts ""
puts "Done. Now close and reopen the project, or run:"
puts "  launch_runs synth_1"
puts "  wait_on_run synth_1"
