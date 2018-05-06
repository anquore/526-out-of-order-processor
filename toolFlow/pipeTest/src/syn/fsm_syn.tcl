# set search path, target lib, link path.
# Specify the libraries, tluplus files, import ddc file.
set TSMCPATH /home/lab.apps/vlsiapps/kits/tsmc/N65RF/1.0c/digital
set TARGETCELLLIB $TSMCPATH/Front_End/timing_power_noise/CCS/tcbn65gplus_200a
set search_path   [concat  $search_path $TARGETCELLLIB ./db  $synopsys_root/libraries/syn]
lappend search_path [glob $TSMCPATH/Back_End/milkyway/tcbn65gplus_200a/cell_frame/tcbn65gplus/LM/*]
set target_library "tcbn65gpluswc0d72_ccs.db tcbn65gplusbc0d88_ccs.db tcbn65gplustc0d8_ccs.db"
set symbol_library tcbn65gplustc0d8_ccs.db
set link_path {"*" tcbn65gpluswc0d72_ccs.db tcbn65gplusbc0d88_ccs.db tcbn65gplustc0d8_ccs.db }

set mw_techfile_path $TSMCPATH/Back_End/milkyway/tcbn65gplus_200a/techfiles
set mw_tech_file $mw_techfile_path/tsmcn65_9lmT2.tf
set mw_reference_library $TSMCPATH/Back_End/milkyway/tcbn65gplus_200a/frame_only/tcbn65gplus
create_mw_lib -technology $mw_tech_file -mw_reference_library $mw_reference_library pipelined_design      
open_mw_lib pipelined_design

set_tlu_plus_files \
-max_tluplus $mw_techfile_path/tluplus/cln65g+_1p09m+alrdl_rcbest_top2.tluplus \
-min_tluplus $mw_techfile_path/tluplus/cln65g+_1p09m+alrdl_rcworst_top2.tluplus \
-tech2itf_map $mw_techfile_path/tluplus/star.map_9M


#################################### pipelined #####################################
# Read Design
# read_file will analyze (read,check) and elaborate(GTech map, DW map) the design in one shot.
read_file pipelined.v

#Define environment
set_operating_conditions -analysis_type bc_wc  -min BC0D88COM -max WC0D72COM  -max_library tcbn65gpluswc0d72_ccs -min_library tcbn65gplusbc0d88_ccs
set_min_library tcbn65gpluswc0d72_ccs.db -min_version tcbn65gplusbc0d88_ccs.db

#Loading and drive settings. 
set_driving_cell -lib_cell INVD1 Reset
set_driving_cell -lib_cell INVD1 Clock 
set_driving_cell -lib_cell INVD1 A
set_driving_cell -lib_cell INVD1 B
# set_load for outputs
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports Status]
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports Output1]
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports Output2]

#connect referenced library components to the current design
link

#Define design constraints
set_max_transition 0.1 [get_designs pipelined]
set_max_fanout 6 pipelined
create_clock -name "clk" -period 2 -waveform {0 1} [get_ports Clock]
set_clock_uncertainty -setup 0.05 clk
set_clock_uncertainty -hold 0.01 clk
set_clock_transition 0.05 [get_clocks]
set_input_delay 0.1 -clock clk [remove_from_collection [all_inputs] [get_ports Clock]]
set_fix_hold {clk}

#Compile ultra will take care of ungrouping and flattening for improved performance. 
set_critical_range 0.04 $current_design
compile_ultra
check_design

#write out design files
file mkdir reports
report_power > reports/pipelined.power
report_constraint -verbose > reports/pipelined.constraint
report_constraint -all_violators > reports/pipelined.violation
write_sdc  reports/pipelined.sdc
file mkdir db
write -h pipelined -output ./db/pipelined.db
write_sdf -context verilog -version 1.0 reports/pipelined.sdf
file mkdir netlist
write -h -f verilog pipelined -output netlist/pipelined.v -pg
file mkdir ddc
write_file -format ddc -hierarchy -output ddc/DIG_TOP.ddc
