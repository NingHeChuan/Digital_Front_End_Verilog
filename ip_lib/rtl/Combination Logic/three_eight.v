`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:04 08/14/2016 
// Design Name: 
// Module Name:    three_eight 
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
module three_eight(m, y
    );
	 input wire[2:0] m;
	 output reg[7:0] y;
	 reg move;
	 always @(*)
		begin
			move = 1;
			y = ~(move << m);
		end
endmodule
