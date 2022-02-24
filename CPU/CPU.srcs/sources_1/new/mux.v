`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 05:38:06 PM
// Design Name: 
// Module Name: mux
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


module mux(A,B,sel,out,clk);
    input [31:0] A,B;
    input sel;
    output reg [31:0] out;
    input clk;
    
    always @(posedge clk) begin
        if(sel == 0)
            out = A;
        else out = B;
    end
endmodule
