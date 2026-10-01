import type { Metadata } from "next";
import { PageHeading } from "@/components/page-heading";

export const metadata: Metadata = { title: "随记" };

export default function NotesPage() {
  return (
    <>
      <PageHeading label="NOTES" title="随记" description="一些短分享，一些值得留下的片段。" />
      <p className="empty-state page-empty">还没有发布随记。</p>
    </>
  );
}
