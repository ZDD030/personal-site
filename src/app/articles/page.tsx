import type { Metadata } from "next";
import { PageHeading } from "@/components/page-heading";

export const metadata: Metadata = { title: "文章" };

export default function ArticlesPage() {
  return (
    <>
      <PageHeading label="ARTICLES" title="文章" description="把学习中的思考和实践写下来。" />
      <p className="empty-state page-empty">还没有发布文章。</p>
    </>
  );
}
