`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 15:17:22
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(clk, rst, EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite, alu_result_from_ex, write_data_from_ex, write_reg_from_ex, 
              MEM_MemtoReg, MEM_RegWrite, MEM_MemRead, MEM_MemWrite, alu_result_to_mem, write_data_to_mem, write_reg_to_mem);
    input clk, rst;
    input EX_MemtoReg, EX_RegWrite, EX_MemRead, EX_MemWrite;
    input [31:0] alu_result_from_ex, write_data_from_ex;
    input [4:0] write_reg_from_ex;
    output reg [31:0] alu_result_to_mem, write_data_to_mem;
    output reg [4:0] write_reg_to_mem;
    output reg MEM_MemtoReg, MEM_RegWrite, MEM_MemRead, MEM_MemWrite;
    
    always @(posedge clk) begin
        if(rst == 1'b0) begin
            alu_result_to_mem <= 32'b0;
            write_data_to_mem <= 32'b0;
            write_reg_to_mem <= 5'b0;
            MEM_MemtoReg <= 1'b0;
            MEM_RegWrite <= 1'b0;
            MEM_MemRead <= 1'b0;
            MEM_MemWrite <= 1'b0;
        end else begin
            alu_result_to_mem <= alu_result_from_ex;
            write_data_to_mem <= write_data_from_ex;
            write_reg_to_mem <= write_reg_from_ex;
            MEM_MemtoReg <= EX_MemtoReg;
            MEM_RegWrite <= EX_RegWrite;
            MEM_MemRead <= EX_MemRead;
            MEM_MemWrite <= EX_MemWrite;
        end
	end    
endmodule
