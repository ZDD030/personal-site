# GitHub 使用

当前目录 `D:/个人网站` 是独立 Git 仓库，正式分支 `main`。完整主题源码、公开资源与内容均由此仓库管理。

## 首次上传

在 GitHub 创建自己的空仓库，例如 `personal-site`，首次不用额外初始化 README、许可证或 .gitignore。按个人资料是否准备公开选择仓库可见性。

替换为自己的地址后执行：

```powershell
git remote add origin https://github.com/你的用户名/personal-site.git
git push -u origin main
git push origin nextjs-initial
```

也可以把仓库链接交给 Codex 绑定和上传。当前未提供目标地址，尚未设置 `origin`。`upstream` 是主题作者仓库，不向其推送。

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
