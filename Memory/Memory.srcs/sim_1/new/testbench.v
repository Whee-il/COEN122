`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2022 02:42:27 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk;

    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
       end


    reg [7:0] PC;
    wire [31:0] inst;
    Instruction_Memory instruction_test(clk, PC, inst);
    
    reg Reg_write;
    reg [5:0] RS_Addr, RT_Addr, RD_Addr;
    reg [31:0] RD;
    wire [31:0] RS, RT;
    Registers reg_test(clk, RS_Addr, RS, RT_Addr, RT, RD_Addr, RD, Reg_write);
    
    reg Data_write;
    reg [31:0] Data_address;
    wire [31:0] Data_read;
    reg [31:0] Data_data_write;
    
    Data_Memory data_test(clk, Data_address, Data_write, Data_read, Data_data_write);
    
    initial
    begin
        //Instruction Memory Test
        PC = 0;
        #50
        PC = 1;
        #50
        
        // Register Memory Test
        //Write values to the registers
        Reg_write = 1;
        RD_Addr = 1;
        RD = 4'b1000;
        #50
        RD_Addr = 2;
        RD = 4'b1001;
        #50
        Reg_write = 0;
        RS_Addr = 1;
        RT_Addr = 2;
        #50
        
        // Data Memory Test
        Data_write = 1;
        Data_address = 1;
        Data_data_write = 5;
        #50
        Data_address = 2;
        Data_data_write = 7;
        #50
        
        Data_write = 0;
        Data_address =1;
        #50
        
        Data_address = 2;
        #50
    
    $finish;
    end
endmodule
