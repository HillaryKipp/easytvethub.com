import type { Metadata } from 'next';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import { Layers, BookOpen, Building2 } from 'lucide-react';
import { getDirectoryData } from '@/lib/data';
import { getEnvConfig } from '@/lib/supabase';
import { toTitleCase, truncateDescription } from '@/lib/utils';
import { Breadcrumbs } from '@/components/Breadcrumbs';
import { FAQSection } from '@/components/FAQSection';
import { buildCollectionPageSchema } from '@/lib/jsonld';

export const dynamicParams = false;

export async function generateStaticParams(): Promise<{ levelSlug: string }[]> {
  const data = await getDirectoryData();
  return data.levels.map((lvl) => ({ levelSlug: `level-${lvl}` }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ levelSlug: string }>;
}): Promise<Metadata> {
  const { levelSlug } = await params;
  const match = levelSlug.match(/^level-(\d+)$/);
  if (!match) return {};
  const lvl = parseInt(match[1], 10);
  const { siteUrl } = getEnvConfig();
  const data = await getDirectoryData();
  const levelCourses = data.courses.filter((c) => c.level === lvl);

  const title = `Level ${lvl} TVET Courses in Kenya (${levelCourses.length} Courses) - Past Papers & Units | EasyTVET`;
  const desc = truncateDescription(
    `Browse all ${levelCourses.length} accredited Level ${lvl} TVET courses across Kenyan departments. Download free CDACC & KNEC past papers, assessor guides, and candidate tools.`,
    160
  );
  const url = `${siteUrl}/levels/level-${lvl}/`;

  return {
    title,
    description: desc,
    alternates: { canonical: url },
    openGraph: {
      title,
      description: desc,
      url,
      images: [{ url: '/og-default.png', width: 1200, height: 630, alt: title }],
    },
    twitter: { card: 'summary_large_image', title, description: desc, images: ['/og-default.png'] },
  };
}

export default async function LevelHubPage({
  params,
}: {
  params: Promise<{ levelSlug: string }>;
}) {
  const { levelSlug } = await params;
  const match = levelSlug.match(/^level-(\d+)$/);
  if (!match) notFound();
  const lvl = parseInt(match[1], 10);

  const data = await getDirectoryData();
  const levelCourses = data.courses.filter((c) => c.level === lvl);

  // Group courses by department
  const deptIds = Array.from(new Set(levelCourses.map((c) => c.department_id)));
  const deptGroups = deptIds
    .map((deptId) => {
      const courses = levelCourses.filter((c) => c.department_id === deptId);
      const dept = courses[0]?.department;
      const prog = courses[0]?.programme;
      return { dept, prog, courses };
    })
    .filter((g) => Boolean(g.dept && g.prog));

  const levelQualificationName =
    lvl === 6
      ? 'National Diploma'
      : lvl === 5
      ? 'Craft / Technician Certificate'
      : lvl === 4
      ? 'Artisan / Operator Certificate'
      : 'National Skills Certificate';

  const introText = `Kenyan TVET Level ${lvl} (${levelQualificationName}) qualifications equip trainees with industry-aligned technical, practical, and supervisory competencies under the Kenya National Qualifications Framework (KNQF). This cross-department hub lists all ${levelCourses.length} indexed Level ${lvl} courses across ${deptGroups.length} ${deptGroups.length === 1 ? 'department' : 'departments'}, linking directly to modular units and free PDF assessment downloads.`;

  const collectionSchema = buildCollectionPageSchema(
    `Level ${lvl} TVET Courses in Kenya`,
    introText,
    `/levels/level-${lvl}/`,
    levelCourses.map((c) => ({ name: toTitleCase(c.name), path: c.path }))
  );

  const faqs = [
    {
      question: `What qualification is TVET Level ${lvl} in Kenya?`,
      answer: `Under the Kenya National Qualifications Framework (KNQF), TVET Level ${lvl} corresponds to a ${levelQualificationName} offered at National Polytechnics, Technical Training Institutes (TTIs), and accredited Vocational Training Centres.`,
    },
    {
      question: `How many Level ${lvl} TVET courses are listed in this directory?`,
      answer: `There are currently ${levelCourses.length} accredited Level ${lvl} courses indexed across ${deptGroups.length} academic ${deptGroups.length === 1 ? 'department' : 'departments'}.`,
    },
    {
      question: `Where can I download Level ${lvl} CDACC and KNEC past papers?`,
      answer: `Click any Level ${lvl} course listed on this page to view its modules and competency units, then open any unit to download free PDF past papers, candidate tools, assessor guides, and cutting lists.`,
    },
  ];

  return (
    <div className="space-y-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionSchema) }}
      />
      <Breadcrumbs
        items={[
          { name: `Level ${lvl} Courses Hub`, path: `/levels/level-${lvl}/` },
        ]}
      />

      <header className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs">
        <div className="inline-flex items-center gap-2 rounded-full bg-[#f4eff9] px-3 py-1 text-xs font-semibold text-[#662c91] mb-3 border border-purple-200">
          <Layers className="h-3.5 w-3.5" />
          Qualification Hub • KNQF Level {lvl}
        </div>
        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight mb-4">
          Level {lvl} TVET Courses in Kenya ({levelQualificationName})
        </h1>
        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed max-w-3xl">
          {introText}
        </p>

        {/* Switch between Level Hubs */}
        <div className="mt-6 pt-6 border-t border-[#ebe7f0] flex flex-wrap items-center gap-2">
          <span className="text-xs font-semibold uppercase tracking-wider text-[#8b8794] mr-1">
            Browse Other Levels:
          </span>
          {data.levels.map((otherLvl) => (
            <Link
              key={otherLvl}
              href={`/levels/level-${otherLvl}/`}
              className={`rounded-xl px-3.5 py-1.5 text-xs font-semibold transition-colors ${
                otherLvl === lvl
                  ? 'bg-[#662c91] text-white shadow-xs'
                  : 'bg-[#f7f5fa] text-[#5c5766] hover:bg-[#f4eff9] hover:text-[#662c91]'
              }`}
            >
              Level {otherLvl}
            </Link>
          ))}
        </div>
      </header>

      {deptGroups.length > 0 ? (
        <div className="space-y-8">
          {deptGroups.map(({ dept, prog, courses }) => (
            <section
              key={dept.id}
              className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs"
            >
              <div className="flex flex-wrap items-center justify-between gap-2 mb-5 pb-4 border-b border-[#ebe7f0]">
                <div className="flex items-center gap-2.5">
                  <span className="w-8 h-8 rounded-xl bg-[#f4eff9] text-[#662c91] flex items-center justify-center font-bold text-xs">
                    <Building2 className="h-4 w-4" />
                  </span>
                  <div>
                    <h2 className="text-base font-bold text-[#1d1823]">
                      <Link
                        href={`/${prog.slug}/${dept.slug}/level-${lvl}/`}
                        className="hover:text-[#662c91]"
                      >
                        {toTitleCase(dept.name)} — Level {lvl} ({courses.length})
                      </Link>
                    </h2>
                    <p className="text-xs text-[#8b8794]">{prog.name}</p>
                  </div>
                </div>
                <Link
                  href={`/${prog.slug}/${dept.slug}/`}
                  className="text-xs font-semibold text-[#662c91] hover:underline"
                >
                  All {toTitleCase(dept.name)} Courses &rarr;
                </Link>
              </div>

              <ul className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2.5">
                {courses.map((course) => (
                  <li key={course.id}>
                    <Link
                      href={course.path}
                      className="flex items-center justify-between rounded-xl border border-[#ebe7f0] bg-[#f8f5fd] p-3 text-xs font-semibold text-[#1d1823] hover:border-[#662c91] hover:text-[#662c91] transition-all"
                    >
                      <span className="inline-flex items-center gap-2 truncate pr-2">
                        <BookOpen className="h-3.5 w-3.5 text-[#662c91] shrink-0" />
                        <span className="truncate">{toTitleCase(course.name)}</span>
                      </span>
                      <span className="shrink-0 text-[11px] font-normal text-[#8b8794]">
                        {course.units.length} {course.units.length === 1 ? 'unit' : 'units'}
                      </span>
                    </Link>
                  </li>
                ))}
              </ul>
            </section>
          ))}
        </div>
      ) : (
        <div className="rounded-3xl border border-[#ebe7f0] bg-white p-8 text-center text-xs text-[#5c5766]">
          No Level {lvl} courses have been indexed yet. Browse other levels above or search the directory.
        </div>
      )}

      <FAQSection faqs={faqs} heading={`Frequently Asked Questions About Level ${lvl} TVET Courses`} />
    </div>
  );
}
