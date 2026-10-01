import type { Metadata } from "next";
import { PageHeading } from "@/components/page-heading";
import { siteConfig } from "@/config/site";

export const metadata: Metadata = { title: "关于" };

export default function AboutPage() {
  return (
    <>
      <PageHeading label="ABOUT" title="关于我" description={siteConfig.about} />
      <div className="about-copy">
        <h2>关于这个网站</h2>
        <p>用来保存项目、学习笔记和日常记录，也让零散的想法有一个可以慢慢整理的地方。</p>
      </div>
    </>
  );
}
