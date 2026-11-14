'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import MiniSearch from 'minisearch';
import { Search, BookOpen, FileText, ArrowRight } from 'lucide-react';
import { SearchDocument } from '@/lib/types';

export function HeaderSearch() {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<SearchDocument[]>([]);
  const [isOpen, setIsOpen] = useState(false);
  const [isLoaded, setIsLoaded] = useState(false);
  const miniSearchRef = useRef<MiniSearch<SearchDocument> | null>(null);
  const docsByIdRef = useRef<Map<string, SearchDocument>>(new Map());
  const containerRef = useRef<HTMLDivElement>(null);
  const router = useRouter();

  const ensureIndexLoaded = async () => {
    if (isLoaded || miniSearchRef.current) return;
    try {
      const res = await fetch('/search-index.json');
      if (!res.ok) return;
      const docs: SearchDocument[] = await res.json();
      const ms = new MiniSearch<SearchDocument>({
        fields: ['name', 'code', 'breadcrumb'],
        storeFields: ['id', 'type', 'name', 'level', 'path', 'breadcrumb'],
        searchOptions: {
          boost: { name: 3, code: 2, breadcrumb: 1 },
          fuzzy: 0.2,
          prefix: true,
        },
      });
      ms.addAll(docs);
      miniSearchRef.current = ms;
      const map = new Map<string, SearchDocument>();
      docs.forEach((d) => map.set(d.id, d));
      docsByIdRef.current = map;
      setIsLoaded(true);
    } catch {
      // Ignore network errors cleanly
    }
  };

  useEffect(() => {
    const handleClickOutside = (e: MouseEvent) => {
      if (containerRef.current && !containerRef.current.contains(e.target as Node)) {
        setIsOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  const handleInputChange = async (value: string) => {
    setQuery(value);
    if (!value.trim()) {
      setResults([]);
      setIsOpen(false);
      return;
    }
    await ensureIndexLoaded();
    if (miniSearchRef.current) {
      const raw = miniSearchRef.current.search(value.trim()).slice(0, 7);
      const matched = raw
        .map((r) => docsByIdRef.current.get(r.id as string))
        .filter((d): d is SearchDocument => Boolean(d));
      setResults(matched);
      setIsOpen(true);
    }
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setIsOpen(false);
    if (query.trim()) {
      router.push(`/search/?q=${encodeURIComponent(query.trim())}`);
    } else {
      router.push('/search/');
    }
  };

  return (
    <div ref={containerRef} className="relative w-full max-w-md">
      <form onSubmit={handleSubmit} role="search" className="relative">
        <label htmlFor="header-search-input" className="sr-only">
          Search Kenyan TVET courses, units, and past papers
        </label>
        <Search
          className="pointer-events-none absolute left-3.5 top-1/2 -translate-y-1/2 h-4 w-4 text-[#8b8794]"
          aria-hidden="true"
        />
        <input
          id="header-search-input"
          type="search"
          value={query}
          onFocus={() => {
            ensureIndexLoaded();
            if (query.trim()) setIsOpen(true);
          }}
          onChange={(e) => handleInputChange(e.target.value)}
          placeholder="Search courses, units, past papers..."
          className="w-full rounded-full border border-[#ebe7f0] bg-[#f7f5fa] pl-10 pr-4 py-2 text-sm text-[#1d1823] placeholder-[#8b8794] focus:border-[#662c91] focus:bg-white focus:outline-none focus:ring-4 focus:ring-[#662c91]/12 transition-all shadow-xs"
        />
      </form>

      {isOpen && query.trim().length > 0 && (
        <div className="absolute left-0 right-0 top-full mt-2 z-50 rounded-2xl border border-[#ebe7f0] bg-white shadow-xl overflow-hidden animate-in fade-in-50 duration-150">
          {results.length > 0 ? (
            <ul className="divide-y divide-[#ebe7f0] max-h-96 overflow-y-auto">
              {results.map((item) => (
                <li key={item.id}>
                  <Link
                    href={item.path}
                    onClick={() => setIsOpen(false)}
                    className="flex items-start gap-3 px-4 py-3 hover:bg-[#f4eff9] transition-colors"
                  >
                    <span className="mt-0.5 rounded-lg bg-[#f4eff9] p-1.5 text-[#662c91] shrink-0">
                      {item.type === 'course' ? (
                        <BookOpen className="h-4 w-4" />
                      ) : (
                        <FileText className="h-4 w-4" />
                      )}
                    </span>
                    <div className="min-w-0 flex-1">
                      <div className="flex items-center gap-2">
                        <span className="font-semibold text-sm text-[#1d1823] truncate">
                          {item.name}
                        </span>
                        <span className="shrink-0 rounded-full bg-[#f4eff9] text-[#662c91] px-2 py-0.5 text-[10px] font-bold uppercase tracking-wider">
                          {item.type}
                        </span>
                      </div>
                      <p className="text-xs text-[#8b8794] truncate mt-0.5">
                        {item.breadcrumb}
                      </p>
                    </div>
                  </Link>
                </li>
              ))}
              <li>
                <Link
                  href={`/search/?q=${encodeURIComponent(query.trim())}`}
                  onClick={() => setIsOpen(false)}
                  className="flex items-center justify-between px-4 py-2.5 bg-[#f7f5fa] text-xs font-semibold text-[#662c91] hover:underline"
                >
                  <span>See all search results for &ldquo;{query.trim()}&rdquo;</span>
                  <ArrowRight className="h-3.5 w-3.5" />
                </Link>
              </li>
            </ul>
          ) : (
            <div className="p-4 text-center text-sm text-[#5c5766]">
              No instant matches found.{' '}
              <Link
                href={`/search/?q=${encodeURIComponent(query.trim())}`}
                onClick={() => setIsOpen(false)}
                className="font-semibold text-[#662c91] hover:underline"
              >
                Open full search
              </Link>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
