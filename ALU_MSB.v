`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 14:37:00
// Design Name: 
// Module Name: ALU_MSB
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


module ALU_MSB(a, b, c_in, slt, ALUctl, ALUout, set, ovf);
    input a, b, c_in, slt;
    input [3:0] ALUctl;
    output ALUout, set, ovf;
    reg ALUout;
    wire c_out, fa_out, b_sign, set, ovf;
    
    assign b_sign = (ALUctl[2])? ~b : b;
    
    FA fa(a, b_sign, c_in, fa_out, c_out);
    
    always @ (ALUctl, a, b, fa_out) begin
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
    
    assign ovf = (c_in ^ c_out);
    assign set = (ovf ^ fa_out);
    
endmodule
