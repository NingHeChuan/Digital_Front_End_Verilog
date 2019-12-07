`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:48:33 09/17/2016 
// Design Name: 
// Module Name:    four_one 
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
module four_one(a, b, d0, d1, d2, d3, f
    );
	 input a, b, d0, d1, d2, d3;
	 output f;
	 assign f = ~a&~b&d0 | ~a&b&d1 | a&~b&d2 | a&b&d3;
endmodule
