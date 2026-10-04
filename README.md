# 个人网站 · Firefly

Thach Soul 的电气札记，基于 [CuteLeaf/Firefly](https://github.com/CuteLeaf/Firefly)，复用开源博客界面。记录电气工程及其自动化、四非保研至华南理工大学（985）的经历，以及求学与生活思考。首批文章和手册已搭好框架，正文待逐步补充。

根目录就是正式网站源码，已纳入 Git，使用 `main` 分支。原 Next.js 骨架保存在历史标签 `nextjs-initial`。

## 本地开发

使用 Node.js 24 LTS 和 pnpm 11，在根目录执行：

```powershell
pnpm.cmd install --frozen-lockfile
powershell -ExecutionPolicy Bypass -File .\scripts\preview-site.ps1
```

脚本在后台启动 `http://127.0.0.1:4322/`，检查页面就绪后自动用 Microsoft Edge 打开。重复执行会复用已有服务，不会再启动第二个实例；关闭启动终端后服务继续运行。只启动服务、不打开 Edge 时加 `-NoOpen`；打开指定页面时加 `-Page /handbook/kashgar-and-me/`。

保存文件后 Edge 中的页面会自动更新。也可直接运行 `pnpm.cmd dev`，默认地址同样是 `http://127.0.0.1:4322/`，首次启动与首次打开页面需要编译，请等终端显示 `ready` 和 `Local` 地址后再访问。端口被占用时明确报错，避免自动换端口后书签失效。不要用 `--ignore-lock` 同时启动多个开发服务，它们会共用 Vite 缓存。`pnpm preview` 仅查看已构建页面，不用于边改边预览。主题字体从本地 npm 依赖加载，避免启动时等待远程字体服务。

Windows 若提示找不到 `pnpm.cmd`，先在终端执行 `npm.cmd install --global pnpm@11.22.0 --registry=https://registry.npmjs.org`，再新建终端。若仍找不到，检查 `npm.cmd config get prefix` 输出的目录是否已加入用户 PATH。

为减轻本地预览开销，默认关闭背景视频、水波动画和可见菜单批量预加载；相关外观开关在 `src/config/backgroundWallpaper.ts`。关于页继续编辑 `src/content/spec/about.md`，保存即可更新。运行下方检查或构建前先停止开发服务，完成后再启动，避免多个 Astro 进程同时更新生成目录。

```powershell
pnpm.cmd check
pnpm.cmd type-check
pnpm.cmd build
powershell -ExecutionPolicy Bypass -File .\scripts\preview-site.ps1
```

Windows PowerShell 使用 `pnpm.cmd`，其他终端使用 `pnpm`。`dist/` 是构建产物，不提交 Git。GitHub Actions 配置检查及构建，未配置自动部署。

停止后台开发服务用 `pnpm.cmd dev stop`；查看状态和日志用 `pnpm.cmd dev status`、`pnpm.cmd dev logs`。

## 内容与配置

| 内容 | 位置 |
| --- | --- |
| 站名、语言、页面开关 | `src/config/siteConfig.ts` |
| 头像、简介、联系链接 | `src/config/profileConfig.ts` |
| 导航 | `src/config/navBarConfig.ts` |
| 壁纸 | `src/config/backgroundWallpaper.ts` |
| 文章 | `src/content/posts/` |
| 随记 | `src/content/dynamic/` |
| 项目 | `src/content/projects/` |
| 关于 | `src/content/spec/about.md` |
| 喀大手册各章 | `src/content/handbook/` |

```powershell
pnpm.cmd new-post first-post
pnpm.cmd new-d 今天的随记
```

当前通过 Markdown 文件维护内容。登录网页后写文章的后台仍待接入。

## 项目文档

- [项目需求](docs/PROJECT.md)
- [技术与目录](docs/ARCHITECTURE.md)
- [开发进度](docs/ROADMAP.md)
- [下一轮具体搭建](docs/BUILD-NEXT.md)
- [逐章写作与编辑指南](docs/CONTENT-WRITING.md)
- [上传 GitHub](docs/GITHUB.md)
- [开源来源](docs/UPSTREAM.md)
- [上游主题原始说明](docs/FIREFLY-UPSTREAM.md)

`materials/` 放未公开素材，`data/` 放本地运行数据，默认不进入 Git。保留 Firefly 与 Fuwari 的 MIT 许可证及作者署名。本站与保研工作台独立开发和部署。
