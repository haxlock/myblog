---
title: 关于linux基本命令以及作用的概述和汇总学习
date: 2025/2/10 11:25:00
tags: linux
categories: 
- [服务器]
- [运维]
- [linux]
---

# 这是一篇关于linux基本命令以及作用的概述和汇总学习

## ls

### ls命令

ls命令用于列出目录下的内容

例如输出结果可能如下：

<!-- more -->

```bash
haxlock@armbian:~$ ls
back_data  DDNS-go  ha  server  test.txt
```

### ls参数-选项

```bash
ls [-a -l -h] [linux路径]
```

这是ls 可选参数的基本概况

以下是三种参数对应的输出情况：

#### ls -a

会输出项目下所有文件夹下所有文件情况

```bash
haxlock@armbian:~$ ls -a
.              .bash_history  DDNS-go     .profile                   test.txt    .Xauthority
..             .bash_logout   ha          .pyenv                     .vim        .xsessionrc
back_data      .bashrc        .local      server                     .viminfo    .zshrc
.bash_aliases  .cache         .oh-my-zsh  .sudo_as_admin_successful  .wget-hsts
```

#### ls -l

会以列表的形式，详细说明目录下文件的具体信息

```bash
haxlock@armbian:~$ ls -l
total 20
drwxrwxr-x 13 root    root    4096  1月 23 13:38 back_data
drwxr-xr-x  2 root    root    4096  1月 10 07:46 DDNS-go
drwxr-xr-x  2 root    root    4096  1月 10 13:47 ha
drwxr-xr-x  6 root    root    4096  1月  9 17:51 server
-rw-rw-r--  1 haxlock haxlock   20  2月  6 10:26 test.txt
```

#### ls -h

- -h 表示易于阅读的形式，列出文件的大小，如K,M,G

- [attention!] -h 必须要搭配 -l 使用，否则无效、

下面为演示：

```bash
haxlock@armbian:~$ ls -lh
total 20K
drwxrwxr-x 13 root    root    4.0K  1月 23 13:38 back_data
drwxr-xr-x  2 root    root    4.0K  1月 10 07:46 DDNS-go
drwxr-xr-x  2 root    root    4.0K  1月 10 13:47 ha
drwxr-xr-x  6 root    root    4.0K  1月  9 17:51 server
-rw-rw-r--  1 haxlock haxlock   20  2月  6 10:26 test.txt
```

可以看到这是显示出来了文件的大小，如4.0K

### ls 结尾

ls -a -l -h 都可以组合使用，具体需要根据实际场景进行变更，这是一个非常方便的快捷键用于查看当前路径下的所有文件情况。

## cd / pwd 命令

#### cd （Change Directory）

cd 主要用于切换当前操作目录，例如:

```bash
haxlock@armbian:~$ 
```

当前就是在/home/haxlock目录下

那么我想切换到别的目录，这时需要用到cd命令

```bash
haxlock@armbian:~$ cd /etc/
haxlock@armbian:/etc$ 
```

cd 后面接 /etc/就切换到了 **根目录下**  的 **etc** 文件夹下的路径

> 注意！
> 
> 其中最头部的 ‘/’是代表linux的根目录，一一定不能少    

如果直接就写一个cd，那么会快速返回用户目录下的home目录下

```bash
haxlock@armbian:/etc$ cd
haxlock@armbian:~$ 
```

#### pwd (Print Word Directory)

pwd用于打印当前的工作目录路径

```bash
haxlock@armbian:~$ pwd
/home/haxlock
```

可见控制台可以输出当前工作目录

## mkdir

### mkdir 创建目录命令

通过 mkdir [-p] Linux路径

- 参数 **必填** 表示路径，就是要创建文件夹的路径，相对和绝对均可
- -p是为了创建多个层级的目录

例如：

```bash
haxlock@armbian:~$ mkdir test
haxlock@armbian:~$ ls
back_data  DDNS-go  ha  server  test  test.txt
```

可见此时新出现一个test文件夹

```bash
haxlock@armbian:~$ cd test
haxlock@armbian:~/test$ 
```

可以进入这个新文件夹

我想快速在home目录下创建文件怎么办呢？

可以用这个快捷命令

```bash
haxlock@armbian:~$ mkdir ~/1
haxlock@armbian:~$ ls
1  back_data  DDNS-go  ha  server  test  test.txt
```

可见在home路径下创建了一个新的‘1’的文件夹

### mkdir 创建多个层级目录

此时需要使用-p命令

```bash
haxlock@armbian:~$ mkdir -p 2/3/4
haxlock@armbian:~$ ls
1  2  back_data  DDNS-go  ha  server  test  test.txt
haxlock@armbian:~$ cd 2/3/4/
haxlock@armbian:~/2/3/4$ pwd
/home/haxlock/2/3/4
haxlock@armbian:~/2/3/4$ 
```

可以创建多层路径

## touch、cat、more文件操作命令

### touch 创建文件

touch Linux路径

我想创建一个test.txt文件

例如：

```bash
haxlock@armbian:~$ touch test.txt
haxlock@armbian:~$ ls
back_data  DDNS-go  ha  server  test.txt
```

创建了一个test.txt文件

> 可以通过颜色分别文件和文件夹，有色的是文件夹，白色的是文件

### cat、more查看文件内容

#### cat查看

```bash
haxlock@armbian:~$ cat test.txt 
这是一个测试文件
```

#### more查看

more与cat不同的是

- cat是直接把所有内容显示出来

- more是支持翻页的，可以一页一页显（空格翻页）

## cp-mv-rm命令

#### cp

cp（copy）用于复制文件、文件夹，主要用途在于修改某文件前将他提前备份。

**cp [-r] 路径1 路径2**

例如我想把/home/haxlock下的test.txt复制到根目录下，那么命令就是：

```bash
cp /home/haxlock/test.txt /
```

其中-r是当复制文件夹时候使用的，表示递归

#### mv

mv（move）用于移动文件或文件夹

**mv 参数1 参数2**

例如：

```bash
mv /home/haxlock/test.txt /
```

把路径下的test.txt移动到根目录下

#### rm

##### 基础指令

rm是用于删除的指令

rm [-r -f] 参数1 参数2 参数3 ....参数n 

其中，-r表示用于删除文件夹

-f 表示force,强制删除文件夹，不会弹出提示

后面多个参数代表多个您需要删除的文件。

例如我想删除/home/haxlock路径下的‘1’文件夹

```bash
rm -r /home/haxlock/1
```

这时候会弹出提示您是否要删除？然后确认即可

如果您加了 -f 那么就不会弹出提示

大部分情况下不建议使用-f 参数，因为十分危险。

##### 搭配通配符使用

- *符号就代表通配符，可以匹配任意内容

- test* 表示匹配所有以test开头的内容

- *test 表示所有以test结尾的内容

- \*test\* 表示所有包含test的内容

- 删除所有以test开头的文件和文件夹：

```bash
rm -r test*
ls
```

## which- find 命令

### which

which用于查找命令对应的文件

例如：

```bash
which pwd
```

> 只针对命令文件查找 

### find

#### 按照文件名查找

find **起始路径** -name **"被查找文件名"**

由于是全盘搜索

命令应当这样使用:

```bash
sudo find / -name test
```

也可以搭配通配符使用，详情请看[搭配通配符使用](##### 搭配通配符使用)

#### 按照大小查找

find 起始路径 -size + | n[kMG]

- \+ - 表示大于和小于

- n表示大小数字

- kMG表示单位，k(小写字母)表示kb，M为MB,G为GB

例如：

- 查找小于10KB文件：find / -size -10k

- 大于100MB文件： find / -size + 100M

- 查找大于1GB文件: find / -size +1G

## grep-wc 管道符号

### grep

grep [-n] 关键字 文件路径

- -n 可选表示结果中显示匹配的行的行号

- 关键字 表示要过滤的关键字，用“”包围

- 文件路径，可作为内容的输入端口

例如有一个test.txt文件，内容为：

这是一个测试文件

这是两个测试文件

这是三个测试文件

查找第一行，一个

```bash
haxlock@armbian:~$ grep "一个" test.txt 
这是一个测试文件
```

一个被标红，输入查找结果

```bash
haxlock@armbian:~$ grep -n "一个" test.txt 
1:这是一个测试文件
```

加入-n参数可以输入行数

### wc

wc [-c -m -l -w]  文件路径

用于统计文件的行数、单词数量等

- -c 统计bytes数量

- -m 统计字符数量

- -l 统计行数

- -w 统计单词数量

```bash
haxlock@armbian:~$ wc test.txt 
 5  3 77 test.txt
```

5代表五行，3代表个3个单词，77个字节

### ‘|’ 管道符

**表示把管道符后左边的命令结果，作为右边的命令的输入**

例如：

```bash
haxlock@armbian:~$ cat test.txt | wc -l
5
```

左边cat输入的结果作为右边wc -l命令的输入

输出结果5，代表中国文件有五行内容

又例如：

```bash
haxlock@armbian:~$ ls -l /usr/bin | wc -l
1180
```

可以用于统计文件的数量

## echo、tail和重定向符

### echo

echo 输出的内容

**可以用echo命令在命令行输出指定内容**

```bash
haxlock@armbian:~$ echo "hello word"
hello word
```

如果想输出‘pwd’的结果呢？

我们可以：

```bash
haxlock@armbian:~$ echo `pwd`
/home/haxlock
```

用 \`pwd\` 即可实现这个功能，被  ` 所包围的会输出它的结果

### 重定向符

#### >

\> 把左侧命令的结果覆盖写入符号右侧的文件中

例如：

```bash
haxlock@armbian:~$ echo "覆盖测试" > test.txt 
haxlock@armbian:~$ cat test.txt 
覆盖测试
```

#### >>

\>> 表示把左侧命令结果追加写入符号右侧的文件中

例如：

```bash
haxlock@armbian:~$ echo "我嘞个都！" >> test.txt 
haxlock@armbian:~$ cat test.txt 
覆盖测试
我嘞个都！
```

### tail 命令

tail [-f -num] Linux路径

查看文件尾部内容，**跟踪文件的是最新更改**

- Linux路径表示被跟踪的路径

- -f 表示持续跟踪

- -num 表示查看尾部多少行，默认为10

**查看尾部10行，追踪文件更新**

```bash
haxlock@armbian:~$ tail -5 test.txt 
sys
tmp
usr
var
www
```

如果用 -f参数，那么会一直跟踪文件的更新情况

## vim\vi编辑器

vim兼容所有vi功能，后续使用vim就行，无所谓

- 若文件不存在，则创建文件

- 若文件已存在，则直接编辑文件

```bash
vim hello.txt
```

| 模式     | 命令           | 描述                  |
| ------ | ------------ | ------------------- |
| 命令模式   | `i`          | 在当前光标位置进入`输入模式`     |
| 命令模式   | `a`          | 在当前光标位置后进入`输入模式`    |
| 命令模式   | `I`          | 在行开头进入`输入模式`        |
| 命令模式   | `A`          | 在行结尾进入`输入模式`        |
| 命令模式   | `o`          | 在光标下一行进入`输入模式`      |
| 命令模式   | `O`          | 在光标上一行进入`输入模式`      |
| 输入模式   | `esc`        | esc进入`命令模式`         |
| 命令模式   | `上,k`        | 向上移动光标              |
| 命令模式   | `下,j`        | 向下移动光标              |
| 命令模式   | `左,h`        | 向左移动光标              |
| 命令模式   | `右,l`        | 向右移动光标              |
| 命令模式   | `0`          | 移动光标到当前行头           |
| 命令模式   | `$`          | 移动光标到当前行尾           |
| 命令模式   | `pgUp`       | 上翻页                 |
| 命令模式   | `pgDn`       | 下翻页                 |
| 命令模式   | `/`          | 搜索模式                |
| 命令模式   | `n`          | 向下继续搜索              |
| 命令模式   | `N`          | 向上继续搜索              |
| 命令模式   | `dd`         | 删除当前行               |
| 命令模式   | `ndd`        | 删除当前行下面的n行          |
| 命令模式   | `yy`         | 复制当前行               |
| 命令模式   | `nyy`        | 复制n行                |
| 命令模式   | `p`          | 粘贴内容                |
| 命令模式   | `u`          | 撤销修改                |
| 命令模式   | `ctrl + r`   | 反向撤销修改              |
| 命令模式   | `gg`         | 跳到首行                |
| 命令模式   | `G`          | 跳到行尾                |
| 命令模式   | `dG`         | 从当前行，向下全部删除         |
| 命令模式   | `dgg`        | 从当前行开始，向上全部删除       |
| 命令模式   | `d$`         | 从当前光标开始，删除到本行的结尾    |
| 命令模式   | `d0`         | 从当前光标开始，删除到本行的开头    |
| 底线命令模式 | `:wq`        | 保存并退出               |
| 底线命令模式 | `:q`         | 退出                  |
| 底线命令模式 | `:q!`        | 强制退出                |
| 底线命令模式 | `:w`         | 保存                  |
| 底线命令模式 | `:set nu`    | 显示行号                |
| 底线命令模式 | `:set paste` | 设置粘贴模式（为了确保粘贴格式没问题） |

## 关于为什么ubuntu、debian等使用su - root无法进入root模式的原因

由于ubuntu、debian等发行版操作系统一般默认不给你root账户权限，因此你输入这个的时候，可能会报错如下:

su(switch user)

```bash
haxlock@armbian:~$ su - root
Password: 
su: Authentication failure
```

如果您需要进入root账户，需要通过以下命令进入：

```bash
haxlock@armbian:~$ sudo -i
[sudo] password for haxlock: 
root@armbian:~# 
```

或者

```bash
sudo su
```

也可以进入root账户

### 切换账户的方式

su - 用户名

例如：

```bash
root@armbian:~# su - haxlock
haxlock@armbian:~$ 
```

如果你切换完账户后，通过`exit` 可以切换回上一个用户

```bash
root@armbian:/home/haxlock# exit
exit
haxlock@armbian:~$ 
```

还有使用`ctrl+d` 也可以切换回上一个用户

## Linux 用户以及用户组

Linux系统可以

- 配置多个用户

- 配置多个用户组

- 用户可以加入多个用户组

### 用户组

- 创建

groupadd 用户组名

- 删除

groupdel 用户组名

### 用户管理

- 创建用户

`useradd [-g -d] 用户名`

1. 选项： -g指定用户组，不指定-g，会创建同名组并自动加入，指定-g需要组以及存在，如果存在用户组，必须使用-g

2. 选项：-d指定用户HOME路径，如果不指定就默认在/home/用户名下
- 删除用户

`userdel [-r] 用户名`

    1. 选项： -r，删除用户的HOME目录，不适用-r，删除用户时，HOME会被保留

- 查看用户所属组

`id [用户名]`

    1. 参数：用户名，被查看的用户，如果不提供则查看自身

- 修改用户所属组

`usermod -aG 用户组 用户名`

指定用户加入指定的用户组

### getent

getent passwd

查看当前系统中有哪些用户

getent group

查看当前系统有哪些组

## 查看权限管控

```bash
haxlock@armbian:~$ ls -l
total 20
drwxrwxr-x 13 root    root    4096  1月 23 13:38 back_data
drwxr-xr-x  2 root    root    4096  1月 10 07:46 DDNS-go
drwxr-xr-x  2 root    root    4096  1月 10 13:47 ha
drwxr-xr-x  6 root    root    4096  1月  9 17:51 server
-rw-rw-r--  1 haxlock haxlock  155  2月  7 08:45 test.txt
```

来分析一下头部

drwxrwxr-x

- d表示这是一个文件夹，-为文件,l表示软链接

- rwx这三个是所属用户权限，表示有r有w有x

- rwx后三个表示是所属用户组的权限,有r有w有x

- r-x最后三个表示洽谈用户权限，有r无w有x

r代表读权限，w代表可写，x代表可执行(excute)

## chmod

可以通过chmod命令，修改，文件、文件夹的权限信息

> 只有文件、文件夹的所属用户或者root用户可以修改

**语法： chmod [-R] 权限 权限 文件或者文件夹**

- -R 对文件夹内全部内容应用同样的擦欧总

- chmod u=rwx,g=rx,o=x hello.txt 把权限修改为rwxr-x--x

- - 其中u代表user所属先前，g表示group组权限，o表示其他用户权限

- chmod -r u=rwx,g=rx,o=x test 将问及那家tst以及文件夹内全部内容权限设置为wrxr-r--x

权限也可以用数字来替代

用三位数字表示 **r为4,w为2,x为1**

- 0:无任何权限 ---

- 1:仅x，--x

- 2:仅w, -w-

- 3:wx, -wx

- 4:仅，r

- 5:r-x,r和x权限, r-x

- 6:有r和w权限，rw-

- 7:全部权限,rwx

**简单说就是二进制的和**

## chown

修改文件、文件夹所属用户和用户组

**此命令只可root执行**

语法：`chown [-R] [用户][:][用户组] 文件或者文件夹`

## linux各种实用命令

### 基本

ctrl+c强制退出停止命令运行

ctrl+d退出当前登录

history 查看历史输入过的命令

!命令前缀，自动执行上一次匹配前缀的命令

### 历史命令搜索：

- 通过ctrl+r，输入内容去匹配历史命令

- 键盘左右键，可以得到此命令（不执行）

- ctrl+a跳到命令开头,ctrl+e跳到命令结尾，ctril+左，向左跳一个单词，ctrl+右，向右跳一个单词

- ctrl+l清空终端内容,clear也可以得到同样的效果

### ubuntu-apt命令

```bash
sudo apt update
#安装这个包
sudo apt install wget
# 寻找这个应用包
sudo apt search wget
#移除这个包
sudo apt remove wget
```

### systemctl命令

systemctl控制软件、服务的启停，开机自启

- systemctl start 开启服务

- systemctl stop 关闭服务

- systemctl enable 开机自启动

- systemctl status 查看状态

## 软链接

简单来说类似于windows中的快捷方式

创建一个链接可以指向一个文件、文件夹

语法： `ln -s 参数1 参数2`

```bash
haxlock@ubuntu:~$ sudo ln -s /etc/apt ~/apt
haxlock@ubuntu:~$ ls -l
total 12
drwxr-xr-x 3 root    root    4096 Feb 11 14:33 1panel-v1.10.24-lts-linux-amd64
lrwxrwxrwx 1 root    root       8 Feb 14 08:16 apt -> /etc/apt
-rw-rw-r-- 1 haxlock haxlock 3586 Jun 29  2020 bt-uninstall.sh
drwxrwxr-x 2 root    root    4096 Feb 14 05:35 test
haxlock@ubuntu:~$ cd apt
haxlock@ubuntu:~/apt$ ls
apt.conf.d   keyrings       preferences.d.save  sources.list.btbackup     sources.list.d  trusted.gpg.d
auth.conf.d  preferences.d  sources.list        sources.list.curtin.orig  trusted.gpg
haxlock@ubuntu:~/apt$ cd ..
haxlock@ubuntu:~$ ls
1panel-v1.10.24-lts-linux-amd64  apt  bt-uninstall.sh  test
haxlock@ubuntu:~$ 
```

## date 查看时间

格式`date [-d] [+格式化字符串]`

```bash
Fri Feb 14 08:17:09 AM UTC 2025
haxlock@ubuntu:~$ date
Fri Feb 14 08:18:34 AM UTC 2025
haxlock@ubuntu:~$ date +%Y-%m-%d
2025-02-14
haxlock@ubuntu:~$ date "+%Y-%m-%d %H:%M:%S"
2025-02-14 08:20:32
```

- %Y年

- y 年份后两位数字

- m 月份

- d 天

- H 小时（24）

- M 分钟

- S 秒

- s 自1970-01-01至今的时间

```bash
#查看明天的时间
haxlock@ubuntu:~$ date -d "+1 day"
Sat Feb 15 08:26:36 AM UTC 2025

#去年
haxlock@ubuntu:~$ date -d "-1 year"
Wed Feb 14 08:28:10 AM UTC 2024haxlock@ubuntu:~$ date -d "-1 year"
Wed Feb 14 08:28:10 AM UTC 2024
```

### 修改linux时区

#### 手动修改

```bash
haxlock@ubuntu:~$ sudo rm -f /etc/localtime
haxlock@ubuntu:~$ sudo ln -s -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
haxlock@ubuntu:~$ date
Fri Feb 14 04:47:51 PM CST 2025
```

#### ntp自动校准

```bash
sudo systemctl start ntp
```

#### ntp手动校准

```bash
ntpdate -u ntp.aliyun.com
```

指向一个ntp服务器即可

## 查看ip地址

```bash
ifconfig
```

主机名

```bash
haxlock@ubuntu:~$ hostname
ubuntu
```

修改主机名

```bash
hostnamectl set-hostname [需要修改的主机名]
```

配置主机名映射

先查看本机记录

- Windows看 C:\Windows\System32\drivers\etc\hosts

- Linux看： /etc/hosts

- 配置文件＋‘ip+主机名即可’

再去联网去DNS服务器询问

## 虚拟机静态ip配置

- 首先在Vmware配置好网卡设置

- 进入/etc/sysconfig/network-scripts/ifcfg-ens33文件，修改内容

- 将BOOTPROTO后面DHCP改为static

- 末尾加入如下内容：
  
  ```bash
  IPADDR="192.168.88.130" #IP地址
  NETMASK="255.255.255.0" #子网掩码
  GATEWAY="192.168.88.2" #网关与VMware设置一致
  DNS1 ="DNS为网关即可"
  ```

## 网络传输

### ping

`ping [-c num] ip`

```bash
haxlock@ubuntu:~$ ping -c 5 www.baidu.com
PING www.baidu.com(2409:8c20:6:1d55:0:ff:b09c:7d77 (2409:8c20:6:1d55:0:ff:b09c:7d77)) 56 data bytes
64 bytes from 2409:8c20:6:1d55:0:ff:b09c:7d77 (2409:8c20:6:1d55:0:ff:b09c:7d77): icmp_seq=1 ttl=54 time=4.15 ms
64 bytes from 2409:8c20:6:1d55:0:ff:b09c:7d77 (2409:8c20:6:1d55:0:ff:b09c:7d77): icmp_seq=2 ttl=54 time=4.71 ms
64 bytes from 2409:8c20:6:1d55:0:ff:b09c:7d77 (2409:8c20:6:1d55:0:ff:b09c:7d77): icmp_seq=3 ttl=54 time=4.86 ms
64 bytes from 2409:8c20:6:1d55:0:ff:b09c:7d77 (2409:8c20:6:1d55:0:ff:b09c:7d77): icmp_seq=4 ttl=54 time=4.59 ms
64 bytes from 2409:8c20:6:1d55:0:ff:b09c:7d77 (2409:8c20:6:1d55:0:ff:b09c:7d77): icmp_seq=5 ttl=54 time=4.59 ms

--- www.baidu.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4005ms
rtt min/avg/max/mdev = 4.152/4.582/4.862/0.237 ms
```

### wget

非交互式文件下载器

`wget [-b] url`

- \-b 后台下载，日志会写道wget-log中

- url下载链接

### curl

发起http网络请求，可用于下载文件、获取信息

`curl [-o] url`

- \-o 用于下载文件

- url请求的地址

## 端口

设备与外界通信交流的出入口

分为物理端口以及虚拟端口

- 物理端口：也称为接口，如USB,RJ45网口，HDMI

- 虚拟端口：指的计算机内部端口，用于操作系统与外界交互使用

Linux支持65535个端口，这6万多个端口可以分为3类使用

- 公认端口：1-1023,通常为一些系统内置或者知名程序预留，例如ssh的22，https的443

- 注册端口：1024-49151 ，通常可以随意使用，用于松散地绑定一些程序\服务

- 动态端口：49152-65535，也通常不绑定程序，而是程序对外进行网络链接时候，用于临时使用

### nmap查看端口占用情况

```bash
sudo apt install nmap -y
nmap 127.0.0.1
```

会扫描某个ip开放地端口

### netstat查看指定端口占用情况

netstat -anp|grep 端口号

安装：

```bash
sudo apt install net-tools
```

使用：

```bash
haxlock@root:~$ netstat -anp|grep 3001
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
tcp6       0      0 :::3001                 :::*                    LISTEN      6550/java     
```

可以看到某端口在被哪个端口占用，进程号(PID)是多少

## 进程管理

也可以说是**任务管理器**

### 查看进程

```bash
ps [-e -f]
```

- -e 显示所有的进程

- -f 以完全格式化的形式展示信息

一般来说，如果ps -ef就是列出所有进程的全部信息

```bash
haxlock@root:~$ ps -f
UID          PID    PPID  C STIME TTY          TIME CMD
haxlock    96215   96214  0 14:49 pts/0    00:00:00 -bash
haxlock    96232   96215 99 14:50 pts/0    00:00:00 ps -f
```

- UID:进程所属的用户ID

- PID: 进程的进程号ID

- PPID: 进程的父ID

- C:此进程的CPU占用比

- STIME：进程的启动时间

- TTY：启动此进程的终端序号，？表示非终端启动

- TIME：进程占用CPU的时间

- CMD：进程的启动路径或运行路径

如果想确认跟踪一个进程的信息

可以：

```bash
ps -ef | grep [进程名]
```

### 关闭进程

```bash
kill [-9] 进程ID
```

其中 **-9** 代表强制关闭

## top 主机状态详解

```bash
top
```

查看主机的各种状态参数，默认每5s刷新一次

内容较多，此处可当工具查找

**top命令经常用来监控linux的系统状况，是常用的性能分析工具，能够实时显示系统中各个进程的资源占用情况。**

### **常用参数**

top的使用方式 top [-d number] | top [-bnp]

| 参数        | 含义                                          |
| --------- | ------------------------------------------- |
| -d number | number代表秒数，表示top命令显示的页面更新一次的间隔 (default=5s) |
| -b        | 以批次的方式执行top                                 |
| -n        | 与-b配合使用，表示需要进行几次top命令的输出结果                  |
| -p        | 指定特定的pid进程号进行观察                             |

**top命令显示的页面还可以输入以下按键执行相应的功能（注意大小写区分的）**

| 参数  | 含义                      |
| --- | ----------------------- |
| ？   | 显示在top当中可以输入的命令         |
| P   | 以CPU的使用资源排序显示           |
| M   | 以内存的使用资源排序显示            |
| N   | 以pid排序显示                |
| T   | 由进程使用的时间累计排序显示          |
| k   | 给某一个pid一个信号,可以用来杀死进程(9) |
| r   | 给某个pid重新定制一个nice值（即优先级) |
| q   | 退出top（用ctrl+c也可以退出top）  |

### **top各输出参数含义**

```bash
top - 15:23:39 up 7 days,  7:57,  2 users,  load average: 0.00, 0.01, 0.00
Tasks: 249 total,   1 running, 248 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.1 us,  0.2 sy,  0.0 ni, 99.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :   7894.1 total,    367.4 free,   5022.1 used,   2813.0 buff/cache     
MiB Swap:   2048.0 total,   2047.7 free,      0.3 used.   2872.0 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                 
  81232 root      20   0  315932   9472   7936 S   0.3   0.1   2:52.54 vmtoolsd                                                
  96087 root      20   0       0      0      0 I   0.3   0.0   0:02.13 kworker/3:2-events                                      
  96214 haxlock   20   0   15124   7088   5120 S   0.3   0.1   0:00.17 sshd                                                    
  96302 haxlock   20   0   11944   5888   3712 R   0.3   0.1   0:00.02 top                                                     
      1 root      20   0   22624  13696   9472 S   0.0   0.2   1:22.07 systemd                                                 
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.89 kthreadd         
```

#### 一、top前五条信息解释

```bash
top - 15:23:39 up 7 days,  7:57,  2 users,  load average: 0.00, 0.01, 0.00
```

| 内容                             | 含义                                            |
| ------------------------------ | --------------------------------------------- |
| 14:49:28                       | 表示当前时间                                        |
| up 1:33                        | 系统远行时间，格式为时：分                                 |
| 1 user                         | 当前登陆用户数                                       |
| load average: 0.00, 0.00, 0.00 | 系统负载，即任务队列的平均长度。 三个数值分别为 1分钟、5分钟、15分钟前到现在的平均值 |

```bash
Tasks: 249 total,   1 running, 248 sleeping,   0 stopped,   0 zombi
```

| 内容              | 含义       |
| --------------- | -------- |
| Tasks: 80 total | 进程总数     |
| 2 running       | 正在运行的进程数 |
| 78 sleeping     | 睡眠的进程数   |
| 0 stopped       | 停止的进程数   |
| 0 zombie        | 僵尸进程数    |

```bash
%Cpu(s):  0.1 us,  0.2 sy,  0.0 ni, 99.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 s
```

| 内容       | 含义                                |
| -------- | --------------------------------- |
| 0.0%us   | 用户空间占用CPU百分比                      |
| 0.0%sy   | 内核空间占用CPU百分比                      |
| 0.0%ni   | 用户进程空间内改变过优先级的进程占用CPU百分比          |
| 100.0%id | 空闲CPU百分比                          |
| 0.0%wa   | 等待输入输出的CPU时间百分比                   |
| 0.0%hi   | 硬中断（Hardware IRQ）占用CPU的百分比        |
| 0.0%si   | 软中断（Software Interrupts）占用CPU的百分比 |
| 0.0 st   | 用于有虚拟cpu的情况，用来指示被虚拟机偷掉的cpu时间      |

```bash
Mem: 1922488k total, 406936k used, 1515552k free, 11940k buffers
```

| 内容             | 含义         |
| -------------- | ---------- |
| 1922488k total | 物理内存总量     |
| 406936k used   | 使用的物理内存总量  |
| 1515552k free  | 空闲内存总量     |
| 11940k buffers | 用作内核缓存的内存量 |

```bash
Swap: 835576k total, 0k used, 835576k free, 111596k cached
```

| 内容             | 含义       |
| -------------- | -------- |
| 835576k total  | 交换区总量    |
| 0k used        | 使用的交换区总量 |
| 835576k free   | 空闲交换区总量  |
| 111596k cached | 缓冲的交换区总量 |

#### 二、进程信息

| 列名      | 含义                                        |
| ------- | ----------------------------------------- |
| PID     | 进程id                                      |
| USER    | 进程所有者的用户名                                 |
| PR      | 优先级                                       |
| NI      | nice值。负值表示高优先级，正值表示低优先级                   |
| VIRT    | 进程使用的虚拟内存总量，单位kb。VIRT=SWAP+RES            |
| RES     | 进程使用的、未被换出的物理内存大小，单位kb。RES=CODE+DATA      |
| SHR     | 共享内存大小，单位kb                               |
| S       | 进程状态。D=不可中断的睡眠状态 R=运行 S=睡眠 T=跟踪/停止 Z=僵尸进程 |
| %CPU    | 上次更新到现在的CPU时间占用百分比                        |
| %MEM    | 进程使用的物理内存百分比                              |
| TIME+   | 进程使用的CPU时间总计，单位1/100秒                     |
| COMMAND | 命令名/命令行                                   |

## 环境变量

一系列命令本质上就是一个个可执行文件。

例如：cd本体就是/usr/bin/cd这个文件下的文件

查看当前环境变量：

```bash
env
```

### PATH

```bash
haxlock@root:~$ env | grep PATH
CLASSPATH=.:/usr/local/jdk21/lib
PATH=.:/usr/local/jdk21/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

可以得到这么一些键值对，其实从本以上来理解，查询环境变量，本就是通过在**PATH键对应的值**中去查找相应的命令环境

会在值中挨个去搜索环境变量的值，直到寻找到相应的内容。

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
