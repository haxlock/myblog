---
title: 如何卸载/重装ubuntu的桌面界面？
date: 2025/2/26
tags: linux
categories:

- [服务器]
- [运维]
- [linux]
---

# 禁用图形界面

Ubuntu 使用 **systemd** 管理系统服务，图形界面通常由 **gdm3** 或 **lightdm** 管理。你可以禁用图形界面服务，使系统开机后直接进入命令行。

<!-- more -->

## 禁用`gdm3`(假设你是GNOME桌面)

- 停止当前运行的图形界面服务：

```bash
sudo systemctl stop gdm3
```

- 禁用gdm3服务，使他开机不启动：

```bash
sudo systemctl disable gdm3
```

**禁用`lightdm`(假设你使用的是LightDM)**

- 停止当前运行图形界面服务：

```bash
sudo systemctl stop lightdm
```

- 禁用服务，开机不启动

```bash
sudo systemctl disable lightdm
```

## 设置默认运行级别为多用户模式（命令行）

Ubuntu 使用 `systemd` 的目标（target）来管理运行级别。默认图形界面运行在 `graphical.target`，而命令行模式运行在 `multi-user.target`。

- 设置默认目标为 `multi-user.target`：

```bash
sudo systemctl set-default multi-user.target
```

- 重启系统

```bash
sudo reboot
```

## 彻底卸载桌面环境并释放空间

- 卸载 GNOME 桌面

```bash
sudo apt remove --purge ubuntu-desktop gnome-shell gnome gdm3
```

- 卸载其他桌面环境（如果你安装了其他桌面）

```bash
sudo apt remove --purge kubuntu-desktop  # 卸载 KDE
sudo apt remove --purge xubuntu-desktop  # 卸载 XFCE
```

- 运行autoremove清除依赖

```bash
sudo apt autoremove
```

重启进入系统后，如果看到是终端形式，那应该就是卸载成功了。

或者通过以下命令：

```bash
systemctl get-default
```

如果输出为：`multi-user,target` 则配置成功

## 恢复桌面环境

- 重装桌面环境

```bash
sudo apt install ubuntu-desktop
```

- 设置默认目标为 `graphical.target`：

```bash
sudo systemctl set-default graphical.target
```

- 重启系统：

```bash
sudo reboot
```
