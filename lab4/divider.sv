module divider(out, valid_out, A, B, valid_in, reset, clk);
	output [63:0] out;
	output valid_out;
	input [63:0] A, B;
	input valid_in, clk, reset;
	
	//timing module and register, 4 cycle process
	wire [63:0] Ar, Br;
	wire v1, v2, v3, v4;
	registerX64 regA(.out(Ar[63:0]), .in(A[63:0]), .rst(reset), .clk(v1));
	registerX64 regB(.out(Br[63:0]), .in(B[63:0]), .rst(reset), .clk(v1));
	D_FF valid0(.q(v1), .d(valid_in), .reset(reset), .clk);
	D_FF valid1(.q(v2), .d(v1), .reset(reset), .clk);
	D_FF valid2(.q(v3), .d(v2), .reset(reset), .clk);
	D_FF valid3(.q(v4), .d(v3), .reset(reset), .clk(clk&(v3|v2|v1)));
	assign valid_out = v4&(~((v2&~v3)|(v1&~v2)));
  
  assign out = A / B;
  
endmodule