`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:34:01 01/30/2017 
// Design Name: 
// Module Name:    cpu 
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
module cpu(
			input mclk,
			input rst_n,
			input clock,//闹钟
			input sel,//秒表切换
			//时钟
     	input [2:0] a1,
     	input [3:0] a2,
     	input [2:0] a3,
     	input [3:0] a4,
     	//闹钟        ,
     	input [2:0] b1,
     	input [3:0] b2,
     	input [2:0] b3,
     	input [3:0] b4,
     	//秒表        ,
     	input [2:0] c1,
     	input [3:0] c2,
     	input [2:0] c3,
     	input [3:0] c4,
     	//输出
     	output reg [2:0] d1,
     	output reg [3:0] d2,
     	output reg [2:0] d3,
     	output reg [3:0] d4
    );
    
  	always @(*)
		begin
			if(sel == 1)begin//如果秒表的开关为1，秒表信号输入给数码管
				d1 <= c1;
				d2 <= c2;
				d3 <= c3;
				d4 <= c4;
			end
			else if(clock == 1)begin//如果clock为1，闹钟信号输入输入给数码管
				d1 <= b1;
				d2 <= b2;
				d3 <= b3;
				d4 <= b4;
			end
			else begin//否则时钟信号输入给数码管
				d1 <= a1;
				d2 <= a2;
				d3 <= a3;
				d4 <= a4;
			end
		end


endmodule
