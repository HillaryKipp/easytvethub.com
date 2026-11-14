import { HelpCircle } from 'lucide-react';
import { FAQItem } from '@/lib/types';
import { buildFAQPageSchema } from '@/lib/jsonld';

export function FAQSection({
  faqs,
  heading = 'Frequently Asked Questions',
}: {
  faqs: FAQItem[];
  heading?: string;
}) {
  if (!faqs || faqs.length === 0) return null;
  const schema = buildFAQPageSchema(faqs);

  return (
    <section className="mt-10 rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs">
      {schema && (
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
        />
      )}
      <div className="flex items-center gap-2.5 mb-6">
        <div className="w-8 h-8 rounded-xl bg-[#f4eff9] text-[#662c91] flex items-center justify-center shrink-0">
          <HelpCircle className="h-5 w-5" />
        </div>
        <h2 className="text-xl sm:text-2xl font-bold text-[#1d1823]">
          {heading}
        </h2>
      </div>
      <div className="divide-y divide-[#ebe7f0]">
        {faqs.map((item, idx) => (
          <div key={idx} className="py-4 first:pt-0 last:pb-0">
            <h3 className="text-sm sm:text-base font-bold text-[#1d1823] mb-1.5">
              {item.question}
            </h3>
            <p className="text-[#5c5766] leading-relaxed text-xs sm:text-sm">
              {item.answer}
            </p>
          </div>
        ))}
      </div>
    </section>
  );
}
