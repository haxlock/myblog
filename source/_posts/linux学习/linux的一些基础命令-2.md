---
title: 关于linux基本命令以及作用的概述和汇总学习-2
date: 2025/2/17 20:21:00
tags: linux
categories:

- [服务器]
- [运维]
- [linux] 

---

### PATH

```bash
haxlock@root:~$ env | grep PATH
CLASSPATH=.:/usr/local/jdk21/lib
PATH=.:/usr/local/jdk21/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

可以得到这么一些键值对，其实从本以上来理解，查询环境变量，本就是通过在**PATH键对应的值**中去查找相应的命令环境

会在值中挨个去搜索环境变量的值，直到寻找到相应的内容。

<!-- more -->

### $符号

$是用于取"变量"的值。

取得环境变量的值可以通过语法：$来获得

例如：

```bash
haxlock@root:~$ echo $PATH
.:/usr/local/jdk21/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

### 作用

如果你给你自己开发的程序记录在环境变量中，那么也可以通过你自己设定的命令行来快速地执行这个环境变量

#### 自行设置方法：

- 临时设置：语法：export 变量名称=变量值

```bash
haxlock@root:~$ export MYNAME=haxlock
haxlock@root:~$ echo $MYNAME
haxlock
```

- 永久生效

- - 针对当前用户生效，配置在当前用户地： ~/ .bashrc中
  
  - 针对所有用户生效，配置在系统的： /etc/profile文件中
  
  - 并通过语法：source配置文件，进行立刻生效，或重新登陆Xshell生效

```bash
vim ~/ .bashrc
# source使得环境变量生效
source .bashrc
```

## Linux上传和下载

### 通过Xshell和Xftp进行上传和下载

此部分比较简单，建议参考官方文档即可

### rz,sz命令上传与下载

#### 安装

```bash
sudo apt install lrzsz -y
```

#### sz 下载

> 注意！
> 
> sz只能传输单个文件，无法传输目录，因此如果您想传输文件，建议先压缩在下载

```bash
sz [需要下载的文件名]
```

#### rz 上传

```bash
rz
```

选择您需要上传的目录即可

## 压缩与解压

### tar命令

Linux与MAC常用有两种压缩格式，后缀名分别为：

- .tar，成为tarball，归档文件，简单的啊文件组装到一个tar文件内，并没有太多文件体积的减少，仅仅为封装

- .gz 使用gzip压缩算法将一个文件压缩到文件内，可以极大的减少压缩后的体积

语法：

```bash
tar [-c -v -x -f -z -C] 参数1 参数2 参数N
```

- `-c`：创建一个新的压缩文件。

- `-x`：解压归档文件。

- `-t`：列出归档文件的内容。

- `-r`：向现有归档文件中追加文件。

- `-u`：仅追加比归档文件中已有文件更新的文件。

- `-d`：找到归档文件中与文件系统不同步的差异。

- `-A`：将一个 `.tar` 文件追加到另一个 `.tar` 文件中。

其中 -f必须在最后，接受解压压缩文件的名称

### 常用的压缩组合

```bash
# 将1.txt,2.txt,3.txt压缩到test.tar文件中
tar -cvf test.tar 1.txt 2.txt 3.txt
# 将1.txt,2.txt,3.txt压缩到test.tar.gz文件中
tar -zcvf test.tar.gz 1.txt 2.txt 3.txt
```

### 常用的解压组合

```bash
# 解压test.tar 到当前目录
tar -xvf test.tar
# 解压test.tar到指定目录
tar -xvf test.tar -C /home/test
# 以Gzip模式解压test.tar.gz,将文件解压到指定目录下
tar -zxvf test.tar.gz -C /home/test
```

> - -f必须在最后一位
> 
> - -z建议在开头
> 
> - -C建议单独使用
