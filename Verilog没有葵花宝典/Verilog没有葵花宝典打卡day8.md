# Verilog没有葵花宝典打卡day8

[TOC]

#### 1. 用verilog实现一个4bit二进制计数器。

- 异步复位

![异步复位](https://wx1.sinaimg.cn/large/006C4SD7ly1g2rq5le4j3j30jf02uq2p.jpg)

- 同步复位

![同步复位](https://wx2.sinaimg.cn/large/006C4SD7ly1g2rq5lalp6j30fb02tjr5.jpg)

```verilog
input clk, rst_n; 
output [3:0] o_cnt;
```

```verilog
module count_four_bit(
    input           clk,
    input           rst_n,
    output  reg [3:0]   o_cnt
    );

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        o_cnt <= 0;
    end
    else begin
        o_cnt <= o_cnt + 1'b1;
    end
end
/*    
always @(posedge clk)begin
    if(rst_n == 1'b0)begin
        o_cnt <= 0;
    end
    else begin
        o_cnt <= o_cnt + 1'b1;
    end
end*/

endmodule
```

#### 2. 用verilog实现4bit约翰逊(Johnson)计数器。

![Johnson_Counter](https://wx3.sinaimg.cn/large/006C4SD7ly1g2rqfassf7j30id02qmwx.jpg)

```verilog
module Johnson_Counter(
    input                   clk,
    input                   rst_n,
    output      reg [3:0]   johnson_cnt
);

//----------------------------------------------------
//johnson_cnt
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
        johnson_cnt <= 4'b0000;
    else
        johnson_cnt <= {~johnson_cnt[0], johnson_cnt[3:1]};
end

endmodule
```

#### 3. 用verilog实现4bit环形计数器：复位有效时输出0001，复位释放后依次输出0010，0100，1000，0001，0010...

![cnt](https://ws2.sinaimg.cn/large/006C4SD7ly1g2rpo2v262j30jl02sq2p.jpg)

```verilog
module cnt(
    input           clk,
    input           rst_n,
    output    reg  [3:0]   cnt
);

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        cnt <= 4'b0001;
    end
    else begin
        cnt <= {cnt[2:0],cnt[3]};
    end
end

endmodule 
```

#### 4. 比较一下以上三种计数器的特点。

##### 环形计数器

[环形计数器](https://zh.wikipedia.org/w/index.php?title=环形计数器&action=edit&redlink=1)是循环的[移位寄存器](https://zh.wikipedia.org/wiki/移位寄存器)[[2\]](https://zh.wikipedia.org/wiki/计数器#cite_note-2)，其中的触发器中只有一个是高电位输出，其余的都是低电位输出。移位寄存器是由[触发器](https://zh.wikipedia.org/wiki/触发器)层叠而成，若将最后一个触发器的输出接到第一个触发器的输入，形成一个环，即为环形计数器。

一般来说，环形计数器中循环的数据是只有一个比特为1的数据，因此任一时刻只有一个触发器输出为高电位。例如四比特的环形计数器，其初始状态为1000，之后会是0001,0010,0100,1000……等。n比特的环形计数器会循环n次，每计数一次的[汉明距离](https://zh.wikipedia.org/wiki/汉明距离)是2。

##### 约翰逊计数器

约翰逊记数器（Johnson counter）也称为尾端切换环形计数器（switchtail ring counter）、扭环计数器（twisted-ring counter）、走动环状记数器（walking-ring counter）或莫比斯计数器（Moebius counter）是修改过的环形计数器，最后一个触发器的输出反相后再接到第一个触发器[[3\]](https://zh.wikipedia.org/wiki/计数器#cite_note-3)[[4\]](https://zh.wikipedia.org/wiki/计数器#cite_note-4)[[5\]](https://zh.wikipedia.org/wiki/计数器#cite_note-5)。n比特的环形计数器会循环2n次，例如例如四比特的环形计数器，其初始状态为0000，之后会是1000, 1100, 1110, 1111, 0111, 0011, 0001, 0000, ……等。每计数一次的[汉明距离](https://zh.wikipedia.org/wiki/汉明距离)是1。

约翰逊记数器可以用D型触发器或是JK触发器组合，可以用在像[数字模拟转换器](https://zh.wikipedia.org/wiki/數位類比轉換器)之类的应用。

[https://zh.wikipedia.org/wiki/%E8%AE%A1%E6%95%B0%E5%99%A8#%E7%BA%A6%E7%BF%B0%E9%80%8A%E8%AE%B0%E6%95%B0%E5%99%A8](https://zh.wikipedia.org/wiki/计数器#约翰逊记数器)

#### 5. 记录1,2,3题目使用的工具，操作步骤，以及出现的错误和提示信息。

```shell
Parsing design file '../rtl/count_four_bit.v'

Error-[SFCOR] Source file cannot be opened
  Source file "TB_count.v" cannot be opened for reading due to 'No such file 
  or directory'.
  Please fix above issue and compile again.

```

发现把.v文件名拼错。。。

