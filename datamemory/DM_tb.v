`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:09:01 09/11/2019
// Design Name:   datamemory
// Module Name:   F:/sem3/COLab/datamemory/DM_tb.v
// Project Name:  datamemory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datamemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DM_tb;

	// Inputs
	reg [15:0] ans_ex;
	reg [15:0] DM_data;
	reg mem_rw_ex;
	reg mem_en_ex;
	reg mem_mux_sel_dm;
	reg reset;
	reg clk;

	// Outputs
	wire [15:0] ans_dm;

	// Instantiate the Unit Under Test (UUT)
	datamemory uut (
		.ans_ex(ans_ex), 
		.DM_data(DM_data), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_en_ex(mem_en_ex), 
		.mem_mux_sel_dm(mem_mux_sel_dm), 
		.reset(reset), 
		.clk(clk), 
		.ans_dm(ans_dm)
	);

	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		ans_ex = 'h0003;
		DM_data = 'hFFFF;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		
		#2;
		
      ans_ex = 'h0003;
		DM_data = 'hFFFF;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 0;
		
		#3;
		
		ans_ex = 'h0003;
		DM_data = 'hFFFF;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 0;
		
		#3;
		
		ans_ex = 'h0003;
		DM_data = 'hFFFF;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 1;
		
		#2;
		
      ans_ex = 'h0003;
		DM_data = 'hFFFF;
		mem_rw_ex = 0;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		
		#5;
		
      ans_ex = 'h0003;
		DM_data = 'hFFFF;
		mem_rw_ex = 0;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		
		#5;
		
      ans_ex = 'h0003;
		DM_data = 'hFFFF;
		mem_rw_ex = 1;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		
		#5;
		
      ans_ex = 'h0003;
		DM_data = 'hFFFF;
		mem_rw_ex = 1;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		
		#5;
		
		ans_ex = 'h0003;
		DM_data = 'hFFFF;
		mem_rw_ex = 0;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		reset = 1;
		

	end

      
endmodule

