`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 02:26:08 PM
// Design Name: 
// Module Name: ID_EXMEM
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


module ID_EXMEM(
    PC_IN, PC_4_IN, RS_IN, RT_IN, Const_IN,WriteAddr_IN, ALU_OP_IN, DataWrt_IN, DataRead_IN, MemToReg_IN, RegWrt_IN, JumpMem_IN, Jump_IN, BZN_IN, Branch_IN, SavePC_IN, 
    PC_OUT, PC_4_OUT, RS_OUT, RT_OUT, Const_OUT,WriteAddr_OUT, ALU_OP_OUT,  DataWrt_OUT, DataRead_OUT, MemToReg_OUT, RegWrt_OUT, JumpMem_OUT, Jump_OUT, BZN_OUT, Branch_OUT, SavePC_OUT, clk
    );
    input clk;
    
    input [7:0] PC_IN, PC_4_IN;
    input [31:0] RS_IN, RT_IN;
    
    input [5:0] WriteAddr_IN;
    input [3:0] ALU_OP_IN;
    
    input [11:0] Const_IN;
    
    input DataWrt_IN, DataRead_IN, MemToReg_IN, RegWrt_IN, JumpMem_IN, Jump_IN, BZN_IN, Branch_IN, SavePC_IN;
    // -------------------------------------------------------------    
    
    output reg [7:0] PC_OUT, PC_4_OUT;
    output reg [31:0] RS_OUT, RT_OUT;
    
    output reg [5:0] WriteAddr_OUT;
    output reg [3:0] ALU_OP_OUT;
    
    output reg [11:0] Const_OUT;

    output reg DataWrt_OUT, DataRead_OUT, MemToReg_OUT, RegWrt_OUT, JumpMem_OUT, Jump_OUT, BZN_OUT, Branch_OUT, SavePC_OUT;
        
    always@(posedge clk)
    begin
        PC_OUT = PC_IN;
        RS_OUT = RS_IN;
        RT_OUT = RT_IN;
        DataWrt_OUT = DataWrt_IN;
        DataRead_OUT = DataRead_IN;
        MemToReg_OUT  = MemToReg_IN;
        RegWrt_OUT  = RegWrt_IN; 
        JumpMem_OUT  = JumpMem_IN;
        Jump_OUT = Jump_IN;
        BZN_OUT = BZN_IN;
        Branch_OUT = Branch_IN;
        SavePC_OUT = SavePC_IN;
    end

endmodule
