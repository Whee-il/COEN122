`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2022 02:43:38 PM
// Design Name: 
// Module Name: tb_mux
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


module tb_mux();
reg A, B, C, D;
reg [1:0] sel;

wire out;

mux test1(A, B, C, D, sel, out);

initial
begin
    A = 1;
    B = 0;
    C = 1;
    D = 0;
    //Out should be A
    sel = 2'b00;
    #50
    //Out should be B
    sel = 2'b01;
    #50    
    //Out should be C
    sel = 2'b10;
    #50    
    //Out should be D
    sel = 2'b11;
    #50
    $finish;
end
endmodule
