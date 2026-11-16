'use client';

import { useRef, useState } from 'react';
import {
  Bold,
  Heading2,
  Heading3,
  List,
  ListOrdered,
  Quote,
  Link2,
  Table,
  FileText,
  Eye,
  PenLine,
  Columns2,
  ChevronDown,
} from 'lucide-react';
import { ArticleCategory } from '@/lib/types';
import {
  extractMarkdownToc,
  renderArticleMarkdown,
} from '@/components/ArticleMarkdownRenderer';

interface ArticleBodyEditorProps {
  value: string;
  onChange: (nextValue: string) => void;
  category: ArticleCategory;
}

type EditorMode = 'write' | 'split' | 'preview';

const ARTICLE_TEMPLATES: {
  id: ArticleCategory;
  label: string;
  body: string;
}[] = [
  {
    id: 'revision_guide',
    label: 'Revision Guide Template',
    body: `## Overview
Briefly explain what this guide covers and who it is meant for (e.g. Level 5 or Level 6 candidates).

## Key Exam Topics to Focus On
- **Topic 1:** Short explanation of what examiners look for.
- **Topic 2:** Practical skills or calculations frequently tested.
- **Topic 3:** Common theory questions from past papers.

## Common Mistakes Candidates Make
> Tip: Always read the assessment rubric carefully before starting practical tasks.

1. Skipping units of measurement or safety steps.
2. Leaving out labeled diagrams where required.

## Quick Revision Checklist
- Download and practice at least 3 recent past papers.
- Review the marking scheme for marks allocation.`,
  },
  {
    id: 'exam_news',
    label: 'Exam News & Circular Template',
    body: `## Summary of the Announcement
State the main update clearly in 2–3 sentences, including the issuing body (KNEC, CDACC, or TVETA).

## Key Dates & Deadlines
| Milestone | Date | Who It Applies To |
| --- | --- | --- |
| Registration Opens | TBC | All TVET Candidates |
| Assessment Window | TBC | Level 3 – Level 6 |

## What Candidates Should Do Next
1. Confirm your registration details with your institution's examination office.
2. Keep a copy of your official timetable and national ID ready.

> Note: Always verify exam dates with your college registrar or official board circular.`,
  },
  {
    id: 'course_spotlight',
    label: 'Course Spotlight Template',
    body: `## Course Overview
Introduce the programme, its demand in Kenya's job market, and what trainees learn.

## Entry Requirements & KNQF Level
- **KNQF Level:** Level 5 / Level 6
- **Minimum Entry:** KCSE mean grade or artisan progression pathway.

## Core Units & Practical Skills
- **Core Unit 1:** Practical competencies covered.
- **Core Unit 2:** Workshop and industry attachment expectations.

## Career Pathways
Graduates can work in industry roles, self-employment, or progress to higher KNQF levels.`,
  },
];

const STARTER_TABLE = `| Topic | What to Prepare | Priority |
| --- | --- | --- |
| Practical Task | Tools & safety gear | High |
| Theory Paper | Past paper questions | High |`;

export function ArticleBodyEditor({
  value,
  onChange,
  category,
}: ArticleBodyEditorProps) {
  const textareaRef = useRef<HTMLTextAreaElement | null>(null);
  const [mode, setMode] = useState<EditorMode>('write');
  const [showLinkBar, setShowLinkBar] = useState(false);
  const [linkText, setLinkText] = useState('');
  const [linkUrl, setLinkUrl] = useState('');
  const [showTemplates, setShowTemplates] = useState(false);

  const wordCount = value.trim() ? value.trim().split(/\s+/).length : 0;
  const readingMinutes = Math.max(1, Math.ceil(wordCount / 200));
  const tocItems = extractMarkdownToc(value);

  function updateSelection(
    transform: (
      text: string,
      start: number,
      end: number
    ) => { nextText: string; nextStart: number; nextEnd: number }
  ) {
    const el = textareaRef.current;
    const start = el ? el.selectionStart : value.length;
    const end = el ? el.selectionEnd : value.length;
    const { nextText, nextStart, nextEnd } = transform(value, start, end);
    onChange(nextText);

    requestAnimationFrame(() => {
      if (!textareaRef.current) return;
      textareaRef.current.focus();
      textareaRef.current.setSelectionRange(nextStart, nextEnd);
    });
  }

  function wrapInline(prefix: string, suffix: string, placeholder: string) {
    updateSelection((text, start, end) => {
      const selected = text.slice(start, end);
      const inner = selected || placeholder;
      const inserted = `${prefix}${inner}${suffix}`;
      const nextText = text.slice(0, start) + inserted + text.slice(end);
      return {
        nextText,
        nextStart: start + prefix.length,
        nextEnd: start + prefix.length + inner.length,
      };
    });
  }

  function prefixSelectedLines(
    modeType: 'h2' | 'h3' | 'ul' | 'ol' | 'quote'
  ) {
    updateSelection((text, start, end) => {
      const lineStart = text.lastIndexOf('\n', start - 1) + 1;
      const nextNewline = text.indexOf('\n', end);
      const lineEnd = nextNewline === -1 ? text.length : nextNewline;
      const block = text.slice(lineStart, lineEnd);
      const lines = block.split('\n');

      const transformed = lines
        .map((line, idx) => {
          const clean = line.replace(/^(#{2,3}\s+|[-*]\s+|\d+\.\s+|>\s+)/, '');
          if (modeType === 'h2') return `## ${clean || 'Section Title'}`;
          if (modeType === 'h3') return `### ${clean || 'Subheading'}`;
          if (modeType === 'ul') return `- ${clean || 'List item'}`;
          if (modeType === 'ol') return `${idx + 1}. ${clean || 'Step'}`;
          return `> ${clean || 'Important note for readers'}`;
        })
        .join('\n');

      const nextText = text.slice(0, lineStart) + transformed + text.slice(lineEnd);
      return {
        nextText,
        nextStart: lineStart,
        nextEnd: lineStart + transformed.length,
      };
    });
  }

  function insertBlock(block: string) {
    updateSelection((text, start, end) => {
      const before = text.slice(0, start);
      const after = text.slice(end);
      const needsLeadingNewlines = before.length > 0 && !before.endsWith('\n\n')
        ? before.endsWith('\n')
          ? '\n'
          : '\n\n'
        : '';
      const needsTrailingNewlines = after.length > 0 && !after.startsWith('\n') ? '\n\n' : '';
      const insertion = `${needsLeadingNewlines}${block}${needsTrailingNewlines}`;
      const nextText = before + insertion + after;
      const cursorPos = before.length + insertion.length;
      return { nextText, nextStart: cursorPos, nextEnd: cursorPos };
    });
  }

  function handleOpenLinkBar() {
    const el = textareaRef.current;
    if (el) {
      const selected = value.slice(el.selectionStart, el.selectionEnd).trim();
      if (selected) setLinkText(selected);
    }
    setShowLinkBar((prev) => !prev);
  }

  function handleInsertLink() {
    const label = linkText.trim() || 'Click here';
    const url = linkUrl.trim() || '/levels/level-6/';
    updateSelection((text, start, end) => {
      const mdLink = `[${label}](${url})`;
      const nextText = text.slice(0, start) + mdLink + text.slice(end);
      const cursor = start + mdLink.length;
      return { nextText, nextStart: cursor, nextEnd: cursor };
    });
    setLinkText('');
    setLinkUrl('');
    setShowLinkBar(false);
  }

  function handleApplyTemplate(templateBody: string) {
    setShowTemplates(false);
    if (!value.trim()) {
      onChange(templateBody);
      return;
    }
    if (confirm('Replace current article body with this template? Click Cancel to append it at the end instead.')) {
      onChange(templateBody);
    } else {
      onChange(`${value.trimEnd()}\n\n${templateBody}`);
    }
  }

  function handleKeyDown(e: React.KeyboardEvent<HTMLTextAreaElement>) {
    if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === 'b') {
      e.preventDefault();
      wrapInline('**', '**', 'important text');
    } else if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === 'k') {
      e.preventDefault();
      handleOpenLinkBar();
    }
  }

  const suggestedTemplate =
    ARTICLE_TEMPLATES.find((t) => t.id === category) || ARTICLE_TEMPLATES[0];

  return (
    <div className="space-y-2">
      {/* Header Row: Label + Word Count + Mode Tabs */}
      <div className="flex flex-wrap items-center justify-between gap-2">
        <div className="flex items-center gap-2">
          <label className="block text-xs font-bold uppercase text-slate-500">
            Article Body
          </label>
          <span className="text-[11px] text-slate-400">
            {wordCount} {wordCount === 1 ? 'word' : 'words'} · ~{readingMinutes} min read
          </span>
        </div>

        <div className="inline-flex rounded-lg border border-slate-200 dark:border-slate-700 bg-slate-50 dark:bg-slate-800 p-0.5 text-xs">
          <button
            type="button"
            onClick={() => setMode('write')}
            className={`inline-flex items-center gap-1 px-2.5 py-1 rounded-md font-semibold cursor-pointer transition-colors ${
              mode === 'write'
                ? 'bg-white dark:bg-slate-900 text-emerald-700 dark:text-emerald-400 shadow-2xs'
                : 'text-slate-600 dark:text-slate-300 hover:text-slate-900'
            }`}
          >
            <PenLine className="h-3 w-3" /> Write
          </button>
          <button
            type="button"
            onClick={() => setMode('split')}
            className={`hidden md:inline-flex items-center gap-1 px-2.5 py-1 rounded-md font-semibold cursor-pointer transition-colors ${
              mode === 'split'
                ? 'bg-white dark:bg-slate-900 text-emerald-700 dark:text-emerald-400 shadow-2xs'
                : 'text-slate-600 dark:text-slate-300 hover:text-slate-900'
            }`}
          >
            <Columns2 className="h-3 w-3" /> Split
          </button>
          <button
            type="button"
            onClick={() => setMode('preview')}
            className={`inline-flex items-center gap-1 px-2.5 py-1 rounded-md font-semibold cursor-pointer transition-colors ${
              mode === 'preview'
                ? 'bg-white dark:bg-slate-900 text-emerald-700 dark:text-emerald-400 shadow-2xs'
                : 'text-slate-600 dark:text-slate-300 hover:text-slate-900'
            }`}
          >
            <Eye className="h-3 w-3" /> Preview
          </button>
        </div>
      </div>

      {/* Formatting Toolbar (shown in Write & Split modes) */}
      {mode !== 'preview' && (
        <div className="rounded-t-xl border border-b-0 border-slate-300 dark:border-slate-700 bg-slate-50 dark:bg-slate-800/70 px-2.5 py-2 space-y-2">
          <div className="flex flex-wrap items-center gap-1">
            <button
              type="button"
              onClick={() => prefixSelectedLines('h2')}
              title="Main Section Heading (also added to Table of Contents)"
              className="inline-flex items-center gap-1 rounded-lg px-2 py-1 text-xs font-semibold text-slate-700 dark:text-slate-200 hover:bg-white dark:hover:bg-slate-700 border border-transparent hover:border-slate-200 cursor-pointer"
            >
              <Heading2 className="h-3.5 w-3.5 text-emerald-600" />
              <span>Section</span>
            </button>
            <button
              type="button"
              onClick={() => prefixSelectedLines('h3')}
              title="Subheading"
              className="inline-flex items-center gap-1 rounded-lg px-2 py-1 text-xs font-semibold text-slate-700 dark:text-slate-200 hover:bg-white dark:hover:bg-slate-700 border border-transparent hover:border-slate-200 cursor-pointer"
            >
              <Heading3 className="h-3.5 w-3.5 text-emerald-600" />
              <span>Subheading</span>
            </button>

            <span className="h-4 w-px bg-slate-300 dark:bg-slate-700 mx-1" />

            <button
              type="button"
              onClick={() => wrapInline('**', '**', 'important text')}
              title="Bold (Ctrl+B)"
              className="inline-flex items-center gap-1 rounded-lg px-2 py-1 text-xs font-semibold text-slate-700 dark:text-slate-200 hover:bg-white dark:hover:bg-slate-700 border border-transparent hover:border-slate-200 cursor-pointer"
            >
              <Bold className="h-3.5 w-3.5" />
              <span>Bold</span>
            </button>
            <button
              type="button"
              onClick={() => prefixSelectedLines('ul')}
              title="Bullet List"
              className="inline-flex items-center gap-1 rounded-lg px-2 py-1 text-xs font-semibold text-slate-700 dark:text-slate-200 hover:bg-white dark:hover:bg-slate-700 border border-transparent hover:border-slate-200 cursor-pointer"
            >
              <List className="h-3.5 w-3.5" />
              <span>Bullets</span>
            </button>
            <button
              type="button"
              onClick={() => prefixSelectedLines('ol')}
              title="Numbered List"
              className="inline-flex items-center gap-1 rounded-lg px-2 py-1 text-xs font-semibold text-slate-700 dark:text-slate-200 hover:bg-white dark:hover:bg-slate-700 border border-transparent hover:border-slate-200 cursor-pointer"
            >
              <ListOrdered className="h-3.5 w-3.5" />
              <span>Steps</span>
            </button>
            <button
              type="button"
              onClick={() => prefixSelectedLines('quote')}
              title="Highlighted Tip / Callout Box"
              className="inline-flex items-center gap-1 rounded-lg px-2 py-1 text-xs font-semibold text-slate-700 dark:text-slate-200 hover:bg-white dark:hover:bg-slate-700 border border-transparent hover:border-slate-200 cursor-pointer"
            >
              <Quote className="h-3.5 w-3.5" />
              <span>Tip Box</span>
            </button>

            <span className="h-4 w-px bg-slate-300 dark:bg-slate-700 mx-1" />

            <button
              type="button"
              onClick={handleOpenLinkBar}
              title="Insert Link (Ctrl+K)"
              className={`inline-flex items-center gap-1 rounded-lg px-2 py-1 text-xs font-semibold border cursor-pointer ${
                showLinkBar
                  ? 'bg-emerald-50 text-emerald-700 border-emerald-300'
                  : 'text-slate-700 dark:text-slate-200 hover:bg-white dark:hover:bg-slate-700 border-transparent hover:border-slate-200'
              }`}
            >
              <Link2 className="h-3.5 w-3.5" />
              <span>Link</span>
            </button>
            <button
              type="button"
              onClick={() => insertBlock(STARTER_TABLE)}
              title="Insert 3-Column Table"
              className="inline-flex items-center gap-1 rounded-lg px-2 py-1 text-xs font-semibold text-slate-700 dark:text-slate-200 hover:bg-white dark:hover:bg-slate-700 border border-transparent hover:border-slate-200 cursor-pointer"
            >
              <Table className="h-3.5 w-3.5" />
              <span>Table</span>
            </button>

            {/* Starter Templates Dropdown */}
            <div className="relative ml-auto">
              <button
                type="button"
                onClick={() => setShowTemplates((prev) => !prev)}
                className="inline-flex items-center gap-1 rounded-lg bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 px-2.5 py-1 text-xs font-semibold text-emerald-700 dark:text-emerald-400 hover:border-emerald-400 cursor-pointer"
              >
                <FileText className="h-3.5 w-3.5" />
                <span>Templates</span>
                <ChevronDown className="h-3 w-3" />
              </button>

              {showTemplates && (
                <div className="absolute right-0 mt-1 w-60 rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900 shadow-lg z-20 p-1.5 space-y-1">
                  {ARTICLE_TEMPLATES.map((tpl) => (
                    <button
                      key={tpl.id}
                      type="button"
                      onClick={() => handleApplyTemplate(tpl.body)}
                      className="w-full text-left px-2.5 py-1.5 rounded-lg text-xs hover:bg-emerald-50 dark:hover:bg-emerald-950/40 text-slate-700 dark:text-slate-200 cursor-pointer flex items-center justify-between"
                    >
                      <span>{tpl.label}</span>
                      {tpl.id === suggestedTemplate.id && (
                        <span className="text-[10px] font-bold text-emerald-600">Match</span>
                      )}
                    </button>
                  ))}
                </div>
              )}
            </div>
          </div>

          {/* Inline Link Helper */}
          {showLinkBar && (
            <div className="flex flex-wrap items-center gap-2 pt-2 border-t border-slate-200 dark:border-slate-700">
              <input
                type="text"
                value={linkText}
                onChange={(e) => setLinkText(e.target.value)}
                placeholder="Link text (e.g. Level 6 Past Papers)"
                className="flex-1 min-w-[160px] rounded-lg border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-900 px-2.5 py-1 text-xs"
              />
              <input
                type="text"
                value={linkUrl}
                onChange={(e) => setLinkUrl(e.target.value)}
                placeholder="URL (e.g. /levels/level-6/ or https://...)"
                className="flex-1 min-w-[180px] rounded-lg border border-slate-300 dark:border-slate-600 bg-white dark:bg-slate-900 px-2.5 py-1 text-xs"
              />
              <button
                type="button"
                onClick={handleInsertLink}
                className="rounded-lg bg-emerald-600 hover:bg-emerald-700 px-3 py-1 text-xs font-bold text-white cursor-pointer"
              >
                Insert
              </button>
              <button
                type="button"
                onClick={() => setShowLinkBar(false)}
                className="rounded-lg px-2 py-1 text-xs text-slate-500 hover:text-slate-800 cursor-pointer"
              >
                Cancel
              </button>
            </div>
          )}
        </div>
      )}

      {/* Editor + Live Preview Surface */}
      <div
        className={`grid gap-4 ${
          mode === 'split' ? 'grid-cols-1 md:grid-cols-2' : 'grid-cols-1'
        }`}
      >
        {mode !== 'preview' && (
          <textarea
            ref={textareaRef}
            rows={14}
            required
            value={value}
            onChange={(e) => onChange(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="Start writing your guide here, or click 'Templates' above for a ready-made outline. Use the toolbar buttons to add sections, bold highlights, lists, tip boxes, or links."
            className={`w-full border border-slate-300 dark:border-slate-700 px-3.5 py-3 text-sm font-sans leading-relaxed focus:outline-none focus:ring-2 focus:ring-emerald-500/30 ${
              mode === 'split' ? 'rounded-b-xl md:rounded-bl-xl md:rounded-br-none' : 'rounded-b-xl'
            }`}
          />
        )}

        {mode !== 'write' && (
          <div
            className={`border border-slate-200 dark:border-slate-700 bg-white p-5 overflow-y-auto max-h-[460px] ${
              mode === 'preview' ? 'rounded-xl' : 'rounded-xl md:rounded-tl-none'
            }`}
          >
            {tocItems.length > 0 && (
              <div className="mb-4 pb-3 border-b border-[#ebe7f0]">
                <span className="text-[10px] font-bold uppercase tracking-wider text-[#8b8794] block mb-1.5">
                  Auto-Generated Table of Contents ({tocItems.length})
                </span>
                <div className="flex flex-wrap gap-1.5">
                  {tocItems.map((item) => (
                    <span
                      key={item.id}
                      className="px-2 py-0.5 rounded-md bg-[#f4eff9] text-[#662c91] text-[11px] font-medium"
                    >
                      {item.level === 3 ? `↳ ${item.text}` : item.text}
                    </span>
                  ))}
                </div>
              </div>
            )}

            {value.trim() ? (
              <div className="text-[#1d1823] text-base leading-relaxed">
                {renderArticleMarkdown(value, { showSuggestedCallout: false })}
              </div>
            ) : (
              <p className="text-xs text-slate-400 italic py-8 text-center">
                Nothing to preview yet. Switch to Write or pick a Template to get started.
              </p>
            )}
          </div>
        )}
      </div>

      <p className="text-[11px] text-slate-500">
        Tip: Use <strong>Section</strong> headings so readers automatically get a Table of Contents sidebar.
      </p>
    </div>
  );
}
