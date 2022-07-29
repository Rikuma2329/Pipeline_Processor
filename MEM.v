`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 17:10:19
// Design Name: 
// Module Name: MEM
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


module MEM(clk, rst, MEM_MemtoReg_in, MEM_RegWrite_in, MEM_MemRead, MEM_MemWrite, alu_result, write_data, write_reg_to_mem, 
           MEM_MemtoReg_out, EX_MEM_RegWrite, read_data, alu_result_out, write_reg_from_mem);
    input clk, rst, MEM_MemtoReg_in, MEM_RegWrite_in, MEM_MemRead, MEM_MemWrite;
    input [31:0] alu_result, write_data;
    input [4:0] write_reg_to_mem;
    output MEM_MemtoReg_out, EX_MEM_RegWrite;
    output [31:0] read_data, alu_result_out;
    output [4:0] write_reg_from_mem;
    
    assign MEM_MemtoReg_out = MEM_MemtoReg_in;
    assign EX_MEM_RegWrite = MEM_RegWrite_in;
    assign alu_result_out = alu_result;
    assign write_reg_from_mem = write_reg_to_mem;
    
    DATA_MEM data_mem(clk, rst, alu_result, write_data, read_data, MEM_MemWrite, MEM_MemRead);
    
endmodule
