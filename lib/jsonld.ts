import { getEnvConfig } from './supabase';
import { Author, EnrichedArticle, EnrichedCourse, EnrichedUnit, FAQItem } from './types';
import { formatResourceType, getAutoResourceTitle, toTitleCase } from './utils';

export interface BreadcrumbItem {
  name: string;
  path: string;
}

export function buildWebsiteAndOrgSchema() {
  const { siteUrl } = getEnvConfig();
  return [
    {
      '@context': 'https://schema.org',
      '@type': 'WebSite',
      '@id': `${siteUrl}/#website`,
      name: 'TVET Papers Kenya',
      url: `${siteUrl}/`,
      description:
        'Public directory of Kenyan TVET courses, modular units, past papers, assessor guides, candidate tools, and cutting lists.',
      potentialAction: {
        '@type': 'SearchAction',
        target: {
          '@type': 'EntryPoint',
          urlTemplate: `${siteUrl}/search/?q={search_term_string}`,
        },
        'query-input': 'required name=search_term_string',
      },
    },
    {
      '@context': 'https://schema.org',
      '@type': 'Organization',
      '@id': `${siteUrl}/#organization`,
      name: 'TVET Papers Kenya',
      url: `${siteUrl}/`,
      logo: {
        '@type': 'ImageObject',
        url: `${siteUrl}/og-default.png`,
        width: 1200,
        height: 630,
      },
    },
  ];
}

export function buildBreadcrumbSchema(items: BreadcrumbItem[]) {
  const { siteUrl } = getEnvConfig();
  return {
    '@context': 'https://schema.org',
    '@type': 'BreadcrumbList',
    itemListElement: items.map((item, idx) => ({
      '@type': 'ListItem',
      position: idx + 1,
      name: item.name,
      item: `${siteUrl}${item.path.startsWith('/') ? item.path : `/${item.path}`}`,
    })),
  };
}

export function buildCollectionPageSchema(
  title: string,
  description: string,
  path: string,
  items: { name: string; path: string }[]
) {
  const { siteUrl } = getEnvConfig();
  const fullUrl = `${siteUrl}${path}`;
  return {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: title,
    description,
    url: fullUrl,
    mainEntity: {
      '@type': 'ItemList',
      numberOfItems: items.length,
      itemListElement: items.map((it, idx) => ({
        '@type': 'ListItem',
        position: idx + 1,
        name: it.name,
        url: `${siteUrl}${it.path}`,
      })),
    },
  };
}

export function buildCourseSchema(course: EnrichedCourse, description: string) {
  const { siteUrl } = getEnvConfig();
  const fullUrl = `${siteUrl}${course.path}`;
  const schema: Record<string, unknown> = {
    '@context': 'https://schema.org',
    '@type': 'Course',
    name: toTitleCase(course.name),
    description,
    url: fullUrl,
    provider: {
      '@type': 'Organization',
      name: `${course.programme.name} — ${toTitleCase(course.department.name)}`,
      sameAs: `${siteUrl}/${course.programme.slug}/${course.department.slug}/`,
    },
  };

  if (course.level) {
    schema.educationalLevel = `Level ${course.level}`;
  }

  return schema;
}

export function buildLearningResourceSchema(unit: EnrichedUnit, description: string) {
  const { siteUrl } = getEnvConfig();
  const fullUrl = `${siteUrl}${unit.path}`;
  const unitTitle = toTitleCase(unit.name);

  return {
    '@context': 'https://schema.org',
    '@type': 'LearningResource',
    name: unitTitle,
    description,
    url: fullUrl,
    learningResourceType: 'Assessment & Competency Unit',
    educationalLevel: unit.course.level ? `Level ${unit.course.level}` : 'TVET',
    isPartOf: {
      '@type': 'Course',
      name: toTitleCase(unit.course.name),
      url: `${siteUrl}/${unit.programme.slug}/${unit.department.slug}/${unit.course.slug}/`,
    },
    dateModified: unit.updated_at,
    hasPart: unit.resources.map((r) => ({
      '@type': 'LearningResource',
      name: r.title?.trim() || `${unitTitle} - ${getAutoResourceTitle(r.type)}`,
      learningResourceType: formatResourceType(r.type),
      url: r.file_url,
      ...(r.year ? { copyrightYear: r.year } : {}),
    })),
  };
}

export function buildFAQPageSchema(faqs: FAQItem[]) {
  if (!faqs || faqs.length === 0) return null;
  return {
    '@context': 'https://schema.org',
    '@type': 'FAQPage',
    mainEntity: faqs.map((faq) => ({
      '@type': 'Question',
      name: faq.question,
      acceptedAnswer: {
        '@type': 'Answer',
        text: faq.answer,
      },
    })),
  };
}

export function buildAuthorSchema(author: Author) {
  const { siteUrl } = getEnvConfig();
  const sameAs: string[] = [];
  if (author.social_links.linkedin) sameAs.push(author.social_links.linkedin);
  if (author.social_links.twitter) sameAs.push(author.social_links.twitter);
  if (author.social_links.website) sameAs.push(author.social_links.website);

  return {
    '@context': 'https://schema.org',
    '@type': 'Person',
    '@id': `${siteUrl}/authors/${author.slug}/#person`,
    name: author.name,
    jobTitle: author.role_title,
    description: author.bio,
    url: `${siteUrl}/authors/${author.slug}/`,
    ...(author.avatar_url ? { image: author.avatar_url } : {}),
    ...(sameAs.length > 0 ? { sameAs } : {}),
    worksFor: {
      '@type': 'Organization',
      name: 'TVET Papers Kenya',
      url: `${siteUrl}/`,
    },
  };
}

export function buildArticleSchema(article: EnrichedArticle) {
  const { siteUrl } = getEnvConfig();
  const fullUrl = `${siteUrl}${article.path}`;

  const isNews = article.category === 'exam_news' || article.category === 'curriculum_update';
  const type = isNews ? 'NewsArticle' : 'BlogPosting';

  return {
    '@context': 'https://schema.org',
    '@type': type,
    mainEntityOfPage: {
      '@type': 'WebPage',
      '@id': fullUrl,
    },
    headline: article.title,
    description: article.excerpt,
    url: fullUrl,
    datePublished: article.published_at || article.created_at,
    dateModified: article.updated_at,
    author: {
      '@type': 'Person',
      name: article.author.name,
      jobTitle: article.author.role_title,
      url: `${siteUrl}/authors/${article.author.slug}/`,
    },
    publisher: {
      '@type': 'Organization',
      name: 'TVET Papers Kenya',
      url: `${siteUrl}/`,
      logo: {
        '@type': 'ImageObject',
        url: `${siteUrl}/og-default.png`,
      },
    },
    ...(article.featured_image_url
      ? {
          image: {
            '@type': 'ImageObject',
            url: article.featured_image_url,
            caption: article.featured_image_alt || article.title,
          },
        }
      : {}),
    articleSection: article.category.replace('_', ' '),
  };
}
