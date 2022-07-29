`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 17:10:31
// Design Name: 
// Module Name: WB
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


module WB(WB_MemtoReg, WB_RegWrite_in, read_data, alu_result, write_reg_to_wb, write_data, write_reg_back, MEM_WB_RegWrite);
    input WB_MemtoReg, WB_RegWrite_in;
    input [31:0] read_data, alu_result;
    input [4:0] write_reg_to_wb;
    output [31:0] write_data;
    output [4:0] write_reg_back;
    output MEM_WB_RegWrite;
    
    assign write_data = (WB_MemtoReg)? read_data : alu_result;
    assign write_reg_back = write_reg_to_wb;
    assign MEM_WB_RegWrite = WB_RegWrite_in;
    
endmodule
