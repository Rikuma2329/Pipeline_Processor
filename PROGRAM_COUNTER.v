`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 16:56:37
// Design Name: 
// Module Name: PROGRAM_COUNTER
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


module PROGRAM_COUNTER(clk, rst, PCSrc, Jump, PCWrite, branch_add, jump_add, pc_add_out, pc);
    input clk, rst, PCSrc, Jump, PCWrite;
    input [31:0] branch_add, jump_add;
    output [31:0] pc, pc_add_out;
    reg [31:0] pc = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    wire [31:0] next_pc_add, pc_in, fa32_out;
    
    FA32 fa32(pc, 32'b0000_0000_0000_0000_0000_0000_0000_0100, fa32_out);
    
    assign pc_add_out = fa32_out;
    assign next_pc_add = (PCSrc)? branch_add : fa32_out;
    assign pc_in = (Jump)? jump_add : next_pc_add;
    
    always @(posedge clk) begin
        if(rst == 1'b0) begin
			pc <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		end else begin
	        if(PCWrite == 1'b0) begin
		          pc <= pc_in; 
            end
		end
	end
	
endmodule
