`timescale 1ns / 1ns
module top(input clk,input reset);
wire[31:0] pc_next,pc_new,pc_plus,pc_target,immext,instr,rd1,rd2,srcb,aluresult,readdata,result;
wire[5:0]a,b,c;
assign a=instr[19:15];
assign b=instr[24:20];
assign c=instr[11:7];
wire pcsrc,zero,memwrite,regwrite,alusrc;
wire [1:0] immsrc,resultsrc;
wire[2:0] aluctrl;
pc pc1(pc_next,pc_new,clk,reset);
mux mux1(pcsrc,pc_plus,pc_target,pc_next);
pc_plus4 pc_plus41(pc_new,pc_plus); 
instruction_memory memory1(pc_new,instr);
extend extend(instr[31:7],immsrc,immext);
pc_target target(immext,pc_new,pc_target);
control_unit control(instr[29:0],zero,memwrite,regwrite,alusrc,aluctrl,immsrc,resultsrc,pcsrc);
Register_file reg1(result,clk,regwrite,a,b,c,rd1,rd2);
mux mux2(alusrc,rd2,immext,srcb);
alu alu(aluctrl,rd1,srcb,aluresult,zero);
Data_memory memory2(rd2,aluresult,memwrite,clk,readdata);
mux3 mux3(resultsrc,aluresult,readdata,pc_plus,result);
endmodule