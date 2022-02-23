`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2022 03:27:01 PM
// Design Name: 
// Module Name: two_compliment
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


module two_compliment(A, Anot);

    input [31:0] A;
    output reg [31:0] Anot;
    
    always@(A)
    begin
    
    Anot = (~A) + 1'b1;
    
    end

endmodule
