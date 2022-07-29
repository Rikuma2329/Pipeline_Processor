`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 18:16:20
// Design Name: 
// Module Name: ALU_CONTROL_UNIT
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


module ALU_CONTROL_UNIT(ALUOp, FuncCode, ALUCtl);
    input [1:0] ALUOp;
    input [5:0] FuncCode;
    output [3:0] ALUCtl;
    reg [3:0] ALUCtl;
    wire [7:0] comb;
    
    assign comb[7:0] = {ALUOp[1:0], FuncCode[5:0]};
    
    always @(comb) begin
        casex (comb)
            8'b00_xxxxxx:
                ALUCtl <= 4'b0010;
            8'bx1_xxxxxx:
                ALUCtl <= 4'b0110;
            8'b1x_xx0000:
                ALUCtl <= 4'b0010;
            8'b1x_xx0010:
                ALUCtl <= 4'b0110;   
            8'b1x_xx0100:
                ALUCtl <= 4'b0000;  
            8'b1x_xx0101:
                ALUCtl <= 4'b0001;
            8'b1x_xx1010:
                ALUCtl <= 4'b0111;
            default:
                ALUCtl <= 4'b1111;
        endcase
    end
    
endmodule
