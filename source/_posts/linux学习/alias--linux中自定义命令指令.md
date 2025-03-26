---
title: alias--linux中自定义命令指令.md
date: 2025/3/21
tags: linux
categories:

- [运维]
- [linux]
---

# 前提：

相信不少人都考虑过一个问题：为什么现在新发行版的linux中，ll代表ls -l？la 代表ls -a？

今天刷题目时候，终于见到一个填空题来解决我这个疑问

# 题目

题目是这样的，在Linux中，若要为命令‘’ls -art”设置一个别名tdir，则应命令行中键入别名命令：?

这题的答案应该是：alias  tdir='ls -art'

那么这样就引出了`alias` 这样一个命令

# alias

对于alias这个命令,linux中解释是这样的

```shell
alias: alias [-p] [名称[=值] ... ]
    定义或显示别名。

    不带参数时，"alias" 以可重用的格式 "alias 名称=值" 将别名列表
    打印到标准输出。

    否则，对于每一个给出了 <值> 的 <名称> 定义一个别名。如果 <值> 的
    末尾是空格，那么在展开该别名后，还会继续检查下一个词是否可以
    进行别名替换。

    选项：
      -p    以可重用的格式打印所有已定义的别名

    退出状态：
    alias 返回真，除非提供了一个尚未定义别名的 <名称>。
```

那么我们在根据他说的事实alias -p

```shell
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias tdir='ls -art'
```

这样一看：

哦原来这样：这样看，就明白了为什么很多快捷键都是由什么决定的。

在这边明确表明了，很多快捷的命令都是在alias中自定义的，那么我们也就了解了，我们自己也可以在里面自己定义快捷命令：

```shell
alias tdir='ls -art'
```

这样就可以在同一终端中使用tdir这个命令，执行时候也就代表了ls -art这个命令

如果需要每次开启终端都生效，可以将这个写入配置文件中

```shell
echo "alias tdir='ls -art'" >> ~/.bashrc
```

然后通过source重新加载配置文件：

```shell
source ~/.bashrc
```

这样，我们就大概了解了alias这个命令的功能，可以高度自定义自己的命令模块。
