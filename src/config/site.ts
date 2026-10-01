export const siteConfig = {
  name: "个人网站",
  description: "个人项目、学习笔记与日常记录。",
  introduction: "在这里整理做过的项目、学到的东西，以及生活里的片段。",
  about: "这里将逐步整理我的学习经历、研究兴趣和正在做的事情。",
  navigation: [
    { href: "/", label: "首页" },
    { href: "/articles", label: "文章" },
    { href: "/notes", label: "随记" },
    { href: "/projects", label: "项目" },
    { href: "/about", label: "关于" },
  ],
};

// 仅放已确认的项目。上线地址、源码链接确认后再加入。
export const projects = [
  {
    name: "保研工作台",
    category: "Web 应用",
    description: "给下一届学弟学妹使用的保研工具，集中查看招生通知、记录申请进度和安排日程。",
    technologies: ["React", "Express", "SQLite"],
  },
];
