# set search path, target lib, link path.
# Specify the libraries, tluplus files, import ddc file.
set TSMCPATH /home/lab.apps/vlsiapps/kits/tsmc/N65RF/1.0c/digital
set TARGETCELLLIB $TSMCPATH/Front_End/timing_power_noise/CCS/tcbn65gplus_200a
set search_path   [concat  $search_path $TARGETCELLLIB ./db  $synopsys_root/libraries/syn]
lappend search_path [glob $TSMCPATH/Back_End/milkyway/tcbn65gplus_200a/cell_frame/tcbn65gplus/LM/*]
set target_library "tcbn65gpluswc0d72_ccs.db tcbn65gplusbc0d88_ccs.db tcbn65gplustc0d8_ccs.db"
set symbol_library tcbn65gplustc0d8_ccs.db
set link_path {"*" tcbn65gpluswc0d72_ccs.db tcbn65gplusbc0d88_ccs.db tcbn65gplustc0d8_ccs.db }

set DESIGN pipelined
set mw_techfile_path $TSMCPATH/Back_End/milkyway/tcbn65gplus_200a/techfiles
set mw_tech_file $mw_techfile_path/tsmcn65_9lmT2.tf
set mw_reference_library $TSMCPATH/Back_End/milkyway/tcbn65gplus_200a/frame_only/tcbn65gplus
create_mw_lib -technology $mw_tech_file -mw_reference_library $mw_reference_library ${DESIGN}_design
open_mw_lib ${DESIGN}_design

set_tlu_plus_files \
-max_tluplus $mw_techfile_path/tluplus/cln65g+_1p09m+alrdl_rcbest_top2.tluplus \
-min_tluplus $mw_techfile_path/tluplus/cln65g+_1p09m+alrdl_rcworst_top2.tluplus \
-tech2itf_map $mw_techfile_path/tluplus/star.map_9M


#################################### pipelined #####################################

# dc_shell spends a lot of time searching directories for files otherwise...
set BASE ../../src/verilog
set TOPLEVEL $DESIGN

# npu-related source files
set RTL_SOURCE_FILES "\
$BASE/NAND_MUX_2x1.sv \
$BASE/ALUStage.sv \
$BASE/D_FF.sv \
$BASE/NAND_MUX_4x1.sv \
$BASE/adder64.sv \
$BASE/adderC65.sv \
$BASE/alu.sv \
$BASE/andifier.sv \
$BASE/bitSlice.sv \
$BASE/completeDataPath.sv \
$BASE/completeDataPathPipelined.sv \
$BASE/control.sv \
$BASE/dataMovement.sv \
$BASE/datamem.sv \
$BASE/decodeStage.sv \
$BASE/decoder1x2.sv \
$BASE/decoder2x4.sv \
$BASE/decoder4x16.sv \
$BASE/decoder5x32.sv \
$BASE/divider.sv \
$BASE/enableD_FF.sv \
$BASE/forwardingUnit.sv \
$BASE/fullAdder.sv \
$BASE/fullAdderArray63.sv \
$BASE/fullReg32x64.sv \
$BASE/full_adder.sv \
$BASE/individualReg64.sv \
$BASE/instructionFetch.sv \
$BASE/instructmem.sv \
$BASE/mapTable.sv \
$BASE/memStage.sv \
$BASE/multiplier.sv \
$BASE/mux16x1.sv \
$BASE/mux2_1.sv \
$BASE/mux2x5.sv \
$BASE/mux2x64.sv \
$BASE/mux32x1.sv \
$BASE/mux32x64.sv \
$BASE/mux32xY.sv \
$BASE/mux4x1.sv \
$BASE/mux8x1.sv \
$BASE/mux_2x1_X64.sv \
$BASE/mux_2x1_X65.sv \
$BASE/mux_4x1_X64.sv \
$BASE/mux_4x1_X65.sv \
$BASE/norifier.sv \
$BASE/orGate16.sv \
$BASE/pipelinedProcessor.sv \
$BASE/regReadAndWriteStage.sv \
$BASE/regfile.sv \
$BASE/registerX16.sv \
$BASE/registerX64.sv \
$BASE/registerX65.sv \
$BASE/shiftLeft2.sv \
$BASE/shifter.sv \
$BASE/signExtend12.sv \
$BASE/signExtend19.sv \
$BASE/signExtend26.sv \
$BASE/signExtend9.sv \
$BASE/wallOfDFFs.sv \
$BASE/xnorifier.sv \
$BASE/pipelined.sv\
"

set_svf ./$TOPLEVEL.svf
define_design_lib WORK -path ./WORK
read_file -format sverilog $RTL_SOURCE_FILES

link
current_design $TOPLEVEL

#Define environment
set_operating_conditions -analysis_type bc_wc  -min BC0D88COM -max WC0D72COM  -max_library tcbn65gpluswc0d72_ccs -min_library tcbn65gplusbc0d88_ccs
set_min_library tcbn65gpluswc0d72_ccs.db -min_version tcbn65gplusbc0d88_ccs.db

#Loading and drive settings. 
set_driving_cell -lib_cell INVD1 clk
set_driving_cell -lib_cell INVD1 reset
#set_driving_cell -lib_cell INVD1 enable
#set_driving_cell -lib_cell INVD1 clk
#set_driving_cell -lib_cell INVD1 reset
#set_driving_cell -lib_cell INVD1 Clk 
#set_driving_cell -lib_cell INVD1 A
#set_driving_cell -lib_cell INVD1 B

# set_load for outputs
#set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports q]
#set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports Status]
#set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports Output1]
#set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports Output2]

#connect referenced library components to the current design
#link

#Define design constraints
set_max_transition 0.1 [get_designs $DESIGN]
set_max_fanout 6 $DESIGN
create_clock -name "clk" -period 2 -waveform {0 1} [get_ports clk]
set_clock_uncertainty -setup 0.05 clk
set_clock_uncertainty -hold 0.01 clk
set_clock_transition 0.05 [get_clocks]
set_input_delay 0.1 -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_fix_hold {clk}

#Compile ultra will take care of ungrouping and flattening for improved performance. 
set_critical_range 0.04 $current_design
compile_ultra
check_design

#write out design files
file mkdir reports
report_power > reports/${DESIGN}.power
report_constraint -verbose > reports/${DESIGN}.constraint
report_constraint -all_violators > reports/${DESIGN}.violation
write_sdc  reports/${DESIGN}.sdc
file mkdir db
write -h $DESIGN -output ./db/${DESIGN}.db
write_sdf -context verilog -version 1.0 reports/${DESIGN}.sdf
file mkdir netlist
write -h -f verilog $DESIGN -output netlist/${DESIGN}.v -pg
file mkdir ddc
write_file -format ddc -hierarchy -output ddc/DIG_TOP.ddc
