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
create_mw_lib -technology $mw_tech_file -mw_reference_library $mw_reference_library pipelinedProcessorOOO_design      
open_mw_lib pipelinedProcessorOOO_design

set_tlu_plus_files \
-max_tluplus $mw_techfile_path/tluplus/cln65g+_1p09m+alrdl_rcbest_top2.tluplus \
-min_tluplus $mw_techfile_path/tluplus/cln65g+_1p09m+alrdl_rcworst_top2.tluplus \
-tech2itf_map $mw_techfile_path/tluplus/star.map_9M


#################################### pipelinedProcessorOOO #####################################
# Read Design
# read_file will analyze (read,check) and elaborate(GTech map, DW map) the design in one shot.
#read_file "pipelined.sv NAND_MUX_2x1.sv  ALUStage.sv D_FF.sv NAND_MUX_4x1.sv adder64.sv adderC65.sv alu.sv andifier.sv bitSlice.sv completeDataPathPipelined.sv control.sv dataMovement.sv datamem.sv decodeStage.sv decoder1x2.sv decoder2x4.sv decoder4x16.sv decoder5x32.sv divider.sv enableD_FF.sv forwardingUnit.sv fullAdder.sv fullAdderArray63.sv fullReg32x64.sv full_adder.sv individualReg64.sv instructionFetch.sv instructmem.sv memStage.sv multiplier.sv mux16x1.sv mux2_1.sv mux2x5.sv mux2x64.sv mux32x1.sv mux32x64.sv mux32xY.sv mux4x1.sv mux8x1.sv mux_2x1_X64.sv mux_2x1_X65.sv mux_4x1_X65.sv norifier.sv orGate16.sv regReadAndWriteStage.sv regfile.sv registerX16.sv registerX64.sv registerX65.sv shiftLeft2.sv shifter.sv signExtend12.sv signExtend19.sv signExtend26.sv signExtend9.sv wallOfDFFs.sv xnorifier.sv FF_en.sv" 

analyze -format sverilog -lib WORK {../onlyv/.}

elaborate pipelinedProcessorOOO

#Define environment
set_operating_conditions -analysis_type bc_wc  -min BC0D88COM -max WC0D72COM  -max_library tcbn65gpluswc0d72_ccs -min_library tcbn65gplusbc0d88_ccs
set_min_library tcbn65gpluswc0d72_ccs.db -min_version tcbn65gplusbc0d88_ccs.db

#Loading and drive settings. 
set_driving_cell -lib_cell INVD1 reset
set_driving_cell -lib_cell INVD1 clk
set_driving_cell -lib_cell INVD1 imem_instruction_i
set_driving_cell -lib_cell INVD1 dmem_readData

 
#set_driving_cell -lib_cell INVD1 A
#set_driving_cell -lib_cell INVD1 B
# set_load for outputs
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports imem_address_o]
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports dmem_WriteData]
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports dmem_addressLoad]
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports dmem_addressStore]
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports dmem_readEn]
set_load [load_of tcbn65gpluswc0d72_ccs/INVD1/I] [get_ports dmem_writeEn]

#connect referenced library components to the current design
link

#Define design constraints
set_max_transition 0.1 [get_designs pipelinedProcessorOOO]
set_max_fanout 6 pipelinedProcessorOOO
create_clock -name "clk" -period 20 -waveform {0 1} [get_ports clk]
set_clock_uncertainty -setup 2 clk
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
report_power > reports/pipelinedProcessorOOO.power
report_constraint -verbose > reports/pipelinedProcessorOOO.constraint
report_constraint -all_violators > reports/pipelinedProcessorOOO.violation
write_sdc  reports/pipelinedProcessorOOO.sdc
file mkdir db
write -h pipelinedProcessorOOO -output ./db/pipelinedProcessorOOO.db
write_sdf -context verilog -version 1.0 reports/pipelinedProcessorOOO.sdf
file mkdir netlist
write -h -f verilog pipelinedProcessorOOO -output netlist/pipelinedSynOOO.sv -pg
file mkdir ddc
write_file -format ddc -hierarchy -output ddc/DIG_TOP.ddc
