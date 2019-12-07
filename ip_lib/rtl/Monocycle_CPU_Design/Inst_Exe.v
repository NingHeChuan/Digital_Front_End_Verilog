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

module Inst_Exe(
    //input signal 
    input           [31:0]  pc_cnt,
    input           [1:0]   pcsource,
    input                   alumm,
    input                   mtoreg,
    input                   shift,
    input                   jal,
    input           [31:0]  shift_data,
    input           [27:0]  addr_data,
    input           [31:0]  imm_data,
    //data_mem signal
    input           [31:0]  dout_mem,
    input           [31:0]  alu_doutr,
    //regfile signal 
    input           [31:0]  rd_douta,
    input           [31:0]  rd_doutb,
    //output signal 
    output      reg [31:0]  pc_return,
    output          [31:0]  alu_dinb,
    output          [31:0]  alu_dina,
    output      reg    [31:0]  wr_data         //write regfile data
    
);


//-------------------------------------------------------
//pc_return
always @(*)begin
    case(pcsource)
    2'b00: pc_return = pc_cnt + 4;
    2'b01: pc_return = (imm_data << 2) + pc_cnt + 4;
    2'b10: pc_return = rd_douta;
    2'b11: pc_return = {pc_cnt[31:28], addr_data};
    default: pc_return = pc_return;
    endcase
end

assign alu_dinb = (alumm == 1'b1)? imm_data: rd_doutb;
assign alu_dina = (shift == 1'b1)? shift_data: rd_douta;
//assign wr_data = (mtoreg == 1'b1)? dout_mem: alu_doutr;

always  @(*)begin
    if(jal == 1'b1)
        wr_data <= pc_cnt + 4;
    else if(mtoreg == 1'b1)
        wr_data <= dout_mem;
    else 
        wr_data <= alu_doutr;
end

endmodule 
