`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2022 02:39:40 PM
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


module mux(A,B,C,D,sel,out);
    input A,B,C,D;
    input [1:0] sel;
    wire output1, output2, output3, output4;
    wire not0, not1;
    output out;
    
    //Get the inverted select values
    not(not0, sel[0]);
    not(not1, sel[1]);
    
    //Only one of the following will be true
    and(output1, A, not1, not0);
    and(output2, B, not1, sel[0]);
    and(output3, C, sel[1], not0);
    and(output4, D, sel[1], sel[0]);
    
    //select the output from the 4 and operations
    or(out, output1, output2, output3, output4);
    
endmodule
