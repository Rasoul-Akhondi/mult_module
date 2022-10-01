`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:15 05/02/2021 
// Design Name: 
// Module Name:    mult33 
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
module mult33(
   A,
	B,
	clk,
	reset,
	result
    );
	 
	input [32:0] A;
	input [32:0] B;
	input clk;
	input reset;
	output [65:0] result;

	wire [15:0] A0, B0;
	wire [16:0] A1, B1;
	reg [31:0] A0B0;
	reg [33:0] A1B1;
	//wire [31:0] A0B0;
	//wire [33:0] A1B1;
	wire [17:0] AS, BS;
	reg [35:0] ASBS;
	//wire [35:0] ASBS;

	assign A0 = A[15:0];
	assign A1 = A[32:16];
	assign B0 = B[15:0];
	assign B1 = B[32:16];

	assign AS = A0 + A1;
	assign BS = B0 + B1;
	
	 //assign A0B0 = A0 * B0;

	 //assign A1B1 = A1 * B1;

	// assign ASBS = AS * BS;
///*
always @(posedge clk)begin
	 A0B0 <= A0 * B0;

	 A1B1 <= A1 * B1;

	 ASBS <= AS * BS;
	 
	  //result <= {A1B1, A0B0} + {midTerm, 16'b0};
	end
	//*/

	wire [34:0] sumM16M17;
	assign sumM16M17 = A0B0 + A1B1;

	wire [36:0] midTerm;
	assign midTerm = ASBS - sumM16M17;

	assign result = {A1B1, A0B0} + {midTerm, 16'b0};


endmodule
