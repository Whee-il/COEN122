`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2022 02:41:52 PM
// Design Name: 
// Module Name: Registers
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


module Registers(clk, rs_a, rs,rt_a, rt, rd_a, rd, write);
    input clk, write;
    input [5:0] rs_a, rt_a, rd_a;
    input [31:0] rd;
    output reg [31:0] rs, rt;
    
    reg [31:0] Registers[63:0];
    
    initial begin
        Registers[0] = 0;
        Registers[1] = 0;
        Registers[2] = 0;
        Registers[3] = 0;
        Registers[4] = 0;
        Registers[5] = 0;
        Registers[6] = 0;
        Registers[7] = 0;
        Registers[8] = 0;
        Registers[9] = 0;
    end
    
    always@(posedge clk) begin
        rs = Registers[rs_a]; //Update Rs to the given address
        rt = Registers[rt_a]; //Update Rt to the given address
    end
    always@(negedge clk) begin
        if(write == 1)        //If the write line is on
            Registers[rd_a] = rd; //write the given value to the specified register
    end
    

endmodule
