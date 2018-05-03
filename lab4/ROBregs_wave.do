onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ROBregs_testbench/dut/decodeReadAddr1_i
add wave -noupdate /ROBregs_testbench/dut/decodeReadAddr2_i
add wave -noupdate /ROBregs_testbench/dut/decodeWriteAddr_i
add wave -noupdate /ROBregs_testbench/dut/completionWriteAddr_i
add wave -noupdate /ROBregs_testbench/dut/commitReadAddr_i
add wave -noupdate /ROBregs_testbench/dut/resets_i
add wave -noupdate /ROBregs_testbench/dut/decodeWriteData_i
add wave -noupdate /ROBregs_testbench/dut/completionWriteData_i
add wave -noupdate /ROBregs_testbench/dut/decodeWriteEn_i
add wave -noupdate /ROBregs_testbench/dut/clk_i
add wave -noupdate /ROBregs_testbench/dut/completionWriteEn_i
add wave -noupdate /ROBregs_testbench/dut/decodeReadData1_o
add wave -noupdate /ROBregs_testbench/dut/decodeReadData2_o
add wave -noupdate /ROBregs_testbench/dut/commitReadData_o
add wave -noupdate /ROBregs_testbench/dut/decodedManagement
add wave -noupdate /ROBregs_testbench/dut/managementDataOut
add wave -noupdate /ROBregs_testbench/dut/managementMuxIns
add wave -noupdate /ROBregs_testbench/dut/decodedCompletion
add wave -noupdate /ROBregs_testbench/dut/completionDataOut
add wave -noupdate /ROBregs_testbench/dut/completionMuxIns
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {216 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 209
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
WaveRestoreZoom {0 ps} {926 ps}
