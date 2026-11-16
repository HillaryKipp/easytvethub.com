'use client';

import { useState } from 'react';
import Link from 'next/link';
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
  const [selectedLevelFilter, setSelectedLevelFilter] = useState<number | 'all'>('all');

  const introText = getProgrammeIntro(programme, departments, courses);
  const faqs = getProgrammeFAQs(programme, departments, courses);

  const levels = Array.from(
    new Set(courses.map((c) => c.level).filter((l): l is number => l !== null && l !== undefined))
  ).sort((a, b) => a - b);

  const displayedLevels =
    selectedLevelFilter === 'all'
      ? levels
      : levels.filter((lvl) => lvl === selectedLevelFilter);

  const totalUnits = courses.reduce((sum, c) => sum + c.units.length, 0);
  const isModular = programme.slug.includes('modular');
  const isKnec = programme.slug.includes('knec');

  const getKnecTierName = (lvl: number) => {
    if (lvl === 6) return 'Diploma';
    if (lvl === 5) return 'Certificate';
    if (lvl === 4) return 'Artisan';
    return `Level ${lvl}`;
  };

  const shortParagraph = isModular
    ? `${programme.name} is Kenya’s revised TVET-CDACC Competency-Based Education and Training (CBET) framework covering ${courses.length} accredited courses and ${totalUnits} modular competency units across ${departments.length} technical and business departments.`
    : isKnec
    ? `${programme.name} encompasses ${courses.length} nationally examined Artisan, Certificate, and Diploma qualifications across ${departments.length} academic departments and ${totalUnits} indexed syllabus units in Kenya.`
    : `${programme.name} is a comprehensive Kenyan TVET curriculum framework featuring ${courses.length} accredited courses and ${totalUnits} competency units structured across ${departments.length} specialized departments.`;

  const seoHighlights = [
    isKnec
      ? `Qualification Categories (Artisan, Certificate & Diploma): Covers KNEC Artisan Courses, Craft / Certificate Courses, and National Diploma Courses across technical and business disciplines.`
      : `Qualification Levels (${levels.map((l) => `Level ${l}`).join(', ')}): Covers National Vocational Certificate (Level 3), Artisan (Level 4), Craft Certificate (Level 5), and National Diploma (Level 6) courses.`,
    isModular
      ? `Cycle 3 Modular Structure: Units of competency are grouped into progressive modules allowing trainees to complete, assess, and earn partial or full qualifications per cycle.`
      : isKnec
      ? `Stage & Modular Syllabus: Structured into progressive modules (Module I, II, and III) evaluated through KNEC national theory papers, trade projects, and industrial attachment.`
      : `CBET Competency Structure: Organizes units of learning into Basic, Common, and Core occupational competencies aligned with Kenyan industry standards.`,
    `Free Assessment & Revision Materials: Select any course and unit below to download verified PDF Past Papers, Practical Cutting Lists, Candidate Tools, and Assessor Guides.`,
  ];

  const collectionSchema = buildCollectionPageSchema(
    programme.name,
    introText,
    `/${programme.slug}/`,
    courses.map((c) => ({
      name: toTitleCase(c.name),
      path: c.path,
    }))
  );

  return (
    <div className="space-y-8">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionSchema) }}
      />
      <Breadcrumbs items={[{ name: programme.name, path: `/${programme.slug}/` }]} />

      {/* Header: Title + Short Paragraph + SEO Bullet List */}
      <header className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs">
        <div className="inline-flex items-center gap-2 rounded-full bg-[#f4eff9] px-3 py-1 text-xs font-semibold text-[#662c91] mb-3 border border-purple-200">
          TVET Programme Framework
        </div>
        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight mb-3">
          {programme.name}
        </h1>
        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed max-w-4xl">
          {shortParagraph}
        </p>
        <ul className="mt-4 space-y-2 text-xs sm:text-sm text-[#5c5766] list-disc pl-5 max-w-4xl">
          {seoHighlights.map((item, idx) => (
            <li key={idx} className="leading-relaxed">
              {item}
            </li>
          ))}
        </ul>
      </header>

      {/* Level Filter Buttons & Level Course Lists */}
      {levels.length > 0 && (
        <section className="space-y-6">
          {/* Hero-style Level Filter Banner & Pill Buttons */}
          <div className="rounded-2xl sm:rounded-3xl bg-gradient-to-r from-[#4b1f6f] via-[#662c91] to-[#3a1856] text-white p-5 sm:p-6 shadow-md">
            <div className="flex flex-wrap items-center justify-center gap-2.5 sm:gap-3">
              <button
                type="button"
                onClick={() => setSelectedLevelFilter('all')}
                className={`inline-flex items-center gap-1.5 rounded-full border px-4 sm:px-5 py-2.5 text-xs sm:text-sm font-semibold transition-all hover:scale-105 shadow-xs cursor-pointer ${
                  selectedLevelFilter === 'all'
                    ? 'bg-[#bd1e2c] border-[#bd1e2c] text-white font-bold shadow-md'
                    : 'bg-white/10 hover:bg-white/20 border-white/20 text-white'
                }`}
              >
                <span>{isKnec ? `All KNEC Courses (${courses.length})` : `All Levels (${courses.length})`}</span>
              </button>
              {levels.map((lvl) => {
                const count = courses.filter((c) => c.level === lvl).length;
                const isActive = selectedLevelFilter === lvl;
                const buttonLabel = isKnec
                  ? `${getKnecTierName(lvl)} (${count})`
                  : `Level ${lvl} (${count})`;
                return (
                  <button
                    key={lvl}
                    type="button"
                    onClick={() => setSelectedLevelFilter(lvl)}
                    className={`inline-flex items-center gap-1.5 rounded-full border px-4 sm:px-5 py-2.5 text-xs sm:text-sm font-semibold transition-all hover:scale-105 shadow-xs cursor-pointer ${
                      isActive
                        ? 'bg-[#bd1e2c] border-[#bd1e2c] text-white font-bold shadow-md'
                        : 'bg-white/10 hover:bg-white/20 border-white/20 text-white'
                    }`}
                  >
                    <span>{buttonLabel}</span>
                  </button>
                );
              })}
            </div>
          </div>

          <div className="space-y-6">
            {displayedLevels.map((lvl) => {
              const lvlCourses = courses.filter((c) => c.level === lvl);
              const sectionHeading = isKnec
                ? `KNEC ${getKnecTierName(lvl)} Courses (${lvlCourses.length})`
                : `Level ${lvl} Courses - ${programme.name} (${lvlCourses.length})`;

              return (
                <div
                  key={lvl}
                  className="rounded-2xl border border-[#ebe7f0] bg-white p-6 shadow-xs"
                >
                  <div className="flex flex-wrap items-center justify-between gap-2 mb-4 pb-3 border-b border-[#ebe7f0]">
                    <h2 className="text-base sm:text-lg font-bold text-[#1d1823]">
                      {sectionHeading}
                    </h2>
                    <Link
                      href={`/levels/level-${lvl}/`}
                      className="text-xs font-semibold text-[#662c91] hover:underline"
                    >
                      {isKnec
                        ? `All ${getKnecTierName(lvl)} Past Papers →`
                        : `All Level ${lvl} Past Papers →`}
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
