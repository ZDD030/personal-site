import { projects } from "@/config/site";

export function ProjectList() {
  return (
    <div className="project-list">
      {projects.map((project) => (
        <article className="project-card" key={project.name}>
          <div className="project-topline">
            <span className="project-mark" aria-hidden="true">↗</span>
            <span className="eyebrow">{project.category}</span>
          </div>
          <h3>{project.name}</h3>
          <p>{project.description}</p>
          <ul className="technologies" aria-label="技术栈">
            {project.technologies.map((technology) => <li key={technology}>{technology}</li>)}
          </ul>
        </article>
      ))}
    </div>
  );
}
