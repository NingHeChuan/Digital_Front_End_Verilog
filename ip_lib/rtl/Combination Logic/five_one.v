`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:45:54 09/17/2016 
// Design Name: 
// Module Name:    five_one 
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
module five_one(sel, d0, d1, d2, d3, d4, y
    );
	 input [2:0] sel;
	 input  d0, d1, d2, d3, d4;
	 output reg y;
	 always @(*)
	 begin
		case(sel)
		3'b000:	y = d0;
		3'b001:	y = d1;
		3'b010:	y = d2;
		3'b011:	y = d3;
		3'b100:	y = d4;
		default: y = 1'bx;
		endcase
	 end
endmodule
