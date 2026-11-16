'use client';

import { useState, useEffect, useRef, Suspense } from 'react';
import { useSearchParams } from 'next/navigation';
import Link from 'next/link';
import MiniSearch from 'minisearch';
import { Search } from 'lucide-react';
import { SearchDocument } from '@/lib/types';

function SearchClientInner() {
  const searchParams = useSearchParams();
  const initialQuery = searchParams.get('q') || '';
  const [query, setQuery] = useState(initialQuery);
  const [typeFilter, setTypeFilter] = useState<'all' | 'course' | 'unit'>('all');
  const [levelFilter, setLevelFilter] = useState<number | 'all'>('all');
  const [allDocs, setAllDocs] = useState<SearchDocument[]>([]);
  const [loading, setLoading] = useState(true);
  const miniSearchRef = useRef<MiniSearch<SearchDocument> | null>(null);
  const docsByIdRef = useRef<Map<string, SearchDocument>>(new Map());

  useEffect(() => {
    setQuery(searchParams.get('q') || '');
  }, [searchParams]);

  useEffect(() => {
    let mounted = true;
    async function loadIndex() {
      try {
        const res = await fetch('/search-index.json');
        if (!res.ok) return;
        const docs: SearchDocument[] = await res.json();
        if (!mounted) return;
        const ms = new MiniSearch<SearchDocument>({
          fields: ['name', 'code', 'breadcrumb'],
          storeFields: ['id', 'type', 'name', 'level', 'path', 'breadcrumb', 'resourceCount'],
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
        setAllDocs(docs);
      } finally {
        if (mounted) setLoading(false);
      }
    }
    loadIndex();
    return () => {
      mounted = false;
    };
  }, []);

  const matchedDocs: SearchDocument[] = (() => {
    let base: SearchDocument[] = [];
    if (!query.trim()) {
      base = allDocs.slice(0, 60);
    } else if (miniSearchRef.current) {
      const results = miniSearchRef.current.search(query.trim());
      base = results
        .map((r) => docsByIdRef.current.get(r.id as string))
        .filter((d): d is SearchDocument => Boolean(d));
    }

    return base.filter((doc) => {
      if (typeFilter !== 'all' && doc.type !== typeFilter) return false;
      if (levelFilter !== 'all' && doc.level !== levelFilter) return false;
      return true;
    });
  })();

  return (
    <div className="space-y-8">
      {/* Search Bar & Filters */}
      <div className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs">
        <div className="relative mb-5">
          <label htmlFor="main-search-input" className="sr-only">
            Search TVET courses and units
          </label>
          <Search className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-[#8b8794]" />
          <input
            id="main-search-input"
            type="search"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Type course or unit name (e.g. Agripreneurship, Electrical Installation, ICT)..."
            className="w-full rounded-full border border-[#ebe7f0] bg-[#f7f5fa] pl-12 pr-4 py-3.5 text-sm sm:text-base text-[#1d1823] placeholder-[#8b8794] focus:border-[#662c91] focus:bg-white focus:outline-none focus:ring-4 focus:ring-[#662c91]/12 transition-all shadow-xs"
            autoFocus
          />
        </div>

        <div className="flex flex-wrap items-center justify-between gap-4 text-xs">
          <div className="flex flex-wrap items-center gap-1.5">
            <span className="font-semibold text-[#8b8794] mr-1">
              Type:
            </span>
            {(['all', 'course', 'unit'] as const).map((t) => (
              <button
                key={t}
                type="button"
                onClick={() => setTypeFilter(t)}
                className={`rounded-lg px-3 py-1.5 font-semibold capitalize cursor-pointer transition-colors ${
                  typeFilter === t
                    ? 'bg-[#662c91] text-white shadow-xs'
                    : 'bg-[#f7f5fa] text-[#5c5766] hover:bg-[#f4eff9] hover:text-[#662c91]'
                }`}
              >
                {t === 'all' ? 'All Items' : `${t}s`}
              </button>
            ))}
          </div>

          <div className="flex flex-wrap items-center gap-1.5">
            <span className="font-semibold text-[#8b8794] mr-1">Level:</span>
            {(['all', 6, 5, 4, 3] as const).map((lvl) => (
              <button
                key={String(lvl)}
                type="button"
                onClick={() => setLevelFilter(lvl)}
                className={`rounded-lg px-3 py-1.5 font-semibold cursor-pointer transition-colors ${
                  levelFilter === lvl
                    ? 'bg-[#662c91] text-white shadow-xs'
                    : 'bg-[#f7f5fa] text-[#5c5766] hover:bg-[#f4eff9] hover:text-[#662c91]'
                }`}
              >
                {lvl === 'all' ? 'All Levels' : `Level ${lvl}`}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Results List */}
      <div className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-8 shadow-xs">
        <div className="flex items-center justify-between mb-4 pb-3 border-b border-[#ebe7f0]">
          <h2 className="text-base sm:text-lg font-bold text-[#1d1823]">
            {query.trim()
              ? `Results for "${query.trim()}" (${matchedDocs.length})`
              : `Directory Index (${matchedDocs.length} shown)`}
          </h2>
          <span className="text-xs text-[#8b8794]">
            Total indexed: {allDocs.length} items
          </span>
        </div>

        {loading ? (
          <p className="py-8 text-center text-xs text-[#8b8794]">Loading search index...</p>
        ) : matchedDocs.length > 0 ? (
          <ul className="divide-y divide-[#ebe7f0]">
            {matchedDocs.map((item) => (
              <li key={item.id} className="py-3.5 first:pt-0 last:pb-0">
                <Link
                  href={item.path}
                  className="group flex items-start justify-between gap-4 hover:bg-[#f8f5fd] -mx-3 px-3 py-2 rounded-2xl transition-colors"
                >
                  <div>
                    <div className="flex flex-wrap items-center gap-2">
                      <span className="font-bold text-sm text-[#1d1823] group-hover:text-[#662c91]">
                        {item.name}
                      </span>
                      <span className="rounded-full bg-[#f4eff9] text-[#662c91] px-2 py-0.5 text-[10px] font-bold uppercase tracking-wider">
                        {item.type}
                      </span>
                      {item.level && (
                        <span className="rounded-full bg-[#fbeced] text-[#bd1e2c] px-2 py-0.5 text-[10px] font-bold">
                          Level {item.level}
                        </span>
                      )}
                    </div>
                    <p className="text-xs text-[#8b8794] mt-0.5">
                      {item.breadcrumb}
                    </p>
                  </div>
                  {item.resourceCount ? (
                    <span className="shrink-0 rounded-full bg-[#f4eff9] text-[#662c91] px-3 py-1 text-xs font-bold">
                      {item.resourceCount}
                    </span>
                  ) : null}
                </Link>
              </li>
            ))}
          </ul>
        ) : (
          <div className="py-10 text-center text-xs text-[#5c5766]">
            No matching TVET courses or units found for &ldquo;{query}&rdquo;. Try another search term.
          </div>
        )}
      </div>
    </div>
  );
}

export function SearchPageClient() {
  return (
    <Suspense fallback={<div className="p-8 text-center text-xs text-[#8b8794]">Loading search...</div>}>
      <SearchClientInner />
    </Suspense>
  );
}
