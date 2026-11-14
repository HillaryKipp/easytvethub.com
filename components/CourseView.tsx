import Link from 'next/link';
import {
  ArrowRight,
  BookOpen,
  Calendar,
  Layers,
  ArrowUpRight,
  Sparkles,
} from 'lucide-react';
import { EnrichedCourse } from '@/lib/types';
import { getCourseFAQs, getCourseIntro } from '@/lib/seo';
import { formatDate, toTitleCase } from '@/lib/utils';
import { Breadcrumbs } from './Breadcrumbs';
import { FAQSection } from './FAQSection';
import { buildCourseSchema } from '@/lib/jsonld';

export function CourseView({
  course,
  allCourses = [],
}: {
  course: EnrichedCourse;
  allCourses?: EnrichedCourse[];
}) {
  const courseTitle = toTitleCase(course.name);
  const deptTitle = toTitleCase(course.department.name);
  const introText = getCourseIntro(course);
  const faqs = getCourseFAQs(course);
  const courseSchema = buildCourseSchema(course, introText);

  // Same course name at other qualification levels
  const normalizedName = course.name.trim().toUpperCase();
  const sameCourseOtherLevels = allCourses.filter(
    (c) =>
      c.id !== course.id &&
      c.name.trim().toUpperCase() === normalizedName &&
      c.level !== course.level
  );

  // Other courses at the same level in the same department
  const otherSameLevelInDept = allCourses.filter(
    (c) =>
      c.id !== course.id &&
      c.department_id === course.department_id &&
      c.level === course.level
  );

  const totalResources = course.units.reduce(
    (acc, u) => acc + (u.resources ? u.resources.length : 0),
    0
  );

  return (
    <div className="space-y-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(courseSchema) }}
      />
      <Breadcrumbs
        items={[
          { name: course.programme.name, path: `/${course.programme.slug}/` },
          { name: deptTitle, path: `/${course.programme.slug}/${course.department.slug}/` },
          { name: courseTitle, path: course.path },
        ]}
      />

      {/* Course Header */}
      <header className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs">
        <div className="flex flex-wrap items-center gap-2 mb-3">
          <Link
            href={`/${course.programme.slug}/${course.department.slug}/`}
            className="rounded-full bg-[#f4eff9] px-3 py-1 text-xs font-semibold text-[#662c91] hover:underline"
          >
            {deptTitle}
          </Link>
          {course.level && (
            <Link
              href={`/levels/level-${course.level}/`}
              className="rounded-full bg-[#fbeced] px-3 py-1 text-xs font-semibold text-[#bd1e2c] hover:underline"
            >
              Level {course.level} Qualification
            </Link>
          )}
        </div>

        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight mb-4">
          {courseTitle}
        </h1>

        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed max-w-3xl">
          {introText}
        </p>

        {course.description && course.description !== course.intro && (
          <p className="mt-3 text-xs sm:text-sm text-[#8b8794] leading-relaxed">
            {course.description}
          </p>
        )}
      </header>

      {/* Quick-Facts Table */}
      <section className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs">
        <h2 className="text-lg font-bold text-[#1d1823] mb-4">
          {courseTitle} Quick Overview
        </h2>
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse text-xs sm:text-sm">
            <tbody className="divide-y divide-[#ebe7f0]">
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794] w-1/3">
                  Programme
                </th>
                <td className="py-2.5 pl-4 font-medium text-[#1d1823]">
                  <Link
                    href={`/${course.programme.slug}/`}
                    className="text-[#662c91] hover:underline"
                  >
                    {course.programme.name}
                  </Link>
                </td>
              </tr>
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794]">
                  Department
                </th>
                <td className="py-2.5 pl-4 font-medium text-[#1d1823]">
                  <Link
                    href={`/${course.programme.slug}/${course.department.slug}/`}
                    className="text-[#662c91] hover:underline"
                  >
                    {deptTitle}
                  </Link>
                </td>
              </tr>
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794]">
                  Qualification Level
                </th>
                <td className="py-2.5 pl-4 font-medium text-[#1d1823]">
                  {course.level ? (
                    <Link
                      href={`/levels/level-${course.level}/`}
                      className="text-[#662c91] hover:underline"
                    >
                      KNQF Level {course.level}
                    </Link>
                  ) : (
                    'Standard TVET Qualification'
                  )}
                </td>
              </tr>
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794]">
                  Number of Modules
                </th>
                <td className="py-2.5 pl-4 font-medium text-[#1d1823]">
                  {course.modules.length} {course.modules.length === 1 ? 'Module' : 'Modules'}
                </td>
              </tr>
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794]">
                  Competency Units
                </th>
                <td className="py-2.5 pl-4 font-medium text-[#1d1823]">
                  {course.units.length} {course.units.length === 1 ? 'Unit' : 'Units'} ({totalResources} downloadable files)
                </td>
              </tr>
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794]">
                  Last Updated
                </th>
                <td className="py-2.5 pl-4 text-[#5c5766]">
                  <time dateTime={course.updated_at}>{formatDate(course.updated_at)}</time>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>

      {/* Units in {course} per module */}
      <section>
        <div className="mb-6">
          <h2 className="text-xl sm:text-2xl font-bold text-[#1d1823]">
            Competency Units in {courseTitle}
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] mt-1">
            Select any unit below to view unit details and download free past papers, assessor guides, candidate tools, and cutting lists.
          </p>
        </div>

        {course.modules.length > 0 ? (
          <div className="space-y-6">
            {course.modules.map((mod) => (
              <div
                key={mod.id}
                className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs"
              >
                <div className="flex items-center justify-between gap-2 mb-4 pb-3 border-b border-[#ebe7f0]">
                  <h3 className="text-base font-bold text-[#1d1823]">
                    Module {mod.module_number}
                    {mod.title && mod.title.toLowerCase() !== `module ${mod.module_number}`
                      ? `: ${mod.title}`
                      : ' Units'}
                  </h3>
                  <span className="rounded-full bg-[#f4eff9] text-[#662c91] px-3 py-0.5 text-xs font-semibold">
                    {mod.units.length} {mod.units.length === 1 ? 'Unit' : 'Units'}
                  </span>
                </div>

                {mod.units.length > 0 ? (
                  <ol className="list-decimal list-inside space-y-2">
                    {mod.units.map((u) => (
                      <li
                        key={u.id}
                        className="rounded-xl border border-[#ebe7f0] bg-[#f8f5fd] px-4 py-3 hover:border-[#662c91]/60 transition-all"
                      >
                        <div className="inline-flex flex-wrap items-center justify-between gap-2 w-[calc(100%-1.5rem)] align-middle">
                          <Link
                            href={u.path}
                            className="font-semibold text-xs sm:text-sm text-[#1d1823] hover:text-[#662c91]"
                          >
                            {toTitleCase(u.name)}
                            {u.unit_code ? ` (${u.unit_code})` : ''}
                          </Link>
                          <div className="flex items-center gap-2">
                            {u.resources.length > 0 && (
                              <span className="rounded-full bg-[#fbeced] text-[#bd1e2c] px-2.5 py-0.5 text-[10px] font-bold">
                                {u.resources.length} {u.resources.length === 1 ? 'PDF' : 'PDFs'}
                              </span>
                            )}
                            <Link
                              href={u.path}
                              className="inline-flex items-center gap-1 text-xs font-semibold text-[#662c91] hover:underline"
                            >
                              <span>View Unit</span>
                              <ArrowUpRight className="h-3 w-3" />
                            </Link>
                          </div>
                        </div>
                      </li>
                    ))}
                  </ol>
                ) : (
                  <p className="text-xs text-[#8b8794]">No units listed in Module {mod.module_number} yet.</p>
                )}
              </div>
            ))}
          </div>
        ) : (
          <div className="rounded-3xl border border-[#ebe7f0] bg-white p-6 text-sm text-[#5c5766]">
            Modular competency units for {courseTitle} are currently being indexed.
          </div>
        )}
      </section>

      {/* Internal Linking: Same course at other levels */}
      {sameCourseOtherLevels.length > 0 && (
        <section className="rounded-3xl border border-[#ebe7f0] bg-[#f8f5fd] p-6">
          <div className="flex items-center gap-2 mb-4">
            <Layers className="h-5 w-5 text-[#662c91]" />
            <h2 className="text-base font-bold text-[#1d1823]">
              Same Course at Other Qualification Levels
            </h2>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3">
            {sameCourseOtherLevels.map((other) => (
              <Link
                key={other.id}
                href={other.path}
                className="flex items-center justify-between rounded-xl border border-[#ebe7f0] bg-white p-3.5 text-xs font-semibold text-[#1d1823] hover:border-[#662c91] hover:text-[#662c91] transition-all"
              >
                <span>{toTitleCase(other.name)}</span>
                {other.level && (
                  <span className="rounded-full bg-[#f4eff9] text-[#662c91] px-2.5 py-0.5 text-[10px] font-bold">
                    Level {other.level}
                  </span>
                )}
              </Link>
            ))}
          </div>
        </section>
      )}

      {/* Internal Linking: Other Level X courses in this department */}
      {otherSameLevelInDept.length > 0 && (
        <section className="rounded-3xl border border-[#ebe7f0] bg-white p-6">
          <div className="flex items-center gap-2 mb-4">
            <BookOpen className="h-5 w-5 text-[#662c91]" />
            <h2 className="text-base font-bold text-[#1d1823]">
              Other {course.level ? `Level ${course.level} ` : ''}Courses in {deptTitle}
            </h2>
          </div>
          <ul className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2.5">
            {otherSameLevelInDept.map((other) => (
              <li key={other.id}>
                <Link
                  href={other.path}
                  className="block rounded-xl border border-[#ebe7f0] bg-[#f8f5fd] p-3 text-xs font-medium text-[#1d1823] hover:border-[#662c91] hover:text-[#662c91] transition-all"
                >
                  {toTitleCase(other.name)}
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      <FAQSection faqs={faqs} heading={`Frequently Asked Questions About ${courseTitle}`} />
    </div>
  );
}
