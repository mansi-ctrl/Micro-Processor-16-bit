`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:10 09/12/2019 
// Design Name: 
// Module Name:    stallB 
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
module stallB(op, clk, reset, stall, stall_pm);

input [5:0] op;
input clk, reset;
output stall, stall_pm;

wire HLT, LOAD, JUMP, q1, q2, q3, q4;

d_flipflop a (LOAD, clk, reset, q1);
d_flipflop a1 (stall, clk, reset, q2);
d_flipflop a2 (JUMP, clk, reset, q3);
d_flipflop a3 (q3, clk, reset, q4);

assign HLT = op[0] & (~op[1]) & (~op[2]) & (~op[3]) & op[4] & (~op[5]);
assign LOAD = (~op[0]) & (~op[1]) & op[2] & (~op[3]) & op[4] & (~op[5]) & (~q1);
assign JUMP = op[2] & op[3] & op[4] & (~op[5]) & (~q4);

assign stall = JUMP | LOAD | HLT;
assign stall_pm = q2;


endmodule
