import * as fs from 'fs';
import * as path from 'path';
import { slugify, makeUniqueSlug, toTitleCase } from '../lib/utils';

interface UnitItem {
  name: string;
  slug: string;
  canonicalSlug: string | null;
}

interface ModuleItem {
  module_number: number;
  title: string;
  units: UnitItem[];
}

interface CourseItem {
  name: string;
  slug: string;
  level: number;
  type: 'diploma' | 'certificate' | 'artisan' | 'exam';
  modules: ModuleItem[];
}

interface DepartmentItem {
  name: string;
  slug: string;
  description: string;
  sortOrder: number;
  courses: CourseItem[];
}

const KNEC_DEPARTMENTS_CONFIG = [
  {
    name: 'ELECTRICAL AND ELECTRONIC ENGINEERING',
    slug: 'electrical-and-electronic-engineering',
    description: 'KNEC Diploma, Craft Certificate, and Artisan past examination papers and modules in Electrical, Electronics, Telecommunication, and Solar PV.',
    sortOrder: 1,
  },
  {
    name: 'BUILDING AND CIVIL ENGINEERING',
    slug: 'building-and-civil-engineering',
    description: 'KNEC Diploma, Craft Certificate, and Artisan past examination papers and modules in Building Technology, Civil Engineering, Architecture, Plumbing, and Masonry.',
    sortOrder: 2,
  },
  {
    name: 'HOSPITALITY AND TOURISM MANAGEMENT',
    slug: 'hospitality-and-tourism-management',
    description: 'KNEC Diploma and Certificate past examination papers and modules in Food & Beverage, Catering & Accommodation, Tourism Management, and Food Technology.',
    sortOrder: 3,
  },
  {
    name: 'HEALTH SCIENCES',
    slug: 'health-sciences',
    description: 'KNEC Diploma and Certificate past examination papers and modules in Nutrition and Dietetics and Community Health.',
    sortOrder: 4,
  },
  {
    name: 'BUSINESS STUDIES',
    slug: 'business-studies',
    description: 'KNEC Diploma and Certificate past examination papers and modules in Business Management, HRM, Supply Chain, Sales & Marketing, Project Management, and Secretarial Studies.',
    sortOrder: 5,
  },
  {
    name: 'COMPUTER STUDIES AND ICT',
    slug: 'computer-studies-and-ict',
    description: 'KNEC Diploma and Certificate past examination papers and modules in Information Communication Technology (ICT) and Computer Applications.',
    sortOrder: 6,
  },
  {
    name: 'APPLIED SCIENCES',
    slug: 'applied-sciences',
    description: 'KNEC Diploma and Certificate past examination papers and modules in Analytical Chemistry, Applied Biology, Statistics, Medical Lab, and Environmental Science.',
    sortOrder: 7,
  },
  {
    name: 'AGRICULTURE AND AQUACULTURE',
    slug: 'agriculture-and-aquaculture',
    description: 'KNEC Diploma, Certificate, and Artisan past examination papers and modules in General Agriculture, Sustainable Agriculture, and Fisheries.',
    sortOrder: 8,
  },
  {
    name: 'SOCIAL WORK',
    slug: 'social-work',
    description: 'KNEC Diploma and Certificate past examination papers and modules in Social Work, Community Development, and Project Management.',
    sortOrder: 9,
  },
  {
    name: 'CLOTHING AND TEXTILE',
    slug: 'clothing-and-textile',
    description: 'KNEC Diploma, Certificate, and Artisan past examination papers and modules in Fashion Design, Clothing Technology, and Garment Making.',
    sortOrder: 10,
  },
  {
    name: 'MECHANICAL AND AUTOMOTIVE ENGINEERING',
    slug: 'mechanical-and-automotive-engineering',
    description: 'KNEC Diploma, Certificate, and Artisan past examination papers and modules in Automotive Engineering, Mechanical Plant, Production, and Motor Vehicle Mechanics.',
    sortOrder: 11,
  },
  {
    name: 'EDUCATION',
    slug: 'education',
    description: 'KNEC Diploma and Certificate past examination papers and modules in Early Childhood Development and Education (ECDE).',
    sortOrder: 12,
  },
];

function sqlEscape(val: string | null | undefined): string {
  if (val === null || val === undefined) return 'NULL';
  return `'${val.replace(/'/g, "''")}'`;
}

function parseKnecInput(): DepartmentItem[] {
  const inputPath = path.resolve(__dirname, 'data/knec-courses-input.txt');
  const content = fs.readFileSync(inputPath, 'utf-8');
  const lines = content.split(/\r?\n/).map(l => l.trim()).filter(l => l.length > 0);

  const depts: DepartmentItem[] = [];
  let currentDept = null as DepartmentItem | null;
  let currentCourse = null as CourseItem | null;
  let currentModule = null as ModuleItem | null;

  let deptCourseSlugs = new Set<string>();
  let courseUnitSlugs = new Set<string>();
  let courseUnitFirstSlug = new Map<string, string>();

  const romanToNum: Record<string, number> = {
    'I': 1, 'II': 2, 'III': 3, 'IV': 4,
    '1': 1, '2': 2, '3': 3, '4': 4
  };

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

    // Check if line is a department header
    const cleanLine = line.replace(/^\d+[\.\)]\s*/, '').trim().toUpperCase();
    const deptCfg = KNEC_DEPARTMENTS_CONFIG.find(d => {
      if (cleanLine === d.name) return true;
      if (d.name === 'HOSPITALITY AND TOURISM MANAGEMENT' && (cleanLine.includes('HOSPITALITY') || cleanLine.includes('FOOD AND BEVERAGE'))) return true;
      if (d.name === 'COMPUTER STUDIES AND ICT' && cleanLine.includes('COMPUTER STUDIES')) return true;
      if (d.name === 'CLOTHING AND TEXTILE' && cleanLine.includes('CLOTHING')) return true;
      return false;
    });

    if (deptCfg && currentDept?.name !== deptCfg.name) {
      deptCourseSlugs = new Set<string>();
      currentDept = {
        name: deptCfg.name,
        slug: deptCfg.slug,
        description: deptCfg.description,
        sortOrder: deptCfg.sortOrder,
        courses: [],
      };
      depts.push(currentDept);
      currentCourse = null;
      currentModule = null;
      continue;
    }

    // Check if course header (starts with bullet • or Diploma / Certificate / Craft Certificate / Artisan / EPRA / Science Laboratory)
    const isCourseLine = line.startsWith('•') ||
      /^(Diploma|Certificate|Craft Certificate|National Certificate|Artisan|EPRA|Science Laboratory|Business Education)/i.test(line);

    if (isCourseLine) {
      const courseRawName = line.replace(/^[•\-\*\s]+/, '').trim();
      const courseName = courseRawName.toUpperCase();

      let level = 6;
      let courseType: 'diploma' | 'certificate' | 'artisan' | 'exam' = 'diploma';

      if (/^Diploma/i.test(courseRawName) || courseRawName.includes('Science Laboratory Technology')) {
        level = 6;
        courseType = 'diploma';
      } else if (/^(Certificate|Craft Certificate|National Certificate|Business Education)/i.test(courseRawName)) {
        level = 5;
        courseType = 'certificate';
      } else if (/^Artisan/i.test(courseRawName)) {
        level = 4;
        courseType = 'artisan';
      } else if (/^EPRA/i.test(courseRawName)) {
        level = 4;
        courseType = 'exam';
      }

      const courseSlug = makeUniqueSlug(courseRawName, deptCourseSlugs);
      courseUnitSlugs = new Set<string>();
      courseUnitFirstSlug = new Map<string, string>();

      currentCourse = {
        name: courseName,
        slug: courseSlug,
        level,
        type: courseType,
        modules: [],
      };

      if (currentDept) {
        currentDept.courses.push(currentCourse);
      }
      currentModule = null;
      continue;
    }

    // Check if module header (e.g. "Module I", "MODULE II", "Module III", "Module", "Units")
    const modMatch = line.match(/^Module\s*([I|V|X|\d]+)?/i);
    const unitsHeaderMatch = line.match(/^Units$/i);

    if (modMatch || unitsHeaderMatch) {
      let modNum = 1;
      if (modMatch && modMatch[1]) {
        modNum = romanToNum[modMatch[1].toUpperCase()] || 1;
      }
      const title = modNum === 1 ? 'Module I' : modNum === 2 ? 'Module II' : modNum === 3 ? 'Module III' : `Module ${modNum}`;

      // Check if module already created
      if (currentCourse) {
        let existingMod = currentCourse.modules.find(m => m.module_number === modNum);
        if (!existingMod) {
          existingMod = {
            module_number: modNum,
            title,
            units: [],
          };
          currentCourse.modules.push(existingMod);
        }
        currentModule = existingMod;
      }
      continue;
    }

    // Otherwise it is a unit name
    if (currentCourse) {
      // If no module active yet, create Module 1
      if (!currentModule) {
        let mod1 = currentCourse.modules.find(m => m.module_number === 1);
        if (!mod1) {
          mod1 = {
            module_number: 1,
            title: currentCourse.type === 'artisan' ? 'Artisan Core Units' : 'Module I',
            units: [],
          };
          currentCourse.modules.push(mod1);
        }
        currentModule = mod1;
      }

      let unitName = line
        .replace(/^\d+[\.\)]\s*/, '') // remove "1. ", "2. "
        .replace(/^[•\-\*]\s*/, '')   // remove bullets
        .trim()
        .toUpperCase();

      if (unitName.length === 0) continue;

      // Avoid duplicate unit within same module
      if (currentModule.units.some(u => u.name === unitName)) {
        continue;
      }

      const baseSlug = slugify(unitName);
      let unitSlug = baseSlug;
      let canonicalSlug: string | null = null;

      if (courseUnitFirstSlug.has(unitName)) {
        canonicalSlug = courseUnitFirstSlug.get(unitName)!;
        unitSlug = `${baseSlug}-module-${currentModule.module_number}`;
        if (courseUnitSlugs.has(unitSlug)) {
          unitSlug = makeUniqueSlug(unitSlug, courseUnitSlugs);
        } else {
          courseUnitSlugs.add(unitSlug);
        }
      } else {
        unitSlug = makeUniqueSlug(unitName, courseUnitSlugs);
        courseUnitFirstSlug.set(unitName, unitSlug);
      }

      currentModule.units.push({
        name: unitName,
        slug: unitSlug,
        canonicalSlug,
      });
    }
  }

  // Post-processing rule:
  // "Diploma always has 3 modules, Certificate has 2 modules then artisan is just a single module"
  for (const dept of depts) {
    for (const c of dept.courses) {
      if (c.type === 'diploma') {
        for (let m = 1; m <= 3; m++) {
          if (!c.modules.some(mod => mod.module_number === m)) {
            const title = m === 1 ? 'Module I' : m === 2 ? 'Module II' : 'Module III';
            c.modules.push({
              module_number: m,
              title,
              units: [],
            });
          }
        }
        c.modules.sort((a, b) => a.module_number - b.module_number);
      } else if (c.type === 'certificate') {
        for (let m = 1; m <= 2; m++) {
          if (!c.modules.some(mod => mod.module_number === m)) {
            const title = m === 1 ? 'Module I' : 'Module II';
            c.modules.push({
              module_number: m,
              title,
              units: [],
            });
          }
        }
        c.modules.sort((a, b) => a.module_number - b.module_number);
      } else if (c.type === 'artisan' || c.type === 'exam') {
        if (c.modules.length === 0) {
          c.modules.push({
            module_number: 1,
            title: 'Module I',
            units: [],
          });
        }
      }
    }
  }

  return depts;
}

function generateKnecDepartmentSql(dept: DepartmentItem, includeProgrammeHeader: boolean = true): string {
  const lines: string[] = [];
  lines.push(`-- ==============================================================================`);
  lines.push(`-- SEED SCRIPT FOR: ${dept.name} (KNEC COURSES)`);
  lines.push(`-- Total Courses: ${dept.courses.length} | Total Units: ${dept.courses.reduce((acc, c) => acc + c.modules.reduce((mAcc, m) => mAcc + m.units.length, 0), 0)}`);
  lines.push(`-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)`);
  lines.push(`-- ==============================================================================`);
  lines.push(`BEGIN;`);
  lines.push(``);

  if (includeProgrammeHeader) {
    lines.push(`-- 1. Ensure KNEC Programme Exists`);
    lines.push(`INSERT INTO programmes (name, slug, description, sort_order)`);
    lines.push(`VALUES (`);
    lines.push(`  'KNEC Courses',`);
    lines.push(`  'knec-courses',`);
    lines.push(`  'Kenya National Examinations Council (KNEC) Craft, Artisan, and Diploma TVET courses, modules, and past examination papers.',`);
    lines.push(`  3`);
    lines.push(`) ON CONFLICT (slug) DO UPDATE SET`);
    lines.push(`  name = EXCLUDED.name,`);
    lines.push(`  description = EXCLUDED.description,`);
    lines.push(`  sort_order = EXCLUDED.sort_order;`);
    lines.push(``);
  }

  lines.push(`-- 2. Upsert Department under KNEC: ${dept.name}`);
  lines.push(`INSERT INTO departments (programme_id, name, slug, description, sort_order)`);
  lines.push(`SELECT id, ${sqlEscape(dept.name)}, ${sqlEscape(dept.slug)}, ${sqlEscape(dept.description)}, ${dept.sortOrder}`);
  lines.push(`FROM programmes WHERE slug = 'knec-courses'`);
  lines.push(`ON CONFLICT (programme_id, slug) DO UPDATE SET`);
  lines.push(`  name = EXCLUDED.name,`);
  lines.push(`  description = EXCLUDED.description,`);
  lines.push(`  sort_order = EXCLUDED.sort_order;`);
  lines.push(``);

  lines.push(`-- 3. Clean Override: Remove previous courses & modules/units under this department in KNEC`);
  lines.push(`DELETE FROM courses`);
  lines.push(`WHERE department_id = (`);
  lines.push(`  SELECT d.id FROM departments d`);
  lines.push(`  JOIN programmes p ON p.id = d.programme_id`);
  lines.push(`  WHERE p.slug = 'knec-courses' AND d.slug = ${sqlEscape(dept.slug)}`);
  lines.push(`);`);
  lines.push(``);

  lines.push(`-- 4. Insert KNEC Courses under ${dept.name}`);
  for (const course of dept.courses) {
    lines.push(`INSERT INTO courses (department_id, name, slug, level, published)`);
    lines.push(`SELECT d.id, ${sqlEscape(course.name)}, ${sqlEscape(course.slug)}, ${course.level}, true`);
    lines.push(`FROM departments d`);
    lines.push(`JOIN programmes p ON p.id = d.programme_id`);
    lines.push(`WHERE p.slug = 'knec-courses' AND d.slug = ${sqlEscape(dept.slug)};`);
  }
  lines.push(``);

  lines.push(`-- 5. Insert Modules and Units for Each Course`);
  for (const course of dept.courses) {
    lines.push(`-- ------------------------------------------------------------------------------`);
    lines.push(`-- Course: ${course.name} [Level ${course.level}] (${course.modules.length} Modules)`);
    lines.push(`-- ------------------------------------------------------------------------------`);

    for (const mod of course.modules) {
      lines.push(`-- Module ${mod.module_number}: ${mod.title} (${mod.units.length} units)`);
      lines.push(`INSERT INTO modules (course_id, module_number, title)`);
      lines.push(`SELECT c.id, ${mod.module_number}, ${sqlEscape(mod.title)}`);
      lines.push(`FROM courses c`);
      lines.push(`JOIN departments d ON d.id = c.department_id`);
      lines.push(`WHERE d.slug = ${sqlEscape(dept.slug)} AND c.slug = ${sqlEscape(course.slug)};`);

      if (mod.units.length > 0) {
        lines.push(`INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)`);
        lines.push(`SELECT m.id, c.id, v.name, v.slug, canon.id, true`);
        lines.push(`FROM courses c`);
        lines.push(`JOIN departments d ON d.id = c.department_id`);
        lines.push(`JOIN modules m ON m.course_id = c.id AND m.module_number = ${mod.module_number}`);
        lines.push(`JOIN (VALUES`);
        const valueRows = mod.units.map(u => {
          const canonVal = u.canonicalSlug ? sqlEscape(u.canonicalSlug) : 'NULL::text';
          return `  (${sqlEscape(u.name)}, ${sqlEscape(u.slug)}, ${canonVal})`;
        });
        lines.push(valueRows.join(',\n'));
        lines.push(`) AS v(name, slug, canon_slug) ON true`);
        lines.push(`LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug`);
        lines.push(`WHERE d.slug = ${sqlEscape(dept.slug)} AND c.slug = ${sqlEscape(course.slug)};`);
      }
      lines.push(``);
    }
  }

  lines.push(`COMMIT;`);
  lines.push(`-- Verification Query: Check courses and units inserted for ${dept.name}`);
  lines.push(`-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units`);
  lines.push(`-- FROM departments d`);
  lines.push(`-- JOIN courses c ON c.department_id = d.id`);
  lines.push(`-- LEFT JOIN units u ON u.course_id = c.id`);
  lines.push(`-- WHERE d.slug = ${sqlEscape(dept.slug)}`);
  lines.push(`-- GROUP BY d.name;`);

  return lines.join('\n');
}

function run() {
  const depts = parseKnecInput();
  const outputDir = path.resolve(__dirname, '../supabase/seeds/knec');
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  const fileMap: Record<string, string> = {
    'ELECTRICAL AND ELECTRONIC ENGINEERING': '01_knec_electrical_and_electronics.sql',
    'BUILDING AND CIVIL ENGINEERING': '02_knec_building_and_civil_engineering.sql',
    'HOSPITALITY AND TOURISM MANAGEMENT': '03_knec_hospitality_and_tourism.sql',
    'HEALTH SCIENCES': '04_knec_health_sciences.sql',
    'BUSINESS STUDIES': '05_knec_business_studies.sql',
    'COMPUTER STUDIES AND ICT': '06_knec_computer_studies_ict.sql',
    'APPLIED SCIENCES': '07_knec_applied_sciences.sql',
    'AGRICULTURE AND AQUACULTURE': '08_knec_agriculture_and_aquaculture.sql',
    'SOCIAL WORK': '09_knec_social_work.sql',
    'CLOTHING AND TEXTILE': '10_knec_clothing_and_textile.sql',
    'MECHANICAL AND AUTOMOTIVE ENGINEERING': '11_knec_mechanical_and_automotive.sql',
    'EDUCATION': '12_knec_education.sql',
  };

  const masterLines: string[] = [];
  masterLines.push(`-- ==============================================================================`);
  masterLines.push(`-- COMPREHENSIVE KNEC COURSES MASTER SEED SCRIPT (12 DEPARTMENTS)`);
  masterLines.push(`-- Total Courses: ${depts.reduce((acc, d) => acc + d.courses.length, 0)} | Total Units: ${depts.reduce((acc, d) => acc + d.courses.reduce((mAcc, c) => mAcc + c.modules.reduce((uAcc, m) => uAcc + m.units.length, 0), 0), 0)}`);
  masterLines.push(`-- Safe to run in Supabase SQL Editor`);
  masterLines.push(`-- ==============================================================================`);
  masterLines.push(`BEGIN;`);
  masterLines.push(``);
  masterLines.push(`-- Ensure KNEC Programme Exists`);
  masterLines.push(`INSERT INTO programmes (name, slug, description, sort_order)`);
  masterLines.push(`VALUES (`);
  masterLines.push(`  'KNEC Courses',`);
  masterLines.push(`  'knec-courses',`);
  masterLines.push(`  'Kenya National Examinations Council (KNEC) Craft, Artisan, and Diploma TVET courses, modules, and past examination papers.',`);
  masterLines.push(`  3`);
  masterLines.push(`) ON CONFLICT (slug) DO UPDATE SET`);
  masterLines.push(`  name = EXCLUDED.name,`);
  masterLines.push(`  description = EXCLUDED.description,`);
  masterLines.push(`  sort_order = EXCLUDED.sort_order;`);
  masterLines.push(``);

  for (const dept of depts) {
    const fileName = fileMap[dept.name];
    if (fileName) {
      const sql = generateKnecDepartmentSql(dept, true);
      fs.writeFileSync(path.join(outputDir, fileName), sql, 'utf-8');
      const uCount = dept.courses.reduce((acc, c) => acc + c.modules.reduce((mAcc, m) => mAcc + m.units.length, 0), 0);
      console.log(`Generated: ${fileName} (${dept.courses.length} courses, ${uCount} units)`);
    }

    const deptSql = generateKnecDepartmentSql(dept, false);
    const trimmed = deptSql
      .replace(/^BEGIN;\s*/m, '')
      .replace(/COMMIT;\s*-- Verification Query:.*$/s, '');
    masterLines.push(trimmed);
  }

  masterLines.push(`COMMIT;`);
  masterLines.push(``);
  masterLines.push(`SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units`);
  masterLines.push(`FROM departments d`);
  masterLines.push(`JOIN programmes p ON p.id = d.programme_id`);
  masterLines.push(`JOIN courses c ON c.department_id = d.id`);
  masterLines.push(`LEFT JOIN units u ON u.course_id = c.id`);
  masterLines.push(`WHERE p.slug = 'knec-courses'`);
  masterLines.push(`GROUP BY d.name ORDER BY d.name;`);

  const masterPath = path.join(outputDir, '../00_all_knec_courses_master.sql');
  fs.writeFileSync(masterPath, masterLines.join('\n'), 'utf-8');
  console.log(`Generated master seed: 00_all_knec_courses_master.sql`);
}

run();
