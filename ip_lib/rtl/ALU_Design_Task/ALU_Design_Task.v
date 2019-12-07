`timescale      1ns/1ps
// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.coutm
// Blogs        : http://www.cnblogs.coutm/ninghechuan/
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
// 2018/5/5    NingHeChuan       1.0                     Original
//  
// *********************************************************************************
`include "ALU_Design_Define.v"

module ALU_Design_Task(
    input           [`DATA_WIDTH-1:0]   dina,
    input           [`DATA_WIDTH-1:0]   dinb,
    input 		    [ 3:0]		        opcode,
	output 	reg	    [`DATA_WIDTH-1:0]	doutr,
	output 					            doutz,      //0标志
    output                              flag_of     //flag overflow
);

//-------------------------------------------------------
reg            add_cout;
reg            sub_cout;
wire            right = (opcode == `ALUC_SRL)? 1'b1: 1'b0; 
wire            left  = (opcode == `ALUC_SLL)? 1'b1: 1'b0;

//-------------------------------------------------------
//mux
always @(*)begin
	case(opcode)
	`ALUC_ADD: Add(dina,dinb,(1'b0), doutr, add_cout);      //add
	`ALUC_SUB: Add(dina,~dinb,(1'b1), doutr, sub_cout);     //sub
	`ALUC_AND: doutr = dina & dinb;                         //and
	`ALUC_OR : doutr = dina | dinb;                         //or
	`ALUC_XOR: doutr = dina ^ dinb;                         //xor
	//`ALUC_LUI: doutr = {dinb[3:0], 4'b0};                   //lui 置高位立即数
    `ALUC_LUI: doutr = {dinb[1:0], 2'b0};                   //lui 置高位立即数//下载程序
	`ALUC_SLL: Shift(dina, dinb, right, left, doutr);       //sll 逻辑左移
	`ALUC_SRL: Shift(dina, dinb, right, left, doutr);       //srl 逻辑右移
	`ALUC_SRA: Shift(dina, dinb, right, left, doutr);       //sra 算术右移
	default: doutr = doutr;
	endcase
end

assign 	doutz = (doutr == 'b0)? 1'b1: 1'b0;
assign  flag_of =  add_cout | sub_cout;
//-------------------------------------------------------
//Add
task Add;
    input           [`DATA_WIDTH-1:0]   dina;
    input           [`DATA_WIDTH-1:0]   dinb;
    input                               cin;
	output 	reg	    [`DATA_WIDTH-1:0]	doutr;
    output  reg                         cout;

    begin
        {cout, doutr} =   dina + dinb + cin;
    end
endtask
//-------------------------------------------------------
//Shift
task Shift;
    input           [`DATA_WIDTH-1:0]   dina;
    input           [`DATA_WIDTH-1:0]   dinb;
    input 				                right;
	input 				                left;
	output 	reg	    [`DATA_WIDTH-1:0]	doutsh;

begin
	if(left == 1'b1)
		doutsh = dinb << dina;//逻辑左移
	else if(right == 1'b1)
		doutsh = dinb >> dina;//逻辑右移
	else
		doutsh = $signed(dinb) >>> dina;//必须是这种描述方法才能表示算术右移
end
endtask


endmodule
