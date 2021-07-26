`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:20:38 10/23/2019
// Design Name:   main
// Module Name:   F:/sem3/COLab/lab7/main_tb.v
// Project Name:  lab7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_tb;

	// Inputs
	reg [15:0] data_in;
	reg clk;
	reg interrupt;
	reg reset;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.data_in(data_in), 
		.clk(clk), 
		.interrupt(interrupt), 
		.reset(reset), 
		.data_out(data_out)
	);

	initial
begin
data_in = 0;
interrupt = 0;
clk = 0;
reset = 1;
#200; reset = 0;
#500; reset = 1;
end
always

#500 clk = ~clk;
      
endmodule

