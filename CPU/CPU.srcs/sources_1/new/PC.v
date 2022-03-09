`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2022 03:52:52 PM
// Design Name: 
// Module Name: PC
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


module PC(
        PC_in, PC_out, clk
    );
    
    input [7:0] PC_in;
    input clk;
    
    output reg [7:0] PC_out;
    
    initial begin
        PC_out = 0;
    end
    
    always@(negedge clk) begin
        if(PC_in)  
        PC_out = PC_in;
    end       
endmodule
