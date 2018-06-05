onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /branchPrediction_testbench/dut/anUpdate_i
add wave -noupdate /branchPrediction_testbench/dut/brTaken_i
add wave -noupdate /branchPrediction_testbench/dut/branchAddrRead_i
add wave -noupdate /branchPrediction_testbench/dut/branchAddrWrite_i
add wave -noupdate /branchPrediction_testbench/dut/clk_i
add wave -noupdate /branchPrediction_testbench/dut/dataOut
add wave -noupdate /branchPrediction_testbench/dut/decoded
add wave -noupdate /branchPrediction_testbench/dut/reset
add wave -noupdate /branchPrediction_testbench/dut/reset_i
add wave -noupdate /branchPrediction_testbench/dut/whatToDoBranch_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {92 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
