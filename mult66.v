`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:29 05/02/2021 
// Design Name: 
// Module Name:    mult66 
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
module mult66(
    Ai,
	 Bi,
	 clk,
	 reset,
	 result
    );
	 
	 input [65:0] Ai;
	 input [65:0] Bi;
	 //input [65:0] A;
	 //input [65:0] B;
	 
	  reg [65:0] A;
	  reg [65:0] B;
	 
	 input clk;
	 input reset;
	 output reg [131:0] result;
	 //output [131:0] result;
	 
	 wire [32:0] A0, B0, A1, B1;
	 wire [65:0] A0B0, A1B1;
	 wire [33:0] AS, BS;
	 wire [67:0] ASBS;
	 
	 assign A0 = A[32:0];
	 assign A1 = A[65:33];
	 assign B0 = B[32:0];
	 assign B1 = B[65:33];
	 
	 assign AS = A0 + A1;
	 assign BS = B0 + B1;
	 
	 mult33 m33_u1(
			.A(A0),
			.B(B0),
			.clk(clk),
			.reset(),
			.result(A0B0)
			);
			
	 mult33 m33_u2(
			.A(A1),
			.B(B1),
			.clk(clk),
			.reset(),
			.result(A1B1)
			);

	 mult34 m34_u1(
			.A(AS),
			.B(BS),
			.clk(clk),
			.reset(),
			.result(ASBS)
			);
			
	 wire [66:0] sumM33;
	 assign sumM33 = A0B0 + A1B1;
	 
	 wire [68:0] midTerm;
	 assign midTerm = ASBS - sumM33;
	 
	  always @(posedge clk)begin
			result <= {A1B1, A0B0} + {midTerm, 33'b0};
		   A <= Ai;
			B <= Bi;
		
	 end
	

	
// assign result = {A1B1, A0B0} + {midTerm, 33'b0};


endmodule
