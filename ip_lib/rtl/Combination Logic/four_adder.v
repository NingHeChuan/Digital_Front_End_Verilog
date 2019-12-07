`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:13 09/30/2016 
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
module four(a, b, c1, sum, c2
    
	);
		
	input wire[3:0] a, b;
		
	input c1;//c1为低位二进制数相加的进位输出到本位的输入

	output wire[3:0] sum;
		
	output 	c2;//c2位a，b，c1相加像高位的进位输出
		
	assign {c2, sum} = a+b+c1;


endmodule

