`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:12:20 09/19/2019 
// Design Name: 
// Module Name:    JCblock 
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
module JCblock(jmp_address_pm,current_address,op,flag_ex,interrupt,clk,reset,jmp_loc,pc_mux_sel);
input [15:0] jmp_address_pm;
input [15:0] current_address;
input [5:0] op;
input [1:0] flag_ex;
input interrupt,clk,reset;
output [15:0] jmp_loc;
output pc_mux_sel;
wire JV , JNV , JZ , JNZ , JMP , RET , W1, W2, W3, W4, Q1, Q2;
wire [15:0] M1 ,M4 ,reg1;
wire [1:0] M3 , M2 , reg2;
 reg [15:0] temp1;
 reg [1:0] temp2;

d_flipflop a (interrupt,clk,reset,Q1);
d_flipflop a1 (Q1,clk,reset,Q2);
 

assign M1 = (interrupt==0) ? reg1 : current_address + 16'b0000000000000001 ; 
assign temp1 = (reset ==0) ? 16'b0000000000000000 : M1;

assign M2 = (Q2==0)? reg2 : flag_ex; 
assign temp2 = (reset ==0) ? 2'b00 : M2;

assign M3 = (RET==0)? flag_ex : reg2;

assign M4 = (Q1==0) ? jmp_address_pm : 'hF000;

assign jmp_loc = (RET==0) ? M4 : reg1;

assign JV = (~op[0]) & (~op[1]) & op[2] & op[3] & op[4] & (~op[5]);
assign JNV = (~op[0]) & op[1] & op[2] & op[3] & op[4] & (~op[5]);
assign JZ = (~op[0]) & op[1] & op[2] & op[3] & op[4] & (~op[5]);
assign JNZ = op[0] & op[1] & op[2] & op[3] & op[4] & (~op[5]);
assign JMP =(~op[0]) & (~op[1]) & (~op[2]) & op[3] & op[4] & (~op[5]);
assign RET=(~op[0]) & (~op[1]) & (~op[2]) & (~op[3]) & op[4] & (~op[5]);

assign W1 = JV & M3[0];
assign W2 = JNV &( ~M3[0] );
assign W3 = JZ & M3[1];
assign W4 = JNZ & ( ~M3[1] );

assign pc_mux_sel = W1 | W2 | W3 | W4 | JMP | RET | Q1;

always @(posedge clk)
begin
reg1 <= temp1;
reg2 <= temp2;
end

endmodule
