# Verilog没有葵花宝典打卡day3

[TOC]

标准单元库

#### 1. 了解目录结构：与前端相关的比如文档(doc)，仿真模型(verilog/vhdl)，标准单元库(synopsys/symbols)

![某工艺库](https://ws3.sinaimg.cn/large/006C4SD7ly1g2dzfgabvyj30ri0oq766.jpg)

#### 2. 阅读文档transition time, propagation delay等参数的定义

![Propagation Delay](https://wx2.sinaimg.cn/large/006C4SD7ly1g2dtqwlevcj30h506r747.jpg)

Transition Time（转换时间）：输入和输出信号，上升时间：从10%Vdd上升到90%Vdd的时间，下降时间L从90%Vdd下降到10%Vdd的时间。上升时间和下降时间统称为Transition Time。

![transition time](https://wx3.sinaimg.cn/large/006C4SD7ly1g2dts5zuxnj30hl066aa0.jpg)

Propagation Delay（传播延时）：在输入信号变化到超过50%Vdd到输出信号变化到超过50%Vdd之间的时间。

Timing constraints include: setup time, hold time, recovery time, and minimum pulse width.

![setuptime](https://ws1.sinaimg.cn/large/006C4SD7ly1g2dueh40enj30gq06igli.jpg)

在时钟沿来临前，输入信号的变化超过50%Vdd的时间到时钟变化超过50%Vdd的时间中，输入信号保持稳定的最小时间。



![holdtime](https://wx1.sinaimg.cn/large/006C4SD7ly1g2dueh1ke7j30gm06ia9y.jpg)

在时钟沿来临后，输入信号的变化超过50%Vdd的时间到时钟变化超过50%Vdd的时间中，输入信号保持稳定的最小时间。

![recoverytime](https://ws2.sinaimg.cn/large/006C4SD7ly1g2dujj00dyj30gu06mmx3.jpg)

复位或者置位信号变化超过50%Vdd的时间到时钟变化超过50%Vdd的时间中，时钟沿来临的前最小时间，保证复位或置位完成。

![removaltime](https://ws1.sinaimg.cn/large/006C4SD7ly1g2dukpivylj30gl06umx3.jpg)

复位或者置位信号变化超过50%Vdd的时间到时钟变化超过50%Vdd的时间中，时钟沿来临的后最小时间，保证置位或复位完成。

![minimunpulsewidth](https://wx2.sinaimg.cn/large/006C4SD7ly1g2dum328vij30go05xdfr.jpg)

最小脉冲宽度就是信号上升沿变化超过50%Vdd到下降沿变化低于50%Vdd时，测量高电平的最小脉冲宽度，低电平最小宽度同理。

个人认为不能保证各个时间参数，可能会产生亚稳态。

#### 3. 阅读文档Power Dissipation/Calculation的描述

Power dissipation功率损耗取决于电源电压、工作频率、内部电容和输出负载，计算公式

![PowerCal](https://wx4.sinaimg.cn/large/006C4SD7ly1g2dux8lflij30es028mx1.jpg)

某工艺库文档有个参数详细说明，并提供参考计算示例

#### 4. 阅读文档Delay calculation的描述

![Delay Calculation](https://ws2.sinaimg.cn/large/006C4SD7ly1g2duwafrxxj30ge03gt8l.jpg)

某工艺库文档有个参数详细说明，并提供参考计算示例

#### 5. 提供了哪些类型的cell？

包含的特殊标准单元有，Antenna-Fix Cell、NWELL and Substrate Tie Cell、Fill Cells、Low-Power (XL) Cells、TIEHI/LO Cells、Delay Cells

主要包含的基础基本标准单元有

全加器、与门、与或门、BUF、D触发器、延迟、反相器、选择器、与非门、或非门、三态门、异或门、同或门等等。

#### 6. Verilog文件中包含了哪些信息？

Verilog文件中为文当中所涉及到的基本标准单元库的代码。

xxx.v不支持negative timing检查，模拟仿真时间比xxx_neg.v短

xxx_neg.v 支持negative timing检查，模拟仿真时间比xxx_neg.v短

延时参数，针对不同的输入激励，延时参数不同

#### Question

##### Q2：negative propagation delays是什么？negative timing

The SAGE-X Standard Cell Library may contain negative propagation delays. Although most third-party verification tools can handle negative propagation delays, some tools will turn negative delays into a zero value.

实际上cell delay是存在负delay的情况。而且从propagation delay的定义可以看出，当output的transition足够快，完全可能出现output 50% 电平提前于input50%电平，即发生负的delay情况

出现负的net delay情况如下：

- Drive的驱动能力够大

- Input transition足够小

- Output load比较小

https://mp.weixin.qq.com/s/WC2oCIrVo-Sqtx4HKp8mXw

##### Q3：Derating factors？

derating factors for variations in process case, temperature, and voltage.电压、温度、和process case
