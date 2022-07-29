`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/09 13:29:38
// Design Name: 
// Module Name: CONTROL_UNIT
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


module CONTROL_UNIT(Op, flag, ID_Flush, read_data1, read_data2, Jump, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);
    input [5:0] Op;
    input [31:0] read_data1, read_data2;
    input flag, ID_Flush;
    output Jump, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
    reg [9:0] control;
    
    always @(Op, flag) begin
        if(flag | ID_Flush) begin
            control <= 10'b0000000000;
        end else
            case (Op)
                6'b000000:
                    control <= 10'b0100100010;
                6'b000010:
                    control <= 10'b1000000000;
                6'b100011:
                    control <= 10'b0011110000;
                6'b101011:
                    control <= 10'b0010001000;
                6'b000100:
                    control <= 10'b0000000101;
                default:
                    control <= 10'b0000000000;
            endcase
    end
     
     assign {Jump, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} = control[9:0];
           
endmodule
