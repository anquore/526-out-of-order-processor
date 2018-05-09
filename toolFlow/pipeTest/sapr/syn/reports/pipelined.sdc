###################################################################

# Created by write_sdc on Wed May  9 00:54:23 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max WC0D72COM -max_library tcbn65gpluswc0d72_ccs\
                         -min BC0D88COM -min_library tcbn65gplusbc0d88_ccs
set_max_transition 0.1 [current_design]
set_max_fanout 6 [current_design]
set_load -pin_load 0.00108918 [get_ports q]
create_clock [get_ports clk]  -period 2  -waveform {0 1}
set_clock_uncertainty -setup 0.05  [get_clocks clk]
set_clock_uncertainty -hold 0.01  [get_clocks clk]
set_clock_transition -max -rise 0.05 [get_clocks clk]
set_clock_transition -max -fall 0.05 [get_clocks clk]
set_clock_transition -min -rise 0.05 [get_clocks clk]
set_clock_transition -min -fall 0.05 [get_clocks clk]
set_input_delay -clock clk  0.1  [get_ports d]
set_input_delay -clock clk  0.1  [get_ports reset]
set_input_delay -clock clk  0.1  [get_ports enable]
