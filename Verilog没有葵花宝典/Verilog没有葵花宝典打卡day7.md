# Verilog没有葵花宝典打卡day7

#### 1. 复习verilog语法【选做题】

- 文件操作fopen fdisplay fwrite fclose

```verilog
handlel = $fopen("file.txt");//打开文件
$fdisplay(handlel,"%d",rand_num);//写数据
$fwrite(handlel,"%d",reg1) ;//写入文件
$fclose(handlel);//关闭文件
```

- 生成随机数 random

```verilog
$random函数被调用时返回一个32bit的随机数，它是一个带符号的整形数
rand = $random % 60;//给出了一个范围在－59到59之间的随机数。
rand = {$random} % 60;//通过位并接操作产生一个值在0到59之间的数。
rand = min+{$random} % (max-min+1);//产生一个在min, max之间随机数的例子。
```

- 初始化 readmemh readmemb

```verilog
$readmemb("<数据文件名>",<存储器名>);
$readmemb("<数据文件名>",<存储器名>,<起始地址>);
$readmemb("<数据文件名>",<存储器名>,<起始地址>,<终止地址>);

$readmemh("<数据文件名>",<存储器名>);
$readmemh("<数据文件名>",<存储器名>,<起始地址>);
$readmemh("<数据文件名>",<存储器名>,<起始地址>,<终止地址>);

$readmemb中要求数据必须为二进制，$readmemh要求数据必须为十六进制
```

- finish stop

$stop：用于在仿真时，暂停仿真。运行到$stop的时候，仿真会暂停；此时可以在命令行输入run继续运行仿真。

$finish：仿真停止。运行到$finish的时候，仿真停止退出，此时不可以再继续运行

#### 2. 用verilog实现串并变换。
input [3:0] data_in;
output [3:0] data_out;
input [1:0] mode;
input clk;
input rst_n;

mode 0 ：串行输入data_in[0]，并行输出data_out[3:0]
mode 1 ：并行输入data_in[3:0]，串行输出data_out[0]
mode 2 ：并行输入data_in[3:0]，并行输出data_out[3:0]，延迟1个时钟周期
mode 3 ：并行输入data_in[3:0]，并行反序输出data_out[3:0]，延迟1个时钟周期并且交换bit顺序
data_out[3]=data_in[0]; 
data_out[2]=data_in[1]
data_out[1]=data_in[2]
data_out[0]=data_in[3]

附加要求【选做】
将输入输出的位宽做成参数化

![串并转换](https://wx4.sinaimg.cn/large/006C4SD7ly1g2kv76k9j7j30uz05smx0.jpg)

可实现任意位宽设置

```verilog
module Deserialize
#(
  parameter   DATA_WIDTH = 4,
  parameter   CNT_WIDTH  = log2(DATA_WIDTH)
  //parameter   CNT_WIDTH  = clog2(DATA_WIDTH-1)
)
(
    input           clk,
    input           rst_n,
    input    [1:0]  mode,
    input    [DATA_WIDTH-1:0]      data_i,
    output   reg [DATA_WIDTH-1:0]  data_o
    );

//mode 0
reg   [DATA_WIDTH-1:0]   data_r0;
reg           data_r1;
reg   [DATA_WIDTH-1:0]   data_r2;
reg   [DATA_WIDTH-1:0]   data_r3;

reg     [CNT_WIDTH-1:0]   cnt;
reg   [1:0] mode_r;
//mode change once cnt restart count
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
      mode_r <= 0;
    else 
      mode_r <= mode;
end
assign change = (mode_r ^ mode)? 1'b1: 1'b0;

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
      cnt <= 0;
    else if(change == 1'b1)
      cnt <= 0;
    else
      cnt <= cnt + 1'b1;
end

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)
      data_r0 <= 4'b0;
    else
      data_r0[cnt] <= data_i[0];
end

//mode 1
always @(posedge clk or negedge rst_n)begin
  if(rst_n == 0)
    data_r1 <= 0;
  else
    data_r1 <= data_i[cnt]; 
end

//mode 2
always @(posedge clk or negedge rst_n)begin
  if(rst_n == 0)
    data_r2 <= 0;
  else 
    data_r2 <= data_i;
end

integer i;
reg [DATA_WIDTH -1:0] data_r;
always @(posedge clk)begin
for(i = 0; i <= DATA_WIDTH-1; i = i+1)begin
    data_r[DATA_WIDTH-1-i] <= data_i[i];
end
end

//mode 3
always @(posedge clk or negedge rst_n)begin
  if(rst_n == 0)
    data_r3 <= 0;
  else  
    data_r3 <= data_r;
end

//mux4
always @(*)begin
  case(mode)
  2'b00: data_o = data_r0;
  2'b01: data_o = {data_o[3:1], data_r1};
  2'b10: data_o = data_r2;
  2'b11: data_o = data_r3;
  endcase
end

//-------------------------------------------------------
//以下两个函数任用一个
//求2的对数函数
function integer log2;
  input integer value;
  begin
    value = value-1;
    for (log2=0; value>0; log2=log2+1)
      value = value>>1;
  end
endfunction

//求2的对数函数
function integer clogb2 (input integer bit_depth);
begin
    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
        bit_depth = bit_depth>>1;
end
endfunction
    
endmodule
```



#### 3. 记录一下第2题中用到的工具，包括工具版本，操作步骤或命令选项，遇到的错误，提示信息等。比较一下，与昨天的记录有何相同，有何不同。

使用的群友康健提供的脚本和方法

<https://github.com/kangjian888/verilog_everyday_prj/tree/master/dc_shell_prj_temp>

工具VCS2014

命令

```shell
vcs ../rtl/Deserialize.v TB_Deserialize.v -debug_all -top TB_Deserialize -R -gui
```

