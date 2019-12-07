`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:07:32 02/07/2017 
// Design Name: 
// Module Name:    key_scan_design 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "ALU_Design_Define.v"

module key_scan_design(
	input mclk,
	input rst_n,
	input [`KEY_WIDTH-1:0] key_data,
	output reg [`KEY_WIDTH-1:0] key_value,
	output reg key_flag
);

    reg [`KEY_WIDTH-1:0] key_data_r;
    reg [19:0] cnt;//延时计数器
    wire key_trigger;
    
    //按键值寄存
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		key_data_r <= {`KEY_WIDTH{1'b1}};//内部按键寄存器复位应该为0如果为1，则没有按下时计数器也会计数
    	else                                //Xilinx开发板按键按下为1，Altera开发板按下为0
    		key_data_r <= key_data;
    	end
    
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		cnt <= 20'd0;
    	else if(key_data == key_data_r)begin//检测是否按下
    		if(cnt == `DELAY_STOP)//&& key_data != {KEY_WIDTH{1'b1}})//??????
    			cnt <= cnt;
    		else 
    			cnt <= cnt + 1'b1;
    		end
    	else 
    		cnt <= 20'd0;	
    	end
    assign key_trigger = (cnt == `DELAY_STOP - 1'b1)?1'b1:1'b0;
    
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n) 
    		key_value <= {`KEY_WIDTH{1'b1}};
    	else if(key_trigger)
    		key_value <= key_data_r;
    	else
    		key_value <= key_value;
    	end
    	
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		key_flag <= 1'b0;
    	else
    		key_flag <= key_trigger;
    	end
    		
endmodule
