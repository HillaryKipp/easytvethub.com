import React from 'react';
import Link from 'next/link';
import { EnrichedArticle } from '@/lib/types';

export interface TocItem {
  id: string;
  text: string;
  level: number;
}

export function extractMarkdownToc(content: string): TocItem[] {
  const tocItems: TocItem[] = [];
  const lines = content.split('\n');
  lines.forEach((line) => {
    const trimmed = line.trim();
    if (trimmed.startsWith('## ')) {
      const text = trimmed.slice(3).replace(/\*\*/g, '').trim();
      const id = text.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
      if (text) tocItems.push({ id, text, level: 2 });
    } else if (trimmed.startsWith('### ')) {
      const text = trimmed.slice(4).replace(/\*\*/g, '').trim();
      const id = text.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
      if (text) tocItems.push({ id, text, level: 3 });
    }
  });
  return tocItems;
}

interface RenderMarkdownOptions {
  suggestedArticle?: EnrichedArticle | null;
  showSuggestedCallout?: boolean;
}

/**
 * Shared renderer for article markdown used by both BlogPostClient and the Admin live preview.
 */
export function renderArticleMarkdown(
  content: string,
  options: RenderMarkdownOptions = {}
): React.ReactNode[] {
  const { suggestedArticle = null, showSuggestedCallout = true } = options;
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

      if (showSuggestedCallout && paragraphCount === 2 && !insertedSuggested) {
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

  if (showSuggestedCallout && !insertedSuggested) {
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

export function renderInlineMarkdown(text: string): React.ReactNode {
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
