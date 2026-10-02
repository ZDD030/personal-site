import type { AnnouncementConfig } from "../types/announcementConfig";

export const announcementConfig: AnnouncementConfig = {
	// 公告标题，留空则走i18n默认标题
	title: "电气、求学与生活",

	// 公告内容
	content: "电气工程及其自动化 · 四非保研至华南理工大学（985）。喀什大学生存手册与保研复盘正在整理中。",

	// 是否允许用户关闭公告
	closable: true,

	link: {
		// 启用链接
		enable: true,
		// 链接文本
		text: "阅读喀大手册",
		// 链接 URL
		url: "/handbook/",
		// 内部链接
		external: false,
	},
};
