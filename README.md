# 个人网站 · Firefly

基于 [CuteLeaf/Firefly](https://github.com/CuteLeaf/Firefly) 的个人网站，复用开源博客界面，包含文章、随记、项目及关于页面。主题资料和示例文章暂未个性化。

根目录就是正式网站源码，已纳入 Git，使用 `main` 分支。原 Next.js 骨架保存在历史标签 `nextjs-initial`。

## 本地开发

使用 Node.js 24 LTS 和 pnpm 11，在根目录执行：

```powershell
pnpm.cmd install --frozen-lockfile
pnpm.cmd dev --host 127.0.0.1 --port 4321
```

打开 http://127.0.0.1:4321/ 。Codex 环境下也可执行 `powershell -ExecutionPolicy Bypass -File .\scripts\preview-site.ps1`，避免首次自动后台启动超时。

```powershell
pnpm.cmd check
pnpm.cmd type-check
pnpm.cmd build
pnpm.cmd preview --host 127.0.0.1 --port 4321
```

Windows PowerShell 使用 `pnpm.cmd`，其他终端使用 `pnpm`。`dist/` 是构建产物，不提交 Git。GitHub Actions 配置检查及构建，未配置自动部署。

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

```powershell
pnpm.cmd new-post first-post
pnpm.cmd new-d 今天的随记
```

当前通过 Markdown 文件维护内容。登录网页后写文章的后台仍待接入。

## 项目文档

- [项目需求](docs/PROJECT.md)
- [技术与目录](docs/ARCHITECTURE.md)
- [开发进度](docs/ROADMAP.md)
- [上传 GitHub](docs/GITHUB.md)
- [开源来源](docs/UPSTREAM.md)
- [上游主题原始说明](docs/FIREFLY-UPSTREAM.md)

`materials/` 放未公开素材，`data/` 放本地运行数据，默认不进入 Git。保留 Firefly 与 Fuwari 的 MIT 许可证及作者署名。本站与保研工作台独立开发和部署。
