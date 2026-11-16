import type { Metadata } from 'next';
import Link from 'next/link';
import { getEnvConfig } from '@/lib/supabase';
import { Breadcrumbs } from '@/components/Breadcrumbs';
import { FAQSection } from '@/components/FAQSection';

export async function generateMetadata(): Promise<Metadata> {
  const { siteUrl } = getEnvConfig();
  const title = 'About EasyTVET Kenya - Free CDACC & KNEC Assessment Directory & Study Guides';
  const desc =
    'Learn how EasyTVET Kenya organizes Kenyan CDACC and KNEC technical courses, modular competency units, past papers, assessor guides, candidate tools, and editorial revision guides.';
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
      question: 'Are all past papers, assessor guides, and study guides on EasyTVET free?',
      answer:
        'Yes. Every cutting list, candidate tool, assessor guide, past paper, marking scheme, and editorial revision guide published on EasyTVET Hub is 100% free to access and download without registration.',
    },
    {
      question: 'How is the Kenyan TVET curriculum hierarchy structured on EasyTVET?',
      answer:
        'We organize Kenyan TVET curricula strictly by Programme Framework (Cycle 3 Modular CDACC, Cycle 1 & 2 Non-Modular CDACC, and KNEC) → Academic Department → Accredited Course (with KNQF Level 3, 4, 5, or 6) → Module → Competency Unit → Assessment Resources & Study Guides.',
    },
    {
      question: 'Who authors and reviews the revision guides and course spotlights?',
      answer:
        'All articles, curriculum breakdowns, and assessment guides on EasyTVET are authored and peer-reviewed by experienced Kenyan TVET educators, curriculum specialists, and accredited technical assessors led by Hillary Kipkorir and the EasyTVET Editorial Board.',
    },
    {
      question: 'Is EasyTVET affiliated with TVET-CDACC or KNEC?',
      answer:
        'EasyTVET Hub is an independent public educational resource and curriculum directory built by Kenyan technical educators. Official occupational standards and national examinations remain the property of TVET-CDACC, KNEC, TVETA, and KNQA.',
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
          EasyTVET Kenya (`easytvethub.com`) is a dedicated public educational resource and curriculum directory providing Kenyan Technical and Vocational Education and Training (TVET) trainees, trainers, and assessors with fast, structured access to competency-based curricula, modular units, past examination papers, candidate tools, assessor guides, practical cutting lists, and in-depth revision articles across KNQF Levels 3, 4, 5, and 6.
        </p>

        <section className="space-y-3 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            Our Mission for Kenyan TVET Trainees &amp; Trainers
          </h2>
          <p className="text-[#5c5766] leading-relaxed text-xs sm:text-sm">
            With the nationwide rollout of the TVET-CDACC Modularized Curriculum (Cycle 3) alongside existing CDACC (Cycle 1 &amp; 2) and KNEC technical programmes, finding the exact competency unit, understanding its practical performance criteria, and locating matching assessment tools can be challenging. We built EasyTVET as a clean, fast, mobile-friendly academic reference so learners at National Polytechnics, Technical Training Institutes (TTIs), and Vocational Training Centres (VTCs) across all 47 counties can locate their exact course, module, and revision roadmap in seconds.
          </p>
        </section>

        <section className="space-y-3 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            Editorial Standards &amp; Quality Assurance
          </h2>
          <p className="text-[#5c5766] leading-relaxed text-xs sm:text-sm">
            Every course overview, competency study guide, and editorial article published on EasyTVET Hub is written and reviewed by practicing Kenyan TVET trainers and accredited technical assessors. We cross-reference our course structures against official **TVET-CDACC Occupational Standards (OS)**, **Kenya National Qualifications Framework (KNQF)** level descriptors, and **KNEC** technical syllabi, as well as industry licensing frameworks from **EPRA**, **NCA**, **KASNEB**, **NITA**, and **KNDI**.
          </p>
        </section>

        <section className="space-y-3 pt-4 border-t border-[#ebe7f0]">
          <h2 className="text-lg font-bold text-[#1d1823]">
            Types of TVET Assessment Documents &amp; Guides Provided
          </h2>
          <ul className="list-disc list-inside space-y-2 text-xs sm:text-sm text-[#5c5766]">
            <li>
              <strong>Cutting Lists:</strong> Advance practical material, reagent, and equipment specification lists issued prior to practical assessments.
            </li>
            <li>
              <strong>Candidate Tools:</strong> Written and practical assessment papers, technical drawings, and task instructions for trainees.
            </li>
            <li>
              <strong>Assessor Guides:</strong> Standardized observation checklists and process/product marking rubrics for registered TVET assessors.
            </li>
            <li>
              <strong>Past Papers &amp; Marking Schemes:</strong> Historical KNEC and CDACC written theory and practical examination papers.
            </li>
            <li>
              <strong>Original Revision Guides &amp; Course Spotlights:</strong> Long-form tactical guides covering PoE compilation, industrial attachment, KUCCPS/HELB funding, and trade licensing.
            </li>
          </ul>
        </section>

        <div className="pt-4 flex flex-wrap gap-3">
          <Link
            href="/"
            className="inline-flex items-center rounded-xl bg-[#662c91] hover:bg-[#4b1f6f] px-5 py-2.5 text-xs font-bold text-white transition-colors"
          >
            Browse All TVET Programmes &rarr;
          </Link>
          <Link
            href="/blog/"
            className="inline-flex items-center rounded-xl border border-[#ebe7f0] bg-[#f8f5fd] hover:border-[#662c91] px-5 py-2.5 text-xs font-bold text-[#662c91] transition-colors"
          >
            Read TVET Revision Guides &rarr;
          </Link>
        </div>
      </article>

      <FAQSection faqs={faqs} />
    </div>
  );
}
