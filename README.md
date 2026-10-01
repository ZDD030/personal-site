# 个人网站

独立个人网站，沿用已确定的 Next.js + TypeScript + Tailwind CSS 技术路线。当前完成项目初始化和公开页面骨架，内容数据库与写作后台待开发。

## 本地运行

需要 Node.js 24 LTS 和 npm。依赖已安装；换机器后执行：

```powershell
npm.cmd ci
npm.cmd run dev
```

打开 http://127.0.0.1:3000 。Windows PowerShell 下使用 `npm.cmd` 可避开 npm.ps1 执行策略问题；其他终端使用 `npm` 即可。开发服务只监听本机。

```powershell
npm.cmd run check     # ESLint 与类型检查
npm.cmd run build     # 生产构建
npm.cmd start         # 构建完成后启动生产服务
```

## 项目入口

- [需求与当前范围](docs/PROJECT.md)
- [技术、目录与部署约定](docs/ARCHITECTURE.md)
- [开发进度](docs/ROADMAP.md)
- [开源主题比较](docs/UI-OPTIONS.md)
- `src/config/site.ts`：站点资料、导航、项目。
- `materials/`：本地原始素材，默认不进入 Git。
- `data/`：本地运行数据，默认不进入 Git。

首页、文章、随记、项目、关于已可访问。健康检查为 `/api/health`，当前仅检查进程响应。`/admin` 尚未实现。页面中的文章与随记为空，不包含模拟发布内容。站名和简介为初始文案，待补充个人资料。

未来文章与随记通过自己的网页后台写入独立 SQLite，支持草稿、预览、发布、撤回及导出；首版完成后发文章无需重新部署。个人站与保研工作台保持独立，未来共用服务器并通过域名分流。

目前只有本地 Git 仓库。GitHub CI 配置已写入，远程仓库绑定后才会运行；未配置自动部署。

## Firefly 开源主题预览

按后续讨论新增独立 Firefly 预览，位于 `theme-previews/firefly/`。它是现成的开源博客主题，页面中的文章、头像与介绍属于上游演示内容，尚未替换成站主资料。

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\preview-firefly.ps1
```

默认预览地址为 http://127.0.0.1:4321 。Firefly 与根目录 Next.js 骨架分别运行；正式选定后再整理为单一项目。Firefly 使用 pnpm，原始 README 与许可证保存在预览目录内。
