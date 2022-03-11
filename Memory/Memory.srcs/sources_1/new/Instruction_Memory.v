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
    /*assign Instructions[0] = 32'b00000000000000000000000000000000;   //nop
    assign Instructions[1] = 32'b00000000000000000000000000000000;  //nop
    assign Instructions[2] = 32'b00110000000000000000000000000000;  //x0 <- 0
    assign Instructions[3] = 32'b00000000000000000000000000000000;   //nop
    assign Instructions[4] = 32'b00000000000000000000000000000000;  //nop
    assign Instructions[5] = 32'b00110000010000010000000000000000;  //x1 <- 1
    assign Instructions[6] = 32'b00000000000000000000000000000000;   //nop
    assign Instructions[7] = 32'b00000000000000000000000000000000;  //nop
    assign Instructions[8] = 32'b00110000100000100000000000000000;  //x2 <- 2
    assign Instructions[9] = 32'b00000000000000000000000000000000;   //nop
    assign Instructions[10] = 32'b00000000000000000000000000000000;  //nop
    assign Instructions[11] = 32'b00110000110000110000000000000000;  //x3 <- 3
    assign Instructions[12] = 32'b00000000000000000000000000000000;   //nop
    assign Instructions[13] = 32'b00000000000000000000000000000000;  //nop
    assign Instructions[14] = 32'b00110001000001000000000000000000;  //x4 <- 4*/
    assign Instructions[0] = 32'b00000000000000000000000000000000;  //nop

    assign Instructions[1] = 32'b11110000000000000001110000000000;   //SVPC x0 <- PC + 7 x0 = 8
    assign Instructions[2] = 32'b00000000000000000000000000000000;  //nop
    assign Instructions[3] = 32'b00000000000000000000000000000000;  //nop
    assign Instructions[4] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[5] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[6] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[7] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[8] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[9] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[10] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[11] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[12] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[13] = 32'b00000000000000000000000000000000; //nop

    /*assign Instructions[22] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[23] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[24] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[25] = 32'b10010000000000000000000000000000; //branch
    assign Instructions[26] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[27] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[28] = 32'b01000000000001000000110000000000; //x0 <- x1 + x4
    assign Instructions[29] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[30] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[31] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[32] = 32'b01010000000000100001110000000000; //x0 <- x3 + 7
    assign Instructions[33] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[34] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[35] = 32'b00000000000000000000000000000000; //nop
    assign Instructions[35] = 32'b01100000000000010000000000000000; //x0 <- -x1*/

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
