---
title: 关于ubuntu创建新用户时候遇到的一些问题
date: 2025/2/18 19:35:00
tags: linux
categories:

- [服务器]
- [运维]
- [linux]

---

# 问题

我在根据教程来创建linux新用户时候，遇到了不少棘手的问题，这边分享一下我的经历。

主要问题是，**我创建的新用户，进入用户bash后，什么功能都没有**
<!-- more -->
这让我非常不解，情况大概就是下面这样的

```bash
root@ubuntu:~# login
ubuntu login: test
Password: $ ls
$ cd ..
$ ls
haxlock  lost+found  test
```

我懵逼了，这什么情况？怎么和我用其他用户不一样？

正常我们使用账户的情况应该是这样的：

```bash
root@ubuntu:~# apt update
```

有路径，有用户名称，有主机名称

并且有很多可以使用的快捷键，例如tab快速补充，上下键历史命令等，但是，这个用户都没有！

对于我一个新手菜鸟来说，着实有些蒙圈

但是我想到一个关键的问题，先前那些说白了用的都是ubuntu基于bash的shell终端操作，然而，有没有可能这个新用户他的bash有问题呢？

我马上排查这个问题，寻找这个用户的shell路径

```bash
$ echo $SHELL  
```

果然输出如下

```bash
/bin/sh
```

我又切换会root用户查询了一下，输出如下：

```bash
/bin/bash
```

这和我们的预期不同，按照root用户来说，应该是 **/bin/bash** 才对，

因此这边我上网查了一下修改shell的命令，如下：

```bash
$ chsh -s /bin/bash
```

> `chsh` 是 Linux 系统中用于更改用户登录 Shell 的命令。通过 `chsh`，用户可以将自己的默认 Shell 更改为系统中已安装的其他 Shell（如 `/bin/bash`、`/bin/zsh` 等）。

此外，在root用户下，修改别人的shell是这样的

```bash
chsh -s /bin/zsh testuser
```

> 注意，上述操作结束后，需要用户重新登录进入才能生效

后面重新登录进入用户后，惊喜地发现

```bash
haxlock@ubuntu:~$ sudo su - test
[sudo] password for haxlock: 
test@ubuntu:~$ ls
test@ubuntu:~$ cd ..
```

已经可以成功显示相关信息，并且shell所有地快捷键等操作均可以进行了。

问题就那么愉快地解决了。
