module tb();
	logic clk, reset;

	pipelined dut (.clk, .reset);

	// Set up the clock
	parameter ClockDelay = 20;
	initial begin
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
			$sdf_annotate("./pipelined.syn.sdf", pipelined);
		$vcdpluson;
		$vcdplusmemon;
				reset <= 1; 	@(posedge clk);
				reset <= 0; 	@(posedge clk);
			repeat(3000) begin	@(posedge clk); end			
				
		$finish; // end the simulation
	end
endmodule

