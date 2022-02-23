`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2022 02:41:52 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    clk, address, write, read_data, write_data
    );
    
    input clk, write;
    input [31:0] address;
    input [31:0] write_data;
    output reg [31:0] read_data;
    
    reg [31:0] Data[65535:0];
    
    always@(posedge clk) begin
    
        if(write == 1)
            Data[address[15:0]] = write_data;
        read_data = Data[address[15:0]];
    end
endmodule
