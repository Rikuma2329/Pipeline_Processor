`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/10 00:58:42
// Design Name: 
// Module Name: FORWARDING_MUX
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


module FORWARDING_MUX(ID_EX, EX_MEM, MEM_WB, op, mux_out);
    input [31:0] ID_EX, EX_MEM, MEM_WB;
    input [1:0] op;
    output reg [31:0] mux_out;
    
    always @(ID_EX, EX_MEM, MEM_WB, op) begin
        if(op == 2'b00) begin
            mux_out <= ID_EX;
        end else if(op == 2'b10) begin
            mux_out <= EX_MEM;
        end else if(op == 2'b01) begin
            mux_out <= MEM_WB;
        end else begin
            mux_out <= 32'b0;
        end  
    end
    
endmodule
