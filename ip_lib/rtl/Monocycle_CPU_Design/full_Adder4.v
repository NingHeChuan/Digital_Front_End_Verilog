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
// 2018/4/3    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

module full_adder4(
    input       [3:0]   dina,
    input       [3:0]   dinb,
    input               cin,
    output      [3:0]   sum,
    output              co,
    output      [3:0]   p,
    output      [3:0]   g
);

wire    [4:0]   c;
assign c[0] = cin;
assign  p = dina | dinb;
assign  g = dina & dinb;

assign  c[1] = g[0] | p[0] & c[0];
assign  c[2] = g[1] | p[1] & g[0] | p[1] & p[0] & c[0];
assign  c[3] = g[2] | p[2] & g[1] | p[2] & p[1] & g[0] | p[2] & p[1] & p[0] & c[0];
assign  c[4] = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0] | p[3] & p[2] & p[1] & p[0] & c[0];

assign  sum[0] = dina[0] ^ dinb[0] ^ cin;
assign  sum[1] = dina[1] ^ dinb[1] ^ c[1];
assign  sum[2] = dina[2] ^ dinb[2] ^ c[2];
assign  sum[3] = dina[3] ^ dinb[3] ^ c[3];

assign  co  = c[4];

endmodule
