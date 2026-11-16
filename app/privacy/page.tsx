import type { Metadata } from 'next';
import { getEnvConfig } from '@/lib/supabase';
import { Breadcrumbs } from '@/components/Breadcrumbs';

export async function generateMetadata(): Promise<Metadata> {
  const { siteUrl } = getEnvConfig();
  const title = 'Privacy Policy, AdSense & Cookie Notice | EasyTVET Kenya';
  const desc =
    'Read the Privacy Policy, Google AdSense advertising disclosure, and Cookie Notice for EasyTVET Kenya (easytvethub.com).';
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
          EasyTVET Kenya (`easytvethub.com`) respects the privacy of all Kenyan TVET students, trainers, assessors, and visitors. Because our public educational directory is generated as static HTML pages, you can browse courses, read study guides, search competency units, and download PDF assessment documents without creating an account or submitting personal identification data.
        </p>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            1. Information We Collect
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            We do not require user registration for public visitors. When you browse our website or download files, standard anonymous web server logs (such as browser type, referring page, date/time of visit, and anonymized IP address) may be processed by our hosting provider strictly for network security, performance monitoring, and reliability. If you contact us voluntarily via email (`info@easytvethub.com` or `submissions@easytvethub.com`), we use your email address solely to respond to your inquiry.
          </p>
        </section>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            2. Cookies, Local Storage &amp; Google AdSense Disclosure
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            We use browser local storage to remember when you dismiss our cookie consent banner. In addition, EasyTVET Kenya may display advertisements served by **Google AdSense** and third-party advertising partners to help keep our educational directory and study guides 100% free for students:
          </p>
          <ul className="list-disc list-inside space-y-1.5 text-xs sm:text-sm text-[#5c5766] pl-1">
            <li>
              Third-party vendors, including Google, use cookies (such as the Google advertising cookie) to serve ads based on a user&apos;s prior visits to this website or other websites on the internet.
            </li>
            <li>
              Google&apos;s use of advertising cookies enables it and its partners to serve relevant advertisements to users based on their visit to `easytvethub.com` and/or other sites on the internet.
            </li>
            <li>
              Users may opt out of personalized advertising at any time by visiting{' '}
              <a
                href="https://www.google.com/settings/ads"
                target="_blank"
                rel="noopener noreferrer"
                className="font-semibold text-[#662c91] underline"
              >
                Google Ads Settings
              </a>{' '}
              or by visiting{' '}
              <a
                href="https://www.aboutads.info"
                target="_blank"
                rel="noopener noreferrer"
                className="font-semibold text-[#662c91] underline"
              >
                www.aboutads.info
              </a>
              .
            </li>
          </ul>
        </section>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            3. Kenya Data Protection Act Compliance
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            In accordance with the **Kenya Data Protection Act, 2019** and international privacy standards (GDPR/CCPA), visitors have the right to request access to, correction of, or deletion of any personal correspondence sent to our editorial desk by emailing <a href="mailto:info@easytvethub.com" className="font-semibold text-[#662c91] underline">info@easytvethub.com</a>.
          </p>
        </section>

        <section className="space-y-2 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            4. External Links &amp; Document Hosting
          </h2>
          <p className="text-xs sm:text-sm text-[#5c5766] leading-relaxed">
            Assessment PDFs and official circulars referenced on our platform may link to external storage repositories or official government portals (`cdacc.go.ke`, `knec.ac.ke`, `tveta.go.ke`, `knqa.go.ke`). All external links open with <code className="text-xs font-mono bg-[#f4eff9] text-[#662c91] px-1.5 py-0.5 rounded">rel=&quot;noopener noreferrer&quot;</code> for your security.
          </p>
        </section>
      </article>
    </div>
  );
}
