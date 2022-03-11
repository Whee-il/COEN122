`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 03:20:15 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(Inst,opcode,clk);

    input [3:0] Inst;
    input clk;
    output reg [3:0] opcode;
    

    always @(posedge clk) begin
        begin
        if(Inst == 4'b0100) begin //Add
            opcode = 4'b0000;
        end
        else if(Inst == 4'b0101) begin //Increment
            opcode = 4'b0001;
        end
        else if(Inst == 4'b0110) begin //Negate
            opcode = 4'b0010;
        end
        else if(Inst == 4'b0111) begin //Subtract
            opcode = 4'b0011;
        end
        else if(Inst == 4'b1001) begin //Branch If Zero
            opcode = 4'b0011;
        end
        else opcode = 4'b0100;
        end
        end
endmodule
