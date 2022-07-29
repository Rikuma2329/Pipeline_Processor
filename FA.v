`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 14:34:18
// Design Name: 
// Module Name: FA
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


module FA(a, b, c_in, s, c_out);
    input c_in, a, b;
    output c_out, s;
    
    assign s = a ^ b ^ c_in;
    assign c_out = (a & b) | (b & c_in) | (c_in & a);
    
endmodule
