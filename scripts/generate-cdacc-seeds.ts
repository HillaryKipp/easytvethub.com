import * as fs from 'fs';
import * as path from 'path';
import { slugify, makeUniqueSlug } from '../lib/utils';

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
  name: string;
  slug: string;
  description: string;
  sortOrder: number;
  courses: CourseItem[];
}

const ALL_DEPARTMENTS_CONFIG = [
  {
    name: 'AGRICULTURE AND AQUACULTURE DEPARTMENT',
    slug: 'agriculture-and-aquaculture-department',
    description: 'Accredited TVET CDACC Agriculture, Agribusiness, Animal Production, Dairy Plant, Horticulture, and Aquaculture modular courses in Kenya.',
    sortOrder: 1,
    inputFile: 'data/cdacc-input.txt',
  },
  {
    name: 'APPLIED SCIENCE DEPARTMENT',
    slug: 'applied-science-department',
    description: 'Accredited TVET CDACC Applied Science modular courses in Analytical Chemistry, Applied Biology, Statistics, Biomedical Engineering, Industrial Chemistry, and Science Laboratory Technology.',
    sortOrder: 2,
    inputFile: 'data/cdacc-input.txt',
  },
  {
    name: 'BUILDING AND CIVIL ENGINEERING DEPARTMENT',
    slug: 'building-and-civil-engineering-department',
    description: 'Accredited TVET CDACC Building and Civil Engineering modular courses in Architecture, Civil Engineering, Building Technology, Cartography & GIS, Land Survey, Plumbing, Masonry, and Carpentry.',
    sortOrder: 3,
    inputFile: 'data/cdacc-input.txt',
  },
  {
    name: 'BUSINESS STUDIES DEPARTMENT',
    slug: 'business-studies-department',
    description: 'Accredited TVET CDACC Business Studies modular courses in Accountancy, Banking & Finance, Business Management, Cooperative Management, Credit Management, Human Resource Management, Marketing, Office Administration, and Procurement.',
    sortOrder: 4,
    inputFile: 'data/cdacc-input.txt',
  },
  {
    name: 'COMPUTING AND INFORMATICS DEPARTMENT',
    slug: 'computing-and-informatics-department',
    description: 'Accredited TVET CDACC Computing and Informatics modular courses in ICT, Software Development, Network System Administration, and Library & Information Management.',
    sortOrder: 5,
    inputFile: 'data/cdacc-input-batch2.txt',
  },
  {
    name: 'ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT',
    slug: 'electrical-and-electronic-engineering-department',
    description: 'Accredited TVET CDACC Electrical and Electronic Engineering modular courses in Electrical Installation, Mechatronics, Instrumentation & Control, Solar PV, and Telecommunications.',
    sortOrder: 6,
    inputFile: 'data/cdacc-input-batch2.txt',
  },
  {
    name: 'FASHION DESIGN AND COSMETOLOGY DEPARTMENT',
    slug: 'fashion-design-and-cosmetology-department',
    description: 'Accredited TVET CDACC Fashion Design and Cosmetology modular courses in Hairdressing, Beauty Therapy, Nail Care, Fashion Design, and Footwear Production.',
    sortOrder: 7,
    inputFile: 'data/cdacc-input-batch2.txt',
  },
  {
    name: 'HEALTH SCIENCE DEPARTMENT',
    slug: 'health-science-department',
    description: 'Accredited TVET CDACC Health Science modular courses in Community Health, Nutrition & Dietetics, Healthcare Support Services, and Caregiving.',
    sortOrder: 8,
    inputFile: 'data/cdacc-input-batch2.txt',
  },
  {
    name: 'CATERING AND ACCOMMODATION DEPARTMENT',
    slug: 'catering-and-accommodation-department',
    description: 'Accredited TVET CDACC Catering and Accommodation modular courses in Food & Beverage, Culinary Arts, Baking, Barista, Housekeeping, Tour & Travel, and Hospitality Management.',
    sortOrder: 9,
    inputFile: 'data/cdacc-input-batch2.txt',
  },
  {
    name: 'MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT',
    slug: 'mechanical-and-automotive-engineering-department',
    description: 'Accredited TVET CDACC Mechanical and Automotive Engineering modular courses in Automotive, Autobody, Construction Plant, Mechanical Production, Welding, and Robotics.',
    sortOrder: 10,
    inputFile: 'data/cdacc-input-batch2.txt',
  },
  {
    name: 'SOCIAL WORK DEPARTMENT',
    slug: 'social-work-department',
    description: 'Accredited TVET CDACC Social Work and Community Development modular courses in Social Work, Child Protection, and Professional Counselling.',
    sortOrder: 11,
    inputFile: 'data/cdacc-input-batch2.txt',
  },
];

function sqlEscape(val: string | null | undefined): string {
  if (val === null || val === undefined) return 'NULL';
  return `'${val.replace(/'/g, "''")}'`;
}

function parseInputFile(filePath: string, deptConfigs: typeof ALL_DEPARTMENTS_CONFIG): DepartmentItem[] {
  const content = fs.readFileSync(filePath, 'utf-8');
  const lines = content.split(/\r?\n/).map(l => l.trim()).filter(l => l.length > 0);

  const depts: DepartmentItem[] = [];
  let currentDept: DepartmentItem | null = null;
  let currentCourse: CourseItem | null = null;
  let currentModule: ModuleItem | null = null;

  let deptCourseSlugs = new Set<string>();
  let courseUnitSlugs = new Set<string>();
  let courseUnitFirstSlug = new Map<string, string>();

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

    // Check if line is a department header
    const cleanDept = line.replace(/^\d+[\.\)]\s*/, '').trim().toUpperCase();
    const deptCfg = deptConfigs.find(d => cleanDept === d.name);
    if (deptCfg) {
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

    // Check if line is pure level header (e.g. "Level 6", "1. Level 6", "Level 5")
    if (/^(?:\d+\.?\s*)?Level\s*\d+$/i.test(line)) {
      continue;
    }

    // Check if module header (e.g. "Module 1 Units", "Module Units")
    const modMatch = line.match(/^Module\s*(\d+)?\s*Units?$/i);
    if (modMatch) {
      const modNum = modMatch[1] ? parseInt(modMatch[1], 10) : 1;
      currentModule = {
        module_number: modNum,
        title: `Module ${modNum}`,
        units: [],
      };
      if (currentCourse) {
        currentCourse.modules.push(currentModule);
      }
      continue;
    }

    // Check if course header (contains LEVEL 6, LEVEL: 6, LEVEL 5, etc.)
    const courseLevelMatch = line.match(/\bLEVEL:?\s*(\d+)\b/i);
    if (courseLevelMatch) {
      const detectedLevel = parseInt(courseLevelMatch[1], 10);
      let normalizedCourseName = line
        .replace(/^[•\-\*\d\.\s]+/g, '') // remove bullet points or numbers
        .replace(/LEVEL:\s*/i, 'LEVEL ')
        .trim();

      const courseSlug = makeUniqueSlug(normalizedCourseName, deptCourseSlugs);

      courseUnitSlugs = new Set<string>();
      courseUnitFirstSlug = new Map<string, string>();

      currentCourse = {
        name: normalizedCourseName,
        slug: courseSlug,
        level: detectedLevel,
        modules: [],
      };
      if (currentDept) {
        currentDept.courses.push(currentCourse);
      }
      currentModule = null;
      continue;
    }

    // Otherwise it is a unit name
    if (currentCourse && currentModule) {
      let unitName = line
        .replace(/^\d+[\.\)]\s*/, '') // remove numbers like "1. ", "2. "
        .replace(/^[•\-\*]\s*/, '')   // remove bullets
        .trim()
        .toUpperCase();

      if (unitName.length === 0) continue;

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

  return depts;
}

function generateDepartmentSql(dept: DepartmentItem, includeProgrammeHeader: boolean = true): string {
  const lines: string[] = [];
  lines.push(`-- ==============================================================================`);
  lines.push(`-- SEED SCRIPT FOR: ${dept.name}`);
  lines.push(`-- TVET CDACC Cycle 3 Modular Courses and Units`);
  lines.push(`-- Total Courses: ${dept.courses.length} | Total Units: ${dept.courses.reduce((acc, c) => acc + c.modules.reduce((mAcc, m) => mAcc + m.units.length, 0), 0)}`);
  lines.push(`-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)`);
  lines.push(`-- ==============================================================================`);
  lines.push(`BEGIN;`);
  lines.push(``);

  if (includeProgrammeHeader) {
    lines.push(`-- 1. Ensure Programme Exists`);
    lines.push(`INSERT INTO programmes (name, slug, description, sort_order)`);
    lines.push(`VALUES (`);
    lines.push(`  'Modular CDACC Courses (Cycle 3)',`);
    lines.push(`  'modular-cdacc-courses-cycle-3',`);
    lines.push(`  'TVET CDACC Cycle 3 modularized competency-based education and training (CBET) courses across Levels 3, 4, 5, and 6 in Kenya.',`);
    lines.push(`  1`);
    lines.push(`) ON CONFLICT (slug) DO UPDATE SET`);
    lines.push(`  name = EXCLUDED.name,`);
    lines.push(`  description = EXCLUDED.description,`);
    lines.push(`  sort_order = EXCLUDED.sort_order;`);
    lines.push(``);
  }

  lines.push(`-- 2. Upsert Department: ${dept.name}`);
  lines.push(`INSERT INTO departments (programme_id, name, slug, description, sort_order)`);
  lines.push(`SELECT id, ${sqlEscape(dept.name)}, ${sqlEscape(dept.slug)}, ${sqlEscape(dept.description)}, ${dept.sortOrder}`);
  lines.push(`FROM programmes WHERE slug = 'modular-cdacc-courses-cycle-3'`);
  lines.push(`ON CONFLICT (programme_id, slug) DO UPDATE SET`);
  lines.push(`  name = EXCLUDED.name,`);
  lines.push(`  description = EXCLUDED.description,`);
  lines.push(`  sort_order = EXCLUDED.sort_order;`);
  lines.push(``);

  lines.push(`-- 3. Clean Override: Remove previous courses & modules/units under this department`);
  lines.push(`-- Cascades automatically to modules and units for a completely clean sync.`);
  lines.push(`DELETE FROM courses`);
  lines.push(`WHERE department_id = (`);
  lines.push(`  SELECT d.id FROM departments d`);
  lines.push(`  JOIN programmes p ON p.id = d.programme_id`);
  lines.push(`  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = ${sqlEscape(dept.slug)}`);
  lines.push(`);`);
  lines.push(``);

  lines.push(`-- 4. Insert Courses under ${dept.name}`);
  for (const course of dept.courses) {
    lines.push(`INSERT INTO courses (department_id, name, slug, level, published)`);
    lines.push(`SELECT d.id, ${sqlEscape(course.name)}, ${sqlEscape(course.slug)}, ${course.level}, true`);
    lines.push(`FROM departments d`);
    lines.push(`JOIN programmes p ON p.id = d.programme_id`);
    lines.push(`WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = ${sqlEscape(dept.slug)};`);
  }
  lines.push(``);

  lines.push(`-- 5. Insert Modules and Units for Each Course`);
  for (const course of dept.courses) {
    lines.push(`-- ------------------------------------------------------------------------------`);
    lines.push(`-- Course: ${course.name} (${course.modules.length} Modules)`);
    lines.push(`-- ------------------------------------------------------------------------------`);

    for (const mod of course.modules) {
      lines.push(`-- Module ${mod.module_number}: ${mod.title}`);
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
  const outputDir = path.resolve(__dirname, '../supabase/seeds');
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  // Parse Batch 1 (4 departments)
  const batch1Configs = ALL_DEPARTMENTS_CONFIG.filter(d => d.inputFile === 'data/cdacc-input.txt');
  const deptsBatch1 = parseInputFile(path.resolve(__dirname, 'data/cdacc-input.txt'), batch1Configs);

  // Parse Batch 2 (7 departments)
  const batch2Configs = ALL_DEPARTMENTS_CONFIG.filter(d => d.inputFile === 'data/cdacc-input-batch2.txt');
  const deptsBatch2 = parseInputFile(path.resolve(__dirname, 'data/cdacc-input-batch2.txt'), batch2Configs);

  const allDepts = [...deptsBatch1, ...deptsBatch2];

  const fileMap: Record<string, string> = {
    'AGRICULTURE AND AQUACULTURE DEPARTMENT': '01_agriculture_and_aquaculture.sql',
    'APPLIED SCIENCE DEPARTMENT': '02_applied_science.sql',
    'BUILDING AND CIVIL ENGINEERING DEPARTMENT': '03_building_and_civil_engineering.sql',
    'BUSINESS STUDIES DEPARTMENT': '04_business_studies.sql',
    'COMPUTING AND INFORMATICS DEPARTMENT': '05_computing_and_informatics.sql',
    'ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT': '06_electrical_and_electronics.sql',
    'FASHION DESIGN AND COSMETOLOGY DEPARTMENT': '07_fashion_design_and_cosmetology.sql',
    'HEALTH SCIENCE DEPARTMENT': '08_health_sciences.sql',
    'CATERING AND ACCOMMODATION DEPARTMENT': '09_catering_and_accommodation.sql',
    'MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT': '10_mechanical_and_automotive_engineering.sql',
    'SOCIAL WORK DEPARTMENT': '11_social_work.sql',
  };

  // Write individual department seed files
  for (const dept of allDepts) {
    const fileName = fileMap[dept.name];
    if (!fileName) {
      console.warn(`No file mapping for department: ${dept.name}`);
      continue;
    }
    const sql = generateDepartmentSql(dept, true);
    const filePath = path.join(outputDir, fileName);
    fs.writeFileSync(filePath, sql, 'utf-8');
    const uCount = dept.courses.reduce((acc, c) => acc + c.modules.reduce((mAcc, m) => mAcc + m.units.length, 0), 0);
    console.log(`Generated: ${fileName} (${dept.courses.length} courses, ${uCount} units)`);
  }

  // Generate Master for Batch 2 (the 7 new departments)
  const batch2MasterLines: string[] = [];
  batch2MasterLines.push(`-- ==============================================================================`);
  batch2MasterLines.push(`-- BATCH 2 SEED SCRIPT (7 DEPARTMENTS: COMPUTING, ELECTRICAL, FASHION, HEALTH, CATERING, MECHANICAL, SOCIAL WORK)`);
  batch2MasterLines.push(`-- Total Courses: ${deptsBatch2.reduce((acc, d) => acc + d.courses.length, 0)} | Total Units: ${deptsBatch2.reduce((acc, d) => acc + d.courses.reduce((mAcc, c) => mAcc + c.modules.reduce((uAcc, m) => uAcc + m.units.length, 0), 0), 0)}`);
  batch2MasterLines.push(`-- Safe to run in Supabase SQL Editor`);
  batch2MasterLines.push(`-- ==============================================================================`);
  batch2MasterLines.push(`BEGIN;`);
  batch2MasterLines.push(``);
  batch2MasterLines.push(`-- Ensure Programme Exists`);
  batch2MasterLines.push(`INSERT INTO programmes (name, slug, description, sort_order)`);
  batch2MasterLines.push(`VALUES (`);
  batch2MasterLines.push(`  'Modular CDACC Courses (Cycle 3)',`);
  batch2MasterLines.push(`  'modular-cdacc-courses-cycle-3',`);
  batch2MasterLines.push(`  'TVET CDACC Cycle 3 modularized competency-based education and training (CBET) courses across Levels 3, 4, 5, and 6 in Kenya.',`);
  batch2MasterLines.push(`  1`);
  batch2MasterLines.push(`) ON CONFLICT (slug) DO UPDATE SET`);
  batch2MasterLines.push(`  name = EXCLUDED.name,`);
  batch2MasterLines.push(`  description = EXCLUDED.description,`);
  batch2MasterLines.push(`  sort_order = EXCLUDED.sort_order;`);
  batch2MasterLines.push(``);

  for (const dept of deptsBatch2) {
    const deptSql = generateDepartmentSql(dept, false);
    const trimmed = deptSql
      .replace(/^BEGIN;\s*/m, '')
      .replace(/COMMIT;\s*-- Verification Query:.*$/s, '');
    batch2MasterLines.push(trimmed);
  }
  batch2MasterLines.push(`COMMIT;`);
  batch2MasterLines.push(``);
  batch2MasterLines.push(`SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units`);
  batch2MasterLines.push(`FROM departments d`);
  batch2MasterLines.push(`JOIN courses c ON c.department_id = d.id`);
  batch2MasterLines.push(`LEFT JOIN units u ON u.course_id = c.id`);
  batch2MasterLines.push(`WHERE d.sort_order >= 5`);
  batch2MasterLines.push(`GROUP BY d.name ORDER BY d.name;`);

  fs.writeFileSync(path.join(outputDir, '00_batch2_7_departments_master.sql'), batch2MasterLines.join('\n'), 'utf-8');
  console.log(`Generated: 00_batch2_7_departments_master.sql`);

  // Generate All-in-One Master for all 11 departments
  const allMasterLines: string[] = [];
  allMasterLines.push(`-- ==============================================================================`);
  allMasterLines.push(`-- COMPREHENSIVE MASTER SEED SCRIPT (ALL 11 DEPARTMENTS)`);
  allMasterLines.push(`-- Total Courses: ${allDepts.reduce((acc, d) => acc + d.courses.length, 0)} | Total Units: ${allDepts.reduce((acc, d) => acc + d.courses.reduce((mAcc, c) => mAcc + c.modules.reduce((uAcc, m) => uAcc + m.units.length, 0), 0), 0)}`);
  allMasterLines.push(`-- Safe to run in Supabase SQL Editor`);
  allMasterLines.push(`-- ==============================================================================`);
  allMasterLines.push(`BEGIN;`);
  allMasterLines.push(``);
  allMasterLines.push(`-- Ensure Programme Exists`);
  allMasterLines.push(`INSERT INTO programmes (name, slug, description, sort_order)`);
  allMasterLines.push(`VALUES (`);
  allMasterLines.push(`  'Modular CDACC Courses (Cycle 3)',`);
  allMasterLines.push(`  'modular-cdacc-courses-cycle-3',`);
  allMasterLines.push(`  'TVET CDACC Cycle 3 modularized competency-based education and training (CBET) courses across Levels 3, 4, 5, and 6 in Kenya.',`);
  allMasterLines.push(`  1`);
  allMasterLines.push(`) ON CONFLICT (slug) DO UPDATE SET`);
  allMasterLines.push(`  name = EXCLUDED.name,`);
  allMasterLines.push(`  description = EXCLUDED.description,`);
  allMasterLines.push(`  sort_order = EXCLUDED.sort_order;`);
  allMasterLines.push(``);

  for (const dept of allDepts) {
    const deptSql = generateDepartmentSql(dept, false);
    const trimmed = deptSql
      .replace(/^BEGIN;\s*/m, '')
      .replace(/COMMIT;\s*-- Verification Query:.*$/s, '');
    allMasterLines.push(trimmed);
  }
  allMasterLines.push(`COMMIT;`);
  allMasterLines.push(``);
  allMasterLines.push(`SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units`);
  allMasterLines.push(`FROM departments d`);
  allMasterLines.push(`JOIN courses c ON c.department_id = d.id`);
  allMasterLines.push(`LEFT JOIN units u ON u.course_id = c.id`);
  allMasterLines.push(`GROUP BY d.name ORDER BY d.name;`);

  fs.writeFileSync(path.join(outputDir, '00_all_11_departments_master.sql'), allMasterLines.join('\n'), 'utf-8');
  console.log(`Generated: 00_all_11_departments_master.sql`);
}

run();
