`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:18:56 08/11/2016 
// Design Name: 
// Module Name:    voter3 
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
module voter3(a, b, c, f
    );
	 input a, b, c;
	 output f;
	 assign f = (a&b)|(a&c)|(b&c);
	 
endmodule
