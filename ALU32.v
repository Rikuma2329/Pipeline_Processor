`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 14:36:13
// Design Name: 
// Module Name: ALU32
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


module ALU32(a, b, ALUctl, s, ovf, zero);
    input [31:0] a, b;
    input [3:0] ALUctl;
    output [31:0] s;
    output ovf, zero;
    wire ovf, zero;
    wire [30:0] c_out;
    wire c_in, set;
    
    assign c_in = (ALUctl[2])? 1'b1 : 1'b0;
    
    ALU alu0(a[0], b[0], c_in, set, ALUctl, c_out[0], s[0]);
    ALU alu1(a[1], b[1], c_out[0], 1'b0, ALUctl, c_out[1], s[1]);
    ALU alu2(a[2], b[2], c_out[1], 1'b0, ALUctl, c_out[2], s[2]);
    ALU alu3(a[3], b[3], c_out[2], 1'b0, ALUctl, c_out[3], s[3]);
    ALU alu4(a[4], b[4], c_out[3], 1'b0, ALUctl, c_out[4], s[4]);
    ALU alu5(a[5], b[5], c_out[4], 1'b0, ALUctl, c_out[5], s[5]);
    ALU alu6(a[6], b[6], c_out[5], 1'b0, ALUctl, c_out[6], s[6]);
    ALU alu7(a[7], b[7], c_out[6], 1'b0, ALUctl, c_out[7], s[7]);
    ALU alu8(a[8], b[8], c_out[7], 1'b0, ALUctl, c_out[8], s[8]);
    ALU alu9(a[9], b[9], c_out[8], 1'b0, ALUctl, c_out[9], s[9]);
    ALU alu10(a[10], b[10], c_out[9], 1'b0, ALUctl, c_out[10], s[10]);
    ALU alu11(a[11], b[11], c_out[10], 1'b0, ALUctl, c_out[11], s[11]);
    ALU alu12(a[12], b[12], c_out[11], 1'b0, ALUctl, c_out[12], s[12]);
    ALU alu13(a[13], b[13], c_out[12], 1'b0, ALUctl, c_out[13], s[13]);
    ALU alu14(a[14], b[14], c_out[13], 1'b0, ALUctl, c_out[14], s[14]);
    ALU alu15(a[15], b[15], c_out[14], 1'b0, ALUctl, c_out[15], s[15]);
    ALU alu16(a[16], b[16], c_out[15], 1'b0, ALUctl, c_out[16], s[16]);
    ALU alu17(a[17], b[17], c_out[16], 1'b0, ALUctl, c_out[17], s[17]);
    ALU alu18(a[18], b[18], c_out[17], 1'b0, ALUctl, c_out[18], s[18]);
    ALU alu19(a[19], b[19], c_out[18], 1'b0, ALUctl, c_out[19], s[19]);
    ALU alu20(a[20], b[20], c_out[19], 1'b0, ALUctl, c_out[20], s[20]);
    ALU alu21(a[21], b[21], c_out[20], 1'b0, ALUctl, c_out[21], s[21]);
    ALU alu22(a[22], b[22], c_out[21], 1'b0, ALUctl, c_out[22], s[22]);
    ALU alu23(a[23], b[23], c_out[22], 1'b0, ALUctl, c_out[23], s[23]);
    ALU alu24(a[24], b[24], c_out[23], 1'b0, ALUctl, c_out[24], s[24]);
    ALU alu25(a[25], b[25], c_out[24], 1'b0, ALUctl, c_out[25], s[25]);
    ALU alu26(a[26], b[26], c_out[25], 1'b0, ALUctl, c_out[26], s[26]);
    ALU alu27(a[27], b[27], c_out[26], 1'b0, ALUctl, c_out[27], s[27]);
    ALU alu28(a[28], b[28], c_out[27], 1'b0, ALUctl, c_out[28], s[28]);
    ALU alu29(a[29], b[29], c_out[28], 1'b0, ALUctl, c_out[29], s[29]);
    ALU alu30(a[30], b[30], c_out[29], 1'b0, ALUctl, c_out[30], s[30]);
    ALU_MSB alu31(a[31], b[31], c_out[30], 1'b0, ALUctl, s[31], set, ovf);
    
    assign zero = (~|s)? 1'b1 : 1'b0;
    
endmodule
