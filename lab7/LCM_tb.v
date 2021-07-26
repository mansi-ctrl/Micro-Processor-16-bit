`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:31:41 12/13/2019
// Design Name:   LCM
// Module Name:   F:/sem3/COLab/lab7/LCM_tb.v
// Project Name:  lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LCM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LCM_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg clk;

	// Outputs
	wire [15:0] LCM_out;
	wire [15:0] GCD_out;
	wire [15:0] AXB;
	wire [15:0] LCM;

	// Instantiate the Unit Under Test (UUT)
	LCM uut (
		.A(A), 
		.B(B), 
		.clk(clk), 
		.LCM_out(LCM_out), 
		.GCD_out(GCD_out), 
		.AXB(AXB), 
		.LCM(LCM)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A=4;
		  B=6;
		  #50;
		  A=4;
		  B=8;
		  #50;
		  A=3;
		  B=5;
		  #50;
		  A=1;
		  B=1;
		  #50;
        
		// Add stimulus here

	end
      
endmodule

