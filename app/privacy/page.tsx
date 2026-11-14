import type { Metadata } from 'next';
import { getEnvConfig } from '@/lib/supabase';
import { Breadcrumbs } from '@/components/Breadcrumbs';

export async function generateMetadata(): Promise<Metadata> {
  const { siteUrl } = getEnvConfig();
  const title = 'Privacy Policy & Cookie Notice | EasyTVET';
  const desc =
    'Read the Privacy Policy and Cookie Notice for EasyTVET. Learn how we protect user privacy while serving free Kenyan TVET past papers.';
  const url = `${siteUrl}/privacy/`;

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

export default function PrivacyPage() {
  return (
    <div className="space-y-8">
      <Breadcrumbs items={[{ name: 'Privacy Policy', path: '/privacy/' }]} />

      <article className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs space-y-6">
        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight">
          Privacy Policy &amp; Cookie Notice
        </h1>

        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed">
          EasyTVET respects the privacy of all Kenyan TVET students, trainers, and visitors. Because our public directory is generated as static HTML pages, you can browse courses, search units, and download PDF assessment documents without creating an account or submitting personal data.
        </p>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            1. Information We Collect
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            We do not require user registration for public visitors. When you browse our website or download files, standard anonymous web server logs may be processed by our static hosting provider for security and reliability.
          </p>
        </section>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            2. Cookies &amp; Local Storage
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            We use browser local storage strictly to remember when you dismiss the cookie notice banner. Cookies may be used to measure aggregate traffic or personalize educational content in accordance with Google publisher standards.
          </p>
        </section>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            3. External Download Links
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            Assessment PDFs may be hosted on external storage providers (such as Google Drive or institutional repositories). All download links open in a new tab with <code className="text-xs font-mono bg-[#f4eff9] text-[#662c91] px-1.5 py-0.5 rounded">rel=&quot;noopener noreferrer&quot;</code> for your security.
          </p>
        </section>
      </article>
    </div>
  );
}
