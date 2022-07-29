`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/11 00:27:27
// Design Name: 
// Module Name: PIPELINE
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


module PIPELINE(clk, rst, Jump);
    input clk, rst;
    output Jump;
    wire PCSrc, PCWrite;
    wire [31:0] branch_add, jump_add, pc_add_out, r_data;
    
    wire IF_ID_Write, IF_Flush, EX_Flush;
    wire [31:0] IF_ID_pc, inst;
    
    wire MEM_WB_RegWrite, ID_EX_MemRead;
    wire [4:0] MEM_WB_RegisterRd, ID_EX_RegisterRt;
    wire [31:0] MEM_WB_data, ID_read_data1, ID_read_data2, ID_extension_add;
    wire [4:0] IF_ID_RegisterRt, IF_ID_RegisterRd, IF_ID_RegisterRs;
    wire ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_ALUOp1, ID_ALUOp0;
    
    wire ID_EX_RegDst, ID_EX_ALUSrc, ID_EX_MemtoReg, ID_EX_RegWrite, ID_EX_MemWrite, ID_EX_ALUOp1, ID_EX_ALUOp0;
    wire [31:0] ID_EX_read_data1, ID_EX_read_data2, ID_EX_extension_add;
    wire [4:0] ID_EX_RegisterRd, ID_EX_RegisterRs;
    
    wire [31:0] EX_MEM_data;
    wire [4:0] EX_MEM_RegisterRd;
    wire EX_MEM_RegWrite;
    wire EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite;
    wire [31:0] EX_alu_result, EX_write_data;
    wire [4:0] EX_write_reg;
    
    wire EX_MEM_MemtoReg, EX_MEM_MemRead, EX_MEM_MemWrite;
    wire [31:0] EX_MEM_alu_result, EX_MEM_write_data;
    wire [4:0] EX_MEM_write_reg;
    
    wire MEM_MemtoReg, MEM_RegWrite;
    wire [31:0] MEM_read_data;
    
    wire [31:0] MEM_WB_read_data, MEM_WB_aluresult;
    wire [4:0] write_reg;
    wire MEM_WB_MemtoReg;
    
    wire WB_RegWrite;
    
    IF if_stage(clk, rst, PCSrc, Jump, PCWrite, branch_add, jump_add, pc_add_out, r_data);
    
    IF_ID if_id_reg(clk, rst, IF_ID_Write, IF_Flush, pc_add_out, r_data, IF_ID_pc, inst);
    
    ID id_stage(clk, rst, WB_RegWrite, EX_MemRead, inst, IF_ID_pc, jump_add, MEM_WB_RegisterRd, ID_EX_RegisterRt, MEM_WB_data, 
                ID_read_data1, ID_read_data2, ID_extension_add, branch_add, IF_ID_RegisterRt, IF_ID_RegisterRd, IF_ID_RegisterRs, Jump, ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_ALUOp1, ID_ALUOp0, PCWrite, IF_ID_Write, IF_Flush, EX_Flush, PCSrc);
                
    ID_EX id_ex_reg(clk, rst, ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_ALUOp1, ID_ALUOp0, ID_EX_RegDst, ID_EX_ALUSrc, ID_EX_MemtoReg, ID_EX_RegWrite, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_ALUOp1, ID_EX_ALUOp0, 
                    ID_read_data1, ID_read_data2, ID_extension_add, IF_ID_RegisterRt, IF_ID_RegisterRd, IF_ID_RegisterRs, ID_EX_read_data1, ID_EX_read_data2, ID_EX_extension_add, ID_EX_RegisterRt, ID_EX_RegisterRd, ID_EX_RegisterRs);
                    
    EX ex_stage(ID_EX_RegDst, ID_EX_ALUSrc, ID_EX_MemtoReg, ID_EX_RegWrite, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_ALUOp1, ID_EX_ALUOp0, EX_Flush, ID_EX_read_data1, ID_EX_read_data2, ID_EX_extension_add, ID_EX_RegisterRt, ID_EX_RegisterRd, ID_EX_RegisterRs, EX_MEM_data, MEM_WB_data,
                MEM_RegWrite, WB_RegWrite, EX_MEM_RegisterRd, MEM_WB_RegisterRd, EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_alu_result, EX_write_data, EX_write_reg);
                
    EX_MEM ex_mem_reg(clk, rst, EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_alu_result, EX_write_data, EX_write_reg, 
                      EX_MEM_MemtoReg, EX_MEM_RegWrite, EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_alu_result, EX_MEM_write_data, EX_MEM_write_reg);
                      
    MEM mem_stage(clk, rst, EX_MEM_MemtoReg, EX_MEM_RegWrite, EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_alu_result, EX_MEM_write_data, EX_MEM_write_reg, 
                  MEM_MemtoReg, MEM_RegWrite, MEM_read_data, EX_MEM_data, EX_MEM_RegisterRd);
    
    MEM_WB mem_wb_reg(clk, rst, MEM_MemtoReg, MEM_RegWrite, MEM_read_data, EX_MEM_data, EX_MEM_RegisterRd, MEM_WB_read_data, MEM_WB_aluresult, write_reg, MEM_WB_MemtoReg, MEM_WB_RegWrite);
    
    WB wb_stage(MEM_WB_MemtoReg, MEM_WB_RegWrite, MEM_WB_read_data, MEM_WB_aluresult, write_reg, MEM_WB_data, MEM_WB_RegisterRd, WB_RegWrite);
    
    
endmodule
