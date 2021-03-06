###################################################################

# Created by write_sdc on Wed May 16 20:23:32 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max WC0D72COM -max_library tcbn65gpluswc0d72_ccs\
                         -min BC0D88COM -min_library tcbn65gplusbc0d88_ccs
set_max_transition 0.5 [current_design]
set_max_fanout 6 [current_design]
set_driving_cell -lib_cell INVD1 [get_ports clk]
set_driving_cell -lib_cell INVD1 [get_ports reset]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[31]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[30]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[29]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[28]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[27]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[26]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[25]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[24]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[23]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[22]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[21]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[20]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[19]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[18]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[17]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[16]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[15]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[14]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[13]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[12]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[11]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[10]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[9]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[8]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[7]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[6]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[5]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[4]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[3]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[2]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[1]}]
set_driving_cell -lib_cell INVD1 [get_ports {imem_instruction_i[0]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[63]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[62]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[61]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[60]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[59]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[58]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[57]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[56]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[55]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[54]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[53]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[52]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[51]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[50]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[49]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[48]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[47]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[46]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[45]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[44]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[43]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[42]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[41]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[40]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[39]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[38]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[37]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[36]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[35]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[34]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[33]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[32]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[31]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[30]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[29]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[28]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[27]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[26]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[25]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[24]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[23]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[22]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[21]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[20]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[19]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[18]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[17]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[16]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[15]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[14]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[13]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[12]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[11]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[10]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[9]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[8]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[7]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[6]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[5]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[4]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[3]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[2]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[1]}]
set_driving_cell -lib_cell INVD1 [get_ports {dmem_readData[0]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[63]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[62]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[61]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[60]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[59]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[58]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[57]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[56]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[55]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[54]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[53]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[52]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[51]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[50]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[49]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[48]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[47]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[46]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[45]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[44]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[43]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[42]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[41]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[40]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[39]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[38]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[37]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[36]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[35]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[34]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[33]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[32]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[31]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[30]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[29]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[28]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[27]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[26]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[25]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[24]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[23]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[22]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[21]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[20]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[19]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[18]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[17]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[16]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[15]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[14]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[13]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[12]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[11]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[10]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[9]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[8]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[7]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[6]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[5]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[4]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[3]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[2]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[1]}]
set_load -pin_load 0.00108918 [get_ports {imem_address_o[0]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[63]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[62]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[61]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[60]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[59]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[58]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[57]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[56]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[55]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[54]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[53]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[52]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[51]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[50]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[49]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[48]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[47]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[46]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[45]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[44]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[43]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[42]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[41]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[40]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[39]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[38]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[37]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[36]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[35]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[34]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[33]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[32]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[31]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[30]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[29]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[28]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[27]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[26]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[25]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[24]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[23]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[22]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[21]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[20]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[19]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[18]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[17]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[16]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[15]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[14]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[13]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[12]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[11]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[10]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[9]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[8]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[7]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[6]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[5]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[4]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[3]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[2]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[1]}]
set_load -pin_load 0.00108918 [get_ports {dmem_WriteData[0]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[63]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[62]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[61]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[60]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[59]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[58]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[57]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[56]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[55]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[54]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[53]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[52]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[51]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[50]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[49]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[48]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[47]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[46]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[45]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[44]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[43]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[42]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[41]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[40]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[39]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[38]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[37]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[36]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[35]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[34]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[33]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[32]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[31]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[30]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[29]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[28]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[27]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[26]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[25]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[24]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[23]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[22]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[21]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[20]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[19]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[18]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[17]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[16]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[15]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[14]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[13]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[12]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[11]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[10]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[9]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[8]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[7]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[6]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[5]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[4]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[3]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[2]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[1]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressLoad[0]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[63]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[62]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[61]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[60]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[59]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[58]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[57]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[56]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[55]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[54]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[53]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[52]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[51]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[50]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[49]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[48]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[47]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[46]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[45]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[44]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[43]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[42]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[41]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[40]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[39]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[38]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[37]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[36]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[35]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[34]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[33]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[32]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[31]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[30]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[29]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[28]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[27]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[26]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[25]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[24]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[23]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[22]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[21]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[20]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[19]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[18]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[17]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[16]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[15]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[14]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[13]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[12]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[11]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[10]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[9]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[8]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[7]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[6]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[5]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[4]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[3]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[2]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[1]}]
set_load -pin_load 0.00108918 [get_ports {dmem_addressStore[0]}]
set_load -pin_load 0.00108918 [get_ports dmem_readEn]
set_load -pin_load 0.00108918 [get_ports dmem_writeEn]
create_clock [get_ports clk]  -period 20  -waveform {0 1}
set_clock_uncertainty -setup 2  [get_clocks clk]
set_clock_uncertainty -hold 0.01  [get_clocks clk]
set_clock_transition -max -rise 0.05 [get_clocks clk]
set_clock_transition -max -fall 0.05 [get_clocks clk]
set_clock_transition -min -rise 0.05 [get_clocks clk]
set_clock_transition -min -fall 0.05 [get_clocks clk]
set_input_delay -clock clk  0.1  [get_ports reset]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[31]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[30]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[29]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[28]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[27]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[26]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[25]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[24]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[23]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[22]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[21]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[20]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[19]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[18]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[17]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[16]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[15]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[14]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[13]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[12]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[11]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[10]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[9]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[8]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[7]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[6]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[5]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[4]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[3]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[2]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[1]}]
set_input_delay -clock clk  0.1  [get_ports {imem_instruction_i[0]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[63]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[62]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[61]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[60]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[59]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[58]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[57]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[56]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[55]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[54]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[53]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[52]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[51]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[50]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[49]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[48]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[47]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[46]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[45]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[44]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[43]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[42]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[41]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[40]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[39]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[38]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[37]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[36]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[35]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[34]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[33]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[32]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[31]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[30]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[29]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[28]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[27]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[26]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[25]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[24]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[23]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[22]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[21]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[20]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[19]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[18]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[17]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[16]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[15]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[14]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[13]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[12]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[11]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[10]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[9]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[8]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[7]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[6]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[5]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[4]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[3]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[2]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[1]}]
set_input_delay -clock clk  0.1  [get_ports {dmem_readData[0]}]
