import * as fs from 'fs';
import * as path from 'path';
import { DEFAULT_ARTICLES, DEFAULT_AUTHORS } from '../lib/blog-data';

function sqlEscape(val: string | null | undefined): string {
  if (val === null || val === undefined) return 'NULL';
  return `'${val.replace(/'/g, "''")}'`;
}

function generateBlogSeedSql(): string {
  const lines: string[] = [];
  lines.push(`-- ==============================================================================`);
  lines.push(`-- SEED SCRIPT FOR: AUTHORS & 25 LONG-FORM TVET ARTICLES (ADSENSE READY)`);
  lines.push(`-- Total Authors: ${DEFAULT_AUTHORS.length} | Total Articles: ${DEFAULT_ARTICLES.length}`);
  lines.push(`-- Target: Supabase SQL Editor (Idempotent & Transactional)`);
  lines.push(`-- ==============================================================================`);
  lines.push(`BEGIN;`);
  lines.push(``);
  lines.push(`-- 1. Upsert Authors`);

  for (const author of DEFAULT_AUTHORS) {
    lines.push(`INSERT INTO authors (name, slug, role_title, bio, avatar_url, social_links, is_verified)`);
    lines.push(
      `VALUES (${sqlEscape(author.name)}, ${sqlEscape(author.slug)}, ${sqlEscape(
        author.role_title
      )}, ${sqlEscape(author.bio)}, ${sqlEscape(author.avatar_url)}, ${sqlEscape(
        JSON.stringify(author.social_links)
      )}::jsonb, ${author.is_verified})`
    );
    lines.push(`ON CONFLICT (slug) DO UPDATE SET`);
    lines.push(`  name = EXCLUDED.name,`);
    lines.push(`  role_title = EXCLUDED.role_title,`);
    lines.push(`  bio = EXCLUDED.bio,`);
    lines.push(`  avatar_url = EXCLUDED.avatar_url,`);
    lines.push(`  social_links = EXCLUDED.social_links,`);
    lines.push(`  is_verified = EXCLUDED.is_verified;`);
    lines.push(``);
  }

  lines.push(`-- 2. Upsert 25 Editorial Articles`);
  for (const article of DEFAULT_ARTICLES) {
    const authorSlug = article.author_id.includes('editorial')
      ? 'editorial-board'
      : 'hillary-kipkorir';

    lines.push(
      `INSERT INTO articles (author_id, title, slug, excerpt, content, category, source_name, source_url, is_official_source, featured_image_url, featured_image_alt, is_cover_mockup, published, noindex, published_at)`
    );
    lines.push(
      `SELECT id, ${sqlEscape(article.title)}, ${sqlEscape(article.slug)}, ${sqlEscape(
        article.excerpt
      )}, ${sqlEscape(article.content)}, ${sqlEscape(article.category)}::article_category, ${sqlEscape(
        article.source_name
      )}, ${sqlEscape(article.source_url)}, ${article.is_official_source}, ${sqlEscape(
        article.featured_image_url
      )}, ${sqlEscape(article.featured_image_alt)}, ${article.is_cover_mockup}, ${
        article.published
      }, ${article.noindex}, ${sqlEscape(article.published_at)}::timestamptz`
    );
    lines.push(`FROM authors WHERE slug = ${sqlEscape(authorSlug)}`);
    lines.push(`ON CONFLICT (slug) DO UPDATE SET`);
    lines.push(`  title = EXCLUDED.title,`);
    lines.push(`  excerpt = EXCLUDED.excerpt,`);
    lines.push(`  content = EXCLUDED.content,`);
    lines.push(`  category = EXCLUDED.category,`);
    lines.push(`  source_name = EXCLUDED.source_name,`);
    lines.push(`  source_url = EXCLUDED.source_url,`);
    lines.push(`  is_official_source = EXCLUDED.is_official_source,`);
    lines.push(`  featured_image_url = EXCLUDED.featured_image_url,`);
    lines.push(`  featured_image_alt = EXCLUDED.featured_image_alt,`);
    lines.push(`  published = EXCLUDED.published,`);
    lines.push(`  noindex = EXCLUDED.noindex,`);
    lines.push(`  published_at = EXCLUDED.published_at;`);
    lines.push(``);
  }

  lines.push(`COMMIT;`);
  return lines.join('\n');
}

const outPath = path.resolve(__dirname, '../supabase/seeds/12_blog_articles_25_master.sql');
fs.writeFileSync(outPath, generateBlogSeedSql(), 'utf-8');
console.log(`Generated ${outPath} with ${DEFAULT_ARTICLES.length} articles.`);
