`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:05:55 11/11/2016 
// Design Name: 
// Module Name:    key 
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
module key(
				input wire mclk, //50mhz
				input wire rst_n,
				input wire load,
				output wire load_x
				);
parameter DURATION = 600;
//key jitter filter
reg[11:0] low_cnt;

	always @(posedge mclk or negedge rst_n)
	begin
	if(!rst_n)
		low_cnt <= 0;
	else
	begin
		if(load == 1'b1)
		begin
		if(low_cnt == DURATION)
			low_cnt <= low_cnt;
		else
			low_cnt <= low_cnt + 1'b1;
		end
		else //load == 1'b0
			low_cnt <= 0;
		end
	end
	assign load_x = (low_cnt == DURATION -1)? 1'b1 : 1'b0;
endmodule

