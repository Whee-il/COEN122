`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2022 02:41:52 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    clk, PC, Instruction
    );
    input clk;
    input  [7:0]PC;
    output reg [31:0] Instruction;
    
    wire [31:0] Instructions[255:0];
    
    assign Instructions[0] = 32'b0;
    assign Instructions[1] = 32'b0;
    assign Instructions[2] = 32'b0;
    assign Instructions[3] = 32'b0;
    assign Instructions[4] = 32'b0;
    assign Instructions[5] = 32'b0100000110000010000100000000000;

    always@(posedge clk) begin
        
        Instruction = Instructions[PC];
        
    end
endmodule
