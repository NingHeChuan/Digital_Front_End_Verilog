`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:14 08/14/2016 
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
module four_one(a, b, c, d, m, y
    );
	 input a, b, c, d;
	 input wire[1:0] m;
	 output reg y;
	 always @(*)
		begin
			case(m)
				2'b00: y = a;
				2'b01: y = b;
				2'b10: y = c;
				2'b11: y = d;
				endcase
				
		end


endmodule
