import { createClient, SupabaseClient } from '@supabase/supabase-js';

export function normalizeSupabaseUrl(rawUrl: string | undefined): string {
  if (!rawUrl || !rawUrl.trim()) {
    throw new Error(
      'Missing environment variable NEXT_PUBLIC_SUPABASE_URL. Please set it in .env.local or your deployment environment.'
    );
  }
  const trimmed = rawUrl.trim();
  if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
    return trimmed.replace(/\/+$/, '');
  }
  return `https://${trimmed}.supabase.co`;
}

export function getEnvConfig() {
  const rawUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  const siteUrl = process.env.NEXT_PUBLIC_SITE_URL;

  if (!rawUrl || !rawUrl.trim() || rawUrl === 'your-project-url') {
    throw new Error(
      'Build failed: Missing or invalid NEXT_PUBLIC_SUPABASE_URL environment variable. Set it in .env.local before building.'
    );
  }

  if (!anonKey || !anonKey.trim() || anonKey === 'your-anon-key') {
    throw new Error(
      'Build failed: Missing or invalid NEXT_PUBLIC_SUPABASE_ANON_KEY environment variable. Set it in .env.local before building.'
    );
  }

  if (!siteUrl || !siteUrl.trim()) {
    throw new Error(
      'Build failed: Missing NEXT_PUBLIC_SITE_URL environment variable. Set it in .env.local (e.g., https://easytvethub.com) before building.'
    );
  }

  return {
    supabaseUrl: normalizeSupabaseUrl(rawUrl),
    supabaseAnonKey: anonKey.trim(),
    siteUrl: siteUrl.trim().replace(/\/+$/, ''),
  };
}

let browserClient: SupabaseClient | null = null;

export function getSupabaseClient(): SupabaseClient {
  if (typeof window !== 'undefined' && browserClient) {
    return browserClient;
  }

  const { supabaseUrl, supabaseAnonKey } = getEnvConfig();
  const client = createClient(supabaseUrl, supabaseAnonKey, {
    auth: {
      persistSession: typeof window !== 'undefined',
      autoRefreshToken: typeof window !== 'undefined',
    },
  });

  if (typeof window !== 'undefined') {
    browserClient = client;
  }

  return client;
}
