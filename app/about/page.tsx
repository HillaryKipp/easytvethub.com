import type { Metadata } from 'next';
import Link from 'next/link';
import { getEnvConfig } from '@/lib/supabase';
import { Breadcrumbs } from '@/components/Breadcrumbs';
import { FAQSection } from '@/components/FAQSection';

export async function generateMetadata(): Promise<Metadata> {
  const { siteUrl } = getEnvConfig();
  const title = 'About EasyTVET Kenya - Free CDACC & KNEC Assessment Directory';
  const desc =
    'Learn how EasyTVET Kenya organizes Kenyan CDACC and KNEC technical courses, modular competency units, past papers, assessor guides, and candidate tools.';
  const url = `${siteUrl}/about/`;

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

export default function AboutPage() {
  const faqs = [
    {
      question: 'Are all past papers and assessor guides on EasyTVET free?',
      answer:
        'Yes. Every cutting list, candidate tool, assessor guide, past paper, and marking scheme linked in our directory is 100% free to access and download.',
    },
    {
      question: 'How is the curriculum hierarchy structured?',
      answer:
        'We organize Kenyan TVET curricula strictly by Programme → Academic Department → Course (with KNQF Level 3, 4, 5, or 6) → Module → Competency Unit → Assessment Resources.',
    },
  ];

  return (
    <div className="space-y-8">
      <Breadcrumbs items={[{ name: 'About', path: '/about/' }]} />

      <article className="rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs space-y-6">
        <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight">
          About EasyTVET Kenya
        </h1>

        <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed">
          EasyTVET Kenya is a dedicated public educational directory providing Kenyan Technical and Vocational Education and Training (TVET) students, trainers, and assessors with fast, structured access to competency-based curricula, modular units, past examination papers, candidate tools, assessor guides, and practical cutting lists across Levels 3, 4, 5, and 6.
        </p>

        <section className="space-y-3 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            Our Mission for Kenyan TVET Trainees &amp; Trainers
          </h2>
          <p className="text-[#5c5766] leading-relaxed text-xs sm:text-sm">
            With the rollout of the TVET CDACC Modularized Curriculum (Cycle 3) alongside existing CDACC (Cycle 1 &amp; 2) and KNEC technical programmes, finding the exact competency unit and its matching assessment tools can be challenging. We built EasyTVET as a clean, fast, mobile-friendly reference so learners at National Polytechnics, Technical Training Institutes (TTIs), and Vocational Training Centres can locate their exact course and module in seconds.
          </p>
        </section>

        <section className="space-y-3 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            Types of TVET Assessment Documents Indexed
          </h2>
          <ul className="list-disc list-inside space-y-2 text-xs sm:text-sm text-[#5c5766]">
            <li>
              <strong>Cutting Lists:</strong> Advance practical material and equipment lists required before practical assessments.
            </li>
            <li>
              <strong>Candidate Tools:</strong> Written and practical assessment papers and instructions for trainees.
            </li>
            <li>
              <strong>Assessor Guides:</strong> Standardized observation checklists and competency rubrics for registered TVET assessors.
            </li>
            <li>
              <strong>Past Papers &amp; Marking Schemes:</strong> Historical KNEC and CDACC written theory and practical exam papers.
            </li>
          </ul>
        </section>

        <div className="pt-4">
          <Link
            href="/"
            className="inline-flex items-center rounded-xl bg-[#662c91] hover:bg-[#4b1f6f] px-5 py-2.5 text-xs font-bold text-white transition-colors"
          >
            Browse All TVET Programmes &rarr;
          </Link>
        </div>
      </article>

      <FAQSection faqs={faqs} />
    </div>
  );
}
