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
// 2018/4/13    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

module Inst_Decode(
    //inst_mem signal
    input           [31:0]  inst_data,
    input                   mtoreg,
    input           [31:0]  alu_doutr,
    input           [31:0]  dout_mem,
    //regfile signal
    output          [4:0]   rd_addra,
    output          [4:0]   rd_addrb,
    output      reg [4:0]   wr_addrd,
    //control unit signal
    input                   regrt,
    input                   jal,
    input                   sext,
    output          [31:0]  shift_data,
    output      reg [31:0]  imm_data,
    output          [31:0]  rd_doutb,
    output          [27:0]  addr_data
);
/*
R型
op = inst_data[31:26]
rs = inst_data[25:21]
rt = inst_data[20:16]
rd = inst_data[15:11]
sa = inst_data[10:6]
func = inst_data[5:0]
I型
op = inst_data[31:26]
rs = inst_data[25:21]
rt = inst_data[20:16]
imm = inst_data[15:0]
J型
op = inst_data[31:26]
addr = inst_data[25:0]
*/
//-------------------------------------------------------
//wr_addrd
always  @(*)begin
     if(jal == 1'b1)
        wr_addrd = 5'b11111;
    else if(regrt == 1'b1)
        wr_addrd = inst_data[20:16];
    else if(regrt == 1'b0)
        wr_addrd = inst_data[15:11];
    else 
        wr_addrd = wr_addrd;
end

assign rd_addra = inst_data[25:21];
assign rd_addrb = inst_data[20:16];
assign addr_data = {inst_data[25:0], 2'b00};
assign shift_data = {27'b0, inst_data[10:6]};

//-------------------------------------------------------
//rd_doutb
//assign  rd_doutb = (mtoreg == 1'b1)? dout_mem: alu_doutr;

//-------------------------------------------------------
//imm_data
always  @(*)begin
    if(sext == 1'b1)//符号扩展
        imm_data = {{16{inst_data[15]}}, inst_data[15:0]};
    else
        imm_data = {16'b0, inst_data[15:0]};
end


endmodule 
