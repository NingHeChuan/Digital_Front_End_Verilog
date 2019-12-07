`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:47 08/08/2016 
// Design Name: 
// Module Name:    adder_one 
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
module adder_one(a, b, c1, sum, c2
    );
	 input wire a, b, c1;
	 output wire c2,sum;
	 assign sum = a^~b^~c1;
	 assign c2 = (a&b)|(b&c1)|(a&c1); 
	 
endmodule