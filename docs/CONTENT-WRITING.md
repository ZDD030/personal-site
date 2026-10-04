# 电气札记：内容填写指南

当前框架已采用昵称 Thach Soul，定位为电气工程及其自动化、四非保研至华南理工大学（985）、求学记录与生活随想。未填写具体成绩、排名、研究方向与申请年份。

## 日常编辑

在 VS Code 打开项目根目录，运行 `powershell -ExecutionPolicy Bypass -File .\scripts\preview-site.ps1`。脚本统一使用 `http://127.0.0.1:4322/`，后台启动服务并等待页面就绪，然后打开 Microsoft Edge。保存文件即可预览，关闭启动终端不会停止后台服务。

运行检查或构建前用 `pnpm.cmd dev stop` 停止 dev，完成后再执行启动脚本。`pnpm.cmd dev status`、`pnpm.cmd dev logs` 可查看状态和日志。不要用 `--ignore-lock` 启动第二个服务，否则多个服务会争用同一份 Vite 缓存。`pnpm preview` 不随源码修改更新。

脚本加 `-Page /handbook/kashgar-and-me/` 可直接打开第一篇，加 `-NoOpen` 可只启动服务。重复启动复用已有实例；旧的 `/handbook/arrival/` 链接仍会自动跳转到第一篇。

Windows 下已启用 300ms 轮询监听，避免文件事件误报引发服务连续重启。第一次访问需要编译，后续保存正文会自动更新。

在 VS Code 按 `Ctrl+P` 输入下表的文件路径即可打开，编辑后按 `Ctrl+S` 保存，浏览器会更新。Markdown 文件可按 `Ctrl+Shift+V` 查看文字预览，最终排版以网站为准。

## 常用修改入口

| 想改什么 | 打开哪个文件 | 修改的位置 |
| --- | --- | --- |
| 首页名句、循环文字与背景 | `src/config/backgroundWallpaper.ts` | `homeText.title`、`homeText.subtitle`、`typewriter`、`src.desktop/mobile` |
| 头像、昵称、简介、联系方式 | `src/config/profileConfig.ts` | `avatar`、`name`、`bio`、`links` |
| 网站名称、介绍、关键词、正式域名 | `src/config/siteConfig.ts` | `title`、`description`、`keywords`、`site_url` |
| 顶部导航 | `src/config/navBarConfig.ts` | `links` 和 `LinkPresets` |
| 侧边公告 | `src/config/announcementConfig.ts` | 公告标题、正文与链接 |
| 友链 | `src/config/friendsConfig.ts` | `friendsConfig` 列表 |
| 关于我 | `src/content/spec/about.md` | Markdown 正文 |
| 手册各篇 | `src/content/handbook/` | 下方篇章表对应的文件 |
| 博客文章 | `src/content/posts/` | 一篇文章对应一个 `.md` 文件 |

### 头像和首页图片

头像已采用你提供的 FAN 1 背影照片；电脑横幅左侧完整使用蓝衣张开双臂照片的背景，右侧使用挥手照片，两图只在中间接缝做渐变。手机版仍使用挥手照片的方形构图。网站读取项目中的 WebP 文件，不依赖微信或临时文件目录。

- 头像：`public/assets/images/profile/fan-avatar.webp`。
- 电脑横幅：`public/assets/images/wallpaper/fan-collage-desktop.webp`。
- 手机横幅：`public/assets/images/wallpaper/fan-wave-mobile.webp`。

原电脑挥手横幅保留在 `public/assets/images/wallpaper/fan-wave-desktop.webp`。想恢复原图，将 `backgroundWallpaper.ts` 中的 `src.desktop` 改回 `/assets/images/wallpaper/fan-wave-desktop.webp` 即可。

以后换图，把新文件放在 `public/assets/images/` 中，并修改配置路径。`public` 目录不写进网址，例如文件 `public/assets/images/profile/my-avatar.jpg`，配置填写 `/assets/images/profile/my-avatar.jpg`。

### 首页动态文字

主题原有打字机效果已恢复。大标题是固定的「往者不可谏，来者犹可追。」，其下三句话逐字输入、删除并循环。修改 `homeText.subtitle` 数组即可换句子：

```ts
subtitle: [
  "记录电气所学，分享求学来路。",
  "他山之石，可以攻玉。",
  "Per Aspera Ad Astra.",
],
```

`typewriter.enable: true` 开启动效，`speed` 控制每个字的输入间隔，`deleteSpeed` 控制删除间隔，`pauseTime` 控制完整显示后的停留时间，单位均为毫秒。

## 喀什大学生存手册

总目录：`/handbook/`。每个篇章是独立 Markdown 文件：

| 文件 | 篇章 |
| --- | --- |
| `src/content/handbook/00-preface.md` | 序 |
| `src/content/handbook/01-kashgar-and-me.md` | 喀大于我，我与喀大 |
| `src/content/handbook/02-learning.md` | 大学里的学习 |
| `src/content/handbook/03-electrical.md` | 电气专业的路 |
| `src/content/handbook/04-resources.md` | 信息、资源与机会 |
| `src/content/handbook/05-further-study.md` | 升学与保研 |
| `src/content/handbook/06-life.md` | 生活、关系与自我 |
| `src/content/handbook/07-afterword.md` | 后记 |

序与第一篇已有初稿，第一篇仍有小节待补充；其余篇章先列出标题和小节。这些提纲可随实际写作调整，各篇可以独立阅读。`<!-- ... -->` 是只在编辑器里可见的写作提示，补充正文后可以删除。

手册 Frontmatter 示例：

```yaml
---
title: 第一篇｜喀大于我，我与喀大
description: 从录取时的失落，到三年求学中的竞赛、联培、科研与升学选择。
slug: kashgar-and-me
order: 1
status: draft
---
```

- `order` 为数字，决定目录顺序和前后篇导航，与文件名及写作先后无关。调整排序后，标题中的“第一篇、第二篇”等编号也需相应修改。
- `status: outline` 显示“写作提纲”；`draft` 显示“初稿”；`complete` 显示“已整理”。手册中的 status 只表示整理进度，各章均可阅读。
- `slug` 决定网址，如 `slug: kashgar-and-me` 对应 `/handbook/kashgar-and-me/`。建议使用小写英文与连字符；确定后可保留，不必随标题或顺序改变。
- 未填写 `slug` 时沿用文件名（去掉数字前缀和 `.md`），例如 `02-learning.md` 对应 `/handbook/learning/`。第一篇原来的 `/handbook/arrival/` 已设置跳转；以后修改其他篇章的网址时，也要处理旧链接。
- 新增 `.md` 文件后会自动进入目录和前后篇导航；写好标题、描述、网址、顺序与状态即可。首页的手册入口链接总目录，无需另行维护一份固定章节列表。
- 学校政策、费用及申请规则注明适用年份与原始来源；不预填未经确认的学校规定或个人经历。

## 首批文章

| 文件 | 用途 |
| --- | --- |
| `src/content/posts/kashgar-university-handbook.md` | 首页的手册入口，链接各个篇章 |
| `src/content/posts/baoyan-to-scut.md` | 四非保研至华南理工的复盘提纲 |

两篇入口已设置置顶，页面注明仍在整理。保研复盘按实际经历补充时间线、条件、准备、选择与判断。

## 写一篇新文章

最方便的是复制下面的某个栏目模板，重命名，再填正文。也可以在 VS Code 终端运行：

```powershell
pnpm.cmd new-post my-first-note
```

这会创建 `src/content/posts/my-first-note.md`。创建命令默认设为 `draft: false`，尚未写完时先改为 `true`。开头两条 `---` 之间是文章信息，正文写在第二条 `---` 之后：

```markdown
---
title: 我的第一篇电气笔记
published: 2026-10-02
description: 用一两句话说明这篇文章讲什么。
tags: [电气学习, 课程笔记]
category: 电气笔记
author: Thach Soul
draft: true
comment: false
slug: my-first-note
---

## 我想解决的问题

在这里写正文。

## 我的理解

继续写正文。

## 参考资料

[资料名称](https://example.com)
```

- `title` 是显示标题，`description` 是文章卡片简介。
- `published` 填实际日期；修改旧文时可以另加 `updated: YYYY-MM-DD`。
- `category` 选电气笔记、技术实践、求学记录或生活随想；`tags` 可填写多个。纯数字标签要加引号，如 `"985"`。
- `slug` 是网址中的名字，每篇需不同，例如 `/posts/my-first-note/`。
- `draft: true` 在本地开发可预览，生产网站不发布；完成后改为 `false`。
- `pinned: true` 可置顶，普通文章可不写这一行。

Markdown 常用写法：`## 小节标题`、`**重点**`、`- 列表项`、`[链接文字](网址)`。插图可放在 `public/assets/images/posts/`，正文写 `![图片说明](/assets/images/posts/图片文件名.jpg)`。公式用 `$...$` 写行内公式，或用两行 `$$` 包住独立公式。

书名号也可以作为可点击的链接文字，例如 `[《致新生的你》](https://axi404.top/blog/advise)`。保存后点击书名即可打开原文；只写 `《致新生的你》` 不会自动生成链接。

带引号的文字需要加粗时，推荐把引号放在星号外面，例如 `我愿称之为“**带着镣铐跳舞**”。`。`我愿称之为**“带着镣铐跳舞”**` 会因 Markdown 对标点边界的判断而显示出原始星号；若希望连引号一起加粗，可以写成 `我愿称之为 **“带着镣铐跳舞”**`，在前面留一个空格。

### 阅读时的文章目录

博客文章、项目详情和手册章节复用 Firefly 的目录组件。电脑窗口宽度达到 1280px 时，右侧显示目录并随滚动标记当前位置；手机和较窄窗口使用右下角的目录按钮展开。手册顶部的“手册章节目录”用于切换篇章，右侧目录用于跳转当前篇章内的小节。

目录根据正文标题自动生成，无需手动维护：`## 小节标题` 是主条目，`### 子标题` 是下一层，星号加粗的段落不会进入目录。目录组件当前最多展示三层标题。侧栏配置在 `src/config/sidebarConfig.ts`，其中右侧 `sidebarToc` 的 `enable: true` 表示启用。

## 其他三个栏目

- `src/content/posts/electrical-notes-template.md`：电气笔记模板。
- `src/content/posts/technical-practice-template.md`：技术实践模板。
- `src/content/posts/life-reflections-template.md`：生活随想模板。

这三个模板设为 `draft: true`，开发预览可见，生产构建与 RSS 中不显示。正式写作时建议复制为新的文件，修改标题、日期和唯一 slug，完成后设为 `draft: false`。

## 关于、项目与随记

- 关于：`src/content/spec/about.md`。
- 项目：`src/content/projects/`，目前包含 Simuro 窗口助手、CET-4 远距共学台和个人网站。
- 随记：用 `pnpm.cmd new-d "随记正文"` 创建，初始不放虚构的动态。
- 头像：`src/config/profileConfig.ts`，当前采用你提供的 FAN 1 背影照片。
- 正式域名尚未确定，`siteConfig.site_url` 暂用本地地址；上线前替换为真实域名。

## 项目与公开文档怎么更新

项目入口是 `/projects/`。每个项目对应一个 Markdown 文件：

| 文件 | 项目 |
| --- | --- |
| `src/content/projects/simuro-window-companion.md` | Simuro 窗口助手 |
| `src/content/projects/cet4-study-platform.md` | CET-4 远距共学台 |
| `src/content/projects/personal-site.md` | 电气札记个人网站 |

直接编辑正文即可补充介绍。想增加一个新项目，复制已有文件、改文件名，再填写开头的 `title`、`description`、`tags` 和 `link`。

- `image` 是封面地址，当前封面放在 `public/assets/images/projects/`。
- `order` 越大越靠前。
- `status` 可用 `planning`（计划中）、`developing`（开发中）、`published`（已发布）、`archived`（已归档）。本轮两项工具的“已发布”表示源码与文档公开，可在正文说明具体版本阶段。
- `link` 可列多个按钮，例如源码、使用说明和部署指南，每个按钮有 `label`、`icon` 与 `value`。
- `published` 是本站项目介绍的发布日期；不代表软件完成日期。
- 正文可补充功能、使用流程、技术选择、真实截图与开发心得。运行软件仍按各自仓库的最新 README，不把项目介绍当作完整安装文档。

这些页面不会自动跟随 GitHub 更新。仓库文档发生变化时，更新这里的摘要与链接，再保存预览。整理依据见 `docs/PUBLIC-PROJECTS.md`。

## 主题示例

原主题文章、项目、随记及对应图片保存在 `docs/theme-examples/`，供参考写法，不再显示为本站内容。Firefly/Fuwari 源码许可证及署名继续保留。
