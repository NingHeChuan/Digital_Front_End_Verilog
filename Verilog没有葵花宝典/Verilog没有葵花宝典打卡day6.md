# Verilog没有葵花宝典打卡day6

[TOC]

#### 复习verilog语法【选做题】

##### 1. reg和wire的区别

reg是寄存器类型可以存储数据，wire是线网型

reg型在always块和initial块中赋值，wire型用assign赋值

reg型可用于时序逻辑和组合逻辑赋值，wire型只能用于组合逻辑赋值

 wire表示直通，即只要输入有变化，输出马上出现结果，reg表示一定要有触发，输出才会反映输入

##### 2. 阻塞赋值与非阻塞赋值的区别

```verilog
always @(posedge clk) begin
	b <= a;
	c <= b;
end

always @(posedge clk) begin
	b = a;
	c = b;
end
```

第一种赋值方式是非阻塞赋值，最后结果是b = a，c = b。

第二种赋值方式是阻塞赋值，最后的结果是b = a，c = a。

非阻塞赋值在触发调节满足是，两条语句是同时进行的，阻塞赋值是顺序执行的。

##### 3. parameter与define的区别

声明：
parameter xx = yy;
`define XX YY

使用：
xx
`XX  

parameter与define都可以用来定义常量

parameter写在模块中，可以被上一层模块调用时，进行参数传递。

parameter 作用于声明的那个文件；define 从编译器读到这条指令开始到编译结束都有效，或者遇到`undef命令使之失效。

##### 4. task与function的区别

<https://blog.csdn.net/kobesdu/article/details/39080571>

##### 5. 用verilog实现边沿检测电路：上升沿，下降沿，双沿(上升或下降沿)

```verilog
module Edge_Detect(
    input       clk,
    input       rst_n,
    input       data,
    output      pos_edge,
    output      neg_edge,
    output      data_edge
    );

reg     [1:0]   data_r;
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        data_r <= 2'b00;
    end
    else begin
        data_r <= {data_r[0], data};
    end
end

assign  pos_edge = ~data_r[1] & data_r[0];
assign  neg_edge = data_r[1] & ~data_r[0];
assign  data_edge = pos_edge | neg_edge;

endmodule

module TB_Edge_Detect(
);

    reg       clk;
    reg       rst_n;
    reg       data;
    wire      pos_edge;
    wire      neg_edge;
    wire      data_edge;

Edge_Detect Edge_Detect_inst(
    .clk            (clk      ),
    .rst_n          (rst_n    ),
    .data           (data     ),
    .pos_edge       (pos_edge ),
    .neg_edge       (neg_edge ),
    .data_edge      (data_edge)
    );

always #10 clk = ~clk;

initial begin
clk = 0;
rst_n = 0;
data = 0;
#100
rst_n = 1'b1;
#1000
data = 1'b1;
#10000
data = 1'b0
#1000
$finish;
end
endmodule
```

![边沿检测1](https://wx1.sinaimg.cn/large/006C4SD7ly1g2jiw6riofj30gb05lwea.jpg)![边沿检测2](https://wx3.sinaimg.cn/large/006C4SD7ly1g2jiw6tkwij30kn05cjr6.jpg)



##### 6. 记录一下第2题中用到的工具，包括工具版本，操作步骤或命令选项，遇到的错误，提示信息等。

工具VCS2014

命令

```shell
vcs ../rtl/Edge_Detect.v TB_Edge_Detect.v -debug_all -top TB_Edge_Detect -R -gui
```

