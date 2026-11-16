import type { Metadata } from 'next';
import { getEnvConfig } from '@/lib/supabase';
import { Breadcrumbs } from '@/components/Breadcrumbs';

export async function generateMetadata(): Promise<Metadata> {
  const { siteUrl } = getEnvConfig();
  const title = 'Terms and Conditions | EasyTVET Kenya';
  const desc =
    'Read the Terms and Conditions governing the use of EasyTVET Kenya (easytvethub.com) educational resources and directory.';
  const url = `${siteUrl}/terms/`;

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

export default function TermsPage() {
  return (
    <div className="space-y-8">
      <Breadcrumbs items={[{ name: 'Terms and Conditions', path: '/terms/' }]} />

      <article className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs space-y-6">
        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight">
          Terms and Conditions
        </h1>

        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed">
          By accessing and using EasyTVET Kenya (<code className="text-xs font-mono bg-[#f4eff9] text-[#662c91] px-1.5 py-0.5 rounded">easytvethub.com</code>), you agree to comply with and be bound by the following Terms and Conditions. If you do not agree with any part of these terms, please discontinue use of the website.
        </p>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            1. Educational Use &amp; Permitted Access
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            All curriculum outlines, past papers, candidate tools, assessor guides, practical cutting lists, and study guides published on EasyTVET Kenya are provided strictly for non-commercial educational revision, teaching, and academic reference by Kenyan TVET trainees, trainers, and assessors.
          </p>
        </section>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            2. Intellectual Property &amp; Official Bodies
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            Official occupational standards, curricula, and examination papers remain the intellectual property of their respective examining and regulatory authorities, including TVET-CDACC, KNEC, TVETA, and KNQA. EasyTVET Kenya does not claim ownership over official examination documents and acts solely as an informational index and revision directory.
          </p>
        </section>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            3. Accuracy &amp; Disclaimer of Warranties
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            While our editorial team works to keep course structures, unit codes, and assessment resources accurate and up to date, EasyTVET Kenya makes no warranties regarding completeness or currency. Candidates and institutions should always confirm official examination timetables, syllabi, and circulars directly with their training institution, CDACC, or KNEC.
          </p>
        </section>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            4. Prohibited Conduct
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            Users may not scrape, mirror, redistribute for commercial resale, or interfere with the operation or availability of this platform. If you believe any document or link on this site infringes copyright or requires correction, please contact us at{' '}
            <a href="mailto:info@easytvethub.com" className="font-semibold text-[#662c91] underline">
              info@easytvethub.com
            </a>{' '}
            for prompt review.
          </p>
        </section>
      </article>
    </div>
  );
}
