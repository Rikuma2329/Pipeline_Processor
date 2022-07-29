`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/10 00:02:25
// Design Name: 
// Module Name: FORWARDING_UNIT
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


module FORWARDING_UNIT(EX_MEM_RegWrite, MEM_WB_RegWrite, Rs, Rt, EX_MEM_RegisterRd, MEM_WB_RegisterRd, ForwardA, ForwardB);
    input EX_MEM_RegWrite, MEM_WB_RegWrite;
    input [4:0] Rs, Rt;
    input [4:0] EX_MEM_RegisterRd, MEM_WB_RegisterRd;
    output reg [1:0] ForwardA, ForwardB;
    
    always @(EX_MEM_RegWrite, MEM_WB_RegWrite, Rs, Rt, EX_MEM_RegisterRd, MEM_WB_RegisterRd) begin
        if((EX_MEM_RegWrite == 1'b1) & (EX_MEM_RegisterRd != 4'b0) & (EX_MEM_RegisterRd == Rs)) begin
            ForwardA <= 2'b10;
        end else if((EX_MEM_RegWrite == 1'b1) & (EX_MEM_RegisterRd != 4'b0) & (EX_MEM_RegisterRd == Rt)) begin
            ForwardB <= 2'b10;
        end else if((MEM_WB_RegWrite == 1'b1) & (MEM_WB_RegisterRd != 4'b0) & ~((EX_MEM_RegWrite == 1'b1) & (EX_MEM_RegisterRd != 4'b0) & (EX_MEM_RegisterRd == Rs)) & (MEM_WB_RegisterRd == Rs)) begin
            ForwardA <= 2'b01;
        end else if((MEM_WB_RegWrite == 1'b1) & (MEM_WB_RegisterRd != 4'b0) & ~((EX_MEM_RegWrite == 1'b1) & (EX_MEM_RegisterRd != 4'b0) & (EX_MEM_RegisterRd == Rt)) & (MEM_WB_RegisterRd == Rt)) begin
            ForwardB <= 2'b01;
        end else begin
            ForwardA <= 2'b00;
            ForwardB <= 2'b00;
        end
    end
    
endmodule
