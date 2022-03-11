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
    
    reg [1:0] select1, select2;
    
    wire [31:0] input1, input2, Anot, Bnot;
    
    two_compliment compA(A, Anot);
    two_compliment compB(B, Bnot);

    mux3_1 sell(B, 32'b0, Bnot, select1, input1);
    
    mux3_1 sel2(A, 32'b1, Anot, select2, input2);
    
    Ripple_Carry add(input1, input2, S, _);
    
    //two_compliment sub(S, Snot);
    
    always@(posedge clk)
    begin
    if(Opcode == 4'b0000) // SUM
    begin
        select1 = 2'b00; //B
        select2 = 2'b00; //A
    end
    else if(Opcode == 4'b0001) // Increment
    begin
        select1 = 2'b00; // B
        select2 = 2'b01; //1
    end
    else if(Opcode == 4'b0010) // Negate
    begin
        select1 = 2'b01; // 0
        select2 = 2'b10; //Anot
    end
    else if(Opcode == 4'b0011) // Subtract
    begin
        select1 = 2'b10; //Bnot
        select2 = 2'b00; //A
    end    
    else if(Opcode == 4'b0100) // Pass A
    begin
        select1 = 2'b01; // 0
        select2 = 2'b00; // A
    end
    end
    always@(S)
    begin
    if(Opcode != 4'b0100)
    begin
    if(S == 32'b0) begin
        Z = 1; end
    else begin
        Z = 0; end
    if(S[31] == 1'b1) begin
        N = 1; end
    else begin
        N = 0; end
    end
    end
endmodule
