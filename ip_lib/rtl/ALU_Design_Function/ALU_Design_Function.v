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

module ALU_Design_Function(
    input           [`DATA_WIDTH-1:0]   dina,
    input           [`DATA_WIDTH-1:0]   dinb,
    input 		    [ 3:0]		        opcode,
	output 	 	    [`DATA_WIDTH-1:0]	doutr,
	output 					            doutz,      //0标志
    output                              flag_of     //flag overflow
);

//------------------------------------------------------

assign  {flag_of, doutr} = ALU_Design(dina, dinb, opcode);

assign 	doutz = (doutr == 'b0)? 1'b1: 1'b0;


function [`DATA_WIDTH:0] ALU_Design;
    input           [`DATA_WIDTH-1:0]   dina;
    input           [`DATA_WIDTH-1:0]   dinb;
    input 		    [ 3:0]		        opcode;
        
//-------------------------------------------------------
//mux
begin
	case(opcode)
	`ALUC_ADD: ALU_Design = dina + dinb + 1'b0;        //add
	`ALUC_SUB: ALU_Design = dina + ~dinb + 1'b1;       //sub
	`ALUC_AND: ALU_Design = dina & dinb;                 //and
	`ALUC_OR : ALU_Design = dina | dinb;                 //or
	`ALUC_XOR: ALU_Design = dina ^ dinb;                 //xor
	//`ALUC_LUI: doutr = {dinb[3:0], 4'b0};              //lui 置高位立即数
    `ALUC_LUI: ALU_Design = {dinb[1:0], 2'b0};           //lui 置高位立即数//下载程序
	`ALUC_SLL: ALU_Design = dinb << dina;                //sll 逻辑左移
	`ALUC_SRL: ALU_Design = dinb >> dina;                //srl 逻辑右移
	`ALUC_SRA: ALU_Design = $signed(dinb) >>> dina;      //sra 算术右移
	default: ALU_Design = doutr;
	endcase
end

endfunction


endmodule
