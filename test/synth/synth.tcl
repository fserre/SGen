proc reportCriticalPaths {} {
foreach path [get_timing_paths -delay_type max -max_paths 1 -nworst 1] {
# Get the slack on the Timing Path object
set slack [get_property SLACK $path]
# Save the collected path details to the CSV file
puts "Worst slack: $slack"
}
return 0
}; # End PROC

set_param general.maxThreads 1
# STEP#2: setup design sources and constraints
#
{{deps}}
read_verilog ./{{project}}
read_xdc ./clock.xdc
#
# STEP#3: run synthesis, write design checkpoint, report timing,
# and utilization estimates
# previously xc7vx1140tflg1930-2
synth_design -top main -part {{XILINX_PART}} -mode out_of_context

# STEP#4: run logic optimization, placement and physical logic optimization,
# write design checkpoint, report utilization and timing estimates
#
opt_design
reportCriticalPaths
place_design
#
# Optionally run optimization if there are timing violations after placement
#if {[get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]] < 0} {
# puts "Found setup timing violations => running physical optimization"
# phys_opt_design
#}
puts ""
puts ""
puts ""
report_utilization
puts ""
puts ""
puts ""
report_power
puts ""
puts ""
puts ""
