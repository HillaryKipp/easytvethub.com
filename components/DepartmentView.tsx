import Link from 'next/link';
import { ArrowRight } from 'lucide-react';
import { Department, EnrichedArticle, EnrichedCourse, Programme } from '@/lib/types';
import {
  getContextualArticlesForCourse,
  getDepartmentDomainProfile,
  getDepartmentFAQs,
  getDepartmentIntro,
  getLevelAcademicProfile,
} from '@/lib/seo';
import { toTitleCase } from '@/lib/utils';
import { Breadcrumbs } from './Breadcrumbs';
import { FAQSection } from './FAQSection';
import { buildCollectionPageSchema } from '@/lib/jsonld';

export function DepartmentView({
  programme,
  department,
  courses,
  filterLevel,
  articles = [],
}: {
  programme: Programme;
  department: Department;
  courses: EnrichedCourse[];
  filterLevel?: number;
  articles?: EnrichedArticle[];
}) {
  const isKnec = programme.slug.includes('knec');
  const getKnecTierName = (lvl: number | null | undefined) => {
    if (lvl === 6) return 'Diploma';
    if (lvl === 5) return 'Certificate';
    if (lvl === 4) return 'Artisan';
    return lvl ? `Level ${lvl}` : 'TVET';
  };

  const deptTitle = toTitleCase(department.name);
  const deptProfile = getDepartmentDomainProfile(department.name);
  const levelProfile = filterLevel ? getLevelAcademicProfile(filterLevel) : null;

  const allLevels = Array.from(
    new Set(courses.map((c) => c.level).filter((l): l is number => l !== null && l !== undefined))
  ).sort((a, b) => a - b);

  const displayedLevels = filterLevel ? [filterLevel] : allLevels;
  const displayedCourses = filterLevel
    ? courses.filter((c) => c.level === filterLevel)
    : courses;

  const filterLabel = filterLevel
    ? isKnec
      ? `KNEC ${getKnecTierName(filterLevel)}`
      : `Level ${filterLevel}`
    : '';

  const introText = filterLevel
    ? `Browse all ${displayedCourses.length} accredited ${filterLabel} (${levelProfile?.qualificationTitle}) TVET courses in the ${deptTitle} under ${programme.name}. ${deptProfile.overviewParagraph} Select any ${
        isKnec ? getKnecTierName(filterLevel) : `Level ${filterLevel}`
      } course below to view its modular units, entry requirements, and download free PDF past papers, assessor guides, candidate tools, and cutting lists.`
    : getDepartmentIntro(department, programme, courses);

  const faqs = getDepartmentFAQs(department, programme, displayedCourses);

  const sampleCourse = displayedCourses[0] || courses[0];
  const contextualArticles = sampleCourse
    ? getContextualArticlesForCourse(sampleCourse, articles)
    : null;

  const pagePath = filterLevel
    ? `/${programme.slug}/${department.slug}/level-${filterLevel}/`
    : `/${programme.slug}/${department.slug}/`;

  const pageTitle = filterLevel
    ? isKnec
      ? `KNEC ${getKnecTierName(filterLevel)} Courses in ${deptTitle}`
      : `Level ${filterLevel} Courses in ${deptTitle}`
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
      ? [
          {
            name: isKnec ? `${getKnecTierName(filterLevel)} Courses` : `Level ${filterLevel}`,
            path: `/${programme.slug}/${department.slug}/level-${filterLevel}/`,
          },
        ]
      : []),
  ];

  return (
    <div className="py-2 sm:py-6">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionSchema) }}
      />

      {/* Blog-Style Unified Editorial Article Container */}
      <article className="bg-white rounded-3xl border border-[#ebe7f0] shadow-sm p-6 sm:p-10 lg:p-12">
        <div className="mb-6">
          <Breadcrumbs items={breadcrumbs} />
        </div>

        {/* H1 Page Heading & Level Filter Bar */}
        <header className="pb-6 mb-6 border-b border-[#ebe7f0]">
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
                {isKnec ? `KNEC ${getKnecTierName(filterLevel)}` : `KNQF Level ${filterLevel}`}
              </Link>
            )}
          </div>

          <h1 className="text-2xl sm:text-3xl lg:text-4xl font-extrabold text-[#1d1823] tracking-tight leading-[1.2] mb-4">
            {pageTitle}
          </h1>
          <p className="text-[15px] sm:text-base text-[#5c5766] leading-relaxed">
            {introText}
          </p>

          {/* Level Filter Tabs */}
          {allLevels.length > 0 && (
            <div className="mt-6 pt-5 border-t border-[#ebe7f0] flex flex-wrap items-center gap-2">
              <span className="text-xs font-semibold uppercase tracking-wider text-[#8b8794] mr-1">
                {isKnec ? 'Filter by Category:' : 'Filter by Level:'}
              </span>
              <Link
                href={`/${programme.slug}/${department.slug}/`}
                className={`rounded-xl px-3.5 py-1.5 text-xs font-semibold transition-colors ${
                  !filterLevel
                    ? 'bg-[#662c91] text-white shadow-xs'
                    : 'bg-[#f7f5fa] text-[#5c5766] hover:bg-[#f4eff9] hover:text-[#662c91]'
                }`}
              >
                {isKnec ? `All Courses (${courses.length})` : `All Levels (${courses.length})`}
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
                    {isKnec ? `${getKnecTierName(lvl)} (${count})` : `Level ${lvl} (${count})`}
                  </Link>
                );
              })}
            </div>
          )}
        </header>

        {/* Main Blog-Style Prose Body */}
        <div className="text-[#1d1823] text-base leading-relaxed space-y-6">
          {/* SECTION 1 (H2): Accredited Courses Grouped by Level */}
          <section id="department-courses">
            <h2 className="mt-2 mb-4 text-xl sm:text-2xl font-bold tracking-tight text-[#1d1823] scroll-mt-28">
              Accredited Courses in {deptTitle} ({displayedCourses.length}{' '}
              {displayedCourses.length === 1 ? 'Course' : 'Courses'})
            </h2>

            <div className="space-y-8">
              {displayedLevels.map((lvl) => {
                const levelCourses = courses.filter((c) => c.level === lvl);
                if (levelCourses.length === 0) return null;
                const lvlAcademic = getLevelAcademicProfile(lvl);
                const knecTier = getKnecTierName(lvl);

                return (
                  <div
                    key={lvl}
                    className="pt-4 border-t border-[#ebe7f0]/70 first:border-t-0 first:pt-0"
                  >
                    <div className="flex flex-wrap items-center justify-between gap-2">
                      <h3
                        id={`level-${lvl}-courses`}
                        className="mt-2 mb-2.5 text-lg font-bold text-[#1d1823]"
                      >
                        {isKnec
                          ? `KNEC ${knecTier} Courses (${levelCourses.length})`
                          : `Level ${lvl} Courses (${levelCourses.length}) - ${lvlAcademic.qualificationTitle}`}
                      </h3>

                      {!filterLevel && (
                        <Link
                          href={`/${programme.slug}/${department.slug}/level-${lvl}/`}
                          className="inline-flex items-center gap-1 text-xs font-semibold text-[#662c91] hover:underline"
                        >
                          <span>
                            {isKnec ? `${knecTier} Department Page` : `Level ${lvl} Department Page`}
                          </span>
                          <ArrowRight className="h-3.5 w-3.5" />
                        </Link>
                      )}
                    </div>

                    <p className="my-3 text-[15px] sm:text-base text-[#5c5766] leading-relaxed">
                      <strong className="font-semibold text-[#1d1823]">Admission &amp; Duration:</strong>{' '}
                      {lvlAcademic.minimumEntry} Typical training duration is {lvlAcademic.typicalDuration}
                    </p>

                    <h4 className="mt-4 mb-2.5 text-sm sm:text-base font-bold text-[#1d1823]">
                      Accredited {isKnec ? knecTier : `Level ${lvl}`} Qualifications in {deptTitle}:
                    </h4>

                    <ol className="my-3 space-y-2.5 pl-1">
                      {levelCourses.map((course, idx) => (
                        <li
                          key={course.id}
                          className="flex items-start gap-3 text-[15px] sm:text-base text-[#5c5766] leading-relaxed"
                        >
                          <span className="font-bold text-[#662c91] shrink-0">
                            {idx + 1}.
                          </span>
                          <div>
                            <Link
                              href={course.path}
                              className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                            >
                              {toTitleCase(course.name)}
                            </Link>{' '}
                            - Structured across{' '}
                            <strong className="font-semibold text-[#1d1823]">
                              {course.modules.length} {course.modules.length === 1 ? 'module' : 'modules'}
                            </strong>{' '}
                            and{' '}
                            <strong className="font-semibold text-[#1d1823]">
                              {course.units.length} competency {course.units.length === 1 ? 'unit' : 'units'}
                            </strong>
                            .
                          </div>
                        </li>
                      ))}
                    </ol>
                  </div>
                );
              })}
            </div>
          </section>

          {/* SECTION 2 (H2): Department Academic Scope, Practical Training & Career Pathways */}
          <section id="department-scope-and-careers" className="pt-6 border-t border-[#ebe7f0]">
            <h2 className="mt-4 mb-4 text-xl sm:text-2xl font-bold tracking-tight text-[#1d1823] scroll-mt-28">
              Academic Scope, Practical Training &amp; Career Pathways in {deptTitle}
            </h2>

            <h3 className="mt-5 mb-3 text-lg font-bold text-[#1d1823]">
              Practical Competency Training &amp; Regulatory Alignment
            </h3>

            <p className="my-4 text-[15px] sm:text-base leading-relaxed text-[#5c5766]">
              Trainees enrolled in the <strong className="font-semibold text-[#1d1823]">{deptTitle}</strong> undergo intensive hands-on competency training centered on{' '}
              {deptProfile.practicalFocus.charAt(0).toLowerCase() + deptProfile.practicalFocus.slice(1)}
            </p>

            <h4 className="mt-4 mb-2 text-base font-bold text-[#1d1823]">
              Recommended Workshop Tools &amp; Regulatory Bodies
            </h4>
            <p className="my-3 text-[15px] sm:text-base leading-relaxed text-[#5c5766]">
              Throughout practical workshop sessions and national assessments, candidates work with{' '}
              {deptProfile.recommendedTools}. Course standards and professional licensing pathways align with{' '}
              {deptProfile.regulatoryBodies}
            </p>

            {contextualArticles && contextualArticles.curriculumArticles.length > 0 && (
              <div className="my-5 rounded-r-xl border-l-4 border-[#662c91] bg-[#f8f5fd] p-4 text-sm space-y-1.5">
                <span className="font-bold text-[#1d1823] block">
                  Suggested Curriculum &amp; Assessment Guides:
                </span>
                {contextualArticles.curriculumArticles.map((art) => (
                  <p key={art.id} className="leading-relaxed text-[#5c5766]">
                    <span className="text-[#662c91] font-bold mr-1.5">•</span>
                    <Link
                      href={art.path}
                      className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                    >
                      {art.title}
                    </Link>
                  </p>
                ))}
              </div>
            )}

            <h3 className="mt-8 mb-3 text-lg font-bold text-[#1d1823]">
              Industry Employment &amp; Graduate Career Roles
            </h3>

            <p className="my-3 text-[15px] sm:text-base leading-relaxed text-[#5c5766]">
              Graduates from the <strong className="font-semibold text-[#1d1823]">{deptTitle}</strong> are recruited across {deptProfile.industrySettings}. Key occupational designations include:
            </p>

            <h4 className="mt-4 mb-2 text-base font-bold text-[#1d1823]">
              Key Career Designations for {deptTitle} Graduates:
            </h4>

            <ul className="my-3 space-y-2.5 pl-2">
              {deptProfile.careerPathways.map((role, idx) => (
                <li
                  key={idx}
                  className="flex items-start gap-2.5 text-[15px] sm:text-base text-[#5c5766] leading-relaxed"
                >
                  <span className="text-[#662c91] font-bold mt-0.5">•</span>
                  <div>
                    <strong className="font-semibold text-[#1d1823]">{role}</strong> - Deployed across {deptProfile.industrySettings.split(',')[0]} and related technical enterprises in Kenya.
                  </div>
                </li>
              ))}
            </ul>

            {contextualArticles && contextualArticles.careerArticles.length > 0 && (
              <div className="my-5 rounded-r-xl border-l-4 border-[#662c91] bg-[#f8f5fd] p-4 text-sm space-y-1.5">
                <span className="font-bold text-[#1d1823] block">
                  Explore {deptTitle} Career Spotlights:
                </span>
                {contextualArticles.careerArticles.slice(0, 2).map((art) => (
                  <p key={art.id} className="leading-relaxed text-[#5c5766]">
                    <span className="text-[#662c91] font-bold mr-1.5">•</span>
                    <Link
                      href={art.path}
                      className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                    >
                      {art.title}
                    </Link>
                  </p>
                ))}
              </div>
            )}
          </section>
        </div>

        {/* SECTION 3 (H2 -> H3): Embedded FAQ Section */}
        <FAQSection
          faqs={faqs}
          heading={`Frequently Asked Questions - ${pageTitle}`}
          embedded
        />
      </article>
    </div>
  );
}
