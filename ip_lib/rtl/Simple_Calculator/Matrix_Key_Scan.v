`timescale      1ns/1ps
// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.cnblogs.com/ninghechuan/
// File Name    : Matrix_Key_Scan.v
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
// 2018/7/28    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

module Matrix_Key_Scan(
    input                   clk,    //50Mhz
    input                   rst_n,
    input           [3:0]   row_data,
    output      reg         key_flag,
    output      reg [3:0]   key_value,
    output      reg [3:0]   col_data
);

//FSM state
parameter       SCAN_IDLE       =   8'b0000_0001;
parameter       SCAN_JITTER1    =   8'b0000_0010;
parameter       SCAN_COL1       =   8'b0000_0100;
parameter       SCAN_COL2       =   8'b0000_1000;
parameter       SCAN_COL3       =   8'b0001_0000;
parameter       SCAN_COL4       =   8'b0010_0000;
parameter       SCAN_READ       =   8'b0100_0000;
parameter       SCAN_JITTER2    =   8'b1000_0000;
//
parameter       DELAY_TRAN      =   2;
parameter     DELAY_20MS      =   1000_000;
//parameter       DELAY_20MS      =   100;//just test
reg     [20:0]  delay_cnt;
wire            delay_done;
//
reg     [7:0]   pre_state;
reg     [7:0]   next_state;
reg     [20:0]   tran_cnt;
wire            tran_flag;
//
reg     [3:0]   row_data_r;
reg     [3:0]   col_data_r;
wire             key_flag_r;
//

//-------------------------------------------------------
//delay 20ms
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        delay_cnt   <= 'd0;
    end
    else if(delay_cnt == DELAY_20MS)
        delay_cnt <= 'd0;
    else if(next_state == SCAN_JITTER1 | next_state == SCAN_JITTER2) begin
        delay_cnt <= delay_cnt + 1'b1;
    end
    else 
        delay_cnt <= 'd0;
end

assign  delay_done = (delay_cnt == DELAY_20MS - 1'b1)? 1'b1: 1'b0;


//-------------------------------------------------------
//delay 2clk
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        tran_cnt <= 'd0;
    end
    else if(tran_cnt == DELAY_TRAN)begin
        tran_cnt <= 'd0;
    end
    else 
        tran_cnt <= tran_cnt + 1'b1;
end

assign    tran_flag = (tran_cnt == DELAY_TRAN)? 1'b1: 1'b0;


//-------------------------------------------------------
//FSM step1
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        pre_state <= SCAN_IDLE;
    end
    else if(tran_flag)begin
        pre_state <= next_state;
    end
    else pre_state <= pre_state;
end

//FSM step2
always  @(*)begin
    next_state = SCAN_IDLE;
    case(pre_state)
    SCAN_IDLE:
        if(row_data != 4'b1111)
            next_state = SCAN_JITTER1;
        else 
            next_state = SCAN_IDLE;
    SCAN_JITTER1:
        if(row_data != 4'b1111 && delay_done == 1'b1)
            next_state = SCAN_COL1;
        else 
            next_state = SCAN_JITTER1;
    SCAN_COL1:
        if(row_data != 4'b1111)//如果row_data是全1，说明不是列扫描没有对应到该行
            next_state = SCAN_READ;
        else 
            next_state = SCAN_COL2;
    SCAN_COL2:
        if(row_data != 4'b1111)
            next_state = SCAN_READ;
        else 
            next_state = SCAN_COL3;
    SCAN_COL3:
        if(row_data != 4'b1111)
            next_state = SCAN_READ;
        else 
            next_state = SCAN_COL4;
    SCAN_COL4:
        if(row_data != 4'b1111)
            next_state = SCAN_READ;
        else 
            next_state = SCAN_IDLE;
    SCAN_READ:
        if(row_data != 4'b1111)
            next_state = SCAN_JITTER2;
        else 
            next_state = SCAN_IDLE;
    SCAN_JITTER2:
        if(row_data == 4'b1111 && delay_done == 1'b1)
            next_state = SCAN_IDLE;
        else
            next_state = SCAN_JITTER2;
    default:next_state = SCAN_IDLE;
    endcase
end

//FSM step3
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        col_data <= 4'b0000;
        row_data_r <= 4'b0000;
        col_data_r <= 4'b0000;
    end
    else if(tran_flag) begin
        case(next_state)
        SCAN_COL1:col_data <= 4'b0111;
        SCAN_COL2:col_data <= 4'b1011;
        SCAN_COL3:col_data <= 4'b1101;
        SCAN_COL4:col_data <= 4'b1110;
        SCAN_READ:begin
            col_data <= col_data;
            row_data_r <= row_data;
            col_data_r <= col_data;
        end
        default: col_data <= 4'b0000;
        endcase
    end
    else begin
        col_data <= col_data;
        row_data_r <= row_data_r;
        col_data_r <= col_data_r;
    end
end

//这个状态表明是扫开消完抖动的那一瞬间
assign key_flag_r = (next_state == SCAN_IDLE && pre_state == SCAN_JITTER2 && tran_flag)? 1'b1: 1'b0;

//-------------------------------------------------------
//decode key_value
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        key_value <= 'd0; 
    end
    else if(key_flag_r == 1'b1)begin
        case({row_data_r, col_data_r})
        8'b0111_0111: key_value <= 4'h1;  
        8'b0111_1011: key_value <= 4'h2;
        8'b0111_1101: key_value <= 4'h3;
        8'b0111_1110: key_value <= 4'ha;
        8'b1011_0111: key_value <= 4'h4;
        8'b1011_1011: key_value <= 4'h5;
        8'b1011_1101: key_value <= 4'h6;
        8'b1011_1110: key_value <= 4'hb;
        8'b1101_0111: key_value <= 4'h7;
        8'b1101_1011: key_value <= 4'h8;
        8'b1101_1101: key_value <= 4'h9;
        8'b1101_1110: key_value <= 4'hc;
        8'b1110_0111: key_value <= 4'hf;
        8'b1110_1011: key_value <= 4'h0;
        8'b1110_1101: key_value <= 4'he;
        8'b1110_1110: key_value <= 4'hd;
        default     : key_value <= key_value;
        endcase
    end
    else 
        key_value <= key_value;
end

always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        key_flag <= 1'b0;
    else
       key_flag <= key_flag_r; 
end


endmodule
