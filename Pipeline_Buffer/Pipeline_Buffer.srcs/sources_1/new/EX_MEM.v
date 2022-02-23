`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 02:26:08 PM
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
    PC_SUM_IN, ALU_S_IN, ALU_Z_IN, ALU_N_IN, RT_IN, PC_SUM_OUT, ALU_S_OUT, ALU_Z_OUT, ALU_N_OUT, RT_OUT, clk
    );
    
    input clk;
    
    input [7:0] PC_SUM_IN;
    input [31:0] ALU_S_IN;
    input ALU_Z_IN, ALU_N_IN;
    input [31:0] RT_IN;
    
    output reg [7:0] PC_SUM_OUT;
    output reg [31:0] ALU_S_OUT;
    output reg ALU_Z_OUT, ALU_N_OUT;
    output reg [31:0] RT_OUT;
     
    always@(posedge clk)
    begin
        PC_SUM_OUT = PC_SUM_IN;
        ALU_S_OUT = ALU_S_IN;
        ALU_Z_OUT = ALU_Z_IN;
        ALU_N_OUT = ALU_N_IN;
        RT_OUT = RT_IN;
    end
    
endmodule
