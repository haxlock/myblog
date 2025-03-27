--- 
title: Linux目录树架构
date: 2025/3/4
tags: linux
categories:

- [服务器]
- [运维]
- [linux]
---

# Linux根目录

- 目录树的起始点是`/,root`

- <!-- more -->

- 每隔目录不知能使用本地端的partition的文件系统，也可以使用网络上的filesystem.例如可以利用NFS服务器挂在某特定的目录

- 每隔王文建在此目录树中的文件名都是独一无二的。

tree如下：

```bash
haxlock@Inspiron-3443:/$ ls -l
总计 100
drwxr-xr-x   3 root root  4096  2月 23 08:26 backup
lrwxrwxrwx   1 root root     7  4月 22  2024 bin -> usr/bin
drwxr-xr-x   2 root root  4096  2月 26  2024 bin.usr-is-merged
drwxr-xr-x   4 root root  4096  2月 27 20:17 boot
drwxr-xr-x   2 root root  4096  1月  1  1970 cdrom
drwxr-xr-x  22 root root  4780  3月  4 11:54 dev
drwxr-xr-x 150 root root 12288  3月  3 20:23 etc
drwxr-xr-x   4 root root  4096  2月 23 08:51 home
lrwxrwxrwx   1 root root     7  4月 22  2024 lib -> usr/lib
lrwxrwxrwx   1 root root     9  4月 22  2024 lib64 -> usr/lib64
drwxr-xr-x   2 root root  4096  4月  8  2024 lib.usr-is-merged
drwx------   2 root root 16384  2月 23 08:25 lost+found
drwxr-xr-x   3 root root  4096  2月 23 20:03 media
drwxr-xr-x   2 root root  4096  8月 27  2024 mnt
drwxr-xr-x   6 root root  4096  2月 27 13:07 opt
dr-xr-xr-x 348 root root     0  3月  4 11:54 proc
drwx------  10 root root  4096  2月 27 15:12 root
drwxr-xr-x  37 root root   940  3月  4 12:22 run
lrwxrwxrwx   1 root root     8  4月 22  2024 sbin -> usr/sbin
drwxr-xr-x   2 root root  4096  3月 31  2024 sbin.usr-is-merged
drwxr-xr-x  14 root root  4096  2月 24 12:30 snap
drwxr-xr-x   2 root root  4096  8月 27  2024 srv
dr-xr-xr-x  13 root root     0  3月  4 13:28 sys
drwxrwxrwt  23 root root 12288  3月  4 13:40 tmp
drwxr-xr-x  12 root root  4096  8月 27  2024 usr
drwxr-xr-x  15 root root  4096  2月 23 08:50 var
```

克制

![](/home/haxlock/.config/marktext/images/2025-03-04-13-37-52-image.png)

# /etc/passwd和/etc/shadow

## paswd

- 权限：通常是`-rw-r--r--`(644)，root可读写，其他用户只可读。

- 存储内容：

- - 用户名
  
  - 用户ID（UID）
  
  - 用户描述信息
  
  - 用户主目录
  
  - 默认shell

## shadow

- 权限：通常是`-rw-r-----`(640)所有者可读写，其他用户无权限

- 存储内容

- - 加密的密码
  
  - 密码最后一次修改日期
  
  - 密码最小和最大的使用期限
  
  - 密码过期警告期
  
  - 密码失效日期
  
  - 账户失效日期
