`timescale 1ns / 1ns
module mux (input sel,input[31:0] choice1,choice2,output reg [31:0] selected);
always@(*)
begin
    case (sel)
        1'b0:selected<=choice1;
        1'b1:selected<=choice2; 
        default: selected=0;
    endcase
end
endmodule