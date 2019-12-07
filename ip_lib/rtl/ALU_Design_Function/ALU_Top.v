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
// 2018/5/7    NingHeChuan       1.0                     Original
//  
// *********************************************************************************
`include "ALU_Design_Define.v"
module ALU_Top(
    input                               clk,
    input                               rst_n,
    input           [`DATA_WIDTH-1:0]   dina,
    input           [`DATA_WIDTH-1:0]   dinb,
    //input 		    [ 3:0]		        opcode,
	output 	 	    [`DATA_WIDTH-1:0]	doutr,
	output 					            doutz,      //0标志
    output                              flag_of,     //flag overflow
    //key signal
    input                               key_data

);
reg    [ 3:0]		        opcode;
//key_scan_design

//wire    [`KEY_WIDTH-1:0]    key_value;
//wire                        key_flag;
wire                          load_x;

//-------------------------------------------------------
// ALU_Design_Function
ALU_Design_Function ALU_Design_Function_inst (
    .dina(dina), 
    .dinb(dinb), 
    .opcode(opcode), 
    .doutr(doutr), 
    .doutz(doutz), 
    .flag_of(flag_of)
    );
/*
//-------------------------------------------------------
// key_scan_design
key_scan_design key_scan_design_inst (
    .mclk(clk), 
    .rst_n(rst_n), 
    .key_data(key_data), 
    .key_value(key_value), 
    .key_flag(key_flag)
    );
    */
//-------------------------------------------------------
// Instantiate the module
key key_inst (
    .mclk(clk), 
    .rst_n(~rst_n), 
    .load(key_data), 
    .load_x(load_x)
    );
    
    
//-------------------------------------------------------
//opcode
always  @(posedge clk or posedge rst_n)begin
    if(rst_n == 1'b1)
        opcode <= 4'b0;
    else if(opcode == `ALUC_SRA && load_x == 1'b1)
        opcode <= 4'b0;
    else if(load_x == 1'b1)
        opcode <= opcode + 1'b1;
    else 
        opcode <= opcode;
end


 
endmodule 
