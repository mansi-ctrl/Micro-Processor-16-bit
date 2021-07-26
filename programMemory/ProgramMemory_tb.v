`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:25:40 09/01/2019
// Design Name:   ProgramMemory
// Module Name:   F:/sem3/COLab/programMemory/ProgramMemory_tb.v
// Project Name:  programMemory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProgramMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ProgramMemory_tb;

	// Inputs
	reg [15:0] jmp_loc;
	reg pc_mux_sel;
	reg stall;
	reg stall_pm;
	reg reset;
	reg clk;

	// Outputs
	wire [31:0] ins;
	wire [15:0] current_address;

	// Instantiate the Unit Under Test (UUT)
	ProgramMemory uut (
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel), 
		.stall(stall), 
		.stall_pm(stall_pm), 
		.reset(reset), 
		.clk(clk), 
		.ins(ins), 
		.current_address(current_address)
	);

	initial begin
		// Initialize Inputs
		jmp_loc = 0;
		pc_mux_sel = 0;
		stall = 0;
		stall_pm = 0;
		reset = 0;
		clk = 0;

//		forever
//		begin
//		clk = -clk;
//		#100;
//		end
		
		// Wait 100 ns for global reset to finish
      jmp_loc = 4'H0008;
		pc_mux_sel = 1;
		stall = 0;
		stall_pm = 0;
		reset = 1;
		
		#2;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 1;
		stall = 0;
		stall_pm = 0;
		reset = 0;
		
		#6;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 1;
		stall = 0;
		stall_pm = 0;
		reset = 1;
		
		#2;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 0;
		stall = 0;
		stall_pm = 0;
		reset = 1;
		
		#5;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 0;
		stall = 0;
		stall_pm = 0;
		reset = 1;
		
		#10;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 0;
		stall = 0;
		stall_pm = 0;
		reset = 1;
		
		#10;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 0;
		stall = 0;
		stall_pm = 0;
		reset = 1;
		
		#5;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 0;
		stall = 1;
		stall_pm = 0;
		reset = 1;
		
		#10;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 0;
		stall = 0;
		stall_pm = 1;
		reset = 1;
		
		#5;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 0;
		stall = 0;
		stall_pm = 1;
		reset = 1;
		
		#5;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 1;
		stall = 0;
		stall_pm = 0;
		reset = 1;
		
		#5;
		
		jmp_loc = 4'H0008;
		pc_mux_sel = 1;
		stall = 0;
		stall_pm = 0;
		reset = 1;

	end
	
	always #5 clk = ~clk;

      
endmodule

