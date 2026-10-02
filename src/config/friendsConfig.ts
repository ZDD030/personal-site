import type { FriendLink, FriendsPageConfig } from "../types/friendsConfig";

// 可以在src/content/spec/friends.md中编写友链页面下方的自定义内容

// 友链页面配置
export const friendsPageConfig: FriendsPageConfig = {
	// 页面标题，如果留空则使用 i18n 中的翻译
	title: "友链与推荐阅读",

	// 页面描述文本，如果留空则使用 i18n 中的翻译
	description: "他山之石，可以攻玉。",

	// 是否显示底部自定义内容（friends.mdx 中的内容）
	showCustomContent: true,

	// 是否显示评论区，需要先在commentConfig.ts启用评论系统
	showComment: true,

	// 是否开启随机排序配置，如果开启，就会忽略权重，构建时进行一次随机排序
	randomizeSort: false,
};

// 友链配置
export const friendsConfig: FriendLink[] = [
	{
		title: "SurviveXJTU · 西交生存指南",
		imgurl: "/assets/images/links/survive-xjtu.svg",
		desc: "面向西交学子的生存指南，包含新生指引、保研须知与学习路线。",
		siteurl: "https://survivexjtu.github.io/",
		tags: ["大学生活", "生存指南"],
		weight: 19,
		enabled: true,
	},
	{
		title: "Linux.do · 推荐阅读",
		imgurl: "/assets/images/links/linux-do.svg",
		desc: "收藏的 Linux.do 社区帖子，点击阅读原文。",
		siteurl: "https://linux.do/t/topic/1710548",
		tags: ["社区", "推荐阅读"],
		weight: 18,
		enabled: true,
	},
	{
		title: "上海交通大学生存手册",
		imgurl: "/assets/images/links/survive-sjtu.svg",
		desc: "大学生活与求学经验的分享，作为《喀什大学生存手册》的参考。",
		siteurl: "https://survivesjtu.gitbook.io/survivesjtumanual",
		tags: ["大学生活", "生存手册"],
		weight: 20,
		enabled: true,
	},
	{
		title: "夏夜流萤",
		imgurl:
			"https://weavatar.com/avatar/d252655d40d6874417a720bad0a6c5f77f8f6a1fd2f882f8f338402dc37e4190?s=640",
		desc: "飞萤之火自无梦的长夜亮起，绽放在终竟的明天。",
		siteurl: "https://blog.cuteleaf.cn",
		tags: ["Blog"],
		weight: 10, // 权重，数字越大排序越靠前
		enabled: true, // 是否启用
	},
	{
		title: "Firefly Docs",
		imgurl: "https://docs-firefly.cuteleaf.cn/logo.png",
		desc: "Firefly主题模板文档",
		siteurl: "https://docs-firefly.cuteleaf.cn",
		tags: ["Docs"],
		weight: 9,
		enabled: true,
	},
	{
		title: "Astro",
		imgurl: "https://avatars.githubusercontent.com/u/44914786?v=4&s=640",
		desc: "The web framework for content-driven websites. ⭐️ Star to support our work!",
		siteurl: "https://github.com/withastro/astro",
		tags: ["Framework"],
		weight: 8,
		enabled: true,
	},
];

// 获取启用的友链并进行排序
export const getEnabledFriends = (): FriendLink[] => {
	const friends = friendsConfig.filter((friend) => friend.enabled);

	if (friendsPageConfig.randomizeSort) {
		return friends.sort(() => Math.random() - 0.5);
	}

	return friends.sort((a, b) => b.weight - a.weight);
};
