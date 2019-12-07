`timescale      1ns/1ps
// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.cnblogs.com/ninghechuan/
// File Name    : Regfile.v
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
// 2018/4/9    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

module Regfile(
    input               clk,
    input               rst_n,
    input               wren,           //往寄存器堆中写入数据使能
    input       [4:0]   rd_addra,       //
    input       [4:0]   rd_addrb,       //
    input       [4:0]   wr_addrd,
    input       [31:0]  wr_data,        
    output      [31:0]  rd_douta,
    output      [31:0]  rd_doutb   
);

integer i;
reg     [31:0]  register[1:31];//寄存器0永远是0，所以不用定义
//-------------------------------------------------------
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        for(i = 1; i < 32; i = i + 1)
            register[i] <= 32'b00000000_00000000_00000000_00000000;
    end
    else if((wren == 1'b1) && (wr_addrd != 'd0))
        register[wr_addrd] <= wr_data;
end

assign  rd_douta = (rd_addra == 'd0)? 'd0: register[rd_addra];
assign  rd_doutb = (rd_addrb == 'd0)? 'd0: register[rd_addrb];

endmodule
