import type { MarkdownInstance } from "astro";

export type HandbookFrontmatter = {
	title: string;
	description: string;
	order: number;
	status: "outline" | "draft" | "complete";
};

export type HandbookChapter = MarkdownInstance<HandbookFrontmatter> & {
	slug: string;
};

// 直接导入各章，沿用 Astro Markdown 插件和热更新，不依赖文章集合缓存。
const chapterModules = import.meta.glob<MarkdownInstance<HandbookFrontmatter>>(
	"../content/handbook/*.md",
	{ eager: true },
);

export function getHandbookChapters(): HandbookChapter[] {
	return Object.entries(chapterModules)
		.map(([file, chapter]) => ({
			...chapter,
			slug: file.split("/").at(-1)!.replace(/^\d+-/, "").replace(/\.md$/, ""),
		}))
		.sort((a, b) => a.frontmatter.order - b.frontmatter.order);
}

export const handbookStatusLabels: Record<HandbookFrontmatter["status"], string> = {
	outline: "写作提纲",
	draft: "初稿",
	complete: "已整理",
};
