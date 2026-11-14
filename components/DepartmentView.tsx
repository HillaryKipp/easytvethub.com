import Link from 'next/link';
import { Layers, BookOpen, ArrowRight } from 'lucide-react';
import { Department, EnrichedCourse, Programme } from '@/lib/types';
import { getDepartmentFAQs, getDepartmentIntro } from '@/lib/seo';
import { toTitleCase } from '@/lib/utils';
import { Breadcrumbs } from './Breadcrumbs';
import { FAQSection } from './FAQSection';
import { buildCollectionPageSchema } from '@/lib/jsonld';

export function DepartmentView({
  programme,
  department,
  courses,
  filterLevel,
}: {
  programme: Programme;
  department: Department;
  courses: EnrichedCourse[];
  filterLevel?: number;
}) {
  const deptTitle = toTitleCase(department.name);
  const allLevels = Array.from(
    new Set(courses.map((c) => c.level).filter((l): l is number => l !== null && l !== undefined))
  ).sort((a, b) => a - b);

  const displayedLevels = filterLevel ? [filterLevel] : allLevels;
  const displayedCourses = filterLevel
    ? courses.filter((c) => c.level === filterLevel)
    : courses;

  const introText = filterLevel
    ? `Browse all ${displayedCourses.length} accredited Level ${filterLevel} TVET courses in the ${deptTitle} under ${programme.name}. Select any Level ${filterLevel} course below to view its modular competency units and download free PDF past papers, assessor guides, candidate tools, and cutting lists.`
    : getDepartmentIntro(department, programme, courses);

  const faqs = getDepartmentFAQs(department, programme, displayedCourses);

  const pagePath = filterLevel
    ? `/${programme.slug}/${department.slug}/level-${filterLevel}/`
    : `/${programme.slug}/${department.slug}/`;

  const pageTitle = filterLevel
    ? `Level ${filterLevel} Courses in ${deptTitle}`
    : deptTitle;

  const collectionSchema = buildCollectionPageSchema(
    pageTitle,
    introText,
    pagePath,
    displayedCourses.map((c) => ({ name: toTitleCase(c.name), path: c.path }))
  );

  const breadcrumbs = [
    { name: programme.name, path: `/${programme.slug}/` },
    { name: deptTitle, path: `/${programme.slug}/${department.slug}/` },
    ...(filterLevel
      ? [{ name: `Level ${filterLevel}`, path: `/${programme.slug}/${department.slug}/level-${filterLevel}/` }]
      : []),
  ];

  return (
    <div className="space-y-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionSchema) }}
      />
      <Breadcrumbs items={breadcrumbs} />

      <header className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs">
        <div className="flex flex-wrap items-center gap-2 mb-3">
          <Link
            href={`/${programme.slug}/`}
            className="rounded-full bg-[#f4eff9] px-3 py-1 text-xs font-semibold text-[#662c91] hover:underline"
          >
            {programme.name}
          </Link>
          {filterLevel && (
            <Link
              href={`/levels/level-${filterLevel}/`}
              className="rounded-full bg-[#fbeced] px-3 py-1 text-xs font-semibold text-[#bd1e2c] hover:underline"
            >
              KNQF Level {filterLevel}
            </Link>
          )}
        </div>

        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight mb-4">
          {pageTitle}
        </h1>
        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed max-w-3xl">
          {introText}
        </p>

        {/* Level Filter Tabs */}
        {allLevels.length > 0 && (
          <div className="mt-6 pt-6 border-t border-[#ebe7f0] flex flex-wrap items-center gap-2">
            <span className="text-xs font-semibold uppercase tracking-wider text-[#8b8794] mr-1">
              Filter by Level:
            </span>
            <Link
              href={`/${programme.slug}/${department.slug}/`}
              className={`rounded-xl px-3.5 py-1.5 text-xs font-semibold transition-colors ${
                !filterLevel
                  ? 'bg-[#662c91] text-white shadow-xs'
                  : 'bg-[#f7f5fa] text-[#5c5766] hover:bg-[#f4eff9] hover:text-[#662c91]'
              }`}
            >
              All Levels ({courses.length})
            </Link>
            {allLevels.map((lvl) => {
              const count = courses.filter((c) => c.level === lvl).length;
              const active = filterLevel === lvl;
              return (
                <Link
                  key={lvl}
                  href={`/${programme.slug}/${department.slug}/level-${lvl}/`}
                  className={`rounded-xl px-3.5 py-1.5 text-xs font-semibold transition-colors ${
                    active
                      ? 'bg-[#662c91] text-white shadow-xs'
                      : 'bg-[#f7f5fa] text-[#5c5766] hover:bg-[#f4eff9] hover:text-[#662c91]'
                  }`}
                >
                  Level {lvl} ({count})
                </Link>
              );
            })}
          </div>
        )}
      </header>

      {/* Courses Grouped by Level */}
      <div className="space-y-8">
        {displayedLevels.map((lvl) => {
          const levelCourses = courses.filter((c) => c.level === lvl);
          if (levelCourses.length === 0) return null;

          return (
            <section
              key={lvl}
              className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs"
            >
              <div className="flex flex-wrap items-center justify-between gap-3 mb-6 pb-4 border-b border-[#ebe7f0]">
                <div className="flex items-center gap-2.5">
                  <span className="inline-flex h-9 w-9 items-center justify-center rounded-xl bg-[#f4eff9] text-[#662c91] font-bold text-sm">
                    L{lvl}
                  </span>
                  <div>
                    <h2 className="text-lg font-bold text-[#1d1823]">
                      Level {lvl} Courses ({levelCourses.length})
                    </h2>
                    <p className="text-xs text-[#8b8794]">
                      {deptTitle} • {programme.name}
                    </p>
                  </div>
                </div>

                {!filterLevel && (
                  <Link
                    href={`/${programme.slug}/${department.slug}/level-${lvl}/`}
                    className="inline-flex items-center gap-1 text-xs font-semibold text-[#662c91] hover:underline"
                  >
                    <span>Level {lvl} Department Page</span>
                    <ArrowRight className="h-3.5 w-3.5" />
                  </Link>
                )}
              </div>

              <div className="overflow-x-auto">
                <table className="w-full text-left border-collapse">
                  <thead>
                    <tr className="border-b border-[#ebe7f0] text-[11px] font-semibold uppercase tracking-wider text-[#8b8794]">
                      <th className="py-2.5 pr-4">Course Name</th>
                      <th className="py-2.5 px-4 hidden sm:table-cell">Level</th>
                      <th className="py-2.5 px-4">Modules</th>
                      <th className="py-2.5 pl-4 text-right">Units</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-[#ebe7f0] text-xs sm:text-sm">
                    {levelCourses.map((course) => (
                      <tr
                        key={course.id}
                        className="group hover:bg-[#f8f5fd] transition-colors"
                      >
                        <td className="py-3 pr-4 font-semibold text-[#1d1823]">
                          <Link
                            href={course.path}
                            className="inline-flex items-center gap-2 group-hover:text-[#662c91]"
                          >
                            <BookOpen className="h-4 w-4 text-[#662c91] shrink-0" />
                            <span>{toTitleCase(course.name)}</span>
                          </Link>
                        </td>
                        <td className="py-3 px-4 hidden sm:table-cell text-[#5c5766]">
                          Level {course.level}
                        </td>
                        <td className="py-3 px-4 text-[#5c5766]">
                          {course.modules.length}
                        </td>
                        <td className="py-3 pl-4 text-right font-medium text-[#1d1823]">
                          {course.units.length}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </section>
          );
        })}
      </div>

      <FAQSection faqs={faqs} heading={`Frequently Asked Questions — ${pageTitle}`} />
    </div>
  );
}
