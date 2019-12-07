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
// 2018/4/9    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

`define     ALUC_NOP    4'bxxxx
`define     ALUC_ADD    4'b0000
`define     ALUC_SUB    4'b0001
`define     ALUC_AND    4'b0010
`define     ALUC_OR     4'b0011
`define     ALUC_XOR    4'b0100
`define     ALUC_LUI    4'b0101
`define     ALUC_SLL    4'b0110
`define     ALUC_SRL    4'b0111
`define     ALUC_SRA    4'b1000

//-------------------------------------------------------
//R型指令功能操作选择
`define     FUNC_ADD    6'b100000
`define     FUNC_SUB    6'b100010
`define     FUNC_AND    6'b100100
`define     FUNC_OR     6'b100101
`define     FUNC_XOR    6'b100110
`define     FUNC_SLL    6'b000000
`define     FUNC_SRL    6'b000010
`define     FUNC_SRA    6'b000011
`define     FUNC_JR     6'b001000

//-------------------------------------------------------
//I型指令
`define     OP_ADDI     6'b001000
`define     OP_ANDI     6'b001100
`define     OP_ORI      6'b001101
`define     OP_XORI     6'b001110
`define     OP_LUI      6'b001111
`define     OP_LW       6'b100011
`define     OP_SW       6'b101011
`define     OP_BEQ      6'b000100
`define     OP_BNE      6'b000101
//-------------------------------------------------------
//J型指令
`define     OP_J        6'b000010
`define     OP_JAL      6'b000011
