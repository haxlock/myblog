---
title: windows配置WSL(ubuntu)环境
date: 2025/1/19 21:25:00
tags: linux
categories: 
- [服务器]
- [后端]
- [linux]
---

## 什么是WSL

**WSL**：Windows Subsystem for Linux,是用于Windows系统上的Linux子系统

- 完全**直连**计算机硬件

- 无需虚拟机虚拟硬件
  
  <!-- more -->

是win10系统带来的全新特性

- 传统方式获取linux操作环境，都是通过虚拟机，如VMware

- 使用WSL，可以以非常轻量化的方式，得到linux系统环境

## 为什么要用WSL

- 使用范围广，大家都在用

- 非常方便，轻量化，节省内存

## WSL 使用方式（WIN10）

- 首先 WIN+X打开 *应用和功能*  

然后点击程序和功能

   ![](http://m401a.haxlock.top:3003/uploads/d2a6e589-50af-4e59-ab1a-c18179ab875b.jpg)

- 然后点击启用或关闭Windows功能
  
  ![](http://m401a.haxlock.top:3003/uploads/8aa8fb11-50b9-4668-a8a2-140abed46122.jpg)

**找到 *适用于Linux的Windows子系统* 并打勾**

之后可能会重启计算机，此时点击确认重启。



- 重启结束后，进入微软商店，搜索ubuntu

![](http://m401a.haxlock.top:3003/uploads/eb3275cc-5e9c-4299-a364-0e5d0ccb49cd.jpg)

众多版本均可选择，看你喜欢就好。

- 等待安装完成，此时在搜索框内搜索ubuntu，点击打开即可进入ubuntu终端界面，此时这个系统并非虚拟化。而是实打实本地直连的操作系统。后续配置也同正常ubuntu一样即可。非常的便捷方便



## win内ubuntu终端优化

由于原始的直接安装的ubuntu页面不太好用，页面不美观等问题，这边有一个方法用于美化ubuntu页面。   



### 在微软商店下载windows Terminal

![](http://m401a.haxlock.top:3003/uploads/122a1654-624a-4f12-a2a7-32487cd19e15.jpg)

下载完成后，打开，可以发现终端上有个小箭头，此时可以切换到ubuntu即可

![](http://m401a.haxlock.top:3003/uploads/ccfd3796-8dee-4783-ae3a-a4f2486a6c59.jpg)

这样就可以愉快的使用ubuntu进行操作了(yeah!)



能看到这的小伙伴我想以及超越了99%的人了，加油吧骚年！
