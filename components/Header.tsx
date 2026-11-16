'use client';

import { useState } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import {
  Menu,
  X,
  ChevronDown,
  BookOpen,
  FileText,
  Search,
} from 'lucide-react';
import { HeaderSearch } from './HeaderSearch';

export function Header() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const pathname = usePathname();

  const isBlog = pathname?.startsWith('/blog');
  const isLevels = pathname?.startsWith('/levels');

  return (
    <header className="sticky top-0 z-40 w-full border-b border-[#ebe7f0] bg-white/95 backdrop-blur-md shadow-[0_1px_3px_rgba(31,15,51,0.04)]">
      {/* Top micro-bar for direct utility */}
      <div className="bg-[#4b1f6f] text-white text-[11px] py-1.5 px-4 hidden sm:block">
        <div className="mx-auto max-w-7xl flex items-center justify-center gap-6 font-medium">
          <Link href="/about/" className="hover:text-purple-200 transition-colors">
            About Us
          </Link>
          <Link href="/contact/" className="hover:text-purple-200 transition-colors">
            Contact Us
          </Link>
          <Link href="/privacy/" className="hover:text-purple-200 transition-colors">
            Privacy Policy
          </Link>
          <Link href="/terms/" className="hover:text-purple-200 transition-colors">
            Terms and Conditions
          </Link>
        </div>
      </div>

      {/* Main Header Bar */}
      <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between py-3 gap-3 md:gap-6">
          {/* Brand Logo */}
          <Link
            href="/"
            className="flex items-center shrink-0 group focus:outline-none"
            aria-label="EasyTVET Home"
          >
            <img
              src="/logo.jpg"
              alt="EasyTVET Hub"
              className="h-12 w-auto object-contain group-hover:scale-105 transition-transform"
            />
          </Link>

          {/* Search Bar - Center */}
          <div className="flex-1 max-w-md hidden md:block">
            <HeaderSearch />
          </div>

          {/* Desktop Nav Links */}
          <nav
            aria-label="Primary navigation"
            className="hidden lg:flex items-center gap-6 text-[13px] font-medium text-[#5c5766] uppercase tracking-wide"
          >
            <Link
              href="/"
              className={`hover:text-[#662c91] transition-colors ${
                pathname === '/' ? 'text-[#662c91] font-semibold' : ''
              }`}
            >
              Home
            </Link>

            <Link
              href="/modular-cdacc-courses-cycle-3/"
              className={`hover:text-[#662c91] transition-colors ${
                pathname?.includes('modular') ? 'text-[#662c91] font-semibold' : ''
              }`}
            >
              Modular CDACC
            </Link>

            <Link
              href="/cdacc-courses-cycle-1-and-2/"
              className={`hover:text-[#662c91] transition-colors ${
                pathname?.includes('cycle-1-and-2') ? 'text-[#662c91] font-semibold' : ''
              }`}
            >
              CDACC Courses
            </Link>

            <Link
              href="/knec-courses/"
              className={`hover:text-[#662c91] transition-colors ${
                pathname?.includes('knec') ? 'text-[#662c91] font-semibold' : ''
              }`}
            >
              KNEC Courses
            </Link>

            <div className="relative group">
              <button
                type="button"
                className={`flex items-center gap-1 hover:text-[#662c91] transition-colors ${
                  isLevels ? 'text-[#662c91] font-semibold' : ''
                }`}
              >
                Levels <ChevronDown className="h-3.5 w-3.5 text-[#8b8794] group-hover:text-[#662c91]" />
              </button>
              <div className="absolute top-full left-0 mt-2 hidden group-hover:block w-48 rounded-xl bg-white border border-[#ebe7f0] shadow-lg p-2 z-50 normal-case tracking-normal">
                <Link
                  href="/levels/level-6/"
                  className="flex items-center justify-between px-3 py-2 text-xs font-medium text-[#1d1823] hover:bg-[#f4eff9] hover:text-[#662c91] rounded-lg"
                >
                  <span>Level 6 (Diploma)</span>
                  <span className="text-[10px] bg-[#f4eff9] text-[#662c91] px-1.5 py-0.5 rounded font-bold">L6</span>
                </Link>
                <Link
                  href="/levels/level-5/"
                  className="flex items-center justify-between px-3 py-2 text-xs font-medium text-[#1d1823] hover:bg-[#f4eff9] hover:text-[#662c91] rounded-lg"
                >
                  <span>Level 5 (Certificate)</span>
                  <span className="text-[10px] bg-[#f4eff9] text-[#662c91] px-1.5 py-0.5 rounded font-bold">L5</span>
                </Link>
                <Link
                  href="/levels/level-4/"
                  className="flex items-center justify-between px-3 py-2 text-xs font-medium text-[#1d1823] hover:bg-[#f4eff9] hover:text-[#662c91] rounded-lg"
                >
                  <span>Level 4 (Artisan)</span>
                  <span className="text-[10px] bg-[#f4eff9] text-[#662c91] px-1.5 py-0.5 rounded font-bold">L4</span>
                </Link>
                <Link
                  href="/levels/level-3/"
                  className="flex items-center justify-between px-3 py-2 text-xs font-medium text-[#1d1823] hover:bg-[#f4eff9] hover:text-[#662c91] rounded-lg"
                >
                  <span>Level 3 (NSC)</span>
                  <span className="text-[10px] bg-[#f4eff9] text-[#662c91] px-1.5 py-0.5 rounded font-bold">L3</span>
                </Link>
              </div>
            </div>

            {/* Blog tab matching the screenshot active indicator */}
            <Link
              href="/blog/"
              className={`relative py-1 hover:text-[#662c91] transition-colors ${
                isBlog
                  ? 'text-[#662c91] font-semibold after:absolute after:bottom-0 after:left-0 after:right-0 after:h-0.5 after:bg-[#662c91]'
                  : ''
              }`}
            >
              Blog
            </Link>
          </nav>

          {/* Mobile menu trigger */}
          <div className="flex items-center gap-2.5 lg:hidden">
            <button
              type="button"
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="p-2 rounded-xl text-[#5c5766] hover:text-[#662c91] hover:bg-[#f4eff9] transition-colors"
              aria-label="Toggle navigation menu"
            >
              {mobileMenuOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
            </button>
          </div>
        </div>

        {/* Mobile Search Bar */}
        <div className="pb-3 md:hidden">
          <HeaderSearch />
        </div>
      </div>

      {/* Mobile Drawer Menu */}
      {mobileMenuOpen && (
        <div className="lg:hidden border-t border-[#ebe7f0] bg-white px-4 py-4 space-y-3 shadow-lg animate-in slide-in-from-top duration-200">
          <div className="grid grid-cols-2 gap-2 text-xs font-semibold pb-3 border-b border-[#ebe7f0]">
            <Link
              href="/levels/level-6/"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-[#f4eff9] text-[#662c91] text-center"
            >
              Level 6 Diploma
            </Link>
            <Link
              href="/levels/level-5/"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-[#f4eff9] text-[#662c91] text-center"
            >
              Level 5 Certificate
            </Link>
            <Link
              href="/levels/level-4/"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-[#f4eff9] text-[#662c91] text-center"
            >
              Level 4 Artisan
            </Link>
            <Link
              href="/levels/level-3/"
              onClick={() => setMobileMenuOpen(false)}
              className="p-2.5 rounded-xl bg-[#f4eff9] text-[#662c91] text-center"
            >
              Level 3 NSC
            </Link>
          </div>

          <nav className="flex flex-col space-y-1 text-sm font-medium text-[#1d1823]">
            <Link
              href="/"
              onClick={() => setMobileMenuOpen(false)}
              className="px-3 py-2 rounded-lg hover:bg-[#f4eff9] hover:text-[#662c91]"
            >
              Home
            </Link>
            <Link
              href="/modular-cdacc-courses-cycle-3/"
              onClick={() => setMobileMenuOpen(false)}
              className="px-3 py-2 rounded-lg hover:bg-[#f4eff9] hover:text-[#662c91]"
            >
              Modular CDACC Courses (Cycle 3)
            </Link>
            <Link
              href="/cdacc-courses-cycle-1-and-2/"
              onClick={() => setMobileMenuOpen(false)}
              className="px-3 py-2 rounded-lg hover:bg-[#f4eff9] hover:text-[#662c91]"
            >
              CDACC Courses (Cycle 1 &amp; 2)
            </Link>
            <Link
              href="/knec-courses/"
              onClick={() => setMobileMenuOpen(false)}
              className="px-3 py-2 rounded-lg hover:bg-[#f4eff9] hover:text-[#662c91]"
            >
              KNEC Courses &amp; Past Papers
            </Link>
            <Link
              href="/blog/"
              onClick={() => setMobileMenuOpen(false)}
              className="px-3 py-2 rounded-lg bg-[#f4eff9] text-[#662c91] font-semibold"
            >
              Blog
            </Link>
            <Link
              href="/about/"
              onClick={() => setMobileMenuOpen(false)}
              className="px-3 py-2 rounded-lg hover:bg-[#f4eff9] hover:text-[#662c91]"
            >
              About EasyTVET
            </Link>
            <Link
              href="/contact/"
              onClick={() => setMobileMenuOpen(false)}
              className="px-3 py-2 rounded-lg hover:bg-[#f4eff9] hover:text-[#662c91]"
            >
              Contact &amp; Inquiries
            </Link>
          </nav>
        </div>
      )}
    </header>
  );
}
