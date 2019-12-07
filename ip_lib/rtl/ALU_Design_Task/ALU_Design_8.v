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
// 2018/5/5    NingHeChuan       1.0                     Original
//  
// *********************************************************************************
`include "ALU_Design_Define.v"
module ALU_Design_8(
    input           [DATA_WIDTH-1:0]    dina,
    input           [DATA_WIDTH-1:0]    dinb,
    input 		    [ 3:0]		        opcode,
	output 	reg	    [DATA_WIDTH-1:0]	doutr,
	output 					            doutz,      //0±Í÷æ
    output                              flag_of     //flag overflow
);

//-------------------------------------------------------
wire            add_co;
wire            sub_co;

//-------------------------------------------------------
//mux
always @(*)begin
	case(opcode)
	`ALUC_ADD: {add_co, doutr} = dina + dinb;               //add
	`ALUC_SUB: {sub_co, doutr} = dina + ~dinb + 1'b1;       //sub
	`ALUC_AND: doutr = dina & dinb;                         //and
	`ALUC_OR : doutr = dina | dinb;                         //or
	`ALUC_XOR: doutr = dina ^ dinb;                         //xor
	`ALUC_LUI: doutr = {dinb[15:0], 16'b0};                 //lui ÷√∏ﬂŒª¡¢º¥ ˝
	`ALUC_SLL: doutr = dinb << dina;                        //sll ¬ﬂº≠◊Û“∆
	`ALUC_SRL: doutr = dinb >> dina;                        //srl ¬ﬂº≠”““∆
	`ALUC_SRA: doutr = $signed(dinb) >>> dina;              //sra À„ ı”““∆
	default: doutr = doutr;
	endcase
end

assign 	doutz = (doutr == 32'b0)? 1'b1: 1'b0;
assign  flag_of =  add_co | sub_co;


endmodule 
