import Link from 'next/link';
import { Search, Home, Layers } from 'lucide-react';

export default function NotFound() {
  return (
    <div className="mx-auto max-w-2xl py-16 text-center">
      <div className="inline-flex h-16 w-16 items-center justify-center rounded-2xl bg-[#f4eff9] text-[#662c91] font-extrabold text-2xl mb-6 shadow-xs">
        404
      </div>
      <h1 className="text-2xl sm:text-4xl font-extrabold text-[#1d1823] tracking-tight mb-4">
        Page Not Found
      </h1>
      <p className="text-sm sm:text-base text-[#5c5766] leading-relaxed mb-8 max-w-xl mx-auto">
        The Kenyan TVET course, modular unit, or assessment page you are looking for may have moved or had its link updated. Use our instant search or browse by qualification level below.
      </p>

      <div className="flex flex-wrap items-center justify-center gap-3">
        <Link
          href="/"
          className="inline-flex items-center gap-2 rounded-xl bg-[#662c91] hover:bg-[#4b1f6f] px-5 py-2.5 text-xs font-bold text-white transition-colors shadow-xs"
        >
          <Home className="h-4 w-4" />
          Back to Home
        </Link>
        <Link
          href="/search/"
          className="inline-flex items-center gap-2 rounded-xl border border-[#ebe7f0] bg-white hover:border-[#662c91] hover:text-[#662c91] px-5 py-2.5 text-xs font-bold text-[#1d1823] transition-colors"
        >
          <Search className="h-4 w-4 text-[#662c91]" />
          Search Directory
        </Link>
        <Link
          href="/levels/level-6/"
          className="inline-flex items-center gap-2 rounded-xl border border-[#ebe7f0] bg-white hover:border-[#662c91] hover:text-[#662c91] px-5 py-2.5 text-xs font-bold text-[#1d1823] transition-colors"
        >
          <Layers className="h-4 w-4 text-[#662c91]" />
          Level 6 Diploma Hub
        </Link>
      </div>
    </div>
  );
}
