`timescale 1ns / 1ns
module mux3 (input[1:0] sel,input[31:0] choice1,choice2,choice3,output reg [31:0] selected);
always@(*)
begin
    case(sel)
    'b00:selected=choice1;
    'b01:selected=choice2;
    'b10:selected=choice3;
    default:selected=0;
    endcase
end
endmodule