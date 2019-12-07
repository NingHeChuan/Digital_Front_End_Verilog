`timescale      1ns/1ps
// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.cnblogs.com/ninghechuan/
// File Name    : .v
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

module Program_Count(
    input                   clk,
    input                   rst_n,
    input           [31:0]  pc_return,
    input           [1:0]   pcsource,
    output        [31:0]  pc_addr,
    output      reg [31:0]  pc_cnt

);
//-------------------------------------------------------
//pc_addr
/*
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        pc_addr <= 32'd0;
    else 
        pc_addr <= pc_return >> 2;
end*/
 

always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        pc_cnt <= 32'd0;
    else
        pc_cnt <= pc_return;
end



assign pc_addr = pc_cnt[31:2];

endmodule 
