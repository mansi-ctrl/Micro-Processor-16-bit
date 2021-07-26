`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:11 11/14/2019 
// Design Name: 
// Module Name:    main 
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
`module main(data_in, clk, interrupt, reset,data_out);//A,B,ans_ex,ans_dm,mux_sel_A,mux_sel_B,ans_wb,Current_Address,imm_sel,ins);

input [15:0] data_in;
input clk;
input interrupt;
input reset;
output [15:0] data_out;
wire [31:0] ins;
wire [15:0] A;
wire [15:0] B;
wire [15:0] Current_Address;
wire [15:0] ans_ex;
wire [15:0] ans_dm;
wire [15:0] ans_wb;
wire [1:0] mux_sel_A;
wire [1:0] mux_sel_B;
wire imm_sel;

wire [5:0]op_dec;
wire [4:0] RA;
wire [4:0] RB;
wire [4:0] RW_dm;
wire [15:0]DM_data;
wire [15:0] jmp_loc;
wire [15:0]jmp_address_pm;
wire [1:0]flag_ex;
wire [5:0]op;
wire pc_mux_sel;
wire stall;
wire stall_pm;
wire mem_rw_ex;
wire mem_en_ex;
wire mem_mux_sel_dm;
wire [15:0]imm; 
assign RB = ins[15:11] ;
assign RA = ins[20:16] ;
assign jmp_address_pm = ins[15:0]; 
	

ALU_Module lab1( op_dec , A , B , data_in , clk , reset , ans_ex ,  flag_ex , data_out , DM_data );
program_memory lab2(jmp_loc,pc_mux_sel,stall,stall_pm,reset,clk,ins,Current_Address);
registerbank lab3a(ans_ex, ans_dm, ans_wb, imm, RA, RB, RW_dm, mux_sel_A, mux_sel_B, imm_sel, clk, A, B);
DMB lab3b(ans_ex, DM_data, mem_rw_ex, mem_en_ex, mem_mux_sel_dm, reset, clk, ans_dm);
Stall_control_block lab4a(ins[31:26], clk, reset, stall, stall_pm);
writeback lab4b(ans_dm, reset, clk, ans_wb);
JC_BLOCK lab5(jmp_address_pm, Current_Address, ins[31:26], flag_ex, interrupt, clk, reset,jmp_loc, pc_mux_sel);
DCB lab6(ins, clk, reset, imm, op_dec, RW_dm, mux_sel_A, mux_sel_B, imm_sel, mem_en_ex, mem_rw_ex, mem_mux_sel_dm);

endmodule
