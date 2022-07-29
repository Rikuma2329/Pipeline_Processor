`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 15:17:38
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(clk, rst, MEM_MemtoReg, MEM_RegWrite, read_data_from_mem, alu_result_from_mem, write_reg_from_mem, read_data_to_wb, alu_result_to_wb, write_reg_to_wb, WB_MemtoReg, WB_RegWrite);
    input clk, rst, MEM_MemtoReg, MEM_RegWrite;
    input [31:0] read_data_from_mem, alu_result_from_mem;
    input [4:0] write_reg_from_mem;
    output reg [31:0] read_data_to_wb, alu_result_to_wb;
    output reg [4:0] write_reg_to_wb;
    output reg WB_MemtoReg, WB_RegWrite;
    
    always @(posedge clk) begin
        if(rst == 1'b0) begin
            read_data_to_wb <= 32'b0;
            alu_result_to_wb <= 32'b0;
            write_reg_to_wb <= 5'b0;
            WB_MemtoReg <= 1'b0;
            WB_RegWrite <= 1'b0;
        end else begin
            read_data_to_wb <= read_data_from_mem;
            alu_result_to_wb <= alu_result_from_mem;
            write_reg_to_wb <= write_reg_from_mem;
            WB_MemtoReg <= MEM_MemtoReg;
            WB_RegWrite <= MEM_RegWrite;
        end
	end    
	
endmodule
