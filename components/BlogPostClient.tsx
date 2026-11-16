'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import {
  Clock,
  Calendar,
  CheckCircle2,
  ExternalLink,
  FileCheck2,
  ArrowLeft,
  Share2,
  Bookmark,
  Zap,
  BookOpen,
} from 'lucide-react';
import { EnrichedArticle } from '@/lib/types';
import { Breadcrumbs } from '@/components/Breadcrumbs';
import {
  TocItem,
  extractMarkdownToc,
  renderArticleMarkdown,
} from '@/components/ArticleMarkdownRenderer';

export function BlogPostClient({
  article,
  suggestedArticle,
}: {
  article: EnrichedArticle;
  suggestedArticle?: EnrichedArticle | null;
}) {
  const [activeId, setActiveId] = useState<string>('');

  // Extract headings from markdown content
  const tocItems: TocItem[] = extractMarkdownToc(article.content);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setActiveId(entry.target.id);
          }
        });
      },
      { rootMargin: '-80px 0px -60% 0px', threshold: 0.1 }
    );

    const headingEls = document.querySelectorAll('h2[id], h3[id]');
    headingEls.forEach((el) => observer.observe(el));

    // Default to first item if none active
    if (!activeId && tocItems.length > 0) {
      setActiveId(tocItems[0].id);
    }

    return () => observer.disconnect();
  }, [tocItems]);

  const formattedPubDate = article.published_at
    ? new Date(article.published_at).toLocaleDateString('en-KE', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
      })
    : null;

  return (
    <div className="py-2 sm:py-6">
      {/* Outer rounded card wrapper matching the clean aesthetic from screenshot */}
      <div className="bg-white rounded-3xl border border-[#ebe7f0] shadow-sm p-6 sm:p-10 lg:p-12">
        <div className="mb-6">
          <Breadcrumbs
            items={[
              { name: 'Free Resources & Blog', path: '/blog/' },
              { name: article.title, path: article.path },
            ]}
          />
        </div>

        {/* Two-Column Layout */}
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-12">
          {/* LEFT SIDEBAR: Promo Lead Box & Table of Content */}
          <aside className="lg:col-span-4 xl:col-span-3">
            <div className="lg:sticky lg:top-24 space-y-8">
              {/* Promo / Lead Box matching the screenshot */}
              <div className="rounded-2xl bg-[#f8f5fd] border border-[#ebe7f0] p-6 text-center shadow-xs">
                {/* Purple Icon Badge */}
                <div className="mx-auto mb-3 flex h-10 w-10 items-center justify-center rounded-xl bg-[#662c91] text-white shadow-xs">
                  <Zap className="h-5 w-5 fill-white/20" />
                </div>
                <h3 className="text-sm font-bold text-[#1d1823] leading-snug">
                  Where to start your TVET prep?
                </h3>
                <p className="mt-1.5 text-xs text-[#5c5766] leading-relaxed">
                  Browse our free resources and read our blog posts from accredited assessors.
                </p>
                <Link
                  href="/blog/"
                  className="mt-4 block w-full rounded-xl bg-[#662c91] hover:bg-[#4b1f6f] px-4 py-2.5 text-xs font-semibold text-white shadow-xs transition-colors"
                >
                  Roadmap
                </Link>
              </div>

              {/* Table of Content matching the screenshot */}
              {tocItems.length > 0 && (
                <div>
                  <h4 className="text-sm font-bold text-[#1d1823] tracking-wide mb-3">
                    Table of Content
                  </h4>
                  <nav aria-label="Table of contents" className="space-y-1.5 text-xs">
                    {tocItems.map((item) => {
                      const isActive = activeId === item.id;
                      return (
                        <div key={item.id} className="relative">
                          {isActive ? (
                            <div className="border-l-[3px] border-[#662c91] pl-3 py-1 font-semibold text-[#662c91]">
                              <a
                                href={`#${item.id}`}
                                onClick={(e) => {
                                  e.preventDefault();
                                  document.getElementById(item.id)?.scrollIntoView({
                                    behavior: 'smooth',
                                  });
                                  setActiveId(item.id);
                                }}
                                className="hover:underline block leading-tight"
                              >
                                {item.text}
                              </a>
                            </div>
                          ) : (
                            <a
                              href={`#${item.id}`}
                              onClick={(e) => {
                                e.preventDefault();
                                document.getElementById(item.id)?.scrollIntoView({
                                  behavior: 'smooth',
                                });
                                setActiveId(item.id);
                              }}
                              className="flex items-start gap-2 py-1 text-[#5c5766] hover:text-[#662c91] transition-colors leading-tight"
                            >
                              <span className="text-[#8b8794] select-none">-</span>
                              <span className="flex-1">{item.text}</span>
                            </a>
                          )}
                        </div>
                      );
                    })}
                  </nav>
                </div>
              )}

              {/* Quick TVET Qualification Hubs */}
              <div className="pt-4 border-t border-[#ebe7f0] hidden lg:block">
                <span className="text-[11px] font-bold uppercase tracking-wider text-[#8b8794] block mb-2">
                  Qualification Levels
                </span>
                <div className="flex flex-wrap gap-1.5">
                  <Link
                    href="/levels/level-6/"
                    className="px-2.5 py-1 rounded-lg bg-[#f4eff9] text-[#662c91] text-[11px] font-medium hover:bg-[#662c91] hover:text-white transition-colors"
                  >
                    Level 6 Diploma
                  </Link>
                  <Link
                    href="/levels/level-5/"
                    className="px-2.5 py-1 rounded-lg bg-[#f4eff9] text-[#662c91] text-[11px] font-medium hover:bg-[#662c91] hover:text-white transition-colors"
                  >
                    Level 5 Craft
                  </Link>
                  <Link
                    href="/levels/level-4/"
                    className="px-2.5 py-1 rounded-lg bg-[#f4eff9] text-[#662c91] text-[11px] font-medium hover:bg-[#662c91] hover:text-white transition-colors"
                  >
                    Level 4 Artisan
                  </Link>
                  <Link
                    href="/levels/level-3/"
                    className="px-2.5 py-1 rounded-lg bg-[#f4eff9] text-[#662c91] text-[11px] font-medium hover:bg-[#662c91] hover:text-white transition-colors"
                  >
                    Level 3 NSC
                  </Link>
                </div>
              </div>
            </div>
          </aside>

          {/* RIGHT COLUMN: Main Article Content */}
          <main className="lg:col-span-8 xl:col-span-9 min-w-0">
            {/* Title matching screenshot bold styling */}
            <h1 className="text-2xl sm:text-3xl lg:text-4xl font-extrabold tracking-tight text-[#1d1823] leading-[1.2] mb-6">
              {article.title}
            </h1>

            {/* Author Byline & Meta */}
            <div className="flex flex-wrap items-center justify-between gap-3 pb-6 mb-6 border-b border-[#ebe7f0] text-xs text-[#5c5766]">
              <div className="flex items-center gap-2.5">
                {article.author.avatar_url ? (
                  <img
                    src={article.author.avatar_url}
                    alt={article.author.name}
                    className="h-8 w-8 rounded-full object-cover ring-2 ring-[#662c91]/20"
                  />
                ) : (
                  <div className="h-8 w-8 rounded-full bg-[#f4eff9] text-[#662c91] flex items-center justify-center font-bold text-xs">
                    {article.author.name[0]}
                  </div>
                )}
                <div>
                  <span className="font-semibold text-[#1d1823]">{article.author.name}</span>
                  <span className="text-[#8b8794] ml-2">({article.author.role_title})</span>
                </div>
              </div>

              <div className="flex items-center gap-4 text-[#8b8794]">
                {formattedPubDate && (
                  <span className="flex items-center gap-1">
                    <Calendar className="h-3.5 w-3.5" />
                    {formattedPubDate}
                  </span>
                )}
                <span className="flex items-center gap-1">
                  <Clock className="h-3.5 w-3.5" />
                  {article.reading_time_minutes} min read
                </span>
              </div>
            </div>

            {/* Featured Image matching rounded-2xl banner from screenshot */}
            {article.featured_image_url && (
              <div className="rounded-2xl overflow-hidden border border-[#ebe7f0] shadow-xs mb-8">
                <img
                  src={article.featured_image_url}
                  alt={article.featured_image_alt || article.title}
                  className="w-full aspect-[16/9] object-cover"
                />
              </div>
            )}

            {/* Article Body Content */}
            <div className="text-[#1d1823] text-base leading-relaxed space-y-5">
              {renderArticleMarkdown(article.content, { suggestedArticle })}
            </div>

            {/* Official Source Reference Citation if available */}
            {article.source_name && (
              <div className="mt-8 rounded-xl border border-[#ebe7f0] bg-[#f8f5fd] p-4 flex items-start gap-3 text-xs">
                <FileCheck2 className="h-4 w-4 text-[#662c91] shrink-0 mt-0.5" />
                <div className="text-[#5c5766]">
                  <span className="font-semibold text-[#1d1823]">
                    Official TVET Reference:
                  </span>{' '}
                  {article.source_name}
                  {article.source_url && (
                    <a
                      href={article.source_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="ml-2 font-semibold text-[#662c91] hover:underline inline-flex items-center gap-1"
                    >
                      View Source Reference <ExternalLink className="h-3 w-3" />
                    </a>
                  )}
                </div>
              </div>
            )}

            {/* Author Profile Footer Card */}
            <div className="mt-12 rounded-2xl border border-[#ebe7f0] bg-[#f8f5fd] p-6 sm:p-8">
              <div className="flex flex-col sm:flex-row items-start sm:items-center gap-5">
                {article.author.avatar_url && (
                  <img
                    src={article.author.avatar_url}
                    alt={article.author.name}
                    className="h-14 w-14 rounded-full object-cover ring-2 ring-[#662c91]/30 shrink-0"
                  />
                )}
                <div className="flex-1">
                  <div className="text-[11px] font-bold text-[#662c91] uppercase tracking-wider">
                    Assessor &amp; Curriculum Reviewer
                  </div>
                  <h3 className="text-base font-bold text-[#1d1823] flex items-center gap-1.5 mt-0.5">
                    <Link
                      href={`/authors/${article.author.slug}/`}
                      className="hover:text-[#662c91] transition-colors"
                    >
                      {article.author.name}
                    </Link>
                    {article.author.is_verified && (
                      <CheckCircle2 className="h-4 w-4 text-[#662c91]" />
                    )}
                  </h3>
                  <p className="text-xs text-[#5c5766] mt-1 leading-relaxed">
                    {article.author.bio}
                  </p>
                  <div className="mt-3 flex items-center gap-3 text-xs">
                    <Link
                      href={`/authors/${article.author.slug}/`}
                      className="font-semibold text-[#662c91] hover:underline"
                    >
                      View Profile &amp; Published Guides &rarr;
                    </Link>
                  </div>
                </div>
              </div>
            </div>

            {/* Back Navigation Bar */}
            <div className="mt-8 pt-6 border-t border-[#ebe7f0] flex items-center justify-between text-xs font-semibold">
              <Link
                href="/blog/"
                className="inline-flex items-center gap-1 text-[#5c5766] hover:text-[#662c91] transition-colors"
              >
                <ArrowLeft className="h-4 w-4" />
                All Guides &amp; Circulars
              </Link>
              <Link
                href="/levels/level-6/"
                className="text-[#662c91] hover:underline"
              >
                Browse Level 6 Past Papers &rarr;
              </Link>
            </div>
          </main>
        </div>
      </div>
    </div>
  );
}
