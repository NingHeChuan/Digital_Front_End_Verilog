`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:05 03/25/2018 
// Design Name: 
// Module Name:    Cordic_Arctan 
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
module Cordic_Arctan(
	input 					clk,//50Mhz
	input					rst_n,
    input                   sel,
    input                   ctrl,
	output		reg 	[31:0]	sig_out
    );


reg	[31:0]	vector_d;    
reg	[31:0]	arctan;              //角度反正切输出
reg			[31:0]	xcoor;
reg			[31:0]	ycoor;
reg     [20:0]   cnt;
reg     data_en;
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        cnt <= 'd0;
    else if(cnt == 184)
        cnt <= 0;
    else if(sel == 1'b1 || ctrl == 1'b1) 
        cnt <= cnt + 1'b1;    
end


always  @(*)begin
    case(cnt)
    'd0:begin
        xcoor <= 100;
        ycoor <= 100;
        data_en <= 1'b1;
    end
    'd18:begin
        xcoor <= 100;
        ycoor <= 200;
        data_en <= 1'b1;
    end
    'd36:begin
        xcoor <= 100;
        ycoor <= 300;
        data_en <= 1'b1;
    end
    'd54:begin
        xcoor <= 100;
        ycoor <= 400;
        data_en <= 1'b1;
    end
    'd72:begin
        xcoor <= 100;
        ycoor <= 500;
        data_en <= 1'b1;
    end
    'd90:begin
        xcoor <= 100;
        ycoor <= 600;
        data_en <= 1'b1;
    end
    'd118:begin
        xcoor <= 100;
        ycoor <= 700;
        data_en <= 1'b1;
    end
    'd142:begin
        xcoor <= 100;
        ycoor <= 800;
        data_en <= 1'b1;
    end
    'd164:begin
        xcoor <= 100;
        ycoor <= 900;
        data_en <= 1'b1;
    end
    'd182:begin
        xcoor <= 100;
        ycoor <= 1000;
        data_en <= 1'b1;
    end
    default:begin
        xcoor <= xcoor;
        ycoor <= ycoor;
        data_en <= 1'b0;
    end
    endcase
end




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
parameter	KN			=	32'd39797;//KN迭代16次提取出的cosi成绩之和

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

//-------------------------------------------
//di与yi方向相反
//xi+1 = xi - di * yi / 2^i 相当于右移
//yi+1 = yi + di * xi / 2^i 
//zi+1 = zi - di * phasei
//------------------------------------------
//initial
//设置初始值x0 = xcoor, y0 = ycoor,z0 = 0,16次迭代后zn = arctan(y/x)
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x0 <= 'd0;
		y0 <= 'd0;
		z0 <= 'd0;
	end
	else begin 
		x0 <= xcoor;
		y0 <= ycoor;
		z0 <= 'd0;
	end
end
//iteration1
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x1 <= 'd0;
		y1 <= 'd0;
		z1 <= 'd0;
	end
	else if(y0 != 'b0)begin
		if(y0[31] == 1'b1)begin
			x1 <= x0 - y0;
			y1 <= y0 + x0;
			z1 <= z0 - ROT0;
		end
		else begin//y0[31] == 1'b0
			x1 <= x0 + y0;
			y1 <= y0 - x0;
			z1 <= z0 + ROT0;
		end
	end
	else begin
		x1 <= x1;
		y1 <= y1;
		z1 <= z1;
	end
end
//iteration2		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x2 <= 'd0;
		y2 <= 'd0;
		z2 <= 'd0;
	end
	else if(y1 != 'b0)begin
		if(y1[31] == 1'b1)begin
			x2 <= x1 - (y1 >>> 1);
			y2 <= y1 + (x1 >>> 1);
			z2 <= z1 - ROT1;
		end
		else begin//y1[31] == 1'b0
			x2 <= x1 + (y1 >>> 1);
			y2 <= y1 - (x1 >>> 1);
			z2 <= z1 + ROT1;
		end
	end
	else begin
		x2 <= x2;
		y2 <= y2;
		z2 <= z2;
	end
end
//iteration3	
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x3 <= 'd0;
		y3 <= 'd0;
		z3 <= 'd0;
	end
	else if(y2 != 'b0)begin
		if(y2[31] == 1'b1)begin
			x3 <= x2 - (y2 >>> 2);
			y3 <= y2 + (x2 >>> 2);
			z3 <= z2 - ROT2;
		end
		else begin//y2[31] == 1'b0
			x3 <= x2 + (y2 >>> 2);
			y3 <= y2 - (x2 >>> 2);
			z3 <= z2 + ROT2;
		end
	end
	else begin
		x3 <= x3;
		y3 <= y3;
		z3 <= z3;
	end
end
//iteration4		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x4 <= 'd0;
		y4 <= 'd0;
		z4 <= 'd0;
	end
	else if(y3 != 'b0)begin
		if(y3[31] == 1'b1)begin
			x4 <= x3 - (y3 >>> 3);
			y4 <= y3 + (x3 >>> 3);
			z4 <= z3 - ROT3;
		end
		else begin//y3[31] == 1'b0
			x4 <= x3 + (y3 >>> 3);
			y4 <= y3 - (x3 >>> 3);
			z4 <= z3 + ROT3;
		end
	end
	else begin
		x4 <= x4;
		y4 <= y4;
		z4 <= z4;
	end
end
//iteration5		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x5 <= 'd0;
		y5 <= 'd0;
		z5 <= 'd0;
	end
	else if(y4 != 'b0)begin
	if(y4[31] == 1'b1)begin
			x5 <= x4 - (y4 >>> 4);
			y5 <= y4 + (x4 >>> 4);
			z5 <= z4 - ROT4;
		end
		else begin//y4[31] == 1'b0
			x5 <= x4 + (y4 >>> 4);
			y5 <= y4 - (x4 >>> 4);
			z5 <= z4 + ROT4;
		end
	end
	else begin
		x5 <= x5;
		y5 <= y5;
		z5 <= z5;
	end
end
//iteration6		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x6 <= 'd0;
		y6 <= 'd0;
		z6 <= 'd0;
	end
	else if(y5 != 'b0)begin
		if(y5[31] == 1'b1)begin
			x6 <= x5 - (y5 >>> 5);
			y6 <= y5 + (x5 >>> 5);
			z6 <= z5 - ROT5;
		end
		else begin//y5[31] == 1'b0
			x6 <= x5 + (y5 >>> 5);
			y6 <= y5 - (x5 >>> 5);
			z6 <= z5 + ROT5;
		end
	end
	else begin
		x6 <= x6;
		y6 <= y6;
		z6 <= z6;
	end
end
//iteration7		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x7 <= 'd0;
		y7 <= 'd0;
		z7 <= 'd0;
	end
	else if(y6 != 'b0)begin
		if(y6[31] == 1'b1)begin
			x7 <= x6 - (y6 >>> 6);
			y7 <= y6 + (x6 >>> 6);
			z7 <= z6 - ROT6;
		end
		else begin//y6[31] == 1'b0
			x7 <= x6 + (y6 >>> 6);
			y7 <= y6 - (x6 >>> 6);
			z7 <= z6 + ROT6;
		end
	end
	else begin
		x7 <= x7;
		y7 <= y7;
		z7 <= z7;
	end
end
//iteration8		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x8 <= 'd0;
		y8 <= 'd0;
		z8 <= 'd0;
	end
	else if(y7 != 'b0)begin
		if(y7[31] == 1'b1)begin
			x8 <= x7 - (y7 >>> 7);
			y8 <= y7 + (x7 >>> 7);
			z8 <= z7 - ROT7;
		end
		else begin//y7[31] == 1'b0
			x8 <= x7 + (y7 >>> 7);
			y8 <= y7 - (x7 >>> 7);
			z8 <= z7 + ROT7;
		end
	end
	else begin
		x8 <= x8;
		y8 <= y8;
		z8 <= z8;
	end
end
//iteration9		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x9 <= 'd0;
		y9 <= 'd0;
		z9 <= 'd0;
	end
	else if(y8 != 'b0)begin
		if(y8[31] == 1'b1)begin
			x9 <= x8 - (y8 >>> 8);
			y9 <= y8 + (x8 >>> 8);
			z9 <= z8 - ROT8;
		end
		else begin//y8[31] == 1'b0
			x9 <= x8 + (y8 >>> 8);
			y9 <= y8 - (x8 >>> 8);
			z9 <= z8 + ROT8;
		end
	end
	else begin
		x9 <= x9;
		y9 <= y9;
		z9 <= z9;
	end
end
//iteration10		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x10 <= 'd0;
		y10 <= 'd0;
		z10 <= 'd0;
	end
	else if(y9 != 'b0)begin
		if(y9[31] == 1'b1)begin
			x10 <= x9 - (y9 >>> 9);
			y10 <= y9 + (x9 >>> 9);
			z10 <= z9 - ROT9;
		end
		else begin//y9[31] == 1'b0
			x10 <= x9 + (y9 >>> 9);
			y10 <= y9 - (x9 >>> 9);
			z10 <= z9 + ROT9;
		end
	end
	else begin
		x10 <= x10;
		y10 <= y10;
		z10 <= z10;
	end
end
//iteration11		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x11 <= 'd0;
		y11 <= 'd0;
		z11 <= 'd0;
	end
	else if(y10 != 'b0)begin
		if(y10[31] == 1'b1)begin
			x11 <= x10 - (y10 >>> 10);
			y11 <= y10 + (x10 >>> 10);
			z11 <= z10 - ROT10;
		end
		else begin//y10[31] == 1'b0
			x11 <= x10 + (y10 >>> 10);
			y11 <= y10 - (x10 >>> 10);
			z11 <= z10 + ROT10;
		end
	end
	else begin
		x11 <= x11;
		y11 <= y11;
		z11 <= z11;
	end
end
//iteration12		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x12 <= 'd0;
		y12 <= 'd0;
		z12 <= 'd0;
	end
	else if(y11 != 'b0)begin
		if(y11[31] == 1'b1)begin
			x12 <= x11 - (y11 >>> 11);
			y12 <= y11 + (x11 >>> 11);
			z12 <= z11 - ROT11;
		end
		else begin//y11[31] == 1'b0
			x12 <= x11 + (y11 >>> 11);
			y12 <= y11 - (x11 >>> 11);
			z12 <= z11 + ROT11;
		end
	end
	else begin
		x12 <= x12;
		y12 <= y12;
		z12 <= z12;
	end
end
//iteration13		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x13 <= 'd0;
		y13 <= 'd0;
		z13 <= 'd0;
	end
	else if(y12 != 'b0)begin
		if(y12[31] == 1'b1)begin
			x13 <= x12 - (y12 >>> 12);
			y13 <= y12 + (x12 >>> 12);
			z13 <= z12 - ROT12;
		end
		else begin//y12[31] == 1'b0
			x13 <= x12 + (y12 >>> 12);
			y13 <= y12 - (x12 >>> 12);
			z13 <= z12 + ROT12;
		end
	end
	else begin
		x13 <= x13;
		y13 <= y13;
		z13 <= z13;
	end
end
//iteration14		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x14 <= 'd0;
		y14 <= 'd0;
		z14 <= 'd0;
	end
	else if(y13 != 'b0)begin
		if(y13[31] == 1'b1)begin
			x14 <= x13 - (y13 >>> 13);
			y14 <= y13 + (x13 >>> 13);
			z14 <= z13 - ROT13;
		end
		else begin//y13[31] == 1'b0
			x14 <= x13 + (y13 >>> 13);
			y14 <= y13 - (x13 >>> 13);
			z14 <= z13 + ROT13;
		end
	end
	else begin
		x14 <= x14;
		y14 <= y14;
		z14 <= z14;
	end
end
//iteration15	
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x15 <= 'd0;
		y15 <= 'd0;
		z15 <= 'd0;
	end
	else if(y14 != 'b0)begin
		if(y14[31] == 1'b1)begin
			x15 <= x14 - (y14 >>> 14);
			y15 <= y14 + (x14 >>> 14);
			z15 <= z14 - ROT14;
		end
		else begin//y14[31] == 1'b0
			x15 <= x14 + (y14 >>> 14);
			y15 <= y14 - (x14 >>> 14);
			z15 <= z14 + ROT14;
		end
	end
	else begin
		x15 <= x15;
		y15 <= y15;
		z15 <= z15;
	end
end
//iteration16		
always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		x16 <= 'd0;
		y16 <= 'd0;
		z16 <= 'd0;
	end
	else if(y15 != 'b0)begin
		if(y15[31] == 1'b1)begin
			x16 <= x15 - (y15 >>> 15);
			y16 <= y15 + (x15 >>> 15);
			z16 <= z15 - ROT15;
		end
		else begin//y15[31] == 1'b0
			x16 <= x15 + (y15 >>> 15);
			y16 <= y15 - (x15 >>> 15);
			z16 <= z15 + ROT15;
		end
	end
	else begin
		x16 <= x16;
		y16 <= y16;
		z16 <= z16;
	end
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		arctan <= 'd0;
	else if(y0 == 'b0)
		arctan <= z0 >> 16;
	else if(y1 == 'b0)
		arctan <= z1 >> 16;
	else if(y2 == 'b0)
		arctan <= z2 >> 16;
	else if(y3 == 'b0)
		arctan <= z3 >> 16;
	else if(y4 == 'b0)
		arctan <= z4 >> 16;
	else if(y5 == 'b0)
		arctan <= z5 >> 16;
	else if(y6 == 'b0)
		arctan <= z6 >> 16;
	else if(y7 == 'b0)
		arctan <= z7 >> 16;
	else if(y8 == 'b0)
		arctan <= z8 >> 16;
	else if(y9 == 'b0)
		arctan <= z9 >> 16;
	else if(y10 == 'b0)
		arctan <= z10 >> 16;
	else if(y11 == 'b0)
		arctan <= z11 >> 16;
	else if(y12 == 'b0)
		arctan <= z12 >> 16;
	else if(y13 == 'b0)
		arctan <= z13 >> 16;
	else if(y14 == 'b0)
		arctan <= z14 >> 16;
	else if(y15 == 'b0)
		arctan <= z15 >> 16;
	else
		arctan <= z16 >> 16;
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		vector_d <= 'd0;
	else if(y0 == 'b0)
		vector_d <= x0 * KN >> 16;
	else if(y1 == 'b0)
		vector_d <= x1 * KN >> 16;
	else if(y2 == 'b0)
		vector_d <= x2 * KN >> 16;
	else if(y3 == 'b0)
		vector_d <= x3 * KN >> 16;
	else if(y4 == 'b0)
		vector_d <= x4 * KN >> 16;
	else if(y5 == 'b0)
		vector_d <= x5 * KN >> 16;
	else if(y6 == 'b0)
		vector_d <= x6 * KN >> 16;
	else if(y7 == 'b0)
		vector_d <= x7 * KN >> 16;
	else if(y8 == 'b0)
		vector_d <= x8 * KN >> 16;
	else if(y9 == 'b0)
		vector_d <= x9 * KN >> 16;
	else if(y10 == 'b0)
		vector_d <= x10 * KN >> 16;
	else if(y11 == 'b0)
		vector_d <= x11 * KN >> 16;
	else if(y12 == 'b0)
		vector_d <= x12 * KN >> 16;
	else if(y13 == 'b0)
		vector_d <= x13 * KN >> 16;
	else if(y14 == 'b0)
		vector_d <= x14 * KN >> 16;
	else if(y15 == 'b0)
		vector_d <= x15 * KN >> 16;
	else
		vector_d <= x16 * KN >> 16;
end

//assign sig_out = (sel == 1'b1 && data_en == 1'b1)? arctan: vector_d;

always @(*)begin
    if(sel == 1'b1 && data_en == 1'b1)
        sig_out = arctan;
    else if(ctrl == 1'b1 && data_en == 1'b1)
        sig_out = vector_d;
    else 
        sig_out = 'd0;
end

endmodule 
