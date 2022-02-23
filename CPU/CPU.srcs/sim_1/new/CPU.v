`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2022 02:56:00 PM
// Design Name: 
// Module Name: CPU
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


module CPU();
    reg clk;

    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end
   
    //IF STAGE
    wire [7:0] IF_PC;
    wire IF_PC_4;
    
    Ripple_Carry PC_adder(IF_PC,3'b100, IF_PC_4, _);
    
    wire [31:0] IF_inst;
    Instruction_Memory instruction_memory(clk, IF_PC, IF_inst);
    
    //ID STAGE
    wire [7:0] ID_PC;
    wire ID_PC_4;
    wire [31:0] ID_inst;

    IF_ID buff_if_id(IF_PC, IF_PC_4, IF_inst, ID_PC, ID_PC_4, ID_inst, clk);
    
    //Control Wires
    wire ID_DataWrt, ID_DataRead, ID_MemToReg, ID_RegWrt, ID_JumpMem, ID_Jump, ID_BZN, ID_Branch, ID_SavePC;
    wire EX_MEM_DataWrt, EX_MEM_DataRead, EX_MEM_MemToReg, EX_MEM_RegWrt, EX_MEM_JumpMem, EX_MEM_Jump, EX_MEM_BZN, EX_MEM_Branch, EX_MEM_SavePC;
    wire WB_MemToReg, WB_RegWrt, WB_JumpMem, WB_Jump, WB_Branch;

    Control control(ID_inst, ID_DataWrt, ID_DataRead, ID_MemToReg, ID_RegWrt, ID_JumpMem, ID_Jump, ID_BZN, ID_Branch, ID_SavePC, clk);
    
    wire [32:0] ID_rs, ID_rt;
    wire [5:0] WB_WriteAddr;
    wire [31:0] WB_WriteData;

    Registers registers(clk, ID_inst[21:16], ID_rs, ID_inst[15:10], ID_rt, WB_WriteAddr, WB_WriteData, ID_RegWrt);
    
    
    wire [3:0] EXMEM_ALUOP;
    //ALUControl goes here
    
    //EX MEM STAGE
    wire [7:0] EXMEM_PC;
    wire EXMEM_PC_4;
    wire [32:0] EXMEM_rs, EXMEM_rt;
    wire [5:0] EXMEM_rd;
    wire [11:0] EXMEM_Const;
    
    ID_EXMEM buff_id_exmem(ID_PC, ID_PC_4, ID_rs, ID_rt, ID_inst[21:10], ID_inst[27:22], ID_ALUOP, ID_DataWrt, ID_DataRead, ID_MemToReg, ID_RegWrt, ID_JumpMem, ID_Jump, ID_BZN, ID_Branch, ID_SavePC,
                           EXMEM_PC, EXMEM_PC_4, EXMEM_rs, EXMEM_rt, EXMEM_Const, EXMEM_rd, EXMEM_ALUOP, EX_MEM_DataWrt, EX_MEM_DataRead, EX_MEM_MemToReg, EX_MEM_RegWrt, EX_MEM_JumpMem, EX_MEM_Jump, EX_MEM_BZN, EX_MEM_Branch, EX_MEM_SavePC);

    
    wire [31:0] EXMEM_DataMem_Data;
    Data_Memory dataMemory(clk, EXMEM_rs, EX_MEM_DataWrt, EX_MEM_DataRead, EXMEM_DataMem_Data, EXMEM_rt);
    
    
    
endmodule
