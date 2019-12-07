`timescale      1ns/1ps
// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.cnblogs.com/ninghechuan/
// File Name    : Data_Mem.v
// Module Name  :
// Called By    :
// Abstract     :
//
// CopyRight(c) 2018, NingHeChuan Studio.. 
// All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date         By              Version                 Change Description
// -----------------------------------------------------------------------
// 2018/4/14    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

module Data_Mem(
	input				clk,
	input				rst_n,
	input 		[31:0]	data_addr,
	input 		[31:0]	wr_data,
	input				wmem,//写数据存储器使能信号
	output 		[31:0]	dout_mem
    );

reg 	[31:0]	register[0:63];//64x32-bit regs
integer	i;

assign 	dout_mem = register[data_addr];

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		for(i = 0; i < 64; i = i+1)
			register[i] <= 32'b10000000_00000000_00000000_11111111;
	end	
	else if(wmem == 1'b1)
		register[data_addr] <= wr_data;
end


endmodule 
