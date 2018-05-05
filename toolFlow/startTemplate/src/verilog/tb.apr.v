
module tb;

// test inputs/outputs
reg clk, reset, n, w;
wire[1:0] light;

// set variables
parameter half_per = 1.5;
parameter delay = 3; //one whole period
parameter ini = 1.4; //setup time of 0.3

// dut
fsm fsm0(
    .reset(reset),
    .clk(clk),
	.w(w),
	.n(n),
	.light(light)
);

initial begin
clk = 1'b1;
reset = 1'b1;
w = 1'b0;
n = 1'b0;

		$sdf_annotate("./fsm.apr.sdf", fsm0);
	$vcdpluson;

	#(delay);
	#(ini) reset = 1'b0;
	// signal for north light
	#(3*delay);
	w = 1'b0;
	n = 1'b1;
	#(delay);
	w = 1'b0;
	n = 1'b0;
	#(3*delay);	
	// signal for north light, attempt to signal west	
	w = 1'b0;
	n = 1'b1;
	#(delay);
	w = 1'b1;
	n = 1'b0;
	#(delay);
	w = 1'b0;
	n = 1'b0;
	#(2*delay);
	// signal for west light
	w = 1'b1;
	n = 1'b0;
	#(delay);
	w = 1'b0;
	n = 1'b0;
	#(3*delay);	
	// signal for west light, attempt to signal north	
	w = 1'b1;
	n = 1'b0;
	#(delay);
	w = 1'b0;
	n = 1'b1;
	#(delay);
	w = 1'b0;
	n = 1'b0;
	#(8*delay);
	// signal north and west at same time 
	w = 1'b1;
	n = 1'b1;
	#(delay);
	w = 1'b0;
	n = 1'b0;
	#(3*delay);
	
	#(10*delay);
	$finish;
end
   
always begin
#(half_per) clk <= ~clk;
end
   
endmodule
