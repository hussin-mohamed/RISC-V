`timescale 1ns / 1ns
module pc(input[31:0]pc,output reg[31:0]pc_new,input clk,input reset);
always@(posedge clk or negedge reset)
begin
if(!reset)
pc_new<=0;
else
pc_new<=pc;
end
endmodule