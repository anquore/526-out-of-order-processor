module branchPredictionSM
(clk_i
,reset_i
,brTaken_i
,update_i

,branchPred_o
);
	input logic clk_i, reset_i, brTaken_i, update_i;
	output logic branchPred_o;
	
  //state machine
	localparam [1:0] alwaysTaken = 2'b00, mostlyTaken = 2'b01, mostlyNotTaken = 2'b10, alwaysNotTaken = 2'b11;
  logic [1:0] state_n, state_r;
  
	always_ff @(posedge clk_i) begin
		if(reset_i)
      state_r = alwaysTaken;
    else
      state_r = state_n;
  end
  
	always_comb begin
		state_n = state_r;
    
		case(state_n)
      alwaysTaken: begin
        if(~brTaken_i & update_i)
          state_n = mostlyTaken;
      end
      mostlyTaken: begin
        if(~brTaken_i & update_i)
          state_n = mostlyNotTaken;
        else if(brTaken_i & update_i)
          state_n = alwaysTaken;
      end
      mostlyNotTaken: begin
        if(~brTaken_i & update_i)
          state_n = alwaysNotTaken;
        else if(brTaken_i & update_i)
          state_n = mostlyTaken;
      end
      alwaysNotTaken: begin
        if(brTaken_i & update_i)
          state_n = mostlyNotTaken;
      end
		endcase
	end
  
  assign branchPred_o = (state_r==mostlyTaken | state_r==alwaysTaken);
	
endmodule