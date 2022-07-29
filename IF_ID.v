`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/08 15:16:45
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(clk, rst, IF_ID_Write, IF_Flush, pc_from_if, r_data, pc_to_id, inst);
    input clk, rst, IF_ID_Write, IF_Flush;
    input [31:0] pc_from_if, r_data;
    output reg [31:0] pc_to_id, inst;

    
    always @(posedge clk) begin
        if(rst == 1'b0) begin
            pc_to_id <= 32'b0;
            inst <= 32'b0;
        end else if(IF_Flush == 1'b1) begin
            inst <= 32'b0;
        end else begin
            if(IF_ID_Write == 1'b0) begin
                pc_to_id <= pc_from_if;
                inst <= r_data;
            end 
        end
	end
	
endmodule
