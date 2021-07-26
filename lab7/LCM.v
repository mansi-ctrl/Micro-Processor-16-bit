`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:53 12/13/2019 
// Design Name: 
// Module Name:    LCM 
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
module LCM(A,B,clk,LCM_out,GCD_out,AXB,LCM);
input [15:0]A,B;
input clk;
output reg [15:0]LCM_out,GCD_out,AXB,LCM;
wire busy;
wire [15:0] gcd, axm, lcm;

GCD g1(A,B,clk,gcd);
multiplier mul(axm,busy,A[7:0],B[7:0],clk,1);
Division d1(axm,gcd,lcm);

always @(posedge clk)
	begin
		LCM_out <= lcm;
		GCD_out <= gcd;
		AXB <= axm;
	end
endmodule
