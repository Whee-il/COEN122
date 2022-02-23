`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2022 03:01:35 PM
// Design Name: 
// Module Name: mux3_1
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


module mux3_1(A, One, Anot, S, out);
    
    input [31:0] A, One, Anot;
    input [1:0] S;
    output reg [31:0] out;
    
    always @(A, One, Anot, S)
    begin
    if(S==2'b00)
        out = A;
    else
        if(S==2'b01)
            out = One;
        else
            out = Anot;        
    end
endmodule
