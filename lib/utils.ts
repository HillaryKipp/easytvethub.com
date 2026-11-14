import { ResourceType } from './types';

export function slugify(text: string): string {
  return text
    .toLowerCase()
    .trim()
    .replace(/&/g, ' and ')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .replace(/-{2,}/g, '-');
}

export function makeUniqueSlug(baseName: string, existingSlugs: Set<string>): string {
  const base = slugify(baseName) || 'item';
  if (!existingSlugs.has(base)) {
    existingSlugs.add(base);
    return base;
  }
  let counter = 2;
  while (existingSlugs.has(`${base}-${counter}`)) {
    counter++;
  }
  const unique = `${base}-${counter}`;
  existingSlugs.add(unique);
  return unique;
}

export function detectLevelFromName(name: string): number | null {
  const match = name.match(/\bLEVEL\s*(\d+)\b/i);
  if (match && match[1]) {
    return parseInt(match[1], 10);
  }
  return null;
}

export function stripLevelSuffix(name: string): string {
  return name
    .replace(/\s*\bLEVEL\s*\d+\b\s*/gi, '')
    .replace(/[-_]+/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
    .toUpperCase();
}

export function toTitleCase(str: string): string {
  if (!str) return '';
  const minorWords = new Set(['a', 'an', 'and', 'as', 'at', 'but', 'by', 'for', 'in', 'nor', 'of', 'on', 'or', 'so', 'the', 'to', 'up', 'yet', 'with']);
  const acronyms = new Set(['ICT', 'CDACC', 'KNEC', 'TVET', 'GIS', 'HIV', 'AIDS', 'PPE', 'OHS', 'OSHA', 'AI', 'HR', 'PR', 'UI', 'UX']);

  return str
    .split(/\s+/)
    .map((word, index) => {
      const clean = word.replace(/[^a-zA-Z0-9]/g, '').toUpperCase();
      if (acronyms.has(clean)) {
        return word.toUpperCase();
      }
      const lower = word.toLowerCase();
      if (index > 0 && minorWords.has(lower)) {
        return lower;
      }
      return lower.replace(/(^|[\(\-\/])([a-z])/g, (_, sep, char) => sep + char.toUpperCase());
    })
    .join(' ');
}

export const RESOURCE_TYPE_LABELS: Record<ResourceType, string> = {
  cutting_list: 'Cutting List',
  candidate_tool: 'Candidate Tool',
  assessor_guide: 'Assessor Guide',
  past_paper: 'Past Paper',
  marking_scheme: 'Marking Scheme',
  other: 'Assessment Document',
};

export function formatResourceType(type: ResourceType): string {
  return RESOURCE_TYPE_LABELS[type] || 'Assessment Document';
}

export function getAutoResourceTitle(type: ResourceType): string {
  return `Download ${formatResourceType(type)}`;
}

export function getFileExtensionLabel(url: string): string {
  try {
    const cleanUrl = url.split('?')[0].toLowerCase();
    if (cleanUrl.endsWith('.pdf')) return 'PDF';
    if (cleanUrl.endsWith('.docx') || cleanUrl.endsWith('.doc')) return 'DOCX';
    if (cleanUrl.endsWith('.xlsx') || cleanUrl.endsWith('.xls')) return 'XLSX';
    if (cleanUrl.endsWith('.zip')) return 'ZIP';
    if (url.includes('drive.google.com')) return 'PDF / Drive';
    return 'PDF';
  } catch {
    return 'PDF';
  }
}

export function convertGoogleDriveLink(url: string): string {
  const trimmed = url.trim();
  // Match https://drive.google.com/file/d/FILE_ID/view...
  const fileMatch = trimmed.match(/drive\.google\.com\/file\/d\/([a-zA-Z0-9_-]+)/);
  if (fileMatch && fileMatch[1]) {
    return `https://drive.google.com/uc?export=download&id=${fileMatch[1]}`;
  }
  // Match https://drive.google.com/open?id=FILE_ID
  const openMatch = trimmed.match(/drive\.google\.com\/open\?id=([a-zA-Z0-9_-]+)/);
  if (openMatch && openMatch[1]) {
    return `https://drive.google.com/uc?export=download&id=${openMatch[1]}`;
  }
  return trimmed;
}

export function formatDate(isoString: string | null | undefined): string {
  if (!isoString) return 'Recently';
  try {
    const d = new Date(isoString);
    return d.toLocaleDateString('en-KE', {
      year: 'numeric',
      month: 'long',
      day: 'numeric',
    });
  } catch {
    return 'Recently';
  }
}

export function truncateDescription(text: string, maxLength = 158): string {
  const clean = text.replace(/\s+/g, ' ').trim();
  if (clean.length <= maxLength) return clean;
  const sliced = clean.slice(0, maxLength - 1);
  const lastSpace = sliced.lastIndexOf(' ');
  return (lastSpace > 100 ? sliced.slice(0, lastSpace) : sliced) + '…';
}
