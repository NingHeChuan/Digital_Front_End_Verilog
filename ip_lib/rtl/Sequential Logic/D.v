`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:40 09/18/2016 
// Design Name: 
// Module Name:    D 
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
module D(rst, clk, D, Q, Qn
    );
	 input D, clk, rst;
	 output Q, Qn;
	 reg Q;
	 assign Qn = ~Q;
	 always @(posedge clk or negedge rst)
	 begin
		if(!rst)
			Q <= 0;
		else
			Q <= D;
		
	end
	
endmodule
