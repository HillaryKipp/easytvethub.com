import type { MetadataRoute } from 'next';
import { getEnvConfig } from '@/lib/supabase';

export const dynamic = 'force-static';

export default function robots(): MetadataRoute.Robots {
  const { siteUrl } = getEnvConfig();
  return {
    rules: {
      userAgent: '*',
      allow: '/',
      disallow: ['/admin', '/admin/'],
    },
    sitemap: `${siteUrl}/sitemap.xml`,
  };
}
