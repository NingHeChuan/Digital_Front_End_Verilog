`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:21:21 10/01/2016 
// Design Name: 
// Module Name:    BCD_8421_BCD_3 
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
module BCD_8421_BCD_3(sel, in, out
    );//sel为选择信号，0为8421转化为余3码，1为余3码转化8421码
	 input [3:0] in;
	 input sel;
	 output reg [3:0] out;
	 always @(*)
	 begin
		if(!sel)
			out = in + 4'b0011;
		else
			out = in - 4'b0011;
	 end


endmodule
