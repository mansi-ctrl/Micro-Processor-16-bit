`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:22:29 11/21/2019 
// Design Name: 
// Module Name:    GCD 
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
/*module GCD(A,B,gcd,clk);
input A[15:0];
input B[15:0];
input clk;
output gcd[15:0];

while (A != B) begin
	if (A > B)
		begin
			A = A - B;
		end
	else if (B > A)
		begin
			B = B - A;
		end
end

always @ (posedge clk)
begin
	gcd <= A;
end

endmodule
*/

module GCD(inA, inB, clk, out);
input [15:0] inA, inB;
input clk;
output [15:0] out;

reg [15:0] A, B, out, swap;
integer done;

always @(posedge clk)
begin
	done = 0;
	A = inA; 
	B = inB;
	while ( !done )
		begin
			if ( A < B ) begin
				swap = A;
				A = B;
				B = swap;
			end
			else if ( B != 0 ) begin
				A = A - B;
			end
			else begin 
				done = 1;
			end
		end
	out = A;
end

endmodule 
