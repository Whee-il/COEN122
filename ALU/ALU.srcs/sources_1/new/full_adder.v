`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2022 03:01:35 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(Cin, A, B, S, Cout);
    input Cin, A, B;
    output S, Cout;
    
    wire connect_S, connect_C, connect_C2;
    bit_adder add1(A,B, connect_S, connect_C);
    bit_adder add2(connect_S, Cin, S, connect_C2);
    or(Cout, connect_C, connect_C2);

    
endmodule
