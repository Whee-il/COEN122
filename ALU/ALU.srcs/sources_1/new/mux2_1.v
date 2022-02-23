`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2022 03:01:35 PM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(B, zero, S, out);
    input [31:0] B, zero;
    input S;
    output reg [31:0] out;
    
    always @(B, zero, S)
    begin
    if(S==0)
        out = B;
    else
        out = zero;
    end

endmodule
