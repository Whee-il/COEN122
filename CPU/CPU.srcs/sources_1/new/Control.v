`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2022 03:52:52 PM
// Design Name: 
// Module Name: Control
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


module Control(
        Inst, DataWrt, DataRead, MemToReg, RegWrt, JumpMem, Jump, BZN, Branch, SavePC, clk
    );
    
    input [3:0] Inst;
    input clk;
    
    output reg DataWrt, DataRead, MemToReg, RegWrt, JumpMem, Jump, BZN, Branch, SavePC;
        
    always@(posedge clk) begin
        if(Inst == 4'b0000) begin //NoOp
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 0;
            JumpMem = 0;
            Jump = 0;
            BZN = 0;
            Branch = 0;
            SavePC = 0;
        end
        if(Inst == 4'b1111) begin //Save PC
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 1;
            JumpMem = 0;
            Jump = 0;
            BZN = 0;
            Branch = 0;
            SavePC = 1;
        end
        if(Inst == 4'b1110) begin //Load
            DataWrt = 0;
            DataRead = 1;
            MemToReg = 1;
            RegWrt = 1;
            JumpMem = 0;
            Jump = 0;
            BZN = 0;
            Branch = 0;
            SavePC = 0;
        end
        if(Inst == 4'b0011) begin //Store
            DataWrt = 1;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 0;
            JumpMem = 0;
            Jump = 0;
            BZN = 0;
            Branch = 0;
            SavePC = 0;
        end
        if(Inst == 4'b0100) begin //Add
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 1;
            JumpMem = 0;
            Jump = 0;
            BZN = 0;
            Branch = 0;
            SavePC = 0;
        end
        if(Inst == 4'b0000) begin //Increment
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 1;
            JumpMem = 0;
            Jump = 0;
            BZN = 0;
            Branch = 0;
            SavePC = 0;
        end
        if(Inst == 4'b0110) begin //Negate
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 1;
            JumpMem = 0;
            Jump = 0;
            BZN = 0;
            Branch = 0;
            SavePC = 0;
        end
        if(Inst == 4'b0111) begin //Subtract
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 1;
            JumpMem = 0;
            Jump = 0;
            BZN = 0;
            Branch = 0;
            SavePC = 0;
        end
        if(Inst == 4'b1000) begin //Jump
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 0;
            JumpMem = 0;
            Jump = 1;
            BZN = 0;
            Branch = 0;
            SavePC = 0;
        end
        if(Inst == 4'b1001) begin //Branch If Zero
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 0;
            JumpMem = 0;
            Jump = 0;
            BZN = 0;
            Branch = 1;
            SavePC = 0;
        end
        if(Inst == 4'b1010) begin //Jump Memory
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 0;
            JumpMem = 1;
            Jump = 1;
            BZN = 0;
            Branch = 0;
            SavePC = 0;
        end
        if(Inst == 4'b1011) begin //Branch if Negative
            DataWrt = 0;
            DataRead = 0;
            MemToReg = 0;
            RegWrt = 0;
            JumpMem = 0;
            Jump = 0;
            BZN = 1;
            Branch = 1;
            SavePC = 0;
        end
    end       
endmodule
