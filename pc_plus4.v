`timescale 1ns / 1ns
module pc_plus4 (input [31:0] pc_old ,output [31:0] pc_new);
parameter const =4;
assign pc_new=pc_old+const;
endmodule