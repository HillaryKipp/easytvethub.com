import * as fs from 'fs';
import * as path from 'path';

interface DriveEntry {
  id: string;
  name: string;
  href: string;
  isFolder: boolean;
}

interface DriveUnitFolder {
  id: string;
  name: string;
  files: DriveEntry[];
}

interface DriveCourseModuleFolder {
  id: string;
  name: string;
  unitFolders: DriveUnitFolder[];
  directFiles: DriveEntry[];
}

interface SeededUnit {
  deptSlug: string;
  courseName: string;
  courseSlug: string;
  moduleNumber: number;
  unitName: string;
  unitSlug: string;
}

interface ResourceRow {
  deptSlug: string;
  courseSlug: string;
  moduleNumber: number;
  unitSlug: string;
  type: 'past_paper' | 'marking_scheme' | 'other';
  title: string;
  fileUrl: string;
  year: number | null;
  sortOrder: number;
}

function escapeSql(str: string): string {
  return str.replace(/'/g, "''");
}

function toTitleCase(str: string): string {
  const minor = new Set(['and', 'of', 'in', 'the', 'for', 'to', 'on', 'at', 'by', 'with', 'a', 'an', 'or']);
  const acronyms = new Set(['ict', 'knec', 'cdacc', 'cad', 'cam', 'cnc', 'gis', 'dbms', 'os', 'lan', 'wan', 'erp', 'hr', 'pr', 'tv', 'ac', 'dc', 'plc', 'iot', 'ai', 'ml', 'sql', 'php', 'html', 'css', 'ui', 'ux', 'api', 'hiv', 'aids']);
  return str
    .toLowerCase()
    .split(/\s+/)
    .map((word, idx) => {
      if (!word) return word;
      const clean = word.replace(/[^a-z0-9]/g, '');
      if (acronyms.has(clean)) return word.toUpperCase();
      if (/^(i|ii|iii|iv|v|vi)$/i.test(clean)) return word.toUpperCase();
      if (idx > 0 && minor.has(clean)) return word;
      return word.charAt(0).toUpperCase() + word.slice(1);
    })
    .join(' ');
}

function loadSeededKnecUnits(): {
  courses: Map<string, { deptSlug: string; courseName: string; courseSlug: string; fileName: string }>;
  units: SeededUnit[];
} {
  const knecDir = path.resolve(__dirname, '../supabase/seeds/knec');
  const files = fs.readdirSync(knecDir).filter((f) => f.endsWith('.sql')).sort();

  const courses = new Map<string, { deptSlug: string; courseName: string; courseSlug: string; fileName: string }>();
  const units: SeededUnit[] = [];

  for (const file of files) {
    const sql = fs.readFileSync(path.join(knecDir, file), 'utf-8');

    const courseRegex =
      /SELECT d\.id, '((?:[^']|'')*)', '([^']+)', \d+, true\s+FROM departments d[\s\S]*?WHERE p\.slug = 'knec-courses' AND d\.slug = '([^']+)';/g;
    let cm: RegExpExecArray | null;
    while ((cm = courseRegex.exec(sql)) !== null) {
      const courseName = cm[1].replace(/''/g, "'");
      const courseSlug = cm[2];
      const deptSlug = cm[3];
      courses.set(courseSlug, { deptSlug, courseName, courseSlug, fileName: file });
    }

    const batchRegex =
      /JOIN modules m ON m\.course_id = c\.id AND m\.module_number = (\d+)\s+JOIN \(VALUES\s+([\s\S]*?)\) AS v\(name, slug, canon_slug\) ON true[\s\S]*?WHERE d\.slug = '([^']+)' AND c\.slug = '([^']+)';/g;
    let bm: RegExpExecArray | null;
    while ((bm = batchRegex.exec(sql)) !== null) {
      const moduleNumber = parseInt(bm[1], 10);
      const valuesBlock = bm[2];
      const deptSlug = bm[3];
      const courseSlug = bm[4];
      const courseInfo = courses.get(courseSlug);

      const rowRegex = /\('((?:[^']|'')*)', '([^']+)', (?:'[^']*'|NULL::text)\)/g;
      let rm: RegExpExecArray | null;
      while ((rm = rowRegex.exec(valuesBlock)) !== null) {
        units.push({
          deptSlug,
          courseName: courseInfo?.courseName || courseSlug,
          courseSlug,
          moduleNumber,
          unitName: rm[1].replace(/''/g, "'"),
          unitSlug: rm[2],
        });
      }
    }
  }

  return { courses, units };
}

function normalizeStr(s: string): string {
  return s
    .toLowerCase()
    .replace(/&/g, ' and ')
    .replace(/\baccomodation\b|\baccommadtion\b/g, 'accommodation')
    .replace(/\benterpreneurship\b|\bentrepreneirship\b|\bentreneurship\b|\bentrepreurship\b/g, 'entrepreneurship')
    .replace(/\bcommunicaton\b|\bcommuniction\b/g, 'communication')
    .replace(/\bstatictics\b/g, 'statistics')
    .replace(/\bfoundatons\b/g, 'foundations')
    .replace(/\bmangment\b|\bmanagment\b/g, 'management')
    .replace(/\bprograming\b/g, 'programming')
    .replace(/\btechnlogy\b/g, 'technology')
    .replace(/\bhabarium\b/g, 'herbarium')
    .replace(/\bhaemotology\b/g, 'haematology')
    .replace(/\blabaratory\b/g, 'laboratory')
    .replace(/\bagricutural\b/g, 'agricultural')
    .replace(/\bextention\b/g, 'extension')
    .replace(/\bprodution\b/g, 'production')
    .replace(/\bvulnarable\b/g, 'vulnerable')
    .replace(/\bemmergency\b/g, 'emergency')
    .replace(/\bsurveilance\b/g, 'surveillance')
    .replace(/\bbiostatics\b/g, 'biostatistics')
    .replace(/\bpriciples\b/g, 'principles')
    .replace(/\bspeciality\b/g, 'specialty')
    .replace(/[^a-z0-9]+/g, ' ')
    .trim();
}

function parseDriveCourseFolder(folderName: string): { baseName: string; moduleNumber: number } {
  const modMatch = folderName.match(/\s*[-–]\s*Module\s*(I|II|III|IV|1|2|3|4)\s*$/i);
  let moduleNumber = 1;
  let baseName = folderName.trim();

  if (modMatch) {
    const rawMod = modMatch[1].toUpperCase();
    const map: Record<string, number> = { I: 1, II: 2, III: 3, IV: 4, '1': 1, '2': 2, '3': 3, '4': 4 };
    moduleNumber = map[rawMod] || 1;
    baseName = folderName.slice(0, modMatch.index).trim();
  }
  return { baseName, moduleNumber };
}

function parseFileMetadata(fileName: string, unitName: string): {
  type: 'past_paper' | 'marking_scheme' | 'other';
  title: string;
  year: number | null;
  seriesRank: number;
} {
  const cleanUnit = toTitleCase(unitName);
  const lower = fileName.toLowerCase();

  let type: 'past_paper' | 'marking_scheme' | 'other' = 'past_paper';
  if (/note|syllabus|guide/i.test(lower)) {
    type = 'other';
  } else if (/marking|scheme/i.test(lower)) {
    type = 'marking_scheme';
  }

  const yearMatch = fileName.match(/\b(19\d{2}|20\d{2})s?\b/);
  const year = yearMatch ? parseInt(yearMatch[1], 10) : null;

  let series = '';
  let seriesRank = 0;
  if (/\b(november|novenber|nov)\b/i.test(lower)) {
    series = 'November';
    seriesRank = 3;
  } else if (/\b(october|oct)\b/i.test(lower)) {
    series = 'October';
    seriesRank = 3;
  } else if (/\b(july|jul)\b/i.test(lower)) {
    series = 'July';
    seriesRank = 2;
  } else if (/\b(june|jun)\b/i.test(lower)) {
    series = 'June';
    seriesRank = 2;
  } else if (/\b(march|mar)\b/i.test(lower)) {
    series = 'March';
    seriesRank = 1;
  }

  let paperNum: string | null = null;
  const parenMatch = fileName.match(/\((\d+)\)\.pdf$/i);
  const trailingNumMatch = fileName.match(/\bpaper\s+(\d+)\.pdf$/i);
  if (parenMatch && parseInt(parenMatch[1], 10) > 1) {
    paperNum = parenMatch[1];
  } else if (trailingNumMatch && parseInt(trailingNumMatch[1], 10) > 1) {
    paperNum = trailingNumMatch[1];
  }

  let title = '';
  if (type === 'other') {
    title = `${cleanUnit} — KNEC Class Notes`;
  } else if (type === 'marking_scheme') {
    const period = [series, year].filter(Boolean).join(' ');
    title = period ? `${cleanUnit} — ${period} KNEC Marking Scheme` : `${cleanUnit} — KNEC Marking Scheme`;
  } else {
    const period = [series, year].filter(Boolean).join(' ');
    const suffix = paperNum ? ` (Paper ${paperNum})` : '';
    title = period ? `${cleanUnit} — ${period} KNEC Past Paper${suffix}` : `${cleanUnit} — KNEC Past Paper${suffix}`;
  }

  return { type, title, year, seriesRank };
}

function main() {
  const drivePath = path.resolve(__dirname, 'data/knec-drive-resources.json');
  const driveData: DriveCourseModuleFolder[] = JSON.parse(fs.readFileSync(drivePath, 'utf-8'));
  const { courses, units } = loadSeededKnecUnits();
  const courseList = Array.from(courses.values());

  // Group resources by unit key to deduplicate & sort
  const byUnitKey = new Map<
    string,
    {
      unit: SeededUnit;
      fileName: string;
      items: Array<{
        fileId: string;
        type: 'past_paper' | 'marking_scheme' | 'other';
        title: string;
        fileUrl: string;
        year: number | null;
        seriesRank: number;
      }>;
    }
  >();

  let matchedFolders = 0;
  let matchedUnits = 0;
  let unmatchedUnits: string[] = [];
  let totalFiles = 0;

  for (const df of driveData) {
    const { baseName, moduleNumber } = parseDriveCourseFolder(df.name);
    const normBase = normalizeStr(baseName);

    let course = courseList.find((c) => normalizeStr(c.courseName) === normBase);
    if (!course) {
      course = courseList.find((c) => {
        const nc = normalizeStr(c.courseName);
        return nc.includes(normBase) || normBase.includes(nc);
      });
    }
    if (!course) continue;
    matchedFolders++;

    const courseModuleUnits = units.filter(
      (u) => u.courseSlug === course!.courseSlug && u.moduleNumber === moduleNumber
    );
    const allCourseUnits = units.filter((u) => u.courseSlug === course!.courseSlug);

    for (const uf of df.unitFolders) {
      const normUnit = normalizeStr(uf.name);
      let unit = courseModuleUnits.find((u) => normalizeStr(u.unitName) === normUnit);
      if (!unit) {
        unit = courseModuleUnits.find((u) => {
          const nu = normalizeStr(u.unitName);
          return nu.includes(normUnit) || normUnit.includes(nu);
        });
      }
      if (!unit) {
        unit = allCourseUnits.find((u) => normalizeStr(u.unitName) === normUnit);
      }

      if (!unit) {
        unmatchedUnits.push(`[${df.name}] ${uf.name} (${uf.files.length} files)`);
        continue;
      }

      matchedUnits++;
      const unitKey = `${unit.deptSlug}|${unit.courseSlug}|${unit.moduleNumber}|${unit.unitSlug}`;
      if (!byUnitKey.has(unitKey)) {
        byUnitKey.set(unitKey, {
          unit,
          fileName: course.fileName,
          items: [],
        });
      }
      const bucket = byUnitKey.get(unitKey)!;
      const seenIds = new Set(bucket.items.map((i) => i.fileId));

      for (const file of uf.files) {
        if (seenIds.has(file.id)) continue;
        seenIds.add(file.id);

        const meta = parseFileMetadata(file.name, unit.unitName);
        bucket.items.push({
          fileId: file.id,
          type: meta.type,
          title: meta.title,
          fileUrl: `https://drive.google.com/file/d/${file.id}/view`,
          year: meta.year,
          seriesRank: meta.seriesRank,
        });
        totalFiles++;
      }
    }
  }

  // Sort items per unit and disambiguate identical titles
  const rowsByDeptFile = new Map<string, ResourceRow[]>();

  for (const bucket of byUnitKey.values()) {
    bucket.items.sort((a, b) => {
      const ay = a.year ?? 0;
      const by = b.year ?? 0;
      if (by !== ay) return by - ay;
      if (b.seriesRank !== a.seriesRank) return b.seriesRank - a.seriesRank;
      return a.title.localeCompare(b.title);
    });

    const titleCounts = new Map<string, number>();
    for (const item of bucket.items) {
      titleCounts.set(item.title, (titleCounts.get(item.title) || 0) + 1);
    }
    const titleSeen = new Map<string, number>();

    const deptList = rowsByDeptFile.get(bucket.fileName) || [];
    bucket.items.forEach((item, idx) => {
      let finalTitle = item.title;
      if ((titleCounts.get(item.title) || 0) > 1) {
        const n = (titleSeen.get(item.title) || 0) + 1;
        titleSeen.set(item.title, n);
        if (n > 1) {
          finalTitle = `${item.title} (Set ${n})`;
        }
      }

      deptList.push({
        deptSlug: bucket.unit.deptSlug,
        courseSlug: bucket.unit.courseSlug,
        moduleNumber: bucket.unit.moduleNumber,
        unitSlug: bucket.unit.unitSlug,
        type: item.type,
        title: finalTitle,
        fileUrl: item.fileUrl,
        year: item.year,
        sortOrder: idx + 1,
      });
    });
    rowsByDeptFile.set(bucket.fileName, deptList);
  }

  const outDir = path.resolve(__dirname, '../supabase/seeds/knec-resources');
  fs.mkdirSync(outDir, { recursive: true });
  for (const existing of fs.readdirSync(outDir)) {
    if (existing.endsWith('.sql')) {
      fs.unlinkSync(path.join(outDir, existing));
    }
  }

  const BATCH_SIZE = 200;
  let filesWritten = 0;

  for (const [fileName, rows] of Array.from(rowsByDeptFile.entries()).sort((a, b) => a[0].localeCompare(b[0]))) {
    const deptSlug = rows[0].deptSlug;
    const lines: string[] = [
      `-- ============================================================================`,
      `-- KNEC Past Paper Resources Seed (${fileName})`,
      `-- Total resources: ${rows.length}`,
      `-- Idempotent: removes prior Google Drive resources for this department's KNEC units before inserting`,
      `-- ============================================================================`,
      ``,
      `DELETE FROM resources r`,
      `USING units u`,
      `JOIN modules m ON m.id = u.module_id`,
      `JOIN courses c ON c.id = m.course_id`,
      `JOIN departments d ON d.id = c.department_id`,
      `JOIN programmes p ON p.id = d.programme_id`,
      `WHERE r.unit_id = u.id`,
      `  AND p.slug = 'knec-courses'`,
      `  AND d.slug = '${escapeSql(deptSlug)}'`,
      `  AND r.file_url LIKE 'https://drive.google.com/file/d/%';`,
      ``,
    ];

    for (let i = 0; i < rows.length; i += BATCH_SIZE) {
      const batch = rows.slice(i, i + BATCH_SIZE);
      lines.push(
        `INSERT INTO resources (unit_id, type, title, file_url, year, sort_order)`
      );
      lines.push(`SELECT u.id, v.type::resource_type, v.title, v.file_url, v.year, v.sort_order`);
      lines.push(`FROM (VALUES`);

      const valueRows = batch.map((r) => {
        const yearExpr = r.year !== null ? `${r.year}::int` : `NULL::int`;
        return `  ('${escapeSql(r.courseSlug)}', ${r.moduleNumber}, '${escapeSql(r.unitSlug)}', '${r.type}', '${escapeSql(r.title)}', '${escapeSql(r.fileUrl)}', ${yearExpr}, ${r.sortOrder})`;
      });
      lines.push(valueRows.join(',\n'));
      lines.push(
        `) AS v(course_slug, module_number, unit_slug, type, title, file_url, year, sort_order)`
      );
      lines.push(`JOIN programmes p ON p.slug = 'knec-courses'`);
      lines.push(`JOIN departments d ON d.programme_id = p.id AND d.slug = '${escapeSql(deptSlug)}'`);
      lines.push(`JOIN courses c ON c.department_id = d.id AND c.slug = v.course_slug`);
      lines.push(`JOIN modules m ON m.course_id = c.id AND m.module_number = v.module_number`);
      lines.push(`JOIN units u ON u.module_id = m.id AND u.slug = v.unit_slug;`);
      lines.push(``);
    }

    fs.writeFileSync(path.join(outDir, fileName), lines.join('\n'), 'utf-8');
    filesWritten++;
  }

  console.log(`Matched folders: ${matchedFolders}/144`);
  console.log(`Matched unit folders: ${matchedUnits} (unmatched: ${unmatchedUnits.length})`);
  if (unmatchedUnits.length > 0) {
    console.log('Unmatched:', unmatchedUnits);
  }
  console.log(`Total unique resources seeded: ${totalFiles}`);
  console.log(`SQL files written to supabase/seeds/knec-resources/: ${filesWritten}`);
}

main();
