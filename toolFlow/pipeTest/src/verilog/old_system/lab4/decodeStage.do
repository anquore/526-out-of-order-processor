# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./mux2_1.sv"
vlog "./D_FF.sv"
vlog "./enableD_FF.sv"
vlog "./individualReg64.sv"
vlog "./fullReg32x64.sv"
vlog "./decoder2x4.sv"
vlog "./decoder1x2.sv"
vlog "./decoder4x16.sv"
vlog "./decoder5x32.sv"
vlog "./mux4x1.sv"
vlog "./mux8x1.sv"
vlog "./mux16x1.sv"
vlog "./mux32x1.sv"
vlog "./mux32x64.sv"
vlog "./mux2x64.sv"
vlog "./mux2x5.sv"
vlog "./wallOfDFFs.sv"
vlog "./decodeStage.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work decodeStage_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do decodeStage_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End