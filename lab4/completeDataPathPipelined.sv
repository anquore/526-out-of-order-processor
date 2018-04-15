`timescale 1ns/10ps
module completeDataPathPipelined(clk, uncondBr, brTaken, memWrite, memToReg, reset, 
								ALUOp, ALUSrc, regWrite, reg2Loc, valueToStore, dOrImm, 
								BRMI, saveCond, regRD, instr, flags, commandZero, read_enable, 
								needToForward, negative, overflow, whichFlags);
	input logic clk, uncondBr, brTaken, memWrite, memToReg, reset, 
					ALUSrc, regWrite, reg2Loc, valueToStore, dOrImm, BRMI, saveCond, read_enable, needToForward;
	input logic [2:0] ALUOp;
	input logic [4:0] regRD;
	output logic [11:0] instr;
	output logic [3:0] flags;
	output logic commandZero, negative, overflow, whichFlags;
	
	//instruction fetch stage
	logic [63:0] regPC, address;
	logic [31:0] instruction, firstWallOut;
	instructionFetch instructionGetter (.clk, .reset, .uncondBr, .brTaken, .BRMI, 
													.regPC, .instrToRead(firstWallOut), .instruction, .address);
													
	//first wall
	logic [31:0] firstWallIn;
	assign firstWallIn = instruction;
	wallOfDFFs #(.LENGTH(32)) firstWall (.q(firstWallOut), .d(firstWallIn), .reset(1'b0), .enable(1'b1), .clk);

	//reg read/decode stage
	//port the instructions out to the command module to produce all the commands
	assign instr[5:0] = firstWallOut[31:26];
	assign instr[6] = firstWallOut[22];
	assign instr[11:7] = firstWallOut[4:0];
	
	//link in the read and write ports for the reg file
	logic [63:0] ReadData1, ReadData2;
	logic [70:0] finalWallOut;
	logic [4:0] addr2;
	regReadAndWriteStage regStuff (.clk, .regWrite(finalWallOut[70]), .reg2Loc, .valueToStore, .readAddr1(firstWallOut[9:5]), 
											.readAddr2(firstWallOut[20:16]),.writeAddr(finalWallOut[69:65]), .branchReadAddr(firstWallOut[4:0]), .address, 
											.WriteData(finalWallOut[63:0]), .ReadData1, .ReadData2, .addr2);
											
	//do the forwarding		
	logic [63:0] regA, regB;
	logic [4:0] ALUreg, MEMreg;
	logic [63:0] result;
	logic [63:0] mightSendToReg;
	logic ALUforward, MEMforward;
	forwardingUnit doThatForwarding (.currentReg1(firstWallOut[9:5]), .currentReg2(addr2), .ALUreg, .MEMreg, 
								.currentData1(ReadData1), .currentData2(ReadData2), .ALUdata(result), .MEMdata(mightSendToReg), 
								.regA, .regB, .ALUforward, .MEMforward);
	
	//do the accelerated branch
	logic [3:0] norIns;
	orGate16 bigOr0 (.inVals(regB[15:0]), .outVal(norIns[0]));
	orGate16 bigOr1 (.inVals(regB[31:16]), .outVal(norIns[1]));
	orGate16 bigOr2 (.inVals(regB[47:32]), .outVal(norIns[2]));
	orGate16 bigOr3 (.inVals(regB[63:48]), .outVal(norIns[3]));
	nor #5 aNor (commandZero, norIns[3], norIns[2], norIns[1], norIns[0]);
	assign regPC = regB;

	//gather up the commands to be moved along
	logic [9:0] commandsAfterReg;
	assign commandsAfterReg[0] = memWrite;
	assign commandsAfterReg[1] = memToReg;
	assign commandsAfterReg[4:2] = ALUOp[2:0];
	assign commandsAfterReg[5] = ALUSrc;
	assign commandsAfterReg[6] = valueToStore;
	assign commandsAfterReg[7] = dOrImm;
	assign commandsAfterReg[8] = saveCond;
	assign commandsAfterReg[9] = read_enable;
	
	logic [171:0] secondWallOut, secondWallIn;
	assign secondWallIn[9:0] = commandsAfterReg[9:0];
	assign secondWallIn[73:10] = regA;
	assign secondWallIn[137:74] = regB;
	assign secondWallIn[142:138] = regRD;
	assign secondWallIn[169:143] = firstWallOut[31:5];
	assign secondWallIn[170] = regWrite;
	assign secondWallIn[171] = needToForward;
	wallOfDFFs #(.LENGTH(172)) secondWall (.q(secondWallOut), .d(secondWallIn), .reset(1'b0), .enable(1'b1), .clk);
	
	//ALU stage
	logic zero, carry_out;
	ALUStage thatALU (.ALUSrc(secondWallOut[5]), .valueToStore(secondWallOut[6]), .dOrImm(secondWallOut[7]), .dAddr9(secondWallOut[158:150]), 
						.imm12(secondWallOut[159:148]), .ALUOp(secondWallOut[4:2]), .A(secondWallOut[73:10]), .ReadData2(secondWallOut[137:74]), 
						.negative, .zero, .overflow, .carry_out, .result);
						
	//what flags to read source
	assign whichFlags = secondWallOut[8];
	
	//condition flip flops
	enableD_FF nDFF (.q(flags[0]), .d(negative), .reset(1'b0), .enable(secondWallOut[8]), .clk);
	enableD_FF zDFF (.q(flags[1]), .d(zero), .reset(1'b0), .enable(secondWallOut[8]), .clk);
	enableD_FF oDFF (.q(flags[2]), .d(overflow), .reset(1'b0), .enable(secondWallOut[8]), .clk);
	enableD_FF cDFF (.q(flags[3]), .d(carry_out), .reset(1'b0), .enable(secondWallOut[8]), .clk);
	
	
	//gather up the commands to be moved along
	logic [3:0] commandsAfterALU;
	assign commandsAfterALU[0] = secondWallOut[0];
	assign commandsAfterALU[1] = secondWallOut[1];
	assign commandsAfterALU[2] = secondWallOut[6];
	assign commandsAfterALU[3] = secondWallOut[9];
	
	//break out bits for forwarding
	assign ALUreg[4:0] = secondWallOut[142:138];
	assign ALUforward = secondWallOut[171];
	
	logic [138:0] thirdWallOut, thirdWallIn;
	assign thirdWallIn[3:0] = commandsAfterALU[3:0];
	assign thirdWallIn[67:4] = result;
	assign thirdWallIn[131:68] = secondWallOut[137:74];
	assign thirdWallIn[136:132] = ALUreg[4:0];
	assign thirdWallIn[137] = secondWallOut[170];
	assign thirdWallIn[138] = secondWallOut[171];
	wallOfDFFs #(.LENGTH(139)) thirdWall (.q(thirdWallOut), .d(thirdWallIn), .reset(1'b0), .enable(1'b1), .clk);
	
	//memory stage
	memStage thatMem (.clk, .memWrite(thirdWallOut[0]), .read_enable(thirdWallOut[3]), .memToReg(thirdWallOut[1]),
							.ReadData2(thirdWallOut[131:68]), .address(thirdWallOut[67:4]), .mightSendToReg);
							
	//break out bits for forwarding
	assign MEMreg[4:0] = thirdWallOut[136:132];
	assign MEMforward = thirdWallOut[138];
	
	logic [70:0] finalWallIn;
	assign finalWallIn[63:0] = mightSendToReg;
	assign finalWallIn[64] = thirdWallOut[2];
	assign finalWallIn[69:65] = MEMreg[4:0];
	assign finalWallIn[70] = thirdWallOut[137];
	wallOfDFFs #(.LENGTH(71)) finalWall (.q(finalWallOut), .d(finalWallIn), .reset(1'b0), .enable(1'b1), .clk);
	
endmodule

module completeDataPathPipelined_testbench();
	logic clk, uncondBr, brTaken, memWrite, memToReg, reset, 
					ALUSrc, regWrite, reg2Loc, valueToStore, dOrImm, BRMI, saveCond, read_enable;
	logic [2:0] ALUOp;
	logic [4:0] regRD;
	logic [11:0] instr;
	logic [3:0] flags;
	logic commandZero;

	completeDataPathPipelined dut (.clk, .uncondBr, .brTaken, .memWrite, .memToReg, .reset, 
								.ALUOp, .ALUSrc, .regWrite, .reg2Loc, .valueToStore, .dOrImm,
								.BRMI, .saveCond, .regRD, .instr, .flags, .commandZero, .read_enable);
	assign regRD = instr[4:0]; 

	// Set up the clock
	parameter ClockDelay = 1000;
	initial begin ;
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
	uncondBr <= 0; brTaken <= 0; memWrite <= 0;	memToReg <= 0; 
	regWrite <= 0; ALUSrc <= 0; reg2Loc <= 0; valueToStore <= 0;
	BRMI <= 0; saveCond <= 0; ALUOp <= 0; dOrImm <= 0; read_enable <= 0;
				reset <= 1; 	@(posedge clk);
				reset <= 0; regWrite <= 1;	dOrImm <= 1; ALUSrc <= 1; ALUOp <= 2;@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									regWrite <= 0; uncondBr <= 1; brTaken <= 1;@(posedge clk);
									@(posedge clk);				
				
		$stop(); // end the simulation
	end
endmodule