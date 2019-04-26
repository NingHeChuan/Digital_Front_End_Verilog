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

我这里加了使能端，所以电路会稍微复杂

![Decode2_4](https://ws1.sinaimg.cn/large/006C4SD7ly1g2fsh15zxgj30nk0863ym.jpg)

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

![number_one](https://ws3.sinaimg.cn/large/006C4SD7ly1g2fu1timw9j30o401l0sj.jpg)

7个1bit全加器

```verilog
module number_one(
    input           clk,
    input           rst_n,
    input   [7:0]   din,
    output  [3:0]   num_one
);

wire [1:0]  sum0;
wire [1:0]  sum1;
wire [2:0]  sum2;

full_adder_one u0(
    .dina       (din[0]),
    .dinb       (din[1]),
    .cin        (din[2]),
    .sum        (sum0[0]),
    .cout       (sum0[1])
);

full_adder_one u1(
    .dina       (din[3]),
    .dinb       (din[4]),
    .cin        (din[5]),
    .sum        (sum1[0]),
    .cout       (sum1[1])
);

adder2 u3(
    .dina       (sum0),
    .dinb       (sum1),
    .cin        (din[6]),
    .sum        (sum2[1:0]),
    .cout       (sum2[2])
    );

adder3 u2(
    .dina       (sum2),
    .dinb       (0),
    .cin        (din[7]),
    .sum        (num_one[2:0]),
    .cout       (num_one[3])
    );

endmodule

module full_adder_one(
	input 	dina,
    input 	dinb,
    input 	cin,
    output 	sum,
    output 	cout
);
    
assign {cout, sum} = dina + dinb + cin;
    
endmodule 
    module adder2(
    input   [1:0]   dina,
    input   [1:0]   dinb,
    input           cin,
    output  [1:0]   sum,
    output          cout
);

wire co;

full_adder_one u0(
    .dina       (dina[0]),
    .dinb       (dinb[0]),
    .cin        (cin),
    .sum        (sum[0]),
    .cout       (co)
);

full_adder_one u1(
    .dina       (dina[1]),
    .dinb       (dinb[1]),
    .cin        (co),
    .sum        (sum[1]),
    .cout       (cout)
);

endmodule 
    
module adder3(
    input   [2:0]   dina,
    input   [2:0]   dinb,
    input           cin,
    output  [2:0]   sum,
    output          cout
);

wire co;

full_adder_one u0(
    .dina       (dina[0]),
    .dinb       (dinb[0]),
    .cin        (cin),
    .sum        (sum[0]),
    .cout       (co)
);

adder2 u1(
    .dina       (dina[2:1]),
    .dinb       (dinb[2:1]),
    .cin        (co),
    .sum        (sum[2:1]),
    .cout       (cout)
    );

endmodule
```



![cal_fa](https://wx4.sinaimg.cn/large/006C4SD7ly1g2f6yjzqwuj32zv1y4b2a.jpg)

<https://forum.allaboutcircuits.com/threads/count-number-of-logic-1s-in-7-bit-number.49821/>

#### 4. 如果一个标准单元库只有三个cell：2输入mux(o = s ？a ：b;)，TIEH(输出常数1)，TIEL(输出常数0)，如何实现以下功能？

VCS没跑起来，再看看，用DC综合出来的电路图，直接就优化成标准单元了。

##### 4.1 反相器inv

```Verilog
module inv(
    input   sel,
    output  f
);

assign f = (sel)? 0:1;

endmodule
```



![inv](https://ws3.sinaimg.cn/large/006C4SD7ly1g2fw1xe9anj30an01jq2p.jpg)

##### 4.2 缓冲器 

```verilog
module buffer(
    input   sel,
    output  f
);

assign f = sel? 1:0;

endmodule 
```

##### 4.3 两输入与门and2

```verilog
module and2(
    input   a,
    input   b,
    output  f
);

assign f = a? b:0;

endmodule 
```



![and2](https://ws1.sinaimg.cn/large/006C4SD7ly1g2fw1x67qzj30c4024a9u.jpg)

##### 4.4 两输入或门or2

```verilog
module or2(
    input   a,
    input   b,
    output  f
);

wire inva;
wire invb;

inv inv(
    .sel    (a),
    .f      (inva)
);

assign f = inva? b:1;

endmodule
```



![or2](https://wx3.sinaimg.cn/large/006C4SD7ly1g2fw1xml95j30ac0210si.jpg)

##### 4.5 四输入的mux  mux4

```verilog
module mux4(
    input a, b, c, d,
    input [1:0]  sel,
    output       f
);

assign f = sel[1]?(sel[0]?c:d):(sel[0]?a:b);

endmodule
```



![mux4](https://wx1.sinaimg.cn/large/006C4SD7ly1g2fw1xge1rj30ca03b743.jpg)

##### 4.6 一位全加器 fa

```verilog
module xor2(
    input   a,
    input   b,
    output  f
);
wire invb;
inv inv(
    .sel    (b),
    .f      (invb)
);

assign f = a? invb: b;

endmodule 

module full_adder1(
    input   dina,
    input   dinb,
    input   cin,
    output  sum,
    output  cout
);

wire xorf;

xor2 xor21(
    .a      (dina),
    .b      (dinb),
    .f      (xorf)    
);

xor2 xor22(
    .a      (xorf),
    .b      (cin),
    .f      (sum)    
);

wire    andf;
and2 and2(
    .a      (dina),
    .b      (dinb),
    .f      (andf)    
);
wire andff;

and2 and20(
    .a      (xorf),
    .b      (cin),
    .f      (andff)    
);

xor2 or2(
    .a      (andf),
    .b      (andff),
    .f      (cout)    
);

endmodule
```

![fa](https://ws4.sinaimg.cn/large/006C4SD7ly1g2fvdwjjsjj30ey02jt8h.jpg)

#### 附录

![day41](https://ws1.sinaimg.cn/large/006C4SD7ly1g2f0vsc4t8j32wm1c8kjl.jpg)

![day42](https://ws4.sinaimg.cn/large/006C4SD7ly1g2f0vswddzj33581i5u0x.jpg)



![day44](https://wx1.sinaimg.cn/large/006C4SD7ly1g2f0vu0oh8j32wk20ax6p.jpg)

![day45](https://wx3.sinaimg.cn/large/006C4SD7ly1g2f0vuswr6j32st2b5b2a.jpg)

![day46](https://wx2.sinaimg.cn/large/006C4SD7ly1g2f0vvg9f0j32gy2coe81.jpg)





