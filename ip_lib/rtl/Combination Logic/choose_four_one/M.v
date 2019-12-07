`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:17 09/17/2016 
// Design Name: 
// Module Name:    M 
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
module M(a, b, f
    );
	 input a, b;
	 output f;
	 four_one N(.a(a), .b(b), .f(f), .d0(0), .d1(1), .d2(1), .d3(0));
endmodule
