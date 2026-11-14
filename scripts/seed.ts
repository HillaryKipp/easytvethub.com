// Seed data for TVET Papers Kenya
// Run via: npm run seed
// Also prints idempotent SQL in supabase/seed.sql so it can be run either in Supabase SQL Editor or via CLI

import * as fs from 'fs';
import * as path from 'path';
import * as dotenv from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import { detectLevelFromName, makeUniqueSlug, slugify } from '../lib/utils';

dotenv.config({ path: path.resolve(process.cwd(), '.env.local') });
dotenv.config({ path: path.resolve(process.cwd(), '.env') });

export interface SeedResource {
  type: 'cutting_list' | 'candidate_tool' | 'assessor_guide' | 'past_paper' | 'marking_scheme' | 'other';
  title: string;
  file_url: string;
  year: number;
}

export interface SeedModule {
  module_number: number;
  title: string;
  units: string[];
}

export const PROGRAMMES_SEED = [
  {
    name: 'Modular CDACC Courses (Cycle 3)',
    slug: 'modular-cdacc-courses-cycle-3',
    sort_order: 1,
    description:
      'TVET CDACC Cycle 3 modularized competency-based education and training (CBET) courses across Levels 3, 4, 5, and 6 in Kenya.',
  },
  {
    name: 'CDACC Courses (Cycle 1 & 2)',
    slug: 'cdacc-courses-cycle-1-and-2',
    sort_order: 2,
    description:
      'TVET CDACC Cycle 1 and Cycle 2 competency-based courses, occupational standards, past papers, and assessment tools.',
  },
  {
    name: 'KNEC Courses',
    slug: 'knec-courses',
    sort_order: 3,
    description:
      'Kenya National Examinations Council (KNEC) Craft, Artisan, and Diploma TVET courses, modules, and past examination papers.',
  },
];

export const AGRICULTURE_COURSES_RAW = [
  // Level 6
  'AGRI-PRENEURSHIP LEVEL 6',
  'AGRICULTURE AND EXTENSION LEVEL 6',
  'ANIMAL PRODUCTION TECHNOLOGY LEVEL 6',
  'DAIRY PLANT MANAGEMENT LEVEL 6',
  'HORTICULTURAL TECHNOLOGIST LEVEL 6',
  // Level 5
  'AGRICULTURE AND EXTENSION LEVEL 5',
  'AGRIPRENEURSHIP LEVEL 5',
  'ANIMAL PRODUCTION LEVEL 5',
  'AQUACULTURE LEVEL 5',
  'DAIRY PLANT TECHNICIAN LEVEL 5',
  'HORTICULTURE LEVEL 5',
  // Level 4
  'AGRICULTURAL FARM ATTENDANT LEVEL 4',
  'AGRIPRENEURSHIP LEVEL 4',
  'ANIMAL PRODUCTION TECHNOLOGY LEVEL 4',
  'APIARY ATTENDANCE LEVEL 4',
  'AQUACULTURE LEVEL 4',
  'BEE PRODUCTS PROCESSING LEVEL 4',
  'DAIRY FARM OPERATOR LEVEL 4',
  'DAIRY PLANT TECHNOLOGY LEVEL 4',
  'FARM MACHINERY AND EQUIPMENT OPERATOR LEVEL 4',
  'GENERAL AGRICULTURE LEVEL 4',
  'HORTICULTURE FARM ATTENDANT LEVEL 4',
  'LIVESTOCK FEED PRODUCER LEVEL 4',
  'PIG PRODUCTION OPERATOR LEVEL 4',
  'POULTRY (KIENYEJI CHICKEN) PRODUCTION LEVEL 4',
  'POULTRY (LAYER PRODUCTION) OPERATOR LEVEL 4',
  'POULTRY BROILER PRODUCTION LEVEL 4',
  'POULTRY HATCHERY OPERATOR LEVEL 4',
  // Level 3
  'AGRIPRENEURSHIP LEVEL 3',
  'AQUACULTURE LEVEL 3',
  'BEE HIVES AND BEE EQUIPMENT CONSTRUCTION LEVEL 3',
  'DAIRY FARM ATTENDANCE LEVEL 3',
  'HORTICULTURE LEVEL 3',
  'PASSION FRUIT PRODUCER AND PROCESSOR LEVEL 3',
  'PIG PRODUCTION OPERATOR LEVEL 3',
  'POULTRY (BROILER) PRODUCTION OPERATOR LEVEL 3',
  'POULTRY (KIENYEJI CHICKEN) PRODUCTION OPERATOR LEVEL 3',
  'POULTRY (LAYER) PRODUCTION OPERATOR LEVEL 3',
  'POULTRY LAYER PRODUCTION OPERATOR LEVEL 3',
];

export const AGRIPRENEURSHIP_L6_MODULES: SeedModule[] = [
  {
    module_number: 1,
    title: 'Module 1',
    units: [
      'ESTABLISH AGRI-ENTERPRISE',
      'KEEP AGRI-ENTERPRISE RECORDS',
      'MAINTAIN PRODUCT AND SERVICE QUALITY',
      'MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES',
      'OPERATE AGRI-ENTERPRISE',
    ],
  },
  {
    module_number: 2,
    title: 'Module 2',
    units: [
      'DEVELOP AGRI-ENTERPRISE BUSINESS PLAN',
      'MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES',
      'MARKET AGRICULTURAL PRODUCTS AND SERVICES ONLINE',
      'OPERATE A SMALL AGRI-ENTERPRISE',
      'SUPERVISE AGRIPRENEURAL OPERATIONS',
    ],
  },
  {
    module_number: 3,
    title: 'Module 3',
    units: [
      'APPLY COMMUNICATION SKILLS',
      'APPLY DIGITAL LITERACY',
      'START AGRI-ENTERPRISE',
    ],
  },
  {
    module_number: 4,
    title: 'Module 4',
    units: [
      'APPLY ICT IN AGRI-ENTERPRISE',
      'APPLY WORK ETHICS AND PRACTICES',
    ],
  },
  {
    module_number: 5,
    title: 'Module 5',
    units: [
      'CARRY OUT CROP PRODUCTION',
      'DEVELOP AGRI-ENTERPRISE RECORDS',
      'PERFORM AGRI-ENTERPRISE FARM BUDGETING',
    ],
  },
  {
    module_number: 6,
    title: 'Module 6',
    units: [
      'APPLY GEOGRAPHIC INFORMATION SYSTEMS',
      'CARRY OUT ANIMAL PRODUCTION',
    ],
  },
  {
    module_number: 7,
    title: 'Module 7',
    units: [
      'APPLY SOIL SCIENCE PRINCIPLES',
      'OPERATE FARM IRRIGATION AND DRAINAGE SYSTEMS',
    ],
  },
  {
    module_number: 8,
    title: 'Module 8',
    units: [
      'OPERATE FARM MACHINERY',
      'PREPARE AGRI-ENTERPRISE WORK PLAN',
    ],
  },
  {
    module_number: 9,
    title: 'Module 9',
    units: [
      'CARRY OUT AGRICULTURE MARKET RESEARCH',
      'DEVELOP AGRI-ENTERPRISE BUSINESS PLAN',
    ],
  },
];

export const ESTABLISH_AGRI_ENTERPRISE_RESOURCES: SeedResource[] = [
  {
    type: 'cutting_list',
    title: 'Download Cutting List',
    file_url: 'https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_cl.pdf',
    year: 2025,
  },
  {
    type: 'candidate_tool',
    title: 'Download Candidate Tool',
    file_url: 'https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_ct.pdf',
    year: 2025,
  },
  {
    type: 'assessor_guide',
    title: 'Download Assessor Guide',
    file_url: 'https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_ag.pdf',
    year: 2025,
  },
];

function sqlEscape(val: string | null | undefined): string {
  if (val === null || val === undefined) return 'NULL';
  return `'${val.replace(/'/g, "''")}'`;
}

export function generateSeedSql(): string {
  const lines: string[] = [];
  lines.push('-- Idempotent seed SQL for TVET Papers Kenya');
  lines.push('-- Run this in the Supabase SQL Editor (bypasses RLS automatically)');
  lines.push('BEGIN;');
  lines.push('');

  for (const p of PROGRAMMES_SEED) {
    lines.push(
      `INSERT INTO programmes (name, slug, description, sort_order) VALUES (${sqlEscape(p.name)}, ${sqlEscape(
        p.slug
      )}, ${sqlEscape(p.description)}, ${p.sort_order}) ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, sort_order = EXCLUDED.sort_order;`
    );
  }

  const deptName = 'AGRICULTURE AND AQUACULTURE DEPARTMENT';
  const deptSlug = slugify(deptName);

  lines.push('');
  lines.push(`-- Insert Department: ${deptName}`);
  lines.push(`INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, ${sqlEscape(deptName)}, ${sqlEscape(deptSlug)}, 'Accredited CDACC Agriculture, Agribusiness, Animal Production, Dairy, Horticulture, and Aquaculture TVET courses in Kenya.', 1
FROM programmes WHERE slug = 'modular-cdacc-courses-cycle-3'
ON CONFLICT (programme_id, slug) DO UPDATE SET name = EXCLUDED.name;`);

  lines.push('');
  lines.push('-- Insert Courses under AGRICULTURE AND AQUACULTURE DEPARTMENT');
  const usedCourseSlugs = new Set<string>();
  const courseSlugsByName = new Map<string, string>();

  for (const courseName of AGRICULTURE_COURSES_RAW) {
    const level = detectLevelFromName(courseName);
    const cSlug = makeUniqueSlug(courseName, usedCourseSlugs);
    courseSlugsByName.set(courseName, cSlug);
    lines.push(`INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, ${sqlEscape(courseName)}, ${sqlEscape(cSlug)}, ${level ?? 'NULL'}, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = ${sqlEscape(deptSlug)}
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;`);
  }

  const agriL6Slug = courseSlugsByName.get('AGRI-PRENEURSHIP LEVEL 6') || 'agri-preneurship-level-6';
  lines.push('');
  lines.push('-- Insert Modules and Units for AGRI-PRENEURSHIP LEVEL 6');

  const firstUnitSlugByName = new Map<string, string>();
  const usedUnitSlugs = new Set<string>();

  for (const mod of AGRIPRENEURSHIP_L6_MODULES) {
    lines.push(`INSERT INTO modules (course_id, module_number, title)
SELECT c.id, ${mod.module_number}, ${sqlEscape(mod.title)}
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = ${sqlEscape(deptSlug)} AND c.slug = ${sqlEscape(agriL6Slug)}
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;`);

    for (const unitName of mod.units) {
      const normalizedName = unitName.trim().toUpperCase();
      const baseSlug = slugify(unitName);
      let unitSlug = baseSlug;
      let canonicalUnitSlug: string | null = null;

      if (firstUnitSlugByName.has(normalizedName)) {
        canonicalUnitSlug = firstUnitSlugByName.get(normalizedName)!;
        unitSlug = `${baseSlug}-module-${mod.module_number}`;
        if (usedUnitSlugs.has(unitSlug)) {
          unitSlug = makeUniqueSlug(unitSlug, usedUnitSlugs);
        } else {
          usedUnitSlugs.add(unitSlug);
        }
      } else {
        unitSlug = makeUniqueSlug(unitName, usedUnitSlugs);
        firstUnitSlugByName.set(normalizedName, unitSlug);
      }

      if (canonicalUnitSlug) {
        lines.push(`INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, ${sqlEscape(unitName)}, ${sqlEscape(unitSlug)}, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = ${mod.module_number}
LEFT JOIN units canon ON canon.course_id = c.id AND canon.slug = ${sqlEscape(canonicalUnitSlug)}
WHERE d.slug = ${sqlEscape(deptSlug)} AND c.slug = ${sqlEscape(agriL6Slug)}
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id, canonical_unit_id = EXCLUDED.canonical_unit_id;`);
      } else {
        lines.push(`INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, ${sqlEscape(unitName)}, ${sqlEscape(unitSlug)}, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = ${mod.module_number}
WHERE d.slug = ${sqlEscape(deptSlug)} AND c.slug = ${sqlEscape(agriL6Slug)}
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;`);
      }
    }
  }

  lines.push('');
  lines.push('-- Insert Resources for UNIT: ESTABLISH AGRI-ENTERPRISE');
  lines.push(`DELETE FROM resources WHERE unit_id IN (
  SELECT u.id FROM units u
  JOIN courses c ON c.id = u.course_id
  WHERE c.slug = ${sqlEscape(agriL6Slug)} AND u.slug = 'establish-agri-enterprise'
);`);

  ESTABLISH_AGRI_ENTERPRISE_RESOURCES.forEach((res, idx) => {
    lines.push(`INSERT INTO resources (unit_id, type, title, file_url, year, sort_order)
SELECT u.id, ${sqlEscape(res.type)}::resource_type, ${sqlEscape(res.title)}, ${sqlEscape(res.file_url)}, ${res.year}, ${
      idx + 1
    }
FROM units u
JOIN courses c ON c.id = u.course_id
WHERE c.slug = ${sqlEscape(agriL6Slug)} AND u.slug = 'establish-agri-enterprise';`);
  });

  lines.push('');
  lines.push('COMMIT;');
  return lines.join('\n');
}

async function main() {
  // Always write supabase/seed.sql first
  const sqlContent = generateSeedSql();
  const sqlOutPath = path.resolve(process.cwd(), 'supabase', 'seed.sql');
  fs.writeFileSync(sqlOutPath, sqlContent, 'utf8');
  console.log(`Generated idempotent SQL seed file at: ${sqlOutPath}`);

  const rawUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!rawUrl || !anonKey) {
    console.log('Skipping live Supabase API seed because env vars are not set. Run supabase/seed.sql in Supabase SQL Editor.');
    return;
  }

  const supabaseUrl = rawUrl.startsWith('http') ? rawUrl : `https://${rawUrl}.supabase.co`;
  const supabase = createClient(supabaseUrl, anonKey);

  // Optional admin login via env vars if user wants to run seed via client
  const adminEmail = process.env.ADMIN_EMAIL;
  const adminPassword = process.env.ADMIN_PASSWORD;
  if (adminEmail && adminPassword) {
    const { error: authErr } = await supabase.auth.signInWithPassword({
      email: adminEmail,
      password: adminPassword,
    });
    if (authErr) {
      console.warn('Admin sign-in warning:', authErr.message);
    } else {
      console.log(`Authenticated as admin (${adminEmail})`);
    }
  }

  console.log('Attempting to upsert seed data via Supabase client...');
  const { data: progData, error: progErr } = await supabase
    .from('programmes')
    .upsert(PROGRAMMES_SEED, { onConflict: 'slug' })
    .select();

  if (progErr) {
    console.warn(
      `\nNote: Direct anonymous write returned: "${progErr.message}".\nBecause RLS restricts writes to authenticated admins, you can either:\n1) Paste and run "supabase/seed.sql" directly in your Supabase SQL Editor (recommended, takes 2 seconds), OR\n2) Log in via /admin or pass ADMIN_EMAIL and ADMIN_PASSWORD to "npm run seed".`
    );
    return;
  }

  const cycle3 = progData?.find((p) => p.slug === 'modular-cdacc-courses-cycle-3');
  if (!cycle3) return;

  const deptName = 'AGRICULTURE AND AQUACULTURE DEPARTMENT';
  const deptSlug = slugify(deptName);

  const { data: deptData, error: deptErr } = await supabase
    .from('departments')
    .upsert(
      [
        {
          programme_id: cycle3.id,
          name: deptName,
          slug: deptSlug,
          description:
            'Accredited CDACC Agriculture, Agribusiness, Animal Production, Dairy, Horticulture, and Aquaculture TVET courses in Kenya.',
          sort_order: 1,
        },
      ],
      { onConflict: 'programme_id,slug' }
    )
    .select()
    .single();

  if (deptErr || !deptData) {
    console.error('Failed to upsert department:', deptErr?.message);
    return;
  }

  const usedCourseSlugs = new Set<string>();
  const coursesPayload = AGRICULTURE_COURSES_RAW.map((name) => ({
    department_id: deptData.id,
    name,
    slug: makeUniqueSlug(name, usedCourseSlugs),
    level: detectLevelFromName(name),
    published: true,
  }));

  const { data: insertedCourses, error: coursesErr } = await supabase
    .from('courses')
    .upsert(coursesPayload, { onConflict: 'department_id,slug' })
    .select();

  if (coursesErr || !insertedCourses) {
    console.error('Failed to upsert courses:', coursesErr?.message);
    return;
  }

  const agriL6 = insertedCourses.find((c) => c.name === 'AGRI-PRENEURSHIP LEVEL 6');
  if (!agriL6) return;

  const modulesPayload = AGRIPRENEURSHIP_L6_MODULES.map((m) => ({
    course_id: agriL6.id,
    module_number: m.module_number,
    title: m.title,
  }));

  const { data: insertedModules, error: modErr } = await supabase
    .from('modules')
    .upsert(modulesPayload, { onConflict: 'course_id,module_number' })
    .select();

  if (modErr || !insertedModules) {
    console.error('Failed to upsert modules:', modErr?.message);
    return;
  }

  const modIdByNumber = new Map<number, string>();
  insertedModules.forEach((m) => modIdByNumber.set(m.module_number, m.id));

  // First pass: insert primary units and duplicate units
  const firstUnitSlugByName = new Map<string, string>();
  const usedUnitSlugs = new Set<string>();
  const unitsToInsert: {
    module_id: string;
    course_id: string;
    name: string;
    slug: string;
    canonicalSlug: string | null;
  }[] = [];

  for (const mod of AGRIPRENEURSHIP_L6_MODULES) {
    const modId = modIdByNumber.get(mod.module_number)!;
    for (const unitName of mod.units) {
      const normalized = unitName.trim().toUpperCase();
      const baseSlug = slugify(unitName);
      if (firstUnitSlugByName.has(normalized)) {
        const canonicalSlug = firstUnitSlugByName.get(normalized)!;
        let dupSlug = `${baseSlug}-module-${mod.module_number}`;
        if (usedUnitSlugs.has(dupSlug)) {
          dupSlug = makeUniqueSlug(dupSlug, usedUnitSlugs);
        } else {
          usedUnitSlugs.add(dupSlug);
        }
        unitsToInsert.push({
          module_id: modId,
          course_id: agriL6.id,
          name: unitName,
          slug: dupSlug,
          canonicalSlug,
        });
      } else {
        const uSlug = makeUniqueSlug(unitName, usedUnitSlugs);
        firstUnitSlugByName.set(normalized, uSlug);
        unitsToInsert.push({
          module_id: modId,
          course_id: agriL6.id,
          name: unitName,
          slug: uSlug,
          canonicalSlug: null,
        });
      }
    }
  }

  const { data: upsertedUnits, error: unitsErr } = await supabase
    .from('units')
    .upsert(
      unitsToInsert.map((u) => ({
        module_id: u.module_id,
        course_id: u.course_id,
        name: u.name,
        slug: u.slug,
        published: true,
      })),
      { onConflict: 'course_id,slug' }
    )
    .select();

  if (unitsErr || !upsertedUnits) {
    console.error('Failed to upsert units:', unitsErr?.message);
    return;
  }

  const unitIdBySlug = new Map<string, string>();
  upsertedUnits.forEach((u) => unitIdBySlug.set(u.slug, u.id));

  // Second pass: link canonical_unit_id for repeated units
  for (const u of unitsToInsert) {
    if (u.canonicalSlug) {
      const unitId = unitIdBySlug.get(u.slug);
      const canonicalId = unitIdBySlug.get(u.canonicalSlug);
      if (unitId && canonicalId) {
        await supabase.from('units').update({ canonical_unit_id: canonicalId }).eq('id', unitId);
      }
    }
  }

  // Resources for ESTABLISH AGRI-ENTERPRISE
  const establishUnitId = unitIdBySlug.get('establish-agri-enterprise');
  if (establishUnitId) {
    await supabase.from('resources').delete().eq('unit_id', establishUnitId);
    await supabase.from('resources').insert(
      ESTABLISH_AGRI_ENTERPRISE_RESOURCES.map((r, i) => ({
        unit_id: establishUnitId,
        type: r.type,
        title: r.title,
        file_url: r.file_url,
        year: r.year,
        sort_order: i + 1,
      }))
    );
  }

  console.log('Successfully seeded all programmes, departments, courses, modules, units, and resources!');
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
