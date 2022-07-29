`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 17:09:53
// Design Name: 
// Module Name: ID
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


module ID(clk, rst, MEM_WB_RegWrite, ID_EX_MemRead, inst, pc_to_id, jump_add, write_reg, ID_EX_RegisterRt, write_data, read_data1, read_data2, extension_add, branch_add, w_reg_op1, w_reg_op2, reg_rs, Jump, RegDst, ALUSrc, MemtoReg, RegWrite_out, MemRead, MemWrite, ALUOp1, ALUOp0, PCWrite, IF_ID_Write, IF_Flush, EX_Flush, PCSrc);
    input clk, rst, MEM_WB_RegWrite, ID_EX_MemRead;
    input [31:0] inst, pc_to_id;
    input [31:0] write_data;
    input [4:0] write_reg, ID_EX_RegisterRt;
    output [31:0] jump_add;
    output [31:0] read_data1, read_data2;
    output [31:0] extension_add, branch_add;
    output [4:0] w_reg_op1, w_reg_op2, reg_rs;
    output Jump, RegDst, ALUSrc, MemtoReg, RegWrite_out, MemRead, MemWrite, ALUOp1, ALUOp0, PCWrite, IF_ID_Write, IF_Flush, EX_Flush, PCSrc;
    wire Mux_op, zero, Branch, ID_Flush;
    wire [31:0] shift_add;
    
    assign jump_add = {pc_to_id[31:28], inst[25:0], 2'b00};
    assign reg_rs = inst[25:21];
    assign w_reg_op1 = inst[20:16];
    assign w_reg_op2 = inst[15:11];
    
    REGISTER register(clk, rst, MEM_WB_RegWrite, inst, write_reg, write_data, read_data1, read_data2);
    
    assign zero = (&(read_data1 ~^ read_data2))? 1'b1 : 1'b0;
    
    HAZARD_DETECTION_UNIT hazard_detection_unit(reg_rs, w_reg_op1, ID_EX_RegisterRt, ID_EX_MemRead, PCWrite, IF_ID_Write, Mux_op);
    CONTROL_UNIT control_unit(inst[31:26], Mux_op, ID_Flush, read_data1, read_data2, Jump, RegDst, ALUSrc, MemtoReg, RegWrite_out, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);
    SIGN_EXTENSION sign_extension(inst[15:0], extension_add);
    BIT_SIFT bit_sift(extension_add, shift_add);
    ADDER adder(pc_to_id, shift_add, branch_add);
    
    assign PCSrc = zero & Branch;
    assign IF_Flush = PCSrc | Jump;
    assign ID_Flush = PCSrc;
    assign EX_Flush = PCSrc;
    
endmodule
