import type { Metadata } from "next";
import Link from "next/link";
import { SiteNav } from "@/components/site-nav";
import { siteConfig } from "@/config/site";
import "./globals.css";

export const metadata: Metadata = {
  title: { default: siteConfig.name, template: `%s · ${siteConfig.name}` },
  description: siteConfig.description,
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="zh-CN">
      <body>
        <a href="#main-content" className="skip-link">跳到正文</a>
        <div className="site-shell">
          <header className="site-header">
            <Link href="/" className="site-brand">
              <span className="brand-mark" aria-hidden="true" />
              {siteConfig.name}
            </Link>
            <SiteNav />
          </header>
          <main id="main-content" tabIndex={-1}>{children}</main>
          <footer className="site-footer">
            <span>{siteConfig.name}</span>
            <span>项目 · 笔记 · 生活</span>
          </footer>
        </div>
      </body>
    </html>
  );
}
