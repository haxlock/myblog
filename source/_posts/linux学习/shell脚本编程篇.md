---
title: shell脚本编程篇？
date: 2025/3/4
tags: linux
categories:

- [服务器]
- [运维]
- [linux]
---

# Shell概述

- shell是一个命令行解释器，他接受应用程序/用户命令，然后调用操作系统内核。

- shell也是一个功能强大的编程语言，易编写，易调试，灵活性强。

# shell解析器

```bash
haxlock@Inspiron-3443:~/bin$ sudo cat /etc/shells 
[sudo] haxlock 的密码： 
# /etc/shells: valid login shells
/bin/sh
/usr/bin/sh
/bin/bash
/usr/bin/bash
/bin/rbash
/usr/bin/rbash
/usr/bin/dash
```

可以看到当前的shell解析器，也是可解析的script

# 第一支script的撰写和执行

注意事项：

1. 指令的执行是从上而下、从左而右的分析与执行；
2. 指令的下达就如同第四章内提到的： 指令、选项与参数间的多个空白都会被忽略掉；
3. 空白行也将被忽略掉，并且 [tab] 按键所推开的空白同样视为空白键；
4. 如果读取到一个 Enter 符号 （CR） ，就尝试开始执行该行 （或该串） 命令；
5. 至于如果一行的内容太多，则可以使用“ [Enter] ”来延伸至下一行；
6. “ # ”可做为注解！任何加在 # 后面的数据将全部被视为注解文字而被忽略！

## 写一个hello world

```shell
#!/bin/bash

echo "hello world"
~                                                          
~          
```

## 执行方法：

- 直接指令下达：shell.sh文件必须可读与可执行(rx)权限

- - 绝对路径：使用具体路径来执行，例如/home/shell.sh
  
  - 相对路径：./shell.sh来执行
  
  - 变量PATH：把sh文件放在指定目录下执行，~/bin/

- 以bash程序来执行：通过bash shell.sh或sh shell.sh执行

## 撰写 shell script 的良好习惯创建

一定要记录以下记录：

- script功能

- 版本信息

- 作者和联络方式

- 版权

- 历史记录

- 特殊的指令

- 需要的环境变量以及预先预告和设置

## 变量

### 临时变量

```shell
# 创建
haxlock@Inspiron-3443:~$ A=1
haxlock@Inspiron-3443:~$ echo $A
1
# 删除
haxlock@Inspiron-3443:~$ unset A
```

### 声明静态变量

```bash
haxlock@Inspiron-3443:~$ readonly B=3
haxlock@Inspiron-3443:~$ echo $B
3
haxlock@Inspiron-3443:~$ unset B
bash: unset: B: 无法取消设定：只读variable
# 可见他无法取消
```

## 实例：石头剪刀布

知识点：

### RANDOM

`num=$((RANDOM % 3))`

RANDOM是一个特殊的内置变量，每次引用这个变量时，会返回一个**0~32767**之间的随机证书

例如：

```bash
echo $RANDOM
```

### $((...))算数扩展

`$((...))`是 Bash 里用于进行算术运算的语法，在括号内可以执行各种算术操作，像加（`+`）、减（`-`）、乘（`*`）、除（`/`）、取模（`%`）等。比如：

```bash
result=$((5 + 3))
echo $result
```

综上，`num=$((RANDOM % 3))`相当于是0~32767之间的随机整数，进行%3的运算，可以得到，余数范围是0~2。

### 数组

#### 数组的使用

在 Bash 里，数组是一种可以存储多个值的数据结构。数组的定义形式为`array_name=("element1" "element2" "element3")`，每个元素之间用空格分隔。

#### 数组元素的访问

要访问数组中的元素，需要使用`${array_name[index]}`的语法，其中`index`是元素的索引，索引从 0 开始。

### read

`read` 是一个内置的 Shell 命令，它的主要功能是从标准输入（通常是键盘）读取一行内容，然后将读取的内容分割成单词，并把这些单词依次赋值给指定的变量。如果没有指定足够的变量，剩余的单词会被赋值给最后一个变量。

- `-p` 是 `read` 命令的一个选项，它的作用是在等待用户输入之前显示一个提示信息。这个提示信息会直接显示在终端上，引导用户进行输入。

常用用法：

```bash
read -p "请输入你的名字：" name
```

后面name代表用户输入的值传入name中，便于后面使用

### if [[ ... ]];then fi条件判断结构

在 Bash 脚本中，`if` 语句用于进行条件判断。`[[ ... ]]` 是 Bash 中用于条件测试的一种语法，它比 `[ ... ]` 提供了更丰富的功能，例如支持正则表达式匹配、字符串比较等。`if [[ ... ]]; then` 表示如果 `[[ ... ]]` 中的条件为真，就执行 `then` 后面的代码块。

并最后fi来结束if条件

#### exit

`exit` 命令用于终止当前脚本的执行，并返回一个退出状态码。在 Unix/Linux 系统中，退出状态码为 0 通常表示程序正常结束，非零状态码表示程序出现了错误。这里的 `exit 1` 表示脚本因为玩家输入无效而异常终止，返回的退出状态码为 1。
