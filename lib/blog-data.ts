import { getSupabaseClient } from './supabase';
import { Article, Author, EnrichedArticle } from './types';
import { ARTICLES_PART_1 } from './articles-part1';
import { ARTICLES_PART_2 } from './articles-part2';
import { ARTICLES_PART_3 } from './articles-part3';

export const DEFAULT_AUTHORS: Author[] = [
  {
    id: 'author-hillary-kipkorir-001',
    name: 'Hillary Kipkorir',
    slug: 'hillary-kipkorir',
    role_title: 'TVET Curriculum Specialist & Technical Assessor',
    bio: 'Experienced educator and curriculum specialist with a decade of expertise in Kenyan technical vocational training, TVET CDACC Competency-Based Education and Training (CBET) standards, and national technical assessment methodologies.',
    avatar_url: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=300&q=80',
    social_links: {
      linkedin: 'https://www.linkedin.com/in/hillary-kipkorir',
      twitter: 'https://twitter.com/easytvethub',
    },
    is_verified: true,
    created_at: '2026-01-15T08:00:00Z',
    updated_at: '2026-11-15T10:00:00Z',
  },
  {
    id: 'author-editorial-team-002',
    name: 'EasyTVET Editorial Board',
    slug: 'editorial-board',
    role_title: 'TVET Quality Assurance & Verification Desk',
    bio: 'The independent verification team at EasyTVET Hub Kenya, dedicated to screening official KNEC and TVET-CDACC assessment circulars, cross-referencing national qualification frameworks, and maintaining past paper accuracy.',
    avatar_url: 'https://images.unsplash.com/photo-1557804506-669a67965ba0?auto=format&fit=crop&w=300&q=80',
    social_links: {
      website: 'https://easytvethub.com/about/',
    },
    is_verified: true,
    created_at: '2026-01-15T08:00:00Z',
    updated_at: '2026-11-15T10:00:00Z',
  },
];

export const DEFAULT_ARTICLES: Article[] = [
  ...ARTICLES_PART_1,
  ...ARTICLES_PART_2,
  ...ARTICLES_PART_3,
];

function calculateReadingTime(text: string): number {
  const wordsPerMinute = 200;
  const wordCount = text.trim().split(/\s+/).length;
  return Math.max(1, Math.ceil(wordCount / wordsPerMinute));
}

export async function getAuthors(): Promise<Author[]> {
  const supabase = getSupabaseClient();
  try {
    const { data, error } = await supabase
      .from('authors')
      .select('*')
      .order('created_at', { ascending: true });

    if (!error && data && data.length > 0) {
      const dbSlugs = new Set(data.map((a: Author) => a.slug));
      const merged = [...(data as Author[])];
      for (const def of DEFAULT_AUTHORS) {
        if (!dbSlugs.has(def.slug)) {
          merged.push(def);
        }
      }
      return merged;
    }
  } catch {
    // Fall back to default authors if table doesn't exist yet
  }
  return DEFAULT_AUTHORS;
}

export async function getAuthorBySlug(slug: string): Promise<Author | null> {
  const authors = await getAuthors();
  return authors.find((a) => a.slug === slug) || null;
}

export async function getAuthorById(id: string): Promise<Author | null> {
  const authors = await getAuthors();
  return authors.find((a) => a.id === id) || null;
}

export async function getAllArticles(): Promise<Article[]> {
  const supabase = getSupabaseClient();
  try {
    const { data, error } = await supabase
      .from('articles')
      .select('*')
      .order('published_at', { ascending: false });

    if (!error && data && data.length > 0) {
      const dbBySlug = new Map<string, Article>();
      for (const row of data as Article[]) {
        dbBySlug.set(row.slug, row);
      }

      const merged: Article[] = [];
      // Merge DEFAULT_ARTICLES with DB articles, preferring our enriched long-form content if DB has an older short version
      for (const def of DEFAULT_ARTICLES) {
        const existing = dbBySlug.get(def.slug);
        if (existing) {
          const useContent =
            existing.content && existing.content.length > def.content.length
              ? existing.content
              : def.content;
          merged.push({
            ...existing,
            title: existing.title || def.title,
            excerpt: existing.excerpt || def.excerpt,
            content: useContent,
          });
          dbBySlug.delete(def.slug);
        } else {
          merged.push(def);
        }
      }

      // Append any custom articles created in Supabase that aren't in DEFAULT_ARTICLES
      for (const custom of dbBySlug.values()) {
        merged.push(custom);
      }

      return merged.sort(
        (a, b) =>
          new Date(b.published_at || b.updated_at).getTime() -
          new Date(a.published_at || a.updated_at).getTime()
      );
    }
  } catch {
    // Fall back to default articles if table doesn't exist yet
  }
  return [...DEFAULT_ARTICLES].sort(
    (a, b) =>
      new Date(b.published_at || b.updated_at).getTime() -
      new Date(a.published_at || a.updated_at).getTime()
  );
}

export async function getPublishedArticles(): Promise<EnrichedArticle[]> {
  const allArticles = await getAllArticles();
  const authors = await getAuthors();
  const authorMap = new Map(authors.map((a) => [a.id, a]));
  const authorBySlug = new Map(authors.map((a) => [a.slug, a]));

  const fallbackAuthor = DEFAULT_AUTHORS[0];

  return allArticles
    .filter((a) => a.published)
    .map((article) => {
      const author =
        authorMap.get(article.author_id) ||
        (article.author_id.includes('editorial')
          ? authorBySlug.get('editorial-board')
          : authorBySlug.get('hillary-kipkorir')) ||
        fallbackAuthor;
      return {
        ...article,
        author,
        path: `/blog/${article.slug}/`,
        reading_time_minutes: calculateReadingTime(article.content),
      };
    });
}

export async function getArticleBySlug(slug: string): Promise<EnrichedArticle | null> {
  const articles = await getPublishedArticles();
  return articles.find((a) => a.slug === slug) || null;
}

export async function getArticlesByAuthorId(authorId: string): Promise<EnrichedArticle[]> {
  const articles = await getPublishedArticles();
  return articles.filter((a) => a.author_id === authorId || a.author.id === authorId);
}
