`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2022 03:27:01 PM
// Design Name: 
// Module Name: ALU
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


module ALU(Opcode, A, B, S, Z, N, clk);
    input [3:0] Opcode;
    input [31:0] A, B;
    input clk;
    output [31:0] S;
    output reg Z, N;
    
    reg select1;
    reg [1:0] select2;
    
    wire [31:0] input1, input2, Anot;
    
    two_compliment comp(A, Anot);
    
    mux2_1 sel1(B, 32'b0, select1, input1);
    
    mux3_1 sel2(A, 32'b1, Anot, select2, input2);
    
    Ripple_Carry add(input1, input2, S, _);
    
    //two_compliment sub(S, Snot);
    
    always@(posedge clk)
    begin
    if(Opcode == 4'b0000) // SUM
    begin
        select1 = 1'b0; //B
        select2 = 2'b00; //A
    end
    else if(Opcode == 4'b0001) // Increment
    begin
        select1 = 1'b0; // B
        select2 = 2'b01; //1
    end
    else if(Opcode == 4'b0010) // Negate
    begin
        select1 = 1'b1; // 0
        select2 = 2'b10; //Anot
    end
    else if(Opcode == 4'b0011) // Subtract
    begin
        select1 = 1'b0; //B
        select2 = 2'b10; //Anot
    end    
    else if(Opcode == 4'b0100) // Pass A
    begin
        select1 = 1'b1; // 0
        select2 = 2'b00; // A
    end
    
    if(S == 32'b0)
        Z = 1;
    else
        Z = 0;
    if(S[31] == 1'b1)
        N = 1;
    else
        N = 0;
    end

endmodule
