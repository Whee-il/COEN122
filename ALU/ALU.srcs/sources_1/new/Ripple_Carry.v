`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2022 03:36:12 PM
// Design Name: 
// Module Name: Ripple_Carry
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


module Ripple_Carry(A, B, S, Cout);
    input [31:0] A, B;
    output [31:0] S;
    output Cout;
    wire [31:0] carry;
    
    full_adder bit0(1'b0, A[0], B[0], S[0], carry[0]);
    full_adder bit1(carry[0], A[1], B[1], S[1], carry[1]);
    full_adder bit2(carry[1], A[2], B[2], S[2], carry[2]);
    full_adder bit3(carry[2], A[3], B[3], S[3], carry[3]);
    full_adder bit4(carry[3], A[4], B[4], S[4], carry[4]);
    full_adder bit5(carry[4], A[5], B[5], S[5], carry[5]);
    full_adder bit6(carry[5], A[6], B[6], S[6], carry[6]);
    full_adder bit7(carry[6], A[7], B[7], S[7], carry[7]);
    full_adder bit8(carry[7], A[8], B[8], S[8], carry[8]);
    full_adder bit9(carry[8], A[9], B[9], S[9], carry[9]);
    full_adder bit10(carry[9], A[10], B[10], S[10], carry[10]);
    full_adder bit11(carry[10], A[11], B[11], S[11], carry[11]);
    full_adder bit12(carry[11], A[12], B[12], S[12], carry[12]);
    full_adder bit13(carry[12], A[13], B[13], S[13], carry[13]);
    full_adder bit14(carry[13], A[14], B[14], S[14], carry[14]);
    full_adder bit15(carry[14], A[15], B[15], S[15], carry[15]);
    full_adder bit16(carry[15], A[16], B[16], S[16], carry[16]);
    full_adder bit17(carry[16], A[17], B[17], S[17], carry[17]);
    full_adder bit18(carry[17], A[18], B[18], S[18], carry[18]);
    full_adder bit19(carry[18], A[19], B[19], S[19], carry[19]);
    full_adder bit20(carry[19], A[20], B[20], S[20], carry[20]);
    full_adder bit21(carry[20], A[21], B[21], S[21], carry[21]);
    full_adder bit22(carry[21], A[22], B[22], S[22], carry[22]);
    full_adder bit23(carry[22], A[23], B[23], S[23], carry[23]);
    full_adder bit24(carry[23], A[24], B[24], S[24], carry[24]);
    full_adder bit25(carry[24], A[25], B[25], S[25], carry[25]);
    full_adder bit26(carry[25], A[26], B[26], S[26], carry[26]);
    full_adder bit27(carry[26], A[27], B[27], S[27], carry[27]);
    full_adder bit28(carry[27], A[28], B[28], S[28], carry[28]);
    full_adder bit29(carry[28], A[29], B[29], S[29], carry[29]);
    full_adder bit30(carry[29], A[30], B[30], S[30], carry[30]);
    full_adder bit31(carry[30], A[31], B[31], S[31], Cout);
    
   
   
endmodule
