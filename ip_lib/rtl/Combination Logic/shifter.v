`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:28 10/09/2016 
// Design Name: 
// Module Name:    shifter 
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
module shifter(in, out, clk, rst
    );
	 input in;
	 input clk, rst;
	 output reg[3:0] out;
	 
	 reg [25:0]cnt;//定义一个位宽为26的计数器
	 parameter TIME = 26'd50000000;
	 
	 always @(posedge clk or negedge rst)
	 begin
		if(!rst)
			cnt <= 1'b0;
		else if(cnt == TIME - 1)
			cnt <= 1'b0;
		else 
			cnt <= cnt + 1'b1;
	 end
	 
	 always @(posedge clk or negedge rst)//编写一个左移寄存器
	 begin
		if(!rst)
			out <= 1'b0;
		else if (cnt == TIME - 1)
		begin
			
			out <= {out[2:0], in};
			out[0] <= in;

		end

	 end


endmodule
