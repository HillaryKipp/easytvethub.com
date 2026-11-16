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

interface TocItem {
  id: string;
  text: string;
  level: number;
}

export function BlogPostClient({
  article,
  suggestedArticle,
}: {
  article: EnrichedArticle;
  suggestedArticle?: EnrichedArticle | null;
}) {
  const [activeId, setActiveId] = useState<string>('');

  // Extract headings from markdown content
  const tocItems: TocItem[] = [];
  const lines = article.content.split('\n');
  lines.forEach((line) => {
    const trimmed = line.trim();
    if (trimmed.startsWith('## ')) {
      const text = trimmed.slice(3).replace(/\*\*/g, '').trim();
      const id = text.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
      tocItems.push({ id, text, level: 2 });
    } else if (trimmed.startsWith('### ')) {
      const text = trimmed.slice(4).replace(/\*\*/g, '').trim();
      const id = text.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
      tocItems.push({ id, text, level: 3 });
    }
  });

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
                  Get a custom revision roadmap and free counseling from accredited assessors.
                </p>
                <Link
                  href="/search/"
                  className="mt-4 block w-full rounded-xl bg-[#662c91] hover:bg-[#4b1f6f] px-4 py-2.5 text-xs font-semibold text-white shadow-xs transition-colors"
                >
                  Get Your Free Roadmap
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
              {renderArticleMarkdown(article.content, suggestedArticle)}
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

/**
 * Custom renderer for article markdown matching screenshot's elements:
 * - Headings with sparkle icon: ✦ Section Title
 * - Suggested box: Suggested: Link
 * - Bold bullet list items
 */
function renderArticleMarkdown(
  content: string,
  suggestedArticle?: EnrichedArticle | null
) {
  const lines = content.split('\n');
  const elements: React.ReactNode[] = [];
  let inList = false;
  let listItems: string[] = [];
  let key = 0;
  let paragraphCount = 0;
  let insertedSuggested = false;

  function flushList() {
    if (inList && listItems.length > 0) {
      elements.push(
        <ul key={`ul-${key++}`} className="my-4 space-y-2.5 pl-2">
          {listItems.map((li, i) => (
            <li key={`li-${i}`} className="flex items-start gap-2.5 text-[#5c5766] text-sm leading-relaxed">
              <span className="text-[#662c91] font-bold mt-0.5">•</span>
              <div>{renderInlineMarkdown(li)}</div>
            </li>
          ))}
        </ul>
      );
      listItems = [];
      inList = false;
    }
  }

  for (let i = 0; i < lines.length; i++) {
    const rawLine = lines[i];
    const line = rawLine.trim();

    if (!line) {
      flushList();
      continue;
    }

    // Heading 2
    if (line.startsWith('## ')) {
      flushList();
      const text = line.slice(3).replace(/\*\*/g, '').trim();
      const id = text.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
      elements.push(
        <h2
          key={`h2-${key++}`}
          id={id}
          className="mt-10 mb-4 pt-2 text-xl sm:text-2xl font-bold tracking-tight text-[#1d1823] scroll-mt-28"
        >
          {text}
        </h2>
      );
    } else if (line.startsWith('### ')) {
      flushList();
      const text = line.slice(4).replace(/\*\*/g, '').trim();
      const id = text.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
      elements.push(
        <h3
          key={`h3-${key++}`}
          id={id}
          className="mt-6 mb-3 text-lg font-bold text-[#1d1823] scroll-mt-28"
        >
          {text}
        </h3>
      );
    } else if (line.startsWith('- ') || line.startsWith('* ')) {
      inList = true;
      listItems.push(line.slice(2));
    } else if (/^\d+\.\s/.test(line)) {
      flushList();
      const numMatch = line.match(/^\d+\./)?.[0];
      const text = line.replace(/^\d+\.\s/, '');
      elements.push(
        <div key={`ol-${key++}`} className="my-2.5 flex items-start gap-3 text-sm text-[#5c5766] leading-relaxed">
          <span className="font-bold text-[#662c91] shrink-0">{numMatch}</span>
          <div>{renderInlineMarkdown(text)}</div>
        </div>
      );
    } else if (line.startsWith('|') && line.endsWith('|')) {
      flushList();
      if (line.includes('---')) continue;
      const cells = line
        .split('|')
        .slice(1, -1)
        .map((c) => c.trim());
      elements.push(
        <div
          key={`table-row-${key++}`}
          className="grid grid-cols-2 sm:grid-cols-4 gap-3 py-2.5 px-4 border-b border-[#ebe7f0] text-xs sm:text-sm bg-white rounded-lg my-1 shadow-2xs"
        >
          {cells.map((cell, cIdx) => (
            <div key={`cell-${cIdx}`} className="font-medium text-[#1d1823]">
              {renderInlineMarkdown(cell)}
            </div>
          ))}
        </div>
      );
    } else if (line.startsWith('> ')) {
      flushList();
      elements.push(
        <blockquote
          key={`bq-${key++}`}
          className="my-5 border-l-4 border-[#662c91] pl-4 py-2 italic text-[#5c5766] bg-[#f8f5fd] rounded-r-xl text-sm"
        >
          {renderInlineMarkdown(line.slice(2))}
        </blockquote>
      );
    } else {
      flushList();
      paragraphCount++;
      elements.push(
        <p key={`p-${key++}`} className="my-4 text-[15px] sm:text-base leading-relaxed text-[#5c5766]">
          {renderInlineMarkdown(line)}
        </p>
      );

      // Insert the "Suggested:" callout box exactly matching the screenshot after paragraph 2
      if (paragraphCount === 2 && !insertedSuggested) {
        insertedSuggested = true;
        const targetTitle = suggestedArticle
          ? suggestedArticle.title
          : 'How to Download TVET CDACC & KNEC Past Papers 2026';
        const targetPath = suggestedArticle ? suggestedArticle.path : '/levels/level-6/';

        elements.push(
          <div
            key="suggested-callout"
            className="my-6 rounded-r-xl border-l-4 border-[#662c91] bg-[#f8f5fd] p-4 text-sm"
          >
            <span className="font-bold text-[#1d1823] mr-2">Suggested:</span>
            <Link
              href={targetPath}
              className="font-semibold text-[#662c91] hover:underline"
            >
              {targetTitle}
            </Link>
          </div>
        );
      }
    }
  }

  flushList();

  // If article has fewer than 2 paragraphs, ensure suggested box is still shown
  if (!insertedSuggested) {
    const targetTitle = suggestedArticle
      ? suggestedArticle.title
      : 'How to Download TVET CDACC & KNEC Past Papers 2026';
    const targetPath = suggestedArticle ? suggestedArticle.path : '/levels/level-6/';

    elements.push(
      <div
        key="suggested-callout-end"
        className="my-6 rounded-r-xl border-l-4 border-[#662c91] bg-[#f8f5fd] p-4 text-sm"
      >
        <span className="font-bold text-[#1d1823] mr-2">Suggested:</span>
        <Link
          href={targetPath}
          className="font-semibold text-[#662c91] hover:underline"
        >
          {targetTitle}
        </Link>
      </div>
    );
  }

  return elements;
}

function renderInlineMarkdown(text: string): React.ReactNode {
  const parts = text.split(/(\*\*.*?\*\*|`.*?`|\[[^\]]+\]\([^)]+\))/g);
  return parts.map((part, i) => {
    if (part.startsWith('**') && part.endsWith('**')) {
      return (
        <strong key={i} className="font-semibold text-[#1d1823]">
          {part.slice(2, -2)}
        </strong>
      );
    }
    if (part.startsWith('`') && part.endsWith('`')) {
      return (
        <code
          key={i}
          className="px-1.5 py-0.5 rounded bg-[#f4eff9] text-xs font-mono text-[#662c91] border border-[#ebe7f0]"
        >
          {part.slice(1, -1)}
        </code>
      );
    }
    const linkMatch = part.match(/^\[([^\]]+)\]\(([^)]+)\)$/);
    if (linkMatch) {
      const [, label, href] = linkMatch;
      if (href.startsWith('/')) {
        return (
          <Link
            key={i}
            href={href}
            className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
          >
            {label}
          </Link>
        );
      }
      return (
        <a
          key={i}
          href={href}
          target="_blank"
          rel="noopener noreferrer"
          className="font-semibold text-[#662c91] underline hover:text-[#4b1f6f]"
        >
          {label}
        </a>
      );
    }
    return part;
  });
}
