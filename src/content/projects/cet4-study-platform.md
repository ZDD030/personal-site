---
title: CET-4 远距共学台
published: 2026-10-02
description: 面向英语四级学习的双角色网页，支持文字与图片提交、教师批改评分，以及双方留言互动。
image: /assets/images/projects/cet4-study-platform.svg
status: published
tags: [JavaScript, Supabase, 英语学习, 网页实践]
order: 200
link:
  - label: 源码
    icon: fa7-brands:github
    value: https://github.com/ZDD030/CET-4website
  - label: 使用说明
    icon: material-symbols:menu-book-rounded
    value: https://github.com/ZDD030/CET-4website/blob/main/README.md
  - label: 部署指南
    icon: material-symbols:cloud-upload-rounded
    value: https://github.com/ZDD030/CET-4website/blob/main/GITHUB_PAGES_GUIDE.md
---

## 项目用途

CET-4 远距共学台把每日英语学习提交、批改和反馈放到同一个网页里。学生记录学习内容，教师查看提交并给出评分与评语，双方通过留言继续交流。

公开仓库将它定位为 MVP，也就是先把主要学习流程跑通的初步版本。源码、数据库脚本和部署文档已公开。

## 学习与反馈流程

1. **学生提交**：按学习任务填写文字，并上传相关图片。
2. **教师批改**：查看文字与图片，评分并填写评语。
3. **学生查看反馈**：在学生端阅读批改结果，结合留言继续交流。

项目包含阅读、听力、翻译、写作和模拟练习等任务；具体任务安排可在自己的版本中调整。图片提交支持多图，手机大图会在上传前压缩。

## 技术与目录

| 目录或文件 | 用途 |
| --- | --- |
| `web/index.html` | 网页入口 |
| `web/styles.css` | 页面样式 |
| `web/app.js` | 学习提交、角色与批改等交互 |
| `supabase/schema.sql` | 数据库与相关配置脚本 |
| `start_web.ps1`、`start_web.bat` | 本地预览启动入口 |
| `.github/workflows/deploy-pages.yml` | GitHub Pages 部署流程 |

网页使用 HTML、CSS 和 JavaScript，学习数据、账号与图片存储使用 Supabase。个人博客展示项目说明，学习平台仍在自己的仓库中独立维护。

## 运行与部署

先按[README 使用说明](https://github.com/ZDD030/CET-4website/blob/main/README.md)配置 Supabase，执行数据库脚本并设置前端配置，再启动本地网页。

需要发布时，参考[GitHub Pages 部署指南](https://github.com/ZDD030/CET-4website/blob/main/GITHUB_PAGES_GUIDE.md)。仓库提供自动部署流程，Pages 的开关和数据服务配置按文档完成。

## 公开文档

- [使用说明](https://github.com/ZDD030/CET-4website/blob/main/README.md)：角色设置、学习提交、图片与批改流程。
- [GitHub Pages 部署指南](https://github.com/ZDD030/CET-4website/blob/main/GITHUB_PAGES_GUIDE.md)：发布和后续更新。
- [数据库脚本](https://github.com/ZDD030/CET-4website/blob/main/supabase/schema.sql)：数据库结构与配置参考。

## 后续记录

可以在这里补充做这个网页的具体契机、界面截图，以及实现图片提交、角色管理和反馈流程时遇到的问题。

<!-- 后续补充真实过程与使用体验；不预填学习成绩提升或用户数量。 -->
