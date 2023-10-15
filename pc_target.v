`timescale 1ns / 1ns
module pc_target(input[31:0]immext,pc_old,output[31:0]pc_new);
assign pc_new=pc_old+immext;
endmodule