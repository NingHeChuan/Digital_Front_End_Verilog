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
// 2018/7/29    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

module Top(
    input                   clk,    //50Mhz
    input                   rst_n,
    input        [3:0]   row_data,
    output       [3:0]   col_data,
    output       [6:0]   out,
    output               dp,
	output       [3:0]   an//所有的数码管的使能端

); 

wire    [15:0]        disp_num;
wire            disp_sum_en;  
//
wire            key_flag;
wire    [3:0]   key_value;
wire    [15:0]  outcome;

wire    [3:0]   thou_data;
wire	[3:0]	hund_data;
wire	[3:0]	tens_data;
wire	[3:0]	unit_data;
wire    [3:0]   data_four   = (disp_sum_en == 1'b1)? thou_data: disp_num[15:12]; 
wire    [3:0]   data_three  = (disp_sum_en == 1'b1)? hund_data: disp_num[11:8];
wire    [3:0]   data_two    = (disp_sum_en == 1'b1)? tens_data: disp_num[7:4];  
wire    [3:0]   data_one    = (disp_sum_en == 1'b1)? unit_data: disp_num[3:0];
//

//-------------------------------------------------------
//Matrix_Key_Scan_inst
Matrix_Key_Scan Matrix_Key_Scan_inst(
    .clk                (clk      ),    //50Mhz
    .rst_n              (rst_n    ),
    .row_data           (row_data ),
    .key_flag           (key_flag ),
    .key_value          (key_value),
    .col_data           (col_data )
);

//-------------------------------------------------------
//Simple_Caculator
Simple_Caculator Simple_Caculator_inst(
    .clk                (clk      ),
    .rst_n              (rst_n    ),
    .key_flag           (key_flag ),
    .key_value          (key_value),
    .outcome            (outcome  ),
    .disp_num           (disp_num),
    .disp_sum_en        (disp_sum_en)    
);

Bin_BCD Bin_BCD_inst(
    .clk            (clk      ),
    .rst_n          (rst_n    ),
    .tran_en        (disp_sum_en  ),
    .data_in        (outcome  ),
    .tran_done      (),
    .thou_data      (thou_data),      //千位
    .hund_data      (hund_data),      //百位
	.tens_data      (tens_data),      //十位
	.unit_data      (unit_data)       //个位
);


//-------------------------------------------------------
//Seven_Seg_Display
Seven_Seg_Display Seven_Seg_Display_inst(
    .clk                (clk       ),
    .rst_n              (rst_n     ),
    .data_four          (data_four ),
    .data_three         (data_three),
    .data_two           (data_two  ),
    .data_one           (data_one  ),
    .out                (out       ),
    .an                 (an        ),//所有的数码管的使能端
    .dp                 (dp        )
    );

endmodule
