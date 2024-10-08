`timescale 1ns / 1ns
module instruction_memory 
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=32)
(
	// input [(ADDR_WIDTH-1):0] addr,
	// output reg [((DATA_WIDTH*4)-1):0] q
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output reg signed  [(32-1):0] q
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] rom[90:0];
	initial
	begin
    $readmemh("program.txt",rom);
    end
	// Variable to hold the registered read address
	reg [ADDR_WIDTH-1:0] addr_reg;
	always @ (negedge clk)
	begin
		// Write
		if (we)
			rom[addr] <= data;
	end
	always @ (*)
	begin
		q={rom[addr],rom[addr+1],rom[addr+2],rom[addr+3]};
	end

endmodule
