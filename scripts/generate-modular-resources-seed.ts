import * as fs from 'fs';
import * as path from 'path';

interface DriveEntry {
  id: string;
  name: string;
  href: string;
  isFolder: boolean;
}

interface DriveFileRecord {
  folderPath: string[];
  folderIds: string[];
  file: DriveEntry;
}

interface SeededUnit {
  deptSlug: string;
  courseName: string;
  courseSlug: string;
  moduleNumber: number;
  unitName: string;
  unitSlug: string;
}

type ResourceType = 'past_paper' | 'assessor_guide' | 'candidate_tool' | 'cutting_list' | 'marking_scheme' | 'other';

interface ResourceRow {
  deptSlug: string;
  courseSlug: string;
  moduleNumber: number;
  unitSlug: string;
  type: ResourceType;
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
  const acronyms = new Set([
    'ict', 'knec', 'cdacc', 'cad', 'cam', 'cnc', 'gis', 'dbms', 'os', 'lan', 'wan',
    'erp', 'hr', 'pr', 'tv', 'ac', 'dc', 'plc', 'iot', 'ai', 'ml', 'sql', 'php',
    'html', 'css', 'ui', 'ux', 'api', 'hiv', 'aids', 'pv', 'osha',
  ]);
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

function loadSeededModularUnits() {
  const dir = path.resolve(__dirname, '../supabase/seeds');
  const files = fs
    .readdirSync(dir)
    .filter((f) => /^\d{2}_.*\.sql$/.test(f) && !f.startsWith('00_') && !f.startsWith('12_'))
    .sort();

  const courses = new Map<string, { deptSlug: string; courseName: string; courseSlug: string; fileName: string }>();
  const units: SeededUnit[] = [];

  for (const file of files) {
    const sql = fs.readFileSync(path.join(dir, file), 'utf-8');
    const courseRegex =
      /SELECT d\.id, '((?:[^']|'')*)', '([^']+)', \d+, true\s+FROM departments d[\s\S]*?WHERE p\.slug = 'modular-cdacc-courses-cycle-3' AND d\.slug = '([^']+)';/g;
    let cm: RegExpExecArray | null;
    while ((cm = courseRegex.exec(sql)) !== null) {
      courses.set(cm[2], {
        courseName: cm[1].replace(/''/g, "'"),
        courseSlug: cm[2],
        deptSlug: cm[3],
        fileName: file,
      });
    }

    const batchRegex =
      /JOIN modules m ON m\.course_id = c\.id AND m\.module_number = (\d+)\s+JOIN \(VALUES\s+([\s\S]*?)\) AS v\(name, slug, canon_slug\) ON true[\s\S]*?WHERE (?:p\.slug = 'modular-cdacc-courses-cycle-3' AND )?d\.slug = '([^']+)' AND c\.slug = '([^']+)';/g;
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
    .replace(/\s*\(\d+\)\s*$/g, '')
    .replace(/&/g, ' and ')
    .replace(/[^a-z0-9]+/g, ' ')
    .trim();
}

function parseModularFolder(folderName: string): { baseName: string; moduleNumber: number } {
  const modMatch = folderName.match(/\s*[-–]\s*Module\s*(\d+|I|II|III|IV)?\s*$/i);
  let moduleNumber = 1;
  let baseName = folderName.trim();
  if (modMatch) {
    const raw = (modMatch[1] || '1').toUpperCase();
    const map: Record<string, number> = { I: 1, II: 2, III: 3, IV: 4 };
    moduleNumber = map[raw] || parseInt(raw, 10) || 1;
    baseName = folderName.slice(0, modMatch.index).trim();
  }
  return { baseName, moduleNumber };
}

function parseModularFileMetadata(fileName: string, unitName: string): {
  type: ResourceType;
  title: string;
  year: number | null;
  seriesRank: number;
} {
  const cleanUnit = toTitleCase(unitName);
  const lower = fileName.toLowerCase();

  let type: ResourceType = 'past_paper';
  if (/assessor\s+guide/i.test(lower)) {
    type = 'assessor_guide';
  } else if (/candidate\s+tool/i.test(lower)) {
    type = 'candidate_tool';
  } else if (/cutting\s+list/i.test(lower)) {
    type = 'cutting_list';
  } else if (/marking|scheme/i.test(lower)) {
    type = 'marking_scheme';
  } else if (/excerpt|note|syllabus/i.test(lower)) {
    type = 'other';
  }

  const yearMatch = fileName.match(/\b(19\d{2}|20\d{2})\b/);
  const year = yearMatch ? parseInt(yearMatch[1], 10) : null;

  let series = '';
  let seriesRank = 0;
  if (/\b(november|nov)\b/i.test(lower)) {
    series = 'November';
    seriesRank = 3;
  } else if (/\b(july|jul)\b/i.test(lower)) {
    series = 'July';
    seriesRank = 2;
  } else if (/\b(march|mar)\b/i.test(lower)) {
    series = 'March';
    seriesRank = 1;
  }

  const setMatch = fileName.match(/\((\d+)\)\.pdf$/i);
  const setSuffix = setMatch && parseInt(setMatch[1], 10) > 1 ? ` (Set ${setMatch[1]})` : '';

  const period = [series, year].filter(Boolean).join(' ');
  const typeLabelMap: Record<ResourceType, string> = {
    past_paper: 'CDACC Past Paper',
    assessor_guide: 'CDACC Assessor Guide',
    candidate_tool: 'CDACC Candidate Tool',
    cutting_list: 'CDACC Cutting List',
    marking_scheme: 'CDACC Marking Scheme',
    other: 'CDACC Excerpt',
  };

  const label = typeLabelMap[type];
  const title = period
    ? `${cleanUnit} — ${period} ${label}${setSuffix}`
    : `${cleanUnit} — ${label}${setSuffix}`;

  return { type, title, year, seriesRank };
}

function main() {
  const raw = JSON.parse(fs.readFileSync(path.resolve(__dirname, 'data/modular-drive-resources.json'), 'utf-8'));
  const allFiles: DriveFileRecord[] = raw.allFiles;
  const { courses, units } = loadSeededModularUnits();
  const courseList = Array.from(courses.values());

  const byUnitKey = new Map<
    string,
    {
      unit: SeededUnit;
      fileName: string;
      items: Array<{
        fileId: string;
        type: ResourceType;
        title: string;
        fileUrl: string;
        year: number | null;
        seriesRank: number;
      }>;
    }
  >();

  let matchedFiles = 0;
  const unmatchedCourses = new Set<string>();
  const unmatchedUnits = new Set<string>();

  for (const rec of allFiles) {
    if (rec.folderPath.length < 2) continue;
    const driveCourseMod = rec.folderPath[0];
    const driveUnit = rec.folderPath[1];

    const { baseName, moduleNumber } = parseModularFolder(driveCourseMod);
    const course = courseList.find((c) => normalizeStr(c.courseName) === normalizeStr(baseName));
    if (!course) {
      unmatchedCourses.add(driveCourseMod);
      continue;
    }

    const courseModuleUnits = units.filter((u) => u.courseSlug === course.courseSlug && u.moduleNumber === moduleNumber);
    const allCourseUnits = units.filter((u) => u.courseSlug === course.courseSlug);
    const nu = normalizeStr(driveUnit);

    let unit = courseModuleUnits.find((u) => normalizeStr(u.unitName) === nu);
    if (!unit) {
      unit = courseModuleUnits.find((u) => {
        const snu = normalizeStr(u.unitName);
        return snu.includes(nu) || nu.includes(snu);
      });
    }
    if (!unit) {
      unit = allCourseUnits.find((u) => normalizeStr(u.unitName) === nu);
    }
    if (!unit) {
      unmatchedUnits.add(`[${driveCourseMod}] ${driveUnit}`);
      continue;
    }

    const unitKey = `${unit.deptSlug}|${unit.courseSlug}|${unit.moduleNumber}|${unit.unitSlug}`;
    if (!byUnitKey.has(unitKey)) {
      byUnitKey.set(unitKey, { unit, fileName: course.fileName, items: [] });
    }
    const bucket = byUnitKey.get(unitKey)!;
    if (bucket.items.some((i) => i.fileId === rec.file.id)) continue;

    const meta = parseModularFileMetadata(rec.file.name, unit.unitName);
    bucket.items.push({
      fileId: rec.file.id,
      type: meta.type,
      title: meta.title,
      fileUrl: `https://drive.google.com/file/d/${rec.file.id}/view`,
      year: meta.year,
      seriesRank: meta.seriesRank,
    });
    matchedFiles++;
  }

  const rowsByDeptFile = new Map<string, ResourceRow[]>();
  let totalRows = 0;

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

    const deptRows = rowsByDeptFile.get(bucket.fileName) || [];
    bucket.items.forEach((item, idx) => {
      let finalTitle = item.title;
      if ((titleCounts.get(item.title) || 0) > 1) {
        const n = (titleSeen.get(item.title) || 0) + 1;
        titleSeen.set(item.title, n);
        if (n > 1) {
          finalTitle = `${item.title} (${n})`;
        }
      }

      deptRows.push({
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
      totalRows++;
    });
    rowsByDeptFile.set(bucket.fileName, deptRows);
  }

  const outDir = path.resolve(__dirname, '../supabase/seeds/modular-resources');
  fs.mkdirSync(outDir, { recursive: true });
  for (const existing of fs.readdirSync(outDir)) {
    if (existing.endsWith('.sql')) {
      fs.unlinkSync(path.join(outDir, existing));
    }
  }

  const BATCH_SIZE = 200;
  const MAX_ROWS_PER_FILE = 1000;
  let filesWritten = 0;

  for (const [fileName, rows] of Array.from(rowsByDeptFile.entries()).sort((a, b) => a[0].localeCompare(b[0]))) {
    const deptSlug = rows[0].deptSlug;
    const totalParts = Math.ceil(rows.length / MAX_ROWS_PER_FILE);

    for (let partIdx = 0; partIdx < totalParts; partIdx++) {
      const partRows = rows.slice(partIdx * MAX_ROWS_PER_FILE, (partIdx + 1) * MAX_ROWS_PER_FILE);
      const outName =
        totalParts === 1
          ? fileName
          : fileName.replace(/\.sql$/i, `_part${partIdx + 1}.sql`);

      const lines: string[] = [
        `-- ============================================================================`,
        `-- Modular CDACC (Cycle 3) Resources Seed (${outName})`,
        `-- Part ${partIdx + 1} of ${totalParts} | Rows in this file: ${partRows.length} (Dept total: ${rows.length})`,
        `-- ============================================================================`,
        ``,
        `BEGIN;`,
        ``,
      ];

      if (partIdx === 0) {
        lines.push(
          `DELETE FROM resources r`,
          `USING units u`,
          `JOIN modules m ON m.id = u.module_id`,
          `JOIN courses c ON c.id = m.course_id`,
          `JOIN departments d ON d.id = c.department_id`,
          `JOIN programmes p ON p.id = d.programme_id`,
          `WHERE r.unit_id = u.id`,
          `  AND p.slug = 'modular-cdacc-courses-cycle-3'`,
          `  AND d.slug = '${escapeSql(deptSlug)}'`,
          `  AND r.file_url LIKE 'https://drive.google.com/file/d/%';`,
          ``
        );
      }

      for (let i = 0; i < partRows.length; i += BATCH_SIZE) {
        const batch = partRows.slice(i, i + BATCH_SIZE);
        lines.push(`INSERT INTO resources (unit_id, type, title, file_url, year, sort_order)`);
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
        lines.push(`JOIN programmes p ON p.slug = 'modular-cdacc-courses-cycle-3'`);
        lines.push(`JOIN departments d ON d.programme_id = p.id AND d.slug = '${escapeSql(deptSlug)}'`);
        lines.push(`JOIN courses c ON c.department_id = d.id AND c.slug = v.course_slug`);
        lines.push(`JOIN modules m ON m.course_id = c.id AND m.module_number = v.module_number`);
        lines.push(`JOIN units u ON u.module_id = m.id AND u.slug = v.unit_slug;`);
        lines.push(``);
      }

      lines.push(`COMMIT;`);
      lines.push(``);

      fs.writeFileSync(path.join(outDir, outName), lines.join('\n'), 'utf-8');
      filesWritten++;
    }
  }

  console.log(`Unmatched courses (${unmatchedCourses.size}):`, [...unmatchedCourses]);
  console.log(`Unmatched units (${unmatchedUnits.size}):`, [...unmatchedUnits]);
  console.log(`Matched units: ${byUnitKey.size}`);
  console.log(`Total unique resources seeded: ${totalRows} (from ${matchedFiles} matched files)`);
  console.log(`Split SQL files written to supabase/seeds/modular-resources/: ${filesWritten}`);
}

main();
