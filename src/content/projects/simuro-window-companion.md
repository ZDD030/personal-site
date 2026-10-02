---
title: Simuro 窗口助手
published: 2026-10-02
description: 面向 Simuro 足球赛道的 Windows 调试工具，集中管理平台窗口、双方 Adapter 与策略配置。
image: /assets/images/projects/simuro-window-companion.svg
status: published
tags: [C#, Windows, Simuro, 调试工具]
order: 300
link:
  - label: 源码
    icon: fa7-brands:github
    value: https://github.com/ZDD030/SimuroWindowCompanion
  - label: 使用说明
    icon: material-symbols:menu-book-rounded
    value: https://github.com/ZDD030/SimuroWindowCompanion/blob/main/README.md
---

## 为什么做这个工具

Simuro 足球策略开发时，经常需要同时打开多个平台窗口，切换蓝方、黄方的 Adapter，再调整策略与环境路径。把这些分散的操作放进一个助手里，可以减少窗口切换和重复输入命令。

这个项目面向中国机器人及其人工智能大赛 Simuro 足球赛道，负责本机窗口与调试流程管理。平台仍通过官方 launcher 启动，比赛策略由各自的策略工程提供。

## 可以做什么

- **窗口管理**：识别多个 Simuro 平台窗口，支持平铺、聚焦、编号显示、预设尺寸和自定义尺寸。
- **双方 Adapter 控制**：集中启动、停止或重启蓝方和黄方的 `V5DLLAdapter`。
- **策略管理**：保存自定义策略槽位，为双方选择策略，配置快捷对战预设。
- **环境配置**：分别选择 Adapter、Python 和默认策略目录，支持自动检测与检查。
- **日常使用**：自定义全局快捷键、托盘操作、足球悬浮球，以及当前用户的开机启动。

## 使用入口

1. 在 Windows 10 或 Windows 11 上，通过官方 launcher 打开 Simuro 平台。
2. 按[仓库使用说明](https://github.com/ZDD030/SimuroWindowCompanion/blob/main/README.md)从源码编译并运行窗口助手。
3. 先使用窗口管理功能；需要控制 Adapter 时，再配置对应的程序、Python 与策略路径。

公开仓库提供 C# 源码、PowerShell 构建脚本和启动脚本。窗口管理依赖正在运行的 `Simuro.exe`；Adapter 功能还需要相应的平台运行环境。从源码编译使用 Windows 自带的 .NET Framework 4.x C# 编译器。

## 公开文档

- [完整使用说明与常见问题](https://github.com/ZDD030/SimuroWindowCompanion/blob/main/README.md)：窗口操作、快捷键、环境配置、策略槽位与开机启动。
- [公开文件清单](https://github.com/ZDD030/SimuroWindowCompanion/blob/main/PUBLIC_FILES.txt)：公开版包含的源码与脚本。
- [MIT 许可证](https://github.com/ZDD030/SimuroWindowCompanion/blob/main/LICENSE)。

## 项目记录

源码与使用文档已公开。这一页整理项目用途与使用入口；后续可以补充实际界面截图、开发中的问题，以及窗口管理和进程控制的实现笔记。

<!-- 后续填写真实开发过程；不预填比赛成绩、工具使用人数或未经验证的性能提升。 -->
