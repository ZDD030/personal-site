<!-- BEGIN:nextjs-agent-rules -->

# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` (resolved from this file's directory; in monorepos the `next` package may not be visible from the repo root) before writing any code. Heed deprecation notices.

This block is written and re-added by `next dev` — verify at `node_modules/next/dist/server/lib/generate-agent-files.js`. Removing it from a diff only re-creates the uncommitted change; committing it with your work keeps the tree clean.

<!-- END:nextjs-agent-rules -->

## 项目约定

- 开始工作先阅读 `docs/PROJECT.md`、`docs/ARCHITECTURE.md` 与 `docs/ROADMAP.md`。
- 本项目是个人站，保研工作台保持独立；不导入其数据库或学生资料。
- 保持 Node.js 24、Next.js App Router、TypeScript、Tailwind 和独立 SQLite 的选型。
- 站点配置统一维护于 `src/config/site.ts`，不编造个人身份、联系方式或发布内容。
- 内容数据库和写作后台尚未实现；每次交付更新进度，区分规划与已验证功能。
- 不把数据库、密钥、备份、未公开素材放入 `public/` 或提交 Git。
- 页面设计减少说明和标签堆叠，重视留白、阅读体验、手机布局和键盘操作。
- 完成更改后运行适当检查，当前基础命令为 `npm run check` 与 `npm run build`。
- 用户提到 MATLAB / Simulink 时优先使用 MathWorks MCP 与注册技能；连接失败先确认 Desktop READY 或运行 satk_initialize。
