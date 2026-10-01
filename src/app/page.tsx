import Link from "next/link";
import { ProjectList } from "@/components/project-list";
import { siteConfig } from "@/config/site";

export default function Home() {
  return (
    <>
      <section className="hero">
        <p className="eyebrow">A PERSONAL SPACE</p>
        <h1>学习、记录，<br />慢慢积累。</h1>
        <p className="description">{siteConfig.introduction}</p>
        <Link href="/about" className="text-link">关于我 <span aria-hidden="true">↗</span></Link>
      </section>
      <section className="home-section" aria-labelledby="projects-heading">
        <div className="section-heading">
          <h2 id="projects-heading">做过的项目</h2>
          <Link href="/projects" className="text-link">全部项目 <span aria-hidden="true">→</span></Link>
        </div>
        <ProjectList />
      </section>
      <div className="writing-grid">
        <section aria-labelledby="articles-heading">
          <div className="section-heading">
            <h2 id="articles-heading">最近的文章</h2>
            <Link href="/articles" className="text-link">全部文章 <span aria-hidden="true">→</span></Link>
          </div>
          <p className="empty-state">还没有发布文章。</p>
        </section>
        <section aria-labelledby="notes-heading">
          <div className="section-heading">
            <h2 id="notes-heading">生活里的随记</h2>
            <Link href="/notes" className="text-link">全部随记 <span aria-hidden="true">→</span></Link>
          </div>
          <p className="empty-state">还没有发布随记。</p>
        </section>
      </div>
    </>
  );
}
