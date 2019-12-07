`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:16:04 11/05/2016 
// Design Name: 
// Module Name:    control_clk 
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
module seven_seg_display(
			input mclk,
			input rst_n,
			input [2:0] hour_ten,
			input [3:0] hour_one,
			input [2:0] minute_ten,
			input [3:0] minute_one,
			output reg [7:0] out,
			output reg [3:0] an//所有的数码管的使能端
    );
	 	 
	 wire [3:0] aen;//数码管使能信号
	 reg [1:0] s;//数码管显示选择
	 reg [18:0] cnt;//数码管扫描时钟计数
	 
	 parameter CLK190 = 18'd263157;
	 	 

	 always @(posedge mclk or negedge rst_n)
	 begin
		if(!rst_n)
			cnt <= 18'b0;
		else if(cnt == CLK190 - 1'b1)
			cnt <= 18'b0;
		else 
			cnt <= cnt + 1'b1;	
	 end
	 
	 //灯的状态没5.2毫秒刷新一次
	 always @(posedge mclk or negedge rst_n)
	 begin
		if(!rst_n)
			s <= 2'b0;
		else if(cnt == CLK190 - 1'b1)
			s <= s + 1'b1;	
	 end
	 
	 assign aen = 4'b1111;
	 always @(*)
	 begin
		an <= 4'b1111;
		if(aen[s] == 1)
			an[s] <= 1'b0;
	 end
	 
	 reg [7:0] out0;
	 //小时的十位显示
	 always @(posedge mclk or negedge rst_n)
	 begin
		if(!rst_n)
			out0 <= 8'b0000_0011;
		else 
			begin
				case(hour_ten)
					0: out0 <= 8'b0000_0011;
					1: out0 <= 8'b1001_1111;
					2: out0 <= 8'b0010_0101;
					default: out0 <= 8'b0000_0011;
				endcase
			end
	 end
	 
	 reg [7:0] out1;
	 //小时的个位显示
	 always @(posedge mclk or negedge rst_n)
	 begin
		if(!rst_n)
			out1 <= 8'b0000_0010;
		else 
			begin
				case(hour_one)
					0: out1 <= 8'b0000_0010;
					1: out1 <= 8'b1001_1110;
					2: out1 <= 8'b0010_0100;
					3: out1 <= 8'b0000_1100;
					4: out1 <= 8'b1001_1000;
					5: out1 <= 8'b0100_1000;
					6: out1 <= 8'b0100_0000;
					7: out1 <= 8'b0001_1110;
					8: out1 <= 8'b0000_0000;
					9: out1 <= 8'b0000_1000;
					default: out1 <= 8'b0000_0010;
				endcase
			end
	 end
	 
	 reg [7:0] out2;
	 //分钟的十位显示
	 always @(posedge mclk or negedge rst_n)
	 begin
		if(!rst_n)
			out2 <= 8'b0000_0011;
		else 
			begin
				case(minute_ten)
					0: out2 <= 8'b0000_0011;
					1: out2 <= 8'b1001_1111;
					2: out2 <= 8'b0010_0101;
					3: out2 <= 8'b0000_1101;
					4: out2 <= 8'b1001_1001;
					5: out2 <= 8'b0100_1001;
					6: out2 <= 8'b0100_0001;
					7: out2 <= 8'b0001_1111;
					8: out2 <= 8'b0000_0001;
					9: out2 <= 8'b0000_1001;
					default: out2 <= 8'b0000_0011;
				endcase
			end
	 end
	 
	 reg [7:0] out3;
	 //分钟的个位显示
	 always @(posedge mclk or negedge rst_n)
	 begin
		if(!rst_n)
			out3 <= 8'b0000_0011;
		else 
			begin
				case(minute_one)
					0: out3 <= 8'b0000_0011;
					1: out3 <= 8'b1001_1111;
					2: out3 <= 8'b0010_0101;
					3: out3 <= 8'b0000_1101;
					4: out3 <= 8'b1001_1001;
					5: out3 <= 8'b0100_1001;
					6: out3 <= 8'b0100_0001;
					7: out3 <= 8'b0001_1111;
					8: out3 <= 8'b0000_0001;
					9: out3 <= 8'b0000_1001;
					default: out3 <= 8'b0000_0011;
				endcase
			end
	 end
	 
	 always @(posedge mclk or negedge rst_n)
	 begin
	 	if(!rst_n)
	 		out <= 8'b0000_0011;
	 	else 
			case(s)
			0: out <= out3;
			1: out <= out2;
			2: out <= out1;
			3: out <= out0;
			default: out <= 8'b0000_0011;
			endcase
	 end
	 
endmodule
