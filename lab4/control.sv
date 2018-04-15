module control(instr, flags, commandZero, uncondBr, brTaken, memWrite, memToReg,
								ALUOp, ALUSrc, regWrite, reg2Loc, valueToStore, dOrImm, 
								BRMI, saveCond, regRD, read_enable, needToForward, negative, overflow, whichFlags);
	input logic [11:0] instr;
	input logic [3:0] flags;
	input logic commandZero, negative, overflow, whichFlags;
	output logic uncondBr, brTaken, memWrite, memToReg, 
					ALUSrc, regWrite, reg2Loc, valueToStore, dOrImm, BRMI, saveCond, read_enable, needToForward;
	output logic [2:0] ALUOp;
	output logic [4:0] regRD;
	
	//the control logic
	always_comb begin
		//ADDI
		if(instr[5:0] == 6'b100100) begin //addi
			reg2Loc = 1'bx;
			regWrite = 1;
			dOrImm = 1;
			ALUSrc = 1;
			ALUOp = 2;
			memWrite = 0;
			memToReg = 0;
			valueToStore = 0; 
			uncondBr = 1'bx; 
			brTaken = 0;
			BRMI = 0;
			saveCond = 0;
			regRD = instr[11:7];
			read_enable = 0;
			needToForward = 1;
		end
		else if (instr[5:0] == 6'b111010) begin //subs
			reg2Loc = 1;
			regWrite = 1;
			dOrImm = 0;
			ALUSrc = 0;
			ALUOp = 3;
			memWrite = 0;
			memToReg = 0;
			valueToStore = 0; 
			uncondBr = 1'bx; 
			brTaken = 0;
			BRMI = 0;
			saveCond = 1;
			regRD = instr[11:7];
			read_enable = 0;
			needToForward = 1;
		end
		else if (instr[5:0] == 6'b101010) begin //adds
			reg2Loc = 1;
			regWrite = 1;
			dOrImm = 0;
			ALUSrc = 0;
			ALUOp = 2;
			memWrite = 0;
			memToReg = 0;
			valueToStore = 0; 
			uncondBr = 1'bx; 
			brTaken = 0;
			BRMI = 0;
			saveCond = 1;
			regRD = instr[11:7];
			read_enable = 0;
			needToForward = 1;
		end
		else if (instr[5:0] == 6'b000101) begin //branch
			reg2Loc = 1'bx;
			regWrite = 0;
			dOrImm = 1'bx;
			ALUSrc = 1'bx;
			ALUOp = 3'bxxx;
			memWrite = 0;
			memToReg = 0;
			valueToStore = 1'bx; 
			uncondBr = 1; 
			brTaken = 1;
			BRMI = 0;
			saveCond = 0;
			regRD = instr[11:7];
			read_enable = 0;
			needToForward = 0;
		end
		else if (instr[5:0] == 6'b101101) begin //cbz
			reg2Loc = 0;
			regWrite = 0;
			dOrImm = 1'bx;
			ALUSrc = 0;
			ALUOp = 0;
			memWrite = 0;
			memToReg = 1'bx;
			valueToStore = 0; 
			uncondBr = 0; 
			brTaken = commandZero;
			BRMI = 0;
			saveCond = 0;
			regRD = instr[11:7];
			read_enable = 0;
			needToForward = 0;
		end
		else if (instr[5:0] == 6'b010101) begin //B.LT
			reg2Loc = 1'bx;
			regWrite = 0;
			dOrImm = 1'bx;
			ALUSrc = 0;
			ALUOp = 3'bxxx;
			memWrite = 0;
			memToReg = 1'bx;
			valueToStore = 0; 
			uncondBr = 0;
			if(whichFlags == 1)
				brTaken = (negative ^ overflow);
			else
				brTaken = (flags[0] ^ flags[2]);//(negative ^ overflow);
			BRMI = 0;
			saveCond = 0;
			regRD = instr[11:7];
			read_enable = 0;
			needToForward = 0;
		end
		else if (instr[5:0] == 6'b111110) begin //memory management
			if(instr[6] == 1'b0) begin //STUR
				reg2Loc = 0;
				regWrite = 0;
				dOrImm = 0;
				ALUSrc = 1;
				ALUOp = 2;
				memWrite = 1;
				memToReg = 1'bx;
				valueToStore = 0; 
				uncondBr = 1'bx; 
				brTaken = 0;
				BRMI = 0;
				saveCond = 0;
				regRD = instr[11:7];
				read_enable = 0;
				needToForward = 0;
			end
			else begin //LDUR
				reg2Loc = 1'bx;
				regWrite = 1;
				dOrImm = 0;
				ALUSrc = 1;
				ALUOp = 2;
				memWrite = 0;
				memToReg = 1;
				valueToStore = 0; 
				uncondBr = 1'bx; 
				brTaken = 0;
				BRMI = 0;
				saveCond = 0;
				regRD = instr[11:7];
				read_enable = 1;
				needToForward = 1;
			end
		end
		else if (instr[5:0] == 6'b100101) begin //BL
			reg2Loc = 1'bx;
			regWrite = 1;
			dOrImm = 1'bx;
			ALUSrc = 0;
			ALUOp = 0;
			memWrite = 0;
			memToReg = 0;
			valueToStore = 1;
			uncondBr = 1; 
			brTaken = 1;
			BRMI = 0;
			saveCond = 0;
			regRD = 5'b11110;
			read_enable = 0;
			needToForward = 1;
		end
		else if (instr[5:0] == 6'b110101) begin //BR
			reg2Loc = 0;
			regWrite = 0;
			dOrImm = 1'bx;
			ALUSrc = 0;
			ALUOp = 0;
			memWrite = 0;
			memToReg = 0;
			valueToStore = 0; 
			uncondBr = 1'bx; 
			brTaken = 1'bx;
			BRMI = 1;
			saveCond = 0;
			regRD = instr[11:7];
			read_enable = 0;
			needToForward = 0;
		end
		else begin //do nothing
			reg2Loc = 1'bx;
			regWrite = 0;
			dOrImm = 1'bx;
			ALUSrc = 1'bx;
			ALUOp = 1'bx;
			memWrite = 0;
			memToReg = 1'bx;
			valueToStore = 1'bx; 
			uncondBr = 1'bx; 
			brTaken = 0;
			BRMI = 0;
			saveCond = 0;
			regRD = instr[11:7];
			read_enable = 0;
			needToForward = 0;
		end
	end	
endmodule

module control_testbench();
	logic [11:0] instr;
	logic [3:0] flags;
	logic commandZero;
	logic uncondBr, brTaken, memWrite, memToReg, 
					ALUSrc, regWrite, reg2Loc, valueToStore, dOrImm, BRMI, saveCond, needToForward;
	logic [2:0] ALUOp;
	logic [4:0] regRD;

	control dut (.instr, .flags, .commandZero, .uncondBr, .brTaken, .memWrite, .memToReg,
								.ALUOp, .ALUSrc, .regWrite, .reg2Loc, .valueToStore, .dOrImm, 
								.BRMI, .saveCond, .regRD, .needToForward);

	
	initial begin
	instr = 0; flags = 0; commandZero = 0; #10;

		$stop(); // end the simulation
	end
endmodule