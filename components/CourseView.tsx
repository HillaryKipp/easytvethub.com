import Link from 'next/link';
import { Calendar } from 'lucide-react';
import { EnrichedArticle, EnrichedCourse } from '@/lib/types';
import {
  getContextualArticlesForCourse,
  getCourseIntro,
} from '@/lib/seo';
import { formatDate, toTitleCase } from '@/lib/utils';
import { Breadcrumbs } from './Breadcrumbs';
import { buildCourseSchema } from '@/lib/jsonld';

export function CourseView({
  course,
  allCourses = [],
  articles = [],
}: {
  course: EnrichedCourse;
  allCourses?: EnrichedCourse[];
  articles?: EnrichedArticle[];
}) {
  const isKnec = course.programme.slug.includes('knec');
  const getKnecTierName = (lvl: number | null | undefined) => {
    if (lvl === 6) return 'Diploma';
    if (lvl === 5) return 'Certificate';
    if (lvl === 4) return 'Artisan';
    return lvl ? `Level ${lvl}` : 'TVET';
  };

  const rawCourseTitle = toTitleCase(course.name);
  const courseHeadingTitle =
    !isKnec && course.level && !/\blevel\s*\d+\b/i.test(rawCourseTitle)
      ? `${rawCourseTitle} Level ${course.level}`
      : rawCourseTitle;
  const courseTitle = rawCourseTitle;
  const deptTitle = toTitleCase(course.department.name);
  const introText = getCourseIntro(course);
  const courseSchema = buildCourseSchema(course, introText);
  const contextualArticles = getContextualArticlesForCourse(course, articles);

  const latestArticleDate =
    contextualArticles.freshEditorialFeed[0]?.updated_at ||
    contextualArticles.freshEditorialFeed[0]?.published_at;
  const effectiveUpdatedAt =
    latestArticleDate &&
    new Date(latestArticleDate).getTime() > new Date(course.updated_at).getTime()
      ? latestArticleDate
      : course.updated_at;

  const normalizedName = course.name
    .replace(/\bLEVEL\s*\d+\b/gi, '')
    .replace(/\bDIPLOMA\s+IN\b/gi, '')
    .replace(/\bCRAFT\s+CERTIFICATE\s+IN\b/gi, '')
    .replace(/\bARTISAN\s+CERTIFICATE\s+IN\b/gi, '')
    .trim()
    .toUpperCase();

  const sameCourseOtherLevels = allCourses.filter((c) => {
    if (c.id === course.id || c.level === course.level) return false;
    const otherClean = c.name
      .replace(/\bLEVEL\s*\d+\b/gi, '')
      .replace(/\bDIPLOMA\s+IN\b/gi, '')
      .replace(/\bCRAFT\s+CERTIFICATE\s+IN\b/gi, '')
      .replace(/\bARTISAN\s+CERTIFICATE\s+IN\b/gi, '')
      .trim()
      .toUpperCase();
    return otherClean === normalizedName && otherClean.length > 2;
  });

  const otherSameLevelInDept = allCourses.filter(
    (c) =>
      c.id !== course.id &&
      c.department_id === course.department_id &&
      c.level === course.level
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

      {/* 1. Compact Course Header (Title only, immediate units below for retention) */}
      <header className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs">
        <div className="flex flex-wrap items-center justify-between gap-2 mb-2.5">
          <div className="flex flex-wrap items-center gap-2">
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
                {isKnec ? `KNEC ${getKnecTierName(course.level)}` : `Level ${course.level} Qualification`}
              </Link>
            )}
            <span className="rounded-full bg-[#f7f5fa] px-3 py-1 text-xs font-semibold text-[#5c5766]">
              {course.modules.length} {course.modules.length === 1 ? 'Module' : 'Modules'} • {course.units.length} Units
            </span>
          </div>

          <div className="inline-flex items-center gap-1.5 text-xs text-[#8b8794]">
            <Calendar className="h-3.5 w-3.5" />
            <span>
              Updated: <time dateTime={effectiveUpdatedAt}>{formatDate(effectiveUpdatedAt)}</time>
            </span>
          </div>
        </div>

        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight">
          {courseHeadingTitle}
        </h1>
      </header>

      {/* 2. FIRST PRIORITY: Units in {course} per module (Immediate Card List) */}
      <section id="competency-units">
        <h2 className="text-lg sm:text-xl font-bold text-[#1d1823] mb-4">
          {courseHeadingTitle} Units
        </h2>

        {course.modules.length > 0 ? (
          <div className="space-y-5">
            {course.modules.map((mod) => (
              <div
                key={mod.id}
                className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs"
              >
                <div className="flex items-center justify-between gap-2 mb-4 pb-3 border-b border-[#ebe7f0]">
                  <h3
                    id={`module-${mod.module_number}`}
                    className="text-base font-bold text-[#1d1823]"
                  >
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
                                {u.resources.length}
                              </span>
                            )}
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

      {/* 3. Related Qualifications & Editorial Revision Guides */}
      {(contextualArticles.freshEditorialFeed.length > 0 ||
        sameCourseOtherLevels.length > 0 ||
        otherSameLevelInDept.length > 0) && (
        <article className="bg-white rounded-3xl border border-[#ebe7f0] shadow-sm p-6 sm:p-10 lg:p-12">
          <div className="text-[#1d1823] text-base leading-relaxed space-y-6">
            <section id="related-courses-and-guides">
              <h2 className="mt-2 mb-4 text-xl sm:text-2xl font-bold tracking-tight text-[#1d1823] scroll-mt-28">
                Related Qualifications &amp; Latest {deptTitle} Revision Guides
              </h2>

              {contextualArticles.freshEditorialFeed.length > 0 && (
                <div className="mb-8">
                  <h3 className="mt-5 mb-3 text-lg font-bold text-[#1d1823]">
                    Latest Revision Guides &amp; Circulars for {deptTitle}
                  </h3>
                  <p className="my-3 text-[15px] sm:text-base leading-relaxed text-[#5c5766]">
                    Our editorial team regularly updates revision roadmaps, exam verification guides, and curriculum analyses for trainees in the {deptTitle}:
                  </p>
                  <div className="space-y-4 mt-4">
                    {contextualArticles.freshEditorialFeed.map((art) => (
                      <div key={art.id} className="pl-3 border-l-2 border-[#ebe7f0]">
                        <h4 className="text-base font-bold text-[#1d1823]">
                          <Link
                            href={art.path}
                            className="text-[#662c91] underline hover:text-[#4b1f6f]"
                          >
                            {art.title}
                          </Link>
                        </h4>
                        <p className="mt-1 text-sm sm:text-[15px] text-[#5c5766] leading-relaxed">
                          {art.excerpt}{' '}
                          <span className="text-xs text-[#8b8794]">
                            ({art.reading_time_minutes} min read • Updated{' '}
                            {formatDate(art.updated_at || art.published_at || '')})
                          </span>
                        </p>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {sameCourseOtherLevels.length > 0 && (
                <div className="mb-8">
                  <h3 className="mt-6 mb-3 text-lg font-bold text-[#1d1823]">
                    Same Course at Other Qualification Levels
                  </h3>
                  <p className="my-3 text-[15px] sm:text-base leading-relaxed text-[#5c5766]">
                    Trainees interested in vertical progression or alternative entry tiers for <strong className="font-semibold text-[#1d1823]">{courseTitle}</strong> can explore the corresponding qualifications across other KNQF levels:
                  </p>
                  <ul className="my-3 space-y-2 pl-2">
                    {sameCourseOtherLevels.map((other) => {
                      const otherIsKnec = other.programme.slug.includes('knec');
                      return (
                        <li
                          key={other.id}
                          className="flex items-start gap-2.5 text-[15px] sm:text-base text-[#5c5766] leading-relaxed"
                        >
                          <span className="text-[#662c91] font-bold mt-0.5">•</span>
                          <div>
                            <Link
                              href={other.path}
                              className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                            >
                              {toTitleCase(other.name)}
                            </Link>{' '}
                            -{' '}
                            {other.level
                              ? otherIsKnec
                                ? `KNEC ${getKnecTierName(other.level)}`
                                : `KNQF Level ${other.level}`
                              : 'TVET Qualification'}{' '}
                            ({other.modules.length} {other.modules.length === 1 ? 'module' : 'modules'}, {other.units.length} units)
                          </div>
                        </li>
                      );
                    })}
                  </ul>
                </div>
              )}

              {otherSameLevelInDept.length > 0 && (
                <div>
                  <h3 className="mt-6 mb-3 text-lg font-bold text-[#1d1823]">
                    Other{' '}
                    {isKnec
                      ? `KNEC ${getKnecTierName(course.level)} `
                      : course.level
                      ? `Level ${course.level} `
                      : ''}
                    Courses in {deptTitle}
                  </h3>
                  <p className="my-3 text-[15px] sm:text-base leading-relaxed text-[#5c5766]">
                    Explore related accredited courses at the same qualification level within the{' '}
                    <Link
                      href={`/${course.programme.slug}/${course.department.slug}/`}
                      className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                    >
                      {deptTitle}
                    </Link>
                    :
                  </p>
                  <ul className="my-3 space-y-2 pl-2">
                    {otherSameLevelInDept.map((other) => (
                      <li
                        key={other.id}
                        className="flex items-start gap-2.5 text-[15px] sm:text-base text-[#5c5766] leading-relaxed"
                      >
                        <span className="text-[#662c91] font-bold mt-0.5">•</span>
                        <div>
                          <Link
                            href={other.path}
                            className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                          >
                            {toTitleCase(other.name)}
                          </Link>{' '}
                          - {other.modules.length} {other.modules.length === 1 ? 'module' : 'modules'}, {other.units.length} competency units
                        </div>
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </section>
          </div>
        </article>
      )}
    </div>
  );
}
