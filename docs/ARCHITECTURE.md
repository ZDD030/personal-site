# 技术与目录

正式网站采用 Firefly 6.16.8，基于 Astro 7、Svelte、TypeScript 和 Tailwind CSS，运行环境 Node.js 24 LTS，使用 pnpm 与 `pnpm-lock.yaml`。

文章、随记、项目保存为 Markdown，构建为静态页面。Pagefind 生成搜索索引；主题提供公式、代码块、分类、标签及 RSS，个性化时逐项验收。

## 目录

```text
src/config/       站点配置与功能开关
src/content/      文章、随记、项目和固定页
src/pages/        Astro 路由
src/components/   主题组件
src/layouts/      页面布局
src/styles/       样式
public/           公开资源
scripts/          构建、内容创建和预览脚本
docs/             项目文档与历史规划
materials/        私人素材，Git 忽略
data/             本地运行数据，Git 忽略
dist/             构建输出，Git 忽略
```

主题代码直接由本站 Git 管理，无子模块或嵌套仓库。原预览目录保留在本机并忽略，后续开发在根目录进行。

## Git 与发布

`main` 是正式分支，`upstream` 读取主题作者更新，`origin` 指向用户自己的仓库。GitHub CI 使用 Node.js 24 和 package.json 指定的 pnpm，进行 Astro 检查及完整构建，不自动部署。

上线可将 `dist/` 放在 Linux 服务器，由 Caddy 提供静态页面和 HTTPS；保研站继续独立运行。域名、备案、服务器和部署尚未配置。

## 网页写作

当前通过 Markdown 与 Git 更新内容。网页写作后台需另外接入，优先评估兼容主题内容文件的开源编辑工具，再确定登录、构建触发、草稿预览、导出及备份。
