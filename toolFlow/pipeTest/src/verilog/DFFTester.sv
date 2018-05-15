module DFFTester (q, d, reset, enable, clk);
	output logic q;
	input logic d;
	input logic reset, enable, clk;
	
	wallOfDFFs #(.LENGTH(16)) dut(.q, .d, .reset, .enable, .clk);
endmodule

