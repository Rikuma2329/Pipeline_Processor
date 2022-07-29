`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 14:42:03
// Design Name: 
// Module Name: SIGN_EXTENSION
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


module SIGN_EXTENSION(add_in, add_out);
    input [15:0] add_in;
    output [31:0] add_out;
    wire [31:0] add_out;
    
    assign add_out = {{16{add_in[15]}}, add_in};      

endmodule
