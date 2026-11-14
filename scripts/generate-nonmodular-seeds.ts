import * as fs from 'fs';
import * as path from 'path';
import { slugify, makeUniqueSlug } from '../lib/utils';

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
}

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
  modules: ModuleItem[];
}

interface DepartmentItem {
  deptNo: number;
  name: string;
  slug: string;
  description: string;
  sortOrder: number;
  fileName: string;
  courses: CourseItem[];
}

const DEPARTMENTS_META = [
  {
    deptNo: 1,
    name: 'AGRICULTURE AND AQUACULTURE DEPARTMENT',
    slug: 'agriculture-and-aquaculture-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Agriculture, Agribusiness, Dairy, Horticulture, and Aquaculture courses in Kenya.',
    fileName: '01_nonmodular_agriculture_and_aquaculture.sql',
  },
  {
    deptNo: 2,
    name: 'APPLIED SCIENCE DEPARTMENT',
    slug: 'applied-science-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Applied Science courses in Analytical Chemistry, Applied Biology, Statistics, Chemical Engineering, and Medical Engineering.',
    fileName: '02_nonmodular_applied_science.sql',
  },
  {
    deptNo: 3,
    name: 'BUILDING AND CIVIL ENGINEERING DEPARTMENT',
    slug: 'building-and-civil-engineering-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Building and Civil Engineering courses in Architecture, Civil Engineering, Quantity Surveying, Plumbing, and Masonry.',
    fileName: '03_nonmodular_building_and_civil_engineering.sql',
  },
  {
    deptNo: 4,
    name: 'BUSINESS STUDIES DEPARTMENT',
    slug: 'business-studies-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Business Studies courses in Accountancy, Banking & Finance, Business Management, HRM, Project Management, and Supply Chain.',
    fileName: '04_nonmodular_business_studies.sql',
  },
  {
    deptNo: 5,
    name: 'COMPUTING AND INFORMATICS DEPARTMENT',
    slug: 'computing-and-informatics-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Computing and Informatics courses in Computer Science, Programming, Cyber Security, Graphic Design, and ICT.',
    fileName: '05_nonmodular_computing_and_informatics.sql',
  },
  {
    deptNo: 6,
    name: 'ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT',
    slug: 'electrical-and-electronic-engineering-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Electrical and Electronic Engineering courses in Power, Instrumentation, Telecommunication, and Solar PV.',
    fileName: '06_nonmodular_electrical_and_electronics.sql',
  },
  {
    deptNo: 7,
    name: 'FASHION DESIGN AND COSMETOLOGY DEPARTMENT',
    slug: 'fashion-design-and-cosmetology-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Fashion Design, Cosmetology, Beauty Therapy, Hairdressing, Leather, and Textile courses.',
    fileName: '07_nonmodular_fashion_design_and_cosmetology.sql',
  },
  {
    deptNo: 8,
    name: 'HEALTH SCIENCE DEPARTMENT',
    slug: 'health-science-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Health Science courses in Community Health, Health Records, Medical Laboratory, Nutrition, and Perioperative Theatre.',
    fileName: '08_nonmodular_health_sciences.sql',
  },
  {
    deptNo: 9,
    name: 'CATERING AND ACCOMMODATION DEPARTMENT',
    slug: 'catering-and-accommodation-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Catering, Baking, Food Production, Housekeeping, Tour & Travel, and Wildlife Management courses.',
    fileName: '09_nonmodular_catering_and_accommodation.sql',
  },
  {
    deptNo: 10,
    name: 'MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT',
    slug: 'mechanical-and-automotive-engineering-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Mechanical and Automotive Engineering courses in Automotive, Mechatronics, Industrial Plant, Refrigeration, and Welding.',
    fileName: '10_nonmodular_mechanical_and_automotive.sql',
  },
  {
    deptNo: 11,
    name: 'SOCIAL WORK DEPARTMENT',
    slug: 'social-work-department',
    description: 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Social Work, Child Protection, and Counselling Psychology courses.',
    fileName: '11_nonmodular_social_work.sql',
  },
];

function sqlEscape(val: string | null | undefined): string {
  if (val === null || val === undefined) return 'NULL';
  return `'${val.replace(/'/g, "''")}'`;
}

function normalizeSectionTitle(heading: string): string {
  const h = heading.toUpperCase();
  if (h.includes('BASIC')) return 'Basic Units of Competency';
  if (h.includes('COMMON')) return 'Common Units of Competency';
  if (h.includes('CORE') || h === 'UNITS') return 'Core Units of Competency';
  return heading;
}

function buildDepartmentData(): DepartmentItem[] {
  const jsonPath = path.resolve(__dirname, 'data/nonmodular-courses.json');
  const rawCourses: ExtractedCourse[] = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'));

  const depts: DepartmentItem[] = [];

  for (const meta of DEPARTMENTS_META) {
    const deptRawCourses = rawCourses.filter(c => c.deptNo === meta.deptNo);
    const deptCourseSlugs = new Set<string>();
    const courses: CourseItem[] = [];

    for (const rc of deptRawCourses) {
      const courseName = rc.name.toUpperCase().trim();
      const courseSlug = makeUniqueSlug(courseName, deptCourseSlugs);

      const courseUnitSlugs = new Set<string>();
      const courseUnitFirstSlug = new Map<string, string>();
      const modules: ModuleItem[] = [];

      let modNum = 1;
      for (const sec of rc.sections) {
        const modTitle = normalizeSectionTitle(sec.heading);
        const unitItems: UnitItem[] = [];
        const seenInThisMod = new Set<string>();

        for (const uRaw of sec.units) {
          const uName = uRaw.toUpperCase().trim();
          if (!uName || seenInThisMod.has(uName)) continue;
          seenInThisMod.add(uName);

          const baseSlug = slugify(uName);
          let unitSlug = baseSlug;
          let canonicalSlug: string | null = null;

          if (courseUnitFirstSlug.has(uName)) {
            canonicalSlug = courseUnitFirstSlug.get(uName)!;
            unitSlug = `${baseSlug}-part-${modNum}`;
            if (courseUnitSlugs.has(unitSlug)) {
              unitSlug = makeUniqueSlug(unitSlug, courseUnitSlugs);
            } else {
              courseUnitSlugs.add(unitSlug);
            }
          } else {
            unitSlug = makeUniqueSlug(uName, courseUnitSlugs);
            courseUnitFirstSlug.set(uName, unitSlug);
          }

          unitItems.push({
            name: uName,
            slug: unitSlug,
            canonicalSlug,
          });
        }

        if (unitItems.length > 0) {
          modules.push({
            module_number: modNum,
            title: modTitle,
            units: unitItems,
          });
          modNum++;
        }
      }

      courses.push({
        name: courseName,
        slug: courseSlug,
        level: rc.level,
        modules,
      });
    }

    depts.push({
      deptNo: meta.deptNo,
      name: meta.name,
      slug: meta.slug,
      description: meta.description,
      sortOrder: meta.deptNo,
      fileName: meta.fileName,
      courses,
    });
  }

  return depts;
}

function generateDepartmentSql(dept: DepartmentItem, includeProgrammeHeader: boolean = true): string {
  const lines: string[] = [];
  const totalUnits = dept.courses.reduce((acc, c) => acc + c.modules.reduce((mAcc, m) => mAcc + m.units.length, 0), 0);

  lines.push(`-- ==============================================================================`);
  lines.push(`-- SEED SCRIPT FOR: ${dept.name} (CDACC CYCLE 1 & 2 NON-MODULAR)`);
  lines.push(`-- Total Courses: ${dept.courses.length} | Total Units: ${totalUnits}`);
  lines.push(`-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)`);
  lines.push(`-- ==============================================================================`);
  lines.push(`BEGIN;`);
  lines.push(``);

  if (includeProgrammeHeader) {
    lines.push(`-- 1. Ensure Programme Exists`);
    lines.push(`INSERT INTO programmes (name, slug, description, sort_order)`);
    lines.push(`VALUES (`);
    lines.push(`  'CDACC Courses (Cycle 1 & 2)',`);
    lines.push(`  'cdacc-courses-cycle-1-and-2',`);
    lines.push(`  'TVET CDACC Cycle 1 and Cycle 2 competency-based courses, occupational standards, past papers, and assessment tools.',`);
    lines.push(`  2`);
    lines.push(`) ON CONFLICT (slug) DO UPDATE SET`);
    lines.push(`  name = EXCLUDED.name,`);
    lines.push(`  description = EXCLUDED.description,`);
    lines.push(`  sort_order = EXCLUDED.sort_order;`);
    lines.push(``);
  }

  lines.push(`-- 2. Upsert Department under Cycle 1 & 2: ${dept.name}`);
  lines.push(`INSERT INTO departments (programme_id, name, slug, description, sort_order)`);
  lines.push(`SELECT id, ${sqlEscape(dept.name)}, ${sqlEscape(dept.slug)}, ${sqlEscape(dept.description)}, ${dept.sortOrder}`);
  lines.push(`FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'`);
  lines.push(`ON CONFLICT (programme_id, slug) DO UPDATE SET`);
  lines.push(`  name = EXCLUDED.name,`);
  lines.push(`  description = EXCLUDED.description,`);
  lines.push(`  sort_order = EXCLUDED.sort_order;`);
  lines.push(``);

  lines.push(`-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2`);
  lines.push(`DELETE FROM courses`);
  lines.push(`WHERE department_id = (`);
  lines.push(`  SELECT d.id FROM departments d`);
  lines.push(`  JOIN programmes p ON p.id = d.programme_id`);
  lines.push(`  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = ${sqlEscape(dept.slug)}`);
  lines.push(`);`);
  lines.push(``);

  lines.push(`-- 4. Insert Non-Modular Courses under ${dept.name}`);
  for (const course of dept.courses) {
    lines.push(`INSERT INTO courses (department_id, name, slug, level, published)`);
    lines.push(`SELECT d.id, ${sqlEscape(course.name)}, ${sqlEscape(course.slug)}, ${course.level}, true`);
    lines.push(`FROM departments d`);
    lines.push(`JOIN programmes p ON p.id = d.programme_id`);
    lines.push(`WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = ${sqlEscape(dept.slug)};`);
  }
  lines.push(``);

  lines.push(`-- 5. Insert Competency Sections (Modules) and Units for Each Course`);
  for (const course of dept.courses) {
    lines.push(`-- ------------------------------------------------------------------------------`);
    lines.push(`-- Course: ${course.name} [Level ${course.level}]`);
    lines.push(`-- ------------------------------------------------------------------------------`);

    for (const mod of course.modules) {
      lines.push(`-- Section ${mod.module_number}: ${mod.title} (${mod.units.length} units)`);
      lines.push(`INSERT INTO modules (course_id, module_number, title)`);
      lines.push(`SELECT c.id, ${mod.module_number}, ${sqlEscape(mod.title)}`);
      lines.push(`FROM courses c`);
      lines.push(`JOIN departments d ON d.id = c.department_id`);
      lines.push(`JOIN programmes p ON p.id = d.programme_id`);
      lines.push(`WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = ${sqlEscape(dept.slug)} AND c.slug = ${sqlEscape(course.slug)};`);

      if (mod.units.length > 0) {
        lines.push(`INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)`);
        lines.push(`SELECT m.id, c.id, v.name, v.slug, canon.id, true`);
        lines.push(`FROM courses c`);
        lines.push(`JOIN departments d ON d.id = c.department_id`);
        lines.push(`JOIN programmes p ON p.id = d.programme_id`);
        lines.push(`JOIN modules m ON m.course_id = c.id AND m.module_number = ${mod.module_number}`);
        lines.push(`JOIN (VALUES`);
        const valueRows = mod.units.map(u => {
          const canonVal = u.canonicalSlug ? sqlEscape(u.canonicalSlug) : 'NULL::text';
          return `  (${sqlEscape(u.name)}, ${sqlEscape(u.slug)}, ${canonVal})`;
        });
        lines.push(valueRows.join(',\n'));
        lines.push(`) AS v(name, slug, canon_slug) ON true`);
        lines.push(`LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug`);
        lines.push(`WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = ${sqlEscape(dept.slug)} AND c.slug = ${sqlEscape(course.slug)};`);
      }
      lines.push(``);
    }
  }

  lines.push(`COMMIT;`);
  lines.push(`-- Verification Query:`);
  lines.push(`-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units`);
  lines.push(`-- FROM departments d`);
  lines.push(`-- JOIN programmes p ON p.id = d.programme_id`);
  lines.push(`-- JOIN courses c ON c.department_id = d.id`);
  lines.push(`-- LEFT JOIN units u ON u.course_id = c.id`);
  lines.push(`-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = ${sqlEscape(dept.slug)}`);
  lines.push(`-- GROUP BY d.name;`);

  return lines.join('\n');
}

function run() {
  const depts = buildDepartmentData();
  const outputDir = path.resolve(__dirname, '../supabase/seeds/nonmodular');
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  const totalCoursesAll = depts.reduce((acc, d) => acc + d.courses.length, 0);
  const totalUnitsAll = depts.reduce((acc, d) => acc + d.courses.reduce((cAcc, c) => cAcc + c.modules.reduce((mAcc, m) => mAcc + m.units.length, 0), 0), 0);

  const masterLines: string[] = [];
  masterLines.push(`-- ==============================================================================`);
  masterLines.push(`-- COMPREHENSIVE NON-MODULAR CDACC (CYCLE 1 & 2) MASTER SEED SCRIPT`);
  masterLines.push(`-- Total: ${totalCoursesAll} Courses | ${totalUnitsAll} Units across 11 Departments`);
  masterLines.push(`-- Safe to run in Supabase SQL Editor`);
  masterLines.push(`-- ==============================================================================`);
  masterLines.push(`BEGIN;`);
  masterLines.push(``);
  masterLines.push(`-- Ensure Programme Exists`);
  masterLines.push(`INSERT INTO programmes (name, slug, description, sort_order)`);
  masterLines.push(`VALUES (`);
  masterLines.push(`  'CDACC Courses (Cycle 1 & 2)',`);
  masterLines.push(`  'cdacc-courses-cycle-1-and-2',`);
  masterLines.push(`  'TVET CDACC Cycle 1 and Cycle 2 competency-based courses, occupational standards, past papers, and assessment tools.',`);
  masterLines.push(`  2`);
  masterLines.push(`) ON CONFLICT (slug) DO UPDATE SET`);
  masterLines.push(`  name = EXCLUDED.name,`);
  masterLines.push(`  description = EXCLUDED.description,`);
  masterLines.push(`  sort_order = EXCLUDED.sort_order;`);
  masterLines.push(``);

  for (const dept of depts) {
    const sql = generateDepartmentSql(dept, true);
    fs.writeFileSync(path.join(outputDir, dept.fileName), sql, 'utf-8');
    const uCount = dept.courses.reduce((acc, c) => acc + c.modules.reduce((mAcc, m) => mAcc + m.units.length, 0), 0);
    console.log(`Generated: ${dept.fileName} (${dept.courses.length} courses, ${uCount} units)`);

    const deptSql = generateDepartmentSql(dept, false);
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
  masterLines.push(`WHERE p.slug = 'cdacc-courses-cycle-1-and-2'`);
  masterLines.push(`GROUP BY d.name ORDER BY d.name;`);

  const masterPath = path.join(outputDir, '../00_all_nonmodular_cdacc_master.sql');
  fs.writeFileSync(masterPath, masterLines.join('\n'), 'utf-8');
  console.log(`Generated master seed: 00_all_nonmodular_cdacc_master.sql (${totalCoursesAll} courses, ${totalUnitsAll} units)`);
}

run();
