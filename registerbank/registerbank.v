`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:14:57 09/05/2019 
// Design Name: 
// Module Name:    registerbank 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module registerbank(
    input [15:0] ans_ex,
    input [15:0] ans_dm,
    input [15:0] ans_wb,
    input [15:0] imm,
    input [4:0] RA,
    input [4:0] RB,
    input [4:0] RW_dm,
    input [1:0] mux_sel_A,
    input [1:0] mux_sel_B,
    input imm_sel,
    input clk,
    output [15:0] A,
    output [15:0] B
    );
	 wire [4:0]tempA;
	 wire [4:0]tempB;
	 reg [15:0]regbank[31:0];
	 reg [15:0]AR;
	 reg [15:0]BR;
	 assign tempA = regbank[RA];
	 assign tempB = regbank[RB];
	 
	 assign A=(mux_sel_A==2'b00)?tempA:
				 (mux_sel_A==2'b01)?ans_ex:
				 (mux_sel_A==2'b10)?ans_dm:ans_wb;
	 assign BI=(mux_sel_B==2'b00)?tempB:
				  (mux_sel_B==2'b01)?ans_ex:
				  (mux_sel_B==2'b10)?ans_dm:ans_wb;
	 assign B=(imm_sel==0)?BI:imm;
// non-Blocking(<=) is used to assign all values togther, whereas blocking(=) is used to assign values one after another. 
	 always @ (posedge clk)
	 begin
	 AR <= tempA;
	 BR <= tempB;
	 regbank[RW_dm]=ans_dm;
	 end	 
endmodule
