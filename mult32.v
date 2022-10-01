`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:04 05/02/2021 
// Design Name: 
// Module Name:    mult32 
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
module mult32(
    A,
	B,
	clk,
	reset,
	result
    );
	 
	input [31:0] A;
	input [31:0] B;
	input clk;
	input reset;
	output [63:0] result;

	wire [15:0] A0, A1, B0, B1;
	reg [31:0] A0B0, A1B1;
	//wire [31:0] A0B0, A1B1;
	wire [16:0] AS, BS;
	reg [33:0] ASBS;
	//wire [33:0] ASBS;

	assign A0 = A[15:0];
	assign A1 = A[31:16];
	assign B0 = B[15:0];
	assign B1 = B[31:16];

	assign AS = A0 + A1;
	assign BS = B0 + B1;
	
	//assign A0B0 = A0 * B0;

	 //assign A1B1 = A1 * B1;

	 //assign ASBS = AS * BS;

///*
always @(posedge clk)begin
	 A0B0 <= A0 * B0;

	 A1B1 <= A1 * B1;

	 ASBS <= AS * BS;
	 
	 //result <= {A1B1, A0B0} + {midTerm, 16'b0};
	end
	//*/

	wire [32:0] sumM16;
	assign sumM16 = A0B0 + A1B1;

	wire [34:0] midTerm;
	assign midTerm = ASBS - sumM16;

	assign result = {A1B1, A0B0} + {midTerm, 16'b0};

endmodule
