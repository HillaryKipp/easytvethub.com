import type { Metadata } from 'next';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import {
  CheckCircle2,
  Calendar,
  Clock,
  BookOpen,
  ArrowRight,
  ExternalLink,
  ShieldCheck,
  Globe,
} from 'lucide-react';
import { getAuthorBySlug, getAuthors, getArticlesByAuthorId } from '@/lib/blog-data';
import { getEnvConfig } from '@/lib/supabase';
import { buildAuthorSchema } from '@/lib/jsonld';
import { Breadcrumbs } from '@/components/Breadcrumbs';

export const dynamicParams = false;

export async function generateStaticParams(): Promise<{ slug: string }[]> {
  const authors = await getAuthors();
  return authors.map((a) => ({ slug: a.slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const author = await getAuthorBySlug(slug);
  const { siteUrl } = getEnvConfig();

  if (!author) {
    return { title: 'Author Not Found | EasyTVET' };
  }

  const fullUrl = `${siteUrl}/authors/${author.slug}/`;

  return {
    title: `${author.name} - ${author.role_title} | EasyTVET`,
    description: author.bio,
    alternates: { canonical: fullUrl },
    openGraph: {
      title: `${author.name} - TVET Author & Curriculum Reviewer`,
      description: author.bio,
      url: fullUrl,
      type: 'profile',
      images: author.avatar_url ? [{ url: author.avatar_url }] : [],
    },
  };
}

export default async function AuthorProfilePage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const author = await getAuthorBySlug(slug);

  if (!author) {
    notFound();
  }

  const articles = await getArticlesByAuthorId(author.id);
  const authorSchema = buildAuthorSchema(author);

  const breadcrumbs = [
    { name: 'About & Authors', path: '/about/' },
    { name: author.name, path: `/authors/${author.slug}/` },
  ];

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(authorSchema) }}
      />

      <div className="py-2 sm:py-6">
        <div className="bg-white rounded-3xl border border-[#ebe7f0] shadow-sm p-6 sm:p-10 lg:p-12">
          <Breadcrumbs items={breadcrumbs} />

          {/* Author Profile Header */}
          <section className="mt-4 rounded-2xl bg-[#f8f5fd] border border-[#ebe7f0] p-6 sm:p-8">
            <div className="flex flex-col sm:flex-row items-start sm:items-center gap-6">
              {author.avatar_url ? (
                <img
                  src={author.avatar_url}
                  alt={author.name}
                  className="h-24 w-24 rounded-2xl object-cover ring-2 ring-[#662c91]/20 shadow-xs shrink-0"
                />
              ) : (
                <div className="h-24 w-24 rounded-2xl bg-gradient-to-br from-[#662c91] to-[#4b1f6f] text-white flex items-center justify-center font-bold text-2xl shadow-xs shrink-0">
                  {author.name[0]}
                </div>
              )}

              <div className="flex-1">
                <div className="flex flex-wrap items-center gap-2">
                  <h1 className="text-xl sm:text-2xl font-bold tracking-tight text-[#1d1823]">
                    {author.name}
                  </h1>
                  {author.is_verified && (
                    <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2.5 py-0.5 rounded-full bg-[#f4eff9] text-[#662c91] border border-purple-200">
                      <CheckCircle2 className="h-3 w-3" />
                      Verified TVET Contributor
                    </span>
                  )}
                </div>

                <div className="mt-1 text-xs font-semibold text-[#662c91]">
                  {author.role_title}
                </div>

                <p className="mt-3 text-xs sm:text-sm text-[#5c5766] leading-relaxed">
                  {author.bio}
                </p>

                {/* Social Profiles */}
                <div className="mt-4 flex flex-wrap items-center gap-4 pt-3 border-t border-[#ebe7f0] text-xs font-semibold">
                  {author.social_links.linkedin && (
                    <a
                      href={author.social_links.linkedin}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-[#5c5766] hover:text-[#662c91] transition-colors"
                    >
                      <ExternalLink className="h-3.5 w-3.5" />
                      LinkedIn Profile
                    </a>
                  )}
                  {author.social_links.twitter && (
                    <a
                      href={author.social_links.twitter}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-[#5c5766] hover:text-[#662c91] transition-colors"
                    >
                      <ExternalLink className="h-3.5 w-3.5" />
                      X / Twitter
                    </a>
                  )}
                  {author.social_links.website && (
                    <a
                      href={author.social_links.website}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="inline-flex items-center gap-1 text-[#5c5766] hover:text-[#662c91] transition-colors"
                    >
                      <Globe className="h-3.5 w-3.5" />
                      Personal Website
                    </a>
                  )}
                </div>
              </div>
            </div>
          </section>

          {/* Articles Authored */}
          <section className="mt-10">
            <div className="flex items-center justify-between mb-6">
              <h2 className="text-base sm:text-lg font-bold text-[#1d1823] flex items-center gap-2">
                <BookOpen className="h-4 w-4 text-[#662c91]" />
                Guides &amp; Articles Authored ({articles.length})
              </h2>
            </div>

            {articles.length === 0 ? (
              <div className="rounded-2xl border border-dashed border-[#ebe7f0] p-8 text-center text-xs text-[#8b8794]">
                No articles published under this author profile yet.
              </div>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                {articles.map((article) => {
                  const pubDate = article.published_at
                    ? new Date(article.published_at).toLocaleDateString('en-KE', {
                        year: 'numeric',
                        month: 'short',
                        day: 'numeric',
                      })
                    : null;

                  return (
                    <article
                      key={article.id}
                      className="flex flex-col bg-white rounded-2xl border border-[#ebe7f0] p-5 shadow-xs hover:border-[#662c91]/60 transition-all group"
                    >
                      <div className="flex items-center justify-between text-xs text-[#8b8794] mb-2">
                        <span className="font-semibold text-[#662c91] uppercase tracking-wider text-[10px]">
                          {article.category.replace('_', ' ')}
                        </span>
                        <span className="flex items-center gap-1">
                          <Clock className="h-3 w-3" />
                          {article.reading_time_minutes} min
                        </span>
                      </div>

                      <h3 className="text-sm font-bold text-[#1d1823] group-hover:text-[#662c91] transition-colors leading-snug">
                        <Link href={article.path}>{article.title}</Link>
                      </h3>

                      <p className="mt-2 text-xs text-[#5c5766] line-clamp-2 leading-relaxed flex-1">
                        {article.excerpt}
                      </p>

                      <div className="mt-4 pt-3 border-t border-[#ebe7f0] flex items-center justify-between text-xs">
                        {pubDate && (
                          <span className="text-[#8b8794] text-[11px] flex items-center gap-1">
                            <Calendar className="h-3 w-3" />
                            {pubDate}
                          </span>
                        )}
                        <Link
                          href={article.path}
                          className="font-semibold text-[#662c91] group-hover:underline flex items-center gap-1"
                        >
                          Read Guide <ArrowRight className="h-3 w-3" />
                        </Link>
                      </div>
                    </article>
                  );
                })}
              </div>
            )}
          </section>
        </div>
      </div>
    </>
  );
}
