# Verilog没有葵花宝典打卡day4

[TOC]

#### 1. 什么是竞争和冒险？

![image003](https://wx4.sinaimg.cn/large/006C4SD7ly1g2ew2ychv9j30e806n3yd.jpg)

![image005](https://wx4.sinaimg.cn/large/006C4SD7ly1g2ew2ygp0yj30bx085jr9.jpg)

信号由于经由不同路径传输达到某一汇合点的时间有先有后的现象，就称之为竞争，由于竞争现象所引起的电路输出发生瞬间错误的现象，就称之为冒险。

一个非门和一个与门，本来在理想情况下F的输出应该是一直稳定的0输出，但是实际上每个门电路从输入到输出是一定会有时间延迟的，这个时间通常叫做电路的开关延迟。而且制作工艺、门的种类甚至制造时微小的工艺偏差，都会引起这个开关延迟时间的变化。这两个图就很好的解释了冒险竞争。

消除冒险竞争

- 加滤波电容，消除毛刺的影响
- 加选通信号，避开毛刺
- 增加冗余项，消除逻辑冒险。

#### 2. 设计一个2-4译码器。

![image013](https://wx1.sinaimg.cn/large/006C4SD7ly1g2ew5axmzgj30kk08zgm0.jpg)

```verilog
module Decode_2_4(
    input       [1:0]   indata,
    input               enable_n,
	//output  reg [3:0]   outdata
	output      [3:0]   outdata
);

/*
always @(*)begin
    if(enable_n == 1'b1)
        outdata = 4'b1111;
    else begin
        case(indata)
        2'b00: outdata = 4'b1110;
        2'b01: outdata = 4'b1101;
        2'b10: outdata = 4'b1011;
        2'b11: outdata = 4'b0111;
        endcase
    end
end
*/

assign  outdata[3] = ~(indata[1] & indata[0] & ~enable_n);
assign  outdata[2] = ~(indata[1] & ~indata[0] & ~enable_n);
assign  outdata[1] = ~(~indata[1] & indata[0] & ~enable_n);
assign  outdata[0] = ~(~indata[1] & ~indata[0] & ~enable_n);

endmodule
```

#### 3. 输入一个8bit数，输出其中1的个数。如果只能使用1bit全加器，最少需要几个？

```verilog
module Detect_One(
    input       [7:0]   indata,
    output        [2:0]   dout
    );

assign  dout = ((indata[7] + indata[6]) + (indata[5] + indata[4])) + ((indata[3] + indata[2]) +  (indata[1] + indata[0]));

endmodule
```

12个1bit全加器

#### 4. 如果一个标准单元库只有三个cell：2输入mux(o = s ？a ：b;)，TIEH(输出常数1)，TIEL(输出常数0)，如何实现以下功能？

##### 4.1 反相器inv

##### 4.2 缓冲器 
##### 4.3 两输入与门and2
##### 4.4 两输入或门or2
##### 4.5 四输入的mux  mux4
##### 4.6 一位全加器 fa

![day41](https://ws1.sinaimg.cn/large/006C4SD7ly1g2f0vsc4t8j32wm1c8kjl.jpg)

![day42](https://ws4.sinaimg.cn/large/006C4SD7ly1g2f0vswddzj33581i5u0x.jpg)

![day43](https://ws3.sinaimg.cn/large/006C4SD7ly1g2f0vtm9lhj32q127ax6p.jpg)

![day44](https://wx1.sinaimg.cn/large/006C4SD7ly1g2f0vu0oh8j32wk20ax6p.jpg)

![day45](https://wx3.sinaimg.cn/large/006C4SD7ly1g2f0vuswr6j32st2b5b2a.jpg)

![day46](https://wx2.sinaimg.cn/large/006C4SD7ly1g2f0vvg9f0j32gy2coe81.jpg)