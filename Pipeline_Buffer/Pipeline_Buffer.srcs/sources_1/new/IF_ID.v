`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 02:26:08 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    PC_IN, IM_IN, PC_OUT, IM_OUT, clk
    );
    input [7:0] PC_IN;
    input [31:0] IM_IN;
    input clk;
    output reg [7:0] PC_OUT;
    output reg [31:0] IM_OUT; 
    
    always@(posedge clk)
    begin
        PC_OUT = PC_IN;
        IM_OUT = IM_IN;
    end
endmodule
