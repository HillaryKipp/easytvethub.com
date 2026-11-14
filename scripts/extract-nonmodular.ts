import * as fs from 'fs';
import * as path from 'path';

interface ExtractedSection {
  heading: string;
  units: string[];
}

interface ExtractedCourse {
  deptNo: number;
  level: number;
  name: string;
  pageTitle: string;
  url: string;
  status: number;
  sections: ExtractedSection[];
  error?: string;
}

function decodeHtmlEntities(str: string): string {
  return str
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&#x27;/g, "'")
    .replace(/&nbsp;/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

function stripTags(html: string): string {
  return decodeHtmlEntities(html.replace(/<[^>]+>/g, ' '));
}

function parseCourseHtml(html: string): { pageTitle: string; sections: ExtractedSection[] } {
  const titleMatch = html.match(/<title[^>]*>([\s\S]*?)<\/title>/i);
  const pageTitle = titleMatch ? stripTags(titleMatch[1]).split('|')[0].trim() : '';

  const sections: ExtractedSection[] = [];

  // Find the units section if present, otherwise search main content
  const sectionStart = html.indexOf('et-course-units-section');
  let targetHtml = html;
  if (sectionStart !== -1) {
    // Cut up to book offer or footer
    const endIdx = html.indexOf('et-books-offer-section', sectionStart);
    targetHtml = endIdx !== -1 ? html.slice(sectionStart, endIdx) : html.slice(sectionStart);
  }

  // Match <h2>...</h2> followed by <ol>...</ol> or <ul>...</ul>
  const blockRegex = /<h2[^>]*>([\s\S]*?)<\/h2>\s*<(?:ol|ul)[^>]*>([\s\S]*?)<\/(?:ol|ul)>/gi;
  let match: RegExpExecArray | null;
  while ((match = blockRegex.exec(targetHtml)) !== null) {
    const heading = stripTags(match[1]);
    const listHtml = match[2];
    const units: string[] = [];

    const liRegex = /<li[^>]*>([\s\S]*?)<\/li>/gi;
    let liMatch: RegExpExecArray | null;
    while ((liMatch = liRegex.exec(listHtml)) !== null) {
      const unitText = stripTags(liMatch[1]);
      if (unitText.length > 0) {
        units.push(unitText);
      }
    }

    if (units.length > 0) {
      sections.push({ heading, units });
    }
  }

  // Fallback: if no <h2>+<ol> matched inside et-course-units-section, look for standalone <ol>
  if (sections.length === 0 && sectionStart !== -1) {
    const olRegex = /<ol[^>]*>([\s\S]*?)<\/ol>/gi;
    let olMatch: RegExpExecArray | null;
    let idx = 1;
    while ((olMatch = olRegex.exec(targetHtml)) !== null) {
      const listHtml = olMatch[1];
      const units: string[] = [];
      const liRegex = /<li[^>]*>([\s\S]*?)<\/li>/gi;
      let liMatch: RegExpExecArray | null;
      while ((liMatch = liRegex.exec(listHtml)) !== null) {
        const unitText = stripTags(liMatch[1]);
        if (unitText.length > 0) {
          units.push(unitText);
        }
      }
      if (units.length > 0) {
        sections.push({ heading: `Units ${idx}`, units });
        idx++;
      }
    }
  }

  return { pageTitle, sections };
}

async function fetchCourse(entry: { deptNo: number; level: number; name: string; url: string }): Promise<ExtractedCourse> {
  try {
    const res = await fetch(entry.url, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (compatible; EasyTVETHub-Seeder/1.0)',
      },
    });
    if (!res.ok) {
      return {
        ...entry,
        pageTitle: '',
        status: res.status,
        sections: [],
        error: `HTTP ${res.status}`,
      };
    }
    const html = await res.text();
    const { pageTitle, sections } = parseCourseHtml(html);
    return {
      ...entry,
      pageTitle,
      status: res.status,
      sections,
    };
  } catch (err: unknown) {
    return {
      ...entry,
      pageTitle: '',
      status: 0,
      sections: [],
      error: err instanceof Error ? err.message : String(err),
    };
  }
}

async function main() {
  const inputPath = path.resolve(__dirname, 'data/nonmodular-course-links.txt');
  const lines = fs
    .readFileSync(inputPath, 'utf-8')
    .split(/\r?\n/)
    .map(l => l.trim())
    .filter(l => l.length > 0 && !l.startsWith('#'));

  const entries = lines.map(line => {
    const [deptStr, levelStr, name, url] = line.split('|');
    return {
      deptNo: parseInt(deptStr, 10),
      level: parseInt(levelStr, 10),
      name: name.trim(),
      url: url.trim(),
    };
  });

  console.log(`Starting extraction for ${entries.length} courses...`);
  const results: ExtractedCourse[] = [];
  const CONCURRENCY = 6;

  for (let i = 0; i < entries.length; i += CONCURRENCY) {
    const batch = entries.slice(i, i + CONCURRENCY);
    const batchResults = await Promise.all(batch.map(fetchCourse));
    results.push(...batchResults);
    const done = Math.min(i + CONCURRENCY, entries.length);
    process.stdout.write(`\rFetched ${done}/${entries.length}...`);
    await new Promise(r => setTimeout(r, 150));
  }
  console.log('\nExtraction complete.');

  const outPath = path.resolve(__dirname, 'data/nonmodular-courses.json');
  fs.writeFileSync(outPath, JSON.stringify(results, null, 2), 'utf-8');

  let totalUnits = 0;
  const failures: ExtractedCourse[] = [];
  const emptyCourses: ExtractedCourse[] = [];

  for (const r of results) {
    const uCount = r.sections.reduce((acc, s) => acc + s.units.length, 0);
    totalUnits += uCount;
    if (r.status !== 200 || r.error) {
      failures.push(r);
    } else if (uCount === 0) {
      emptyCourses.push(r);
    }
  }

  console.log(`Total courses: ${results.length}`);
  console.log(`Total extracted units: ${totalUnits}`);
  console.log(`Failed fetches: ${failures.length}`);
  if (failures.length > 0) {
    for (const f of failures) {
      console.log(`  FAIL [${f.status}] ${f.name} (${f.url}): ${f.error}`);
    }
  }
  console.log(`Courses with 0 units: ${emptyCourses.length}`);
  if (emptyCourses.length > 0) {
    for (const e of emptyCourses) {
      console.log(`  EMPTY ${e.name} (${e.url})`);
    }
  }
}

main();
