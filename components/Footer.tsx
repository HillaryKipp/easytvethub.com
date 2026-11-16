import Link from 'next/link';
import { ShieldCheck } from 'lucide-react';
import { DirectoryData } from '@/lib/types';

export function Footer(_props: { data?: DirectoryData }) {
  return (
    <footer className="mt-20 border-t border-[#311a4e] bg-[#1f0f33] text-[#d9d3e2]">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-14">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-10">
          {/* Column 1: Brand & Mission */}
          <div>
            <Link href="/" className="flex items-center gap-2.5 text-white mb-4">
              <img
                src="/logo.jpg"
                alt="EasyTVET Hub"
                className="h-10 w-10 rounded-xl object-contain bg-white p-0.5"
              />
              <div className="flex items-center leading-none">
                <span className="text-xl font-black tracking-tight text-white">EASY</span>
                <span className="text-xl font-black tracking-tight text-purple-300">TVET</span>
                <span className="ml-1 text-[10px] font-bold uppercase tracking-wider bg-[#bd1e2c] text-white px-1.5 py-0.5 rounded-full">
                  HUB
                </span>
              </div>
            </Link>
            <p className="text-sm text-[#b4adc4] leading-relaxed mb-4">
              The premier public directory of Kenyan TVET courses, modular units, and official assessment materials. Access CDACC cutting lists, candidate tools, assessor guides, and KNEC examination papers.
            </p>
            <div className="inline-flex items-center gap-1.5 text-xs text-purple-300 bg-white/5 border border-purple-500/20 px-3 py-1.5 rounded-xl">
              <ShieldCheck className="h-4 w-4 text-emerald-400" />
              <span>Verified Kenyan Technical Education Materials</span>
            </div>
          </div>

          {/* Column 2: Important Links */}
          <div>
            <h2 className="text-xs font-bold uppercase tracking-wider text-white mb-4">
              Important Links
            </h2>
            <ul className="space-y-2.5 text-sm">
              <li>
                <Link href="/about/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  About Us
                </Link>
              </li>
              <li>
                <Link href="/contact/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  Contact Us
                </Link>
              </li>
              <li>
                <Link href="/privacy/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  Privacy Policy
                </Link>
              </li>
              <li>
                <Link href="/terms/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  Terms and Conditions
                </Link>
              </li>
            </ul>
          </div>

          {/* Column 3: Latest Publications & Resources */}
          <div>
            <h2 className="text-xs font-bold uppercase tracking-wider text-white mb-4">
              Publications &amp; Resources
            </h2>
            <ul className="space-y-2.5 text-sm">
              <li>
                <Link href="/blog/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  Latest Publications &amp; Blog
                </Link>
              </li>
              <li>
                <Link href="/search/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  Instant Directory Search
                </Link>
              </li>
            </ul>

            <div className="mt-6 p-3.5 rounded-xl bg-white/5 border border-purple-500/10 text-xs text-[#b4adc4] leading-relaxed">
              Official past paper files and curriculum frameworks are curated for public educational review under fair dealing in Kenya.
            </div>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="mt-12 pt-6 border-t border-[#311a4e] flex flex-col sm:flex-row items-center justify-between text-xs text-[#8b8794] gap-4">
          <p>© {new Date().getFullYear()} EasyTVET Kenya. All rights reserved.</p>
          <p className="flex items-center gap-1 text-[#b4adc4]">
            Designed for simplicity, accessibility and Kenyan technical training excellence.
          </p>
        </div>
      </div>
    </footer>
  );
}
