# Git 整理验证

2026-10-01，本机 Windows / Node.js 24.13.0 / pnpm 11.19.0。

- 根目录 Firefly 依赖按上游 lockfile 安装成功。
- `pnpm check`：259 个文件，0 错误、0 警告、0 提示。
- `pnpm type-check`：通过；命令先同步 Astro 生成类型，再执行 TypeScript，支持新克隆项目。
- `pnpm build`：完整生产构建通过，生成 40 个页面及 Pagefind 索引。
- 已从根目录启动生产预览，首页、项目、随记、关于与搜索脚本返回 200。
- 源码与公开资源已进入主仓库，无子模块；依赖、生成文件、旧预览、环境文件和本机归档被忽略。
- 保留 Firefly/Fuwari MIT 版权声明及上游提交记录；最大源码资源约 7.5MB，低于 GitHub 单文件限制。

上游主题自带部分空白格式问题，未进行全库格式化；本轮修改的文档与仓库配置通过 diff 空白检查。生产构建提示个别脚本包较大，未在仓库整理阶段调整主题功能。

后续已绑定并推送至 ZDD030/personal-site，GitHub Actions 将随 main 推送运行，结果见仓库 Actions 页面；未部署网站。原 Next.js 骨架及验证记录保存在历史标签和 docs/history/nextjs-initial/。
