`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:17 08/12/2016 
// Design Name: 
// Module Name:    five_voter 
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
module five_voter(a, b, c, d, e, f
    );
	 input a, b, c, d, e;
	 output f;
	 assign f = (a|e)&(d|c)&b | c&(b|e)&(a|d) | a&e&(b|d);
	 
endmodule
