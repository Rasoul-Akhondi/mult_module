`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:59 04/27/2021 
// Design Name: 
// Module Name:    mult_module 
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
module mult_module(
	 x1,
	 y1,
	 x2,
	 y2,
	 clk,
	 reset,
	 resultreg
    );
	 input [254:0] x1;
	 input [254:0] y1;
	 input [254:0] x2;
	 input [254:0] y2;
	 input clk;
	 input reset;
	 output reg [511:0] resultreg;
	 //output [511:0] result;
	 
	 wire [255:0] A;
	 wire [255:0] B;
	///* 
	 reg [254:0] x1reg;
	 reg [254:0] y1reg;
	 reg [254:0] x2reg;
	 reg [254:0] y2reg;
	 
	 reg [254:0] x6reg;
	 reg [254:0] x7reg;
	 reg [254:0] x8reg;
	 reg [254:0] x9reg;
	 reg [254:0] x10reg;
	 reg [254:0] x11reg;
	 reg [254:0] x12reg;
	 reg [254:0] x13reg;
	 reg [254:0] x14reg;
	 reg [254:0] x15reg;
	 reg [254:0] x16reg;
	 reg [254:0] x17reg;
	 reg [254:0] x18reg;
	 reg [254:0] x19reg;
	 reg [254:0] x20reg;
	 reg [254:0] x21reg;
	 reg [254:0] x22reg;
	 reg [254:0] x23reg;
	 reg [254:0] x24reg;
	 reg [254:0] x25reg;
	 reg [254:0] x26reg;
	 reg [254:0] x27reg;
	 reg [254:0] x28reg;
	 reg [254:0] x29reg;
	 reg [254:0] x30reg;
	 reg [254:0] x31reg;
	 reg [254:0] x32reg;
	 reg [254:0] x33reg;
	 reg [254:0] x34reg;
	 reg [254:0] x35reg;
	 reg [254:0] x36reg;
	 reg [254:0] x37reg;
	 reg [254:0] x38reg;
	 reg [254:0] x39reg;
	 reg [254:0] x40reg;
	 reg [254:0] x41reg;
	 reg [254:0] x42reg;
	 reg [254:0] x43reg;
	 //*/
	 
	 wire [511:0] result;
	 ///*
	 always @(posedge clk)
	 begin
	 
	 x1reg <= x1;
	 y1reg <= y1;
	 x2reg <= x2;
	 y2reg <= y2;
	 
	 x6reg <= x1;
	 x7reg <= y1;
	 x8reg <= x2;
	 x9reg <= y2;
	 x10reg <= x1;
	 x11reg <= y1;
	 x12reg <= x2;
	 x13reg <= y2;
	 x14reg <= x1;
	 x15reg <= x2;
	 x16reg <= y1;
	 x17reg <= y2;
	 x18reg <= x1;
	 x19reg <= y1;
	 x20reg <= y2;
	 x21reg <= x1;
	 x22reg <= x2;
	 x23reg <= y1;
	 x24reg <= y2;
	 x25reg <= x1;
	 x26reg <= x2;
	 x27reg <= y1;
	 x28reg <= y2;
	 x29reg <= x1;
	 x30reg <= x2;
	 x31reg <= y1;
	 x32reg <= y2;
	 x33reg <= x1;
	 x34reg <= x2;
	 x35reg <= y1;
	 x36reg <= y2;
	 x37reg <= x1;
	 x38reg <= x2;
	 x39reg <= y1;
	 x40reg <= y2;
	 x41reg <= result;
	 x42reg <= result;
	 x43reg <= result;
	 
	
	resultreg <= result;
	 
	 end
	 //*/
	 
	 
	 
	 assign A = x1reg + y1reg;
	 assign B = x2reg + y2reg;
	 
	 mult256 m256_u1(
			.A(A),
			.B(B),
			.clk(clk),
			.reset(),
			.result(result)
			);
	 
	 


endmodule
