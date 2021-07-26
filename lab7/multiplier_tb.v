`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:52:18 12/10/2019
// Design Name:   multiplier
// Module Name:   F:/sem3/COLab/lab7/multiplier_tb.v
// Project Name:  lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module multiplier_tb;
reg clk, start;
reg [7:0] a, b;
wire [15:0] ab;
wire busy;
multiplier multiplier1(ab, busy, a, b, clk, start);
always #5 clk = !clk;
initial begin
clk = 0;
//$display("first example: a = 3 b = 17");
a = -64; b = 64; start = 1; #50 start = 0;
#80 //$display("first example done");
//$display("second example: a = 7 b = 7");
a = 7; b = 7; start = 1; #50 start = 0;
//#80 $display("second example done");
$finish;
end
/*always @(posedge clk) //$strobe("ab: %d busy: %d at time=%t", ab, busy,
//$stime);
      */
endmodule

