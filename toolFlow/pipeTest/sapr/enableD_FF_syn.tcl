# set search path, target lib, link path.
# Specify the libraries, tluplus files, import ddc file.
set TSMCPATH /home/lab.apps/vlsiapps/kits/tsmc/N65RF/1.0c/digital
set TARGETCELLLIB $TSMCPATH/Front_End/timing_power_noise/CCS/tcbn65gplus_200a
set search_path   [concat  $search_path $TARGETCELLLIB ./db  $synopsys_root/libraries/syn]
lappend search_path [glob $TSMCPATH/Back_End/milkyway/tcbn65gplus_200a/cell_frame/tcbn65gplus/LM/*]
set target_library "tcbn65gpluswc0d72_ccs.db tcbn65gplusbc0d88_ccs.db tcbn65gplustc0d8_ccs.db"
set symbol_library tcbn65gplustc0d8_ccs.db
set link_path {"*" tcbn65gpluswc0d72_ccs.db tcbn65gplusbc0d88_ccs.db tcbn65gplustc0d8_ccs.db }

set DESIGN enableD_FF
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
$BASE/enableD_FF.sv  \
$BASE/mux2_1.sv \
$BASE/D_FF.sv \
"

set_svf ./$TOPLEVEL.svf
define_design_lib WORK -path ./WORK
read_file -format sverilog $RTL_SOURCE_FILES

link
current_design $TOPLEVEL

# Read Design
# read_file will analyze (read,check) and elaborate(GTech map, DW map) the design in one shot.
#analyze -format verilog -lib WORK ../../src/verilog/pipelined.sv
#elaborate pipelined -lib WORK -update
#analyze -format sverilog -lib WORK {../../src/verilog/D_FF.sv ../../src/verilog/mux2_1.sv ../../src/#verilog/enableD_FF.sv}
#../../src/verilog/NAND_MUX_2x1.sv \
#../../src/verilog/ALUStage.sv \
#../../src/verilog/D_FF.sv \
#../../src/verilog/NAND_MUX_4x1.sv \
#../../src/verilog/adder64.sv \
#../../src/verilog/adderC65.sv \
#../../src/verilog/alu.sv \
#../../src/verilog/andifier.sv \
#../../src/verilog/bitSlice.sv \
#../../src/verilog/completeDataPath.sv \
#../../src/verilog/completeDataPathPipelined.sv \
#../../src/verilog/control.sv \
#../../src/verilogdataMovement.sv \
#../../src/verilog/datamem.sv \ 
#../../src/verilog/decodeStage.sv \
#../../src/verilog/decoder1x2.sv \
#../../src/verilog/decoder2x4.sv \
#../../src/verilog/decoder4x16.sv \
#../../src/verilog/decoder5x32.sv \
#../../src/verilog/divider.sv \
#../../src/verilog/enableD_FF.sv \
#../../src/verilog/forwardingUnit.sv \
#../../src/verilog/fullAdder.sv \
#../../src/verilog/fullAdderArray63.sv \
#../../src/verilog/fullReg32x64.sv \
#../../src/verilog/full_adder.sv \
#../../src/verilog/individualReg64.sv \
#../../src/verilog/instructionFetch.sv \
#../../src/verilog/instructmem.sv \
#../../src/verilog/mapTable.sv \
#../../src/verilog/memStage.sv \
#../../src/verilog/multiplier.sv \
#../../src/verilog/mux16x1.sv \
#../../src/verilog/mux2_1.sv \
#../../src/verilog/mux2x5.sv \
#../../src/verilog/mux2x64.sv \
#../../src/verilog/mux32x1.sv \
#../../src/verilog/mux32x64.sv \
#../../src/verilog/mux32xY.sv \
#../../src/verilog/mux4x1.sv \
#../../src/verilog/mux8x1.sv \
#../../src/verilog/mux_2x1_X64.sv \
#../../src/verilog/mux_2x1_X65.sv \
#../../src/verilog/mux_4x1_X64.sv \
#../../src/verilog/mux_4x1_X65.sv \
#../../src/verilog/norifier.sv \
#../../src/verilog/orGate16.sv \
#../../src/verilog/pipelinedProcessor.sv.sv \
#../../src/verilog/regReadAndWriteStage.sv \
#../../src/verilog/regfile.sv \
#../../src/verilog/registerX16.sv \
#../../src/verilog/registerX64.sv \
#../../src/verilog/registerX65.sv \
#../../src/verilog/shiftLeft2.sv \
#../../src/verilog/shifter.sv \
#../../src/verilog/signExtend12.sv \
#../../src/verilog/signExtend19.sv \
#../../src/verilog/signExtend26.sv \
#../../src/verilog/signExtend9.sv \
#../../src/verilog/wallOfDFFs.sv \
#../../src/verilog/xnorifier.sv \
#../../src/verilog/mux_2x1_X64.sv \
#../../src/verilog/pipelined.sv}
#elaborate enableD_FF
#read_file .tempConcat.sv

#Define environment
set_operating_conditions -analysis_type bc_wc  -min BC0D88COM -max WC0D72COM  -max_library tcbn65gpluswc0d72_ccs -min_library tcbn65gplusbc0d88_ccs
set_min_library tcbn65gpluswc0d72_ccs.db -min_version tcbn65gplusbc0d88_ccs.db

#Loading and drive settings. 
set_driving_cell -lib_cell INVD1 d
set_driving_cell -lib_cell INVD1 reset
set_driving_cell -lib_cell INVD1 enable
set_driving_cell -lib_cell INVD1 clk
#set_driving_cell -lib_cell INVD1 reset
#set_driving_cell -lib_cell INVD1 Clk 
#set_driving_cell -lib_cell INVD1 A
#set_driving_cell -lib_cell INVD1 B

# set_load for outputs
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports q]
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
