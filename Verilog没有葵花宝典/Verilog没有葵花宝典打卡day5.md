# Verilog没有葵花宝典打卡day5

[TOC]

#### 1. dff和latch有什么区别。

这是数字电路里的描述区别

锁存器对电平信号敏感，在输入脉冲的电平作用下改变状态。

D触发器对时钟边沿敏感，检测到上升沿或下降沿触发瞬间改变状态。

这个链接中有个表格对比

<https://www.vlsifacts.com/difference-latch-flip-flop/> 

#### 2. 什么是同步电路和异步电路。

同步逻辑是时钟之间有固定的因果关系。异步逻辑是各时钟之间没有固定的因果关系。

在电路中同一个时钟源的时钟分频出来的不同频率的时钟作用于两部分电路，这两部分电路也是同步的。反之，不同时钟源的电路就是异步电路。

#### 3. 什么是setup time和 hold time。

![setuptime](https://ws1.sinaimg.cn/large/006C4SD7ly1g2dueh40enj30gq06igli.jpg)

在时钟沿来临前，输入信号的变化超过50%Vdd的时间到时钟变化超过50%Vdd的时间中，输入信号保持稳定的最小时间。



![holdtime](https://wx1.sinaimg.cn/large/006C4SD7ly1g2dueh1ke7j30gm06ia9y.jpg)

在时钟沿来临后，输入信号的变化超过50%Vdd的时间到时钟变化超过50%Vdd的时间中，输入信号保持稳定的最小时间。

#### 4. 设计一个101序列检测器。要画出状态转移图，写verilog，并仿真测试。

![image](https://wx4.sinaimg.cn/large/006C4SD7gy1fxmx8peqevj326v170wzh.jpg)

![detect101](https://ws4.sinaimg.cn/large/006C4SD7ly1g2g3xyrlmsj30l002rglf.jpg)

```verilog
module Detect_101(
    input           clk,
    input           rst_n,
    input           data,
    output          flag_101
    );

parameter   S0 = 0,
            S1 = 1,
            S2 = 2,
            S3 = 3;

reg     [1:0]   state;

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        state <= S0;
    end
    else begin
        case(state)
        S0: 
            if(data == 1)
                state <= S1;
            else 
                state <= S0;
        S1: 
            if(data == 0)
                state <= S2;
            else 
                state <= S1;
        S2:
            if(data == 1)
                state <= S3;
            else 
                state <= S0;
        S3:
            if(data == 1)
                state <= S1;
            else 
                state <= S2;
        endcase
    end
end

assign  flag_101 = (state == S3)? 1'b1: 1'b0;

endmodule
```