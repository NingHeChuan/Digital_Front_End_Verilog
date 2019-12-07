`timescale      1ns/1ps
// *********************************************************************************
// Project Name : Monocycle_CPU_Design      
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.cnblogs.com/ninghechuan/
// File Name    : ALU_Design.v
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
// 2018/4/2    NingHeChuan       1.0                     Original
//  
// *********************************************************************************
`include "include.v"

module ALU_Design(
    input 		[31:0]		dina,
	input 		[31:0]		dinb,
	input 		[ 3:0]		aluc,
	output 	reg	[31:0]		doutr,
	output 					doutz,//0标志
    output                  flag_of//flag overflow
);

//-------------------------------------------------------
wire    [31:0]  sum;
wire    [31:0]  sub;
wire 	[31:0]	doutsh;
wire            add_co;
wire            sub_co;
wire            right = (aluc == `ALUC_SRL)? 1'b1: 1'b0; 
wire            left  = (aluc == `ALUC_SLL)? 1'b1: 1'b0;

//-------------------------------------------------------
//mux
always @(*)begin
	case(aluc)
	`ALUC_ADD: doutr = sum;                 //add
	`ALUC_SUB: doutr = sub;                 //sub
	`ALUC_AND: doutr = dina & dinb;           //and
	`ALUC_OR : doutr = dina | dinb;           //or
	`ALUC_XOR: doutr = dina ^ dinb;           //xor
	`ALUC_LUI: doutr = {dinb[15:0], 16'b0};   //lui 置高位立即数
	`ALUC_SLL: doutr = doutsh;                //sll 逻辑左移
	`ALUC_SRL: doutr = doutsh;                //srl 逻辑右移
	`ALUC_SRA: doutr = doutsh;                //sra 算术右移
	default: doutr = 0;
	endcase
end

assign 	doutz = (doutr == 32'b0)? 1'b1: 1'b0;
assign  flag_of =  add_co | sub_co;

//-------------------------------------------------------
//full_adder32
full_adder32 full_adder32_inst(
    .dina           (dina),
    .dinb           (dinb),
    .cin            (1'b0),
    .sum            (sum),
    .cout           (add_co)//溢出位
);

//-------------------------------------------------------
//full_sub32
full_adder32 full_sub32_inst(
    .dina           (dina),
    .dinb           (~dinb),
    .cin            (aluc[0]),
    .sum            (sub),
    .cout           (sub_co)//溢出位
);

//-------------------------------------------------------
//shift
shift shift_inst(
	.dina				(dina[4:0]),
	.dinb				(dinb),
	.right				(right),
	.left				(left),
	.doutsh				(doutsh)
    );

endmodule 

