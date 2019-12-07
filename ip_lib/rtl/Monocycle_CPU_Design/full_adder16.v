`timescale      1ns/1ps
// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.cnblogs.com/ninghechuan/
// File Name    : full_adder16.v
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

module full_adder16(
    input           [15:0]  dina,
    input           [15:0]  dinb,
    input                   cin,
    output          [15:0]  sum,
    output                  cout,
    output          [3:0]   G,
    output          [3:0]   P

);

wire    [15:0]  p;
wire    [15:0]  g;
wire    [3:0]   C;

assign  G[0] = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0];
assign  G[1] = g[7] | p[7] & g[6] | p[7] & p[6] & g[5] | p[7] & p[6] & p[5] & g[4];
assign  G[2] = g[11] | p[11] & g[10] | p[11] & p[10] & g[9] | p[11] & p[10] & p[9] & g[8];
assign  G[3] = g[15] | p[15] & g[14] | p[15] & p[14] & g[13] | p[15] & p[14] & p[13] & g[12];

assign  P[0] = p[3] & p[2] & p[1] & p[0];
assign  P[1] = p[7] & p[6] & p[5] & p[4];
assign  P[2] = p[11] & p[10] & p[9] & p[8];
assign  P[3] = p[15] & p[14] & p[13] & p[12];

assign  C[0] = G[0] | P[0] & cin;
assign  C[1] = G[1] | P[1] & G[0] | P[1] & P[0] & cin;
assign  C[2] = G[2] | P[2] & G[1] | P[2] & P[1] & G[0] | P[2] & P[1] & P[0] & cin;
assign  C[3] = G[3] | P[3] & G[2] | P[3] & P[2] & G[1] | P[3] & P[2] & P[1] & G[0] | P[3] & P[2] & P[1] & P[0] & cin;

assign  cout = C[3];

full_adder4 full_adder4_inst0(
     .dina      (dina[3:0]),
     .dinb      (dinb[3:0]),
     .cin       (cin),
     .sum       (sum[3:0]),
     .co        (),
     .p         (p[3:0]),
     .g         (g[3:0])
);

full_adder4 full_adder4_inst1(
     .dina      (dina[7:4]),
     .dinb      (dinb[7:4]),
     .cin       (C[0]),
     .sum       (sum[7:4]),
     .co        (),
     .p         (p[7:4]),
     .g         (g[7:4])
);

full_adder4 full_adder4_inst2(
     .dina      (dina[11:8]),
     .dinb      (dinb[11:8]),
     .cin       (C[1]),
     .sum       (sum[11:8]),
     .co        (),
     .p         (p[11:8]),
     .g         (g[11:8])
);

full_adder4 full_adder4_inst3(
     .dina      (dina[15:12]),
     .dinb      (dinb[15:12]),
     .cin       (C[2]),
     .sum       (sum[15:12]),
     .co        (),
     .p         (p[15:12]),
     .g         (g[15:12])
);

endmodule 
