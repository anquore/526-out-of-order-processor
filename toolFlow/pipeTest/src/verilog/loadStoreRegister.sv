//reg structure: LoadStore (load 1, store 0)[200], valid_PC[199], PC (64 bit)[198:135], ROBid (5 bit) [134:130], valid_addr[129], addr (64 bit)[128:65], valid_val[64], val (64 bit)[63:0]

module loadStoreRegister(out, newIn, enNew, addrIn, enAddr, valIn, enVal, clk);
	output [200:0] out;
	input [200:130] newIn;
	input enNew;
	input [129:65] addrIn;
	input enAddr;
	input [64:0] valIn;
	input enVal;
	input clk;
	
	wallOfDFFsX71 regNew(.q(out[200:130]), .d(newIn[201:130]), .enable(enNew), .clk);
	wallOfDFFsX65 regAddr(.q(out[129:65]), .d(addrIn[129:65]), .enable(enAddr), .clk);
	wallOfDFFsX65 regVal(.q(out[64:0]), .d(valIn[64:0]), .enable(enVal), .clk);
endmodule

