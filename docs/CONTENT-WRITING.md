# 电气札记：内容填写指南

当前框架已采用昵称 Thach Soul，定位为电气工程及其自动化、四非保研至华南理工大学（985）、求学记录与生活随想。未填写具体成绩、排名、研究方向与申请年份。

## 日常编辑

在 VS Code 打开项目根目录，运行 `pnpm.cmd dev --host 127.0.0.1 --port 4322`。终端显示 ready 后打开对应地址，保存文件即可预览。

运行检查或构建前停止 dev，完成后再启动。`pnpm preview` 不随源码修改更新。

Windows 下已启用 300ms 轮询监听，避免文件事件误报引发服务连续重启。第一次访问需要编译，后续保存正文会自动更新。

## 喀什大学生存手册

总目录：`/handbook/`。每个篇章是独立 Markdown 文件：

| 文件 | 篇章 |
| --- | --- |
| `src/content/handbook/00-preface.md` | 序 |
| `src/content/handbook/01-arrival.md` | 初来喀大 |
| `src/content/handbook/02-learning.md` | 大学里的学习 |
| `src/content/handbook/03-electrical.md` | 电气专业的路 |
| `src/content/handbook/04-resources.md` | 信息、资源与机会 |
| `src/content/handbook/05-further-study.md` | 升学与保研 |
| `src/content/handbook/06-life.md` | 生活、关系与自我 |
| `src/content/handbook/07-afterword.md` | 后记 |

序是可继续修改的初稿；其余篇章先列出标题和小节。`<!-- ... -->` 是只在编辑器里可见的写作提示，补充正文后可以删除。

手册 Frontmatter 示例：

```yaml
---
title: 第一篇｜初来喀大
description: 入学适应、信息入口与最初的生活安排。
order: 1
status: outline
---
```

- `order` 为数字，决定目录顺序。
- `status: outline` 显示“写作提纲”；`draft` 显示“初稿”；`complete` 显示“已整理”。手册中的 status 只表示整理进度，各章均可阅读。
- 文件名数字前缀不进入网址，如 `01-arrival.md` 对应 `/handbook/arrival/`。已有篇章尽量保留文件名，避免旧链接失效。
- 新增 `.md` 文件后会自动进入目录和前后篇导航；写好标题、描述、顺序与状态即可。
- 学校政策、费用及申请规则注明适用年份与原始来源；不预填未经确认的学校规定或个人经历。

## 首批文章

| 文件 | 用途 |
| --- | --- |
| `src/content/posts/kashgar-university-handbook.md` | 首页的手册入口，链接各个篇章 |
| `src/content/posts/baoyan-to-scut.md` | 四非保研至华南理工的复盘提纲 |

两篇入口已设置置顶，页面注明仍在整理。保研复盘按实际经历补充时间线、条件、准备、选择与判断。

## 其他三个栏目

- `src/content/posts/electrical-notes-template.md`：电气笔记模板。
- `src/content/posts/technical-practice-template.md`：技术实践模板。
- `src/content/posts/life-reflections-template.md`：生活随想模板。

这三个模板设为 `draft: true`，开发预览可见，生产构建与 RSS 中不显示。正式写作时建议复制为新的文件，修改标题、日期和唯一 slug，完成后设为 `draft: false`。

## 关于、项目与随记

- 关于：`src/content/spec/about.md`。
- 项目：`src/content/projects/personal-site.md`，目前只展示已实际存在的个人网站。
- 随记：用 `pnpm.cmd new-d "随记正文"` 创建，初始不放虚构的动态。
- 头像：`src/config/profileConfig.ts`，当前是 TS 字母占位图，可换为自己的公开头像。
- 正式域名尚未确定，`siteConfig.site_url` 暂用本地地址；上线前替换为真实域名。

## 主题示例

原主题文章、项目、随记及对应图片保存在 `docs/theme-examples/`，供参考写法，不再显示为本站内容。Firefly/Fuwari 源码许可证及署名继续保留。
