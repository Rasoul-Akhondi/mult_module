`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:58:06 04/27/2021 
// Design Name: 
// Module Name:    mult256 
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
module mult256(
	 A,
	 B,
	 clk,
	 reset,
	 result
    );
	 
	 input [255:0] A;
	 input [255:0] B;
	 input clk;
	 input reset;
	 //output reg [511:0] result;
	 output [511:0] result;
	 
	 wire [255:0] A0B0;
	 wire [255:0] A1B1;
	 wire [257:0] ASBS;
	 
	 wire [128:0] AS;
	 wire [128:0] BS;
	 assign AS = A[127:0] + A[255:128];
	 assign BS = B[127:0] + B[255:128];
	 
	 mult128 m128_u1(
			.A(A[127:0]),
			.B(B[127:0]),
			.clk(clk),
			.reset(),
			.result(A0B0)
			);
			
	 mult128 m128_u2(
			.A(A[255:128]),
			.B(B[255:128]),
			.clk(clk),
			.reset(),
			.result(A1B1)
			);
			
	 mult129 m129_u1(
			.A(AS),
			.B(BS),
			.clk(clk),
			.reset(),
			.result(ASBS)
			);
	 
	 wire	 [258:0] midTerm;
	 assign midTerm = ASBS - A0B0 - A1B1;
	 
	 //always @(posedge clk)begin
	
	  //midTerm <= ASBS - A0B0 - A1B1;
	 //result <= {midTerm, 128'b0} + {A1B1, A0B0};
	//end
	
	 assign result = {midTerm, 128'b0} + {A1B1, A0B0};
	 
endmodule
