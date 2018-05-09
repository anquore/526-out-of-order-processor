module divider(quotient, valid_out, divisor, dividend, valid_in, rst, clk);
	output [63:0] quotient;
	output valid_out;
	input [63:0] divisor, dividend;
	input valid_in, rst, clk;
	
	wire [64:0] opA, opB, opC;
	//assign remainder=opA[63:0];
	assign quotient=opC[63:0];
	wire divisor_msb, divident_msb;
	logic latch_inputs;
	wire [63:0] dividend_r, divisor_r;
	
	registerX64 dividendReg(.outs(dividend_r[63:0]), .ins(dividend[63:0]), .en(latch_inputs), .rst, .clk);
	registerX64 divisorReg(.outs(divisor_r[63:0]), .ins(divisor[63:0]), .en(latch_inputs), .rst, .clk);
	
	logic opA_sel;
	logic[1:0] opB_sel, opC_sel;
	wire [64:0] opA_mux, opB_mux, opC_mux, add_out;
	mux_2x1_X65 muxA(.outs(opA_mux), .select(opA_sel), .invSelect(~opA_sel), .ins({divisor_r[63], divisor_r[63:0], add_out}));
	mux_4x1_X65 muxB(.outs(opB_mux), .select(opB_sel), .invSelect(~opB_sel), .ins({65'h0, opC[64:0], add_out[64:0], add_out[63:0], opC[64]}));
	mux_4x1_X65 muxC(.outs(opC_mux), .select(opC_sel), .invSelect(~opC_sel), .ins({65'h0, dividend_r[63], dividend_r[63:0], add_out[64:0], opC[63:0], (~add_out[64])}));
	
	logic opA_ld, opB_ld, opC_ld;
	registerX65 regA(.outs(opA), .ins(opA_mux), .en(opA_ld), .rst, .clk);
	registerX65 regB(.outs(opB), .ins(opB_mux), .en(opB_ld), .rst, .clk);
	registerX65 regC(.outs(opC), .ins(opC_mux), .en(opC_ld), .rst, .clk);
	
	logic opA_inv, opB_inv;
	wire [64:0] opA_inv_buf, opB_inv_buf;
	assign opA_inv_buf[64:0]={65{opA_inv}};
	assign opB_inv_buf[64:0]={65{opB_inv}};
	
	logic opA_clr_l, opB_clr_l;
	wire [64:0] opA_clr_buf, opB_clr_buf;
	assign opA_clr_buf[64:0]={65{~opA_clr_l}};
	assign opB_clr_buf[64:0]={65{~opB_clr_l}};
	
	wire [64:0] opA_xnor, opB_xnor;
	xnorifier xnorA(.outs(opA_xnor[63:0]), .ins1(opA_inv_buf[63:0]), .ins0(opA[63:0]));	xnor(opA_xnor[64], opA_inv_buf[64], opA[64]);
	xnorifier xnorB(.outs(opB_xnor[63:0]), .ins1(opB_inv_buf[63:0]), .ins0(opB[63:0]));	xnor(opB_xnor[64], opB_inv_buf[64], opB[64]);
	
	wire [64:0] add_in0, add_in1;
	norifier norA(.outs(add_in0[63:0]), .ins1(opA_xnor[63:0]), .ins0(opA_clr_buf[63:0]));	nor(add_in0[64], opA_xnor[64], opA_clr_buf[64]);
	norifier norB(.outs(add_in1[63:0]), .ins1(opB_xnor[63:0]), .ins0(opB_clr_buf[63:0]));	nor(add_in1[64], opB_xnor[64], opB_clr_buf[64]);
	
	logic adder_cin;
	adderC65 adder(.val1(add_in0[64:0]), .val2(add_in1[64:0]), .Cin(adder_cin), .valOut(add_out[64:0]));
	
	wire adder_result_is_neg_i, opA_is_neg_i, opC_is_neg_i;
	assign adder_result_is_neg_i=add_out[64];
	assign opA_is_neg_i=opA[64];
	assign opC_is_neg_i=opC[64];
	reg q_neg;
	reg r_neg;
	logic neg_ld;
	reg add_neg_last;
	
	typedef enum reg[6:0] {WAIT, START, NEG0, NEG1, SHIFT, CALC0, CALC1, CALC2, CALC3, CALC4, CALC5, CALC6, CALC7, CALC8, CALC9, CALC10,
		CALC11, CALC12, CALC13, CALC14, CALC15, CALC16, CALC17, CALC18, CALC19, CALC20, CALC21, CALC22, CALC23, CALC24, CALC25, CALC26,
		CALC27, CALC28, CALC29, CALC30, CALC31, CALC32, CALC33, CALC34, CALC35, CALC36, CALC37, CALC38, CALC39, CALC40, CALC41, CALC42,
		CALC43, CALC44, CALC45, CALC46, CALC47, CALC48, CALC49, CALC50, CALC51, CALC52, CALC53, CALC54, CALC55, CALC56, CALC57, CALC58,
		CALC59, CALC60, CALC61, CALC62, CALC63, CALC64, REPAIR, REMAIN, QUOT, DONE} idiv_ctrl_stat;
	idiv_ctrl_stat state, next_state;
	
	always @(posedge clk) begin
		add_neg_last <= adder_result_is_neg_i;
	if (neg_ld) begin
			q_neg <= opA_is_neg_i ^ opC_is_neg_i; //the quotient is negated if the signs of the operands differ
			r_neg <= opC_is_neg_i; //the remainder is negated if the dividend is negative
		end 
	end
	
	always @(posedge clk) begin
		state <= rst?WAIT:next_state;
	end
	
	always @(*) begin
		//default control signal values
		opA_sel = 1'b0;
		opA_ld = 1'b0;
		opA_inv = !add_neg_last;
		opA_clr_l = 1'b1;
		opB_sel[1:0] = 2'b0;
		opB_ld = 1'b1;
		opB_inv = 1'b0;
		opB_clr_l = 1'b1;
		opC_sel[1:0] = 2'h0;
		opC_ld = 1'b1;
		adder_cin = !add_neg_last;
		neg_ld = 1'b0;
		latch_inputs = 1'b0;
		next_state = WAIT;
		//control signals by state
		case (state)
			WAIT: begin
				if (valid_in) begin
					next_state = START;
				end
					latch_inputs = 1'b1;
			end
			START: begin
				next_state = NEG0;
				opA_sel = 1'b1;
				opA_ld = 1'b1;
				opB_ld = 1'b0;
				opC_sel[1:0] = 2'h2;
				opC_ld = 1'b1;
			end
			NEG0: begin //invert divisor if negative
				next_state = NEG1;
				opA_ld = opA_is_neg_i;
				opA_inv = 1'b1;
				opB_sel[1:0] = 2'h2;
				opB_clr_l = 1'b0;
				opC_ld = 1'b0;
				adder_cin = 1'b1;
				neg_ld = 1'b1;
			end
			NEG1: begin //invert dividend if negative
				next_state = SHIFT;
				opA_clr_l = 1'b0;
				opB_ld = 1'b0;
				opB_inv = 1'b1;
				opC_sel[1:0] = 2'h1;
				opC_ld = opC_is_neg_i;
				adder_cin = 1'b1;
			end
			SHIFT: begin
				next_state = CALC0;
				opA_clr_l = 1'b0;
				opB_clr_l = 1'b0;
				adder_cin = 1'b0;
			end
			CALC0: next_state = CALC1;
			CALC1: next_state = CALC2;
			CALC2: next_state = CALC3;
			CALC3: next_state = CALC4;
			CALC4: next_state = CALC5;
			CALC5: next_state = CALC6;
			CALC6: next_state = CALC7;
			CALC7: next_state = CALC8;
			CALC8: next_state = CALC9;
			CALC9: next_state = CALC10;
			CALC10: next_state = CALC11;
			CALC11: next_state = CALC12;
			CALC12: next_state = CALC13;
			CALC13: next_state = CALC14;
			CALC14: next_state = CALC15;
			CALC15: next_state = CALC16;
			CALC16: next_state = CALC17;
			CALC17: next_state = CALC18;
			CALC18: next_state = CALC19;
			CALC19: next_state = CALC20;
			CALC20: next_state = CALC21;
			CALC21: next_state = CALC22;
			CALC22: next_state = CALC23;
			CALC23: next_state = CALC24;
			CALC24: next_state = CALC25;
			CALC25: next_state = CALC26;
			CALC26: next_state = CALC27;
			CALC27: next_state = CALC28;
			CALC28: next_state = CALC29;
			CALC29: next_state = CALC30;
			CALC30: next_state = CALC31;
			CALC31: next_state = CALC32;
			CALC32: next_state = CALC33;
			CALC33: next_state = CALC34;
			CALC34: next_state = CALC35;
			CALC35: next_state = CALC36;
			CALC36: next_state = CALC37;
			CALC37: next_state = CALC38;
			CALC38: next_state = CALC39;
			CALC39: next_state = CALC40;
			CALC40: next_state = CALC41;
			CALC41: next_state = CALC42;
			CALC42: next_state = CALC43;
			CALC43: next_state = CALC44;
			CALC44: next_state = CALC45;
			CALC45: next_state = CALC46;
			CALC46: next_state = CALC47;
			CALC47: next_state = CALC48;
			CALC48: next_state = CALC49;
			CALC49: next_state = CALC50;
			CALC50: next_state = CALC51;
			CALC51: next_state = CALC52;
			CALC52: next_state = CALC53;
			CALC53: next_state = CALC54;
			CALC54: next_state = CALC55;
			CALC55: next_state = CALC56;
			CALC56: next_state = CALC57;
			CALC57: next_state = CALC58;
			CALC58: next_state = CALC59;
			CALC59: next_state = CALC60;
			CALC60: next_state = CALC61;
			CALC61: next_state = CALC62;
			CALC62: next_state = CALC63;
			CALC63: next_state = CALC64;
			CALC64: begin
				next_state = REPAIR;
				opB_sel[1:0] = 2'h1;
			end
			REPAIR: begin
				next_state = REMAIN;
				opA_inv = 1'b0;
				opB_sel[1:0] = 2'h1;
				opC_ld = 1'b0;
				adder_cin = 1'b0;
				opB_ld = add_neg_last;
			end
			REMAIN: begin
				next_state = QUOT;
				opA_ld = 1'b1;
				opA_clr_l = 1'b0;
				opB_sel[1:0] = 2'h2;
				opC_ld = 1'b0;
				opB_inv = r_neg;
				adder_cin = r_neg;
			end
			QUOT: begin
				next_state = DONE;
				opA_clr_l = 1'b0;
				opB_inv = 1'b1;
				opB_ld = 1'b0;
				opC_sel[1:0] = 2'h1;
				adder_cin = 1'b1;
				opC_ld = q_neg;
			end
			DONE: begin
				next_state = WAIT;
				opA_ld = 1'b0;
				opB_ld = 1'b0;
				opC_ld = 1'b0;
			end
		endcase
	end
	assign valid_out = (state==DONE);
endmodule

/*
module divider_testbench();
	wire [63:0] quotient;
	wire valid_out;
	reg [63:0] dividend, divisor;
	reg valid_in, rst, clk;
	
	divider DUT(.quotient, .valid_out, .dividend, .divisor, .valid_in, .rst, .clk);
	reg [31:0] i; //counter
	
	initial begin
		rst=1'b1;
		dividend=64'h12;
		divisor=64'h3;
		valid_in=1'b1;
		clk=0;
		#10;
		clk=1;	#5;	rst=0;
		for(i=0; i<80; i=i+1) begin
			#5;
			clk=0;
			#5;
			clk=1;
		end
	end
endmodule */

