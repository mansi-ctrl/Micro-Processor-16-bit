`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:22:36 09/10/2019 
// Design Name: 
// Module Name:    writeback 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module writeback(ans_dm, reset, clk, ans_wb);
input [15:0] ans_dm;
input reset;
input clk;
output reg [15:0] ans_wb;
    
wire  [15:0]temp;
//on the positive edge of clk our output will be same as input
assign temp = (reset==0) ? 16'b0000000000000000 : ans_dm;

always@ (posedge clk)
	begin
		ans_wb<=temp;
	end
endmodule
