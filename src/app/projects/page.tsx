import type { Metadata } from "next";
import { PageHeading } from "@/components/page-heading";
import { ProjectList } from "@/components/project-list";

export const metadata: Metadata = { title: "项目" };

export default function ProjectsPage() {
  return (
    <>
      <PageHeading label="PROJECTS" title="项目" description="从一个想法开始，做成可以使用的东西。" />
      <ProjectList />
    </>
  );
}
