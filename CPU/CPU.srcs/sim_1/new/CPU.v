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
    reg [7:0] WB_PC;
    
    wire IF_PC_1;
    
    PC pc(WB_PC, IF_PC, clk);
    
    Ripple_Carry PC_adder(IF_PC,3'b001, IF_PC_1, _);
    
    wire [31:0] IF_inst;
    Instruction_Memory instruction_memory(clk, IF_PC, IF_inst);
    
    //ID STAGE
    wire [31:0] ID_inst;

    IF_ID buff_if_id(IF_PC, IF_inst, ID_PC, ID_inst, clk);
    
    //Control Wires
    wire ID_DataWrt, ID_DataRead, ID_MemToReg, ID_RegWrt, ID_JumpMem, ID_Jump, ID_BZN, ID_Branch, ID_SavePC;
    wire EX_MEM_DataWrt, EX_MEM_DataRead, EX_MEM_MemToReg, EX_MEM_RegWrt, EX_MEM_JumpMem, EX_MEM_Jump, EX_MEM_BZN, EX_MEM_Branch, EX_MEM_SavePC;
    wire WB_MemToReg, WB_RegWrt, WB_JumpMem, WB_Jump, WB_Branch;

    Control control(ID_inst, ID_DataWrt, ID_DataRead, ID_MemToReg, ID_RegWrt, ID_JumpMem, ID_Jump, ID_BZN, ID_Branch, ID_SavePC, clk);
    
    wire [32:0] ID_rs, ID_rt;
    wire [5:0] WB_WriteAddr;
    wire [31:0] WB_WriteData;

    Registers registers(clk, ID_inst[21:16], ID_rs, ID_inst[15:10], ID_rt, WB_WriteAddr, WB_WriteData, ID_RegWrt);
    
    ALUcontrol alucontrol(ID_inst[31:28], ID_ALUOP, clk);
    //EX MEM STAGE
    wire [7:0] EXMEM_PC;
    wire [31:0] EXMEM_rs, EXMEM_rt;
    wire [5:0] EXMEM_rd;
    wire [11:0] EXMEM_Const;
    wire [3:0] EXMEM_ALUOP;

    ID_EXMEM buff_id_exmem(ID_PC, ID_rs, ID_rt, ID_inst[21:10], ID_inst[27:22], ID_ALUOP, ID_DataWrt, ID_DataRead, ID_MemToReg, ID_RegWrt, ID_JumpMem, ID_Jump, ID_BZN, ID_Branch, ID_SavePC,
                           EXMEM_PC, EXMEM_rs, EXMEM_rt, EXMEM_Const, EXMEM_rd, EXMEM_ALUOP, EX_MEM_DataWrt, EX_MEM_DataRead, EX_MEM_MemToReg, EX_MEM_RegWrt, EX_MEM_JumpMem, EX_MEM_Jump, EX_MEM_BZN, EX_MEM_Branch, EX_MEM_SavePC);

    wire [31:0] EXMEM_DataMem_Data;
    Data_Memory dataMemory(clk, EXMEM_rs, EX_MEM_DataWrt, EX_MEM_DataRead, EXMEM_DataMem_Data, EXMEM_rt);
    
    wire [11:0] EXMEM_Const_Extended;

    Sign_Extender signextend(clk, EXMEM_Const, EXMEM_Const_Extended);
    
    wire [31:0] EXMEM_ALU_IN_1, EXMEM_ALU_IN_2;
    
    Mux ALU_IN_1_MUX(EXMEM_rs, EXMEM_PC, EX_MEM_SavePC, EXMEM_ALU_IN_1);
    Mux ALU_IN_2_MUX(EXMEM_rs, EXMEM_PC, EX_MEM_SavePC, EXMEM_ALU_IN_2);
    
    
    wire [31:0] EXMEM_ALU_SUM;
    wire EXMEM_ALU_Z, EXMEM_ALU_N;
    ALU alu(EXMEM_ALUOP, EXMEM_ALU_IN_1,EXMEM_ALU_IN_2,EXMEM_ALU_SUM, EXMEM_ALU_Z,EXMEM_ALU_N);
    
    wire EXMEM_BranchBZ_Flag;
    Mux BranchBZ_MUX(EXMEM_ALU_Z, EXMEM_ALU_N, EX_MEM_BZN, EXMEM_BranchBZ_Flag);
    
    // WRITE BACK STAGE    
    wire [31:0] WB_DataMem_Data;
    wire [31:0] WB_ALU_SUM, WB_rs;
    wire WB_BranchBZ_Flag;
    //wire [5:0] WB_rd; WB_WriteAddr

    EXMEM_WB buff_exmem_wb(EXMEM_DataMem_Data, EXMEM_ALU_SUM,EXMEM_rs, EXMEM_BranchBZ_Flag, EXMEM_rd, EX_MEM_MemToReg, EX_MEM_RegWrt, EX_MEM_JumpMem, EX_MEM_Jump, EX_MEM_Branch, 
                            WB_DataMem_Data, WB_ALU_SUM,WB_rs, WB_BranchBZ_Flag, WB_WriteAddr,WB_MemToReg, WB_RegWrt, WB_JumpMem, WB_Jump, WB_Branch,clk);
    
    wire WB_branchsel;
    
    and(WB_branchsel, EXMEM_BranchBZ_Flag, WB_Branch);
      
    wire [31:0] WB_PC_BRANCH, WB_JUMP_JUMPM;
    
    Mux write_back_mux(WB_DataMem_Data,WB_ALU_SUM,WB_MemToReg,WB_WriteData);
    Mux pc_branch_mux(IF_PC,WB_rs,WB_branchsel,WB_PC_BRANCH);
    Mux jump_jumpm_mux(WB_rs,WB_DataMem_Data,WB_JumpMem,WB_JUMP_JUMPM);
    Mux pc_jump_mux(WB_PC_BRANCH,WB_JUMP_JUMPM,WB_Jump,WB_PC);
    
    initial
    begin
        #20;
    $finish;
    end
    
    
endmodule
