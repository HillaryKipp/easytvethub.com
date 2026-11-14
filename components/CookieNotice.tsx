'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';

const STORAGE_KEY = 'tvet_cookie_consent_v1';

export function CookieNotice() {
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    try {
      const saved = localStorage.getItem(STORAGE_KEY);
      if (!saved) {
        setVisible(true);
      }
    } catch {
      // Ignore storage access errors
    }
  }, []);

  const accept = () => {
    try {
      localStorage.setItem(STORAGE_KEY, 'accepted');
    } catch {
      // Ignore
    }
    setVisible(false);
  };

  if (!visible) return null;

  return (
    <div
      role="region"
      aria-label="Cookie and privacy notice"
      className="fixed bottom-4 left-4 right-4 sm:left-auto sm:right-6 sm:max-w-md z-50 rounded-2xl border border-[#ebe7f0] bg-white p-4 shadow-xl"
    >
      <p className="text-xs text-[#5c5766] leading-relaxed">
        We use essential local storage to remember your preferences and improve access to Kenyan TVET past papers. Read our{' '}
        <Link href="/privacy/" className="font-semibold text-[#662c91] underline">
          Privacy &amp; Cookie Policy
        </Link>
        .
      </p>
      <div className="mt-3 flex items-center justify-end gap-2">
        <button
          type="button"
          onClick={accept}
          className="rounded-xl bg-[#662c91] hover:bg-[#4b1f6f] px-4 py-1.5 text-xs font-semibold text-white transition-colors cursor-pointer"
        >
          Got it
        </button>
      </div>
    </div>
  );
}

export function AnalyticsAndAdsPlaceholder() {
  const enabled = process.env.NEXT_PUBLIC_ENABLE_ANALYTICS === 'true';
  if (!enabled) return null;

  return (
    <>
      {/* Placeholder for Google Analytics / Google AdSense script when enabled */}
    </>
  );
}
