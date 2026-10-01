# 初始化验证

验证日期：2026-10-01，本机 Windows，Node.js 24.13.0。

## 根目录 Next.js 骨架

- `npm run check`：ESLint 与 TypeScript 检查通过。
- `npm run build`：生产构建通过。
- 生产服务：首页、文章、随记、项目、关于、健康接口返回 200；未实现的 `/admin` 返回 404。
- 390px 手机宽度下无横向溢出，五个导航入口可见，当前页标记正确。
- Git 忽略规则覆盖环境文件、数据库、私人素材、浏览器输出和主题预览。

本机首次构建遇到 Next.js 遥测配置写入的 EXDEV 错误；设置 `NEXT_TELEMETRY_DISABLED=1` 后通过。环境示例及 CI 已记录该变量。

## Firefly 主题预览

- 保留上游原始页面和 MIT 许可证，提交版本见 UI-OPTIONS.md。
- 使用 pnpm 安装上游 lockfile 依赖；未修改上游源码。
- 首页、项目、动态与关于页面本地返回 200，浏览器确认首页展示 Firefly 主题及署名。
- 已保存首页截图到本地 `artifacts/firefly-preview.png`（不进入 Git）。
- Astro 在 Codex 环境自动后台启动时首次初始化超过 30 秒；预览脚本设置 `ASTRO_DEV_BACKGROUND=1`，由当前进程管理运行，启动成功。

Firefly 当前只验证开发预览，未验证生产构建、搜索索引或发布部署。演示的内容、作者资料、图片与音乐尚未个性化，不作为站主资料上线。

GitHub CI 文件已配置但尚未在远程运行；服务器、域名、网页写作后台及生产数据库尚未配置。
