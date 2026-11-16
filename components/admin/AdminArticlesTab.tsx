'use client';

import { useState, useEffect } from 'react';
import {
  Plus,
  Edit3,
  Trash2,
  Eye,
  EyeOff,
  CheckCircle2,
  FileText,
  ShieldCheck,
  ExternalLink,
  Search,
  ChevronDown,
  ChevronRight,
} from 'lucide-react';
import { getSupabaseClient } from '@/lib/supabase';
import { Article, ArticleCategory, Author } from '@/lib/types';
import { DEFAULT_ARTICLES, DEFAULT_AUTHORS } from '@/lib/blog-data';
import { slugify } from '@/lib/utils';
import { ArticleBodyEditor } from '@/components/admin/ArticleBodyEditor';

interface AdminArticlesTabProps {
  onStatusMsg: (msg: { type: 'success' | 'error'; text: string }) => void;
}

const CATEGORIES: { value: ArticleCategory; label: string }[] = [
  { value: 'revision_guide', label: 'Revision Guide' },
  { value: 'exam_news', label: 'Exam News & Circular' },
  { value: 'curriculum_update', label: 'Curriculum Update' },
  { value: 'course_spotlight', label: 'Course Spotlight' },
];

export function AdminArticlesTab({ onStatusMsg }: AdminArticlesTabProps) {
  const supabase = getSupabaseClient();
  const [articles, setArticles] = useState<Article[]>([]);
  const [authors, setAuthors] = useState<Author[]>([]);
  const [loading, setLoading] = useState(true);
  const [editingArticle, setEditingArticle] = useState<Article | null>(null);
  const [filterQuery, setFilterQuery] = useState('');

  // Form fields
  const [title, setTitle] = useState('');
  const [slug, setSlug] = useState('');
  const [authorId, setAuthorId] = useState('');
  const [category, setCategory] = useState<ArticleCategory>('revision_guide');
  const [excerpt, setExcerpt] = useState('');
  const [content, setContent] = useState('');
  const [sourceName, setSourceName] = useState('');
  const [sourceUrl, setSourceUrl] = useState('');
  const [isOfficialSource, setIsOfficialSource] = useState(false);
  const [featuredImageUrl, setFeaturedImageUrl] = useState('');
  const [featuredImageAlt, setFeaturedImageAlt] = useState('');
  const [isCoverMockup, setIsCoverMockup] = useState(false);
  const [published, setPublished] = useState(false);
  const [noindex, setNoindex] = useState(false);
  const [showAdvancedSeo, setShowAdvancedSeo] = useState(false);

  async function loadData() {
    setLoading(true);
    try {
      const [artRes, authRes] = await Promise.all([
        supabase.from('articles').select('*').order('created_at', { ascending: false }),
        supabase.from('authors').select('*').order('name', { ascending: true }),
      ]);

      if (!artRes.error && artRes.data && artRes.data.length > 0) {
        setArticles(artRes.data as Article[]);
      } else {
        setArticles(DEFAULT_ARTICLES);
      }

      if (!authRes.error && authRes.data && authRes.data.length > 0) {
        setAuthors(authRes.data as Author[]);
      } else {
        setAuthors(DEFAULT_AUTHORS);
      }
    } catch {
      setArticles(DEFAULT_ARTICLES);
      setAuthors(DEFAULT_AUTHORS);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    loadData();
  }, []);

  function handleStartNew() {
    const defaultAuthor = authors[0]?.id || DEFAULT_AUTHORS[0].id;
    setEditingArticle({
      id: '',
      author_id: defaultAuthor,
      title: '',
      slug: '',
      excerpt: '',
      content: '',
      category: 'revision_guide',
      is_official_source: false,
      is_cover_mockup: false,
      published: false,
      noindex: false,
      updated_at: new Date().toISOString(),
    });
    setTitle('');
    setSlug('');
    setAuthorId(defaultAuthor);
    setCategory('revision_guide');
    setExcerpt('');
    setContent('');
    setSourceName('');
    setSourceUrl('');
    setIsOfficialSource(false);
    setFeaturedImageUrl('');
    setFeaturedImageAlt('');
    setIsCoverMockup(false);
    setPublished(false);
    setNoindex(false);
    setShowAdvancedSeo(false);
  }

  function handleSelectEdit(art: Article) {
    setEditingArticle(art);
    setTitle(art.title);
    setSlug(art.slug);
    setAuthorId(art.author_id);
    setCategory(art.category);
    setExcerpt(art.excerpt);
    setContent(art.content);
    setSourceName(art.source_name || '');
    setSourceUrl(art.source_url || '');
    setIsOfficialSource(art.is_official_source || false);
    setFeaturedImageUrl(art.featured_image_url || '');
    setFeaturedImageAlt(art.featured_image_alt || '');
    setIsCoverMockup(art.is_cover_mockup || false);
    setPublished(art.published);
    setNoindex(art.noindex);
  }

  async function handleSaveArticle(e: React.FormEvent, publishOverride?: boolean) {
    e.preventDefault();
    if (!title.trim()) {
      onStatusMsg({ type: 'error', text: 'Article title is required.' });
      return;
    }

    const nextPublished = publishOverride !== undefined ? publishOverride : published;
    const finalSlug = slug.trim() || slugify(title);
    const payload = {
      author_id: authorId || authors[0]?.id,
      title: title.trim(),
      slug: finalSlug,
      excerpt: excerpt.trim(),
      content: content.trim(),
      category,
      source_name: sourceName.trim() || null,
      source_url: sourceUrl.trim() || null,
      is_official_source: isOfficialSource,
      featured_image_url: featuredImageUrl.trim() || null,
      featured_image_alt: featuredImageAlt.trim() || null,
      is_cover_mockup: isCoverMockup,
      published: nextPublished,
      noindex,
      published_at: nextPublished ? new Date().toISOString() : null,
    };

    try {
      if (editingArticle?.id && !editingArticle.id.startsWith('article-')) {
        // Update existing row
        const { error } = await supabase
          .from('articles')
          .update(payload)
          .eq('id', editingArticle.id);

        if (error) throw error;
      } else {
        // Insert new row
        const { error } = await supabase.from('articles').insert(payload);
        if (error) throw error;
      }

      onStatusMsg({
        type: 'success',
        text: `${nextPublished ? 'Published' : 'Saved draft'} "${title}".`,
      });
      setEditingArticle(null);
      await loadData();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : String(err);
      onStatusMsg({
        type: 'error',
        text: `Error saving article: ${msg} (Note: ensure articles table exists in Supabase).`,
      });
    }
  }

  async function handleDeleteArticle(art: Article) {
    if (!confirm(`Delete article "${art.title}"?`)) return;
    try {
      const { error } = await supabase.from('articles').delete().eq('id', art.id);
      if (error) throw error;
      onStatusMsg({ type: 'success', text: `Deleted article "${art.title}".` });
      await loadData();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : String(err);
      onStatusMsg({ type: 'error', text: `Failed to delete article: ${msg}` });
    }
  }

  const filteredArticles = articles.filter(
    (a) =>
      a.title.toLowerCase().includes(filterQuery.toLowerCase()) ||
      a.category.toLowerCase().includes(filterQuery.toLowerCase())
  );

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-4 pb-4 border-b border-slate-200 dark:border-slate-800">
        <div>
          <h2 className="text-xl font-bold text-slate-900 dark:text-white">
            Articles, Guides &amp; Exam Circulars
          </h2>
          <p className="text-xs text-slate-500 mt-1">
            Author and publish text-rich revision guides, official circular analyses, and curriculum updates with attribution, official source citations, and noindex shields.
          </p>
        </div>
        <button
          type="button"
          onClick={handleStartNew}
          className="inline-flex items-center gap-1.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 px-3.5 py-2 text-xs font-bold text-white cursor-pointer"
        >
          <Plus className="h-4 w-4" /> New Article / Guide
        </button>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
        {/* Left Column: Article List */}
        <div className="lg:col-span-5 space-y-3">
          <div className="relative">
            <Search className="h-4 w-4 absolute left-3 top-2.5 text-slate-400" />
            <input
              type="text"
              value={filterQuery}
              onChange={(e) => setFilterQuery(e.target.value)}
              placeholder="Filter articles..."
              className="w-full rounded-xl border border-slate-300 dark:border-slate-700 pl-9 pr-3 py-2 text-xs"
            />
          </div>

          <div className="max-h-[75vh] overflow-y-auto space-y-2.5 pr-1">
            {filteredArticles.map((art) => {
              const author = authors.find((a) => a.id === art.author_id);
              return (
                <div
                  key={art.id}
                  onClick={() => handleSelectEdit(art)}
                  className={`p-3.5 rounded-xl border transition-all cursor-pointer flex flex-col gap-2 ${
                    editingArticle?.id === art.id
                      ? 'border-emerald-500 bg-emerald-50/40 dark:bg-emerald-950/20'
                      : 'border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 hover:border-slate-300'
                  }`}
                >
                  <div className="flex items-center justify-between gap-2">
                    <span className="text-[10px] font-bold uppercase tracking-wider text-emerald-600 dark:text-emerald-400">
                      {art.category.replace('_', ' ')}
                    </span>
                    <div className="flex items-center gap-1.5">
                      {art.published ? (
                        <span className="inline-flex items-center gap-0.5 text-[10px] font-semibold text-emerald-700 bg-emerald-100 dark:bg-emerald-950 px-1.5 py-0.5 rounded">
                          <Eye className="h-2.5 w-2.5" /> Published
                        </span>
                      ) : (
                        <span className="inline-flex items-center gap-0.5 text-[10px] font-semibold text-amber-700 bg-amber-100 dark:bg-amber-950 px-1.5 py-0.5 rounded">
                          <EyeOff className="h-2.5 w-2.5" /> Draft
                        </span>
                      )}
                      {art.noindex && (
                        <span className="text-[10px] font-semibold text-slate-600 bg-slate-200 dark:bg-slate-800 px-1.5 py-0.5 rounded">
                          Noindex
                        </span>
                      )}
                    </div>
                  </div>

                  <h4 className="font-bold text-sm text-slate-900 dark:text-white line-clamp-2">
                    {art.title}
                  </h4>

                  <div className="flex items-center justify-between text-xs text-slate-500 pt-1 border-t border-slate-100 dark:border-slate-800">
                    <span>By {author?.name || 'Editorial Board'}</span>
                    <button
                      type="button"
                      onClick={(e) => {
                        e.stopPropagation();
                        handleDeleteArticle(art);
                      }}
                      className="text-slate-400 hover:text-red-600 p-1"
                      title="Delete article"
                    >
                      <Trash2 className="h-3.5 w-3.5" />
                    </button>
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        {/* Right Column: Article Editor Form */}
        <div className="lg:col-span-7">
          {editingArticle ? (
            <form
              onSubmit={handleSaveArticle}
              className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-6 space-y-4 shadow-xs max-h-[85vh] overflow-y-auto"
            >
              <h3 className="text-base font-bold text-slate-900 dark:text-white pb-2 border-b border-slate-100 dark:border-slate-800 flex items-center justify-between">
                <span>{editingArticle.id ? 'Edit Article' : 'Compose New Article'}</span>
                <span
                  className={`text-[11px] font-semibold px-2 py-0.5 rounded-full ${
                    published
                      ? 'bg-emerald-100 text-emerald-700 dark:bg-emerald-950 dark:text-emerald-300'
                      : 'bg-amber-100 text-amber-700 dark:bg-amber-950 dark:text-amber-300'
                  }`}
                >
                  {published ? 'Live on Site' : 'Draft'}
                </span>
              </h3>

              {/* Title, Category & Author */}
              <div className="space-y-3">
                <div>
                  <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                    Article Title
                  </label>
                  <input
                    type="text"
                    required
                    value={title}
                    onChange={(e) => {
                      setTitle(e.target.value);
                      if (!slug || slug === slugify(title)) {
                        setSlug(slugify(e.target.value));
                      }
                    }}
                    placeholder="e.g. How to Tackle CDACC Practical Assessments in 2026"
                    className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm font-semibold"
                  />
                  <p className="text-[11px] text-slate-400 mt-1">
                    URL: <span className="font-mono">/blog/{slug || slugify(title) || 'your-article-title'}/</span>
                  </p>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                      Category
                    </label>
                    <select
                      value={category}
                      onChange={(e) => setCategory(e.target.value as ArticleCategory)}
                      className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                    >
                      {CATEGORIES.map((cat) => (
                        <option key={cat.value} value={cat.value}>
                          {cat.label}
                        </option>
                      ))}
                    </select>
                  </div>

                  <div>
                    <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                      Author / Reviewer
                    </label>
                    <select
                      value={authorId}
                      onChange={(e) => setAuthorId(e.target.value)}
                      className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                    >
                      {authors.map((a) => (
                        <option key={a.id} value={a.id}>
                          {a.name} - {a.role_title}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>
              </div>

              {/* Excerpt */}
              <div>
                <div className="flex items-center justify-between mb-1">
                  <label className="block text-xs font-bold uppercase text-slate-500">
                    Short Summary (shown on blog cards &amp; Google)
                  </label>
                  <span
                    className={`text-[11px] font-medium ${
                      excerpt.length >= 120 && excerpt.length <= 165
                        ? 'text-emerald-600'
                        : 'text-slate-400'
                    }`}
                  >
                    {excerpt.length} / 160 chars
                  </span>
                </div>
                <textarea
                  rows={2}
                  required
                  value={excerpt}
                  onChange={(e) => setExcerpt(e.target.value)}
                  placeholder="Write a 1–2 sentence summary of what this guide helps the reader do..."
                  className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                />
              </div>

              {/* Visual Toolbar + Live Preview Article Body Editor */}
              <ArticleBodyEditor
                value={content}
                onChange={setContent}
                category={category}
              />

              {/* Source Attribution (Combats Scaled / Low-Value Spam) */}
              <div className="p-4 rounded-xl bg-slate-50 dark:bg-slate-800/40 border border-slate-200 dark:border-slate-700 space-y-3">
                <div className="flex items-center justify-between">
                  <span className="text-xs font-bold uppercase text-slate-600 dark:text-slate-300">
                    Official Reference Citation
                  </span>
                  <div className="flex items-center gap-1.5">
                    <input
                      type="checkbox"
                      id="is_official"
                      checked={isOfficialSource}
                      onChange={(e) => setIsOfficialSource(e.target.checked)}
                      className="rounded text-emerald-600 focus:ring-emerald-500"
                    />
                    <label htmlFor="is_official" className="text-xs font-semibold cursor-pointer">
                      Official Government / Board Source
                    </label>
                  </div>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div>
                    <input
                      type="text"
                      value={sourceName}
                      onChange={(e) => setSourceName(e.target.value)}
                      placeholder="Source name e.g. KNEC Circular No. 2026/04"
                      className="w-full rounded-lg border border-slate-300 dark:border-slate-600 px-3 py-1.5 text-xs"
                    />
                  </div>
                  <div>
                    <input
                      type="text"
                      value={sourceUrl}
                      onChange={(e) => setSourceUrl(e.target.value)}
                      placeholder="Source URL e.g. https://knec.ac.ke/circulars/..."
                      className="w-full rounded-lg border border-slate-300 dark:border-slate-600 px-3 py-1.5 text-xs font-mono"
                    />
                  </div>
                </div>
              </div>

              {/* Featured Image & Alt Text Controls */}
              <div className="p-4 rounded-xl bg-slate-50 dark:bg-slate-800/40 border border-slate-200 dark:border-slate-700 space-y-3">
                <span className="text-xs font-bold uppercase text-slate-600 dark:text-slate-300 block">
                  Featured Media &amp; Alt Text
                </span>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div>
                    <label className="block text-[11px] text-slate-500 mb-1">Image URL</label>
                    <input
                      type="text"
                      value={featuredImageUrl}
                      onChange={(e) => setFeaturedImageUrl(e.target.value)}
                      placeholder="https://... or /og-default.png"
                      className="w-full rounded-lg border border-slate-300 dark:border-slate-600 px-3 py-1.5 text-xs"
                    />
                  </div>
                  <div>
                    <label className="block text-[11px] text-slate-500 mb-1">
                      Descriptive Alt Text
                    </label>
                    <input
                      type="text"
                      value={featuredImageAlt}
                      onChange={(e) => setFeaturedImageAlt(e.target.value)}
                      placeholder="Accurate description of what the image shows"
                      className="w-full rounded-lg border border-slate-300 dark:border-slate-600 px-3 py-1.5 text-xs"
                    />
                  </div>
                </div>

              </div>

              {/* Collapsible Advanced SEO & URL Settings */}
              <div className="rounded-xl border border-slate-200 dark:border-slate-800 overflow-hidden">
                <button
                  type="button"
                  onClick={() => setShowAdvancedSeo((prev) => !prev)}
                  className="w-full flex items-center justify-between px-4 py-2.5 bg-slate-50 dark:bg-slate-800/40 text-xs font-bold uppercase text-slate-600 dark:text-slate-300 cursor-pointer hover:bg-slate-100 dark:hover:bg-slate-800/70"
                >
                  <span>Advanced SEO &amp; URL Settings (Optional)</span>
                  {showAdvancedSeo ? (
                    <ChevronDown className="h-4 w-4" />
                  ) : (
                    <ChevronRight className="h-4 w-4" />
                  )}
                </button>

                {showAdvancedSeo && (
                  <div className="p-4 space-y-3 border-t border-slate-200 dark:border-slate-800">
                    <div>
                      <label className="block text-[11px] font-semibold text-slate-500 mb-1">
                        Custom URL Slug (/blog/[slug]/)
                      </label>
                      <input
                        type="text"
                        required
                        value={slug}
                        onChange={(e) => setSlug(e.target.value)}
                        placeholder="how-to-tackle-cdacc-assessments"
                        className="w-full rounded-lg border border-slate-300 dark:border-slate-700 px-3 py-1.5 font-mono text-xs"
                      />
                    </div>

                    <div className="flex items-center gap-2">
                      <input
                        type="checkbox"
                        id="is_mockup"
                        checked={isCoverMockup}
                        onChange={(e) => setIsCoverMockup(e.target.checked)}
                        className="rounded text-emerald-600 focus:ring-emerald-500"
                      />
                      <label htmlFor="is_mockup" className="text-xs text-slate-700 dark:text-slate-300 cursor-pointer">
                        Cover image is a designed graphic / illustration (not a genuine paper scan)
                      </label>
                    </div>

                    <div className="flex items-center gap-2">
                      <input
                        type="checkbox"
                        id="noindex_toggle"
                        checked={noindex}
                        onChange={(e) => setNoindex(e.target.checked)}
                        className="rounded text-amber-600 focus:ring-amber-500 h-4 w-4"
                      />
                      <label
                        htmlFor="noindex_toggle"
                        className="text-xs font-semibold text-amber-700 dark:text-amber-400 cursor-pointer"
                      >
                        Noindex (Hide from Google search crawlers until ready)
                      </label>
                    </div>
                  </div>
                )}
              </div>

              {/* Action Buttons */}
              <div className="flex flex-wrap items-center gap-3 pt-4 border-t border-slate-100 dark:border-slate-800">
                <button
                  type="button"
                  onClick={(e) => handleSaveArticle(e, true)}
                  className="rounded-xl bg-emerald-600 hover:bg-emerald-700 px-5 py-2.5 text-xs font-bold text-white cursor-pointer"
                >
                  {published ? 'Update & Keep Published' : 'Publish Article'}
                </button>
                <button
                  type="button"
                  onClick={(e) => handleSaveArticle(e, false)}
                  className="rounded-xl border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-800 hover:bg-slate-50 px-4 py-2.5 text-xs font-semibold text-slate-700 dark:text-slate-200 cursor-pointer"
                >
                  {published ? 'Unpublish (Save as Draft)' : 'Save Draft'}
                </button>
                <button
                  type="button"
                  onClick={() => setEditingArticle(null)}
                  className="ml-auto rounded-xl bg-slate-100 dark:bg-slate-800 px-4 py-2.5 text-xs font-semibold text-slate-600 dark:text-slate-300 cursor-pointer"
                >
                  Cancel
                </button>
              </div>
            </form>
          ) : (
            <div className="rounded-2xl border border-dashed border-slate-300 dark:border-slate-800 p-12 text-center text-slate-500 text-sm">
              Select an article on the left to edit or click &ldquo;+ New Article / Guide&rdquo;.
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
