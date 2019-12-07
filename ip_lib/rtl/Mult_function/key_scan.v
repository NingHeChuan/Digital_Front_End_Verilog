`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:25 01/29/2017 
// Design Name: 
// Module Name:    key_scan 
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
module key_scan(
			input mclk,
			input rst_n,
			input [3:0] key,
			output [3:0] key_en
    );
    
    parameter DURATION = 600;

		reg[10:0] cnt;
		reg[10:0] cnt1;
		reg[10:0] cnt2;
		reg[10:0] cnt3;    
		
		always @(posedge mclk or negedge rst_n)
		begin
			if(!rst_n)
				cnt <= 11'b0;
			else if(key[0] == 1)begin
				if(cnt == DURATION)
					cnt <= cnt;
				else 
					cnt <= cnt + 1'b1;
				end
			else
				cnt <= 11'b0;
			end
		assign key_en[0] = (cnt == DURATION -1)?1'b1:1'b0;
		
		always @(posedge mclk or negedge rst_n)
		begin
			if(!rst_n)
				cnt1 <= 11'b0;
			else if(key[1] == 1)begin
				if(cnt1 == DURATION)
					cnt1 <= cnt1;
				else 
					cnt1 <= cnt1 + 1'b1;
				end
			else 
				cnt1 <= 11'b0;
			end
		assign key_en[1] = (cnt1 == DURATION -1)?1'b1:1'b0;
		
		always @(posedge mclk or negedge rst_n)
		begin
			if(!rst_n)
				cnt2 <= 11'b0;
			else if(key[2]==1)begin
				if(cnt2 == DURATION)
					cnt2 <= cnt2;
				else 
					cnt2 <= cnt2 + 1'b1;
				end
			else 
				cnt2 <= 11'b0;
			end
		assign key_en[2] = (cnt2== DURATION -1)?1'b1:1'b0;
			
		always @(posedge mclk or negedge rst_n)
		begin
			if(!rst_n)
				cnt3 <= 11'b0;
			else if(key[3]==1)begin
				if(cnt3 == DURATION)
					cnt3 <= cnt3;
				else 
					cnt3 <= cnt3 + 1'b1;
				end
			else 
				cnt3 <= 11'b0;
			end
		assign key_en[3] = (cnt3 == DURATION -1)?1'b1:1'b0;
		
endmodule
