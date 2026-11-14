import Link from 'next/link';
import { GraduationCap, ShieldCheck, Heart } from 'lucide-react';
import { DirectoryData } from '@/lib/types';
import { toTitleCase } from '@/lib/utils';

export function Footer({ data }: { data: DirectoryData }) {
  const progById = new Map(data.programmes.map((p) => [p.id, p]));

  return (
    <footer className="mt-20 border-t border-[#311a4e] bg-[#1f0f33] text-[#d9d3e2]">
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-14">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-10">
          {/* Column 1: Brand & Mission */}
          <div>
            <Link href="/" className="flex items-center gap-2.5 text-white mb-4">
              <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-[#662c91] text-white">
                <GraduationCap className="h-5 w-5" />
              </div>
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

          {/* Column 2: All Programmes */}
          <div>
            <h2 className="text-xs font-bold uppercase tracking-wider text-white mb-4">
              TVET Examination Programmes
            </h2>
            <ul className="space-y-2.5 text-sm">
              {data.programmes.length > 0 ? (
                data.programmes.map((prog) => (
                  <li key={prog.id}>
                    <Link
                      href={`/${prog.slug}/`}
                      className="text-[#d9d3e2] hover:text-white transition-colors"
                    >
                      {prog.name}
                    </Link>
                  </li>
                ))
              ) : (
                <>
                  <li>
                    <span className="text-[#8b8794]">Modular CDACC Courses (Cycle 3)</span>
                  </li>
                  <li>
                    <span className="text-[#8b8794]">CDACC Courses (Cycle 1 &amp; 2)</span>
                  </li>
                  <li>
                    <span className="text-[#8b8794]">KNEC Courses</span>
                  </li>
                </>
              )}
            </ul>

            <h2 className="text-xs font-bold uppercase tracking-wider text-white mt-8 mb-3">
              Qualification Levels
            </h2>
            <ul className="grid grid-cols-2 gap-2 text-sm">
              {data.levels.map((lvl) => (
                <li key={lvl}>
                  <Link
                    href={`/levels/level-${lvl}/`}
                    className="inline-flex items-center text-[#d9d3e2] hover:text-white transition-colors"
                  >
                    Level {lvl} Courses
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Column 3: All Departments */}
          <div>
            <h2 className="text-xs font-bold uppercase tracking-wider text-white mb-4">
              Academic Departments
            </h2>
            {data.departments.length > 0 ? (
              <ul className="space-y-2.5 text-sm max-h-64 overflow-y-auto pr-2">
                {data.departments.map((dept) => {
                  const prog = progById.get(dept.programme_id);
                  if (!prog) return null;
                  return (
                    <li key={dept.id}>
                      <Link
                        href={`/${prog.slug}/${dept.slug}/`}
                        className="text-[#d9d3e2] hover:text-white transition-colors block truncate"
                      >
                        {toTitleCase(dept.name)}
                      </Link>
                    </li>
                  );
                })}
              </ul>
            ) : (
              <p className="text-sm text-[#8b8794]">Departments will appear once loaded.</p>
            )}
          </div>

          {/* Column 4: Resources & Links */}
          <div>
            <h2 className="text-xs font-bold uppercase tracking-wider text-white mb-4">
              Resources &amp; Information
            </h2>
            <ul className="space-y-2.5 text-sm">
              <li>
                <Link href="/blog/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  TVET News, Circulars &amp; Guides
                </Link>
              </li>
              <li>
                <Link href="/search/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  Instant Directory Search
                </Link>
              </li>
              <li>
                <Link href="/about/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  About EasyTVET
                </Link>
              </li>
              <li>
                <Link href="/contact/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  Contact Editorial Board
                </Link>
              </li>
              <li>
                <Link href="/privacy/" className="text-[#d9d3e2] hover:text-white transition-colors">
                  Privacy Policy &amp; Data Rights
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
