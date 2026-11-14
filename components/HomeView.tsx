'use client';

import { useState } from 'react';
import Link from 'next/link';
import {
  BookOpen,
  Building2,
  Download,
  FileText,
  FolderKanban,
  GraduationCap,
  Layers,
  Search,
  ArrowRight,
  ChevronDown,
  ChevronRight,
  CheckCircle2,
  Zap,
  Newspaper,
} from 'lucide-react';
import { ArticleCategory, DirectoryData, EnrichedArticle } from '@/lib/types';
import { formatDate, formatResourceType, getAutoResourceTitle, toTitleCase } from '@/lib/utils';
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

export function HomeView({
  data,
  articles = [],
}: {
  data: DirectoryData;
  articles?: EnrichedArticle[];
}) {
  const [selectedLevelFilter, setSelectedLevelFilter] = useState<number | 'all'>('all');
  const [openDeptId, setOpenDeptId] = useState<string | null>(null);

  const progById = new Map(data.programmes.map((p) => [p.id, p]));

  const getProgrammeStats = (slug: string) => {
    const prog = data.programmes.find((p) => p.slug === slug);
    if (!prog) return { courses: 0, units: 0 };
    const deptIds = new Set(
      data.departments.filter((d) => d.programme_id === prog.id).map((d) => d.id)
    );
    const progCourses = data.courses.filter((c) => deptIds.has(c.department_id));
    const courseIds = new Set(progCourses.map((c) => c.id));
    const progUnitsCount = data.units.filter((u) => courseIds.has(u.course_id)).length;
    return { courses: progCourses.length, units: progUnitsCount };
  };

  const cycle3Stats = getProgrammeStats('modular-cdacc-courses-cycle-3');
  const cycle12Stats = getProgrammeStats('cdacc-courses-cycle-1-and-2');
  const knecStats = getProgrammeStats('knec-courses');

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

  // Filtered courses based on selected level filter
  const displayedDepartments = selectedLevelFilter === 'all'
    ? departmentsWithCounts
    : departmentsWithCounts
        .map((d) => ({
          ...d,
          courses: d.courses.filter((c) => c.level === selectedLevelFilter),
        }))
        .filter((d) => d.courses.length > 0);

  // Recently added resources with unit & course info
  const unitById = new Map(data.units.map((u) => [u.id, u]));
  const recentResources = [...data.resources]
    .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
    .map((res) => ({
      res,
      unit: unitById.get(res.unit_id),
    }))
    .filter((r) => Boolean(r.unit))
    .slice(0, 6);

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
              <Layers className="h-3.5 w-3.5 text-purple-300" />
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
            Select an examination framework below for direct access to past papers, syllabus outlines, and notes.
          </p>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 max-w-6xl mx-auto">
          {/* 1. Modular CDACC Courses (Cycle 3) */}
          <Link
            href="/modular-cdacc-courses-cycle-3/"
            className="group rounded-2xl border border-[#ebe7f0] bg-white p-6 shadow-xs hover:border-[#662c91] hover:shadow-md transition-all flex flex-col items-center text-center justify-between"
          >
            <div className="flex flex-col items-center w-full">
              <div className="w-12 h-12 rounded-2xl bg-[#f4eff9] text-[#662c91] flex items-center justify-center mb-3 group-hover:bg-[#662c91] group-hover:text-white transition-colors mx-auto">
                <FolderKanban className="h-6 w-6" />
              </div>
              <span className="inline-flex items-center rounded-full bg-[#f4eff9] text-[#662c91] border border-purple-200 px-2.5 py-0.5 text-[10px] font-bold uppercase tracking-wider mb-2">
                Cycle 3 • Modular CBET
              </span>
              <h3 className="text-base font-bold text-[#1d1823] group-hover:text-[#662c91] transition-colors leading-snug">
                Modular CDACC Courses
              </h3>
              <p className="text-xs text-[#5c5766] mt-2 leading-relaxed">
                Short, self-contained modules (Levels 3–6) awarding per-module certificates. Includes competency units, cutting lists, candidate tools &amp; assessor guides.
              </p>
              {cycle3Stats.courses > 0 && (
                <div className="mt-3 inline-flex items-center gap-1.5 rounded-lg bg-[#f7f5fa] px-2.5 py-1 text-[11px] font-semibold text-[#4b1f6f]">
                  <span>{cycle3Stats.courses.toLocaleString()} Courses</span>
                  <span aria-hidden="true">•</span>
                  <span>{cycle3Stats.units.toLocaleString()} Units</span>
                </div>
              )}
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
              <div className="w-12 h-12 rounded-2xl bg-teal-50 text-teal-700 flex items-center justify-center mb-3 group-hover:bg-teal-600 group-hover:text-white transition-colors mx-auto">
                <BookOpen className="h-6 w-6" />
              </div>
              <span className="inline-flex items-center rounded-full bg-teal-50 text-teal-700 border border-teal-200 px-2.5 py-0.5 text-[10px] font-bold uppercase tracking-wider mb-2">
                Cycle 1 &amp; 2 • Non-Modular
              </span>
              <h3 className="text-base font-bold text-[#1d1823] group-hover:text-teal-700 transition-colors leading-snug">
                CDACC Courses (Cycle 1 &amp; 2)
              </h3>
              <p className="text-xs text-[#5c5766] mt-2 leading-relaxed">
                Full-qualification continuous training grouped into Basic, Common &amp; Core units. Includes Occupational Standards (OS), curricula &amp; marking rubrics.
              </p>
              {cycle12Stats.courses > 0 && (
                <div className="mt-3 inline-flex items-center gap-1.5 rounded-lg bg-teal-50/60 px-2.5 py-1 text-[11px] font-semibold text-teal-800">
                  <span>{cycle12Stats.courses.toLocaleString()} Courses</span>
                  <span aria-hidden="true">•</span>
                  <span>{cycle12Stats.units.toLocaleString()} Units</span>
                </div>
              )}
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
              <div className="w-12 h-12 rounded-2xl bg-amber-50 text-amber-700 flex items-center justify-center mb-3 group-hover:bg-amber-600 group-hover:text-white transition-colors mx-auto">
                <GraduationCap className="h-6 w-6" />
              </div>
              <span className="inline-flex items-center rounded-full bg-amber-50 text-amber-800 border border-amber-200 px-2.5 py-0.5 text-[10px] font-bold uppercase tracking-wider mb-2">
                KNEC • National Exams
              </span>
              <h3 className="text-base font-bold text-[#1d1823] group-hover:text-amber-700 transition-colors leading-snug">
                KNEC Courses &amp; Papers
              </h3>
              <p className="text-xs text-[#5c5766] mt-2 leading-relaxed">
                National Diploma (Mod I–III), Craft Certificate (Mod I–II) &amp; Artisan programmes with KNEC past papers, EPRA exams &amp; revision notes.
              </p>
              {knecStats.courses > 0 && (
                <div className="mt-3 inline-flex items-center gap-1.5 rounded-lg bg-amber-50/60 px-2.5 py-1 text-[11px] font-semibold text-amber-900">
                  <span>{knecStats.courses.toLocaleString()} Courses</span>
                  <span aria-hidden="true">•</span>
                  <span>{knecStats.units.toLocaleString()} Units</span>
                </div>
              )}
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
              <div className="w-12 h-12 rounded-2xl bg-[#fbeced] text-[#bd1e2c] flex items-center justify-center mb-3 group-hover:bg-[#bd1e2c] group-hover:text-white transition-colors mx-auto">
                <Newspaper className="h-6 w-6" />
              </div>
              <span className="inline-flex items-center rounded-full bg-[#fbeced] text-[#bd1e2c] border border-rose-200 px-2.5 py-0.5 text-[10px] font-bold uppercase tracking-wider mb-2">
                Updates &amp; Guides
              </span>
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

      {/* DEPARTMENT & LEVEL DIRECTORY - Decluttered & Easy to Navigate */}
      <section className="bg-white rounded-3xl border border-[#ebe7f0] p-6 sm:p-10 shadow-xs">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 mb-8">
          <div>
            <h2 className="text-xl sm:text-2xl font-bold text-[#1d1823]">
              Academic Departments &amp; Qualifications
            </h2>
            <p className="text-xs sm:text-sm text-[#5c5766] mt-1">
              Select a qualification level to filter, or browse all departments directly.
            </p>
          </div>

          {/* Level Filter Tabs */}
          <div className="flex items-center gap-1.5 p-1 bg-[#f7f5fa] border border-[#ebe7f0] rounded-xl self-start">
            <button
              type="button"
              onClick={() => setSelectedLevelFilter('all')}
              className={`px-3 py-1.5 rounded-lg text-xs font-semibold transition-all ${
                selectedLevelFilter === 'all'
                  ? 'bg-[#662c91] text-white shadow-xs'
                  : 'text-[#5c5766] hover:text-[#1d1823]'
              }`}
            >
              All Levels
            </button>
            {data.levels.map((lvl) => (
              <button
                key={lvl}
                type="button"
                onClick={() => setSelectedLevelFilter(lvl)}
                className={`px-3 py-1.5 rounded-lg text-xs font-semibold transition-all ${
                  selectedLevelFilter === lvl
                    ? 'bg-[#662c91] text-white shadow-xs'
                    : 'text-[#5c5766] hover:text-[#1d1823]'
                }`}
              >
                Level {lvl}
              </button>
            ))}
          </div>
        </div>

        {/* Department Accordion / List */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {displayedDepartments.map(({ dept, prog, courseCount, courses }) => {
            const isOpen = openDeptId === dept.id;
            return (
              <div
                key={dept.id}
                className="rounded-2xl border border-[#ebe7f0] bg-[#f8f5fd] overflow-hidden transition-all"
              >
                <div
                  onClick={() => setOpenDeptId(isOpen ? null : dept.id)}
                  className="flex items-center justify-between p-4 cursor-pointer hover:bg-[#f4eff9] transition-colors"
                >
                  <div className="flex items-center gap-3">
                    <span className="w-8 h-8 rounded-xl bg-white text-[#662c91] flex items-center justify-center font-bold text-xs shadow-2xs border border-[#ebe7f0]">
                      <Building2 className="h-4 w-4" />
                    </span>
                    <div>
                      <h3 className="text-sm font-bold text-[#1d1823]">
                        {toTitleCase(dept.name)}
                      </h3>
                      <p className="text-[11px] text-[#8b8794]">
                        {prog?.name} • {courseCount} {courseCount === 1 ? 'course' : 'courses'}
                      </p>
                    </div>
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
                      {courses.map((course) => (
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
                          {course.level && (
                            <span className="shrink-0 rounded-full bg-[#f4eff9] text-[#662c91] px-2 py-0.5 text-[10px] font-bold">
                              L{course.level}
                            </span>
                          )}
                        </div>
                      ))}
                    </div>

                    <div className="mt-3 pt-3 border-t border-[#ebe7f0] flex justify-end">
                      <Link
                        href={`/${prog!.slug}/${dept.slug}/`}
                        className="text-xs font-semibold text-[#662c91] hover:underline inline-flex items-center gap-1"
                      >
                        <span>View Full {toTitleCase(dept.name)} Department</span>
                        <ArrowRight className="h-3 w-3" />
                      </Link>
                    </div>
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </section>

      {/* RECENTLY ADDED ASSESSMENT PAPERS & QUICK DOWNLOADS */}
      <section className="bg-white rounded-3xl border border-[#ebe7f0] p-6 sm:p-10 shadow-xs">
        <div className="flex items-center justify-between mb-6">
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 rounded-xl bg-[#f4eff9] text-[#662c91] flex items-center justify-center">
              <Download className="h-4 w-4" />
            </div>
            <div>
              <h2 className="text-lg sm:text-xl font-bold text-[#1d1823]">
                Recent Assessment Documents
              </h2>
              <p className="text-xs text-[#5c5766]">
                Direct links to downloadable past papers, candidate tools &amp; assessor guides.
              </p>
            </div>
          </div>
          <Link
            href="/search/"
            className="text-xs font-semibold text-[#662c91] hover:underline hidden sm:block"
          >
            Search all files &rarr;
          </Link>
        </div>

        {recentResources.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-3.5">
            {recentResources.map(({ res, unit }) => (
              <div
                key={res.id}
                className="rounded-xl border border-[#ebe7f0] bg-[#f8f5fd] p-3.5 flex items-center justify-between gap-3 hover:border-[#662c91]/40 transition-colors"
              >
                <div className="min-w-0 flex-1">
                  <Link
                    href={unit!.path}
                    className="font-semibold text-xs sm:text-sm text-[#1d1823] hover:text-[#662c91] truncate block"
                  >
                    {toTitleCase(unit!.name)}
                  </Link>
                  <p className="text-[11px] text-[#8b8794] truncate mt-0.5">
                    {formatResourceType(res.type)} • {toTitleCase(unit!.course.name)}
                    {res.year ? ` (${res.year})` : ''}
                  </p>
                </div>

                <a
                  href={res.file_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="shrink-0 inline-flex items-center gap-1 rounded-lg bg-[#662c91] hover:bg-[#4b1f6f] text-white px-3 py-1.5 text-xs font-semibold shadow-2xs transition-colors"
                >
                  <Download className="h-3.5 w-3.5" />
                  <span>PDF</span>
                </a>
              </div>
            ))}
          </div>
        ) : (
          <p className="text-xs text-[#8b8794]">No assessment resources logged yet.</p>
        )}
      </section>

      {/* 3 PUBLISHED ARTICLES - All Articles & Assessment Circulars */}
      {articles.length > 0 && (
        <section className="bg-white rounded-3xl border border-[#ebe7f0] p-6 sm:p-10 shadow-xs">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 mb-8">
            <div className="flex items-center gap-2.5">
              <div className="w-8 h-8 rounded-xl bg-[#f4eff9] text-[#662c91] flex items-center justify-center">
                <BookOpen className="h-4 w-4" />
              </div>
              <div>
                <h2 className="text-xl sm:text-2xl font-bold text-[#1d1823]">
                  All Articles &amp; Assessment Circulars
                </h2>
                <p className="text-xs sm:text-sm text-[#5c5766] mt-0.5">
                  Latest official circulars, examination updates, and CBET candidate revision guidelines.
                </p>
              </div>
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
