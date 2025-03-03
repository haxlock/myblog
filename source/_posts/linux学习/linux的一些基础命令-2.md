### locale语系

当你发现，输入的指令是`乱码`的时候，那么此时肯定就是系统的语系出现问题了，Linux是一个支持多国语系的系统。

如果默认状态下，不支持中文编码输出数据的话，那么此时我们需要把支持的语系修改一下，才能得出正确的信息。

我们可以这样做

#### 查看当前支持的语系

```bash
haxlock@Inspiron-3443:~$ locale
LANG=zh_CN.UTF-8
LANGUAGE=zh_CN:zh_HK:zh_TW
LC_CTYPE="zh_CN.UTF-8"   #下面为许多信息输出使用的特别语系
LC_NUMERIC=zh_CN.UTF-8
LC_TIME=zh_CN.UTF-8  #时间方面的语系数据
LC_COLLATE="zh_CN.UTF-8"
LC_ALL=  # 全部的数据同步更新的设置值
```

`LANG`代表当前的语系为zh_CN.UTF-8,代表简体中文。

例如如果时间语系是对的话，那么终端输入date应该输出的是如下数据：

```bash
haxlock@Inspiron-3443:~$ date
2025年 02月 27日 星期四 17:08:38 CST
```

否则数据可能如下：

```bash
5??29 14:24:36 CST 2015
```

#### 修改语系

```bash
LANG=en_US.utf8
export LC_ALL=en_US.utf8
#LANG只和出书讯息有关，如果要更改其他不同的信息，则需要同
#更新 LC_ALL
```

### 开机与关机的正确姿势

#### 关机指令：shutdown

```bash
sudo shutdown now
```

这个指令可以得出以下结论

shutdown关机对于linux来说是一个非常重要的工作，因此，普通用户是无法关机的，只有`root`用户可以进行关机操作。

`now`同时也可以设置关机时间和讯息

具体如下：

```bash
shutdown [-krhc] [时间] [警告讯息]
-k:不是真的关机，只是发送警告讯息出去
-r:在讲系统的服务停掉之后重新开机
-h:在系统服务停掉后，立即关机
-c：取消已经进行的shutdown指令内容
```

例如：

```bash
sudo shutdown -h 10 'I will shutdown after 10 mins'
```

在执行该命令后，会有个通告为后面的那段话。



#### 重启

```bash
sudo reboot
```
