`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/10 01:33:40
// Design Name: 
// Module Name: HAZARD_DETECTION_UNIT
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


module HAZARD_DETECTION_UNIT(IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRt, ID_EX_MemRead, PCWrite, IF_ID_Write, Mux_op);
    input [4:0] IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRt;
    input ID_EX_MemRead;
    output reg PCWrite, IF_ID_Write, Mux_op;

    always @(IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRt, ID_EX_MemRead) begin
        if((ID_EX_MemRead == 1'b1) & ((ID_EX_RegisterRt == IF_ID_RegisterRs) | (ID_EX_RegisterRt == IF_ID_RegisterRt))) begin
            PCWrite <= 1'b1;
            IF_ID_Write <= 1'b1;
            Mux_op <= 1'b1;
        end else begin
            PCWrite <= 1'b0;
            IF_ID_Write <= 1'b0;
            Mux_op <= 1'b0;
        end
    end
    
endmodule
