`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 14:42:38
// Design Name: 
// Module Name: BIT_SIFT
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


module BIT_SIFT(add_in, add_out);
    input [31:0] add_in;
    output [31:0] add_out;
    
    assign add_out = add_in << 2;
    
endmodule
