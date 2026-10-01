# 开源 UI 与建站方案

本文件保留初始比较记录。2026-10-01 后续已将 Firefly 正式源码迁入根目录并纳入 main；当前入口见 PROJECT.md 与 GITHUB.md，不再按临时预览目录开发。

2026-10-01，用户补充要求：UI 尽量复用开源库，并提供 Linux.do 帖子 `https://linux.do/t/topic/2727303` 中的 Halo、vhAstro-Theme 和 Hugo Inkstone 建议。

帖子正文由用户粘贴提供；直接访问返回 403。已核实 vhAstro-Theme、Halo、Firefly 与 Fuwari 官方仓库的 README、许可证。用户进一步提供 Firefly 演示站及 Firefly、Fuwari 仓库；建议优先 Firefly，当前建立独立本地预览，尚未替换根目录项目。

| 路线 | 可直接复用 | 仍需完成 | 对现有规划的影响 |
| --- | --- | --- | --- |
| Next.js + shadcn/ui | 开源界面组件 | 页面组合、数据库与写作后台 | 保留原技术路线 |
| Astro + Firefly | 完整博客 UI、文章、项目、动态、搜索、公式、明暗模式 | 个人配置；网页发文需接入编辑后台 | 更换框架与内容存储方式；当前推荐 |
| Astro + Fuwari | 精简博客 UI、文章、搜索、公式、明暗模式 | 项目及随记适配；网页发文需接入编辑后台 | 更换框架与内容存储方式 |
| Astro + vhAstro-Theme | 完整博客 UI、分类、搜索、公式、动态页 | 个人配置、项目展示；网页写作需另接后台 | 更换框架与内容存储方式 |
| Halo 社区版 + 开源主题 | 现成内容管理后台与主题系统 | 主题选择、个人配置、项目及随记适配 | 更换运行时、数据库和部署方式 |
| Hugo + Inkstone | 静态博客主题 | 核实具体仓库；网页写作需另接后台 | 更换构建工具与内容存储方式 |

## 已核实的来源

- [Firefly](https://github.com/CuteLeaf/Firefly)：MIT，基于 Fuwari 扩展，已有项目和动态页面。当前查阅版本 `6.16.8`，上游提交 `6d82554bfe1cb3d4b43adb0969dad1d43ac6dee3`。
- [Firefly 演示](https://firefly.cuteleaf.cn/)：已打开并检查页面功能。
- [Fuwari](https://github.com/saicaca/fuwari)：MIT，博客功能较精简，默认通过 Markdown 文件写作。

## 本地预览约定

Firefly 放在 `theme-previews/firefly/`，作为上游主题的独立预览，不改根目录的依赖和代码。此目录默认不提交到个人站 Git；最终选定后再将主题源码整理为正式项目，并保留许可证与作者署名。预览中的作者资料和文章属于主题演示，不能当作站主的个人内容。

本地已安装依赖并验证首页、项目、动态、关于页面，启动命令见根目录 README，预览为 `http://127.0.0.1:4321/`。这是开发预览，尚未验证 Firefly 生产构建、搜索索引、发布和上线。

重新下载预览时执行：

```powershell
git clone --depth 1 https://github.com/CuteLeaf/Firefly.git theme-previews/firefly
git -C theme-previews/firefly fetch --depth 1 origin 6d82554bfe1cb3d4b43adb0969dad1d43ac6dee3
git -C theme-previews/firefly checkout --detach 6d82554bfe1cb3d4b43adb0969dad1d43ac6dee3
cd theme-previews/firefly
pnpm.cmd install --frozen-lockfile --registry=https://registry.npmjs.org
```

两个 Astro 主题默认将 Markdown 文件构建为静态网站。现有“网页写作、SQLite 保存内容、发布后立即更新”的方案不能原样视为主题自带功能；确认采用主题后需重新设计编辑后台与发布步骤。保研站技术栈保持独立。

- [vhAstro-Theme](https://github.com/uxiaohan/vhAstro-Theme)：MIT 许可证，Astro 框架；README 提供 Markdown 文件写作与静态构建流程，未提供站主管理后台。
- [vhAstro-Theme 演示](https://www.vvhan.com)：主题作者网站，界面参考。
- [Halo](https://github.com/halo-dev/halo)：社区版 GPL-3.0，带内容管理后台、主题及插件生态；需要按所选版本重新核实部署要求。
- [shadcn/ui](https://github.com/shadcn-ui/ui)：适用于当前 React / Tailwind 项目的组件源码体系，不能替代内容管理后台。

目前的自定义页面只作为可运行的初始化骨架。确定方案后更新 PROJECT、ARCHITECTURE 和 ROADMAP；不能把 shadcn/ui 称作完整博客主题，也不能把 Astro 主题描述为自带网页发布后台。
