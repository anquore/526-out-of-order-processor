`timescale 1ns/10ps
module pipelinedProcessor(clk, reset);
	input clk, reset;
	
	//the datapath
	logic uncondBr, brTaken, memWrite, memToReg, 
					ALUSrc, regWrite, reg2Loc, valueToStore, dOrImm, BRMI, saveCond, read_enable, needToForward;
	logic [2:0] ALUOp;
	logic [4:0] regRD;
	logic [17:0] instr;
	logic [3:0] flags;
	logic commandZero, negative, overflow, whichFlags, zero, carry_out;
	completeDataPathPipelined theDataPath (.clk, .uncondBr, .brTaken, .memWrite, .memToReg, .reset, 
								.ALUOp, .ALUSrc, .regWrite, .reg2Loc, .valueToStore, .dOrImm, 
								.BRMI, .saveCond, .regRD, .instr, .flags, .commandZero, 
								.read_enable, .needToForward, .negative, .overflow, .whichFlags, .zero, .carry_out);
								
	//the control
	control theControl (.instr, .flags, .commandZero, .uncondBr, .brTaken, .memWrite, .memToReg,
								.ALUOp, .ALUSrc, .regWrite, .reg2Loc, .valueToStore, .dOrImm, 
								.BRMI, .saveCond, .regRD, .read_enable, .needToForward, .negative, .overflow, .whichFlags, .zero, .carry_out);
endmodule

module pipelinedProcessor_testbench();
	logic clk, reset;

	pipelinedProcessor dut (.clk, .reset);

	// Set up the clock
	parameter ClockDelay = 2000;
	initial begin ;
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
				reset <= 1; 	@(posedge clk);
				reset <= 0; 	@(posedge clk);
			repeat(3000) begin	@(posedge clk); end				
				
		$stop(); // end the simulation
	end
endmodule