`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 02:26:08 PM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
        DATA_IN, ALU_S_IN, DATA_OUT, ALU_S_OUT, clk
    );
    
    input clk;
    
    input [31:0] DATA_IN;
    input [31:0] ALU_S_IN;
    
    output reg [31:0] DATA_OUT;
    output reg [31:0] ALU_S_OUT;
    
    always@(posedge clk)
    begin
        DATA_OUT = DATA_IN;
        ALU_S_OUT = ALU_S_IN;
    end
    
endmodule
