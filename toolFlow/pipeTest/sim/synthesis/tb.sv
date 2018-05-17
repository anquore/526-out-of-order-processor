module tb();
	logic	[3:0] 	decodeReadAddr1_i, decodeReadAddr2_i, completionWriteAddr_i;
	logic [8:0]	decodeWriteData_i;
  logic [69:0] completionWriteData_i;
	logic 			reset_i, clk_i, completionWriteEn_i, updateHead_i, updateTail_i;
	logic [64:0]	decodeReadData1_o, decodeReadData2_o;
  logic [78:0] commitReadData_o;
  logic [3:0] nextTail_o, head_o;
  logic stall_o;
  
  //the module
  ROB dut
  (.clk_i
  ,.reset_i
  ,.decodeReadAddr1_i
  ,.decodeReadAddr2_i
  ,.decodeReadData1_o
  ,.decodeReadData2_o
  ,.updateTail_i
  ,.decodeWriteData_i
  ,.nextTail_o
  ,.stall_o
  ,.completionWriteAddr_i
  ,.completionWriteEn_i
  ,.completionWriteData_i
  ,.updateHead_i
  ,.head_o
  ,.commitReadData_o);


  
  parameter ClockDelay = 5000;
  initial begin // Set up the clock
		clk_i <= 0;
		forever #(ClockDelay/2) clk_i <= ~clk_i;
	end
  
  integer i;
  
  initial begin
    //set everything to zero
$sdf_annotate("./ROB1.sdf", dut);
		$vcdpluson;
		$vcdplusmemon;

    decodeReadAddr1_i <= 0; decodeReadAddr2_i <= 0; completionWriteAddr_i <= 0;
    decodeWriteData_i <= 0; completionWriteData_i <= 0;
    completionWriteEn_i <= 0; updateHead_i <= 0; updateTail_i <= 0;
    reset_i <= 1'b1;@(posedge clk_i);
	@(posedge clk_i);
	@(posedge clk_i);
    //flash reset
    reset_i <= 1'b0; @(posedge clk_i);
    
    //write stuff into decode
    for (i=1; i<5; i=i+1) begin
      updateTail_i <= 1;
			decodeReadAddr1_i <= i;
			decodeReadAddr2_i <= i + 1;
			decodeWriteData_i <= i*7'd1;
			@(posedge clk_i);
			
		end
    
    
    updateTail_i <= 0; @(posedge clk_i);
    //write stuff into completion
    for (i=1; i<5; i=i+1) begin
			completionWriteEn_i <= 1;
			completionWriteAddr_i <= i;
			completionWriteData_i <= i*70'd2;
			@(posedge clk_i);
		end
    
    completionWriteEn_i <= 0;@(posedge clk_i);
    // Go back and verify that the registers
		// retained the data.
		$display("%t Checking pattern.", $time);
		for (i=1; i<5; i=i+1) begin
			decodeReadAddr1_i <= i;
			decodeReadAddr2_i <= i + 1;
			@(posedge clk_i);
		end
    
    // Go back and verify that the registers
		// retained the data.
		$display("%t Checking pattern.", $time);
		for (i=0; i<2; i=i+1) begin
			updateHead_i <= 1;
			@(posedge clk_i);
		end
    updateHead_i <= 0; @(posedge clk_i);
    @(posedge clk_i);
    
    //write values to tail till it over flows
    for (i=1; i<8; i=i+1) begin
      updateTail_i <= 1;
			decodeWriteData_i <= i*7'd1;
			@(posedge clk_i);	
		end
    updateTail_i <= 0; @(posedge clk_i);
    
    
    //take off some heads
    for (i=0; i<4; i=i+1) begin
			updateHead_i <= 1;
			@(posedge clk_i);
		end
    updateHead_i <= 0; @(posedge clk_i);
    //writes some more at tail
    for (i=1; i<3; i=i+1) begin
      updateTail_i <= 1;
			decodeWriteData_i <= i*7'd1;
			@(posedge clk_i);	
		end
    updateTail_i <= 0; @(posedge clk_i);
     
    //update tail and head at the same time
    for (i=1; i<3; i=i+1) begin
      updateTail_i <= 1;
      updateHead_i <= 1;
			decodeWriteData_i <= i*7'd1;
			@(posedge clk_i);	
		end
    @(posedge clk_i);	
    $finish;
  end

endmodule

