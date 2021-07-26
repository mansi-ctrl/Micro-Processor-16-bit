`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:34:25 09/05/2019 
// Design Name: 
// Module Name:    datamemory 
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
module datamemory(
    input [15:0] ans_ex,
    input [15:0] DM_data,
    input mem_rw_ex,
    input mem_en_ex,
    input mem_mux_sel_dm,
    input reset,
    input clk,
    output [15:0] ans_dm
    );
	 reg Ex_out;
	 wire [15:0] temp ;
	 wire DM_out;

assign temp=(reset==0)?16'b0000000000000000:ans_ex;
always @(posedge clk)
begin
 Ex_out=temp;
end
dataMemory your_instance_name (
  .clka(clk), // input clka
  .ena(mem_en_ex), // input ena
  .wea(mem_rw_ex), // input [0 : 0] wea
  .addra(ans_ex), // input [15 : 0] addra
  .dina(DM_data), // input [15 : 0] dina
  .douta(DM_out) // output [15 : 0] douta
);
assign ans_dm=(mem_mux_sel_dm==0)?Ex_out:DM_out;

endmodule
