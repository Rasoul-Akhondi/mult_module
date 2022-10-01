`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:42 04/28/2021 
// Design Name: 
// Module Name:    mult65 
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
module mult65(
    Ai,
	 Bi,
	 clk,
	 reset,
	 result
    );
	 
	 input [64:0] Ai;
	 input [64:0] Bi;
	 //input [64:0] A;
	 //input [64:0] B;
	 
	  reg [64:0] A;
	  reg [64:0] B;
	 
	 
	 input clk;
	 input reset;
	 output reg  [129:0] result;
	 //output  [129:0] result;
	 
	 wire [31:0] A0, B0;
	 wire [32:0] A1, B1;
	 wire [63:0] A0B0;
	 wire [65:0] A1B1;
	 wire [33:0] AS, BS;
	 wire [67:0] ASBS;
	 
	 assign A0 = A[31:0];
	 assign A1 = A[64:32];
	 assign B0 = B[31:0];
	 assign B1 = B[64:32];
	 
	 assign AS = A0 + A1;
	 assign BS = B0 + B1;
	 
	 mult32 m32_u1(
			.A(A0),
			.B(B0),
			.clk(clk),
			.reset(),
			.result(A0B0)
			);
			
	 mult33 m33_u1(
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
			
	 wire [66:0] sumM32M33;
	 assign sumM32M33 = A0B0 + A1B1;
	 
	 wire [68:0] midTerm;
	 assign midTerm = ASBS - sumM32M33;
	 
	 
	  always @(posedge clk)begin
			result <= {A1B1, A0B0} + {midTerm, 32'b0};
			A <= Ai;
			B <= Bi;
	 end
	 
	 //assign result = {A1B1, A0B0} + {midTerm, 32'b0};
	


endmodule
