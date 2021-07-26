`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:17:33 09/19/2019
// Design Name:   JCblock
// Module Name:   F:/sem3/COLab/JCblock/JCblock_tb.v
// Project Name:  JCblock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JCblock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module JCblock_tb;

	// Inputs
	reg [15:0] jmp_address_pm;
	reg [15:0] current_address;
	reg [5:0] op;
	reg [1:0] flag_ex;
	reg interrupt;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] jmp_loc;
	wire pc_mux_sel;

	// Instantiate the Unit Under Test (UUT)
	JCblock uut (
		.jmp_address_pm(jmp_address_pm), 
		.current_address(current_address), 
		.op(op), 
		.flag_ex(flag_ex), 
		.interrupt(interrupt), 
		.clk(clk), 
		.reset(reset), 
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel)
	);
	always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		jmp_address_pm = 0;
		current_address = 'h0001;
		op = 0;
		flag_ex = 0;
		interrupt = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#2;
		reset=0;
		#8;
		reset=1;
		
		
		
		// Add stimulus here

	end
      
endmodule

