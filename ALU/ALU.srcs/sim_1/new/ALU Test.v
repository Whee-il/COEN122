`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2022 04:10:36 PM
// Design Name: 
// Module Name: ALU Test
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


module ALU_Test();
    reg [31:0] A, B;
    reg [3:0] Opcode;
    wire [31:0] Out;
    wire Z, N;
    
    ALU tester(Opcode, A, B, Out, Z, N);
    //Ripple_Carry adder(A,B,Out,Z);
    //full_adder addr(1'b0, 1'b1, 1'b1, Z, N);
    
    initial
    begin
    
    A = 25;
    B = 10;
    
    Opcode = 0; // Addition
    #50
    
    Opcode = 1; //Increment
    #50
    
    Opcode = 2; // Negate
    #50
    
    Opcode = 3; //Subtract
    #50
    
    Opcode = 4; //Pass A
    #50
    
    A = 0;
    #50
    $finish;
    end

endmodule
