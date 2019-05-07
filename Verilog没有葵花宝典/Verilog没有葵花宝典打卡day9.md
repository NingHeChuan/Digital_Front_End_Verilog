# Verilog没有葵花宝典打卡day9

#### 1. 用verilog实现按键抖动消除电路，抖动小于15ms，输入时钟12MHz。

![按键消抖](https://ws1.sinaimg.cn/large/006C4SD7ly1g2svwg61d3j30pz067glg.jpg)

```verilog
module debounce(
    input           clk,//12Mhz
    input           rst_n,
    input           key_in,
    output          key_flag
);

parameter   JITTER  =   240;//12Mhz / (1/20ms)

reg   [1:0]     key_r;
wire             change;
reg   [15:0]    delay_cnt;

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        key_r <= 0;
    end
    else begin
        key_r <= {key_r[0],key_in};
    end
end

assign  change = (~key_r[1] & key_r[0]) | (key_r[1] & ~key_r[0]);

always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        delay_cnt <= 0;
    end
    else if(change == 1'b1)
        delay_cnt <= 0;
    else if(delay_cnt == JITTER)
        delay_cnt <= delay_cnt;
    else 
        delay_cnt <= delay_cnt + 1;
end

assign  key_flag = ((delay_cnt == JITTER - 1) && (key_in == 1'b1))? 1'b1: 1'b0;

endmodule
```

#### 2. 记录题目1中用到的工具，操作步骤，遇到的错误和提示信息。

```shell
Error-[TMENF-CFL] Top Module/Entity not found
  Top module/entity/config "TB_debounce.v" is not found - cannot find library 
  "TB_debounce".


Error-[IRMINTM] Illegal module instantiations
  Illegal to have recursive module instantiations.
  No Top Modules Defined
  There should be at least one top module that is not instantiated by any 
  other module.
```



```shell
上面的错误是下面这条命令产生的的，-top 后面的文件名不能加.v
vcs ../rtl/debounce.v TB_debounce.v -debug_all -top TB_debounce.v -R -gui
这是正确的命令
vcs ../rtl/debounce.v TB_debounce.v -debug_all -top TB_debounce -R -gui
```