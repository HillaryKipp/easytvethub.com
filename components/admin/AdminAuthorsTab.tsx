'use client';

import { useState, useEffect } from 'react';
import { Plus, Edit3, Trash2, CheckCircle2, Globe, ExternalLink } from 'lucide-react';
import { getSupabaseClient } from '@/lib/supabase';
import { Author } from '@/lib/types';
import { DEFAULT_AUTHORS } from '@/lib/blog-data';
import { slugify } from '@/lib/utils';

interface AdminAuthorsTabProps {
  onStatusMsg: (msg: { type: 'success' | 'error'; text: string }) => void;
}

export function AdminAuthorsTab({ onStatusMsg }: AdminAuthorsTabProps) {
  const supabase = getSupabaseClient();
  const [authors, setAuthors] = useState<Author[]>([]);
  const [loading, setLoading] = useState(true);
  const [editingAuthor, setEditingAuthor] = useState<Author | null>(null);

  // Form fields
  const [name, setName] = useState('');
  const [slug, setSlug] = useState('');
  const [roleTitle, setRoleTitle] = useState('');
  const [bio, setBio] = useState('');
  const [avatarUrl, setAvatarUrl] = useState('');
  const [linkedin, setLinkedin] = useState('');
  const [twitter, setTwitter] = useState('');
  const [website, setWebsite] = useState('');
  const [isVerified, setIsVerified] = useState(true);

  async function loadAuthors() {
    setLoading(true);
    try {
      const { data, error } = await supabase
        .from('authors')
        .select('*')
        .order('created_at', { ascending: true });

      if (!error && data && data.length > 0) {
        setAuthors(data as Author[]);
      } else {
        setAuthors(DEFAULT_AUTHORS);
      }
    } catch {
      setAuthors(DEFAULT_AUTHORS);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    loadAuthors();
  }, []);

  function handleStartNew() {
    setEditingAuthor({
      id: '',
      name: '',
      slug: '',
      role_title: '',
      bio: '',
      social_links: {},
      is_verified: true,
      created_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    });
    setName('');
    setSlug('');
    setRoleTitle('');
    setBio('');
    setAvatarUrl('');
    setLinkedin('');
    setTwitter('');
    setWebsite('');
    setIsVerified(true);
  }

  function handleSelectEdit(author: Author) {
    setEditingAuthor(author);
    setName(author.name);
    setSlug(author.slug);
    setRoleTitle(author.role_title);
    setBio(author.bio);
    setAvatarUrl(author.avatar_url || '');
    setLinkedin(author.social_links.linkedin || '');
    setTwitter(author.social_links.twitter || '');
    setWebsite(author.social_links.website || '');
    setIsVerified(author.is_verified);
  }

  async function handleSaveAuthor(e: React.FormEvent) {
    e.preventDefault();
    if (!name.trim()) {
      onStatusMsg({ type: 'error', text: 'Author name is required.' });
      return;
    }

    const finalSlug = slug.trim() || slugify(name);
    const payload = {
      name: name.trim(),
      slug: finalSlug,
      role_title: roleTitle.trim(),
      bio: bio.trim(),
      avatar_url: avatarUrl.trim() || null,
      social_links: {
        ...(linkedin.trim() ? { linkedin: linkedin.trim() } : {}),
        ...(twitter.trim() ? { twitter: twitter.trim() } : {}),
        ...(website.trim() ? { website: website.trim() } : {}),
      },
      is_verified: isVerified,
    };

    try {
      if (editingAuthor?.id && !editingAuthor.id.startsWith('author-')) {
        // Update existing row in Supabase
        const { error } = await supabase
          .from('authors')
          .update(payload)
          .eq('id', editingAuthor.id);

        if (error) throw error;
      } else {
        // Insert new row in Supabase
        const { error } = await supabase.from('authors').insert(payload);
        if (error) throw error;
      }

      onStatusMsg({ type: 'success', text: `Saved author profile "${name}".` });
      setEditingAuthor(null);
      await loadAuthors();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : String(err);
      onStatusMsg({
        type: 'error',
        text: `Error saving author: ${msg} (Note: ensure authors table exists in Supabase).`,
      });
    }
  }

  async function handleDeleteAuthor(author: Author) {
    if (!confirm(`Delete author profile "${author.name}"?`)) return;
    try {
      const { error } = await supabase.from('authors').delete().eq('id', author.id);
      if (error) throw error;
      onStatusMsg({ type: 'success', text: `Deleted author "${author.name}".` });
      await loadAuthors();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : String(err);
      onStatusMsg({ type: 'error', text: `Failed to delete author: ${msg}` });
    }
  }

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-4 pb-4 border-b border-slate-200 dark:border-slate-800">
        <div>
          <h2 className="text-xl font-bold text-slate-900 dark:text-white">
            Author Profiles &amp; Reviewers (E-E-A-T)
          </h2>
          <p className="text-xs text-slate-500 mt-1">
            Manage author credentials, bios, verification badges, and social links to satisfy Google AdSense publisher trust policies.
          </p>
        </div>
        <button
          type="button"
          onClick={handleStartNew}
          className="inline-flex items-center gap-1.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 px-3.5 py-2 text-xs font-bold text-white cursor-pointer"
        >
          <Plus className="h-4 w-4" /> Add Author Profile
        </button>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
        {/* Author List */}
        <div className="lg:col-span-5 space-y-3">
          <h3 className="text-xs font-bold uppercase text-slate-500">
            Registered Authors ({authors.length})
          </h3>
          {authors.map((a) => (
            <div
              key={a.id}
              onClick={() => handleSelectEdit(a)}
              className={`p-4 rounded-xl border transition-all cursor-pointer flex items-start justify-between gap-3 ${
                editingAuthor?.id === a.id
                  ? 'border-emerald-500 bg-emerald-50/40 dark:bg-emerald-950/20'
                  : 'border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 hover:border-slate-300'
              }`}
            >
              <div className="flex items-center gap-3">
                {a.avatar_url ? (
                  <img
                    src={a.avatar_url}
                    alt={a.name}
                    className="h-10 w-10 rounded-full object-cover"
                  />
                ) : (
                  <div className="h-10 w-10 rounded-full bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-200 font-bold flex items-center justify-center text-xs">
                    {a.name[0]}
                  </div>
                )}
                <div>
                  <div className="font-bold text-sm text-slate-900 dark:text-white flex items-center gap-1">
                    {a.name}
                    {a.is_verified && (
                      <CheckCircle2 className="h-3.5 w-3.5 text-emerald-500" />
                    )}
                  </div>
                  <div className="text-xs text-slate-500 dark:text-slate-400">
                    {a.role_title}
                  </div>
                </div>
              </div>

              <div className="flex items-center gap-1">
                <button
                  type="button"
                  onClick={(e) => {
                    e.stopPropagation();
                    handleDeleteAuthor(a);
                  }}
                  className="p-1.5 text-slate-400 hover:text-red-600 rounded-md"
                  title="Delete author"
                >
                  <Trash2 className="h-4 w-4" />
                </button>
              </div>
            </div>
          ))}
        </div>

        {/* Author Editor Form */}
        <div className="lg:col-span-7">
          {editingAuthor ? (
            <form
              onSubmit={handleSaveAuthor}
              className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-6 space-y-4 shadow-xs"
            >
              <h3 className="text-base font-bold text-slate-900 dark:text-white pb-2 border-b border-slate-100 dark:border-slate-800">
                {editingAuthor.id ? `Edit Profile: ${editingAuthor.name}` : 'New Author Profile'}
              </h3>

              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                  <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                    Full Name
                  </label>
                  <input
                    type="text"
                    required
                    value={name}
                    onChange={(e) => {
                      setName(e.target.value);
                      if (!slug || slug === slugify(name)) {
                        setSlug(slugify(e.target.value));
                      }
                    }}
                    placeholder="e.g. Hillary Kipkorir"
                    className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                  />
                </div>
                <div>
                  <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                    Slug (URL path: /authors/[slug]/)
                  </label>
                  <input
                    type="text"
                    required
                    value={slug}
                    onChange={(e) => setSlug(e.target.value)}
                    placeholder="hillary-kipkorir"
                    className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm font-mono"
                  />
                </div>
              </div>

              <div>
                <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                  Professional Title / Role
                </label>
                <input
                  type="text"
                  required
                  value={roleTitle}
                  onChange={(e) => setRoleTitle(e.target.value)}
                  placeholder="e.g. TVET Agricultural Engineering Specialist & CDACC Assessor"
                  className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                />
              </div>

              <div>
                <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                  Author Biography (Expertise &amp; Teaching Background)
                </label>
                <textarea
                  rows={4}
                  required
                  value={bio}
                  onChange={(e) => setBio(e.target.value)}
                  placeholder="Describe your vocational teaching qualifications, exam marking background, or technical industry experience..."
                  className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm leading-relaxed"
                />
              </div>

              <div>
                <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                  Avatar / Headshot Image URL
                </label>
                <input
                  type="text"
                  value={avatarUrl}
                  onChange={(e) => setAvatarUrl(e.target.value)}
                  placeholder="https://... or /authors/photo.jpg"
                  className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                />
              </div>

              {/* Social Profiles */}
              <div className="grid grid-cols-1 sm:grid-cols-3 gap-3 pt-2">
                <div>
                  <label className="block text-[11px] font-bold uppercase text-slate-500 mb-1">
                    LinkedIn URL
                  </label>
                  <input
                    type="text"
                    value={linkedin}
                    onChange={(e) => setLinkedin(e.target.value)}
                    placeholder="https://linkedin.com/in/..."
                    className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-2.5 py-1.5 text-xs"
                  />
                </div>
                <div>
                  <label className="block text-[11px] font-bold uppercase text-slate-500 mb-1">
                    X / Twitter URL
                  </label>
                  <input
                    type="text"
                    value={twitter}
                    onChange={(e) => setTwitter(e.target.value)}
                    placeholder="https://twitter.com/..."
                    className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-2.5 py-1.5 text-xs"
                  />
                </div>
                <div>
                  <label className="block text-[11px] font-bold uppercase text-slate-500 mb-1">
                    Personal Website
                  </label>
                  <input
                    type="text"
                    value={website}
                    onChange={(e) => setWebsite(e.target.value)}
                    placeholder="https://..."
                    className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-2.5 py-1.5 text-xs"
                  />
                </div>
              </div>

              {/* Verified Contributor Checkbox */}
              <div className="flex items-center gap-2 pt-2">
                <input
                  type="checkbox"
                  id="is_verified"
                  checked={isVerified}
                  onChange={(e) => setIsVerified(e.target.checked)}
                  className="rounded text-emerald-600 focus:ring-emerald-500"
                />
                <label
                  htmlFor="is_verified"
                  className="text-xs font-semibold text-slate-800 dark:text-slate-200 cursor-pointer"
                >
                  Verified TVET Contributor Badge (Displays verified checkmark on articles &amp; profile)
                </label>
              </div>

              <div className="flex items-center gap-3 pt-4 border-t border-slate-100 dark:border-slate-800">
                <button
                  type="submit"
                  className="rounded-xl bg-emerald-600 hover:bg-emerald-700 px-5 py-2.5 text-xs font-bold text-white cursor-pointer"
                >
                  Save Author Profile
                </button>
                <button
                  type="button"
                  onClick={() => setEditingAuthor(null)}
                  className="rounded-xl bg-slate-100 dark:bg-slate-800 px-4 py-2.5 text-xs font-semibold text-slate-700 dark:text-slate-300 cursor-pointer"
                >
                  Cancel
                </button>
              </div>
            </form>
          ) : (
            <div className="rounded-2xl border border-dashed border-slate-300 dark:border-slate-800 p-12 text-center text-slate-500 text-sm">
              Select an author from the list on the left to edit their credentials, or click &ldquo;+ Add Author Profile&rdquo;.
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
