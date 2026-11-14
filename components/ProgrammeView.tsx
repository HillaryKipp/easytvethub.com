import Link from 'next/link';
import { Building2, Layers, BookOpen, ArrowRight } from 'lucide-react';
import { Department, EnrichedCourse, Programme } from '@/lib/types';
import { getProgrammeFAQs, getProgrammeIntro } from '@/lib/seo';
import { toTitleCase } from '@/lib/utils';
import { Breadcrumbs } from './Breadcrumbs';
import { FAQSection } from './FAQSection';
import { buildCollectionPageSchema } from '@/lib/jsonld';

export function ProgrammeView({
  programme,
  departments,
  courses,
}: {
  programme: Programme;
  departments: Department[];
  courses: EnrichedCourse[];
}) {
  const introText = getProgrammeIntro(programme, departments, courses);
  const faqs = getProgrammeFAQs(programme, departments, courses);

  const levels = Array.from(
    new Set(courses.map((c) => c.level).filter((l): l is number => l !== null && l !== undefined))
  ).sort((a, b) => a - b);

  const collectionSchema = buildCollectionPageSchema(
    programme.name,
    introText,
    `/${programme.slug}/`,
    departments.map((d) => ({
      name: toTitleCase(d.name),
      path: `/${programme.slug}/${d.slug}/`,
    }))
  );

  return (
    <div className="space-y-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionSchema) }}
      />
      <Breadcrumbs items={[{ name: programme.name, path: `/${programme.slug}/` }]} />

      {/* Header */}
      <header className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs">
        <div className="inline-flex items-center gap-2 rounded-full bg-[#f4eff9] px-3 py-1 text-xs font-semibold text-[#662c91] mb-3 border border-purple-200">
          TVET Programme Framework
        </div>
        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight mb-4">
          {programme.name}
        </h1>
        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed max-w-3xl">
          {introText}
        </p>
        {programme.description && programme.description !== programme.intro && (
          <p className="mt-3 text-xs sm:text-sm text-[#8b8794] leading-relaxed">
            {programme.description}
          </p>
        )}
      </header>

      {/* Departments Grid */}
      <section>
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl sm:text-2xl font-bold text-[#1d1823]">
            Departments in {programme.name}
          </h2>
          <span className="text-xs text-[#8b8794]">
            {departments.length} {departments.length === 1 ? 'department' : 'departments'}
          </span>
        </div>

        {departments.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
            {departments.map((dept) => {
              const deptCourses = courses.filter((c) => c.department_id === dept.id);
              const deptLevels = Array.from(
                new Set(
                  deptCourses
                    .map((c) => c.level)
                    .filter((l): l is number => l !== null && l !== undefined)
                )
              ).sort((a, b) => a - b);

              return (
                <div
                  key={dept.id}
                  className="rounded-2xl border border-[#ebe7f0] bg-white p-6 shadow-xs hover:border-[#662c91] hover:shadow-md transition-all group flex flex-col justify-between"
                >
                  <div>
                    <div className="flex items-start justify-between gap-3 mb-3">
                      <div className="flex items-center gap-3">
                        <span className="inline-flex h-10 w-10 items-center justify-center rounded-xl bg-[#f4eff9] text-[#662c91] group-hover:bg-[#662c91] group-hover:text-white transition-colors">
                          <Building2 className="h-5 w-5" />
                        </span>
                        <div>
                          <h3 className="text-base font-bold text-[#1d1823]">
                            <Link
                              href={`/${programme.slug}/${dept.slug}/`}
                              className="group-hover:text-[#662c91] transition-colors"
                            >
                              {toTitleCase(dept.name)}
                            </Link>
                          </h3>
                          <span className="text-xs text-[#8b8794]">
                            {deptCourses.length} {deptCourses.length === 1 ? 'Course' : 'Courses'}
                          </span>
                        </div>
                      </div>
                    </div>

                    {dept.description && (
                      <p className="text-xs text-[#5c5766] mb-4 line-clamp-2 leading-relaxed">
                        {dept.description}
                      </p>
                    )}
                  </div>

                  {deptLevels.length > 0 && (
                    <div className="flex flex-wrap items-center gap-1.5 pt-4 border-t border-[#ebe7f0]">
                      <span className="text-[11px] font-medium text-[#8b8794] mr-1">Levels:</span>
                      {deptLevels.map((lvl) => {
                        const count = deptCourses.filter((c) => c.level === lvl).length;
                        return (
                          <Link
                            key={lvl}
                            href={`/${programme.slug}/${dept.slug}/level-${lvl}/`}
                            className="rounded-lg bg-[#f7f5fa] hover:bg-[#662c91] hover:text-white px-2.5 py-1 text-[11px] font-semibold text-[#5c5766] transition-colors"
                          >
                            Level {lvl} ({count})
                          </Link>
                        );
                      })}
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        ) : (
          <div className="rounded-2xl border border-[#ebe7f0] bg-white p-6 text-sm text-[#5c5766]">
            No departments logged yet under {programme.name}.
          </div>
        )}
      </section>

      {/* Level Breakdown across Programme */}
      {levels.length > 0 && (
        <section>
          <h2 className="text-xl sm:text-2xl font-bold text-[#1d1823] mb-6">
            Courses by Qualification Level
          </h2>
          <div className="space-y-6">
            {levels.map((lvl) => {
              const lvlCourses = courses.filter((c) => c.level === lvl);
              return (
                <div
                  key={lvl}
                  className="rounded-2xl border border-[#ebe7f0] bg-white p-6 shadow-xs"
                >
                  <div className="flex flex-wrap items-center justify-between gap-2 mb-4 pb-3 border-b border-[#ebe7f0]">
                    <div className="flex items-center gap-2">
                      <Layers className="h-5 w-5 text-[#662c91]" />
                      <h3 className="text-base font-bold text-[#1d1823]">
                        Level {lvl} Courses ({lvlCourses.length})
                      </h3>
                    </div>
                    <Link
                      href={`/levels/level-${lvl}/`}
                      className="text-xs font-semibold text-[#662c91] hover:underline"
                    >
                      All Level {lvl} Past Papers &rarr;
                    </Link>
                  </div>
                  <ul className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2.5">
                    {lvlCourses.map((course) => (
                      <li key={course.id}>
                        <Link
                          href={course.path}
                          className="flex items-center justify-between rounded-xl border border-[#ebe7f0] bg-[#f8f5fd] p-3 text-xs font-medium text-[#1d1823] hover:border-[#662c91] hover:text-[#662c91] transition-all"
                        >
                          <span className="truncate pr-2">{toTitleCase(course.name)}</span>
                          <span className="shrink-0 text-[11px] text-[#8b8794]">
                            {course.units.length} {course.units.length === 1 ? 'unit' : 'units'}
                          </span>
                        </Link>
                      </li>
                    ))}
                  </ul>
                </div>
              );
            })}
          </div>
        </section>
      )}

      <FAQSection faqs={faqs} heading={`Frequently Asked Questions About ${programme.name}`} />
    </div>
  );
}
