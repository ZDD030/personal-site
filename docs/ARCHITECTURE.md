# 技术与目录约定

本文记录原 Next.js 路线及当前根目录骨架。用户后续要求复用完整开源主题，正在 `theme-previews/firefly/` 独立预览 Firefly；主题选择与网页发文方式详见 UI-OPTIONS.md，尚未迁移正式技术栈。

## 技术选型

| 部分 | 选型 | 当前状态 |
| --- | --- | --- |
| 运行时 | Node.js 24 LTS、npm | 已配置版本约束 |
| 网站 | Next.js 稳定版、App Router、TypeScript、React | 已初始化，版本见 lockfile |
| 样式 | Tailwind CSS 4、CSS 变量、系统字体 | 已初始化 |
| 组件 | 按需使用 shadcn/ui、Lucide | 暂未安装 |
| 数据库 | Node.js 内置 `node:sqlite` | 后续开发 |
| 正文 | react-markdown、remark-gfm、remark-math、rehype-katex | 后续开发 |
| 验证 | TypeScript、ESLint、生产构建 | 已配置 |
| 业务测试 | Vitest、Playwright | 随数据库、权限和发布流程加入 |

数据库代码仅运行在 Node.js 服务端。使用参数化 SQL 和版本化迁移。单个应用进程操作个人站数据库，正文、草稿和发布状态以数据库为准。

登录采用单站主管理账号、scrypt 密码哈希、服务端会话、HttpOnly/Secure Cookie、来源及 CSRF 校验和登录限流。草稿、预览及导出需要授权；公开查询仅返回已发布内容。发布、修改、撤回后使对应页面缓存失效。

## 目录

```text
src/app/                 App Router 页面及服务端接口
src/components/          共享界面组件
src/config/site.ts       站名、介绍、导航及项目配置
src/lib/                 后续服务端数据库、内容和权限模块
public/                  可公开访问的静态资源
materials/               本地原始资料，默认不进入 Git
data/                    本地数据库与运行文件，默认不进入 Git
docs/                    需求、架构、进度与部署约定
.github/workflows/       Linux 环境检查
```

公开文件才放入 `public/`。数据库、草稿、个人原始资料、备份、密钥均放在公开目录以外。

## 部署目标

沿用原对话的国内大厂 Linux 服务器方案：Ubuntu Server 24.04 LTS，x86_64，采购目标 4 核 / 4GB / 至少 40GB SSD，带宽先按 3Mbps 规划，实际容量上线测试确认。供应商、价格、域名及备案状态尚待确认。

Caddy 管理域名分流和 HTTPS，systemd 管理服务。个人站监听 `127.0.0.1:3000`，保研站沿用 `127.0.0.1:5174`。两站独立部署，个人站采用 Next.js standalone 输出。

生产目录规划：

```text
/opt/personal/releases/    Linux 发行包
/opt/personal/current      当前版本链接
/var/lib/personal/         数据库、后续上传及备份
/var/cache/personal/       可重建缓存
```

在 Linux CI 构建发行包，需包含 standalone 服务、`.next/static` 与 `public`；不能直接上传 Windows 的 node_modules。当前 CI 只做检查，不执行部署。

上线阶段实现版本切换、升级前一致性备份、数据库迁移、健康检查、成对回退；主机外备份采用 SQLite 一致性备份与 restic/COS，保留最近 7 天和最近 4 周，并演练恢复。
