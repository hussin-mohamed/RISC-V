`timescale 1ns / 1ns
module Register_file(input signed [31:0]  data_received,input clk,write,input[4:0] src_add1,src_add2,write_add,output  reg signed [31:0] datasent1,datasent2   );
reg [31:0] ram[2**5-1:0];
initial  begin
    ram[0]=0;
end
always@(negedge clk)
begin
if(write)
ram [write_add] = data_received;
end
always@(src_add1,src_add2)
begin
datasent1=ram[src_add1];
datasent2=ram[src_add2];
end

endmodule
