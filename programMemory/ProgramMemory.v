`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:47 08/29/2019 
// Design Name: 
// Module Name:    ProgramMemory 
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
module program_memory(jmp_loc,pc_mux_sel,stall,stall_pm,reset,clk,ins,current_address);

input [15:0] jmp_loc;
input pc_mux_sel, stall, stall_pm, reset, clk;
output [15:0] current_address;
output [31:0] ins;

reg [15:0]hold_address;
reg [15:0]next_address;
reg [31:0]ins_prv;

wire [15:0]CAJ, CAR;
wire [31:0]PM_out, ins_pm;
wire [15:0]IA;
wire [31:0]temp1;
wire [15:0]temp2, temp3;

assign CAJ = stall==0 ? next_address : hold_address;
assign CAR = pc_mux_sel==0 ? CAJ : jmp_loc;
assign current_address = reset==0 ? 16'b0 : CAR;

assign ins_pm = stall_pm==0 ? PM_out : ins_prv;
assign ins = reset == 0 ? 32'b0 : ins_pm;

assign IA = current_address + 16'b1;


PM your_instance_name (
  .clka(clk), // input clka
  .addra(current_address), // input [15 : 0] addra
  .douta(PM_out) // output [31 : 0] douta
);
assign temp1 = reset==0 ? 32'b0 : ins;
assign temp2 = reset==0 ? 16'b0 : current_address;
assign temp3 = reset==0 ? 16'b0 : IA;

always @ (posedge clk)
begin
ins_prv = temp1;
hold_address = temp2;
next_address = temp3;
end


endmodule
