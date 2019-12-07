`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:44 01/17/2017 
// Design Name: 
// Module Name:    lcd_qc12864b 
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
module lcd_qc12864b(
			input mclk,
			input rst_n,
			output reg lcd_rs,/*并口方式：rs=1时，当mpu进行读模块操作，指向地址寄存器
																						当mpu进行写模块操作，指向指令寄存器
																		rs=0时，无论进行读/写操作，都指向数据寄存器
													串口方式：cs：串行片选信号，高电平有效*/
			output lcd_rw, //高电平读操作，低电平写操作
			output lcd_e,//使能信号高电平有效
			output reg [7:0]lcd_data//八位数据总线  
//    output PSB//串并控制端口,H为并行，L为串行,直接接5v  
//    output LCD_Rst,//液晶的复位端口，低电平有效
    );
    	
    reg lcd_clk;//需要500khz频率的时钟
    reg [7:0] state;//状态机寄存器
    reg [23:0] cnt;//分频驱动12864计数器
    reg flag = 1'b1;//显示完成标志 
    reg [5:0] char_cnt;// 
    reg [7:0] data_disp = 8'd32;//一个字节是八位,一个英文字符是一个字节，中文是俩个字节
    
    parameter T500KHZ=24'd49999;  
//  parameter T500KHZ=24'd24_999_999;//测试低频现象  
  	 //parameter T500KHZ=24'd24_499;//仿真专用
		
		//分频500khz时钟
		always @(posedge mclk or negedge rst_n)
		begin
			if(!rst_n)begin
				lcd_clk <= 1'b0;
				cnt <= 24'd0;
			end
			else if(cnt == T500KHZ)begin
				cnt <= 24'd0;
				lcd_clk <= ~lcd_clk;
			end
			else
				cnt <= cnt + 1'd1;
		end		
		
		//状态机8个状态设置
    //state machine description,8个状态 只要用八位二进制就可以全部表示  
    parameter IDLE=8'b00_000_000,//初始状态  
    					SETFUNCTION=8'b00_000_001,//功能设置，8-bit+基本指令集0x30    
  						SWITCHMODE=8'b00_000_100,//设置显示开和光标闪烁关闭  
  						CLEAR=8'b00_001_000,//清屏操作  
  						SETMODE=8'b00_010_000,//点设置  
  						SETDDRAM=8'b00_100_000,//起始行设置  
  						WRITERAM=8'b01_000_000,//写设置//写入寄存器  
  						STOP=8'b10_000_000;//LCD操作停止，释放其控制
	  
	  //三段式书写状态机
	  //状态初始值
	  always @(posedge lcd_clk or negedge rst_n)
	  begin
	  	if(!rst_n)
	  		lcd_rs <= 1'b0;
	  	else begin
	  		if(state == WRITERAM)
	  			lcd_rs <= 1'b1;
	  		else
	  			lcd_rs <= 1'b0;
	  	end
	  end
	  
	  //如果定义了LCD_Rst俩个端口的话，可做如下设置  
    //assign LCD_Rst=1'b1;  
    //assign PSB=1'b1;  
    assign lcd_rw = 1'b0;//只是写操作，不需要读操作  
    assign lcd_e = (flag==1)?lcd_clk:1'b0;//使能信号与液晶时钟同步
	  
	  always @(posedge lcd_clk or negedge rst_n)
	  begin
	  	if(!rst_n)begin
	  		state <= IDLE; 	
	  		lcd_data <= 8'bzz_zzz_zzz;
	  		char_cnt <= 6'd0;
	  	end
	  	else begin
	  		case(state)
	  			IDLE:begin
	  				state <=  SETFUNCTION;//功能设置，8-bit+基本指令集0x30
	  				lcd_data <= 8'h30;
	  			end
	  			
	  			SETFUNCTION:begin
	  				state <= SWITCHMODE;//设置显示开和光标闪烁关闭
	  				lcd_data <= 8'h30;
	  			end	  			
        
	  			SWITCHMODE:begin
	  				state <= CLEAR;//清屏操作
	  				lcd_data <= 8'h0c;//显示设置，全显示开，光标和闪烁关
	  			end	  			
	  			CLEAR:begin
	  				state <= SETMODE;//点设置  
            lcd_data <= 8'h01;//清屏
          end          
          SETMODE:begin
          	state <= SETDDRAM;//起始行设置
          	lcd_data <= 8'h06;//点设置,光标右移，地址加一,整体不动
          end         
          SETDDRAM:begin
          	state <= WRITERAM;//写设置
				    if(char_cnt==6'd0)  
				        lcd_data<=8'h80;//line1  
				    else if(char_cnt == 6'd12)
				        lcd_data<=8'h90;//line2
				    else if(char_cnt == 6'd25)
				    	lcd_data <= 8'h88;
				  end				  
					WRITERAM:begin  
				    if(char_cnt < 6'd12)  
				    begin  
				    	char_cnt <= char_cnt + 1'b1;  
				    	lcd_data <= data_disp;  
				    	if(char_cnt == 6'd11)  
				    	    state <= SETDDRAM;//第一行写完后从新返回设置地址  
				    	else
				    	    state <= WRITERAM;//否则继续写入数据 
				    end  
				    else if(char_cnt > 6'd11 && char_cnt < 6'd25)  
				    begin  
				    	char_cnt <= char_cnt + 1'b1;  
				    	lcd_data <= data_disp; 
				    	if(char_cnt == 6'd24)  
				    		state <= SETDDRAM;//第二行写完后从新返回设置地址 
				    	else
				    		state <= WRITERAM;//否则继续写入数据          
				    end
				    else if(char_cnt > 6'd24 && char_cnt < 6'd41)begin
				    	if(char_cnt == 6'd40)begin
				    		state <= STOP;
				    		char_cnt <= 6'd0;
				    		flag <= 1'b0; 
				    	end
				    	else begin
				    		lcd_data <= data_disp;//不管到没到第25个都要继续写数  
				    		state <= WRITERAM;  
				    		char_cnt <= char_cnt + 1'b1;  
				    	end
				    end
 					end				
          STOP: state <= STOP;//LCD操作停止，释放其控制
          default: state <= IDLE;//回到初始状态
        endcase  
      end           
 		end  
 		
		always@(char_cnt)  
		begin 
			case(char_cnt) 
				//显示第一行 
			    6'd0:data_disp=8'h20;  
			    6'd1:data_disp=8'h20;  
			    6'd2:data_disp=8'h20;  
			    6'd3:data_disp=8'h20;  
			    6'd4:data_disp=8'hce;  
			    6'd5:data_disp=8'hd2;  
			    6'd6:data_disp=8'hcf;  
			    6'd7:data_disp=8'heb;  
			    6'd8:data_disp=8'hc4;  
			    6'd9:data_disp=8'he3;  
			    6'd10:data_disp=8'h20;  
			    6'd11:data_disp=8'h20;  
			  //第二行  
			    6'd12:data_disp=8'h20;  
			    6'd13:data_disp=8'h20;  
			    6'd14:data_disp=8'hd0;  
			    6'd15:data_disp=8'ha1;  
			    6'd16:data_disp=8'hc5;  
			    6'd17:data_disp=8'hdd;  
			    6'd18:data_disp=8'hc5;  
			    6'd19:data_disp=8'hdd;  
			    6'd20:data_disp=8'hb6;  
			    6'd21:data_disp=8'hf9;  
			    6'd22:data_disp="!";  
			    6'd23:data_disp="!";  
			    6'd24:data_disp="!";  
			  //第三行
			  	6'd25:data_disp=8'h20;  
			    6'd26:data_disp=8'h20;  
			    6'd27:data_disp=8'hce;  
			    6'd28:data_disp=8'hd2;  
			    6'd29:data_disp=8'hb0;  
			    6'd30:data_disp=8'hae;  
			    6'd31:data_disp=8'hc4;  
			    6'd32:data_disp=8'he3;  
			    6'd33:data_disp=",";  
			    6'd34:data_disp=8'h20;  
			    6'd35:data_disp=8'hc4;  
			    6'd36:data_disp=8'hbe;  
			    6'd37:data_disp=8'hc2;
			    6'd38:data_disp=8'hed;
			    6'd39:data_disp="!";
			    //default:data_disp=8'h32;  
			endcase  
		          
		end  

endmodule
