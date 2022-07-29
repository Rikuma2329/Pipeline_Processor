`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 14:41:06
// Design Name: 
// Module Name: REGISTER
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


module REGISTER(clk, rst, RegWrite, inst, write_reg, write_data, read_data1, read_data2);
    input clk, rst, RegWrite;
    input [31:0] inst;
    input [31:0] write_reg, write_data;
    output [31:0] read_data1, read_data2;
    wire [4:0] read_reg1, read_reg2, write_reg;
    reg [31:0] register [31:0];
    
    integer i;
    initial begin
        for(i = 0; i <= 31; i = i + 1) 
            register[i] <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    end
    
    always @(posedge clk) begin
        if(RegWrite == 1'b1) begin
            register[write_reg] <= write_data;
        end
    end
    
    assign read_reg1 = inst[25:21];
    assign read_reg2 = inst[20:16];
    
    assign read_data1 = (RegWrite & (write_reg == read_reg1))? write_data : register[read_reg1];
    assign read_data2 = (RegWrite & (write_reg == read_reg2))? write_data : register[read_reg2];
    
endmodule
