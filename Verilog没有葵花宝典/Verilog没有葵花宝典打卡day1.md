# Verilog没有葵花宝典打卡day1

#### 1. bit, byte, word, dword, qword的区别

1byte = 8bit

1word = 2byte = 16bit

1dword = 2word = 4byte  = 32bit

1qword = 2dword = 4word = 8byte = 64bit

#### 2. 什么是原码，反码，补码，符号-数值码。以8bit为例，给出各自表示的数值范围

原码：符号位+真值，最高位表示符号位，以8bit为例。

[+3]原 = 0000_0011

[-3]原 = 1000_0011

表示范围：-127到+127

原码中0000和1000都表示0。

反码：正数的反码是它本身，负数的反码将原码除符号位外逐位取反。以8bit为例。

[+3]原 = [0000_0011]原 = [0000_0011]反

[-3]原 = [1000_0011]原 = [1111_1100]反

表示范围：-127到+127

反码中0000_0000和1111_1111都表示0。

补码：正数的补码是它本身，负数的补码将原码除符号位外逐位取反再加1。以8bit为例。

[+3]原 = [0000_0011]原 = [0000_0011]反 = [0000_0011]补

[-3]原 = [1000_0011]原 = [1111_1100]反 = [1111_1101]补

表示范围：-128到+127

补码中0的表示只有一种形式，即0000_0000，1000_0000表示-128。



以上是有符号数，对于无符号数来说都是来表示整数，其原码、反码、补码都是其本身。

更详细解释可参考维基百科。

[https://zh.wikipedia.org/wiki/%E6%9C%89%E7%AC%A6%E8%99%9F%E6%95%B8%E8%99%95%E7%90%86](https://zh.wikipedia.org/wiki/有符號數處理)

#### 3. 十进制转换为二进制编码： 127， （-127），127.375，（-127.375)

127 -127 127.375 -127.375  十进制数转化为R进制数：整数部分，除R取余法，除到商为0为止。小数部分，乘R取整法，乘到积为1为止。  

127 = 0111_1111 

-127 = 1111_1111 

127.375 = 0111_1111.011 

-127.375 = 1111_1111.011

![image006](https://ws4.sinaimg.cn/large/006C4SD7ly1g2cdlhf86wj30z90fbac5.jpg)

#### 4. 设计BCD译码器，输入0~9。采用verilog描述并画出门级电路图

BCD译码器也称为4-10线译码器  

```verilog
014.设计BCD译码器，输入0~9。采用Verilog描述并画出门级电路图。
BCD译码器也称为4-10线译码器

module Decode_4_10(
    input   [3:0]   indata,
    //output reg [9:0]   outdata
    output   [9:0]   outdata
    );
/*
always @(*)begin
    case(indata)
    4'b0000: outdata = 10'b1111_1111_10;
    4'b0001: outdata = 10'b1111_1111_01;
    4'b0010: outdata = 10'b1111_1110_11;
    4'b0011: outdata = 10'b1111_1101_11;
    4'b0100: outdata = 10'b1111_1011_11;
    4'b0101: outdata = 10'b1111_0111_11;
    4'b0110: outdata = 10'b1110_1111_11;
    4'b0111: outdata = 10'b1101_1111_11;
    4'b1000: outdata = 10'b1011_1111_11;
    4'b1001: outdata = 10'b0111_1111_11;
    default: outdata = 10'b1111_1111_11;
    endcase
end
*/
assign outdata[0] = ~(~indata[3] & ~indata[2] & ~indata[1] & ~indata[0]);
assign outdata[1] = ~(~indata[3] & ~indata[2] & ~indata[1] & indata[0]);
assign outdata[2] = ~(~indata[3] & ~indata[2] & indata[1]  & ~indata[0]);
assign outdata[3] = ~(~indata[3] & ~indata[2] & indata[1]  & indata[0]);
assign outdata[4] = ~(~indata[3] & indata[2]  & ~indata[1] & ~indata[0]);
assign outdata[5] = ~(~indata[3] & indata[2]  & ~indata[1] & indata[0]);
assign outdata[6] = ~(~indata[3] & indata[2]  & indata[1]  & ~indata[0]);
assign outdata[7] = ~(~indata[3] & indata[2]  & indata[1]  & indata[0]);
assign outdata[8] = ~(indata[3]  & ~indata[2] & ~indata[1] & ~indata[0]);
assign outdata[9] = ~(indata[3]  & ~indata[2] & ~indata[1] & indata[0]);

endmodule
```

![BCD译码器](https://wx2.sinaimg.cn/large/006C4SD7ly1g2cdm7ft67j30o70da0tm.jpg)

[https://zh.wikipedia.org/wiki/%E8%AF%91%E7%A0%81%E5%99%A8](https://zh.wikipedia.org/wiki/译码器) 

#### 5.异步FIFO深度为17，如何设计地址格雷码

这个题目暂留，搞清楚再添加

<https://www.embedded.com/print/4015117>

<https://patents.google.com/patent/CN101930350A/zh>