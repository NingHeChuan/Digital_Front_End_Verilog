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
   dat_a, dat_b, tc
   );

parameter   A_WIDTH = 8;
parameter   B_WIDTH = 8;
parameter   PRODUCT_WIDTH = A_WIDTH + B_WIDTH;

input   [A_WIDTH-1:0]   dat_a;
input   [B_WIDTH-1:0]   dat_b;
input                   tc;//0:unsigned 1:signed

output  [PRODUCT_WIDTH-1:0] product;

/*autoreg*/
// Beginning of automatic regs (for this module's undeclared outputs)
reg [PRODUCT_WIDTH-1:0] product;
// End of automatics
reg [A_WIDTH-1:0]dat_a_tmp;
reg [B_WIDTH-1:0]dat_b_tmp;
reg [PRODUCT_WIDTH-1:0]product_tmp;
always @(*)begin
        if(tc)begin
            dat_a_tmp[A_WIDTH-1:0] = dat_a[A_WIDTH-1]? (-dat_a): dat_a;
            dat_b_tmp[B_WIDTH-1:0] = dat_b[B_WIDTH-1]? (-dat_b): dat_b;
            product_tmp[PRODUCT_WIDTH-1:0] = dat_a_tmp * dat_b_tmp;
            product[PRODUCT_WIDTH-1:0] = (dat_a[A_WIDTH-1] ^ dat_b[B_WIDTH-1])? (-product_tmp): product_tmp;   
        end
        else begin
            product[PRODUCT_WIDTH-1:0] = dat_a * dat_b;
        end
end

//module signed_mult(/*autoarg*/
//   // Outputs
//   product,
//   // Inputs
//   multa, multb
//   );
//
//parameter   A_WIDTH = 0;
//parameter   B_WIDTH = 0;
//localparam  C_WIDTH = A_WIDTH + B_WIDTH;
//
//input   signed  [A_WIDTH - 1:0]     multa;
//input   signed  [B_WIDTH - 1:0]     multb;
//output  signed  [C_WIDTH - 1:0]     product;
//
//assign product = multa * multb;
//
///*
//input     [A_WIDTH - 1:0]     multa;
//input     [B_WIDTH - 1:0]     multb;
//output    [C_WIDTH - 1:0]     product;
//
//wire    signed [C_WIDTH - 1:0] c_sgn;
//
//assign c_sgn = $signed(multa) * $sigend(multb);
//assign product = $unsigned(c_sgn);
//*/
//
endmodule 
