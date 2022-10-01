`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:46 04/27/2021 
// Design Name: 
// Module Name:    mult129 
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
module mult129(
    A,
	 B,
	 clk,
	 reset,
	 result
    );
	 
	 input [128:0] A;
	 input [128:0] B;
	 input clk;
	 input reset;
	 output reg [257:0] result;
	 //output [257:0] result;
	 
	 wire [63:0] AS0, BS0;
	 wire [64:0] AS1, BS1;
	 
	 wire [127:0] AS0BS0;
	 wire [129:0] AS1BS1;
	 wire [131:0] ASSBSS;
	 wire [65:0]  ASS, BSS;
	 
	 assign AS0 = A[63:0];
	 assign AS1 = A[128:64];
	 assign BS0 = B[63:0];
	 assign BS1 = B[128:64];
	 
	 assign ASS = AS0 + AS1;
	 assign BSS = BS0 + BS1;
	 
	 mult64 m64_u1(
			.Ai(AS0),
			.Bi(BS0),
			.clk(clk),
			.reset(),
			.result(AS0BS0)
			);
			
	 mult65 m65_u1(
			.Ai(AS1),
			.Bi(BS1),
			.clk(clk),
			.reset(),
			.result(AS1BS1)
			);
			
	 mult66 m66_u1(
			.Ai(ASS),
			.Bi(BSS),
			.clk(clk),
			.reset(),
			.result(ASSBSS)
			);
			
	 wire [130:0] sumM64M65;
	 assign sumM64M65 = AS0BS0 + AS1BS1;
	 
	 wire [132:0] midTerm;
	 assign midTerm = ASSBSS - sumM64M65;
	 
	 //assign result = {AS1BS1, AS0BS0} + {midTerm, 64'b0};
///*
always @(posedge clk)begin
	result <= {AS1BS1, AS0BS0} + {midTerm, 64'b0};
end	
//*/
endmodule
