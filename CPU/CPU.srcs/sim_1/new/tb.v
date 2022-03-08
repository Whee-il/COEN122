`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2022 03:24:35 PM
// Design Name: 
// Module Name: tb
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


module tb();


PC pc(PC_in, out, clk);

reg [7:0] PC_in;
reg clk;
wire [7:0] PC_out;

Registers regs(clk, rs_a, rs,rt_a, rt, rd_a, rd, write);
reg clk, write;
reg [5:0] rs_a, rt_a, rd_a;
reg[31:0] rd;
wire [31:0] rs, rt;

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    PC_in = 8'b0;
    
    #10
    
    PC_in = 8'b1;

end

initial
begin

    //test write operation
    write = 1;
    rd_a = 6'b0;
    rd = 32'b0111;
    
    #10
    
    rd_a = 6'b1;
    rd = 32'b1001;
    
    #10
    
    //test that write flag is needed for write to occur
    write = 0;
    rd_a = 6'b1;
    rd = 32'b100;
    
    #10
    
    //testing read operation
    rs_a = 6'b0;
    rt_a = 6'b1;
    
end    
endmodule
