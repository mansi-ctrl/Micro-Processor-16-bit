`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:56:30 11/21/2019
// Design Name:   GCD
// Module Name:   F:/sem3/COLab/lab7/GCD_tb.v
// Project Name:  lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GCD_tb;

	// Inputs
	reg [15:0] inA;
	reg [15:0] inB;
	reg clk;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	GCD uut (
		.inA(inA), 
		.inB(inB), 
		.clk(clk), 
		.out(out)
	);

	always #50 clk=~clk;
	initial begin
		// Initialize Inputs
		inA = 0;
		inB = 0;
		clk = 0;

		#100;
		inA = 8;
		inB = 6;
		
		#100;
		inA = 14;
		inB = 15;
		
		#100;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

