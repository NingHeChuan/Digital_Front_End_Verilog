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
// 2018/5/5    NingHeChuan       1.0                     Original
//  
// *********************************************************************************
`define     ALUC_NOP    4'b0000
`define     ALUC_ADD    4'b0001
`define     ALUC_SUB    4'b0010
`define     ALUC_AND    4'b0011
`define     ALUC_OR     4'b0100
`define     ALUC_XOR    4'b0101
`define     ALUC_LUI    4'b0110
`define     ALUC_SLL    4'b0111
`define     ALUC_SRL    4'b1000
`define     ALUC_SRA    4'b1001

//`define     DATA_WIDTH  8   //just test
`define     DATA_WIDTH  4   

`define     KEY_WIDTH    1        //按键位宽
`define     DELAY_STOP  1000_000 //延时20ms
//`define DELAY_STOP   100//just test
