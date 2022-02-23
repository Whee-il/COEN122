`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2022 02:48:38 PM
// Design Name: 
// Module Name: bit_adder
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


module bit_adder(A,B,Out,C);
    input A;
    input B;
    output reg Out;
    output reg C;
    
    always@(A,B)
    begin
    Out = A^B;
    C = A & B;
    end
endmodule
