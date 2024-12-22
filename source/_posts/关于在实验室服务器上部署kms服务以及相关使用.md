---
title: 关于在实验室服务器上部署kms服务以及相关使用
top: 0
copyright: true
date: 2024-12-22 16:51:53
updated: 2024-12-22 16:51:53
permalink:
password:
comments: 
tags: 服务器 运维
categories:
keywords:
description:
---
# 前提概要

## kms (Key Management Service) 介绍

kms (Key Management Service) 指的是在windows Vista之后的产品中出现的一种新型产品激活机制，一开始的主要目的是用于Microsoft能够更好的遏制非法软件的授权行为而产生的一种技术。
<!-- more -->
简而言之，我个人概述他就是为了更为安全，方便地激活您的windows产品。

## kms工作原理
windows激活具有批量激活的功能，而众所周知，windows VL（Volume Licensing for Organizations）是为了批量激活而生，
因此在一个单位中，若需要大批量激活很多台配置相当的windows主机，那么此时我们就需要一个服务器启动一个服务端来进行批量的连接，这样可以然激活效率达到最高。这也是kms服务器出现的原因。

kms服务器可以在一个局域网下，对同局域网下的其他主机提供系统激活的服务，一般来说激活的时常为180天，会提供一个随机的激活ID(但此ID并不同于系统的产品激活密钥) ，kms服务器会自动检查系统的自动到期情况，并且自动续期。这样极大的保护了单位中系统的安全性，防止了外部计算机的非法授权等行为。

## kms 的优势
kms 服务器可以激活在 window Vista后面的所有系统版本。具有很强的泛用性，如果您的系统需要激活，只需要连接上此服务器后，便可以轻松激活您的系统。

# 自建KMS服务器步骤(服务端)
用ubuntu22版本来做演示

{% codeblock %}
wget --no-check-certificate https://cangshui.net/-down/-mytargz/vlmcsd-2018.zip

unzip vlmcsd-2018.zip -d /usr/local/

mv /usr/local/vlmcsd-2018/ /usr/local/kms/

chmod +x -R /usr/local/kms/*

echo "/usr/local/kms/binaries/Linux/intel/static/vlmcsd-x64-musl-static -t 10 -l /var/log/kms.log &
" > /etc/init.d/kms.sh #创建启动脚本

chmod +x /etc/init.d/kms.sh

/usr/local/kms/binaries/Linux/intel/static/vlmcsd-x64-musl-static -t 10 -l /var/log/kms.log #现在就启动服务
{% endcodeblock %}

然后开放防火墙的TCP1688端口

{% codeblock %}
sudo ufw allow 1688/tcp
{% endcodeblock %}

如果您需要进程守护，则可以使用此shell脚本定时执行

{% codeblock %}
mykms=$(ps -fe|grep vlmcsd-x64-musl-static |grep -v grep)
if [[ $mykms = "" ]]
then 
	echo "KMS进程未找到" && cd /usr/local/kms/binaries/Linux/intel/static && ./vlmcsd-x64-musl-static -t 10 -l /var/log/kms.log
else 
	echo "KMS进程存在" && exit
fi
{% endcodeblock %}

若您需要查看日志

{% codeblock %}
tail -f  /var/log/kms.log
{% endcodeblock %}

# 二、如何使用搭建好的kms服务器进行激活(用户)

我以我本人电脑(win10LTSC企业版)来进行演示

![](/images/kms_server/1.png)