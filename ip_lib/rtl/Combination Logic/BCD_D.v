`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:05:47 10/01/2016 
// Design Name: 
// Module Name:    BCD_D 
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
module BCD_D(A3, A2, A1, A0, out
    );
	 input A3, A2, A1, A0;
	 output reg out;
	 always @(*)
	 begin
		if({A3, A2, A1, A0}>5)
			out = 1;
		else
			out = 0;
	 end


endmodule
