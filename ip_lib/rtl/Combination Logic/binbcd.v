`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:43 10/29/2016 
// Design Name: 
// Module Name:    binbcd 
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
module binbcd(in, out
    );
	 input [13:0] in;//十进制9999的二进制为14位
	 output reg [16:0] out;//十进制9999的二进制BCD码为16位，out的位宽根据输入in的位宽表示的最大十进制数来设定最大位宽
	 
	 /*
	 z作为存储BCD码和进制码的寄存器
	 如果输入为14位， 输出为17位
	 */
	 reg [30:0] z;
	 
	 always @(*)
	 begin
		z = 30'b0;
		z[13:0] = in;
		repeat(14)//多少位二进制数移位多少次
		begin
			if(z[17:14] > 4)//个位大于4，加3
				z[17:14] = z[17:14] +2'b11;
			if(z[21:18] > 4)//十位大于4，加3
				z[21:18] = z[21:18] + 2'b11;
			if(z[25:22] > 4)//百位大于4，加3
				z[25:22] = z[25:22] + 2'b11;
			if(z[29:26] > 4)//千位大于4，加3
				z[29:26] = z[29:26] + 2'b11;
			z[30:1] = z[29:0];//循环移位
		end
		out = z[30:14];
	 end
	 
	

endmodule
