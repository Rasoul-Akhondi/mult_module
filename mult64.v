`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:28 04/28/2021 
// Design Name: 
// Module Name:    mult64 
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
module mult64(
	 Bi,
    Ai,
	 clk,
	 reset,
	 result
    );
	 
	 input [63:0] Ai;
	 input [63:0] Bi;
	 //input [63:0] A;
	 //input [63:0] B;
	 
	 reg [63:0] A;
	 reg [63:0] B;
	 
	 input clk;
	 input reset;
	 output reg [127:0] result;
	 //output [127:0] result;
	 
	 wire [31:0] A0, B0, A1, B1;
	 wire [63:0] A0B0, A1B1;
	 wire [32:0] AS, BS;
	 wire [65:0] ASBS;
	 
	 assign A0 = A[31:0];
	 assign A1 = A[63:32];
	 assign B0 = B[31:0];
	 assign B1 = B[63:32];
	 
	 assign AS = A0 + A1;
	 assign BS = B0 + B1;
	 
	 mult32 m32_u1(
			.A(A0),
			.B(B0),
			.clk(clk),
			.reset(),
			.result(A0B0)
			);
			
	 mult32 m32_u2(
			.A(A1),
			.B(B1),
			.clk(clk),
			.reset(),
			.result(A1B1)
			);

	 mult33 m33_u1(
			.A(AS),
			.B(BS),
			.clk(clk),
			.reset(),
			.result(ASBS)
			);
			
	 wire [64:0] sumM32;
	 assign sumM32 = A0B0 + A1B1;
	 
	 wire [66:0] midTerm;
	 assign midTerm = ASBS - sumM32;
	 
	 always @(posedge clk)begin
			result <= {A1B1, A0B0} + {midTerm, 32'b0};
			A <= Ai;
			B <= Bi;
	//		BS <= B0 + B1;
		//	AS <= A0 + A1;
		end
		
	 //assign result = {A1B1, A0B0} + {midTerm, 32'b0};

endmodule
