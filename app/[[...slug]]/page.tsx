import type { Metadata } from 'next';
import { notFound } from 'next/navigation';
import { getDirectoryData } from '@/lib/data';
import { getPublishedArticles } from '@/lib/blog-data';
import { getEnvConfig } from '@/lib/supabase';
import {
  getCourseMetaDescription,
  getCourseMetaTitle,
  getDepartmentIntro,
  getProgrammeIntro,
  getUnitMetaDescription,
  getUnitMetaTitle,
  resolveOgImage,
} from '@/lib/seo';
import { toTitleCase, truncateDescription } from '@/lib/utils';
import { HomeView } from '@/components/HomeView';
import { ProgrammeView } from '@/components/ProgrammeView';
import { DepartmentView } from '@/components/DepartmentView';
import { CourseView } from '@/components/CourseView';
import { UnitView } from '@/components/UnitView';

export const dynamicParams = false;

const RESERVED_SLUGS = new Set([
  'admin',
  'search',
  'levels',
  'about',
  'contact',
  'privacy',
  'blog',
  'authors',
  'sitemap.xml',
  'robots.txt',
]);

export async function generateStaticParams(): Promise<{ slug?: string[] }[]> {
  const data = await getDirectoryData();
  const params: { slug?: string[] }[] = [{ slug: [] }];

  const progById = new Map(data.programmes.map((p) => [p.id, p]));

  for (const prog of data.programmes) {
    if (RESERVED_SLUGS.has(prog.slug)) continue;
    params.push({ slug: [prog.slug] });
  }

  for (const dept of data.departments) {
    const prog = progById.get(dept.programme_id);
    if (!prog || RESERVED_SLUGS.has(prog.slug)) continue;
    params.push({ slug: [prog.slug, dept.slug] });

    const deptCourses = data.courses.filter((c) => c.department_id === dept.id);
    const levels = new Set(
      deptCourses.map((c) => c.level).filter((l): l is number => l !== null && l !== undefined)
    );
    for (const lvl of levels) {
      params.push({ slug: [prog.slug, dept.slug, `level-${lvl}`] });
    }
  }

  for (const course of data.courses) {
    if (RESERVED_SLUGS.has(course.programme.slug)) continue;
    params.push({
      slug: [course.programme.slug, course.department.slug, course.slug],
    });
  }

  for (const unit of data.units) {
    if (RESERVED_SLUGS.has(unit.programme.slug)) continue;
    params.push({
      slug: [
        unit.programme.slug,
        unit.department.slug,
        unit.course.slug,
        unit.slug,
      ],
    });
  }

  return params;
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug?: string[] }>;
}): Promise<Metadata> {
  const { slug = [] } = await params;
  const { siteUrl } = getEnvConfig();
  const data = await getDirectoryData();

  if (slug.length === 0) {
    return {
      title: 'TVET Papers Kenya - CDACC & KNEC Past Papers, Assessor Guides & Candidate Tools',
      description:
        'Download free Kenyan TVET past papers, CDACC assessor guides, candidate tools, cutting lists, and KNEC examination papers across Levels 3, 4, 5, and 6.',
      alternates: { canonical: `${siteUrl}/` },
      openGraph: {
        title: 'TVET Papers Kenya - CDACC & KNEC Past Papers, Assessor Guides & Candidate Tools',
        description:
          'Download free Kenyan TVET past papers, CDACC assessor guides, candidate tools, cutting lists, and KNEC examination papers across Levels 3, 4, 5, and 6.',
        url: `${siteUrl}/`,
        images: [{ url: '/og-default.png', width: 1200, height: 630, alt: 'TVET Papers Kenya' }],
      },
      twitter: {
        card: 'summary_large_image',
        title: 'TVET Papers Kenya - CDACC & KNEC Past Papers, Assessor Guides & Candidate Tools',
        description:
          'Download free Kenyan TVET past papers, CDACC assessor guides, candidate tools, cutting lists, and KNEC examination papers.',
        images: ['/og-default.png'],
      },
    };
  }

  // 1 segment: /{programme}/
  if (slug.length === 1) {
    const prog = data.programmes.find((p) => p.slug === slug[0]);
    if (!prog) return {};
    const progDepts = data.departments.filter((d) => d.programme_id === prog.id);
    const progCourses = data.courses.filter((c) => c.programme.id === prog.id);
    const title = prog.seo_title?.trim() || `${prog.name} - Departments, Courses & Past Papers | TVET Papers Kenya`;
    const desc =
      prog.seo_description?.trim() ||
      truncateDescription(getProgrammeIntro(prog, progDepts, progCourses), 160);
    const ogImg = resolveOgImage(prog.og_image_url);
    const url = `${siteUrl}/${prog.slug}/`;

    return {
      title,
      description: desc,
      alternates: { canonical: url },
      openGraph: {
        title,
        description: desc,
        url,
        images: [{ url: ogImg, width: 1200, height: 630, alt: prog.name }],
      },
      twitter: { card: 'summary_large_image', title, description: desc, images: [ogImg] },
    };
  }

  // 2 segments: /{programme}/{department}/
  if (slug.length === 2) {
    const prog = data.programmes.find((p) => p.slug === slug[0]);
    if (!prog) return {};
    const dept = data.departments.find((d) => d.programme_id === prog.id && d.slug === slug[1]);
    if (!dept) return {};
    const deptCourses = data.courses.filter((c) => c.department_id === dept.id);
    const deptTitle = toTitleCase(dept.name);
    const title =
      dept.seo_title?.trim() ||
      `${deptTitle} Courses & Past Papers (${prog.name}) | TVET Papers Kenya`;
    const desc =
      dept.seo_description?.trim() ||
      truncateDescription(getDepartmentIntro(dept, prog, deptCourses), 160);
    const ogImg = resolveOgImage(dept.og_image_url, prog.og_image_url);
    const url = `${siteUrl}/${prog.slug}/${dept.slug}/`;

    return {
      title,
      description: desc,
      alternates: { canonical: url },
      openGraph: {
        title,
        description: desc,
        url,
        images: [{ url: ogImg, width: 1200, height: 630, alt: deptTitle }],
      },
      twitter: { card: 'summary_large_image', title, description: desc, images: [ogImg] },
    };
  }

  // 3 segments: either /{programme}/{department}/level-N/ OR /{programme}/{department}/{course}/
  if (slug.length === 3) {
    const prog = data.programmes.find((p) => p.slug === slug[0]);
    if (!prog) return {};
    const dept = data.departments.find((d) => d.programme_id === prog.id && d.slug === slug[1]);
    if (!dept) return {};

    const levelMatch = slug[2].match(/^level-(\d+)$/);
    if (levelMatch) {
      const lvl = parseInt(levelMatch[1], 10);
      const deptTitle = toTitleCase(dept.name);
      const title = `Level ${lvl} Courses in ${deptTitle} (${prog.name}) | TVET Papers Kenya`;
      const desc = truncateDescription(
        `Explore all accredited Level ${lvl} courses in the ${deptTitle} under ${prog.name}. Download modular units, past papers, assessor guides, and candidate tools.`,
        160
      );
      const ogImg = resolveOgImage(dept.og_image_url, prog.og_image_url);
      const url = `${siteUrl}/${prog.slug}/${dept.slug}/level-${lvl}/`;

      return {
        title,
        description: desc,
        alternates: { canonical: url },
        openGraph: {
          title,
          description: desc,
          url,
          images: [{ url: ogImg, width: 1200, height: 630, alt: title }],
        },
        twitter: { card: 'summary_large_image', title, description: desc, images: [ogImg] },
      };
    }

    const course = data.courses.find(
      (c) => c.department_id === dept.id && c.slug === slug[2]
    );
    if (!course) return {};

    const title = getCourseMetaTitle(course);
    const desc = getCourseMetaDescription(course);
    const ogImg = resolveOgImage(course.og_image_url, dept.og_image_url, prog.og_image_url);
    const url = `${siteUrl}${course.path}`;
    const isThinCourse = course.units.length === 0;

    return {
      title,
      description: desc,
      alternates: { canonical: url },
      ...(isThinCourse ? { robots: { index: false, follow: true } } : {}),
      openGraph: {
        title,
        description: desc,
        url,
        images: [{ url: ogImg, width: 1200, height: 630, alt: toTitleCase(course.name) }],
      },
      twitter: { card: 'summary_large_image', title, description: desc, images: [ogImg] },
    };
  }

  // 4 segments: /{programme}/{department}/{course}/{unit}/
  if (slug.length === 4) {
    const unit = data.units.find(
      (u) =>
        u.programme.slug === slug[0] &&
        u.department.slug === slug[1] &&
        u.course.slug === slug[2] &&
        u.slug === slug[3]
    );
    if (!unit) return {};

    const title = getUnitMetaTitle(unit);
    const desc = getUnitMetaDescription(unit);
    const ogImg = resolveOgImage(
      unit.og_image_url,
      unit.course.og_image_url,
      unit.department.og_image_url,
      unit.programme.og_image_url
    );
    // Duplicate units: if a unit has canonical_unit_id, its canonical URL points to the canonical unit's page
    const canonicalUrl = `${siteUrl}${unit.canonicalPath || unit.path}`;
    const isThinUnit = unit.resources.length === 0;

    return {
      title,
      description: desc,
      alternates: { canonical: canonicalUrl },
      ...(isThinUnit ? { robots: { index: false, follow: true } } : {}),
      openGraph: {
        title,
        description: desc,
        url: `${siteUrl}${unit.path}`,
        images: [{ url: ogImg, width: 1200, height: 630, alt: toTitleCase(unit.name) }],
      },
      twitter: { card: 'summary_large_image', title, description: desc, images: [ogImg] },
    };
  }

  return {};
}

export default async function CatchAllDirectoryPage({
  params,
}: {
  params: Promise<{ slug?: string[] }>;
}) {
  const { slug = [] } = await params;
  const data = await getDirectoryData();

  if (slug.length === 0) {
    const articles = await getPublishedArticles();
    return <HomeView data={data} articles={articles.slice(0, 3)} />;
  }

  // 1 segment: /{programme}/
  if (slug.length === 1) {
    const prog = data.programmes.find((p) => p.slug === slug[0]);
    if (!prog) notFound();
    const depts = data.departments.filter((d) => d.programme_id === prog.id);
    const courses = data.courses.filter((c) => c.programme.id === prog.id);
    return <ProgrammeView programme={prog} departments={depts} courses={courses} />;
  }

  // 2 segments: /{programme}/{department}/
  if (slug.length === 2) {
    const prog = data.programmes.find((p) => p.slug === slug[0]);
    if (!prog) notFound();
    const dept = data.departments.find((d) => d.programme_id === prog.id && d.slug === slug[1]);
    if (!dept) notFound();
    const courses = data.courses.filter((c) => c.department_id === dept.id);
    return <DepartmentView programme={prog} department={dept} courses={courses} />;
  }

  // 3 segments: /{programme}/{department}/level-N/ OR /{programme}/{department}/{course}/
  if (slug.length === 3) {
    const prog = data.programmes.find((p) => p.slug === slug[0]);
    if (!prog) notFound();
    const dept = data.departments.find((d) => d.programme_id === prog.id && d.slug === slug[1]);
    if (!dept) notFound();

    const levelMatch = slug[2].match(/^level-(\d+)$/);
    if (levelMatch) {
      const lvl = parseInt(levelMatch[1], 10);
      const deptCourses = data.courses.filter((c) => c.department_id === dept.id);
      return (
        <DepartmentView
          programme={prog}
          department={dept}
          courses={deptCourses}
          filterLevel={lvl}
        />
      );
    }

    const course = data.courses.find(
      (c) => c.department_id === dept.id && c.slug === slug[2]
    );
    if (!course) notFound();
    return <CourseView course={course} allCourses={data.courses} />;
  }

  // 4 segments: /{programme}/{department}/{course}/{unit}/
  if (slug.length === 4) {
    const unit = data.units.find(
      (u) =>
        u.programme.slug === slug[0] &&
        u.department.slug === slug[1] &&
        u.course.slug === slug[2] &&
        u.slug === slug[3]
    );
    if (!unit) notFound();
    const course = data.courses.find((c) => c.id === unit.course_id);
    if (!course) notFound();
    return <UnitView unit={unit} course={course} allUnits={data.units} />;
  }

  notFound();
}
