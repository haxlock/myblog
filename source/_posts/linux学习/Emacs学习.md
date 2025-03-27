---
title: 关于ubuntu创建新用户时候遇到的一些问题
date: 2025/2/18 19:35:00
tags: linux
categories:

- [服务器]
- [运维]
- [linux]

---

# Emacs 入门（一）为什么要学习Emacs？

<!-- more -->

Emacs 是一个文本编辑器系列，包含有多个分支，其中最主流的一支是 GNU Emacs，大多数情况下所说的 Emacs 都是指 GNU Emacs，本教程也使用 Emacs 指代 GNU Emacs。Emacs 这一名字最早来源于 “Editor MACroS”，后来也有人称它集合了五个主要功能键的首字母 Esc、Meta、Alt、Ctrl、Shift。



Emacs和Vi共同被称为最古老的Unix编辑器



Emacs 的主要思路是大量依赖组合快捷键实现高效编辑，这直接导致了想要流畅使用 Emacs 必须要记忆 Emacs 的大量快捷键，需要相当一段时间熟悉。此外，Emacs 编辑器本身所使用的编程语言是 Emacs Lisp 语言，Lisp 语言的方言之一。Lisp 语言是诞生于 1958 年的世上第二古老高级程序设计语言，其语言以“列表”（List）作为语法和核心数据结构，由于其具备强大的宏系统，可以创造各式方言，Emacs Lisp 就是其中之一。



# Emacs 入门（二） 基础操作

本篇介绍 GNU Emacs 的基础知识和操作。本文内容只是让读者初识 Emacs 操作，这些操作需要日积月累的练习才能掌握，本文的后半部分更偏向用于日后查阅；另一方面，很多操作有些繁琐难以记忆，笔者将会在接下来的教程里介绍一些插件来极大改善这些问题，因此读者如果遇到晦涩的地方不必过分担心，也不用死记硬背。

## 安装

**最好安装新版本的，有很多新功能和兼容支持**

debian/ubuntu

```bash
sudo apt install emacs
```

## 启动

命令行直接emacs

```bash
emacs
```

## 关于键盘的操作

> Emacs作为一个图形界面诞生之前就有的编辑器，设计之初根本就不需要鼠标操作，因此，快捷键是极多的，对于编程来说，鼠标是低效的。因此，快捷键的出现，弥补了这点不足，但是记忆快捷键成了一个非常辛苦的事情，但是一旦熟悉了快捷键，就有极高的效率。

## 功能键

Emacs 中有五个功能键： `Control`、 `Meta`、 `Shift`、 `Super`、 `Hyper`。其中部分名称读者可能不熟悉，那是几十年前的键盘上的按键名称，其中的 `Hyper` 键更是在现代键盘上消失了。那 `Meta` 和 `Super` 又是什么呢？ `Meta` 对应于普通 PC 键盘上的 `Alt` 键，Mac 电脑上的 `Option` 键。 `Super` 对应 PC 键盘上的 `Win` 键，对应 Mac 电脑上的 `Command` 键。那么我们知道， `Super` 键在现代系统中起到了重要作用，因此 Emacs 平常不使用和 `Super` 键相关的快捷键，Emacs 的绝大多数快捷键都是使用 `Control` 和 `Meta` 键，而其中一大部分都是只使用 `Control` 键。



在 Emacs 中，我们经常需要自定义快捷键，那么需要一种方式来表示快捷键，这样才能写到配置文件里。Emacs 使用一个单独的字母表达功能键，见下表。

| Emacs 功能键 | 缩写  | 对应键盘按键(PC/Mac) |
| --------- | --- | -------------- |
| Control   | C   | Ctrl / Control |
| Meta      | M   | Alt / Option   |
| Shift     | S   | Shift / Shift  |
| Super     | s   | Win / Command  |
| Hyper     | H   | 无              |

Emacs 用连字符表示“同时按下”。例如，我们用 `C-a` 表达“先按下 `Control` 键不要松，再按下 `a` 键“。 `C-x b` 则表达“先按下 `Control` 键不松，按下 `x` 键，松开这两个键，按下 `b` 键”。

## Emacs 命令

在介绍具体的快捷键之前，要先说明 Emacs 的主体逻辑。与其它编辑器类似，Emacs 也是通过命令进行交互的。而所谓命令，就是 Emacs 中使用 [Elisp](https://zhida.zhihu.com/search?content_id=177702532&content_type=Article&match_order=1&q=Elisp&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NDMxMzIxODAsInEiOiJFbGlzcCIsInpoaWRhX3NvdXJjZSI6ImVudGl0eSIsImNvbnRlbnRfaWQiOjE3NzcwMjUzMiwiY29udGVudF90eXBlIjoiQXJ0aWNsZSIsIm1hdGNoX29yZGVyIjoxLCJ6ZF90b2tlbiI6bnVsbH0.mo9DeuQhqgTacfm72ZEcqjaHjWPPyREbeJt0hOHvSik&zhida_source=entity) 语言定义的一些函数。这些函数可以完成一些功能。例如，即使是最最简单的“将光标上移一行”，也对应着命令 `previous-line` 。一切操作都对应一个命令，而快捷键的本质是在调用这些命令。

对 Emacs 输入命令需要先按下 `M-x`，此时你会看到 Emacs 最下面的空行上出现了 "M-x "，然后等待你的输入，随后你便可以输入一个函数名。**`M-x`快捷键可以说是最重要的一个快捷键了，只要有它，即使你忘记了其它快捷键，也可以输入函数名进行调用。**

命令名的传统是有连字符连接的多个有意义的英文单词。在输入时可以用空格代替连字符。也可以使用 `<tab>` 键自动补全。



那么示例比方说：M-x help-with-tutorial-spec-language Chinese-GB18030

可以把语言换成简体中文



## 基础快捷键

### 打开

接下来介绍一些入门基础内容。读者最好打开一个文本进行尝试，例如前面提到的 Emacs 内置教程，如果不知如何打开，请按下 `C-h t` （注意松开 `Control` 键和 `h` 键之后再按 `t` 键）。或者读者打开任意一段代码。

### 退出

退出程序： `C-x C-c`。

对于输了一半的命令，或者按了一部分快捷键但不想继续了，可以按下 `C-g` 放弃。此外在任何场合如果出现了卡住等情况，也都可以尝试输入 `C-g` 打断。

### 光标移动

。。。非常无语，这东西连上下左右键都改了。

方向键*上、下、左、右*的快捷键是 `C-p`、 `C-n`、 `C-b`、 `C-f`。它们的英文含义分别是：previous（前）、next（后）、back（退）、forward（进）。

`虽然但是，上下左右也是能用的，我是不喜欢用这个`

除此之外，Emacs 提供了多种方式进行光标移动：

- 以词为单位： `M-b` 光标向左移动一个词， `M-f` 光标向右移动一个词。

- 首尾：

- 行： `C-a` 光标移至行首， `C-e` 光标移至行尾。而代码经常是有缩进的，但 `C-a` 会直接移动到整个行首，并不能直接编辑开头的文字，这种情况可使用 `M-m` 来移动到文字的开头。

- 句子： `M-a` 光标移至句首， `M-e` 光标移至句尾。

- 整个文件： `M-<` 移动到文件开头， `M->` 移动到文件末尾。注意这里需要同时按下 `Meta` 键、 `Shift` 键和*逗号*/*句号*键。

- 窗口：`M-r` 按第一次——光标移动到窗口中间行；接着按第二次——光标移动到窗口最上面一行；接着按第三次——光标移动到窗口最下面一行。

> 如果想增加一些趣味性，可以玩 Emacs 内的**贪吃蛇游戏**来锻炼对方向键的熟练度。按 `` M-` `` 调用 `tmm-menubar` ，按 `t` 选择 Tools，按 `g` 选择 Games，按 `s` 选择 Snake，然后开始游戏吧！

### 编辑操作

- 删除字符：删除一个字符与正常一样，按下删除键（在 Emacs 中删除键写为 `<DEL>`或 <`backspace>` ）即可删掉光标左侧的字符。如果想要删掉右侧的字符，就按下 `C-d` 键。
- 移除词：`M-d` 移除光标右边一整个词。`M-<DEL>` 移除光标左侧一整个词。
- 移除右侧直到句子结尾： `M-k`。
- 移除右侧直到行结尾： `C-k` 。
- 选中部分区域（region）：把光标移动到某处，按下 `C-SPC` （ `SPC` 表示空格键，space），此时 Emacs 最下方的空行显示 “Mark set“，表示当前打了一个标；接着任意移动光标到另一个位置，可以看到半透明的选择框。这就是和平日里使用鼠标进行选择是一样的。
- 复制： `M-w` 复制选中的区域。
- 移除： `C-w` 移除选中的区域。



Emacs 内部维护了一个环形“剪贴板历史”，当你想插入之前移除的内容时（即粘贴之前剪切的内容），按下 `C-y`，这被称为 "yank"，它会将最近一次移除的内容插入回来。那么如何粘贴历史记录呢？在一次 "yank" 的基础上，再按 `M-y` ，就可以得到倒数第二次移除的内容，再按一次 `M-y` 即可得到倒数第三次移除的内容，以此类推。后面笔者会介绍插件 [counsel](https://link.zhihu.com/?target=https%3A//github.com/abo-abo/swiper) 辅助这个过程。

- 撤销（undo）： `C-/` 或 `C-_` 或 `C-x u` 。撤销刚刚的操作。对字符进行编辑例外，例如你按了 5 次删除键删除了 5 个字符，按一下撤销即可复原。
- 重做（redo）：Emacs 对于历史记录也维护成了一个环。但 Emacs 并没有直接的重做操作，而是先按一下 `C-g` ，即没有操作，此时再按撤销键时，会撤销上次的“撤销”，相当于重做；也可以理解为按下 `C-g` 后这个环的移动方向会改变。所以 Emacs 其实不分 undo 和 redo，而是靠改变历史记录的移动方向来控制。那么读者一定觉得这里难以理解不便使用，没错，因此笔者将会在后面介绍更好用的插件 [undo-tree](https://link.zhihu.com/?target=https%3A//www.emacswiki.org/emacs/UndoTree)。

### 标记和跳转

上文提到的选中键 `C-SPC` 不仅是选中文本这么简单的功能，它的本质是设定一个标记（mark）。Emacs 还有一个标记跳转功能，例如我们先在文本的第一行，按下两次 `C-SPC`（这样我们即打了标记，又没有选中文本），然后光标移动到别的位置（甚至以后学过之后，到别的文件），这时候按下 `C-x C-SPC` 或 `C-u C-SPC`，即可立刻跳转回刚刚的位置。同样的，有更好用的插件可以辅助这一功能即上文提到的 [counsel](https://link.zhihu.com/?target=https%3A//github.com/abo-abo/swiper)。

想要跳到特定的行，`M-g M-g` 加行号、回车即可 。

### 页面移动

`C-v` 会向下翻滚一页内容， `M-v` 会向上翻滚一页。但 Emacs 会保留三行不会被翻过去，这样看起来更为舒服。

`C-l` 第一次按时，会移动页面使得光标所在行在窗口中央。这样当我们写文本写到下面时，只需要按一下 `C-l` 即可把当前光标所在行移动到正中央，有利于查看。但如果按完一次之后紧接着再按一次 `C-l`，会移动页面使得光标所在行在窗口最上面，而按第三次 `C-l` 会移动页面使得光标所在行在窗口最下面。第四次按与按一次的效果相同，如此循环。

### 搜索文本

从光标位置向下搜索，按下 `C-s`，即 search，此时最下方空行会出现 "I-search: "，输入你要搜索 的文本，此时会显示出能够匹配的文本，光标会移动到第一个匹配的文本位置。

- 如果你想让光标跳到下一个匹配位置，就再按一次 `C-s`。
- 如果想停留在当前位置，退出搜索，按下回车键。
- 如果想放弃搜索，回到搜索前的位置，按下 `C-g`。

从光标位置向前搜索，按下 `C-r`，其用法与 `C-s` 一致，只是方向相反。安装了 [swiper](https://link.zhihu.com/?target=https%3A//github.com/abo-abo/swiper) 的话会显示搜索结果列表，更为直观（swiper 和上文提到的 [counsel](https://zhida.zhihu.com/search?content_id=177702532&content_type=Article&match_order=1&q=+counsel&zd_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ6aGlkYV9zZXJ2ZXIiLCJleHAiOjE3NDMxMzIxODAsInEiOiIgY291bnNlbCIsInpoaWRhX3NvdXJjZSI6ImVudGl0eSIsImNvbnRlbnRfaWQiOjE3NzcwMjUzMiwiY29udGVudF90eXBlIjoiQXJ0aWNsZSIsIm1hdGNoX29yZGVyIjoxLCJ6ZF90b2tlbiI6bnVsbH0.xFEBTqxfl8my-7Da1S9n-vcWGxKSqoExVpiX20iWkXU&zhida_source=entity) 是一套插件）。



### 快捷键汇总：

| 操作描述         | 快捷键     | 命令名                        |
| ------------ | ------- | -------------------------- |
| 输入命令         | M-x     | execute-extended-command   |
| 退出程序         | C-x C-c | save-buffers-kill-terminal |
| 放弃当前输入       | C-g     | keyboard-quit              |
| 光标向上一行（方向键上） | C-p     | previous-line              |
| 光标向下一行（方向键下） | C-n     | next-line                  |

| 光标向左一个字符（方向键左） | C-b | backward-char          |
| -------------- | --- | ---------------------- |
| 光标向右一个字符（方向键右） | C-f | forward-char           |
| 光标向左移动一个词      | M-b | backward-word          |
| 光标向右移动一个词      | M-f | forward-word           |
| 光标移至行首         | C-a | move-beginning-of-line |
| 光标移至行尾         | C-e | move-end-of-line       |
| 光标移动到一行缩进的开头   | M-m | back-to-indentation    |
| 光标移至句首         | M-a | backward-sentence      |
| 光标移至句尾         | M-e | forward-sentence       |
| 光标移至文件开头       | M-< | beginning-of-buffer    |
| 光标移至文件结尾       | M-> | end-of-buffer          |

| 光标移动至窗口的中间、最上、最下 | M-r                   | move-to-window-line-top-bottom |
| ---------------- | --------------------- | ------------------------------ |
| 删除光标右侧字符         | C-d                   | delete-char                    |
| 移除光标右侧词          | M-d                   | kill-word                      |
| 移除光标左侧词          | M-                    | backward-kill-word             |
| 移除右侧直到句子结尾       | M-k                   | kill-sentence                  |
| 移除右侧直到行尾         | C-k                   | kill-line                      |
| 设置标记以选择区域        | C-SPC                 | set-mark-command               |
| 复制区域             | M-w                   | kill-region-save               |
| 移除区域             | C-w                   | kill-region                    |
| 插入已移除文本          | C-y                   | yank                           |
| 插入历史移除文本         | M-y                   | yank-pop                       |
| 撤回               | C-/ 或 C-_ 或 C-x u     | undo                           |
| 跳转到上一标记          | C-x C-SPC 或 C-u C-SPC | pop-global-mark                |
| 跳转到行号            | M-g M-g               | goto-line                      |
| 重复               | C-u                   | universal-argument             |
| 向下一页             | C-v                   | scroll-up-command              |

| 向上一页                | M-v     | scroll-down-command   |
| ------------------- | ------- | --------------------- |
| 移动页面使得光标在中央/最上方/最下方 | C-l     | recenter-top-bottom   |
| 向后搜索                | C-s     | isearch-forward       |
| 向前搜索                | C-r     | isearch-backward      |
| 交换前后字符              | C-t     | transpose-chars       |
| 交换前后词               | M-t     | transpose-words       |
| 交换前后两行              | C-x C-t | transpose-lines       |
| 在下方新建一行             | C-o     | open-line             |
| 删除连续空行为一个空行         | C-x C-o | delete-blank-lines    |
| 将后面的词变为小写           | M-l     | downcase-word         |
| 将后面的词变为大写           | M-u     | upcase-word           |
| 将后面的词变为首字母大写        | M-c     | capitalize-word       |
| 放大字号                | C-x C-= | text-scale-adjust     |
| 缩小字号                | C-x C-- | text-scale-adjust     |
| 重置字号                | C-x C-0 | text-scale-adjust     |
| 简要描述快捷键功能           | C-h c   | describe-key-briefly  |
| 描述快捷键功能             | C-h k   | describe-key          |
| 描述函数功能              | C-h f   | describe-function     |
| 描述变量                | C-h v   | describe-variable     |
| 列出含某一关键词的命令         | C-h a   | apropos-command       |
| 列出含某一关键词的符号的文档      | C-h d   | apropos-documentation |
| 帮助的帮助               | C-h ?   | help-for-help         |
