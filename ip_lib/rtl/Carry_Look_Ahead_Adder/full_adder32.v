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
// 2018/4/4    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

module full_adder32(
    input           [31:0]  dina,
    input           [31:0]  dinb,
    input                   cin,
    output          [31:0]  sum,
    output                  cout,
    output          [1:0]   G,
    output          [1:0]   P

);

wire    [7:0]  p;
wire    [7:0]  g;
wire    [1:0]  C;

assign  G[0] = g[3] | p[3] & g[2] | p[3] & p[2] & p[1] | p[3] & p[2] & p[1] & g[0];
assign  G[1] = g[7] | p[7] & g[6] | p[7] & p[6] & p[5] | p[7] & p[6] & p[5] & g[4];

assign  P[0] = p[3] & p[2] & p[1] & p[0];
assign  P[1] = p[7] & p[6] & p[5] & p[4];

assign  C[0] = G[0] | P[0] & cin;
assign  C[1] = G[1] | P[1] & cin;

assign  cout = C[1];

full_adder16 full_adder16_inst0(
     .dina      (dina[15:0]),
     .dinb      (dinb[15:0]),
     .cin       (cin),
     .sum       (sum[15:0]),
     .cout        (),
     .P         (p[3:0]),
     .G         (g[3:0])
);

full_adder16 full_adder16_inst1(
     .dina      (dina[31:16]),
     .dinb      (dinb[31:16]),
     .cin       (C[0]),
     .sum       (sum[31:16]),
     .cout        (cout),
     .P         (p[7:4]),
     .G         (g[7:4])
);

endmodule 
