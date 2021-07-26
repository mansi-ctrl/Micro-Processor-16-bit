`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:37 12/06/2019 
// Design Name: 
// Module Name:    parityChecker 
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

module parityChecker(data,vparity);
input [4:0] data;
output vparity;

integer i;

reg [4:0] data;
reg parity;
reg vparity;

initial
begin
	assign data=5'b10100;
   assign parity = 1'b0;

   for (i= 0; i < 5; i = i + 1)
		begin
			assign parity = parity ^ data[i];
		end

	assign vparity={data, vparity};
end
endmodule