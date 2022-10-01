`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:14 04/27/2021 
// Design Name: 
// Module Name:    mult128 
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
module mult128(
    A,
	 B,
	 clk,
	 reset,
	 result
    );
	 
	 input [127:0] A;
	 input [127:0] B;
	 input clk;
	 input reset;
	 output reg [255:0] result;
	 //output [255:0] result;
	 
	 wire [63:0] A00, B00, A01, B01;
	 
	 wire [127:0] A00B00, A01B01;
	 wire [128:0] AS, BS;
	 wire [129:0] ASBS;
	 
	 assign A00 = A[63:0];
	 assign B00 = B[63:0];
	 assign A01 = A[127:64];
	 assign B01 = B[127:64];
	 
	 assign AS = A00 + A01;
	 assign BS = B00 + B01;
	 
	 mult64 m64_u1(
			.Ai(A00),
			.Bi(B00),
			.clk(clk),
			.reset(),
			.result(A00B00)
			);
			
	 mult64 m64_u2(
			.Ai(A01),
			.Bi(B01),
			.clk(clk),
			.reset(),
			.result(A01B01)
			);
			
	 mult65 m65_u1(
			.Ai(AS),
			.Bi(BS),
			.clk(clk),
			.reset(),
			.result(ASBS)
			);
			
	 wire [128:0] sumM64;
	 assign sumM64 = A00B00 + A01B01;
	 
	 wire [130:0] midTerm;
	 assign midTerm = ASBS - sumM64;
	 
	 wire [191:0] z;
	 assign z = midTerm + {A01B01, A00B00[127:64]};
	 
	 //assign result = {z, A00B00[63:0]};
	///*
always @(posedge clk)begin
	result <= {z, A00B00[63:0]};
end	
//*/
endmodule
