# GitHub 使用

当前目录 `D:/个人网站` 是独立 Git 仓库，正式分支 `main`。完整主题源码、公开资源与内容均由此仓库管理。

## 已初始化的仓库

[ZDD030/personal-site](https://github.com/ZDD030/personal-site) 已绑定为 origin，main 已首次推送并建立追踪关系。

换电脑时克隆本站：

```powershell
git clone https://github.com/ZDD030/personal-site.git
cd personal-site
pnpm.cmd install --frozen-lockfile
```

`origin` 是自己的项目，`upstream` 是主题作者仓库，不向其推送。

## 后续更新

```powershell
git status
git add .
git commit -m "feat: update personal site"
git push
```

源码、配置、文章与项目 Markdown 都可提交。依赖、构建产物、环境文件、私人素材、数据库及本地备份自动忽略。

GitHub 检查在 main 推送和 PR 上执行 Astro 检查及完整构建，不自动部署。上传代码与网站公开上线是两个步骤。

## 原初始化记录

历史标签 `nextjs-initial` 保留原 Next.js 骨架：

```powershell
git show nextjs-initial:README.md
git log --oneline --decorate
```
