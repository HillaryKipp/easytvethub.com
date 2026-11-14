import type { MetadataRoute } from 'next';
import { getDirectoryData } from '@/lib/data';
import { getAuthors, getPublishedArticles } from '@/lib/blog-data';
import { getEnvConfig } from '@/lib/supabase';

export const dynamic = 'force-static';

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const { siteUrl } = getEnvConfig();
  const data = await getDirectoryData();
  const now = new Date();

  const entries: MetadataRoute.Sitemap = [
    {
      url: `${siteUrl}/`,
      lastModified: now,
      changeFrequency: 'daily',
      priority: 1.0,
    },
    {
      url: `${siteUrl}/search/`,
      lastModified: now,
      changeFrequency: 'weekly',
      priority: 0.6,
    },
    {
      url: `${siteUrl}/about/`,
      lastModified: now,
      changeFrequency: 'monthly',
      priority: 0.5,
    },
    {
      url: `${siteUrl}/contact/`,
      lastModified: now,
      changeFrequency: 'monthly',
      priority: 0.5,
    },
    {
      url: `${siteUrl}/privacy/`,
      lastModified: now,
      changeFrequency: 'yearly',
      priority: 0.3,
    },
    {
      url: `${siteUrl}/blog/`,
      lastModified: now,
      changeFrequency: 'daily',
      priority: 0.8,
    },
  ];

  // Cross-department level hubs
  for (const lvl of data.levels) {
    entries.push({
      url: `${siteUrl}/levels/level-${lvl}/`,
      lastModified: now,
      changeFrequency: 'weekly',
      priority: 0.8,
    });
  }

  // Programmes
  for (const prog of data.programmes) {
    entries.push({
      url: `${siteUrl}/${prog.slug}/`,
      lastModified: new Date(prog.updated_at || now),
      changeFrequency: 'weekly',
      priority: 0.9,
    });
  }

  // Departments & department level listings
  const progById = new Map(data.programmes.map((p) => [p.id, p]));
  for (const dept of data.departments) {
    const prog = progById.get(dept.programme_id);
    if (!prog) continue;
    entries.push({
      url: `${siteUrl}/${prog.slug}/${dept.slug}/`,
      lastModified: new Date(dept.updated_at || now),
      changeFrequency: 'weekly',
      priority: 0.85,
    });

    const deptCourses = data.courses.filter((c) => c.department_id === dept.id);
    const deptLevels = new Set(
      deptCourses.map((c) => c.level).filter((l): l is number => l !== null && l !== undefined)
    );
    for (const lvl of deptLevels) {
      entries.push({
        url: `${siteUrl}/${prog.slug}/${dept.slug}/level-${lvl}/`,
        lastModified: new Date(dept.updated_at || now),
        changeFrequency: 'weekly',
        priority: 0.75,
      });
    }
  }

  // Courses (Thin-content guard: exclude courses with ZERO units)
  for (const course of data.courses) {
    if (course.units.length === 0) continue;
    entries.push({
      url: `${siteUrl}${course.path}`,
      lastModified: new Date(course.updated_at || now),
      changeFrequency: 'weekly',
      priority: 0.8,
    });
  }

  // Units (Thin-content guard: exclude units with ZERO resources, and exclude duplicate units that point to a canonical_unit_id)
  for (const unit of data.units) {
    if (unit.resources.length === 0) continue;
    if (unit.canonical_unit_id) continue;
    entries.push({
      url: `${siteUrl}${unit.path}`,
      lastModified: new Date(unit.updated_at || now),
      changeFrequency: 'weekly',
      priority: 0.7,
    });
  }

  // Articles / Blog Posts (Filter out unpublished & noindex)
  const articles = await getPublishedArticles();
  for (const article of articles) {
    if (article.noindex) continue;
    entries.push({
      url: `${siteUrl}${article.path}`,
      lastModified: new Date(article.updated_at || article.published_at || now),
      changeFrequency: 'weekly',
      priority: 0.8,
    });
  }

  // Authors
  const authors = await getAuthors();
  for (const author of authors) {
    entries.push({
      url: `${siteUrl}/authors/${author.slug}/`,
      lastModified: new Date(author.updated_at || now),
      changeFrequency: 'monthly',
      priority: 0.6,
    });
  }

  return entries;
}
