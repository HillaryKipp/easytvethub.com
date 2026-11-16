import Link from 'next/link';
import {
  ArrowLeft,
  ArrowRight,
  Calendar,
  FileText,
} from 'lucide-react';
import { EnrichedArticle, EnrichedCourse, EnrichedUnit } from '@/lib/types';
import { getUnitIntro } from '@/lib/seo';
import {
  formatDate,
  formatResourceType,
  toTitleCase,
} from '@/lib/utils';
import { Breadcrumbs } from './Breadcrumbs';
import { buildLearningResourceSchema } from '@/lib/jsonld';

export function UnitView({
  unit,
  course,
  allUnits,
}: {
  unit: EnrichedUnit;
  course: EnrichedCourse;
  allUnits: EnrichedUnit[];
  articles?: EnrichedArticle[];
}) {
  const isKnec = unit.programme.slug.includes('knec');
  const getKnecTierName = (lvl: number | null | undefined) => {
    if (lvl === 6) return 'Diploma';
    if (lvl === 5) return 'Certificate';
    if (lvl === 4) return 'Artisan';
    return lvl ? `Level ${lvl}` : 'TVET';
  };

  const unitTitle = toTitleCase(unit.name);
  const pageHeadingTitle = isKnec
    ? `${unitTitle} KNEC Past Papers`
    : `${unitTitle} CDACC Past Papers`;
  const courseTitle = toTitleCase(course.name);
  const deptTitle = toTitleCase(unit.department.name);
  const introText = getUnitIntro(unit);
  const learningResourceSchema = buildLearningResourceSchema(unit, introText);

  const currentModule = course.modules.find((m) => m.id === unit.module_id);
  const moduleUnits = currentModule ? currentModule.units : [];
  const currentIdx = moduleUnits.findIndex((u) => u.id === unit.id);
  const prevUnit = currentIdx > 0 ? moduleUnits[currentIdx - 1] : null;
  const nextUnit =
    currentIdx >= 0 && currentIdx < moduleUnits.length - 1
      ? moduleUnits[currentIdx + 1]
      : null;

  const otherUnitsInModule = moduleUnits.filter((u) => u.id !== unit.id);

  const normalizedName = unit.name.trim().toUpperCase();
  const sameNameUnits = allUnits.filter(
    (u) => u.id !== unit.id && u.name.trim().toUpperCase() === normalizedName
  );

  return (
    <div className="space-y-10">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(learningResourceSchema) }}
      />
      <Breadcrumbs
        items={[
          { name: unit.programme.name, path: `/${unit.programme.slug}/` },
          { name: deptTitle, path: `/${unit.programme.slug}/${unit.department.slug}/` },
          { name: courseTitle, path: course.path },
          { name: unitTitle, path: unit.path },
        ]}
      />

      {/* 1. Compact Header (Title only, immediate past papers list below for retention) */}
      <header className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs">
        <div className="flex flex-wrap items-center justify-between gap-2 mb-2.5">
          <div className="flex flex-wrap items-center gap-2">
            <Link
              href={course.path}
              className="rounded-full bg-[#f4eff9] px-3 py-1 text-xs font-semibold text-[#662c91] hover:underline"
            >
              {courseTitle}
            </Link>
            <span className="rounded-full bg-[#f7f5fa] px-3 py-1 text-xs font-semibold text-[#5c5766]">
              Module {unit.module.module_number}
            </span>
            {unit.course.level && (
              <Link
                href={`/levels/level-${unit.course.level}/`}
                className="rounded-full bg-[#fbeced] px-3 py-1 text-xs font-semibold text-[#bd1e2c] hover:underline"
              >
                {isKnec ? `KNEC ${getKnecTierName(unit.course.level)}` : `Level ${unit.course.level}`}
              </Link>
            )}
            {unit.unit_code && (
              <span className="rounded-full bg-[#f4eff9] px-3 py-1 font-mono text-xs text-[#662c91]">
                {unit.unit_code}
              </span>
            )}
          </div>

          <div className="inline-flex items-center gap-1.5 text-xs text-[#8b8794]">
            <Calendar className="h-3.5 w-3.5" />
            <span>
              Updated: <time dateTime={unit.updated_at}>{formatDate(unit.updated_at)}</time>
            </span>
          </div>
        </div>

        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight">
          {pageHeadingTitle}
        </h1>
      </header>

      {/* 2. FIRST PRIORITY: Clickable Past Papers & Assessment Resources Card List */}
      <section id="past-papers-and-tools" className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs">
        <div className="flex flex-wrap items-center justify-between gap-2 mb-5">
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 rounded-xl bg-[#f4eff9] text-[#662c91] flex items-center justify-center shrink-0">
              <FileText className="h-4 w-4" />
            </div>
            <h2 className="text-lg font-bold text-[#1d1823]">
              {isKnec ? 'Past Papers' : 'Past Papers & Assessment Tools'}
            </h2>
          </div>
        </div>

        {unit.resources.length > 0 ? (
          <ol className="space-y-2.5">
            {unit.resources.map((res, index) => {
              const typeLabel = formatResourceType(res.type);
              const displayTitle =
                res.title ||
                `${unitTitle} - ${res.year ? `${res.year} ` : ''}${isKnec ? 'KNEC ' : ''}${typeLabel}`;
              return (
                <li key={res.id}>
                  <a
                    href={res.file_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="group flex flex-wrap items-center justify-between gap-3 rounded-2xl border border-[#ebe7f0] bg-[#f8f5fd] px-4 py-3.5 hover:border-[#662c91] hover:bg-white transition-all shadow-2xs"
                  >
                    <div className="flex items-center gap-3 min-w-0">
                      <span className="inline-flex h-7 w-7 shrink-0 items-center justify-center rounded-lg bg-[#f4eff9] text-xs font-bold text-[#662c91] group-hover:bg-[#662c91] group-hover:text-white transition-colors">
                        {index + 1}
                      </span>
                      <div className="min-w-0">
                        <span className="block font-semibold text-xs sm:text-sm text-[#1d1823] group-hover:text-[#662c91] group-hover:underline transition-colors">
                          {displayTitle}
                        </span>
                      </div>
                    </div>

                    {res.year && (
                      <div className="flex items-center gap-2 shrink-0 ml-auto">
                        <span className="rounded-full bg-white border border-[#ebe7f0] px-2.5 py-0.5 text-[11px] font-medium text-[#5c5766]">
                          {res.year}
                        </span>
                      </div>
                    )}
                  </a>
                </li>
              );
            })}
          </ol>
        ) : (
          <div className="rounded-2xl border border-dashed border-[#ebe7f0] bg-[#f8f5fd] p-6 text-xs text-[#5c5766]">
            <p className="font-semibold text-[#1d1823] mb-1">
              Past papers for {unitTitle} are queued for indexing.
            </p>
            <p>
              While our editorial team verifies the latest past papers for this unit, check other units in{' '}
              <Link
                href={course.path}
                className="font-semibold text-[#662c91] hover:underline"
              >
                {courseTitle}
              </Link>
              , or{' '}
              <Link
                href="/contact/"
                className="font-semibold text-[#662c91] hover:underline"
              >
                contact us
              </Link>{' '}
              to request or submit this paper.
            </p>
          </div>
        )}
      </section>

      {/* 3. Curriculum Placement & Related Units */}
      <article className="bg-white rounded-3xl border border-[#ebe7f0] shadow-sm p-6 sm:p-10 lg:p-12">
        <div className="text-[#1d1823] text-base leading-relaxed space-y-6">
          {/* Curriculum Placement & Related Units in Module */}
          <section id="curriculum-placement">
            <h2 className="mt-2 mb-4 text-xl sm:text-2xl font-bold tracking-tight text-[#1d1823] scroll-mt-28">
              Curriculum Placement &amp; Module {unit.module.module_number} Units
            </h2>

            <h3 className="mt-5 mb-3 text-lg font-bold text-[#1d1823]">
              Official Syllabus Placement Table
            </h3>

            <p className="my-3 text-[15px] sm:text-base leading-relaxed text-[#5c5766]">
              The table below outlines the exact academic placement of <strong className="font-semibold text-[#1d1823]">{unitTitle}</strong> within the national TVET directory:
            </p>

            <div className="overflow-x-auto my-4 rounded-2xl border border-[#ebe7f0]">
              <table className="w-full text-left border-collapse text-xs sm:text-sm">
                <tbody className="divide-y divide-[#ebe7f0]">
                  <tr>
                    <th className="py-3 px-4 font-semibold text-[#8b8794] bg-[#f8f5fd] w-1/3">
                      Programme Framework
                    </th>
                    <td className="py-3 px-4 font-medium text-[#1d1823]">
                      <Link
                        href={`/${unit.programme.slug}/`}
                        className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                      >
                        {unit.programme.name}
                      </Link>
                    </td>
                  </tr>
                  <tr>
                    <th className="py-3 px-4 font-semibold text-[#8b8794] bg-[#f8f5fd]">
                      Academic Department
                    </th>
                    <td className="py-3 px-4 font-medium text-[#1d1823]">
                      <Link
                        href={`/${unit.programme.slug}/${unit.department.slug}/`}
                        className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                      >
                        {deptTitle}
                      </Link>
                    </td>
                  </tr>
                  <tr>
                    <th className="py-3 px-4 font-semibold text-[#8b8794] bg-[#f8f5fd]">
                      Parent Qualification / Course
                    </th>
                    <td className="py-3 px-4 font-medium text-[#1d1823]">
                      <Link
                        href={course.path}
                        className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                      >
                        {courseTitle}
                      </Link>
                    </td>
                  </tr>
                  <tr>
                    <th className="py-3 px-4 font-semibold text-[#8b8794] bg-[#f8f5fd]">
                      Module Placement
                    </th>
                    <td className="py-3 px-4 font-medium text-[#1d1823]">
                      Module {unit.module.module_number}
                      {unit.module.title &&
                      unit.module.title.toLowerCase() !== `module ${unit.module.module_number}`
                        ? ` (${unit.module.title})`
                        : ''}
                    </td>
                  </tr>
                  {unit.unit_code && (
                    <tr>
                      <th className="py-3 px-4 font-semibold text-[#8b8794] bg-[#f8f5fd]">
                        Unit Code
                      </th>
                      <td className="py-3 px-4 font-mono text-xs text-[#1d1823]">
                        {unit.unit_code}
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>

            {otherUnitsInModule.length > 0 && (
              <div className="mt-8">
                <h3 className="mt-6 mb-3 text-lg font-bold text-[#1d1823]">
                  Other Units in Module {unit.module.module_number} of {courseTitle}
                </h3>
                <p className="my-3 text-[15px] sm:text-base leading-relaxed text-[#5c5766]">
                  Trainees taking <strong className="font-semibold text-[#1d1823]">{unitTitle}</strong> in Module {unit.module.module_number} of{' '}
                  <Link
                    href={course.path}
                    className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                  >
                    {courseTitle}
                  </Link>{' '}
                  also cover the following companion competency units in the same module:
                </p>
                <ul className="my-3 space-y-2.5 pl-2">
                  {otherUnitsInModule.map((other) => (
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
                        </Link>
                        {other.resources.length > 0 ? (
                          <span>
                            {' '}
                            - <strong className="font-semibold text-[#1d1823]">{other.resources.length}</strong> available
                          </span>
                        ) : (
                          <span> - Competency guide &amp; syllabus details</span>
                        )}
                      </div>
                    </li>
                  ))}
                </ul>

                {(prevUnit || nextUnit) && (
                  <div className="mt-6 pt-4 border-t border-[#ebe7f0]">
                    <h4 className="text-sm sm:text-base font-bold text-[#1d1823] mb-2">
                      Sequential Unit Navigation in Module {unit.module.module_number}:
                    </h4>
                    <div className="flex flex-wrap items-center justify-between gap-4 text-sm">
                      {prevUnit ? (
                        <Link
                          href={prevUnit.path}
                          className="inline-flex items-center gap-1.5 font-semibold text-[#662c91] hover:underline"
                        >
                          <ArrowLeft className="h-4 w-4 shrink-0" />
                          <span>Previous: {toTitleCase(prevUnit.name)}</span>
                        </Link>
                      ) : (
                        <span />
                      )}

                      {nextUnit && (
                        <Link
                          href={nextUnit.path}
                          className="inline-flex items-center gap-1.5 font-semibold text-[#662c91] hover:underline ml-auto"
                        >
                          <span>Next: {toTitleCase(nextUnit.name)}</span>
                          <ArrowRight className="h-4 w-4 shrink-0" />
                        </Link>
                      )}
                    </div>
                  </div>
                )}
              </div>
            )}

            {sameNameUnits.length > 0 && (
              <div className="mt-8">
                <h3 className="mt-6 mb-3 text-lg font-bold text-[#1d1823]">
                  Other Courses Featuring {unitTitle}
                </h3>
                <ul className="my-3 space-y-2 pl-2">
                  {sameNameUnits.slice(0, 6).map((dup) => (
                    <li
                      key={dup.id}
                      className="flex items-start gap-2.5 text-[15px] sm:text-base text-[#5c5766] leading-relaxed"
                    >
                      <span className="text-[#662c91] font-bold mt-0.5">•</span>
                      <div>
                        <Link
                          href={dup.path}
                          className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                        >
                          {toTitleCase(dup.name)} - {toTitleCase(dup.course.name)}
                        </Link>{' '}
                        (Module {dup.module.module_number}, {dup.programme.name})
                      </div>
                    </li>
                  ))}
                </ul>
              </div>
            )}
          </section>
        </div>
      </article>
    </div>
  );
}
