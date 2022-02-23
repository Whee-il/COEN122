`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 02:27:03 PM
// Design Name: 
// Module Name: Buffer_TB
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


module Buffer_TB();
    reg clk;

    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end 
    
    reg [7:0] PC_IN;
    reg [31:0] IM_IN;
    wire [7:0] PC_OUT;
    wire [31:0] IM_OUT;

    IF_ID test_buffer(PC_IN, IM_IN, PC_OUT, IM_OUT, clk);
    
    initial
    begin
        PC_IN = 8'b00001111;
        IM_IN = 8'b00001010;
        #50
        
        PC_IN = 8'b11110000;
        IM_IN = 8'b10100000;
        #50
    
    
    $finish;
    end
    

endmodule
