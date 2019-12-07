`timescale 1ns/1ps

module Cordic_Top(
    input               clk,
    input               rst_n,
    input               sel_cos_sin,
    input               sel_arcran,
    input               ctrl,
    input               judge,
    output     signed [31:0]   dout


);
wire    [31:0]  sig_out;
wire    [31:0]  sin_cos;

//(*KEEP = "TURE"*)wire    [31:0]  sig_out;
//(*KEEP = "TURE"*)wire    [31:0]  sin_cos;

//wire    clk_50M;

assign dout = (judge == 1'b1)? sin_cos: sig_out;
/*
 Div_Clk_25M Div_Clk_25M_inst
   (// Clock in ports
    .CLK_IN1(clk),      // IN
    // Clock out ports
    .CLK_OUT1(clk_50M));    // OUT
*/

// Instantiate the module
Cordic_Cos_Sin Cordic_Cos_Sin_inst (
    .clk            (clk), 
    .rst_n          (~rst_n & judge), 
    .sel            (sel_cos_sin), 
    .sin_cos        (sin_cos)
    );

// Instantiate the module
Cordic_Arctan Cordic_Arctan_inst (
    .clk            (clk), 
    .rst_n          (~rst_n & ~judge), 
    .sel            (sel_arcran), 
    .ctrl           (ctrl), 
    .sig_out        (sig_out)
    );


endmodule 
