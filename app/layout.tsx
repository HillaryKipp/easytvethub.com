import type { Metadata } from 'next';
import './globals.css';
import { Header } from '@/components/Header';
import { Footer } from '@/components/Footer';
import { CookieNotice, AnalyticsAndAdsPlaceholder } from '@/components/CookieNotice';
import { getDirectoryData } from '@/lib/data';
import { getEnvConfig } from '@/lib/supabase';
import { buildWebsiteAndOrgSchema } from '@/lib/jsonld';

export async function generateMetadata(): Promise<Metadata> {
  const { siteUrl } = getEnvConfig();
  return {
    metadataBase: new URL(siteUrl),
    title: {
      default: 'TVET Papers Kenya - CDACC & KNEC Past Papers, Assessor Guides & Candidate Tools',
      template: '%s',
    },
    description:
      'Download free Kenyan TVET past papers, CDACC assessor guides, candidate tools, cutting lists, and KNEC examination papers across Levels 3, 4, 5, and 6.',
    alternates: {
      canonical: `${siteUrl}/`,
    },
    openGraph: {
      type: 'website',
      siteName: 'TVET Papers Kenya',
      title: 'TVET Papers Kenya - CDACC & KNEC Past Papers, Assessor Guides & Candidate Tools',
      description:
        'Download free Kenyan TVET past papers, CDACC assessor guides, candidate tools, cutting lists, and KNEC examination papers across Levels 3, 4, 5, and 6.',
      url: `${siteUrl}/`,
      images: [
        {
          url: '/og-default.png',
          width: 1200,
          height: 630,
          alt: 'TVET Papers Kenya - Public Directory of Kenyan TVET Courses and Past Papers',
        },
      ],
    },
    twitter: {
      card: 'summary_large_image',
      title: 'TVET Papers Kenya - CDACC & KNEC Past Papers, Assessor Guides & Candidate Tools',
      description:
        'Download free Kenyan TVET past papers, CDACC assessor guides, candidate tools, cutting lists, and KNEC examination papers.',
      images: ['/og-default.png'],
    },
  };
}

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const data = await getDirectoryData();
  const globalSchemas = buildWebsiteAndOrgSchema();

  return (
    <html lang="en">
      <head>
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(globalSchemas) }}
        />
        <AnalyticsAndAdsPlaceholder />
      </head>
      <body className="min-h-screen flex flex-col bg-[#f7f5fa] text-[#1d1823] antialiased">
        <Header />
        <main className="flex-1 mx-auto w-full max-w-7xl px-4 sm:px-6 lg:px-8 py-6 sm:py-8">
          {children}
        </main>
        <Footer data={data} />
        <CookieNotice />
      </body>
    </html>
  );
}
