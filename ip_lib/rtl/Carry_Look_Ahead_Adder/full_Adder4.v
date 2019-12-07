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

assign  p = dina ^ dinb;
assign  g = dina & dinb;

assign  sum[0] = p[0] ^ cin;
assign  sum[1] = p[1] ^ (g[0] | p[0] & cin);
assign  sum[2] = p[2] ^ (g[1] | p[1] & (g[0] | p[0] & cin));
assign  sum[3] = p[3] ^ (g[2] | p[2] & (g[1] | p[1] & (g[0] | p[0] & cin)));
assign  co     = g[3] | p[3] & (g[2] | p[2] & (g[1] | p[1] & (g[0] | p[0] & cin)));

endmodule
