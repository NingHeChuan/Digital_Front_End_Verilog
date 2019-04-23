# Verilog没有葵花宝典打卡day2 

[TOC]

#### 1. 画一下电路图：CMOS反相器、与非门、或非门、三态输出门、漏极开路门。

![image001](https://ws4.sinaimg.cn/large/006C4SD7ly1g2cf51wqnhj307k0a4dfo.jpg)

反相器

衬底的连接问题。PMOS衬底接电源，NMOS衬底接地 

![image020](https://ws4.sinaimg.cn/large/006C4SD7ly1g2cf7xpssfj308a09t0sl.jpg)

上并下串为与非

![image021](https://ws4.sinaimg.cn/large/006C4SD7ly1g2cf7xtm0lj308e097q2s.jpg)

上串下并为或非

![CMOS three-state buffer](https://ws3.sinaimg.cn/large/006C4SD7ly1g2cfdlewcvj31yf1nq1kx.jpg)

CMOS三态门

![漏极开路输出](https://ws2.sinaimg.cn/large/006C4SD7ly1g2cfexifk4j31xr1awdwd.jpg)

漏极开路输出



#### 2. 解释一下Vih，Vil，Vol，Voh，Vt，Iddq

Vih：输入电压由高到低变化时，输出电压开始上升且传输特性曲线斜率为-1的点，即图中B点对应的输入电压。（仍能维持输出为逻辑“1”的最大输出电压）

Vil：输入电压由低到高变化时，输出电压开始下降且传输特性曲线斜率为-1的点，即图中A点对应的输入电压。（仍能维持输出为逻辑“0”的最小输出电压）

Voh：定义为最小合格高电平。（维持输出为逻辑“1”的最大输出电压）

Vol：定义为最大合格低电平。（维持输出为逻辑“0”的最大输出电压）

CMOS集成电路内部规定Vol = 0v，Voh = Vdd。

Vt：MOS管的阈值电压

Iddq：

如果输入电平是(Vil+Vih)/2，会有什么问题

输入电压（Vil+Vih）/2

#### 3. CMOS反相器的速度与哪些因素有关？什么是转换时间（transition time）和传播延迟（propagation delay）？

反相器的速度与哪些因素有关。

（1）  电容（负载电容、自载电容、连线电容）较小，漏端扩散区的面积应尽可能小。输入电容要考虑： （1）Cgs 随栅压而变化（2）密勒效应（3）自举效应

（2）   加大晶体管的尺寸（驱动能力），使晶体管的等效导通电阻（输出电阻）较小。但这同时加大自载电容和负载电容（下一级晶体管的输入电容）。

（3）   提高电源电压，提高电源电压可以降低延时，即用功耗换取性能但超过一定程度后改善有限。电压过高会引起可靠性问题（氧化层击穿、热电子等）。

Transition Time（转换时间）：上升时间：从10%Vdd上升到90%Vdd的时间，下降时间L从90%Vdd下降到10%dd的时间。上升时间和下降时间统称为Transition Time，也有定义为20%到80%。

#### 4. CMOS反相器的功耗主要包括哪几部分？分别与哪些因素相关？

$$
P_{Total} = P_{dynamic} + P_{short} + P_{leakage}
$$

- P_dynamic 是电路翻转产生的**动态功耗**
- P_short是P管和N管同时导通时产生的**短路功耗**
- P_leakage 是由扩散区和衬底之间的反向偏置漏电流引起的**静态功耗**

静态功耗：CMOS反相器在静态时，P、N管只有一个导通。由于没有Vdd到GND的直流桐庐，所以CMOS的静态功耗应该等于零。但实际上，由于扩散区和衬底的PN结上存在反向漏电流，所以会产生静态功耗。

短路功耗：CMOS电路在“0”和“1”的转换过程中，P、N管会同时导通，产生一个由Vdd到VSS窄脉冲电流，由此引起功耗

动态功耗：C_L 这个CMOS反相器的输出负载电容，由NMOS和PMOS晶体管的漏扩散电容、连线电容和扇出门的输入电容组成。



#### 5. 什么是latch-up(闩锁效应)？

**闩锁效应**是集成电路中出现的一种效应。通常拉CMOS结构中，形成PNP搭NPN寄生晶体管。当有一个微小电流触发，会形成正反馈，让芯片发热报废。——《维基百科》

MOS工艺会包含许多内在的双极型管，它们在CMOS工艺中特别会引起麻烦，因为同时存在的阱和衬底会形成寄生的n-p-n-p结构，这些类似于闸流管的器件一旦激发会导致Vdd和Vss线短路，这通常会破坏芯片，或至少使系统无法工作职能断电后重新启动。——《数字集成电路》

![Latchup](https://wx1.sinaimg.cn/large/006C4SD7ly1g2cen2odiij30kl09fgm0.jpg)

[https://wuu.wikipedia.org/wiki/%E9%97%A9%E9%94%81%E6%95%88%E5%BA%94](https://wuu.wikipedia.org/wiki/闩锁效应)

#### 6. 相同面积的cmos与非门和或非门哪个更快？

电子迁移率是空穴的2.5倍（在硅基CMOS工艺中），运算就是用这些大大小小的MOS管驱动后一级的负载电容，翻转速度和负载大小一级前级驱动能力相关。为了上升延迟和下降延迟相同，PMOS需要做成NMOS两倍多大小。

载流子的迁移率，对PMOS而言，载流子是空穴；对NMOS而言，载流子是电子。

PMOS采用空穴导电，NMOS采用电子导电，由于PMOS的载流子的迁移率比NMOS的迁移率小，所以，同样尺寸条件下，PMOS的充电时间要大于NMOS的充电时间长，在互补CMOS电路中，与非门是PMOS管并联，NMOS管串联，而或非门正好相反，所以，同样尺寸条件下，与非门的速度快，所以，在互补CMOS电路中，优先选择与非门。