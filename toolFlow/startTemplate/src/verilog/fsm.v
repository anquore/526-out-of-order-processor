
module fsm
	(
	// Inputs 
	input wire clk,
	input wire reset,
	input wire w,
	input wire n, 
	// Outputs 
	output wire[1:0] light //light[1] west, light[0] north
	);

// reset fifo
reg rst_0;
reg rst_1;

// State registers 
reg[2:0] state;

// counter
reg[1:0] count;

// State encoding 
localparam 
	STATE_0 = 3'b000,
	STATE_1 = 3'b001,
	STATE_2 = 3'b010,
	STATE_3 = 3'b011,
	STATE_4 = 3'b100,
	STATE_5 = 3'b101,
	STATE_6 = 3'b110,
	STATE_7 = 3'b111;

// Light signals 
localparam	
	NORTH = 2'b01,
	WEST = 2'b10,
	OFF = 2'b00;

// Buffer reset
always @(posedge clk) begin
	rst_0 <= reset;
	rst_1 <= rst_0;
end

// Increment counter
always @(posedge clk or posedge rst_1) begin
	if (rst_1) begin 
		count <= 2'b0;
	end else if (count == 2'b10) begin
		count <= 2'b0; 
	end else if (state != STATE_0) begin 
		count <= count + 1;
	end
end 

// Generate light signals 
assign light = (state == STATE_1 || state == STATE_3) ? NORTH : 
			   (state == STATE_2 || state == STATE_4) ? WEST :
			   OFF; 

// State transition logic
always @(posedge clk or posedge rst_1) begin
	if (rst_1) begin
		state <= STATE_0;
	end else case (state)
		// idle, waiting for w or n
		STATE_0: begin
			if (n && w) begin
				state <= STATE_3;
			end else if (n) begin
				state <= STATE_1;
			end else if (w) begin
				state <= STATE_2;
			end else begin
				state <= state;
			end
		end
		// captured n, signal and wait
		STATE_1: begin
			if (w) begin
				state <= STATE_3;
			end else if (count == 2'b10) begin
				state <= STATE_0;			
			end
		end 
		
		// captured w, signal and wait
		STATE_2: begin
			if (n) begin
				state <= STATE_4;
			end else if (count == 2'b10) begin
				state <= STATE_0;			
			end
		end
		
		// captured w while n was on 
		STATE_3: begin
			if (count == 2'b10) begin
				state <= STATE_2;
			end
		end
		
		// captured n while w was on
		STATE_4: begin
			if (count == 2'b10) begin
				state <= STATE_1;
			end
		end
		
		// null
		STATE_5: begin
		end 
		
		// null
		STATE_6: begin
		end 
		
		// null
		STATE_7: begin
		end 
			
	endcase
end


endmodule

