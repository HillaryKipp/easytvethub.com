import { FAQItem } from '@/lib/types';
import { buildFAQPageSchema } from '@/lib/jsonld';

export function FAQSection({
  faqs,
  heading = 'Frequently Asked Questions',
  embedded = false,
}: {
  faqs: FAQItem[];
  heading?: string;
  embedded?: boolean;
}) {
  if (!faqs || faqs.length === 0) return null;
  const schema = buildFAQPageSchema(faqs);

  return (
    <section
      id="frequently-asked-questions"
      className={
        embedded
          ? 'mt-10 pt-8 border-t border-[#ebe7f0]'
          : 'mt-10 rounded-3xl border border-[#ebe7f0] bg-white p-6 sm:p-10 shadow-xs'
      }
    >
      {schema && (
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
        />
      )}
      <h2 className="mb-4 text-xl sm:text-2xl font-bold tracking-tight text-[#1d1823] scroll-mt-28">
        {heading}
      </h2>
      <div className="space-y-5">
        {faqs.map((item, idx) => (
          <div key={idx} className="pt-2">
            <h3 className="text-base sm:text-lg font-bold text-[#1d1823] mb-2">
              {item.question}
            </h3>
            <p className="text-[#5c5766] leading-relaxed text-[15px] sm:text-base">
              {item.answer}
            </p>
          </div>
        ))}
      </div>
    </section>
  );
}
