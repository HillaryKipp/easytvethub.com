'use client';

import { useState } from 'react';
import Link from 'next/link';
import {
  Search,
  ArrowRight,
  ChevronDown,
} from 'lucide-react';
import { ArticleCategory, DirectoryData, EnrichedArticle } from '@/lib/types';
import { formatDate, getAutoResourceTitle, toTitleCase } from '@/lib/utils';
import { buildBreadcrumbSchema, buildCollectionPageSchema } from '@/lib/jsonld';

function categoryBadge(category: ArticleCategory) {
  switch (category) {
    case 'exam_news':
      return {
        label: 'Exam News',
        classes: 'bg-[#fbeced] text-[#bd1e2c] border border-rose-200',
      };
    case 'revision_guide':
      return {
        label: 'Revision Guide',
        classes: 'bg-[#f4eff9] text-[#662c91] border border-purple-200',
      };
    case 'curriculum_update':
      return {
        label: 'CBET Curriculum',
        classes: 'bg-sky-50 text-sky-700 border border-sky-200',
      };
    case 'course_spotlight':
      return {
        label: 'Course Spotlight',
        classes: 'bg-amber-50 text-amber-800 border border-amber-200',
      };
    default:
      return {
        label: 'Editorial',
        classes: 'bg-[#f7f5fa] text-[#5c5766] border border-[#ebe7f0]',
      };
  }
}

type ProgrammeFilter = 'all' | 'modular-cdacc' | 'non-modular-cdacc' | 'knec';

const PROGRAMME_FILTERS: { id: ProgrammeFilter; label: string; slug?: string }[] = [
  { id: 'all', label: 'All Courses' },
  { id: 'modular-cdacc', label: 'Modular CDACC', slug: 'modular-cdacc-courses-cycle-3' },
  { id: 'non-modular-cdacc', label: 'Non Modular CDACC', slug: 'cdacc-courses-cycle-1-and-2' },
  { id: 'knec', label: 'KNEC', slug: 'knec-courses' },
];

function normalizeDepartmentName(name: string): string {
  return name
    .trim()
    .toUpperCase()
    .replace(/\s+DEPARTMENT$/i, '')
    .replace(/\bSCIENCES\b/gi, 'SCIENCE');
}

function getShortProgLabel(slug?: string): string {
  if (slug === 'modular-cdacc-courses-cycle-3') return 'Modular CDACC';
  if (slug === 'cdacc-courses-cycle-1-and-2') return 'Non Modular CDACC';
  if (slug === 'knec-courses') return 'KNEC';
  return '';
}

export function HomeView({
  data,
  articles = [],
}: {
  data: DirectoryData;
  articles?: EnrichedArticle[];
}) {
  const [selectedProgrammeFilter, setSelectedProgrammeFilter] = useState<ProgrammeFilter>('all');
  const [openDeptId, setOpenDeptId] = useState<string | null>(null);

  const progById = new Map(data.programmes.map((p) => [p.id, p]));

  // Popular departments sorted by course count
  const departmentsWithCounts = data.departments
    .map((dept) => {
      const prog = progById.get(dept.programme_id);
      const deptCourses = data.courses.filter((c) => c.department_id === dept.id);
      return {
        dept,
        prog,
        courseCount: deptCourses.length,
        courses: deptCourses,
      };
    })
    .filter((d) => Boolean(d.prog))
    .sort((a, b) => b.courseCount - a.courseCount);

  // Filtered & grouped departments based on selected programme filter
  const activeFilter = PROGRAMME_FILTERS.find((f) => f.id === selectedProgrammeFilter);

  const displayedDepartments = (() => {
    if (selectedProgrammeFilter === 'all' || !activeFilter?.slug) {
      const grouped = new Map<
        string,
        {
          id: string;
          name: string;
          deptLinks: { label: string; href: string }[];
          courses: { course: (typeof data.courses)[number]; progLabel: string }[];
        }
      >();

      for (const { dept, prog, courses } of departmentsWithCounts) {
        if (!prog) continue;
        const key = normalizeDepartmentName(dept.name);
        const progLabel = getShortProgLabel(prog.slug) || prog.name;
        const existing = grouped.get(key);

        if (existing) {
          if (!existing.name.toUpperCase().endsWith('DEPARTMENT') && dept.name.toUpperCase().endsWith('DEPARTMENT')) {
            existing.name = dept.name;
          }
          existing.deptLinks.push({
            label: progLabel,
            href: `/${prog.slug}/${dept.slug}/`,
          });
          for (const course of courses) {
            existing.courses.push({ course, progLabel });
          }
        } else {
          grouped.set(key, {
            id: key,
            name: dept.name,
            deptLinks: [
              {
                label: progLabel,
                href: `/${prog.slug}/${dept.slug}/`,
              },
            ],
            courses: courses.map((course) => ({ course, progLabel })),
          });
        }
      }

      return Array.from(grouped.values())
        .map((g) => ({
          ...g,
          subtitle: `${g.deptLinks.map((l) => l.label).join(', ')} • ${g.courses.length} ${
            g.courses.length === 1 ? 'course' : 'courses'
          }`,
        }))
        .sort((a, b) => b.courses.length - a.courses.length);
    }

    return departmentsWithCounts
      .filter((d) => d.prog?.slug === activeFilter.slug)
      .map(({ dept, prog, courseCount, courses }) => ({
        id: dept.id,
        name: dept.name,
        subtitle: `${prog?.name} • ${courseCount} ${courseCount === 1 ? 'course' : 'courses'}`,
        deptLinks: [
          {
            label: `View Full ${toTitleCase(dept.name)} Department`,
            href: `/${prog!.slug}/${dept.slug}/`,
          },
        ],
        courses: courses.map((course) => ({ course, progLabel: '' })),
      }));
  })();

  const homeBreadcrumb = buildBreadcrumbSchema([{ name: 'Home', path: '/' }]);
  const collectionSchema = buildCollectionPageSchema(
    'EASYTVET Kenya - Comprehensive TVET Training Resources & Past Papers',
    'Explore comprehensive Kenyan TVET CDACC and KNEC training resources, past papers, assessor guides, candidate tools, and course outlines.',
    '/',
    data.programmes.map((p) => ({ name: p.name, path: `/${p.slug}/` }))
  );


  return (
    <div className="space-y-12">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(homeBreadcrumb) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionSchema) }}
      />

      {/* LEVEL BUTTONS - Centered & Simplified (Levels 3, 4, 5, 6) */}
      <section className="rounded-2xl sm:rounded-3xl bg-gradient-to-r from-[#4b1f6f] via-[#662c91] to-[#3a1856] text-white p-5 sm:p-7 shadow-md">
        <h1 className="sr-only">EASYTVET: Fast, Free Past Papers &amp; Learning Guides</h1>
        <div className="flex flex-wrap items-center justify-center gap-2.5 sm:gap-3">
          {data.levels.map((lvl) => (
            <Link
              key={lvl}
              href={`/levels/level-${lvl}/`}
              className="inline-flex items-center gap-1.5 rounded-full bg-white/10 hover:bg-white/20 border border-white/20 px-4 sm:px-5 py-2.5 text-xs sm:text-sm font-semibold text-white transition-all hover:scale-105 shadow-xs"
            >
              <span>Level {lvl}</span>
            </Link>
          ))}
          <Link
            href="/search/"
            className="inline-flex items-center gap-2 rounded-full bg-[#bd1e2c] hover:bg-[#9c1824] px-5 py-2.5 text-xs sm:text-sm font-bold text-white transition-all hover:scale-105 shadow-md"
          >
            <Search className="h-4 w-4" />
            <span>Search All Resources</span>
          </Link>
        </div>
      </section>

      {/* 4 PRIMARY SERVICE CARDS - Centered Layout & Content */}
      <section className="text-center">
        <div className="text-center max-w-2xl mx-auto mb-8">
          <h2 className="text-2xl font-extrabold tracking-tight text-[#1d1823]">
            Browse TVET Training Resources
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] mt-1.5">
            Select an examination framework below for direct access to past papers.
          </p>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 max-w-6xl mx-auto">
          {/* 1. Modular CDACC Courses (Cycle 3) */}
          <Link
            href="/modular-cdacc-courses-cycle-3/"
            className="group rounded-2xl border border-[#ebe7f0] bg-white p-6 shadow-xs hover:border-[#662c91] hover:shadow-md transition-all flex flex-col items-center text-center justify-between"
          >
            <div className="flex flex-col items-center w-full">
              <h3 className="text-base font-bold text-[#1d1823] group-hover:text-[#662c91] transition-colors leading-snug">
                Modular CDACC Courses
              </h3>
              <p className="text-xs text-[#5c5766] mt-2 leading-relaxed">
                Short, self-contained modules (Levels 3–6) awarding per-module certificates. Includes competency units, cutting lists, candidate tools &amp; assessor guides.
              </p>
            </div>
            <div className="mt-5 pt-4 border-t border-[#ebe7f0] w-full flex items-center justify-center gap-1.5 text-xs font-semibold text-[#662c91]">
              <span>Explore Cycle 3</span>
              <ArrowRight className="h-3.5 w-3.5 group-hover:translate-x-1 transition-transform" />
            </div>
          </Link>

          {/* 2. CDACC Courses Cycle 1 & 2 (Non-Modular) */}
          <Link
            href="/cdacc-courses-cycle-1-and-2/"
            className="group rounded-2xl border border-[#ebe7f0] bg-white p-6 shadow-xs hover:border-teal-600 hover:shadow-md transition-all flex flex-col items-center text-center justify-between"
          >
            <div className="flex flex-col items-center w-full">
              <h3 className="text-base font-bold text-[#1d1823] group-hover:text-teal-700 transition-colors leading-snug">
                CDACC Courses (Cycle 1 &amp; 2)
              </h3>
              <p className="text-xs text-[#5c5766] mt-2 leading-relaxed">
                Full-qualification continuous training grouped into Basic, Common &amp; Core units. Includes Occupational Standards (OS), curricula &amp; marking rubrics.
              </p>
            </div>
            <div className="mt-5 pt-4 border-t border-[#ebe7f0] w-full flex items-center justify-center gap-1.5 text-xs font-semibold text-teal-700">
              <span>Explore Cycle 1 &amp; 2</span>
              <ArrowRight className="h-3.5 w-3.5 group-hover:translate-x-1 transition-transform" />
            </div>
          </Link>

          {/* 3. KNEC Courses */}
          <Link
            href="/knec-courses/"
            className="group rounded-2xl border border-[#ebe7f0] bg-white p-6 shadow-xs hover:border-amber-600 hover:shadow-md transition-all flex flex-col items-center text-center justify-between"
          >
            <div className="flex flex-col items-center w-full">
              <h3 className="text-base font-bold text-[#1d1823] group-hover:text-amber-700 transition-colors leading-snug">
                KNEC Courses &amp; Papers
              </h3>
              <p className="text-xs text-[#5c5766] mt-2 leading-relaxed">
                National Diploma (Mod I–III), Craft Certificate (Mod I–II) &amp; Artisan programmes with KNEC past papers, EPRA exams &amp; revision notes.
              </p>
            </div>
            <div className="mt-5 pt-4 border-t border-[#ebe7f0] w-full flex items-center justify-center gap-1.5 text-xs font-semibold text-amber-700">
              <span>Explore KNEC</span>
              <ArrowRight className="h-3.5 w-3.5 group-hover:translate-x-1 transition-transform" />
            </div>
          </Link>

          {/* 4. TVET News & Blog */}
          <Link
            href="/blog/"
            className="group rounded-2xl border border-[#ebe7f0] bg-white p-6 shadow-xs hover:border-[#bd1e2c] hover:shadow-md transition-all flex flex-col items-center text-center justify-between"
          >
            <div className="flex flex-col items-center w-full">
              <h3 className="text-base font-bold text-[#1d1823] group-hover:text-[#bd1e2c] transition-colors leading-snug">
                TVET News &amp; Circulars
              </h3>
              <p className="text-xs text-[#5c5766] mt-2 leading-relaxed">
                Official KNEC notices, CDACC assessment dates, and CBET candidate tool guides.
              </p>
            </div>
            <div className="mt-5 pt-4 border-t border-[#ebe7f0] w-full flex items-center justify-center gap-1.5 text-xs font-semibold text-[#bd1e2c]">
              <span>Read Latest News</span>
              <ArrowRight className="h-3.5 w-3.5 group-hover:translate-x-1 transition-transform" />
            </div>
          </Link>
        </div>
      </section>

      {/* DEPARTMENT & PROGRAMME DIRECTORY - Decluttered & Easy to Navigate */}
      <section className="bg-white rounded-3xl border border-[#ebe7f0] p-6 sm:p-10 shadow-xs">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-8">
          <div>
            <h2 className="text-xl sm:text-2xl font-bold text-[#1d1823]">
              Academic Departments and TVET courses
            </h2>
            <p className="text-xs sm:text-sm text-[#5c5766] mt-1">
              Select a programme framework to filter, or browse all departments directly.
            </p>
          </div>

          {/* Programme Filter Tabs */}
          <div className="flex flex-wrap items-center gap-1.5 p-1 bg-[#f7f5fa] border border-[#ebe7f0] rounded-xl self-start">
            {PROGRAMME_FILTERS.map((filter) => (
              <button
                key={filter.id}
                type="button"
                onClick={() => setSelectedProgrammeFilter(filter.id)}
                className={`px-3 py-1.5 rounded-lg text-xs font-semibold transition-all ${
                  selectedProgrammeFilter === filter.id
                    ? 'bg-[#662c91] text-white shadow-xs'
                    : 'text-[#5c5766] hover:text-[#1d1823]'
                }`}
              >
                {filter.label}
              </button>
            ))}
          </div>
        </div>

        {/* Department Accordion / List */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {displayedDepartments.map(({ id, name, subtitle, deptLinks, courses }) => {
            const isOpen = openDeptId === id;
            return (
              <div
                key={id}
                className="rounded-2xl border border-[#ebe7f0] bg-[#f8f5fd] overflow-hidden transition-all"
              >
                <div
                  onClick={() => setOpenDeptId(isOpen ? null : id)}
                  className="flex items-center justify-between p-4 cursor-pointer hover:bg-[#f4eff9] transition-colors"
                >
                  <div>
                    <h3 className="text-sm font-bold text-[#1d1823]">
                      {toTitleCase(name)}
                    </h3>
                    <p className="text-[11px] text-[#8b8794]">
                      {subtitle}
                    </p>
                  </div>

                  <div className="flex items-center gap-2">
                    <span className="text-[11px] font-semibold text-[#662c91] bg-white px-2.5 py-1 rounded-full border border-[#ebe7f0]">
                      {courses.length}
                    </span>
                    <ChevronDown
                      className={`h-4 w-4 text-[#8b8794] transition-transform ${
                        isOpen ? 'rotate-180 text-[#662c91]' : ''
                      }`}
                    />
                  </div>
                </div>

                {isOpen && (
                  <div className="p-4 pt-0 border-t border-[#ebe7f0] bg-white">
                    <div className="divide-y divide-[#ebe7f0] max-h-60 overflow-y-auto pr-1">
                      {courses.map(({ course, progLabel }) => (
                        <div
                          key={course.id}
                          className="py-2.5 flex items-center justify-between gap-3 text-xs"
                        >
                          <Link
                            href={course.path}
                            className="font-medium text-[#1d1823] hover:text-[#662c91] truncate"
                          >
                            {toTitleCase(course.name)}
                          </Link>
                          <div className="flex items-center gap-1.5 shrink-0">
                            {progLabel && (
                              <span className="rounded-full bg-[#f7f5fa] text-[#5c5766] border border-[#ebe7f0] px-2 py-0.5 text-[10px] font-medium">
                                {progLabel}
                              </span>
                            )}
                            {course.level && (
                              <span className="rounded-full bg-[#f4eff9] text-[#662c91] px-2 py-0.5 text-[10px] font-bold">
                                L{course.level}
                              </span>
                            )}
                          </div>
                        </div>
                      ))}
                    </div>

                    <div className="mt-3 pt-3 border-t border-[#ebe7f0] flex flex-wrap justify-end gap-3">
                      {deptLinks.map((link) => (
                        <Link
                          key={link.href}
                          href={link.href}
                          className="text-xs font-semibold text-[#662c91] hover:underline inline-flex items-center gap-1"
                        >
                          <span>{link.label}</span>
                          <ArrowRight className="h-3 w-3" />
                        </Link>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </section>

      {/* 3 PUBLISHED ARTICLES - All Articles & Assessment Circulars */}
      {articles.length > 0 && (
        <section className="bg-white rounded-3xl border border-[#ebe7f0] p-6 sm:p-10 shadow-xs">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 mb-8">
            <div>
              <h2 className="text-xl sm:text-2xl font-bold text-[#1d1823]">
                All Articles &amp; Assessment Circulars
              </h2>
              <p className="text-xs sm:text-sm text-[#5c5766] mt-0.5">
                Latest official circulars, examination updates, and CBET candidate revision guidelines.
              </p>
            </div>
            <Link
              href="/blog/"
              className="text-xs sm:text-sm font-semibold text-[#662c91] hover:underline inline-flex items-center gap-1 self-start sm:self-auto"
            >
              <span>View All Articles</span>
              <ArrowRight className="h-3.5 w-3.5" />
            </Link>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {articles.map((article) => {
              const badge = categoryBadge(article.category);
              return (
                <article
                  key={article.id}
                  className="rounded-2xl border border-[#ebe7f0] bg-[#f8f5fd] p-5 flex flex-col justify-between hover:border-[#662c91]/60 hover:shadow-md transition-all group"
                >
                  <div>
                    {article.featured_image_url && (
                      <Link
                        href={article.path}
                        className="block overflow-hidden rounded-xl mb-4 border border-[#ebe7f0] bg-white"
                      >
                        <img
                          src={article.featured_image_url}
                          alt={article.featured_image_alt || article.title}
                          className="w-full aspect-[16/10] object-cover group-hover:scale-105 transition-transform duration-300"
                        />
                      </Link>
                    )}

                    <div className="flex items-center gap-2 mb-2.5">
                      <span className={`inline-block px-2 py-0.5 rounded-full text-[10px] font-semibold ${badge.classes}`}>
                        {badge.label}
                      </span>
                      <span className="text-[11px] text-[#8b8794]">
                        {article.reading_time_minutes} min read
                      </span>
                    </div>

                    <h3 className="text-sm sm:text-base font-bold text-[#1d1823] group-hover:text-[#662c91] transition-colors leading-snug">
                      <Link href={article.path}>{article.title}</Link>
                    </h3>

                    <p className="mt-2 text-xs text-[#5c5766] leading-relaxed line-clamp-2">
                      {article.excerpt}
                    </p>
                  </div>

                  <div className="mt-5 pt-3 border-t border-[#ebe7f0] flex items-center justify-between text-xs">
                    <span className="text-[#8b8794] text-[11px]">
                      {article.author.name}
                    </span>
                    <Link
                      href={article.path}
                      className="font-semibold text-[#662c91] group-hover:underline inline-flex items-center gap-1"
                    >
                      <span>Read</span>
                      <ArrowRight className="h-3 w-3" />
                    </Link>
                  </div>
                </article>
              );
            })}
          </div>
        </section>
      )}
    </div>
  );
}
