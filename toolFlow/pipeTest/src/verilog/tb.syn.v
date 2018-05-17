module tb();
	logic clk, reset;
  //instruction memory
  logic [31:0] imem_instruction_i;
  logic [63:0] imem_address_o;
  
  //data memory
  logic [63:0] dmem_readData;
  logic [63:0] dmem_WriteData, dmem_addressLoad, dmem_addressStore;
  logic dmem_readEn, dmem_writeEn;

	pipelinedProcessorOOO dut 
  (.clk
  ,.reset
  ,.imem_instruction_i
  ,.imem_address_o
  ,.dmem_readData
  ,.dmem_WriteData
  ,.dmem_addressLoad
  ,.dmem_addressStore
  ,.dmem_readEn
  ,.dmem_writeEn);
  
  instructmem instrMem(.address(imem_address_o), .instruction(imem_instruction_i), .clk);
  
  datamem theDataMemory (.addressLoad(dmem_addressLoad), .addressStore(dmem_addressStore), .write_enable(dmem_writeEn), .read_enable(dmem_readEn), 
									.write_data(dmem_WriteData), .clk, .xfer_size(4'b1000), .read_data(dmem_readData));

	// Set up the clock
	parameter ClockDelay = 20;
	initial begin
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
			$sdf_annotate("./pipelinedProcessorOOO.sdf", dut);
		$vcdpluson;
		$vcdplusmemon;
				reset <= 1; 	@(posedge clk);
				reset <= 0; 	@(posedge clk);
			repeat(3000) begin	@(posedge clk); end			
				
		$finish; // end the simulation
	end
endmodule

