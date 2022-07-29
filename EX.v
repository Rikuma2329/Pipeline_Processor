`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 17:10:07
// Design Name: 
// Module Name: EX
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


module EX(EX_RegDst, EX_ALUSrc, EX_MemtoReg_in, EX_RegWrite_in, EX_MemRead_in, EX_MemWrite_in, EX_ALUOp1, EX_ALUOp0, EX_Flush, read_data1, read_data2, extension_add, w_reg_op1, w_reg_op2, Rs, EX_MEM_data, MEM_WB_data,
          EX_MEM_RegWrite, MEM_WB_RegWrite, EX_MEM_RegisterRd, MEM_WB_RegisterRd, EX_MemtoReg_out, EX_RegWrite_out, EX_MemRead_out, EX_MemWrite_out, alu_result, write_data, write_reg);
    input EX_RegDst, EX_ALUSrc, EX_MemtoReg_in, EX_RegWrite_in, EX_MemRead_in, EX_MemWrite_in, EX_ALUOp1, EX_ALUOp0, EX_Flush;
    input EX_MEM_RegWrite, MEM_WB_RegWrite;
    input [31:0] read_data1, read_data2, extension_add;
    input [31:0] EX_MEM_data, MEM_WB_data;
    input [4:0] w_reg_op1, w_reg_op2, Rs, EX_MEM_RegisterRd, MEM_WB_RegisterRd;
    output EX_MemtoReg_out, EX_RegWrite_out, EX_MemRead_out, EX_MemWrite_out;
    output [31:0] alu_result, write_data;
    output [4:0] write_reg;
    wire [31:0] alu_in_a, alu_in_b, mux_out;
    wire [3:0] ALUCtl;
    wire [1:0] ALUOp;
    wire [1:0] ForwardA, ForwardB;
    wire ovf, zero;
    
    assign ALUOp = {EX_ALUOp1, EX_ALUOp0};
    assign EX_MemtoReg_out = (EX_Flush)? 0 : EX_MemtoReg_in;
    assign EX_RegWrite_out = (EX_Flush)? 0 : EX_RegWrite_in;
    assign EX_MemRead_out = (EX_Flush)? 0 : EX_MemRead_in;
    assign EX_MemWrite_out = (EX_Flush)? 0 : EX_MemWrite_in;
    assign write_reg = (EX_RegDst)? w_reg_op2 : w_reg_op1;
    

    FORWARDING_UNIT forwarding_unit(EX_MEM_RegWrite, MEM_WB_RegWrite, Rs, w_reg_op1, EX_MEM_RegisterRd, MEM_WB_RegisterRd, ForwardA, ForwardB);
    ALU_CONTROL_UNIT alu_control_unit(ALUOp, extension_add[5:0], ALUCtl);
    FORWARDING_MUX forwarding_mux1(read_data1, EX_MEM_data, MEM_WB_data, ForwardA, alu_in_a);
    FORWARDING_MUX forwarding_mux2(read_data2, EX_MEM_data, MEM_WB_data, ForwardB, mux_out);
    
    assign alu_in_b = (EX_ALUSrc)? extension_add : mux_out;
    assign write_data = mux_out;
        
    ALU32 alu32(alu_in_a, alu_in_b, ALUCtl, alu_result, ovf, zero);
    
endmodule
