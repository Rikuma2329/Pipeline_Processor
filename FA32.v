`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 14:34:46
// Design Name: 
// Module Name: FA32
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


module FA32(a, b, s);
    input [31:0] a, b;
    output [31:0] s;
    wire [30:0] c;
    
    FA fa0(a[0], b[0], 1'b0, s[0], c[0]);
    FA fa1(a[1], b[1], c[0], s[1], c[1]);
    FA fa2(a[2], b[2], c[1], s[2], c[2]);
    FA fa3(a[3], b[3], c[2], s[3], c[3]);
    FA fa4(a[4], b[4], c[3], s[4], c[4]);
    FA fa5(a[5], b[5], c[4], s[5], c[5]);
    FA fa6(a[6], b[6], c[5], s[6], c[6]);
    FA fa7(a[7], b[7], c[6], s[7], c[7]);
    FA fa8(a[8], b[8], c[7], s[8], c[8]);
    FA fa9(a[9], b[9], c[8], s[9], c[9]);
    FA fa10(a[10], b[10], c[9], s[10], c[10]);
    FA fa11(a[11], b[11], c[10], s[11], c[11]);
    FA fa12(a[12], b[12], c[11], s[12], c[12]);
    FA fa13(a[13], b[13], c[12], s[13], c[13]);
    FA fa14(a[14], b[14], c[13], s[14], c[14]);
    FA fa15(a[15], b[15], c[14], s[15], c[15]);
    FA fa16(a[16], b[16], c[15], s[16], c[16]);
    FA fa17(a[17], b[17], c[16], s[17], c[17]);
    FA fa18(a[18], b[18], c[17], s[18], c[18]);
    FA fa19(a[19], b[19], c[18], s[19], c[19]);
    FA fa20(a[20], b[20], c[19], s[20], c[20]);
    FA fa21(a[21], b[21], c[20], s[21], c[21]);
    FA fa22(a[22], b[22], c[21], s[22], c[22]);
    FA fa23(a[23], b[23], c[22], s[23], c[23]);
    FA fa24(a[24], b[24], c[23], s[24], c[24]);
    FA fa25(a[25], b[25], c[24], s[25], c[25]);
    FA fa26(a[26], b[26], c[25], s[26], c[26]);
    FA fa27(a[27], b[27], c[26], s[27], c[27]);
    FA fa28(a[28], b[28], c[27], s[28], c[28]);
    FA fa29(a[29], b[29], c[28], s[29], c[29]);
    FA fa30(a[30], b[30], c[29], s[30], c[30]);
    FA fa31(a[31], b[31], c[30], s[31],);
    
endmodule
