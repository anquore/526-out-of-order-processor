module tb();
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

