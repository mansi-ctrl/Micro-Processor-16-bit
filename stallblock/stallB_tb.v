`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:36:18 09/12/2019
// Design Name:   stallB
// Module Name:   F:/sem3/COLab/stallblock/stallB_tb.v
// Project Name:  stallblock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stallB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stallB_tb;

	// Inputs
	reg [5:0] op;
	reg clk;
	reg reset;

	// Outputs
	wire stall;
	wire stall_pm;

	// Instantiate the Unit Under Test (UUT)
	stallB uut (
		.op(op), 
		.clk(clk), 
		.reset(reset), 
		.stall(stall), 
		.stall_pm(stall_pm)
	);

	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		op = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#2;
		
		reset = 0;
		
		#6;
		
		reset = 1;
		
		#8;
		
		op = 6'b010100;
		
      #20;

		op = 0;
		
		#10;
		
		op = 6'b011110;
		
		#30;
		
		op = 0;
		
		#10;
		
		op = 6'b010001;
		

	end

      
endmodule

