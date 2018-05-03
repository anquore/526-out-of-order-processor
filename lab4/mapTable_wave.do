onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mapTable_testbench/dut/decodeReadAddr1
add wave -noupdate /mapTable_testbench/dut/decodeReadAddr2
add wave -noupdate /mapTable_testbench/dut/decodeWriteAddr
add wave -noupdate /mapTable_testbench/dut/commitReadAddr_i
add wave -noupdate /mapTable_testbench/dut/decodeWriteData
add wave -noupdate /mapTable_testbench/dut/decodeRegWrite
add wave -noupdate /mapTable_testbench/dut/clk
add wave -noupdate /mapTable_testbench/dut/reset
add wave -noupdate /mapTable_testbench/dut/resets_i
add wave -noupdate /mapTable_testbench/dut/decodeReadData1
add wave -noupdate /mapTable_testbench/dut/decodeReadData2
add wave -noupdate /mapTable_testbench/dut/commitReadData
add wave -noupdate /mapTable_testbench/dut/decoded
add wave -noupdate /mapTable_testbench/dut/doAReset
add wave -noupdate /mapTable_testbench/dut/dataOut
add wave -noupdate /mapTable_testbench/dut/muxIns
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1162499303 ps} 0}
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
WaveRestoreZoom {1162499050 ps} {1162500050 ps}
