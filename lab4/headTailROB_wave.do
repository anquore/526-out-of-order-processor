onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /headTailROB_testbench/dut/reset_i
add wave -noupdate /headTailROB_testbench/dut/clk_i
add wave -noupdate /headTailROB_testbench/dut/updateHead_i
add wave -noupdate /headTailROB_testbench/dut/updateTail_i
add wave -noupdate /headTailROB_testbench/dut/head_o
add wave -noupdate /headTailROB_testbench/dut/tail_o
add wave -noupdate /headTailROB_testbench/dut/stall_o
add wave -noupdate /headTailROB_testbench/dut/head
add wave -noupdate /headTailROB_testbench/dut/tail
add wave -noupdate /headTailROB_testbench/dut/headNext
add wave -noupdate /headTailROB_testbench/dut/tailNext
add wave -noupdate /headTailROB_testbench/dut/headReset
add wave -noupdate /headTailROB_testbench/dut/tailReset
add wave -noupdate /headTailROB_testbench/dut/stall
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {193 ps} 0}
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
