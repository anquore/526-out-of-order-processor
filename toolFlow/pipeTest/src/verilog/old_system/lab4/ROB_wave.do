onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ROB_testbench/dut/decodeReadAddr1_i
add wave -noupdate /ROB_testbench/dut/decodeReadAddr2_i
add wave -noupdate /ROB_testbench/dut/completionWriteAddr_i
add wave -noupdate /ROB_testbench/dut/decodeWriteData_i
add wave -noupdate /ROB_testbench/dut/completionWriteData_i
add wave -noupdate /ROB_testbench/dut/reset_i
add wave -noupdate /ROB_testbench/dut/clk_i
add wave -noupdate /ROB_testbench/dut/completionWriteEn_i
add wave -noupdate /ROB_testbench/dut/updateHead_i
add wave -noupdate /ROB_testbench/dut/updateTail_i
add wave -noupdate /ROB_testbench/dut/decodeReadData1_o
add wave -noupdate /ROB_testbench/dut/decodeReadData2_o
add wave -noupdate -radix hexadecimal /ROB_testbench/dut/commitReadData_o
add wave -noupdate /ROB_testbench/dut/nextTail_o
add wave -noupdate /ROB_testbench/dut/stall_o
add wave -noupdate /ROB_testbench/dut/head
add wave -noupdate /ROB_testbench/dut/tail
add wave -noupdate /ROB_testbench/dut/headNext
add wave -noupdate /ROB_testbench/dut/tailNext
add wave -noupdate /ROB_testbench/dut/stall
add wave -noupdate /ROB_testbench/dut/decodeWriteEn
add wave -noupdate /ROB_testbench/dut/decodeReadAddr1sub1
add wave -noupdate /ROB_testbench/dut/decodeReadAddr2sub1
add wave -noupdate /ROB_testbench/dut/decodeReadData1
add wave -noupdate /ROB_testbench/dut/decodeReadData2
add wave -noupdate /ROB_testbench/dut/resets
add wave -noupdate /ROB_testbench/dut/completionWriteAddrsub1
add wave -noupdate -expand /ROB_testbench/dut/theRegs/managementDataOut
add wave -noupdate -childformat {{{/ROB_testbench/dut/theRegs/completionDataOut[7]} -radix hexadecimal} {{/ROB_testbench/dut/theRegs/completionDataOut[6]} -radix hexadecimal} {{/ROB_testbench/dut/theRegs/completionDataOut[5]} -radix hexadecimal} {{/ROB_testbench/dut/theRegs/completionDataOut[4]} -radix hexadecimal} {{/ROB_testbench/dut/theRegs/completionDataOut[3]} -radix hexadecimal} {{/ROB_testbench/dut/theRegs/completionDataOut[2]} -radix hexadecimal} {{/ROB_testbench/dut/theRegs/completionDataOut[1]} -radix hexadecimal} {{/ROB_testbench/dut/theRegs/completionDataOut[0]} -radix hexadecimal}} -expand -subitemconfig {{/ROB_testbench/dut/theRegs/completionDataOut[7]} {-radix hexadecimal} {/ROB_testbench/dut/theRegs/completionDataOut[6]} {-radix hexadecimal} {/ROB_testbench/dut/theRegs/completionDataOut[5]} {-radix hexadecimal} {/ROB_testbench/dut/theRegs/completionDataOut[4]} {-radix hexadecimal} {/ROB_testbench/dut/theRegs/completionDataOut[3]} {-radix hexadecimal} {/ROB_testbench/dut/theRegs/completionDataOut[2]} {-radix hexadecimal} {/ROB_testbench/dut/theRegs/completionDataOut[1]} {-radix hexadecimal} {/ROB_testbench/dut/theRegs/completionDataOut[0]} {-radix hexadecimal}} /ROB_testbench/dut/theRegs/completionDataOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {78798602 ps} 0}
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
WaveRestoreZoom {73185938 ps} {98779688 ps}
