`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:20 09/27/2016 
// Design Name: 
// Module Name:    mult 
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
module mult(x, y, result
    );
	 parameter size = 2, longsize = 4;
 	 input [size:1] x, y;
	 output reg[longsize:1] result;
	 reg [longsize:1] shift_x, shift_y;
	 always @(*)
	 begin
	 shift_x = x;
	 shift_y = y;
	 result = 0;
	 repeat(size)
		begin
			if(shift_y[1])
				result = result + shift_x;
			shift_x = shift_x<<1;
			shift_y = shift_y>>1;
		end
	 end
endmodule
/*module mult(x, y, result
    );
	 input [1:0] x, y;
	 output [3:0] result;
	 assign result = x * y;
endmodule*/

