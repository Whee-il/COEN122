`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 01:47:47 PM
// Design Name: 
// Module Name: Sign_Extender
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


module Sign_Extender(clk, Const_IN, Const_OUT);
    input clk;
    input [5:0] Const_IN;
    output reg [31:0] Const_OUT;
    
    always@(posedge clk) begin
        if(Const_IN[5] == 1'b1)
            Const_OUT[31:6] = 26'b1;
        if(Const_IN[5] == 1'b0)
            Const_OUT[31:6] = 26'b0;
        
        Const_OUT[5:0] = Const_IN;
    end


endmodule
