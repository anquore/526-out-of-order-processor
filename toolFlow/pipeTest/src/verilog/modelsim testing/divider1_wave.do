onerror {resume}
quietly virtual signal -install /divider1_testbench/DUT { /divider1_testbench/DUT/opA[63:0]} opA64
quietly virtual signal -install /divider1_testbench/DUT { /divider1_testbench/DUT/opB[63:0]} opB64
quietly virtual signal -install /divider1_testbench/DUT { /divider1_testbench/DUT/opC[63:0]} opC64
quietly virtual signal -install /divider1_testbench/DUT { /divider1_testbench/DUT/opC_mux[63:0]} opC_mux64
quietly virtual signal -install /divider1_testbench/DUT { /divider1_testbench/DUT/add_out[63:0]} add_out64
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /divider1_testbench/quotient
add wave -noupdate -radix binary /divider1_testbench/valid_out
add wave -noupdate -radix decimal -childformat {{{/divider1_testbench/dividend[63]} -radix decimal} {{/divider1_testbench/dividend[62]} -radix decimal} {{/divider1_testbench/dividend[61]} -radix decimal} {{/divider1_testbench/dividend[60]} -radix decimal} {{/divider1_testbench/dividend[59]} -radix decimal} {{/divider1_testbench/dividend[58]} -radix decimal} {{/divider1_testbench/dividend[57]} -radix decimal} {{/divider1_testbench/dividend[56]} -radix decimal} {{/divider1_testbench/dividend[55]} -radix decimal} {{/divider1_testbench/dividend[54]} -radix decimal} {{/divider1_testbench/dividend[53]} -radix decimal} {{/divider1_testbench/dividend[52]} -radix decimal} {{/divider1_testbench/dividend[51]} -radix decimal} {{/divider1_testbench/dividend[50]} -radix decimal} {{/divider1_testbench/dividend[49]} -radix decimal} {{/divider1_testbench/dividend[48]} -radix decimal} {{/divider1_testbench/dividend[47]} -radix decimal} {{/divider1_testbench/dividend[46]} -radix decimal} {{/divider1_testbench/dividend[45]} -radix decimal} {{/divider1_testbench/dividend[44]} -radix decimal} {{/divider1_testbench/dividend[43]} -radix decimal} {{/divider1_testbench/dividend[42]} -radix decimal} {{/divider1_testbench/dividend[41]} -radix decimal} {{/divider1_testbench/dividend[40]} -radix decimal} {{/divider1_testbench/dividend[39]} -radix decimal} {{/divider1_testbench/dividend[38]} -radix decimal} {{/divider1_testbench/dividend[37]} -radix decimal} {{/divider1_testbench/dividend[36]} -radix decimal} {{/divider1_testbench/dividend[35]} -radix decimal} {{/divider1_testbench/dividend[34]} -radix decimal} {{/divider1_testbench/dividend[33]} -radix decimal} {{/divider1_testbench/dividend[32]} -radix decimal} {{/divider1_testbench/dividend[31]} -radix decimal} {{/divider1_testbench/dividend[30]} -radix decimal} {{/divider1_testbench/dividend[29]} -radix decimal} {{/divider1_testbench/dividend[28]} -radix decimal} {{/divider1_testbench/dividend[27]} -radix decimal} {{/divider1_testbench/dividend[26]} -radix decimal} {{/divider1_testbench/dividend[25]} -radix decimal} {{/divider1_testbench/dividend[24]} -radix decimal} {{/divider1_testbench/dividend[23]} -radix decimal} {{/divider1_testbench/dividend[22]} -radix decimal} {{/divider1_testbench/dividend[21]} -radix decimal} {{/divider1_testbench/dividend[20]} -radix decimal} {{/divider1_testbench/dividend[19]} -radix decimal} {{/divider1_testbench/dividend[18]} -radix decimal} {{/divider1_testbench/dividend[17]} -radix decimal} {{/divider1_testbench/dividend[16]} -radix decimal} {{/divider1_testbench/dividend[15]} -radix decimal} {{/divider1_testbench/dividend[14]} -radix decimal} {{/divider1_testbench/dividend[13]} -radix decimal} {{/divider1_testbench/dividend[12]} -radix decimal} {{/divider1_testbench/dividend[11]} -radix decimal} {{/divider1_testbench/dividend[10]} -radix decimal} {{/divider1_testbench/dividend[9]} -radix decimal} {{/divider1_testbench/dividend[8]} -radix decimal} {{/divider1_testbench/dividend[7]} -radix decimal} {{/divider1_testbench/dividend[6]} -radix decimal} {{/divider1_testbench/dividend[5]} -radix decimal} {{/divider1_testbench/dividend[4]} -radix decimal} {{/divider1_testbench/dividend[3]} -radix decimal} {{/divider1_testbench/dividend[2]} -radix decimal} {{/divider1_testbench/dividend[1]} -radix decimal} {{/divider1_testbench/dividend[0]} -radix decimal}} -subitemconfig {{/divider1_testbench/dividend[63]} {-height 15 -radix decimal} {/divider1_testbench/dividend[62]} {-height 15 -radix decimal} {/divider1_testbench/dividend[61]} {-height 15 -radix decimal} {/divider1_testbench/dividend[60]} {-height 15 -radix decimal} {/divider1_testbench/dividend[59]} {-height 15 -radix decimal} {/divider1_testbench/dividend[58]} {-height 15 -radix decimal} {/divider1_testbench/dividend[57]} {-height 15 -radix decimal} {/divider1_testbench/dividend[56]} {-height 15 -radix decimal} {/divider1_testbench/dividend[55]} {-height 15 -radix decimal} {/divider1_testbench/dividend[54]} {-height 15 -radix decimal} {/divider1_testbench/dividend[53]} {-height 15 -radix decimal} {/divider1_testbench/dividend[52]} {-height 15 -radix decimal} {/divider1_testbench/dividend[51]} {-height 15 -radix decimal} {/divider1_testbench/dividend[50]} {-height 15 -radix decimal} {/divider1_testbench/dividend[49]} {-height 15 -radix decimal} {/divider1_testbench/dividend[48]} {-height 15 -radix decimal} {/divider1_testbench/dividend[47]} {-height 15 -radix decimal} {/divider1_testbench/dividend[46]} {-height 15 -radix decimal} {/divider1_testbench/dividend[45]} {-height 15 -radix decimal} {/divider1_testbench/dividend[44]} {-height 15 -radix decimal} {/divider1_testbench/dividend[43]} {-height 15 -radix decimal} {/divider1_testbench/dividend[42]} {-height 15 -radix decimal} {/divider1_testbench/dividend[41]} {-height 15 -radix decimal} {/divider1_testbench/dividend[40]} {-height 15 -radix decimal} {/divider1_testbench/dividend[39]} {-height 15 -radix decimal} {/divider1_testbench/dividend[38]} {-height 15 -radix decimal} {/divider1_testbench/dividend[37]} {-height 15 -radix decimal} {/divider1_testbench/dividend[36]} {-height 15 -radix decimal} {/divider1_testbench/dividend[35]} {-height 15 -radix decimal} {/divider1_testbench/dividend[34]} {-height 15 -radix decimal} {/divider1_testbench/dividend[33]} {-height 15 -radix decimal} {/divider1_testbench/dividend[32]} {-height 15 -radix decimal} {/divider1_testbench/dividend[31]} {-height 15 -radix decimal} {/divider1_testbench/dividend[30]} {-height 15 -radix decimal} {/divider1_testbench/dividend[29]} {-height 15 -radix decimal} {/divider1_testbench/dividend[28]} {-height 15 -radix decimal} {/divider1_testbench/dividend[27]} {-height 15 -radix decimal} {/divider1_testbench/dividend[26]} {-height 15 -radix decimal} {/divider1_testbench/dividend[25]} {-height 15 -radix decimal} {/divider1_testbench/dividend[24]} {-height 15 -radix decimal} {/divider1_testbench/dividend[23]} {-height 15 -radix decimal} {/divider1_testbench/dividend[22]} {-height 15 -radix decimal} {/divider1_testbench/dividend[21]} {-height 15 -radix decimal} {/divider1_testbench/dividend[20]} {-height 15 -radix decimal} {/divider1_testbench/dividend[19]} {-height 15 -radix decimal} {/divider1_testbench/dividend[18]} {-height 15 -radix decimal} {/divider1_testbench/dividend[17]} {-height 15 -radix decimal} {/divider1_testbench/dividend[16]} {-height 15 -radix decimal} {/divider1_testbench/dividend[15]} {-height 15 -radix decimal} {/divider1_testbench/dividend[14]} {-height 15 -radix decimal} {/divider1_testbench/dividend[13]} {-height 15 -radix decimal} {/divider1_testbench/dividend[12]} {-height 15 -radix decimal} {/divider1_testbench/dividend[11]} {-height 15 -radix decimal} {/divider1_testbench/dividend[10]} {-height 15 -radix decimal} {/divider1_testbench/dividend[9]} {-height 15 -radix decimal} {/divider1_testbench/dividend[8]} {-height 15 -radix decimal} {/divider1_testbench/dividend[7]} {-height 15 -radix decimal} {/divider1_testbench/dividend[6]} {-height 15 -radix decimal} {/divider1_testbench/dividend[5]} {-height 15 -radix decimal} {/divider1_testbench/dividend[4]} {-height 15 -radix decimal} {/divider1_testbench/dividend[3]} {-height 15 -radix decimal} {/divider1_testbench/dividend[2]} {-height 15 -radix decimal} {/divider1_testbench/dividend[1]} {-height 15 -radix decimal} {/divider1_testbench/dividend[0]} {-height 15 -radix decimal}} /divider1_testbench/dividend
add wave -noupdate -radix decimal -childformat {{{/divider1_testbench/divisor[63]} -radix decimal} {{/divider1_testbench/divisor[62]} -radix decimal} {{/divider1_testbench/divisor[61]} -radix decimal} {{/divider1_testbench/divisor[60]} -radix decimal} {{/divider1_testbench/divisor[59]} -radix decimal} {{/divider1_testbench/divisor[58]} -radix decimal} {{/divider1_testbench/divisor[57]} -radix decimal} {{/divider1_testbench/divisor[56]} -radix decimal} {{/divider1_testbench/divisor[55]} -radix decimal} {{/divider1_testbench/divisor[54]} -radix decimal} {{/divider1_testbench/divisor[53]} -radix decimal} {{/divider1_testbench/divisor[52]} -radix decimal} {{/divider1_testbench/divisor[51]} -radix decimal} {{/divider1_testbench/divisor[50]} -radix decimal} {{/divider1_testbench/divisor[49]} -radix decimal} {{/divider1_testbench/divisor[48]} -radix decimal} {{/divider1_testbench/divisor[47]} -radix decimal} {{/divider1_testbench/divisor[46]} -radix decimal} {{/divider1_testbench/divisor[45]} -radix decimal} {{/divider1_testbench/divisor[44]} -radix decimal} {{/divider1_testbench/divisor[43]} -radix decimal} {{/divider1_testbench/divisor[42]} -radix decimal} {{/divider1_testbench/divisor[41]} -radix decimal} {{/divider1_testbench/divisor[40]} -radix decimal} {{/divider1_testbench/divisor[39]} -radix decimal} {{/divider1_testbench/divisor[38]} -radix decimal} {{/divider1_testbench/divisor[37]} -radix decimal} {{/divider1_testbench/divisor[36]} -radix decimal} {{/divider1_testbench/divisor[35]} -radix decimal} {{/divider1_testbench/divisor[34]} -radix decimal} {{/divider1_testbench/divisor[33]} -radix decimal} {{/divider1_testbench/divisor[32]} -radix decimal} {{/divider1_testbench/divisor[31]} -radix decimal} {{/divider1_testbench/divisor[30]} -radix decimal} {{/divider1_testbench/divisor[29]} -radix decimal} {{/divider1_testbench/divisor[28]} -radix decimal} {{/divider1_testbench/divisor[27]} -radix decimal} {{/divider1_testbench/divisor[26]} -radix decimal} {{/divider1_testbench/divisor[25]} -radix decimal} {{/divider1_testbench/divisor[24]} -radix decimal} {{/divider1_testbench/divisor[23]} -radix decimal} {{/divider1_testbench/divisor[22]} -radix decimal} {{/divider1_testbench/divisor[21]} -radix decimal} {{/divider1_testbench/divisor[20]} -radix decimal} {{/divider1_testbench/divisor[19]} -radix decimal} {{/divider1_testbench/divisor[18]} -radix decimal} {{/divider1_testbench/divisor[17]} -radix decimal} {{/divider1_testbench/divisor[16]} -radix decimal} {{/divider1_testbench/divisor[15]} -radix decimal} {{/divider1_testbench/divisor[14]} -radix decimal} {{/divider1_testbench/divisor[13]} -radix decimal} {{/divider1_testbench/divisor[12]} -radix decimal} {{/divider1_testbench/divisor[11]} -radix decimal} {{/divider1_testbench/divisor[10]} -radix decimal} {{/divider1_testbench/divisor[9]} -radix decimal} {{/divider1_testbench/divisor[8]} -radix decimal} {{/divider1_testbench/divisor[7]} -radix decimal} {{/divider1_testbench/divisor[6]} -radix decimal} {{/divider1_testbench/divisor[5]} -radix decimal} {{/divider1_testbench/divisor[4]} -radix decimal} {{/divider1_testbench/divisor[3]} -radix decimal} {{/divider1_testbench/divisor[2]} -radix decimal} {{/divider1_testbench/divisor[1]} -radix decimal} {{/divider1_testbench/divisor[0]} -radix decimal}} -subitemconfig {{/divider1_testbench/divisor[63]} {-height 15 -radix decimal} {/divider1_testbench/divisor[62]} {-height 15 -radix decimal} {/divider1_testbench/divisor[61]} {-height 15 -radix decimal} {/divider1_testbench/divisor[60]} {-height 15 -radix decimal} {/divider1_testbench/divisor[59]} {-height 15 -radix decimal} {/divider1_testbench/divisor[58]} {-height 15 -radix decimal} {/divider1_testbench/divisor[57]} {-height 15 -radix decimal} {/divider1_testbench/divisor[56]} {-height 15 -radix decimal} {/divider1_testbench/divisor[55]} {-height 15 -radix decimal} {/divider1_testbench/divisor[54]} {-height 15 -radix decimal} {/divider1_testbench/divisor[53]} {-height 15 -radix decimal} {/divider1_testbench/divisor[52]} {-height 15 -radix decimal} {/divider1_testbench/divisor[51]} {-height 15 -radix decimal} {/divider1_testbench/divisor[50]} {-height 15 -radix decimal} {/divider1_testbench/divisor[49]} {-height 15 -radix decimal} {/divider1_testbench/divisor[48]} {-height 15 -radix decimal} {/divider1_testbench/divisor[47]} {-height 15 -radix decimal} {/divider1_testbench/divisor[46]} {-height 15 -radix decimal} {/divider1_testbench/divisor[45]} {-height 15 -radix decimal} {/divider1_testbench/divisor[44]} {-height 15 -radix decimal} {/divider1_testbench/divisor[43]} {-height 15 -radix decimal} {/divider1_testbench/divisor[42]} {-height 15 -radix decimal} {/divider1_testbench/divisor[41]} {-height 15 -radix decimal} {/divider1_testbench/divisor[40]} {-height 15 -radix decimal} {/divider1_testbench/divisor[39]} {-height 15 -radix decimal} {/divider1_testbench/divisor[38]} {-height 15 -radix decimal} {/divider1_testbench/divisor[37]} {-height 15 -radix decimal} {/divider1_testbench/divisor[36]} {-height 15 -radix decimal} {/divider1_testbench/divisor[35]} {-height 15 -radix decimal} {/divider1_testbench/divisor[34]} {-height 15 -radix decimal} {/divider1_testbench/divisor[33]} {-height 15 -radix decimal} {/divider1_testbench/divisor[32]} {-height 15 -radix decimal} {/divider1_testbench/divisor[31]} {-height 15 -radix decimal} {/divider1_testbench/divisor[30]} {-height 15 -radix decimal} {/divider1_testbench/divisor[29]} {-height 15 -radix decimal} {/divider1_testbench/divisor[28]} {-height 15 -radix decimal} {/divider1_testbench/divisor[27]} {-height 15 -radix decimal} {/divider1_testbench/divisor[26]} {-height 15 -radix decimal} {/divider1_testbench/divisor[25]} {-height 15 -radix decimal} {/divider1_testbench/divisor[24]} {-height 15 -radix decimal} {/divider1_testbench/divisor[23]} {-height 15 -radix decimal} {/divider1_testbench/divisor[22]} {-height 15 -radix decimal} {/divider1_testbench/divisor[21]} {-height 15 -radix decimal} {/divider1_testbench/divisor[20]} {-height 15 -radix decimal} {/divider1_testbench/divisor[19]} {-height 15 -radix decimal} {/divider1_testbench/divisor[18]} {-height 15 -radix decimal} {/divider1_testbench/divisor[17]} {-height 15 -radix decimal} {/divider1_testbench/divisor[16]} {-height 15 -radix decimal} {/divider1_testbench/divisor[15]} {-height 15 -radix decimal} {/divider1_testbench/divisor[14]} {-height 15 -radix decimal} {/divider1_testbench/divisor[13]} {-height 15 -radix decimal} {/divider1_testbench/divisor[12]} {-height 15 -radix decimal} {/divider1_testbench/divisor[11]} {-height 15 -radix decimal} {/divider1_testbench/divisor[10]} {-height 15 -radix decimal} {/divider1_testbench/divisor[9]} {-height 15 -radix decimal} {/divider1_testbench/divisor[8]} {-height 15 -radix decimal} {/divider1_testbench/divisor[7]} {-height 15 -radix decimal} {/divider1_testbench/divisor[6]} {-height 15 -radix decimal} {/divider1_testbench/divisor[5]} {-height 15 -radix decimal} {/divider1_testbench/divisor[4]} {-height 15 -radix decimal} {/divider1_testbench/divisor[3]} {-height 15 -radix decimal} {/divider1_testbench/divisor[2]} {-height 15 -radix decimal} {/divider1_testbench/divisor[1]} {-height 15 -radix decimal} {/divider1_testbench/divisor[0]} {-height 15 -radix decimal}} /divider1_testbench/divisor
add wave -noupdate -radix binary /divider1_testbench/valid_in
add wave -noupdate -radix binary /divider1_testbench/rst
add wave -noupdate -radix binary /divider1_testbench/clk
add wave -noupdate -radix decimal /divider1_testbench/DUT/opA64
add wave -noupdate -radix decimal /divider1_testbench/DUT/opB64
add wave -noupdate -radix decimal /divider1_testbench/DUT/opC64
add wave -noupdate /divider1_testbench/DUT/state
add wave -noupdate /divider1_testbench/DUT/next_state
add wave -noupdate /divider1_testbench/DUT/opA
add wave -noupdate /divider1_testbench/DUT/opB
add wave -noupdate /divider1_testbench/DUT/opC
add wave -noupdate /divider1_testbench/DUT/divisor_msb
add wave -noupdate /divider1_testbench/DUT/divident_msb
add wave -noupdate /divider1_testbench/DUT/latch_inputs
add wave -noupdate /divider1_testbench/DUT/dividend_r
add wave -noupdate /divider1_testbench/DUT/divisor_r
add wave -noupdate /divider1_testbench/DUT/opA_sel
add wave -noupdate /divider1_testbench/DUT/opB_sel
add wave -noupdate /divider1_testbench/DUT/opC_sel
add wave -noupdate /divider1_testbench/DUT/opA_mux
add wave -noupdate /divider1_testbench/DUT/opB_mux
add wave -noupdate -radix decimal -childformat {{{/divider1_testbench/DUT/opC_mux64[63]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[62]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[61]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[60]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[59]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[58]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[57]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[56]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[55]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[54]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[53]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[52]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[51]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[50]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[49]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[48]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[47]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[46]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[45]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[44]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[43]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[42]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[41]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[40]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[39]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[38]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[37]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[36]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[35]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[34]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[33]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[32]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[31]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[30]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[29]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[28]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[27]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[26]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[25]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[24]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[23]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[22]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[21]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[20]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[19]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[18]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[17]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[16]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[15]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[14]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[13]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[12]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[11]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[10]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[9]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[8]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[7]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[6]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[5]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[4]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[3]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[2]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[1]} -radix decimal} {{/divider1_testbench/DUT/opC_mux64[0]} -radix decimal}} -subitemconfig {{/divider1_testbench/DUT/opC_mux[63]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[62]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[61]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[60]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[59]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[58]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[57]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[56]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[55]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[54]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[53]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[52]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[51]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[50]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[49]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[48]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[47]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[46]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[45]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[44]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[43]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[42]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[41]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[40]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[39]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[38]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[37]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[36]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[35]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[34]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[33]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[32]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[31]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[30]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[29]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[28]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[27]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[26]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[25]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[24]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[23]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[22]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[21]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[20]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[19]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[18]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[17]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[16]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[15]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[14]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[13]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[12]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[11]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[10]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[9]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[8]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[7]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[6]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[5]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[4]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[3]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[2]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[1]} {-radix decimal} {/divider1_testbench/DUT/opC_mux[0]} {-radix decimal}} /divider1_testbench/DUT/opC_mux64
add wave -noupdate /divider1_testbench/DUT/opC_mux
add wave -noupdate -radix decimal /divider1_testbench/DUT/add_out64
add wave -noupdate /divider1_testbench/DUT/add_out
add wave -noupdate /divider1_testbench/DUT/opA_ld
add wave -noupdate /divider1_testbench/DUT/opB_ld
add wave -noupdate /divider1_testbench/DUT/opC_ld
add wave -noupdate /divider1_testbench/DUT/opA_inv
add wave -noupdate /divider1_testbench/DUT/opB_inv
add wave -noupdate /divider1_testbench/DUT/opA_inv_buf
add wave -noupdate /divider1_testbench/DUT/opB_inv_buf
add wave -noupdate /divider1_testbench/DUT/opA_clr_l
add wave -noupdate /divider1_testbench/DUT/opB_clr_l
add wave -noupdate /divider1_testbench/DUT/opA_clr_buf
add wave -noupdate /divider1_testbench/DUT/opB_clr_buf
add wave -noupdate /divider1_testbench/DUT/opA_xnor
add wave -noupdate /divider1_testbench/DUT/opB_xnor
add wave -noupdate /divider1_testbench/DUT/add_in0
add wave -noupdate /divider1_testbench/DUT/add_in1
add wave -noupdate /divider1_testbench/DUT/adder_cin
add wave -noupdate /divider1_testbench/DUT/adder_result_is_neg_i
add wave -noupdate /divider1_testbench/DUT/opA_is_neg_i
add wave -noupdate /divider1_testbench/DUT/opC_is_neg_i
add wave -noupdate /divider1_testbench/DUT/q_neg
add wave -noupdate /divider1_testbench/DUT/r_neg
add wave -noupdate /divider1_testbench/DUT/neg_ld
add wave -noupdate /divider1_testbench/DUT/add_neg_last
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {66 ps} 0}
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
WaveRestoreZoom {0 ps} {108 ps}
