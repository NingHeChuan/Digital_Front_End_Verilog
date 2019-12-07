`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:24 10/27/2016 
// Design Name: 
// Module Name:    register 
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
module register(clk, rst_n, q, in//四位右移位寄存器，输入一位移一位
    );
	 input clk, rst_n, in;
	 output reg [3:0] q;
	
	 always @(posedge clk or negedge rst_n)
	 begin
		if(!rst_n)
			q <= 0;
		else
		begin
			q[3] <= in;
			q[2:0] <= q[3:1];
		end
	 end
endmodule
