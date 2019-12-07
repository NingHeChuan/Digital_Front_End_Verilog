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

module full_adder64(
    input           [63:0]  dina,
    input           [63:0]  dinb,
    input                   cin,
    output          [63:0]  sum,
    output                  cout,
    output          [3:0]   G,
    output          [3:0]   P
);
wire    [15:0]  p;
wire    [15:0]  g;
wire    [3:0]   C;

assign  G[0] = g[3] | p[3] & g[2] | p[3] & p[2] & p[1] | p[3] & p[2] & p[1] & g[0];
assign  G[1] = g[7] | p[7] & g[6] | p[7] & p[6] & p[5] | p[7] & p[6] & p[5] & g[4];
assign  G[2] = g[11] | p[11] & g[10] | p[11] & p[10] & p[9] | p[11] & p[10] & p[9] & g[8];
assign  G[3] = g[15] | p[15] & g[14] | p[15] & p[14] & p[13] | p[15] & p[14] & p[13] & g[12];

assign  P[0] = p[3] & p[2] & p[1] & p[0];
assign  P[1] = p[7] & p[6] & p[5] & p[4];
assign  P[2] = p[11] & p[10] & p[9] & p[8];
assign  P[3] = p[15] & p[14] & p[13] & p[12];

assign  C[0] = G[0] | P[0] & cin;
assign  C[1] = G[1] | P[1] & cin;
assign  C[2] = G[2] | P[2] & cin;
assign  C[3] = G[3] | P[3] & cin;

assign  cout = C[3];

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
     .cout        (),
     .P         (p[7:4]),
     .G         (g[7:4])
);

full_adder16 full_adder16_inst2(
     .dina      (dina[47:32]),
     .dinb      (dinb[47:32]),
     .cin       (C[1]),
     .sum       (sum[47:32]),
     .cout        (),
     .P         (p[11:8]),
     .G         (g[11:8])
);

full_adder16 full_adder16_inst3(
     .dina      (dina[63:48]),
     .dinb      (dinb[63:48]),
     .cin       (C[2]),
     .sum       (sum[63:48]),
     .cout        (),
     .P         (p[15:12]),
     .G         (g[15:12])
);



endmodule
