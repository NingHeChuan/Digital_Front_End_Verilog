`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:07 01/29/2017 
// Design Name: 
// Module Name:    cnt_clk 
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
module cnt_clk(
			input mclk,
			input rst_n,
			input clock,
			input [3:0] key_en,
			output reg [2:0] hour_ten,
			output reg [3:0] hour_one,
			output reg [2:0] minute_ten,
			output reg [3:0] minute_one
    );
    
    parameter TIME = 26'd49999999;
    //parameter TIME = 26'd49;//仿真专用
    
    reg [25:0] cnt;//分频一秒时钟信号计数器
    reg [5:0] cnt_s;//秒计数器
    wire flag_second;//秒59
    wire flag_minute_one;//秒59，分个9
    wire flag_minute_ten;//秒59，分个9，分十5
    wire flag_hour_one1;//秒59，分个9，分十5，时个9
    wire flag_hour_one2;//秒59，分个9，分十5，时个3
    wire flag_hour_ten;//秒59，分个9，分十5，时个3,时十2
    
    //分频数一秒信号
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		cnt <= 26'b0;
    	else if(cnt == TIME)
    		cnt <= 26'b0;
    	else
    		cnt <= cnt + 1'b1;
    	end
    
    //秒计数	
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		cnt_s <= 6'b0;
    	else if(cnt_s == 59 && cnt == TIME)
    		cnt_s <= 6'b0;
    	else if(cnt == TIME)
    		cnt_s <= cnt_s + 1'b1;
    	else 
    		cnt_s <= cnt_s;
    	end
    assign flag_second = (cnt_s == 59 && cnt == TIME)? 1'b1:1'b0;
    
    //分钟个位计数
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		minute_one <= 4'b0;
    	else if(minute_one == 9 && flag_second)
    		minute_one <= 4'b0;
    	else if(flag_second || key_en[0] && !clock)
    		minute_one <= minute_one + 1'b1;
    	else 
    		minute_one <= minute_one;
    	end
    assign flag_minute_one = (minute_one == 9 && flag_second)?1'b1:1'b0;
    
    //分钟十位计数
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		minute_ten <= 3'b0;
    	else if((minute_ten == 5 && flag_minute_one) || minute_ten == 6)
    		minute_ten <= 3'b0;
    	else if(flag_minute_one || key_en[1] && !clock)
    		minute_ten <= minute_ten + 1'b1;
    	else 
    		minute_ten <= minute_ten;
    	end
   	assign flag_minute_ten = (minute_ten == 5 && flag_minute_one)?1'b1:1'b0;
   	
   	//小时的个位计数
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		hour_one <= 4'b0;
    	else if(hour_one == 9 && flag_minute_ten || flag_hour_ten)
    		hour_one <= 4'b0;
    	else if(flag_minute_ten || key_en[2] && !clock)
    		hour_one <= hour_one + 1'b1;
    	else 
    		hour_one <= hour_one;
    	end
    assign flag_hour_one1 = (hour_one == 9 && flag_minute_ten)?1'b1:1'b0;
    assign flag_hour_one2 = (hour_one == 3 && flag_minute_ten)?1'b1:1'b0;
    
    //小时的十位计数
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		hour_ten <= 3'b0;
    	else if(hour_ten == 2 && flag_hour_one2)
    		hour_ten <= 3'b0;
    	else if(flag_hour_one1 || key_en[3] && !clock)
    		hour_ten <= hour_ten + 1'b1;
    	else 
    		hour_ten <= hour_ten;
    	end
    assign flag_hour_ten = (hour_ten == 2 && flag_hour_one2)?1'b1:1'b0;

endmodule