module issueExecStageShift #(parameter ROBsize = 32, ROBsizeLog = $clog2(ROBsize+1)) 
(clk_i
,reset_i

//RS inouts
,stallRS_o
,reservationStationVal1_i
,reservationStationVal2_i
,reservationStationCommands_i
,reservationStationTag_i
,readyRS_i

//inouts to continue through execute stage
,canGo_i
,executeTag_o
,executeCommands_o
,executeVal_o
,executeFlags_o
,valid_o
);
  input reset_i, clk_i;
  
  //Reservation station inouts
  input logic [63:0] reservationStationVal1_i, reservationStationVal2_i;
  input logic [9:0] reservationStationCommands_i;
  input logic [ROBsizeLog-1:0] reservationStationTag_i;
  input logic readyRS_i;
  output logic stallRS_o;
  
  //from the execution decision unit
  input logic canGo_i;
  output logic [63:0] executeVal_o;
  output logic [9:0] executeCommands_o;
  output logic [ROBsizeLog-1:0] executeTag_o;
  output logic [3:0] executeFlags_o;
  output logic valid_o;
  
  //the shifter
  shifter theShifter
  (.out(executeVal_o)
  ,.shamt(reservationStationVal2_i[5:0])
  ,.left(reservationStationCommands_i[7])
  ,.sign(1'b0)
  ,.in(reservationStationVal1_i));
  
  assign executeFlags_o = 0;
  
  //assign outputs
  assign executeTag_o = reservationStationTag_i;
  assign executeCommands_o = reservationStationCommands_i;
  assign stallRS_o = ~canGo_i;
  assign valid_o = readyRS_i;
  
endmodule

