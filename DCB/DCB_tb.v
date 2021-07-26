`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:05:06 10/10/2019
// Design Name:   DCB
// Module Name:   F:/sem3/COLab/DCB/DCB_tb.v
// Project Name:  DCB
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DCB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DCB_tb;

	// Inputs
	reg [31:0] ins;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] imm;
	wire [5:0] op_dec;
	wire [4:0] RW_dm;
	wire [1:0] mux_sel_A;
	wire [1:0] mux_sel_B;
	wire imm_sel;
	wire mem_en_ex;
	wire mem_rw_ex;
	wire mem_mux_sel_dm;

	// Instantiate the Unit Under Test (UUT)
	DCB uut (
		.ins(ins), 
		.clk(clk), 
		.reset(reset), 
		.imm(imm), 
		.op_dec(op_dec), 
		.RW_dm(RW_dm), 
		.mux_sel_A(mux_sel_A), 
		.mux_sel_B(mux_sel_B), 
		.imm_sel(imm_sel), 
		.mem_en_ex(mem_en_ex), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_mux_sel_dm(mem_mux_sel_dm)
	);

		always #5 clk = ~clk;
		
	initial begin
		// Initialize Inputs
		ins = 0;
		clk = 0;
		reset = 1;
		#2;
		reset=0;
		#6;
		reset=1;
		#2;
		#10;
		ins = 32'b00000000001000100001100000000000;
		
	   #10;
		ins = 32'b01010000100000010000000000000000;
		
		#10;
		ins = 32'b01010000100000010000000000000000;
      
		#10;
		ins = 32'b00010000101000010010000000000000;

		#10;
		ins = 32'b00110100110000010000000000000101;
		// Add stimulus here

	end
endmodule

