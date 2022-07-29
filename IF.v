`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 17:09:42
// Design Name: 
// Module Name: IF
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


module IF(clk, rst, PCSrc, Jump, PCWrite, branch_add, jump_add, pc_add_out, r_data);
    input clk, rst, PCSrc, Jump, PCWrite;
    input [31:0] branch_add, jump_add;
    output [31:0] pc_add_out, r_data;
    wire [31:0] pc;
    
    PROGRAM_COUNTER program_counter(clk, rst, PCSrc, Jump, PCWrite, branch_add, jump_add, pc_add_out, pc);
    INST_MEM inst_mem(pc, r_data);

endmodule
