`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:51:35 08/21/2016 
// Design Name: 
// Module Name:    BCD_5121_8421 
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
module BCD_5121_8421(a, b
    );
	 input [3:0] a;
	 output [3:0] b;
	 assign b[0] = ~a[3]&~a[2]&a[0] | a[3]&~a[2] | a[3]&a[0];
	 assign b[1] = ~a[3]&~a[2]&a[1] | a[2]&~a[1];
	 assign b[2] = ~a[3]&a[2] | a[2]&~a[1];
	 assign b[3] = a[3]&a[1];


endmodule
