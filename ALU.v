`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 14:35:27
// Design Name: 
// Module Name: ALU
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


module ALU(a, b, c_in, slt, ALUctl, c_out, ALUout);
    input a, b, c_in, slt;
    input [3:0] ALUctl;
    output c_out, ALUout;
    reg ALUout, set, ovf;
    wire fa_out, b_sign;
    
    assign b_sign = (ALUctl[2])? ~b : b;
    
    FA fa(a, b_sign, c_in, fa_out, c_out);
    
    always @(ALUctl, a, b, fa_out) begin
        case (ALUctl)
            4'b0000:
                ALUout <= (a & b);
            4'b0001:
                ALUout <= (a | b);
            4'b0010:
                ALUout <= fa_out;
            4'b0110:
                ALUout <= fa_out;
            4'b0111:
                ALUout <= slt;
            4'b1100:
                ALUout <= (a ^ b);
            default:
                ALUout <= 0;
        endcase
    end
endmodule
