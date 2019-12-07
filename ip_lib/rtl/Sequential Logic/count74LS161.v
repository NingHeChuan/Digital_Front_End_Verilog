`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:20 10/16/2016 
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
module count(clk_50M, clk_1, rst_n, LD, ct_t, ct_p, D, co, Q
    );
	 input clk_50M, rst_n;//clk_50M输入为50Mhz的时钟信号
	 input LD;//LD为0置数LD为1加法计数
	 input ct_t, ct_p;//计数控制端其中有一个为0停止计数
	 input [3:0] D;//置数端
	 output reg clk_1 = 0;//分频成1hz的时钟信号
	 output reg [3:0] Q = 4'b0000;//用于计数
	 output reg co = 0;//进位输出端
	 
	 reg [25:0] cnt;
	 
	 parameter TIME = 26'd2;
	 
	 always @(posedge clk_50M or negedge rst_n)//将50Mhz分频成1hz
	 begin
		if(!rst_n)
			cnt <= 0;
		else if(cnt == TIME - 1'b1)
		begin
			cnt <= 0;
			clk_1 <= ~clk_1;
		end
		else
			cnt <= cnt + 1'b1;
	 end
	 
	 always @(posedge clk_1 or negedge rst_n)//74LS161
	 begin
		if(!rst_n)
			Q <= 0;
		else if(LD == 0)//LD=0置数
			Q <= D;
		else if(LD == 1)//LD=1计数
		begin
			if(!ct_t)
				co <= 0;
			else if(!ct_p)
				co <= Q[3]&Q[2]&Q[1]&Q[0];//触发器保持
			else 
				Q <= Q + 1;
		end
	 end
	 
endmodule
