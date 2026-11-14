import Link from 'next/link';
import { ChevronRight, Home } from 'lucide-react';
import { BreadcrumbItem, buildBreadcrumbSchema } from '@/lib/jsonld';

export function Breadcrumbs({ items }: { items: BreadcrumbItem[] }) {
  const fullItems: BreadcrumbItem[] = [{ name: 'Home', path: '/' }, ...items];
  const schema = buildBreadcrumbSchema(fullItems);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(schema) }}
      />
      <nav aria-label="Breadcrumb" className="mb-6 text-xs sm:text-sm text-[#8b8794]">
        <ol className="flex flex-wrap items-center gap-1.5">
          {fullItems.map((item, idx) => {
            const isLast = idx === fullItems.length - 1;
            return (
              <li key={item.path + idx} className="flex items-center gap-1.5">
                {idx > 0 && <ChevronRight className="h-3 w-3 shrink-0 text-[#8b8794]" />}
                {isLast ? (
                  <span
                    className="font-medium text-[#1d1823]"
                    aria-current="page"
                  >
                    {item.name}
                  </span>
                ) : (
                  <Link
                    href={item.path}
                    className="inline-flex items-center gap-1 text-[#5c5766] hover:text-[#662c91] transition-colors"
                  >
                    {idx === 0 && <Home className="h-3.5 w-3.5" aria-hidden="true" />}
                    <span>{item.name}</span>
                  </Link>
                )}
              </li>
            );
          })}
        </ol>
      </nav>
    </>
  );
}
