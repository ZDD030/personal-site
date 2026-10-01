import Link from "next/link";

export default function NotFound() {
  return (
    <section className="page-heading">
      <p className="eyebrow">404</p>
      <h1>这一页还不存在。</h1>
      <Link href="/" className="text-link">回到首页 <span aria-hidden="true">→</span></Link>
    </section>
  );
}
