import type { Metadata } from 'next';
import { getEnvConfig } from '@/lib/supabase';
import { Breadcrumbs } from '@/components/Breadcrumbs';
import { SearchPageClient } from '@/components/SearchPageClient';

export async function generateMetadata(): Promise<Metadata> {
  const { siteUrl } = getEnvConfig();
  const title = 'Search Kenyan TVET Courses, Units & Past Papers | TVET Papers Kenya';
  const desc =
    'Instant typo-tolerant search across Kenyan TVET CDACC & KNEC courses, modular competency units, past papers, candidate tools, and assessor guides.';
  const url = `${siteUrl}/search/`;

  return {
    title,
    description: desc,
    alternates: { canonical: url },
    openGraph: {
      title,
      description: desc,
      url,
      images: [{ url: '/og-default.png', width: 1200, height: 630, alt: title }],
    },
    twitter: { card: 'summary_large_image', title, description: desc, images: ['/og-default.png'] },
  };
}

export default function SearchPage() {
  return (
    <div>
      <Breadcrumbs items={[{ name: 'Search Directory', path: '/search/' }]} />

      <header className="mb-8">
        <h1 className="text-2xl sm:text-4xl font-extrabold text-slate-900 dark:text-white tracking-tight mb-3">
          Search Kenyan TVET Courses, Units &amp; Past Papers
        </h1>
        <p className="text-base sm:text-lg text-slate-700 dark:text-slate-300 leading-relaxed max-w-3xl">
          Use the instant client-side search engine below to find any accredited Kenyan TVET course, modular competency unit, or downloadable assessment package across Modular CDACC (Cycle 3), CDACC (Cycle 1 &amp; 2), and KNEC qualifications.
        </p>
      </header>

      <SearchPageClient />
    </div>
  );
}
