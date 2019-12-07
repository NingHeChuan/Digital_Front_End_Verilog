`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:44:00 10/06/2016 
// Design Name: 
// Module Name:    count 
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
module count(clk, rst, y
    );
	 input clk, rst;
	 output reg [2:0]y = 3'b111;//三位二进制计数器
	 
	 reg[25:0] cnt;//定义一个26位的计数器用于分频
	 
	 parameter TIME = 26'd50000000;//basys2的系统时钟为50MHZ
	 
	 always @(posedge clk or negedge rst)//分频50MHZ—1HZ
	 begin
		if(!rst)//复位置0
		cnt <= 1'b0;
		else if(cnt == TIME-1)
		cnt <= 1'b0;
		else 
		cnt <= cnt + 1'b1;
	 end
	 
	 always @(posedge clk or negedge rst)//当时钟到1s是开始三位二进制减法计数器
	 begin
		if(!rst)//复位置计数器初始值
		y <= 3'b111;
		else if(cnt == TIME-1)
		y <= y - 3'b001;
		else
		y <= y;	
	 end 
	 
endmodule
