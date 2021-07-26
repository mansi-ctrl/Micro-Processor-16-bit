`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:04:08 09/12/2019
// Design Name:   writeback
// Module Name:   F:/sem3/COLab/writeback/writeback_tb.v
// Project Name:  writeback
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: writeback
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module writeback_tb;

	// Inputs
	reg [15:0] ans_dm;
	reg reset;
	reg clk;

	// Outputs
	wire [15:0] ans_wb;

	// Instantiate the Unit Under Test (UUT)
	writeback uut (
		.ans_dm(ans_dm), 
		.reset(reset), 
		.clk(clk), 
		.ans_wb(ans_wb)
	);
 always #5 clk=~clk;
 always #8 reset = ~reset;
	initial begin
		// Initialize Inputs
		ans_dm='h0000;
		clk=0;
		reset = 0;
		#10;
		ans_dm = 'h0005;
		#10;
		ans_dm = 'h0003;
		#10;
		ans_dm = 'h0008;
		#10;
		ans_dm = 'h0002;
		#10;
		ans_dm = 'h0001;
	
	end
      
endmodule

