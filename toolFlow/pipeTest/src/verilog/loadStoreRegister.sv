//reg structure: LoadStore (load 1, store 0)[201], valid_PC[200], PC (64 bit)[199:135], ROBid (5 bit) [134:130], valid_addr[129], addr (64 bit)[128:65], valid_val[64], val (64 bit)[63:0]

module loadStoreRegister(out, newIn, enNew, addrIn, enAddr, valIn, enVal);
	output [201:0] out;
	input [201:130] newIn;
	input enNew;
	input [129:65] addrIn;
	input enAddr;
	input [64:0] valIn;
	input enVal;
	
	wallOfDFFsX72 regNew(.q(out[201:130]), .d(newIn[201:130]), .enable(enNew), .clk);
	wallOfDFFsX65 regAddr(.q(out[129:65]), .d(addrIn[129:65]), .enable(enAddr), .clk);
	wallOfDFFsX65 regVal(.q(out[64:0]), .d(valIn[64:0]), .enable(enVal), .clk);
end

