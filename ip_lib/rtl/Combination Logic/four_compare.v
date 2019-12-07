`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:14 09/30/2016 
// Design Name: 
// Module Name:    four 
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
module four(a, b, agb, asb, aeb
    );//g代表大于s代表小于e代表等于
	 input [3:0] a, b;
	 output reg agb, asb, aeb;
	 always @(*)
	 begin
		if(a > b) agb = 1;
		else  agb = 0;
		if(a < b) asb = 1;
		else asb = 0;
		if(a == b) aeb = 1;
		else aeb = 0;
	 end

endmodule
