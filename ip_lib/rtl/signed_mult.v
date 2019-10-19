// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.ninghechuan.com/
// File Name    : .v
// Module Name  :
// Called By    :
// Abstract     :
//
// CopyRight(c) 2019, NingHeChuan Studio.. 
// All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date         By              Version                 Change Description
// -----------------------------------------------------------------------
// 2019/10/19    NingHeChuan       1.0                     Original
//  
// *********************************************************************************
module signed_mult(/*autoarg*/
   // Outputs
   product,
   // Inputs
   multa, multb
   );

parameter   A_WIDTH = 0;
parameter   B_WIDTH = 0;
localparam  C_WIDTH = A_WIDTH + B_WIDTH;

input   signed  [A_WIDTH - 1:0]     multa;
input   signed  [B_WIDTH - 1:0]     multb;
output  signed  [C_WIDTH - 1:0]     product;

assign product = multa * multb;

/*
input     [A_WIDTH - 1:0]     multa;
input     [B_WIDTH - 1:0]     multb;
output    [C_WIDTH - 1:0]     product;

wire    signed [C_WIDTH - 1:0] c_sgn;

assign c_sgn = $signed(multa) * $sigend(multb);
assign product = $unsigned(c_sgn);
*/

endmodule 
