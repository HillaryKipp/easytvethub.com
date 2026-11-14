import type { Metadata } from 'next';
import { notFound } from 'next/navigation';
import { getArticleBySlug, getPublishedArticles } from '@/lib/blog-data';
import { getEnvConfig } from '@/lib/supabase';
import { buildArticleSchema } from '@/lib/jsonld';
import { BlogPostClient } from '@/components/BlogPostClient';

export const dynamicParams = false;

export async function generateStaticParams(): Promise<{ slug: string }[]> {
  const articles = await getPublishedArticles();
  return articles.map((a) => ({ slug: a.slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const article = await getArticleBySlug(slug);
  const { siteUrl } = getEnvConfig();

  if (!article) {
    return { title: 'Article Not Found | EasyTVET Kenya' };
  }

  const fullUrl = `${siteUrl}${article.path}`;

  return {
    title: `${article.title} | EasyTVET Kenya`,
    description: article.excerpt,
    alternates: { canonical: fullUrl },
    robots: {
      index: !article.noindex,
      follow: true,
    },
    openGraph: {
      title: article.title,
      description: article.excerpt,
      url: fullUrl,
      type: 'article',
      publishedTime: article.published_at || article.created_at,
      modifiedTime: article.updated_at,
      authors: [`${siteUrl}/authors/${article.author.slug}/`],
      ...(article.featured_image_url
        ? {
            images: [
              {
                url: article.featured_image_url,
                alt: article.featured_image_alt || article.title,
              },
            ],
          }
        : {}),
    },
    twitter: {
      card: 'summary_large_image',
      title: article.title,
      description: article.excerpt,
      images: article.featured_image_url ? [article.featured_image_url] : [],
    },
  };
}

export default async function BlogPostPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const article = await getArticleBySlug(slug);

  if (!article) {
    notFound();
  }

  const allArticles = await getPublishedArticles();
  const suggestedArticle = allArticles.find((a) => a.slug !== article.slug) || null;

  const articleSchema = buildArticleSchema(article);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(articleSchema) }}
      />
      <BlogPostClient article={article} suggestedArticle={suggestedArticle} />
    </>
  );
}
