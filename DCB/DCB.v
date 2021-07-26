`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:05 10/10/2019 
// Design Name: 
// Module Name:    DCB 
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
module d_flipflop(d, clk, reset, out);
input d, clk, reset;
output reg out;

always @ (posedge clk)
begin
out <= reset == 0 ? 1'b0 : d;
end

endmodule



//////////////////////////////////////////////////////////////////////////////////

module DCB(ins, clk, reset, imm, op_dec, RW_dm, mux_sel_A, mux_sel_B, imm_sel, mem_en_ex, mem_rw_ex, mem_mux_sel_dm);
input [31:0] ins;
input clk, reset;
output  [15:0]imm;
output  [5:0] op_dec;
output  [4:0] RW_dm;
output [1:0] mux_sel_A, mux_sel_B;
output  imm_sel, mem_en_ex , mem_rw_ex, mem_mux_sel_dm;
wire JMP, Cond_J, LD_fb, Imm, Ld, ST;
wire p1, p2, p3, p4, p6, p7 ,q1, q2, q3, q4, q5, q6, q7, q8, q9, o1, o2;
wire [14:0] p5, IE_out;
wire C1, C2, C3, C4, C5, C6;
wire [1:0] Pri1, Pri2;

reg [15:0] reg16b;
reg [5:0] reg6b;
reg [4:0] reg5b1, reg5b2, reg5b3, reg5b4, reg5b5, reg5b6; 

wire [3:0]Pri1_in, Pri2_in;

assign JMP    = (~ins[31]) & ( ins[30]) & ( ins[29]) & (~ins[28]) & (~ins[27]) & (~ins[26]);
assign Cond_J = (~ins[31]) & ( ins[30]) & ( ins[29]) & ( ins[28]);
assign LD_fb  = (~ins[31]) & ( ins[30]) & (~ins[29]) & ( ins[28]) & (~ins[27]) & (~ins[26]) & (~q1);
assign Imm    = (~ins[31]) & (~ins[30]) & ( ins[29]);
assign Ld     = (~ins[31]) & ( ins[30]) & (~ins[29]) & ( ins[28]) & (~ins[27]) & (~ins[26]);
assign ST     = (~ins[31]) & ( ins[30]) & (~ins[29]) & ( ins[28]) & (~ins[27]) & ( ins[26]);

assign p7 = Ld & (~q4);
assign o2 = q5 | q4;
assign p6 = o2 & (~q3);
assign o1 = ~(JMP | Cond_J | q1); 
assign IE_out = o1==0 ? 15'b000000000000000 : 15'b111111111111111;
assign p5 = ins[25:11] & IE_out;

d_flipflop d1(LD_fb, clk, reset, q1);
d_flipflop d2(Imm, clk, reset, q2);
d_flipflop d3(ins[26], clk, reset, q3);
d_flipflop d4(p7, clk, reset, q4);
d_flipflop d5(ST, clk, reset, q5);
d_flipflop d6(q3, clk, reset, q6);
d_flipflop d7(p6, clk, reset, q7);
d_flipflop d8(o2, clk, reset, q8);
d_flipflop d9(q7, clk, reset, q9);

assign C1 = (reg5b3 == reg5b1) ? 1 : 0;
assign C2 = (reg5b4 == reg5b1) ? 1 : 0;
assign C3 = (reg5b5 == reg5b1) ? 1 : 0;
assign C4 = (reg5b3 == reg5b6) ? 1 : 0;
assign C5 = (reg5b4 == reg5b6) ? 1 : 0;
assign C6 = (reg5b5 == reg5b6) ? 1 : 0;

assign p1 = ~C1 & C2;
assign p2 = ~C1 & ~C2 & C3;
assign p3 = ~C4 & C5;
assign p4 = ~C4 & ~C5 & C6;

assign Pri1_in[0] = 1'b1;
assign Pri1_in[1] = C1;
assign Pri1_in[2] = p1;
assign Pri1_in[3] = p2;

assign Pri2_in[0] = 1'b1;
assign Pri2_in[1] = C4;
assign Pri2_in[2] = p3;
assign Pri2_in[3] = p4;

assign Pri1 = (Pri1_in == 4'b0001) ? 2'b00 : (Pri1_in == 4'b0011) ? 2'b01 : (Pri1_in == 4'b0101) ? 2'b10 : 2'b11; 
assign Pri2 = (Pri2_in == 4'b0001) ? 2'b00 : (Pri2_in == 4'b0011) ? 2'b01 : (Pri2_in == 4'b0101) ? 2'b10 : 2'b11;

always @ (posedge clk)
begin
reg16b <= (reset==0) ? 16'b0000000000000000 : ins[15:0];
reg6b <= (reset==0) ? 6'b000000 : ins[31:26];
reg5b1 <= (reset==0) ? 5'b00000 : p5[9:5];
reg5b2 <= (reset==0) ? 5'b00000 : p5[14:10];
reg5b3 <= (reset==0) ? 5'b00000 : reg5b2;
reg5b4 <= (reset==0) ? 5'b00000 : reg5b3;
reg5b5 <= (reset==0) ? 5'b00000 : reg5b4;
reg5b6 <= (reset==0) ? 5'b00000 : p5[4:0];
end

assign mux_sel_A = Pri1;
assign mux_sel_B = Pri2;
assign RW_dm = reg5b4;
assign op_dec = reg6b;
assign imm = reg16b;
assign imm_sel = q2;
assign mem_rw_ex = q6;
assign mem_mux_sel_dm = q9;
assign mem_en_ex = q8; 		
endmodule
