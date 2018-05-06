###################################################################

# Created by write_sdc on Sun May  6 07:17:07 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max WC0D72COM -max_library tcbn65gpluswc0d72_ccs\
                         -min BC0D88COM -min_library tcbn65gplusbc0d88_ccs
set_max_transition 0.1 [current_design]
set_max_fanout 6 [current_design]
set_clock_uncertainty -setup 0.05  [get_ports clk]
set_clock_uncertainty -hold 0.01  [get_ports clk]
