`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:32 01/29/2017 
// Design Name: 
// Module Name:    cnt_second 
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
module cnt_second(
			input mclk,
			input rst_n,
			input stop,
			input clr,
			output reg [2:0] minute_ten,
			output reg [3:0] minute_one,
			output reg [2:0] second_ten,
			output reg [3:0] second_one
    );
    
    parameter TIME = 26'd49999999;
    //parameter TIME = 26'd49;//仿真专用
    
    reg [25:0] cnt;
    wire flag_second_one;//秒个9
    wire flag_second_ten;//秒个9，秒十5
    wire flag_minute_one;//秒个9，秒十5，分个9
    
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		cnt <= 26'b0;
    	else if(clr)
    		cnt <= 26'b0;
    	else if(cnt == TIME)
    		cnt <= 26'b0;
    	else if(stop)
    		cnt <= cnt + 1'b1;
    	else 
    		cnt <= cnt;
    	end
    
    //秒的个位计数
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		second_one <= 4'b0;
    	else if(clr)
    		second_one <= 4'b0;
    	else if(second_one == 9 && cnt == TIME)
    		second_one <= 4'b0;
    	else if(cnt == TIME)
    		second_one <= second_one + 1'b1;
    	else 
    		second_one <= second_one;
    	end
    assign flag_second_one = (second_one == 9 && cnt == TIME)?1'b1:1'b0;
    
    //秒的十位计数
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		second_ten <= 3'b0;
    	else if(clr)
    		second_ten <= 3'b0;
    	else if(second_ten == 5 && flag_second_one)
    		second_ten <= 3'b0;
    	else if(flag_second_one)
    		second_ten <= second_ten + 1'b1;
    	end 
    assign flag_second_ten = (second_ten == 5 && flag_second_one)?1'b1:1'b0;
    
    //分的个位计数
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		minute_one <= 4'b0;
    	else if(clr)
    		minute_one <= 4'b0;
    	else if(minute_one == 9 && flag_second_ten)
    		minute_one <= 4'b0;
    	else if(flag_second_ten)
    		minute_one <= minute_one + 1'b1;
    	else 
    		minute_one <= minute_one;
    	end
    assign flag_minute_one = (minute_one == 9 && flag_second_ten)?1'b1:1'b0;
    
    //分的十位计数
    always @(posedge mclk or negedge rst_n)
    begin
    	if(!rst_n)
    		minute_ten <= 3'b0;
    	else if(clr)
    		minute_ten <= 3'b0;
    	else if(minute_ten == 5 && flag_minute_one)
    		minute_ten <= 3'b0;
    	else if(flag_minute_one)
    		minute_ten <= minute_ten + 1'b1;
    	else 
    		minute_ten <= minute_ten;
    	end


endmodule
