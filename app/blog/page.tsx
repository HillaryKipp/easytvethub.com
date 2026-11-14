import type { Metadata } from 'next';
import Link from 'next/link';
import {
  BookOpen,
  Calendar,
  Clock,
  ShieldCheck,
  ArrowRight,
  Sparkles,
  Zap,
} from 'lucide-react';
import { getPublishedArticles } from '@/lib/blog-data';
import { getEnvConfig } from '@/lib/supabase';
import { ArticleCategory, EnrichedArticle } from '@/lib/types';
import { Breadcrumbs } from '@/components/Breadcrumbs';

export const dynamic = 'force-static';

export async function generateMetadata(): Promise<Metadata> {
  const { siteUrl } = getEnvConfig();
  const title = 'TVET News, Assessment Circulars & Revision Guides | EasyTVET';
  const description =
    'Verified TVET CDACC & KNEC circulars, examination timetables, practical candidate tool guides, and CBET revision strategies authored by Kenyan technical educators.';

  return {
    title,
    description,
    alternates: { canonical: `${siteUrl}/blog/` },
    openGraph: {
      title,
      description,
      url: `${siteUrl}/blog/`,
      type: 'website',
    },
  };
}

function categoryBadge(category: ArticleCategory) {
  switch (category) {
    case 'exam_news':
      return {
        label: 'Exam News',
        classes: 'bg-[#fbeced] text-[#bd1e2c] border border-rose-200',
      };
    case 'revision_guide':
      return {
        label: 'Revision Guide',
        classes: 'bg-[#f4eff9] text-[#662c91] border border-purple-200',
      };
    case 'curriculum_update':
      return {
        label: 'CBET Curriculum',
        classes: 'bg-sky-50 text-sky-700 border border-sky-200',
      };
    case 'course_spotlight':
      return {
        label: 'Course Spotlight',
        classes: 'bg-amber-50 text-amber-800 border border-amber-200',
      };
    default:
      return {
        label: 'Editorial',
        classes: 'bg-[#f7f5fa] text-[#5c5766] border border-[#ebe7f0]',
      };
  }
}

export default async function BlogIndexPage() {
  const articles = await getPublishedArticles();
  const featuredArticle = articles[0];
  const remainingArticles = articles.slice(1);

  const breadcrumbs = [
    { name: 'Free Resources & Blog', path: '/blog/' },
  ];

  return (
    <div className="py-2 sm:py-6">
      {/* Outer rounded card container matching screenshot aesthetic */}
      <div className="bg-white rounded-3xl border border-[#ebe7f0] shadow-sm p-6 sm:p-10 lg:p-12">
        <Breadcrumbs items={breadcrumbs} />

        {/* Clean Header Bar */}
        <div className="flex flex-col md:flex-row md:items-end justify-between gap-4 pb-8 mb-8 border-b border-[#ebe7f0]">
          <div>
            <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold bg-[#f4eff9] text-[#662c91] border border-purple-200 mb-3">
              <Sparkles className="h-3.5 w-3.5" />
              Verified TVET Editorial &amp; News Desk
            </div>
            <h1 className="text-2xl sm:text-4xl font-extrabold tracking-tight text-[#1d1823]">
              Free Resources, Circulars &amp; Revision Guides
            </h1>
            <p className="mt-2 text-sm sm:text-base text-[#5c5766] max-w-2xl leading-relaxed">
              Official KNEC &amp; CDACC notices, past paper breakdowns, candidate tool guides, and revision strategies authored by verified Kenyan technical educators.
            </p>
          </div>

          <div className="flex items-center gap-2">
            <Link
              href="/search/"
              className="inline-flex items-center gap-2 rounded-xl bg-[#662c91] hover:bg-[#4b1f6f] px-4 py-2.5 text-xs font-semibold text-white shadow-xs transition-colors"
            >
              <Zap className="h-4 w-4" />
              Search Directory
            </Link>
          </div>
        </div>

        {/* Featured Article Banner Card */}
        {featuredArticle && (
          <div className="mb-12 rounded-2xl border border-[#ebe7f0] bg-[#f8f5fd] p-6 lg:p-8 hover:shadow-md transition-shadow">
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 items-center">
              {featuredArticle.featured_image_url && (
                <div className="lg:col-span-5">
                  <Link href={featuredArticle.path} className="block overflow-hidden rounded-xl border border-[#ebe7f0]">
                    <img
                      src={featuredArticle.featured_image_url}
                      alt={featuredArticle.featured_image_alt || featuredArticle.title}
                      className="w-full aspect-[16/10] object-cover hover:scale-105 transition-transform duration-300"
                    />
                  </Link>
                </div>
              )}
              <div className={featuredArticle.featured_image_url ? 'lg:col-span-7' : 'lg:col-span-12'}>
                <div className="flex items-center gap-2 mb-3">
                  <span
                    className={`inline-block px-2.5 py-0.5 rounded-full text-[11px] font-semibold ${
                      categoryBadge(featuredArticle.category).classes
                    }`}
                  >
                    {categoryBadge(featuredArticle.category).label}
                  </span>
                  <span className="text-xs text-[#8b8794]">
                    {featuredArticle.reading_time_minutes} min read
                  </span>
                </div>

                <h2 className="text-xl sm:text-2xl font-bold text-[#1d1823] hover:text-[#662c91] transition-colors leading-snug">
                  <Link href={featuredArticle.path}>{featuredArticle.title}</Link>
                </h2>

                <p className="mt-3 text-sm text-[#5c5766] leading-relaxed line-clamp-3">
                  {featuredArticle.excerpt}
                </p>

                <div className="mt-5 flex items-center justify-between pt-4 border-t border-[#ebe7f0]/80">
                  <div className="flex items-center gap-2.5 text-xs text-[#5c5766]">
                    {featuredArticle.author.avatar_url && (
                      <img
                        src={featuredArticle.author.avatar_url}
                        alt={featuredArticle.author.name}
                        className="h-6 w-6 rounded-full object-cover"
                      />
                    )}
                    <span className="font-semibold text-[#1d1823]">
                      {featuredArticle.author.name}
                    </span>
                  </div>

                  <Link
                    href={featuredArticle.path}
                    className="inline-flex items-center gap-1 text-xs font-semibold text-[#662c91] hover:underline"
                  >
                    Read Guide <ArrowRight className="h-3.5 w-3.5" />
                  </Link>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Other Articles Grid */}
        <div>
          <h2 className="text-lg font-bold text-[#1d1823] mb-6 flex items-center gap-2">
            <BookOpen className="h-4 w-4 text-[#662c91]" />
            <span>All Articles &amp; Assessment Circulars</span>
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {remainingArticles.map((article) => {
              const badge = categoryBadge(article.category);
              return (
                <article
                  key={article.id}
                  className="rounded-2xl border border-[#ebe7f0] bg-white p-5 flex flex-col justify-between hover:border-[#662c91]/60 hover:shadow-md transition-all group"
                >
                  <div>
                    {article.featured_image_url && (
                      <Link href={article.path} className="block overflow-hidden rounded-xl mb-4 border border-[#ebe7f0]">
                        <img
                          src={article.featured_image_url}
                          alt={article.featured_image_alt || article.title}
                          className="w-full aspect-[16/10] object-cover group-hover:scale-105 transition-transform duration-300"
                        />
                      </Link>
                    )}

                    <div className="flex items-center gap-2 mb-2.5">
                      <span className={`inline-block px-2 py-0.5 rounded-full text-[10px] font-semibold ${badge.classes}`}>
                        {badge.label}
                      </span>
                      <span className="text-[11px] text-[#8b8794]">
                        {article.reading_time_minutes} min read
                      </span>
                    </div>

                    <h3 className="text-base font-bold text-[#1d1823] group-hover:text-[#662c91] transition-colors leading-snug">
                      <Link href={article.path}>{article.title}</Link>
                    </h3>

                    <p className="mt-2 text-xs text-[#5c5766] leading-relaxed line-clamp-2">
                      {article.excerpt}
                    </p>
                  </div>

                  <div className="mt-5 pt-3 border-t border-[#ebe7f0] flex items-center justify-between text-xs">
                    <span className="text-[#8b8794] text-[11px]">
                      {article.author.name}
                    </span>
                    <Link
                      href={article.path}
                      className="font-semibold text-[#662c91] group-hover:underline inline-flex items-center gap-1"
                    >
                      Read <ArrowRight className="h-3 w-3" />
                    </Link>
                  </div>
                </article>
              );
            })}
          </div>
        </div>
      </div>
    </div>
  );
}
