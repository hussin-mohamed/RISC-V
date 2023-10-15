`timescale 1ns / 1ns
module alu (input [2:0] alu_ctrl,input signed [31:0]a,b,output  reg signed [31:0]c,output reg zero );
wire [31:0] annd=a&b;
wire [31:0] orr=a|b;
wire [31:0] addd=a+b;
wire [31:0] sub=a-b;
always @(*)
begin
case (alu_ctrl)
    3'b000:
    begin
    c=addd;
    zero = 0;
    end
    3'b001:
    begin
    c=sub;
    if(sub==0)
    zero=1;
    else
    zero=0;
    end
    3'b101:
    begin
    zero=(a-b<0)?1:0;
    c=sub;
    end
    3'b011:
    begin
    c=orr;
    zero=0;
    end
    3'b010:
    begin
    c=annd;
    zero=0;
    end
    default:
    begin
    c=0;
    zero=0; 
    end
endcase
end
endmodule