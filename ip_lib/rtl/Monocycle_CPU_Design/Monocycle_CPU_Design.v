`timescale      1ns/1ps
// *********************************************************************************
// project name : Monocycle_CPU_Design    
// author       : ninghechuan
// email        : ninghechuan@foxmail.com
// blogs        : http://www.cnblogs.com/ninghechuan/
// file name    : Monocycle_CPU_Design.v
// module name  :
// called by    :
// abstract     :
//
// copyright(c) 2018, ninghechuan studio.. 
// all rights reserved
//
// *********************************************************************************
// modification history:
// date         by              version                 change description
// -----------------------------------------------------------------------
// 2018/4/14    ninghechuan       1.0                     original
//  
// *********************************************************************************

module Monocycle_CPU_Design(
    input                   clk,
    input                   rst_n

);
//Program_Count
wire    [31:0]  pc_return;
wire    [31:0]  pc_addr;
wire    [31:0]  pc_cnt;
//Inst_Mem
wire    [31:0] inst_data;
//Inst_Decode
    //inst_mem signal
wire    [31:0]  dout_mem;
    //regfile signal    
    //control unit signal
//Regfile
wire    [4:0]   rd_addra;       //
wire    [4:0]   rd_addrb;       //
wire    [4:0]   wr_addrd;
wire    [31:0]  wr_data;       
wire    [31:0]  rd_douta;
wire    [31:0]  rd_doutb;  
//Control_Unit
wire    [1:0]   pcsource;
wire    [3:0]   aluc;
wire            wmem;
wire            shift;
wire            wreg;
wire            alumm;
wire            mtoreg;
wire            sext;
wire            jal;
wire            regrt;
//ALU_Design
wire    [31:0]  alu_doutr;
wire 			doutz;//0标志
//wire            flag_of;//flag overflow
//Inst_Exe
    //input signal 
wire    [31:0]  shift_data;
wire    [27:0]  addr_data;
wire    [31:0]  imm_data;
    //data_mem signal
    //regfile signal 
    //output signal 
wire    [31:0]  alu_dinb;
wire    [31:0]  alu_dina;
//Data_Mem

//-------------------------------------------------------
//Program_Count
Program_Count Program_Count_inst(
    .clk                (clk),
    .rst_n              (rst_n),
    .pc_return          (pc_return),
    .pc_addr            (pc_addr),
    .pc_cnt             (pc_cnt)
);
//-------------------------------------------------------
//Inst_Mem
/*
Inst_Mem Inst_Mem_inst(
    .pc_addr           (pc_addr),
    .inst_data         (inst_data) 
);*/

Inst_ROM Inst_ROM_inst (
    .a                  (pc_addr[4:0]), // input [4 : 0] a
    .spo                (inst_data) // output [31 : 0] spo
);

//-------------------------------------------------------
//Inst_Decode
Inst_Decode Inst_Decode_inst(
    //inst_mem signal
    .inst_data          (inst_data),
    .mtoreg             (mtoreg),
    .alu_doutr          (alu_doutr),
    .dout_mem           (dout_mem),
    //regfile signal
    .rd_addra           (rd_addra),
    .rd_addrb           (rd_addrb),
    .wr_addrd           (wr_addrd),
    //control unit signal
    .regrt              (regrt),
    .jal                (jal),
    .sext               (sext),
    .shift_data         (shift_data),
    .imm_data           (imm_data),
    .addr_data          (addr_data)
);
//-------------------------------------------------------
//Regfile
Regfile Regfile_inst(
    .clk                (clk),
    .rst_n              (rst_n),
    .wren               (wreg),           //往寄存器堆中写入数据使能
    .rd_addra           (rd_addra),       //
    .rd_addrb           (rd_addrb),       //
    .wr_addrd           (wr_addrd),
    .wr_data            (wr_data),        
    .rd_douta           (rd_douta),
    .rd_doutb           (rd_doutb)   
);
//-------------------------------------------------------
//Control_Unit
Control_Unit Control_Unit_inst(
    //.clk                (clk),
    .op                 (inst_data[31:26]),
    .func               (inst_data[5:0]),
    .dinz               (doutz),
    .pcsource           (pcsource),
    .aluc               (aluc),
    .wmem               (wmem),
    .shift              (shift),
    .wreg               (wreg),
    .alumm              (alumm),
    .mtoreg             (mtoreg),
    .sext               (sext),
    .jal                (jal),
    .regrt              (regrt)
);
//-------------------------------------------------------
//Alu_Design
ALU_Design ALU_Design_inst(
    .dina               (alu_dina),
	.dinb               (alu_dinb),
	.aluc               (aluc),
	.doutr              (alu_doutr),
	.doutz              (doutz), //0标志
    .flag_of            ()  //flag overflow
);
//-------------------------------------------------------
//Inst_Exe
Inst_Exe Inst_Exe_inst(
    //input signal 
    .pc_cnt             (pc_cnt),
    .pcsource           (pcsource),
    .alumm              (alumm),
    .mtoreg             (mtoreg),
    .shift              (shift),
    .jal                (jal),
    .shift_data         (shift_data),
    .addr_data          (addr_data),
    .imm_data           (imm_data),
    //data_mem signal
    .dout_mem           (dout_mem),
    .alu_doutr          (alu_doutr),
    //regfile signal 
    .rd_douta           (rd_douta),
    .rd_doutb           (rd_doutb),
    //output signal 
    .pc_return          (pc_return),
    .alu_dinb           (alu_dinb),
    .alu_dina           (alu_dina),
    .wr_data            (wr_data)         //write regfile data
    
);
//-------------------------------------------------------
//Data_Mem
/*
Data_Mem Data_Mem_inst(
    .clk                (clk),
    .rst_n              (rst_n),
    .data_addr          (alu_doutr),
    .wr_data            (rd_doutb),
    .wmem               (wmem),//写数据存储器使能信号
    .dout_mem           (dout_mem)
    );*/

Data_Mem Data_Mem_inst (
  .clka                 (~clk),              // input clka
  .wea                  (wmem),             // input [0 : 0] wea
  .addra                (alu_doutr[6:2]),   // input [31 : 0] addra
  .dina                 (rd_doutb),         // input [31 : 0] dina
  .douta                (dout_mem)          // output [31 : 0] douta
);


endmodule 
