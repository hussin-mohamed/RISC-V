`timescale 1ns / 1ns
module sim();
reg clk,reset;
top top1(clk,reset);
initial begin
    reset=0;
    #10;
    reset=1;
end
always 
begin
clk<=1;
#100;
clk<=0;
#100;
end

endmodule