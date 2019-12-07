`timescale      1ns/1ps
// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.cnblogs.com/ninghechuan/
// File Name    : Control_Unit.v
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
// 2018/4/12    NingHeChuan       1.0                     Original
//  
// *********************************************************************************
`include "include.v"

module Control_Unit(
    input       [5:0]   op,
    input       [5:0]   func,
    input               dinz,
    output  reg [1:0]   pcsource,
    output  reg [3:0]   aluc,
    output  reg         wmem,
    output  reg         shift,
    output  reg         wreg,       //写寄存器堆使能
    output  reg         alumm,
    output  reg         mtoreg,
    output  reg         sext,
    output  reg         jal,
    output  reg         regrt
);

always @(*)begin
    case({op, func})
        {6'b000000, `FUNC_ADD}:begin
            aluc    = `ALUC_ADD;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0010_0000;
        end
        {6'b000000, `FUNC_SUB}:begin
            aluc    = `ALUC_SUB;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0010_0000;
        end
        {6'b000000, `FUNC_AND}:begin
            aluc    = `ALUC_AND;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0010_0000;
        end
        {6'b000000, `FUNC_OR }:begin
            aluc    = `ALUC_OR;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0010_0000;
        end
        {6'b000000, `FUNC_XOR}:begin
            aluc    = `ALUC_XOR;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0010_0000;
        end
        {6'b000000, `FUNC_SLL}:begin
            aluc    = `ALUC_SLL;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0110_0000;
        end
        {6'b000000, `FUNC_SRL}:begin
            aluc = `ALUC_SRL;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0110_0000;
        end
        {6'b000000, `FUNC_SRA}:begin
            aluc = `ALUC_SRA;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0110_0000;
        end
        {6'b000000, `FUNC_JR }:begin
            aluc = `ALUC_NOP;
            pcsource = 2'b10;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0000_0000;
        end
        {`OP_ADDI, func}:begin  //需进行符号扩展
            aluc = `ALUC_ADD;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0011_0101;
        end
        {`OP_ANDI, func} :begin
            aluc = `ALUC_AND;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0011_0001;
        end
        {`OP_ORI, func} :begin
            aluc = `ALUC_OR;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0011_0001;
        end
        {`OP_XORI, func} :begin
            aluc = `ALUC_XOR;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0011_0001;
        end
        {`OP_LUI, func} :begin
            aluc = `ALUC_LUI;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0011_0001;
        end
        {`OP_LW, func} :begin
            aluc = `ALUC_ADD;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0011_1101;
        end
        {`OP_SW, func} :begin
            aluc = `ALUC_ADD;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b1011_0101;
        end
        {`OP_BEQ, func} :begin
            aluc = `ALUC_SUB;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0000_0100;
            if(dinz == 1'b1)
                pcsource = 2'b01;
            else
                pcsource = 2'b00;
        end
        {`OP_BNE, func} :begin
            aluc = `ALUC_XOR;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0000_0100;
            if(dinz == 1'b0)
                pcsource = 2'b01;
            else
                pcsource = 2'b00;
        end
        {`OP_J, func} :begin
            aluc = `ALUC_NOP;
            pcsource = 2'b11;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0000_0000;
        end
        {`OP_JAL, func} :begin
            aluc = `ALUC_NOP;
            pcsource = 2'b11;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0010_0010;
        end
       default:begin
            aluc = `ALUC_NOP;
            pcsource = 2'b00;
            {wmem, shift, wreg, alumm, mtoreg, sext, jal, regrt} = 8'b0000_0000;
        end
        endcase
end

endmodule
