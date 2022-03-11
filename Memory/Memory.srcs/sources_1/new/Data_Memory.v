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
    clk, address, write, read, read_data, write_data
    );
    
    input clk, write, read;
    input [31:0] address;
    input [31:0] write_data;
    output reg [31:0] read_data;
    
    reg [31:0] Data[65535:0];
    
    initial begin
        Data[0] = 10;
        Data[1] = 10;
        Data[2] = 10;
        Data[3] = 10;
        Data[4] = 10;
        Data[5] = 10;
    end
    
    always@(posedge clk) begin
    
        if(write == 1)
            Data[address[15:0]] = write_data;
        if(read == 1)
            read_data = Data[address[15:0]];
    end
endmodule
