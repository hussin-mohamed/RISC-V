// Quartus Prime Verilog Template
// Single port RAM with single read/write address 

module Data_memory 
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=32)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output reg signed  [(DATA_WIDTH-1):0] q
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[63:0];

	// Variable to hold the registered read address



always @(posedge clk)  begin
	$readmemb("data.txt",ram);
end

	always @ (negedge clk)
	begin
		// Write
		if (we)
			ram[addr] = data;
	end

	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	always @(addr) begin
		q=ram[addr];
	end

endmodule
