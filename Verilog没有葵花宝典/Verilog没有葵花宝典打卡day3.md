# Verilog没有葵花宝典打卡day3

[TOC]

标准单元库

#### 1. 了解目录结构：与前端相关的比如文档(doc)，仿真模型(verilog/vhdl)，标准单元库(synopsys/symbols)



#### 2. 阅读文档transition time, propagation delay等参数的定义

p13

![Propagation Delay](https://wx2.sinaimg.cn/large/006C4SD7ly1g2dtqwlevcj30h506r747.jpg)

Transition Time（转换时间）：输入和输出信号，上升时间：从10%Vdd上升到90%Vdd的时间，下降时间L从90%Vdd下降到10%Vdd的时间。上升时间和下降时间统称为Transition Time。

![transition time](https://wx3.sinaimg.cn/large/006C4SD7ly1g2dts5zuxnj30hl066aa0.jpg)

Propagation Delay（传播延时）：在输入信号变化到超过50%Vdd到输出信号变化到超过50%Vdd之间的时间。

Timing constraints include: setup time, hold time, recovery time, and minimum pulse width.

![setuptime](https://ws1.sinaimg.cn/large/006C4SD7ly1g2dueh40enj30gq06igli.jpg)



![holdtime](https://wx1.sinaimg.cn/large/006C4SD7ly1g2dueh1ke7j30gm06ia9y.jpg)

![recoverytime](https://ws2.sinaimg.cn/large/006C4SD7ly1g2dujj00dyj30gu06mmx3.jpg)

![removaltime](https://ws1.sinaimg.cn/large/006C4SD7ly1g2dukpivylj30gl06umx3.jpg)

![minimunpulsewidth](https://wx2.sinaimg.cn/large/006C4SD7ly1g2dum328vij30go05xdfr.jpg)



#### 3. 阅读文档Power Dissipation/Calculation的描述

p18



#### 4. 阅读文档Delay calculation的描述

p14

#### 5. 提供了哪些类型的cell？



#### 6. Verilog文件中包含了哪些信息？



#### Question

##### Q1. smic180工艺库是什么？

Semiconductor Manufactory International Corporation 中芯国际

180指180nm，中芯国际180nm工艺库。

##### Q2：negative propagation delays是什么？



##### Q3：Derating factors？

