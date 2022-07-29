`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 15:17:02
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(clk, rst, ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_ALUOp1, ID_ALUOp0, EX_RegDst, EX_ALUSrc, EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_ALUOp1, EX_ALUOp0, 
             read_data1_from_id, read_data2_from_id, extension_add_from_id, w_reg_op1_in, w_reg_op2_in, reg_rs_in, read_data1_to_ex, read_data2_to_ex, extension_add_to_ex, w_reg_op1_out, w_reg_op2_out, Rs);
    input clk, rst;
    input ID_RegDst, ID_ALUSrc, ID_MemtoReg, ID_RegWrite, ID_MemRead, ID_MemWrite, ID_ALUOp1, ID_ALUOp0;
    input [31:0] read_data1_from_id, read_data2_from_id;
    input [31:0] extension_add_from_id;
    input [4:0] w_reg_op1_in, w_reg_op2_in, reg_rs_in;
    output reg [31:0] read_data1_to_ex, read_data2_to_ex;
    output reg [31:0] extension_add_to_ex;
    output reg [4:0] w_reg_op1_out, w_reg_op2_out, Rs;
    output reg EX_RegDst, EX_ALUSrc, EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite, EX_ALUOp1, EX_ALUOp0;
    
    always @(posedge clk) begin
        if(rst == 1'b0) begin
            read_data1_to_ex <= 32'b0;
            read_data2_to_ex <= 32'b0;
            extension_add_to_ex <= 32'b0;
            w_reg_op1_out <= 5'b0;
            w_reg_op2_out <= 5'b0;
            Rs <= 5'b0;
            EX_RegDst <= 1'b0; 
            EX_ALUSrc <= 1'b0;
            EX_MemtoReg <= 1'b0; 
            EX_RegWrite <= 1'b0;
            EX_MemRead <= 1'b0; 
            EX_MemWrite <= 1'b0;
            EX_ALUOp1 <= 1'b0;
            EX_ALUOp0 <= 1'b0;
        end else begin
            read_data1_to_ex <= read_data1_from_id;
            read_data2_to_ex <= read_data2_from_id;
            extension_add_to_ex <= extension_add_from_id;
            w_reg_op1_out <= w_reg_op1_in;
            w_reg_op2_out <= w_reg_op2_in;
            Rs <= reg_rs_in;
            EX_RegDst <= ID_RegDst; 
            EX_ALUSrc <= ID_ALUSrc;
            EX_MemtoReg <= ID_MemtoReg; 
            EX_RegWrite <= ID_RegWrite;
            EX_MemRead <= ID_MemRead; 
            EX_MemWrite <= ID_MemWrite;
            EX_ALUOp1 <= ID_ALUOp1;
            EX_ALUOp0 <= ID_ALUOp0;
        end
	end

endmodule
