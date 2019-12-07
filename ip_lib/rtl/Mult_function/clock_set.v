`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:05 01/29/2017 
// Design Name: 
// Module Name:    clock 
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
module clock_set(
			input mclk,
			input rst_n,
			input clock,
			input [3:0] key_en,
			output reg [2:0] hour_ten,
			output reg [3:0] hour_one,
			output reg [2:0] minute_ten,
			output reg [3:0] minute_one
    );
    
   	always @(posedge mclk or negedge rst_n)
		begin
			if(!rst_n)
				hour_ten <= 3'b0;
		  else if(hour_ten == 3)
				hour_ten <= 3'b0;
			else if(key_en[3] == 1 && clock)
				hour_ten <= hour_ten + 1'b1;
			else 
				hour_ten <= hour_ten;
			end
		
		always @(posedge mclk or negedge rst_n)
		begin
			if(!rst_n)
				hour_one <= 4'b0;
			else if(hour_one == 10)
				hour_one <= 4'b0;
			else if(key_en[2] == 1 && clock)
				hour_one <= hour_one + 1'b1;
			else 
				hour_one <= hour_one;
			end
		
		always @(posedge mclk or negedge rst_n)
		begin
			if(!rst_n)
				minute_ten <= 3'b0;
			else if(minute_ten == 6)
				minute_ten <= 3'b0;
			else if(key_en[1] == 1 && clock)
				minute_ten <= minute_ten + 1'b1;
			else 
				minute_ten <= minute_ten;
			end
		
		always @(posedge mclk or negedge rst_n)
		begin
			if(!rst_n)
				minute_one <= 4'b0;
			else if(minute_one == 10)
				minute_one <= 4'b0;
			else if(key_en[0] == 1 && clock)
				minute_one <= minute_one + 1'b1;
			else 
				minute_one <= minute_one;
			end

endmodule
