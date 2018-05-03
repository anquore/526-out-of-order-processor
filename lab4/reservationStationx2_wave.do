onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /reservationStationx2_testbench/dut/decodeROBTag1_i
add wave -noupdate /reservationStationx2_testbench/dut/decodeROBTag2_i
add wave -noupdate /reservationStationx2_testbench/dut/decodeROBTag_i
add wave -noupdate /reservationStationx2_testbench/dut/issueROBTag_i
add wave -noupdate -radix hexadecimal /reservationStationx2_testbench/dut/decodeROBval1_i
add wave -noupdate -radix hexadecimal /reservationStationx2_testbench/dut/decodeROBval2_i
add wave -noupdate -radix hexadecimal /reservationStationx2_testbench/dut/issueROBval_i
add wave -noupdate /reservationStationx2_testbench/dut/decodeWriteEn_i
add wave -noupdate /reservationStationx2_testbench/dut/clk_i
add wave -noupdate /reservationStationx2_testbench/dut/reset_i
add wave -noupdate /reservationStationx2_testbench/dut/stall_i
add wave -noupdate /reservationStationx2_testbench/dut/decodeCommands_i
add wave -noupdate -radix hexadecimal /reservationStationx2_testbench/dut/reservationStationVal1_o
add wave -noupdate -radix hexadecimal /reservationStationx2_testbench/dut/reservationStationVal2_o
add wave -noupdate /reservationStationx2_testbench/dut/reservationStationCommands_o
add wave -noupdate /reservationStationx2_testbench/dut/reservationStationTag_o
add wave -noupdate /reservationStationx2_testbench/dut/ready_o
add wave -noupdate /reservationStationx2_testbench/dut/stall_o
add wave -noupdate /reservationStationx2_testbench/dut/RSwriteEns
add wave -noupdate /reservationStationx2_testbench/dut/RSstalls
add wave -noupdate /reservationStationx2_testbench/dut/RS_busy
add wave -noupdate /reservationStationx2_testbench/dut/RS_ready
add wave -noupdate /reservationStationx2_testbench/dut/RS_val1
add wave -noupdate /reservationStationx2_testbench/dut/RS_val2
add wave -noupdate /reservationStationx2_testbench/dut/RS_commands
add wave -noupdate /reservationStationx2_testbench/dut/RS_tag
add wave -noupdate /reservationStationx2_testbench/dut/busyFlipped
add wave -noupdate /reservationStationx2_testbench/dut/writeEncoder
add wave -noupdate /reservationStationx2_testbench/dut/readyToListenToo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {112500000 ps} 0}
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
WaveRestoreZoom {104756247 ps} {143474997 ps}
