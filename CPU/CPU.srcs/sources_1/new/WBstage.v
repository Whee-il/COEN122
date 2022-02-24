`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 05:32:30 PM
// Design Name: 
// Module Name: WBstage
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


module WBstage(PC, rsdata,dataRead, sum, flag, memToReg, Branch, JumpMem, Jump, writeData, newPC, clk);

    input [31:0] dataRead, sum, PC, rsdata;
    input clk, memToReg, Branch, flag, JumpMem, Jump;
    output [31:0] writeData, newPC;
    wire branchsel;
    wire branchwire, jumpwire;
    
    and(branchsel, Branch, flag);
    
    always @(posedge clk) begin
        mux(dataRead,sum,memToReg,writeData,clk);
        mux(PC,rsdata,branchsel,branchwire,clk);
        mux(rsdata,dataRead,JumpMem,jumpwire,clk);
        mux(branchwire,jumpwire,Jump,newPC,clk);
    end
endmodule
