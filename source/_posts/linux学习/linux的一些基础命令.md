# 这是一篇关于linux基本命令以及作用的概述和汇总学习

## ls

### ls命令

ls命令用于列出目录下的内容

例如输出结果可能如下：

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




