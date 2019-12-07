`timescale      1ns/1ps
// *********************************************************************************
// Project Name :       
// Author       : NingHeChuan
// Email        : ninghechuan@foxmail.com
// Blogs        : http://www.cnblogs.com/ninghechuan/
// File Name    : Simple_Caculator.v
// Module Name  :
// Called By    :
// Abstract     :
//
// CopyRight(c) 2018, NingHeChuan Studio.. 
// All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date         By              Version                 Change Description
// -----------------------------------------------------------------------
// 2018/7/30    NingHeChuan       1.0                     Original
//  
// *********************************************************************************

module Simple_Caculator(
    input                   clk,
    input                   rst_n,
    input                   key_flag,
    input           [3:0]   key_value,
    output          [15:0]  outcome, 
    output    reg   [15:0]  disp_num,
    output                  disp_sum_en
);

//-------------------------------------------------------
parameter       NUM_IDLE    =   4'd0;
parameter       NUM_ONE     =   4'd1;
parameter       NUM_CAL1    =   4'd2;
parameter       NUM_TWO     =   4'd3;
parameter       NUM_CAL2    =   4'd4;
parameter       NUM_THREE   =   4'd5;
parameter       NUM_CAL3    =   4'd6;
parameter       NUM_FOUR    =   4'd7;
parameter       NUM_CAL4    =   4'd8;
parameter       NUM_FIVE    =   4'd9;
parameter       NUM_CAL5    =   4'd10;
parameter       NUM_SUM     =   4'd11;
//
parameter       SIGN_ADD    =   4'd1;
parameter       SIGN_SUB    =   4'd2;
parameter       SIGN_MUL    =   4'd3;
parameter       SIGN_SUM    =   4'd4;

//
reg     [3:0]   pre_state;
reg     [3:0]   next_state;
//
reg     [15:0]  num_one;
reg     [15:0]  num_two;
reg     [15:0]  num_three;
reg     [15:0]  num_four;
reg     [15:0]  num_five;
reg     [15:0]  num_sum;
reg     [2:0]   sign_one;
reg     [2:0]   sign_two;
reg     [2:0]   sign_three;
reg     [2:0]   sign_four;
reg     [2:0]   sign_five;

reg             sign_flag;
reg             mul_end;
reg             sub_end;
//
wire     [15:0]  num_one_r;
wire     [15:0]  num_two_r;
wire     [15:0]  num_three_r;
wire     [15:0]  num_four_r;
wire     [15:0]  num_five_r;
//
reg            key_flag_r;
//
reg      [3:0]      cnt;

assign  disp_sum_en = (key_value == 4'hd)? 1'b1: 1'b0;

always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        disp_num <= 16'd0;
    else begin
        case(next_state)
        NUM_ONE:    disp_num <=   num_one;
        NUM_TWO:    disp_num <=   num_two;
        NUM_THREE:  disp_num <= num_three;
        NUM_FOUR:   disp_num <=  num_four;
        NUM_FIVE:   disp_num <=  num_five;
        default:    disp_num <=  disp_num;
        endcase
    end  
end      
         
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        cnt <= 4'd0;
    else if(key_value == 4'hd && key_flag)
        cnt <= 4'd4;
    else if(cnt == 4'd5 && pre_state == NUM_SUM)
        cnt <= 4'd0;
    else if(key_flag_r == 1'b1 && sign_flag == 1'b1)
        cnt <= cnt + 1'b1;
    else 
        cnt <= cnt;
end

always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
      sign_one  <= 3'b0; 
      sign_two  <= 3'b0;
      sign_three<= 3'b0;
      sign_four <= 3'b0;
      sign_five <= 3'b0;
    end
    else begin 
        case(cnt)
        4'd0:begin
            if(key_value == 4'ha && key_flag)
                sign_one  <= SIGN_ADD;
            else if(key_value == 4'hb)begin
                if(sub_end == 1'b1)
                    sign_one <= 3'd0;
                else 
                    sign_one <= SIGN_SUB;
            end
            else if(key_value == 4'hc)begin
                if(mul_end == 1'b1)
                    sign_one <= 3'd0;
                else 
                    sign_one <= SIGN_MUL;
            end
            else if(key_value == 4'hd && key_flag)
                sign_one <= SIGN_SUM;
            else 
                sign_one <= sign_one;
        end
        4'd1:begin
            if(key_value == 4'ha && key_flag)
                sign_two  <= SIGN_ADD;
            else if(key_value == 4'hb)begin
                if(sub_end == 1'b1)
                    sign_two <= 3'd0;
                else 
                    sign_two <= SIGN_SUB;
            end
            else if(key_value == 4'hc)begin
                if(mul_end == 1'b1)
                    sign_two <= 3'd0;
                else 
                    sign_two <= SIGN_MUL;
            end
            else if(key_value == 4'hd && key_flag)
                sign_two <= SIGN_SUM;
            else 
                sign_two <= sign_two;
        end
        4'd2:begin
            if(key_value == 4'ha && key_flag)
                sign_three  <= SIGN_ADD;
            else if(key_value == 4'hb)begin
                if(sub_end == 1'b1)
                    sign_three <= 3'd0;
                else 
                    sign_three <= SIGN_SUB;
            end
            else if(key_value == 4'hc)begin
                if(mul_end == 1'b1)
                    sign_three <= 3'd0;
                else 
                    sign_three <= SIGN_MUL;
            end
            else if(key_value == 4'hd && key_flag)
                sign_three <= SIGN_SUM;
            else 
                sign_three <= sign_three;
        end
        4'd3:begin
            if(key_value == 4'ha && key_flag)
                sign_four  <= SIGN_ADD;
            else if(key_value == 4'hb)begin
                if(sub_end == 1'b1)
                    sign_four <= 3'd0;
                else 
                    sign_four <= SIGN_SUB;
            end
            else if(key_value == 4'hc)begin
                if(mul_end == 1'b1)
                    sign_four <= 3'd0;
                else 
                    sign_four <= SIGN_MUL;
            end
            else if(key_value == 4'hd && key_flag)
                sign_four <= SIGN_SUM;
            else 
                sign_four <= sign_four;
        end
        4'd4:begin 
            if(key_value == 4'hd && key_flag)
                sign_five <= SIGN_SUM;
            else 
                sign_five <= sign_five;
        end
        4'd5:begin
            if(pre_state == NUM_SUM && next_state == NUM_IDLE)begin
                sign_one  <= 3'b0;
                sign_two  <= 3'b0;
                sign_three<= 3'b0;
                sign_four <= 3'b0;
                sign_five <= 3'b0;
            end
            else begin
                sign_one  <= sign_one  ;
                sign_two  <= sign_two  ;
                sign_three<= sign_three;
                sign_four <= sign_four ;
                sign_five <= sign_five ;
            end
                
        end
        default: begin
            sign_one  <= sign_one  ; 
            sign_two  <= sign_two  ;
            sign_three<= sign_three;
            sign_four <= sign_four ;
            sign_five <= sign_five ;
        end
    endcase
end
end

//-------------------------------------------------------
//key_flag delay x clk
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        key_flag_r <= 1'b0;
    else
        key_flag_r <=  key_flag;
end

always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        sign_flag   <= 1'b0;
    else if(key_flag)begin
        case(key_value)
        4'ha: sign_flag   <= 1'b1; 
        4'hb: sign_flag   <= 1'b1; 
        4'hc: sign_flag   <= 1'b1; 
        4'hd: sign_flag   <= 1'b1; 
        default: sign_flag   <= 1'b0;
        endcase
    end
    else 
        sign_flag   <= sign_flag;
end

//-------------------------------------------------------
//FSM step1
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        pre_state <= NUM_IDLE;
    else
        pre_state <= next_state;
end

//FSM step2
always  @(*)begin
    next_state = NUM_IDLE;
    case(pre_state)
    NUM_IDLE:
        if(key_flag_r == 1'b1)
            next_state = NUM_ONE;
        else 
            next_state = NUM_IDLE;
    NUM_ONE:
        if(sign_one == SIGN_SUM)
            next_state = NUM_CAL1;
        else if(sign_one != 3'd0 && key_flag_r == 1'b1 && sign_flag == 1'b1)
            next_state = NUM_CAL1;
        else 
            next_state = NUM_ONE;
    NUM_CAL1:begin
        if(sign_one == SIGN_SUM)
            next_state = NUM_SUM;
        else if(key_flag_r == 1'b1)
            next_state = NUM_TWO;
        else 
            next_state = NUM_CAL1;
    end
    NUM_TWO:
        if(sign_two == SIGN_SUM)
            next_state = NUM_CAL2;
        else if(sign_two != 3'd0 && key_flag_r == 1'b1 && sign_flag == 1'b1)
            next_state = NUM_CAL2;
        else 
            next_state = NUM_TWO;
    NUM_CAL2:begin
        if(sign_two == SIGN_SUM)
            next_state = NUM_SUM;
        else if(key_flag_r == 1'b1)
            next_state = NUM_THREE;
        else 
            next_state = NUM_CAL2;
    end
    NUM_THREE:
        if(sign_three == SIGN_SUM)
            next_state = NUM_CAL3;
        else if(sign_three != 3'd0 && key_flag_r == 1'b1 && sign_flag == 1'b1)
            next_state = NUM_CAL3;
        else 
            next_state = NUM_THREE;
    NUM_CAL3:begin
        if(sign_three == SIGN_SUM)
            next_state = NUM_SUM;
        else if(key_flag_r == 1'b1)
            next_state = NUM_FOUR;
        else 
            next_state = NUM_CAL3;
    end
    NUM_FOUR:
        if(sign_four == SIGN_SUM)
            next_state = NUM_CAL4;
        else if(sign_four != 3'd0 && key_flag_r == 1'b1 && sign_flag == 1'b1)
            next_state = NUM_CAL4;
        else 
            next_state = NUM_FOUR;
    NUM_CAL4:begin
        if(sign_four == SIGN_SUM)
            next_state = NUM_SUM;
        else if(key_flag_r == 1'b1)
            next_state = NUM_FIVE;
        else 
            next_state = NUM_CAL4;
    end
    NUM_FIVE:
        if(sign_five == SIGN_SUM && key_flag_r == 1'b1 && sign_flag == 1'b1)
            next_state = NUM_CAL5;
        else 
            next_state = NUM_FIVE;
    NUM_CAL5:begin
            next_state = NUM_SUM;
    end
    NUM_SUM: next_state = NUM_IDLE;
    default: next_state = NUM_IDLE;
    endcase
end

//FSM step3
always  @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        num_one     <= 16'd0;
        num_two     <= 16'd0;
        num_three   <= 16'd0;
        num_four    <= 16'd0;
        num_five    <= 16'd0;
        num_sum     <= 16'd0;
        mul_end     <= 1'b0;
        sub_end     <= 1'b0;
    end
    else begin
        case(next_state)
        NUM_ONE:begin
            if(sign_flag == 1'b0 && key_flag_r == 1'b1)
                num_one <= {num_one[11:0], key_value};
            else 
                num_one <= num_one;
        end
        NUM_CAL1:begin
            num_one <= num_one_r;
        end
        NUM_TWO:begin
            if(sign_flag == 1'b0 && key_flag_r == 1'b1)
                num_two <= {num_two[11:0], key_value};
            else 
                num_two <= num_two;
        end 
         NUM_CAL2:begin 
            mul_end <= 1'b0;
            sub_end <= 1'b0;
            if(sign_one == SIGN_MUL && sign_flag == 1'b1 && key_flag_r == 1'b1)begin
                num_two <= num_one * num_two_r;
                num_one <= 16'd0;
                mul_end <= 1'b1;
            end 
            else if(sign_one == SIGN_SUB && sign_flag == 1'b1 && key_flag_r == 1'b1)begin
                if(sign_two == SIGN_MUL)
                    num_two <= num_two_r;
                else begin
                    num_two <= ~num_two_r + 1'b1;
                    sub_end <= 1'b1;
                end
            end
            else if(key_flag_r == 1'b1)
                num_two <= num_two_r;
            else 
                num_two <= num_two;
        end
        
        NUM_THREE:begin
            if(sign_flag == 1'b0 && key_flag_r == 1'b1)
                num_three <= {num_three[11:0], key_value};
            else 
                num_three <= num_three;
        end
        NUM_CAL3: begin
            sub_end <= 1'b0;
            mul_end     <= 1'b0;
            if(sign_two == SIGN_MUL && sign_flag == 1'b1 && key_flag_r == 1'b1)begin
                if(sign_one == SIGN_SUB)begin
                    if(sign_three == SIGN_MUL)begin
                        num_three <= num_two * num_three_r;
                        num_two <= 16'd0;
                        mul_end <= 1'b1;
                    end
                    else begin
                        num_three <= ~(num_two * num_three_r) + 1'b1;
                        num_two <= 16'd0;
                        mul_end <= 1'b1;
                    end
                end
                else begin
                    num_three <= num_two * num_three_r;
                    num_two <= 16'd0;
                    mul_end <= 1'b1;
                end
            end
            else if(sign_two == SIGN_SUB  && sign_flag == 1'b1 && key_flag_r == 1'b1)begin
                if(sign_three == SIGN_MUL)
                    num_three <= num_three_r;
                else begin
                    num_three <= ~num_three_r + 1'b1;
                    sub_end <= 1'b1;
                end
            end
            else if(key_flag_r == 1'b1)
                num_three <= num_three_r;
            else 
                num_three <= num_three;
        end
        NUM_FOUR:begin
            if(sign_flag == 1'b0 && key_flag_r == 1'b1)
                num_four <= {num_four[11:0], key_value};
            else 
                num_four <= num_four;
        end
        NUM_CAL4: begin
            sub_end <= 1'b0;
            mul_end <= 1'b0;
            if(sign_three == SIGN_MUL && sign_flag == 1'b1 && key_flag_r == 1'b1)begin
                if(sign_two == SIGN_SUB)begin
                    if(sign_four == SIGN_MUL)begin
                        num_four <= num_three * num_four_r;
                        num_three <= 16'd0;
                        mul_end     <= 1'b1;
                    end
                    else begin
                        num_four <= ~(num_three * num_four_r) + 1'b1;
                        num_three <= 16'd0;
                        mul_end  <= 1'b1;
                    end
                end
                else if(sign_two == SIGN_MUL)begin
                    if(sign_one == SIGN_SUB)begin
                        if(sign_four == SIGN_MUL)begin
                            num_four <= num_three * num_four_r;
                            num_three <= 16'd0;
                            mul_end     <= 1'b1;
                        end
                        else begin
                            num_four <= ~(num_three * num_four_r) + 1'b1;
                            num_three <= 16'd0;
                            mul_end  <= 1'b1;
                        end
                    end
                    else begin
                        num_four <= num_three * num_four_r;
                        num_three <= 16'd0;
                        mul_end     <= 1'b1;
                    end    
                end
                else begin
                    num_four <= num_three * num_four_r;
                    num_three <= 16'd0;
                    mul_end     <= 1'b1;
                end
            end
            else if(sign_three == SIGN_SUB && sign_flag == 1'b1 && key_flag_r == 1'b1)begin
                if(sign_four == SIGN_MUL)
                    num_four <= num_four_r;
                else begin
                    num_four <= ~num_four_r + 1'b1;
                    sub_end <= 1'b1;
                end
            end
            else if(key_flag_r == 1'b1)
                num_four <= num_four_r;
            else 
                num_four <= num_four;
        end     
        NUM_FIVE:begin
            if(sign_flag == 1'b0 && key_flag_r == 1'b1)
                num_five <= {num_five[11:0], key_value};
            else 
                num_five <= num_five;
        end
        NUM_CAL5: begin
            sub_end <= 1'b0;
            mul_end <= 1'b0;
            if(sign_four == SIGN_MUL && sign_flag == 1'b1 && key_flag_r == 1'b1)begin
                if(sign_three == SIGN_SUB)begin
                    num_five <= ~(num_four * num_five_r) + 1'b1;
                    num_four <= 16'd0;
                    mul_end     <= 1'b1;
                end
                else if(sign_three == SIGN_MUL)begin
                    if(sign_two == SIGN_SUB)begin
                        num_five <= ~(num_four * num_five_r) + 1'b1;
                        num_four <= 16'd0;
                        mul_end     <= 1'b1;
                    end
                    else if(sign_two == SIGN_MUL)begin
                        if(sign_one == SIGN_SUB)begin
                            num_five <= ~(num_four * num_five_r) + 1'b1;
                            num_four <= 16'd0;
                            mul_end     <= 1'b1;
                        end    
                        else begin
                            num_five <= num_four * num_five_r;
                            num_four <= 16'd0;
                            mul_end     <= 1'b1;
                        end  
                    end
                    else begin
                        num_five <= num_four * num_five_r;
                        num_four <= 16'd0;
                        mul_end     <= 1'b1;
                    end
                end
                else begin
                    num_five <= num_four * num_five_r;
                    num_four <= 16'd0;
                    mul_end     <= 1'b1;
                end
            end
            else if(sign_four == SIGN_SUB && sign_flag == 1'b1 && key_flag_r == 1'b1)begin
                num_five <= ~num_five_r + 1'b1;
                sub_end <= 1'b1;
            end
            else if(key_flag_r == 1'b1)
                num_five <= num_five_r;
            else 
                num_five <= num_five;
        end
        NUM_SUM:begin
            sub_end <= 1'b0;
            mul_end     <= 1'b0;
            num_sum <= num_one + num_two + num_three + num_four + num_five;
        end
        default:begin
            num_one     <= 'd0;
            num_two     <= 'd0;
            num_three   <= 'd0;
            num_four    <= 'd0;
            num_five    <= 'd0;
            num_sum     <= num_sum;
            mul_end     <= 1'b0;
            sub_end     <= 1'b0;
        end
        endcase
    end

end

assign  num_one_r  =   (next_state == NUM_CAL1 && pre_state == NUM_ONE)? (num_one[15:12] * 1000 + num_one[11:8] * 100 + num_one[7:4] * 10 + num_one[3:0]) : num_one_r;
assign  num_two_r  =   (next_state == NUM_CAL2 && pre_state == NUM_TWO)? (num_two[15:12] * 1000 + num_two[11:8] * 100 + num_two[7:4] * 10 + num_two[3:0]) : num_two_r;
assign  num_three_r  =   (next_state == NUM_CAL3 && pre_state == NUM_THREE)? (num_three[15:12] * 1000 + num_three[11:8] * 100 + num_three[7:4] * 10 + num_three[3:0]) : num_three_r;
assign  num_four_r  =   (next_state == NUM_CAL4 && pre_state == NUM_FOUR)? (num_four[15:12] * 1000 + num_four[11:8] * 100 + num_four[7:4] * 10 + num_four[3:0]) : num_four_r;
assign  num_five_r  =   (next_state == NUM_CAL5 && pre_state == NUM_FIVE)? (num_five[15:12] * 1000 + num_five[11:8] * 100 + num_five[7:4] * 10 + num_five[3:0]) : num_five_r;

//-------------------------------------------------------
assign  outcome = num_sum;



endmodule 
