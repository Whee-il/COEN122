`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 02:26:08 PM
// Design Name: 
// Module Name: EXMEM_WB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EXMEM_WB(
        DATA_IN, ALU_S_IN, rs_IN, ALU_flag_IN,rd_IN,MemToReg_IN, RegWrt_IN, JumpMem_IN, Jump_IN, Branch_IN, 
        DATA_OUT, ALU_S_OUT,rs_out, ALU_flag_OUT,rd_OUT,MemToReg_OUT, RegWrt_OUT, JumpMem_OUT, Jump_OUT, Branch_OUT, clk
    );
    
    input clk;
    
    input [31:0] DATA_IN, rd_IN;
    input [31:0] ALU_S_IN,rs_IN;
    input ALU_flag_IN;
    input MemToReg_IN, RegWrt_IN, JumpMem_IN, Jump_IN, Branch_IN;
    
    output reg [31:0] DATA_OUT, rd_OUT;
    output reg [31:0] ALU_S_OUT,rs_out;
    output reg ALU_flag_OUT;
    output reg MemToReg_OUT, RegWrt_OUT, JumpMem_OUT, Jump_OUT, Branch_OUT;
    
    always@(posedge clk)
    begin
        DATA_OUT = DATA_IN;
        ALU_S_OUT = ALU_S_IN;
        rs_out = rs_IN;
        rd_OUT = rd_IN;
        ALU_flag_OUT = ALU_flag_IN;
        MemToReg_OUT = MemToReg_IN;
        RegWrt_OUT = RegWrt_IN;
        JumpMem_OUT = JumpMem_IN;
        Jump_OUT = Jump_IN;
        Branch_OUT = Branch_OUT;
    end
endmodule
