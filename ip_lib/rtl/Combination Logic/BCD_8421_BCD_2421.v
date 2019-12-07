`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:47 09/30/2016 
// Design Name: 
// Module Name:    BCD_8421_BCD_2421 
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
module BCD_8421_BCD_2421(a, y
    );
	 input [3:0] a;
	 output [3:0] y;
	 assign y[3] = a[3]&~a[2] | a[2]&a[1] | a[2]&a[0];
	 assign y[2] = a[3]&~a[2] | a[2]&a[1] | a[2]&~a[1]&~a[0];
	 assign y[1] = a[3]&~a[2] | ~a[3]&~a[2]&a[1] | a[2]&~a[1]&a[0];
	 assign y[0] = ~a[3]&a[0] | a[3]&a[0];
endmodule

