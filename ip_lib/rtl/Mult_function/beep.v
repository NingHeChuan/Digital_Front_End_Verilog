`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:44 01/15/2017 
// Design Name: 
// Module Name:    beep 
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
module beep(
        input mclk,
        input rst_n,
        input ring,
        //时钟
    input [2:0] a1,
    input [3:0] a2,
    input [2:0] a3,
    input [3:0] a4,
    //闹钟        ,
    input [2:0] b1,
    input [3:0] b2,
    input [2:0] b3,
    input [3:0] b4,
        output reg beep
    );
    
    parameter H_s = 25'd249999,
                        L_s = 25'd31249;
    
    reg [24:0] cnt_T;
    reg [15:0] cnt;
    reg flag;//闹钟标志
    
    always @(posedge mclk or negedge rst_n)
    begin
        if(!rst_n)
            flag <= 1'b0;
        else if(a1 == b1 && a2 == b2 && a3 == b3 && a4 == b4)
            flag <= 1'b1;
        else 
            flag <= 1'b0;
        end
    
    always @(posedge mclk or negedge rst_n)
    begin
        if(!rst_n)
            cnt_T <= 25'b0;
        else 
            cnt_T <= cnt_T + 1'b1;
    end
    
    always @(posedge mclk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                cnt <= L_s;
                beep <= 1'b0;
            end
          else if(cnt == 0 && flag && ring)
              begin
                    cnt <= cnt_T[24]?H_s:L_s;
                    beep <= ~beep;
                end
            else
            cnt <= cnt - 1'b1;
    end

endmodule

