# Verilog没有葵花宝典打卡day11

[TOC]

#### 总结写代码和仿真的操作步骤、遇到的错误和提示信息。有哪些共性？有哪些地方可以自动化？

使用的工具VCS2014

#### 第一个错误

```shell
Parsing design file '../rtl/count_four_bit.v'

Error-[SFCOR] Source file cannot be opened
  Source file "TB_count.v" cannot be opened for reading due to 'No such file 
  or directory'.
  Please fix above issue and compile again.
```

发现把.v文件名拼错。。。

#### 第二个错误

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

#### 总结

感谢星友康健提供的模板，每次使用只需要稍微修改文件名即可。对于Linux的使用我还不是很熟悉，后面抽时间学习一下Linux的结构和基本命令。



