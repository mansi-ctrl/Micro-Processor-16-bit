`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:56 08/22/2019 
// Design Name: 
// Module Name:     ALU
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

module right_shift(A,B,ans);
	input [15:0]A,B;
	output [15:0]ans;
	
	assign ans[15] = A[15];
	assign ans[14:0] = A>>B;  

endmodule

module ALU(A,B,data_in,op_dec,clk,reset,ans_ex,DM_data,data_out,flag_ex
    );
	 
	input [15:0] A,B,data_in;			
	input [5:0] op_dec;
	input clk,reset;
	output reg[15:0] ans_ex,DM_data,data_out;
	output  [1:0] flag_ex;
	reg [1:0]flag_prv;
	wire [15:0] ans_tmp,data_out_buff,temp,temp1,temp3;
	wire c1,c2;
	wire [15:0] sum;
	wire  overflow,zero;
	wire [1:0] temp2;
	wire [15:0] n;
	
	right_shift r1(A,B,temp);
	assign n = (op_dec[0]==1'b0) ? B :(op_dec[0]==1'b1) ? ~B  : B;	
	//2's complement if subtraction is to be 
	
	assign {c1,sum[14:0]} = A[14:0]+n[14:0];					
	assign {c2,sum[15]} = A[15]+n[15]+c1;					
	assign overflow = c1^c2;													
	//overflow 
	
	
	assign ans_tmp= (op_dec==6'b000000) ? sum : 
						 (op_dec==6'b000001) ? sum :
						 (op_dec==6'b000010) ? B :
						 (op_dec==6'b000100) ? A&B :
						 (op_dec==6'b000101) ? A|B :
						 (op_dec==6'b000110) ? A^B :
						 (op_dec==6'b000111) ? ~B :
						 (op_dec==6'b001000) ? sum:  
						 (op_dec==6'b001001) ? sum : 
						 (op_dec==6'b001010) ? B :
						 (op_dec==6'b001100) ? A&B : 
						 (op_dec==6'b001101) ? A|B :
						 (op_dec==6'b001110) ? A^B :
						 (op_dec==6'b001111) ? ~B:
						 (op_dec==6'b010000) ? ans_ex:     
						 (op_dec==6'b010001) ? ans_ex:
						 (op_dec==6'b010100) ? A:
						 (op_dec==6'b010101) ? A:
						 (op_dec==6'b010110) ? data_in:
						 (op_dec==6'b010111) ? ans_ex:    
						 (op_dec==6'b011000) ? ans_ex:
						 (op_dec==6'b011001)	? A<<B:
						 (op_dec==6'b011010) ? A>>B:
						 (op_dec==6'b011011) ? temp:
						 (op_dec==6'b011100) ? ans_ex:
						 (op_dec==6'b011101) ? ans_ex:
						 (op_dec==6'b011110) ? ans_ex:
						 (op_dec==6'b011111) ? ans_ex:
						 1'b0;	

	//zero flag
   assign zero = (ans_tmp==16'b0000000000000000)?1:0;				
	assign data_out_buff = (op_dec == 6'b010111) ? A : data_out; 
	
	//overflow flag 
	assign flag_ex[0] =  (op_dec==6'b000000) ? overflow:
							   (op_dec==6'b000001) ? overflow:					
								(op_dec==6'b000010) ? 1'b0:
								(op_dec==6'b000100) ? 1'b0:
								(op_dec==6'b000101) ? 1'b0:
								(op_dec==6'b000110) ? 1'b0:
								(op_dec==6'b000111) ? 1'b0:
								(op_dec==6'b001000) ? overflow:
								(op_dec==6'b001001) ? overflow:
								(op_dec==6'b001010) ? 1'b0:
								(op_dec==6'b001100) ? 1'b0:
								(op_dec==6'b001101) ? 1'b0:
								(op_dec==6'b001110) ? 1'b0:
								(op_dec==6'b001111) ? 1'b0:
								(op_dec==6'b010000) ? 1'b0:
								(op_dec==6'b010001) ? 1'b0:
								(op_dec==6'b010100) ? 1'b0:
								(op_dec==6'b010101) ? 1'b0:
								(op_dec==6'b010110) ? 1'b0:
								(op_dec==6'b010111) ? 1'b0:
								(op_dec==6'b011000) ? 1'b0:
								(op_dec==6'b011001) ? 1'b0:
								(op_dec==6'b011010) ? 1'b0:
								(op_dec==6'b011011) ? 1'b0:
								(op_dec==6'b011100) ? 1'b0:
								(op_dec==6'b011101) ? 1'b0:
								(op_dec==6'b011110) ? 1'b0:
								(op_dec==6'b011111) ? 1'b0:1'b0;
	//assigning zero flag 1 when ans_tmp returns zero value
	assign flag_ex[1] =  (op_dec==6'b000000) ? zero:
							   (op_dec==6'b000001) ? zero:
							   (op_dec==6'b000010) ? zero:
								(op_dec==6'b000100) ? zero:
								(op_dec==6'b000101) ? zero:
								(op_dec==6'b000110) ? zero:
								(op_dec==6'b000111) ? zero:
								(op_dec==6'b001000) ? zero:
								(op_dec==6'b001001) ? zero:
								(op_dec==6'b001010) ? zero:
								(op_dec==6'b001100) ? zero:
								(op_dec==6'b001101) ? zero:
								(op_dec==6'b001110) ? zero:
								(op_dec==6'b001111) ? zero:
								(op_dec==6'b010000) ? 1'b0:
								(op_dec==6'b010001) ? 1'b0:
								(op_dec==6'b010100) ? 1'b0:
								(op_dec==6'b010101) ? 1'b0:
								(op_dec==6'b010110) ? zero:
								(op_dec==6'b010111) ? 1'b0:
								(op_dec==6'b011000) ? 1'b0:
								(op_dec==6'b011001) ? zero:
								(op_dec==6'b011010) ? zero:
								(op_dec==6'b011011) ? zero:
								(op_dec==6'b011100) ? flag_prv:
								(op_dec==6'b011101) ? flag_prv:
								(op_dec==6'b011110) ? flag_prv:
								(op_dec==6'b011111) ? flag_prv:1'b0;
								
    // assigining outputs of the  ALU to the temporary wire and then storing in register
  	 assign temp1 = (reset==1) ? ans_tmp : 16'b0;   
	 assign temp2 = (reset==1) ? flag_ex : 2'b0;							  
	 assign temp3 = (reset==1) ? data_out_buff : 16'b0;
	 
	

	always @(posedge clk)
	begin
		 
		 ans_ex <= temp1;				
		 flag_prv <= temp2;		 
		 data_out <= temp3;
		 DM_data <= B;

	end
	
endmodule
