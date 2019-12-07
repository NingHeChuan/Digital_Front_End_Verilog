`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:50 03/24/2018 
// Design Name: 
// Module Name:    Cordic_Cos_Sin 
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
module Cordic_Cos_Sin(
	input 					clk,//50Mhz
	input					rst_n,
    input                   sel,
    output signed [31:0]    sin_cos
    );
	
//---------------------------------------------------------
//迭代16次的角度，为了避免浮点运算，将所有角度左移16位
parameter 	ROT0	=	32'd2949120,	//45度*2^16
			ROT1	=	32'd1740970,	//26.5651度*2^16
			ROT2	=	32'd919876,		//14.0362度*2^16
			ROT3	=	32'd466944,		//7.1250度*2^16
			ROT4	=	32'd234376,		//3.5763度*2^16
			ROT5	=	32'd117303,		//1.7899度*2^16
			ROT6	=	32'd58668,		//0.8952度*2^16
			ROT7	=	32'd29334,		//0.4476度*2^16
			ROT8	=	32'd14667,		//0.2238度*2^16
			ROT9	=	32'd7333,		//0.1119度*2^16
			ROT10	=	32'd3670,		//0.0560度*2^16
			ROT11	=	32'd1835,		//0.0280度*2^16
			ROT12	=	32'd918,		//0.0140度*2^16
			ROT13	=	32'd459,		//0.0070度*2^16
			ROT14	=	32'd229,		//0.0035度*2^16
			ROT15	=	32'd118;		//0.0018度*2^16

parameter	PIPELINE 	=	'd16;
parameter	KN			=	32'd39797;//KN迭代16次提取出的cosi成绩之和 * 2^16



//------------------------------
//16次迭代寄存器
//定义xi,yi为有符号数，最高位为符号位
reg signed 	[31:0]	x0, y0, z0;
reg signed 	[31:0]	x1, y1, z1;
reg signed 	[31:0]	x2, y2, z2;
reg signed 	[31:0]	x3, y3, z3;
reg signed 	[31:0]	x4, y4, z4;
reg signed 	[31:0]	x5, y5, z5;
reg signed 	[31:0]	x6, y6, z6;
reg signed 	[31:0]	x7, y7, z7;
reg signed 	[31:0]	x8, y8, z8;
reg signed 	[31:0]	x9, y9, z9;
reg signed 	[31:0]	x10, y10, z10;
reg signed 	[31:0]	x11, y11, z11;
reg signed 	[31:0]	x12, y12, z12;
reg signed 	[31:0]	x13, y13, z13;
reg signed 	[31:0]	x14, y14, z14;
reg signed 	[31:0]	x15, y15, z15;
reg signed 	[31:0]	x16, y16, z16;
reg 		[1:0]	quadrant[PIPELINE:0];
reg 		[31:0]	phase_r;
reg         [15:0]  phase;
reg	signed [31:0]	sin;//角度正弦输 
reg	signed [31:0]	cos;//角度余弦输出
reg             [15:0]      cnt;
reg             [15:0]      cnt_n;


always @ (posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        cnt_n <= 'd0;
    else if(cnt_n == 16'd359)
        cnt_n <= 'd0;
    else
        cnt_n <= cnt_n + 1'b1;
end
/*
always @ (posedge clk or negedge rst_n)
begin
    if(!rst_n)
        cnt <= 1'b0;
    else
        cnt <= cnt_n;
end

*/

//生成相位0-359度,phase[17:16]为相位的象限,phase[15:10]为相位的值
always @ (posedge clk or negedge rst_n)
begin
    if(!rst_n)
        phase <= 1'b0;
    else
        phase <= cnt_n;
end


always @ (posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        phase_r <= 'd0;
    else if(phase <= 16'd90)
        phase_r <= phase;
    else if(phase > 16'd90 && phase <= 16'd180)
        phase_r <= {2'd01,phase - 16'd90};
    else if(phase > 16'd180 && phase <= 16'd270)
        phase_r <= {2'd10,phase - 16'd180};
    else if(phase > 16'd270)
        phase_r <= {2'd11,phase - 16'd270};
end
//-------------------------------------------
////di与yi方向相同
//xi+1 = xi - di * yi / 2^i 相当于右移
//yi+1 = yi + di * xi / 2^i
//zi+1 = zi - di * phasei
//------------------------------------------
//initial
//设置初始值x0 = kn, y0 = 0,z0 = phase,16次迭代后xn = cos(a), yn = sin(a)
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x0 <= 'd0;
		y0 <= 'd0;
		z0 <= 'd0;
	end
	else begin 
		x0 <= KN;
		y0 <= 'd0;
		z0 <= phase_r << 16;//将所有的运算数据都左移16位
	end
end
//iteration1
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x1 <= 'd0;
		y1 <= 'd0;
		z1 <= 'd0;
	end
	else if(z0[31] == 1'b0)begin
		x1 <= x0 - y0;
		y1 <= y0 + x0;
		z1 <= z0 - ROT0;
	end
	else begin//z0[31] == 1'b1
		x1 <= x0 + y0;
		y1 <= y0 - x0;
		z1 <= z0 + ROT0;
	end
end
//iteration2		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x2 <= 'd0;
		y2 <= 'd0;
		z2 <= 'd0;
	end
	else if(z1[31] == 1'b0)begin
		x2 <= x1 - (y1 >>> 1);
		y2 <= y1 + (x1 >>> 1);
		z2 <= z1 - ROT1;
	end
	else begin//z1[31] == 1'b1
		x2 <= x1 + (y1 >>> 1);
		y2 <= y1 - (x1 >>> 1);
		z2 <= z1 + ROT1;
	end
end
//iteration3	
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x3 <= 'd0;
		y3 <= 'd0;
		z3 <= 'd0;
	end
	else if(z2[31] == 1'b0)begin
		x3 <= x2 - (y2 >>> 2);
		y3 <= y2 + (x2 >>> 2);
		z3 <= z2 - ROT2;
	end
	else begin//z2[31] == 1'b1
		x3 <= x2 + (y2 >>> 2);
		y3 <= y2 - (x2 >>> 2);
		z3 <= z2 + ROT2;
	end
end
//iteration4		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x4 <= 'd0;
		y4 <= 'd0;
		z4 <= 'd0;
	end
	else if(z3[31] == 1'b0)begin
		x4 <= x3 - (y3 >>> 3);
		y4 <= y3 + (x3 >>> 3);
		z4 <= z3 - ROT3;
	end
	else begin//z3[31] == 1'b1
		x4 <= x3 + (y3 >>> 3);
		y4 <= y3 - (x3 >>> 3);
		z4 <= z3 + ROT3;
	end
end
//iteration5		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x5 <= 'd0;
		y5 <= 'd0;
		z5 <= 'd0;
	end
	else if(z4[31] == 1'b0)begin
		x5 <= x4 - (y4 >>> 4);
		y5 <= y4 + (x4 >>> 4);
		z5 <= z4 - ROT4;
	end
	else begin//z4[31] == 1'b1
		x5 <= x4 + (y4 >>> 4);
		y5 <= y4 - (x4 >>> 4);
		z5 <= z4 + ROT4;
	end
end
//iteration6		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x6 <= 'd0;
		y6 <= 'd0;
		z6 <= 'd0;
	end
	else if(z5[31] == 1'b0)begin
		x6 <= x5 - (y5 >>> 5);
		y6 <= y5 + (x5 >>> 5);
		z6 <= z5 - ROT5;
	end
	else begin//z5[31] == 1'b1
		x6 <= x5 + (y5 >>> 5);
		y6 <= y5 - (x5 >>> 5);
		z6 <= z5 + ROT5;
	end
end
//iteration7		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x7 <= 'd0;
		y7 <= 'd0;
		z7 <= 'd0;
	end
	else if(z6[31] == 1'b0)begin
		x7 <= x6 - (y6 >>> 6);
		y7 <= y6 + (x6 >>> 6);
		z7 <= z6 - ROT6;
	end
	else begin//z6[31] == 1'b1
		x7 <= x6 + (y6 >>> 6);
		y7 <= y6 - (x6 >>> 6);
		z7 <= z6 + ROT6;
	end
end
//iteration8		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x8 <= 'd0;
		y8 <= 'd0;
		z8 <= 'd0;
	end
	else if(z7[31] == 1'b0)begin
		x8 <= x7 - (y7 >>> 7);
		y8 <= y7 + (x7 >>> 7);
		z8 <= z7 - ROT7;
	end
	else begin//z7[31] == 1'b1
		x8 <= x7 + (y7 >>> 7);
		y8 <= y7 - (x7 >>> 7);
		z8 <= z7 + ROT7;
	end
end
//iteration9		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x9 <= 'd0;
		y9 <= 'd0;
		z9 <= 'd0;
	end
	else if(z8[31] == 1'b0)begin
		x9 <= x8 - (y8 >>> 8);
		y9 <= y8 + (x8 >>> 8);
		z9 <= z8 - ROT8;
	end
	else begin//z8[31] == 1'b1
		x9 <= x8 + (y8 >>> 8);
		y9 <= y8 - (x8 >>> 8);
		z9 <= z8 + ROT8;
	end
end
//iteration10		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x10 <= 'd0;
		y10 <= 'd0;
		z10 <= 'd0;
	end
	else if(z9[31] == 1'b0)begin
		x10 <= x9 - (y9 >>> 9);
		y10 <= y9 + (x9 >>> 9);
		z10 <= z9 - ROT9;
	end
	else begin//z9[31] == 1'b1
		x10 <= x9 + (y9 >>> 9);
		y10 <= y9 - (x9 >>> 9);
		z10 <= z9 + ROT9;
	end
end
//iteration11		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x11 <= 'd0;
		y11 <= 'd0;
		z11 <= 'd0;
	end
	else if(z10[31] == 1'b0)begin
		x11 <= x10 - (y10 >>> 10);
		y11 <= y10 + (x10 >>> 10);
		z11 <= z10 - ROT10;
	end
	else begin//z10[31] == 1'b1
		x11 <= x10 + (y10 >>> 10);
		y11 <= y10 - (x10 >>> 10);
		z11 <= z10 + ROT10;
	end
end
//iteration12		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x12 <= 'd0;
		y12 <= 'd0;
		z12 <= 'd0;
	end
	else if(z11[31] == 1'b0)begin
		x12 <= x11 - (y11 >>> 11);
		y12 <= y11 + (x11 >>> 11);
		z12 <= z11 - ROT11;
	end
	else begin//z11[31] == 1'b1
		x12 <= x11 + (y11 >>> 11);
		y12 <= y11 - (x11 >>> 11);
		z12 <= z11 + ROT11;
	end
end
//iteration13		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x13 <= 'd0;
		y13 <= 'd0;
		z13 <= 'd0;
	end
	else if(z12[31] == 1'b0)begin
		x13 <= x12 - (y12 >>> 12);
		y13 <= y12 + (x12 >>> 12);
		z13 <= z12 - ROT12;
	end
	else begin//z12[31] == 1'b1
		x13 <= x12 + (y12 >>> 12);
		y13 <= y12 - (x12 >>> 12);
		z13 <= z12 + ROT12;
	end
end
//iteration14		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x14 <= 'd0;
		y14 <= 'd0;
		z14 <= 'd0;
	end
	else if(z13[31] == 1'b0)begin
		x14 <= x13 - (y13 >>> 13);
		y14 <= y13 + (x13 >>> 13);
		z14 <= z13 - ROT13;
	end
	else begin//z13[31] == 1'b1
		x14 <= x13 + (y13 >>> 13);
		y14 <= y13 - (x13 >>> 13);
		z14 <= z13 + ROT13;
	end
end
//iteration15	
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x15 <= 'd0;
		y15 <= 'd0;
		z15 <= 'd0;
	end
	else if(z14[31] == 1'b0)begin
		x15 <= x14 - (y14 >>> 14);
		y15 <= y14 + (x14 >>> 14);
		z15 <= z14 - ROT14;
	end
	else begin//z14[31] == 1'b1
		x15 <= x14 + (y14 >>> 14);
		y15 <= y14 - (x14 >>> 14);
		z15 <= z14 + ROT14;
	end
end
//iteration16		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x16 <= 'd0;
		y16 <= 'd0;
		z16 <= 'd0;
	end
	else if(z15[31] == 1'b0)begin
		x16 <= x15 - (y15 >>> 15);
		y16 <= y15 + (x15 >>> 15);
		z16 <= z15 - ROT15;
	end
	else begin//z15[31] == 1'b1
		x16 <= x15 + (y15 >>> 15);
		y16 <= y15 - (x15 >>> 15);
		z16 <= z15 + ROT15;
	end
end
//-----------------------------------------
//判断输入角度在哪一象限 lag 16clk
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		quadrant[0]	 <= 'b0;
		quadrant[1]	 <= 'b0;
		quadrant[2]	 <= 'b0;
		quadrant[3]	 <= 'b0;
		quadrant[4]	 <= 'b0;
		quadrant[5]	 <= 'b0;
		quadrant[6]	 <= 'b0;
		quadrant[7]	 <= 'b0;
		quadrant[8]	 <= 'b0;
		quadrant[9]	 <= 'b0;
		quadrant[10] <= 'b0;
		quadrant[11] <= 'b0;
		quadrant[12] <= 'b0;
		quadrant[13] <= 'b0;
		quadrant[14] <= 'b0;
		quadrant[15] <= 'b0;
		quadrant[16] <= 'b0;
	end
	else begin//通过输入角度的最高两位判断角度所在象限的位置
		quadrant[0]	 <= phase_r[17:16];
		quadrant[1]	 <= quadrant[0];
		quadrant[2]	 <= quadrant[1];
		quadrant[3]	 <= quadrant[2];
		quadrant[4]	 <= quadrant[3];
		quadrant[5]	 <= quadrant[4];
		quadrant[6]	 <= quadrant[5];
		quadrant[7]	 <= quadrant[6];
		quadrant[8]	 <= quadrant[7];
		quadrant[9]	 <= quadrant[8];
		quadrant[10] <= quadrant[9];
		quadrant[11] <= quadrant[10];
		quadrant[12] <= quadrant[11];
		quadrant[13] <= quadrant[12];
		quadrant[14] <= quadrant[13];
		quadrant[15] <= quadrant[14];
		quadrant[16] <= quadrant[15];
	end
end
//------------------------------------------
//设置初始值x0 = kn, y0 = 0,16次迭代后x16 = cos(a), y16 = sin(a)	
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cos <= 'b0;
		sin <= 'b0;
	end
	else begin
		case(quadrant[16])
		//如果角度在第一象限，sin(x) = sin(a),cos(x) = sin(a)
		2'b00:begin
			cos <= x16;
			sin <= y16;
		end
		//如果角度在第二象限，sin(x) = sin(a+90) = cos(a),cos(x) = cos(a+90) = -sin(a) 
		2'b01:begin
			cos <= ~(y16) + 1'b1;//取反加一，表有符号数
			sin <= x16;
		end
		//如果角度在第三象限，sin(x) = sin(a+180) = -sin(a),cos(x) = cos(a+180) = -cos(a)
		2'b10:begin
			cos <= ~(x16) + 1'b1;
			sin <= ~(y16) + 1'b1;
		end
		//如果角度在第四象限，sin(x) = sin(a+270) = cos(a),cos(x) = cos(a+270) = -sin(a)
		2'b11:begin
			cos <= y16;
			sin <= ~(x16) + 1'b1;
		end
		default:begin
			cos <= 'b0;
			sin <= 'b0;
		end
		endcase
	end
end

assign  sin_cos = (sel == 1'b1)? sin : cos;

endmodule
