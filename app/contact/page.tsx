import type { Metadata } from 'next';
import Link from 'next/link';
import { Mail, FileUp, MessageSquare } from 'lucide-react';
import { getEnvConfig } from '@/lib/supabase';
import { Breadcrumbs } from '@/components/Breadcrumbs';
import { FAQSection } from '@/components/FAQSection';

export async function generateMetadata(): Promise<Metadata> {
  const { siteUrl } = getEnvConfig();
  const title = 'Contact Us & Submit TVET Past Papers | EasyTVET';
  const desc =
    'Get in touch with EasyTVET to request missing CDACC or KNEC past papers, report broken download links, or contribute assessment tools.';
  const url = `${siteUrl}/contact/`;

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

export default function ContactPage() {
  const faqs = [
    {
      question: 'How can I contribute a missing past paper or cutting list?',
      answer:
        'Email us the PDF document or Google Drive share link along with the Course Name, Level, Module Number, and Unit Name so our team can verify and publish it.',
    },
    {
      question: 'How quickly are broken links fixed?',
      answer:
        'Reported broken download links are reviewed daily and updated in the next scheduled static build.',
    },
  ];

  return (
    <div className="space-y-8">
      <Breadcrumbs items={[{ name: 'Contact', path: '/contact/' }]} />

      <div className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs">
        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight mb-4">
          Contact EasyTVET Kenya
        </h1>

        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed mb-8 max-w-3xl">
          Have a question, found a broken PDF link, or want to share CDACC and KNEC past papers, cutting lists, candidate tools, or assessor guides with fellow Kenyan TVET trainees and trainers? Reach out to our directory team directly below.
        </p>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="rounded-2xl border border-[#ebe7f0] bg-[#f8f5fd] p-6">
            <div className="w-10 h-10 rounded-xl bg-[#f4eff9] text-[#662c91] flex items-center justify-center mb-3">
              <Mail className="h-5 w-5" />
            </div>
            <h2 className="text-base font-bold text-[#1d1823] mb-1">
              General Inquiries
            </h2>
            <p className="text-xs text-[#5c5766] mb-4">
              Questions about courses, modular units, or curriculum structure.
            </p>
            <a
              href="mailto:info@easytvethub.com"
              className="text-xs font-semibold text-[#662c91] hover:underline"
            >
              info@easytvethub.com
            </a>
          </div>

          <div className="rounded-2xl border border-[#ebe7f0] bg-[#f8f5fd] p-6">
            <div className="w-10 h-10 rounded-xl bg-[#fbeced] text-[#bd1e2c] flex items-center justify-center mb-3">
              <FileUp className="h-5 w-5" />
            </div>
            <h2 className="text-base font-bold text-[#1d1823] mb-1">
              Submit Past Papers
            </h2>
            <p className="text-xs text-[#5c5766] mb-4">
              Share PDF past papers, cutting lists, candidate tools, or assessor guides.
            </p>
            <a
              href="mailto:submissions@easytvethub.com"
              className="text-xs font-semibold text-[#bd1e2c] hover:underline"
            >
              submissions@easytvethub.com
            </a>
          </div>

          <div className="rounded-2xl border border-[#ebe7f0] bg-[#f8f5fd] p-6">
            <div className="w-10 h-10 rounded-xl bg-[#f4eff9] text-[#662c91] flex items-center justify-center mb-3">
              <MessageSquare className="h-5 w-5" />
            </div>
            <h2 className="text-base font-bold text-[#1d1823] mb-1">
              Feedback &amp; Corrections
            </h2>
            <p className="text-xs text-[#5c5766] mb-4">
              Report incorrect unit names, wrong course codes, or broken links.
            </p>
            <a
              href="mailto:editor@easytvethub.com"
              className="text-xs font-semibold text-[#662c91] hover:underline"
            >
              editor@easytvethub.com
            </a>
          </div>
        </div>
      </div>

      <FAQSection faqs={faqs} />
    </div>
  );
}
