import Link from 'next/link';
import {
  ArrowLeft,
  ArrowRight,
  BookOpen,
  Calendar,
  Download,
  FileText,
  Info,
  Layers,
  Link2,
} from 'lucide-react';
import { EnrichedCourse, EnrichedUnit } from '@/lib/types';
import { getUnitFAQs, getUnitIntro, getUnitWhatIsSummary } from '@/lib/seo';
import {
  formatDate,
  formatResourceType,
  getFileExtensionLabel,
  toTitleCase,
} from '@/lib/utils';
import { Breadcrumbs } from './Breadcrumbs';
import { FAQSection } from './FAQSection';
import { buildLearningResourceSchema } from '@/lib/jsonld';

export function UnitView({
  unit,
  course,
  allUnits,
}: {
  unit: EnrichedUnit;
  course: EnrichedCourse;
  allUnits: EnrichedUnit[];
}) {
  const unitTitle = toTitleCase(unit.name);
  const courseTitle = toTitleCase(course.name);
  const deptTitle = toTitleCase(unit.department.name);
  const introText = getUnitIntro(unit);
  const whatIsSummary = getUnitWhatIsSummary(unit);
  const faqs = getUnitFAQs(unit);
  const learningResourceSchema = buildLearningResourceSchema(unit, introText);

  // Module units for previous/next navigation
  const currentModule = course.modules.find((m) => m.id === unit.module_id);
  const moduleUnits = currentModule ? currentModule.units : [];
  const currentIdx = moduleUnits.findIndex((u) => u.id === unit.id);
  const prevUnit = currentIdx > 0 ? moduleUnits[currentIdx - 1] : null;
  const nextUnit =
    currentIdx >= 0 && currentIdx < moduleUnits.length - 1
      ? moduleUnits[currentIdx + 1]
      : null;

  const otherUnitsInModule = moduleUnits.filter((u) => u.id !== unit.id);
  const otherUnitsInCourse = course.units.filter(
    (u) => u.id !== unit.id && u.module_id !== unit.module_id
  );

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

      {/* Header */}
      <header className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs">
        <div className="flex flex-wrap items-center justify-between gap-2 mb-3">
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
                Level {unit.course.level}
              </Link>
            )}
          </div>

          <div className="inline-flex items-center gap-1.5 text-xs text-[#8b8794]">
            <Calendar className="h-3.5 w-3.5" />
            <span>
              Updated: <time dateTime={unit.updated_at}>{formatDate(unit.updated_at)}</time>
            </span>
          </div>
        </div>

        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight mb-4">
          {unitTitle}
        </h1>

        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed max-w-3xl">
          {introText}
        </p>

        {/* Duplicate / Canonical Unit Notice */}
        {(unit.duplicatePaths.length > 0 || sameNameUnits.length > 0) && (
          <div className="mt-5 rounded-2xl border border-amber-200 bg-amber-50/70 p-4 text-xs text-amber-950 flex items-start gap-3">
            <Link2 className="h-4 w-4 text-amber-600 shrink-0 mt-0.5" />
            <div>
              <span className="font-semibold">Also appears in: </span>
              {sameNameUnits.map((dup, idx) => (
                <span key={dup.id}>
                  {idx > 0 && ', '}
                  <Link
                    href={dup.path}
                    className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
                  >
                    {toTitleCase(dup.name)} ({toTitleCase(dup.course.name)} — Module{' '}
                    {dup.module.module_number})
                  </Link>
                </span>
              ))}
            </div>
          </div>
        )}
      </header>

      {/* "What is {unit}?" Summary */}
      <section className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs">
        <div className="flex items-center gap-2.5 mb-3">
          <div className="w-8 h-8 rounded-xl bg-[#f4eff9] text-[#662c91] flex items-center justify-center shrink-0">
            <Info className="h-4 w-4" />
          </div>
          <h2 className="text-lg font-bold text-[#1d1823]">
            What is {unitTitle}?
          </h2>
        </div>
        <p className="text-[#5c5766] leading-relaxed text-xs sm:text-sm">
          {whatIsSummary}
        </p>
      </section>

      {/* Downloads Table */}
      <section className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs">
        <div className="flex flex-wrap items-center justify-between gap-2 mb-5">
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 rounded-xl bg-[#fbeced] text-[#bd1e2c] flex items-center justify-center shrink-0">
              <Download className="h-4 w-4" />
            </div>
            <h2 className="text-lg font-bold text-[#1d1823]">
              Downloads for {unitTitle}
            </h2>
          </div>
          <span className="rounded-full bg-[#f4eff9] text-[#662c91] px-3 py-1 text-xs font-bold">
            {unit.resources.length} {unit.resources.length === 1 ? 'Document' : 'Documents'} Available
          </span>
        </div>

        {unit.resources.length > 0 ? (
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="border-b border-[#ebe7f0] text-[11px] font-semibold uppercase tracking-wider text-[#8b8794]">
                  <th className="py-2.5 pr-4">Document Type</th>
                  <th className="py-2.5 px-4">Title</th>
                  <th className="py-2.5 px-4">Series/Year</th>
                  <th className="py-2.5 px-4">Format</th>
                  <th className="py-2.5 pl-4 text-right">Download</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-[#ebe7f0] text-xs sm:text-sm">
                {unit.resources.map((res) => {
                  const typeLabel = formatResourceType(res.type);
                  const fileType = getFileExtensionLabel(res.file_url);
                  return (
                    <tr
                      key={res.id}
                      className="hover:bg-[#f8f5fd] transition-colors"
                    >
                      <td className="py-3.5 pr-4 font-semibold text-[#1d1823]">
                        <span className="inline-flex items-center gap-1.5 rounded-lg bg-[#f4eff9] px-2.5 py-1 text-xs font-semibold text-[#662c91]">
                          <FileText className="h-3.5 w-3.5" />
                          {typeLabel}
                        </span>
                      </td>
                      <td className="py-3.5 px-4 text-[#5c5766] font-medium">
                        {res.title || `${unitTitle} ${typeLabel}`}
                      </td>
                      <td className="py-3.5 px-4 text-[#8b8794]">
                        {res.year || 'Current Cycle'}
                      </td>
                      <td className="py-3.5 px-4 text-[#8b8794] font-mono text-xs">
                        {fileType}
                      </td>
                      <td className="py-3.5 pl-4 text-right">
                        <a
                          href={res.file_url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="inline-flex items-center gap-1.5 rounded-xl bg-[#662c91] hover:bg-[#4b1f6f] px-3.5 py-2 text-xs font-semibold text-white shadow-2xs transition-colors"
                        >
                          <Download className="h-3.5 w-3.5 shrink-0" />
                          <span>PDF Download</span>
                        </a>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        ) : (
          <div className="rounded-2xl border border-dashed border-[#ebe7f0] bg-[#f8f5fd] p-6 text-xs text-[#5c5766]">
            <p className="font-semibold text-[#1d1823] mb-1">
              Assessment documents for {unitTitle} are queued for indexing.
            </p>
            <p>
              Check other units in{' '}
              <Link
                href={course.path}
                className="font-semibold text-[#662c91] hover:underline"
              >
                {courseTitle}
              </Link>{' '}
              below, or{' '}
              <Link
                href="/contact/"
                className="font-semibold text-[#662c91] hover:underline"
              >
                contact us
              </Link>{' '}
              to request this paper.
            </p>
          </div>
        )}
      </section>

      {/* Where this unit belongs table */}
      <section className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs">
        <div className="flex items-center gap-2.5 mb-4">
          <Layers className="h-5 w-5 text-[#662c91]" />
          <h2 className="text-lg font-bold text-[#1d1823]">
            Curriculum Placement
          </h2>
        </div>

        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse text-xs sm:text-sm">
            <tbody className="divide-y divide-[#ebe7f0]">
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794] w-1/3">
                  Programme
                </th>
                <td className="py-2.5 pl-4 font-medium text-[#1d1823]">
                  <Link
                    href={`/${unit.programme.slug}/`}
                    className="text-[#662c91] hover:underline"
                  >
                    {unit.programme.name}
                  </Link>
                </td>
              </tr>
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794]">
                  Department
                </th>
                <td className="py-2.5 pl-4 font-medium text-[#1d1823]">
                  <Link
                    href={`/${unit.programme.slug}/${unit.department.slug}/`}
                    className="text-[#662c91] hover:underline"
                  >
                    {deptTitle}
                  </Link>
                </td>
              </tr>
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794]">
                  Course
                </th>
                <td className="py-2.5 pl-4 font-medium text-[#1d1823]">
                  <Link
                    href={course.path}
                    className="text-[#662c91] hover:underline"
                  >
                    {courseTitle}
                  </Link>
                </td>
              </tr>
              <tr>
                <th className="py-2.5 pr-4 font-semibold text-[#8b8794]">
                  Module
                </th>
                <td className="py-2.5 pl-4 font-medium text-[#1d1823]">
                  Module {unit.module.module_number}
                  {unit.module.title &&
                  unit.module.title.toLowerCase() !== `module ${unit.module.module_number}`
                    ? ` (${unit.module.title})`
                    : ''}
                </td>
              </tr>
              {unit.unit_code && (
                <tr>
                  <th className="py-2.5 pr-4 font-semibold text-[#8b8794]">
                    Unit Code
                  </th>
                  <td className="py-2.5 pl-4 font-mono text-xs text-[#1d1823]">
                    {unit.unit_code}
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </section>

      {/* Previous / Next Unit in Module Navigation */}
      {(prevUnit || nextUnit) && (
        <nav
          aria-label="Module unit navigation"
          className="grid grid-cols-1 sm:grid-cols-2 gap-4"
        >
          {prevUnit ? (
            <Link
              href={prevUnit.path}
              className="group flex items-center gap-3 rounded-2xl border border-[#ebe7f0] bg-white p-4 hover:border-[#662c91] transition-all"
            >
              <ArrowLeft className="h-4 w-4 text-[#8b8794] group-hover:text-[#662c91] shrink-0" />
              <div className="min-w-0">
                <span className="block text-[11px] font-medium text-[#8b8794]">
                  Previous in Module {unit.module.module_number}
                </span>
                <span className="block font-bold text-xs text-[#1d1823] group-hover:text-[#662c91] truncate">
                  {toTitleCase(prevUnit.name)}
                </span>
              </div>
            </Link>
          ) : (
            <div className="hidden sm:block" />
          )}

          {nextUnit && (
            <Link
              href={nextUnit.path}
              className="group flex items-center justify-end gap-3 rounded-2xl border border-[#ebe7f0] bg-white p-4 text-right hover:border-[#662c91] transition-all"
            >
              <div className="min-w-0">
                <span className="block text-[11px] font-medium text-[#8b8794]">
                  Next in Module {unit.module.module_number}
                </span>
                <span className="block font-bold text-xs text-[#1d1823] group-hover:text-[#662c91] truncate">
                  {toTitleCase(nextUnit.name)}
                </span>
              </div>
              <ArrowRight className="h-4 w-4 text-[#8b8794] group-hover:text-[#662c91] shrink-0" />
            </Link>
          )}
        </nav>
      )}

      {/* Other units in the same module */}
      {otherUnitsInModule.length > 0 && (
        <section className="rounded-3xl border border-[#ebe7f0] bg-white p-6">
          <h2 className="text-base font-bold text-[#1d1823] mb-4">
            Other Units in Module {unit.module.module_number} of {courseTitle}
          </h2>
          <ul className="grid grid-cols-1 sm:grid-cols-2 gap-2.5">
            {otherUnitsInModule.map((other) => (
              <li key={other.id}>
                <Link
                  href={other.path}
                  className="flex items-center justify-between rounded-xl border border-[#ebe7f0] bg-[#f8f5fd] p-3 text-xs font-medium text-[#1d1823] hover:border-[#662c91] hover:text-[#662c91] transition-all"
                >
                  <span className="truncate pr-2">{toTitleCase(other.name)}</span>
                  {other.resources.length > 0 && (
                    <span className="rounded-full bg-[#f4eff9] text-[#662c91] px-2 py-0.5 text-[10px] font-bold shrink-0">
                      {other.resources.length} PDF{other.resources.length === 1 ? '' : 's'}
                    </span>
                  )}
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}

      <FAQSection faqs={faqs} heading={`Frequently Asked Questions About ${unitTitle}`} />
    </div>
  );
}
