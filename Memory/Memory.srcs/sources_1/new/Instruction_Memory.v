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
    assign Instructions[8'b0] = 32'b00000000000000000000000000000000;   //nop
    assign Instructions[8'b01] = 32'b00000000000000000000000000000000;  //nop
    assign Instructions[8'b010] = 32'b11100001000000110000000000000000; //x4 <- x3
    assign Instructions[8'b011] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b0100] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b0101] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b0110] = 32'b01110000000001000000110000000000; //x0 <- x1 - x4
    assign Instructions[8'b0111] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b01000] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b01001] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b01010] = 32'b10010000000000000000000000000000; //branch
    assign Instructions[8'b01011] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b01100] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b01101] = 32'b01000000000001000000110000000000; //x0 <- x1 + x4
    assign Instructions[8'b01110] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b01111] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b010000] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b010001] = 32'b01010000000000100001110000000000; //x0 <- x3 + 7
    assign Instructions[8'b010010] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b010011] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b010100] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8'b010101] = 32'b01100000000000010000000000000000; //x0 <- -x1

    //assign Instructions[3] = 32'b01000000110000100000110000000000;
    //assign Instructions[4] = 32'b01000001000000100000010000000000;
    
    /*
    assign Instructions[4] = 32'b10000000000000000000000000000000;
    assign Instructions[5] = 32'b00000000000000000000000000000000;
    assign Instructions[6] = 32'b00000000000000000000000000000000;
    assign Instructions[7] = 32'b00000000000000000000000000000000;
    */

    always@(posedge clk) begin
        
        Instruction = Instructions[PC];
        
    end
endmodule
