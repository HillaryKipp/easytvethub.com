-- ==============================================================================
-- MASTER SEED SCRIPT FOR ALL 4 DEPARTMENTS (CYCLE 3 CDACC MODULAR)
-- Total: 88 Courses, 1143 Units
-- Safe to run in Supabase SQL Editor
-- ==============================================================================
BEGIN;

-- 1. Ensure Programme Exists
INSERT INTO programmes (name, slug, description, sort_order)
VALUES (
  'Modular CDACC Courses (Cycle 3)',
  'modular-cdacc-courses-cycle-3',
  'TVET CDACC Cycle 3 modularized competency-based education and training (CBET) courses across Levels 3, 4, 5, and 6 in Kenya.',
  1
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- ==============================================================================
-- SEED SCRIPT FOR: AGRICULTURE AND AQUACULTURE DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 39 | Total Units: 362
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: AGRICULTURE AND AQUACULTURE DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'AGRICULTURE AND AQUACULTURE DEPARTMENT', 'agriculture-and-aquaculture-department', 'Accredited TVET CDACC Agriculture, Agribusiness, Animal Production, Dairy Plant, Horticulture, and Aquaculture modular courses in Kenya.', 1
FROM programmes WHERE slug = 'modular-cdacc-courses-cycle-3'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & modules/units under this department
-- Cascades automatically to modules and units for a completely clean sync.
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
);

-- 4. Insert Courses under AGRICULTURE AND AQUACULTURE DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURE AND EXTENSION LEVEL 6', 'agriculture-and-extension-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRI-PRENEURSHIP LEVEL 6', 'agri-preneurship-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ANIMAL PRODUCTION TECHNOLOGY LEVEL 6', 'animal-production-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY PLANT MANAGEMENT LEVEL 6', 'dairy-plant-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURAL TECHNOLOGIST LEVEL 6', 'horticultural-technologist-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURE AND EXTENSION LEVEL 5', 'agriculture-and-extension-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRIPRENEURSHIP LEVEL 5', 'agripreneurship-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ANIMAL PRODUCTION LEVEL 5', 'animal-production-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AQUACULTURE LEVEL 5', 'aquaculture-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY PLANT TECHNICIAN LEVEL 5', 'dairy-plant-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE LEVEL 5', 'horticulture-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURAL FARM ATTENDANT LEVEL 4', 'agricultural-farm-attendant-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRIPRENEURSHIP LEVEL 4', 'agripreneurship-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ANIMAL PRODUCTION TECHNOLOGY LEVEL 4', 'animal-production-technology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'APIARY ATTENDANCE LEVEL 4', 'apiary-attendance-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AQUACULTURE LEVEL 4', 'aquaculture-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEE PRODUCTS PROCESSING LEVEL 4', 'bee-products-processing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY FARM OPERATOR LEVEL 4', 'dairy-farm-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY PLANT TECHNOLOGY LEVEL 4', 'dairy-plant-technology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FARM MACHINERY AND EQUIPMENT OPERATOR LEVEL 4', 'farm-machinery-and-equipment-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GENERAL AGRICULTURE LEVEL 4', 'general-agriculture-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE FARM ATTENDANT LEVEL 4', 'horticulture-farm-attendant-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LIVESTOCK FEED PRODUCER LEVEL 4', 'livestock-feed-producer-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PIG PRODUCTION OPERATOR LEVEL 4', 'pig-production-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (KIENYEJI CHICKEN) PRODUCTION LEVEL 4', 'poultry-kienyeji-chicken-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (LAYER PRODUCTION) OPERATOR LEVEL 4', 'poultry-layer-production-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY BROILER PRODUCTION LEVEL 4', 'poultry-broiler-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY HATCHERY OPERATOR LEVEL 4', 'poultry-hatchery-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRIPRENEURSHIP LEVEL 3', 'agripreneurship-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AQUACULTURE LEVEL 3', 'aquaculture-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEE HIVES AND BEE EQUIPMENT CONSTRUCTION LEVEL 3', 'bee-hives-and-bee-equipment-construction-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY FARM ATTENDANCE LEVEL 3', 'dairy-farm-attendance-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE LEVEL 3', 'horticulture-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PASSION FRUIT PRODUCER AND PROCESSOR LEVEL 3', 'passion-fruit-producer-and-processor-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PIG PRODUCTION OPERATOR LEVEL 3', 'pig-production-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (BROILER) PRODUCTION OPERATOR LEVEL 3', 'poultry-broiler-production-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (KIENYEJI CHICKEN) PRODUCTION OPERATOR LEVEL 3', 'poultry-kienyeji-chicken-production-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (LAYER) PRODUCTION OPERATOR LEVEL 3', 'poultry-layer-production-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY LAYER PRODUCTION OPERATOR LEVEL 3', 'poultry-layer-production-operator-level-3-2', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: AGRICULTURE AND EXTENSION LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('OPERATE FARM MACHINERY', 'operate-farm-machinery', NULL::text),
  ('PRODUCE ANNUAL CROPS', 'produce-annual-crops', NULL::text),
  ('PRODUCE HORTICULTURAL CROPS', 'produce-horticultural-crops', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSERVE WATER IN FARM', 'conserve-water-in-farm', NULL::text),
  ('PRODUCE NON-RUMINANT ANIMALS', 'produce-non-ruminant-animals', NULL::text),
  ('PRODUCE RUMINANT ANIMALS', 'produce-ruminant-animals', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CARRY OUT BEE PRODUCTION', 'carry-out-bee-production', NULL::text),
  ('CARRY OUT FISH FARMING', 'carry-out-fish-farming', NULL::text),
  ('PRODUCE PERENNIAL CROPS', 'produce-perennial-crops', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANIMAL ANATOMY AND PHYSIOLOGY', 'apply-animal-anatomy-and-physiology', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CARRY OUT EXTENSION SERVICES', 'carry-out-extension-services', NULL::text),
  ('PRODUCE FORAGE CROPS', 'produce-forage-crops', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY INORGANIC AND ORGANIC CHEMISTRY PRINCIPLES', 'apply-inorganic-and-organic-chemistry-principles', NULL::text),
  ('APPLY SOIL SCIENCE PRINCIPLES', 'apply-soil-science-principles', NULL::text),
  ('ESTABLISH FARM STRUCTURE', 'establish-farm-structure', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY FARM MANAGEMENT PRINCIPLES', 'apply-farm-management-principles', NULL::text),
  ('APPLY GENETICS PRINCIPLES', 'apply-genetics-principles', NULL::text),
  ('SCIENTIFIC RESEARCH', 'scientific-research', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-6';

-- ------------------------------------------------------------------------------
-- Course: AGRI-PRENEURSHIP LEVEL 6 (9 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ESTABLISH AGRI-ENTERPRISE', 'establish-agri-enterprise', NULL::text),
  ('KEEP AGRI-ENTERPRISE RECORDS', 'keep-agri-enterprise-records', NULL::text),
  ('MAINTAIN PRODUCT AND SERVICE QUALITY', 'maintain-product-and-service-quality', NULL::text),
  ('MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES', 'market-agri-enterprise-products-and-services', NULL::text),
  ('OPERATE AGRI-ENTERPRISE', 'operate-agri-enterprise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP AGRI-ENTERPRISE BUSINESS PLAN', 'develop-agri-enterprise-business-plan', NULL::text),
  ('MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES', 'market-agri-enterprise-products-and-services-module-2', 'market-agri-enterprise-products-and-services'),
  ('MARKET AGRICULTURAL PRODUCTS AND SERVICES ONLINE', 'market-agricultural-products-and-services-online', NULL::text),
  ('OPERATE A SMALL AGRI-ENTERPRISE', 'operate-a-small-agri-enterprise', NULL::text),
  ('SUPERVISE AGRIPRENEURAL OPERATIONS', 'supervise-agripreneural-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('START AGRI-ENTERPRISE', 'start-agri-enterprise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ICT IN AGRI-ENTERPRISE', 'apply-ict-in-agri-enterprise', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CARRY OUT CROP PRODUCTION', 'carry-out-crop-production', NULL::text),
  ('DEVELOP AGRI-ENTERPRISE RECORDS', 'develop-agri-enterprise-records', NULL::text),
  ('PERFORM AGRI-ENTERPRISE FARM BUDGETING', 'perform-agri-enterprise-farm-budgeting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY GEOGRAPHIC INFORMATION SYSTEMS', 'apply-geographic-information-systems', NULL::text),
  ('CARRY OUT ANIMAL PRODUCTION', 'carry-out-animal-production', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY SOIL SCIENCE PRINCIPLES', 'apply-soil-science-principles', NULL::text),
  ('OPERATE FARM IRRIGATION AND DRAINAGE SYSTEMS', 'operate-farm-irrigation-and-drainage-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';

-- Module 8: Module 8
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 8, 'Module 8'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 8
JOIN (VALUES
  ('OPERATE FARM MACHINERY', 'operate-farm-machinery', NULL::text),
  ('PREPARE AGRI-ENTERPRISE WORK PLAN', 'prepare-agri-enterprise-work-plan', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';

-- Module 9: Module 9
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 9, 'Module 9'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 9
JOIN (VALUES
  ('CARRY OUT AGRICULTURE MARKET RESEARCH', 'carry-out-agriculture-market-research', NULL::text),
  ('DEVELOP AGRI-ENTERPRISE BUSINESS PLAN', 'develop-agri-enterprise-business-plan-module-9', 'develop-agri-enterprise-business-plan')
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6';

-- ------------------------------------------------------------------------------
-- Course: ANIMAL PRODUCTION TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ESTABLISH FARM STRUCTURES', 'establish-farm-structures', NULL::text),
  ('MANAGE BEEF ANIMALS', 'manage-beef-animals', NULL::text),
  ('MANAGE DAIRY CATTLE', 'manage-dairy-cattle', NULL::text),
  ('PRODUCE LIVESTOCK FEEDS', 'produce-livestock-feeds', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT GOAT PRODUCTION', 'carry-out-goat-production', NULL::text),
  ('CARRY OUT PIG PRODUCTION', 'carry-out-pig-production', NULL::text),
  ('CARRY OUT POULTRY PRODUCTION', 'carry-out-poultry-production', NULL::text),
  ('CARRY OUT SHEEP PRODUCTION', 'carry-out-sheep-production', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CARRY OUT BEE PRODUCTION', 'carry-out-bee-production', NULL::text),
  ('CARRY OUT RABBIT PRODUCTION', 'carry-out-rabbit-production', NULL::text),
  ('OPERATE FARM MACHINERY', 'operate-farm-machinery', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANIMAL ANATOMY AND PHYSIOLOGY', 'apply-animal-anatomy-and-physiology', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MANAGE FISH FARM', 'manage-fish-farm', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY INORGANIC AND ORGANIC CHEMISTRY', 'apply-inorganic-and-organic-chemistry', NULL::text),
  ('APPLY SOIL SCIENCE PRINCIPLES', 'apply-soil-science-principles', NULL::text),
  ('MANAGE DRAUGHT ANIMALS', 'manage-draught-animals', NULL::text),
  ('MANAGE EMERGING LIVESTOCK AND COMPANION ANIMALS', 'manage-emerging-livestock-and-companion-animals', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY BIOCHEMISTRY PRINCIPLES', 'apply-biochemistry-principles', NULL::text),
  ('APPLY FARM MANAGEMENT PRINCIPLES', 'apply-farm-management-principles', NULL::text),
  ('APPLY GENETICS', 'apply-genetics', NULL::text),
  ('APPLY GEOGRAPHIC INFORMATION SYSTEM', 'apply-geographic-information-system', NULL::text),
  ('CONDUCT SCIENTIFIC RESEARCH', 'conduct-scientific-research', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: DAIRY PLANT MANAGEMENT LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('HANDLE RAW MILK', 'handle-raw-milk', NULL::text),
  ('PROCESS FLUID MILK PRODUCTS', 'process-fluid-milk-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROCESS FAT BASED MILK PRODUCTS', 'process-fat-based-milk-products', NULL::text),
  ('PROCESS FERMENTED MILK PRODUCTS', 'process-fermented-milk-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DAIRY PRODUCTION PRINCIPLES', 'apply-dairy-production-principles', NULL::text),
  ('APPLY FUNDAMENTALS OF DAIRY TECHNOLOGY', 'apply-fundamentals-of-dairy-technology', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PROCESS CHEESE PRODUCTS', 'process-cheese-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DAIRY CHEMISTRY PRINCIPLES', 'apply-dairy-chemistry-principles', NULL::text),
  ('APPLY DAIRY MICROBIOLOGY PRINCIPLES', 'apply-dairy-microbiology-principles', NULL::text),
  ('CONDUCT DAIRY PRODUCT QUALITY CONTROL', 'conduct-dairy-product-quality-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY AGRICULTURAL MARKETING PRINCIPLES', 'apply-agricultural-marketing-principles', NULL::text),
  ('APPLY DAIRY EQUIPMENT OPERATIONAL PRINCIPLES', 'apply-dairy-equipment-operational-principles', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PROCESS CONCENTRATED AND DRIED MILK PRODUCTS', 'process-concentrated-and-dried-milk-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF DAIRY PLANT UTILITIES', 'apply-principles-of-dairy-plant-utilities', NULL::text),
  ('APPLY SCIENTIFIC RESEARCH', 'apply-scientific-research', NULL::text),
  ('CONDUCT DAIRY PRODUCT QUALITY ASSURANCE', 'conduct-dairy-product-quality-assurance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURAL TECHNOLOGIST LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PRODUCE HERBS AND SPICES IN OPEN ENVIRONMENT', 'produce-herbs-and-spices-in-open-environment', NULL::text),
  ('PRODUCE HERBS AND SPICES IN PROTECTED ENVIRONMENT', 'produce-herbs-and-spices-in-protected-environment', NULL::text),
  ('PRODUCE VEGETABLE CROPS IN OPEN ENVIRONMENT', 'produce-vegetable-crops-in-open-environment', NULL::text),
  ('PRODUCE VEGETABLE CROPS IN PROTECTED ENVIRONMENT', 'produce-vegetable-crops-in-protected-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OPERATE FARM IRRIGATION AND DRAINAGE SYSTEMS', 'operate-farm-irrigation-and-drainage-systems', NULL::text),
  ('OPERATE FARM MACHINERY', 'operate-farm-machinery', NULL::text),
  ('PRODUCE CUT FLOWERS', 'produce-cut-flowers', NULL::text),
  ('PRODUCE TROPICAL FRUITS', 'produce-tropical-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PRODUCE ORNAMENTAL PLANTS', 'produce-ornamental-plants', NULL::text),
  ('PRODUCE TEMPERATE FRUITS', 'produce-temperate-fruits', NULL::text),
  ('PRODUCE VINE FRUITS', 'produce-vine-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY GEOGRAPHIC INFORMATION SYSTEMS', 'apply-geographic-information-systems', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('IMPROVE SOIL FERTILITY', 'improve-soil-fertility', NULL::text),
  ('PRODUCE EDIBLE MUSHROOMS', 'produce-edible-mushrooms', NULL::text),
  ('PRODUCE SUB-TROPICAL FRUITS', 'produce-sub-tropical-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY BIOCHEMISTRY PRINCIPLES', 'apply-biochemistry-principles', NULL::text),
  ('APPLY INORGANIC AND ORGANIC CHEMISTRY', 'apply-inorganic-and-organic-chemistry', NULL::text),
  ('APPLY SOIL SCIENCE PRINCIPLES', 'apply-soil-science-principles', NULL::text),
  ('PRODUCE OIL CROPS', 'produce-oil-crops', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLIED RESEARCH', 'applied-research', NULL::text),
  ('APPLY FARM MANAGEMENT PRINCIPLES', 'apply-farm-management-principles', NULL::text),
  ('CARRY OUT PLANT BREEDING', 'carry-out-plant-breeding', NULL::text),
  ('CONSTRUCT HORTICULTURAL FARM STRUCTURES AND FARM ROADS', 'construct-horticultural-farm-structures-and-farm-roads', NULL::text),
  ('MANAGE HYDROPONIC FARM', 'manage-hydroponic-farm', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-technologist-level-6';

-- ------------------------------------------------------------------------------
-- Course: AGRICULTURE AND EXTENSION LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('OPERATE FARM MACHINERY', 'operate-farm-machinery', NULL::text),
  ('PRODUCE ANNUAL CROPS', 'produce-annual-crops', NULL::text),
  ('PRODUCE HORTICULTURAL CROPS', 'produce-horticultural-crops', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSERVE WATER IN FARM', 'conserve-water-in-farm', NULL::text),
  ('PRODUCE NON-RUMINANT ANIMALS', 'produce-non-ruminant-animals', NULL::text),
  ('PRODUCE RUMINANT ANIMALS', 'produce-ruminant-animals', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CARRY OUT BEE PRODUCTION', 'carry-out-bee-production', NULL::text),
  ('CARRY OUT FISH FARMING', 'carry-out-fish-farming', NULL::text),
  ('PRODUCE PERENNIAL CROPS', 'produce-perennial-crops', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANIMAL ANATOMY AND PHYSIOLOGY', 'apply-animal-anatomy-and-physiology', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PRODUCE FORAGE CROPS', 'produce-forage-crops', NULL::text),
  ('PROVIDE EXTENSION SERVICES', 'provide-extension-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agriculture-and-extension-level-5';

-- ------------------------------------------------------------------------------
-- Course: AGRIPRENEURSHIP LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ESTABLISH AGRI-ENTERPRISE', 'establish-agri-enterprise', NULL::text),
  ('KEEP AGRI-ENTERPRISE RECORD', 'keep-agri-enterprise-record', NULL::text),
  ('MAINTAIN PRODUCTS AND SERVICES QUALITY', 'maintain-products-and-services-quality', NULL::text),
  ('MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES', 'market-agri-enterprise-products-and-services', NULL::text),
  ('OPERATE AGRI-ENTERPRISE', 'operate-agri-enterprise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP AGRI-ENTERPRISE BUSINESS PLAN', 'develop-agri-enterprise-business-plan', NULL::text),
  ('MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES I', 'market-agri-enterprise-products-and-services-i', NULL::text),
  ('MARKET AGRICULTURAL PRODUCTS AND SERVICES ONLINE', 'market-agricultural-products-and-services-online', NULL::text),
  ('OPERATE SMALL AGRI-ENTERPRISE', 'operate-small-agri-enterprise', NULL::text),
  ('SUPERVISE AGRIPRENEURIAL OPERATIONS', 'supervise-agripreneurial-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('START AGRI-ENTERPRISE', 'start-agri-enterprise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ICT IN AGRI-ENTERPRISE', 'apply-ict-in-agri-enterprise', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';

-- ------------------------------------------------------------------------------
-- Course: ANIMAL PRODUCTION LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ESTABLISH FARM STRUCTURES', 'establish-farm-structures', NULL::text),
  ('MANAGE BEEF ANIMALS', 'manage-beef-animals', NULL::text),
  ('MANAGE DAIRY CATTLE', 'manage-dairy-cattle', NULL::text),
  ('PRODUCE LIVESTOCK FEEDS', 'produce-livestock-feeds', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT GOAT PRODUCTION', 'carry-out-goat-production', NULL::text),
  ('CARRY OUT PIG PRODUCTION', 'carry-out-pig-production', NULL::text),
  ('CARRY OUT POULTRY PRODUCTION', 'carry-out-poultry-production', NULL::text),
  ('CARRY OUT SHEEP PRODUCTION', 'carry-out-sheep-production', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CARRY OUT BEE PRODUCTION', 'carry-out-bee-production', NULL::text),
  ('CARRY OUT RABBIT PRODUCTION', 'carry-out-rabbit-production', NULL::text),
  ('OPERATE FARM MACHINERY', 'operate-farm-machinery', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANIMAL ANATOMY AND PHYSIOLOGY', 'apply-animal-anatomy-and-physiology', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MANAGE FISH FARM', 'manage-fish-farm', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-level-5';

-- ------------------------------------------------------------------------------
-- Course: AQUACULTURE LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM AQUACULTURE HOUSING ACTIVITIES', 'perform-aquaculture-housing-activities', NULL::text),
  ('PRODUCE TABLE SIZE FISH', 'produce-table-size-fish', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OPERATE FISH HATCHERY', 'operate-fish-hatchery', NULL::text),
  ('PRODUCE FISH FEEDS', 'produce-fish-feeds', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM AQUACULTURE OPERATIONS', 'perform-aquaculture-operations', NULL::text),
  ('PRODUCE ORNAMENTAL FISH', 'produce-ornamental-fish', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY AGRICULTURAL MARKETING PRINCIPLES', 'apply-agricultural-marketing-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY FARM MANAGEMENT PRINCIPLES', 'apply-farm-management-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('PERFORM FISH POST HARVEST OPERATIONS', 'perform-fish-post-harvest-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-5';

-- ------------------------------------------------------------------------------
-- Course: DAIRY PLANT TECHNICIAN LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('HANDLE RAW MILK', 'handle-raw-milk', NULL::text),
  ('PROCESS FLUID MILK PRODUCTS', 'process-fluid-milk-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technician-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROCESS FAT BASED MILK PRODUCTS', 'process-fat-based-milk-products', NULL::text),
  ('PROCESS FERMENTED MILK PRODUCTS', 'process-fermented-milk-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technician-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DAIRY PRODUCTION PRINCIPLES', 'apply-dairy-production-principles', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY FUNDAMENTALS OF DAIRY TECHNOLOGY', 'apply-fundamentals-of-dairy-technology', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PROCESS CHEESE PRODUCTS', 'process-cheese-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technician-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DAIRY CHEMISTRY PRINCIPLES', 'apply-dairy-chemistry-principles', NULL::text),
  ('APPLY DAIRY MICROBIOLOGY PRINCIPLES', 'apply-dairy-microbiology-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CONDUCT DAIRY PRODUCT QUALITY CONTROL', 'conduct-dairy-product-quality-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURE LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PRODUCE HERBS AND SPICES IN OPEN ENVIRONMENT', 'produce-herbs-and-spices-in-open-environment', NULL::text),
  ('PRODUCE HERBS AND SPICES IN PROTECTED ENVIRONMENT', 'produce-herbs-and-spices-in-protected-environment', NULL::text),
  ('PRODUCE VEGETABLE CROPS IN OPEN ENVIRONMENT', 'produce-vegetable-crops-in-open-environment', NULL::text),
  ('PRODUCE VEGETABLE CROPS IN PROTECTED ENVIRONMENT', 'produce-vegetable-crops-in-protected-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OPERATE FARM IRRIGATION AND DRAINAGE SYSTEMS', 'operate-farm-irrigation-and-drainage-systems', NULL::text),
  ('OPERATE FARM MACHINERY', 'operate-farm-machinery', NULL::text),
  ('PRODUCE CUT FLOWERS', 'produce-cut-flowers', NULL::text),
  ('PRODUCE TROPICAL FRUITS', 'produce-tropical-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PRODUCE ORNAMENTAL PLANTS', 'produce-ornamental-plants', NULL::text),
  ('PRODUCE TEMPERATE FRUITS', 'produce-temperate-fruits', NULL::text),
  ('PRODUCE VINE FRUITS', 'produce-vine-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY GEOGRAPHIC INFORMATION SYSTEMS', 'apply-geographic-information-systems', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('IMPROVE SOIL FERTILITY', 'improve-soil-fertility', NULL::text),
  ('PRODUCE EDIBLE MUSHROOMS', 'produce-edible-mushrooms', NULL::text),
  ('PRODUCE SUB-TROPICAL FRUITS', 'produce-sub-tropical-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-5';

-- ------------------------------------------------------------------------------
-- Course: AGRICULTURAL FARM ATTENDANT LEVEL 4 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-farm-attendant-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSERVE FARM WATER', 'conserve-farm-water', NULL::text),
  ('OPERATE FARM MACHINERY', 'operate-farm-machinery', NULL::text),
  ('PRODUCE ANNUAL CROPS', 'produce-annual-crops', NULL::text),
  ('PRODUCE HORTICULTURAL CROPS', 'produce-horticultural-crops', NULL::text),
  ('REAR NON-RUMINANT ANIMALS', 'rear-non-ruminant-animals', NULL::text),
  ('REAR RUMINANT ANIMALS', 'rear-ruminant-animals', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-farm-attendant-level-4';

-- ------------------------------------------------------------------------------
-- Course: AGRIPRENEURSHIP LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ESTABLISH AGRI-ENTERPRISE', 'establish-agri-enterprise', NULL::text),
  ('KEEP AGRI-ENTERPRISE RECORDS', 'keep-agri-enterprise-records', NULL::text),
  ('MAINTAIN PRODUCT AND SERVICE QUALITY', 'maintain-product-and-service-quality', NULL::text),
  ('MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES', 'market-agri-enterprise-products-and-services', NULL::text),
  ('OPERATE AGRI-ENTERPRISE', 'operate-agri-enterprise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP AGRI-ENTERPRISE BUSINESS PLAN', 'develop-agri-enterprise-business-plan', NULL::text),
  ('MARKET AGRICULTURAL PRODUCTS/SERVICES', 'market-agricultural-products-services', NULL::text),
  ('MARKET AGRICULTURAL PRODUCTS/SERVICES ONLINE', 'market-agricultural-products-services-online', NULL::text),
  ('OPERATE A SMALL AGRI-ENTERPRISE', 'operate-a-small-agri-enterprise', NULL::text),
  ('SUPERVISE AGRIPRENEURAL OPERATIONS', 'supervise-agripreneural-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-4';

-- ------------------------------------------------------------------------------
-- Course: ANIMAL PRODUCTION TECHNOLOGY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ESTABLISH FARM STRUCTURES', 'establish-farm-structures', NULL::text),
  ('MANAGE BEEF ANIMALS', 'manage-beef-animals', NULL::text),
  ('MANAGE DAIRY CATTLE', 'manage-dairy-cattle', NULL::text),
  ('PRODUCE LIVESTOCK FEEDS', 'produce-livestock-feeds', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT GOAT PRODUCTION', 'carry-out-goat-production', NULL::text),
  ('CARRY OUT PIG PRODUCTION', 'carry-out-pig-production', NULL::text),
  ('CARRY OUT POULTRY PRODUCTION', 'carry-out-poultry-production', NULL::text),
  ('CARRY OUT SHEEP PRODUCTION', 'carry-out-sheep-production', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'animal-production-technology-level-4';

-- ------------------------------------------------------------------------------
-- Course: APIARY ATTENDANCE LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'apiary-attendance-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BEE BEHAVIOR IN HANDLING BEES', 'apply-bee-behavior-in-handling-bees', NULL::text),
  ('APPLY BEE BIOLOGY KNOWLEDGE', 'apply-bee-biology-knowledge', NULL::text),
  ('CARRY OUT APIARY ESTABLISHMENT', 'carry-out-apiary-establishment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'apiary-attendance-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'apiary-attendance-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY SAFETY AND HYGIENE', 'apply-safety-and-hygiene', NULL::text),
  ('HARVEST BEE PRODUCTS', 'harvest-bee-products', NULL::text),
  ('MANAGE APIARY', 'manage-apiary', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'apiary-attendance-level-4';

-- ------------------------------------------------------------------------------
-- Course: AQUACULTURE LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM AQUACULTURE HOUSING ACTIVITIES', 'perform-aquaculture-housing-activities', NULL::text),
  ('PRODUCE OF TABLE SIZE FISH', 'produce-of-table-size-fish', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OPERATE FISH HATCHERY', 'operate-fish-hatchery', NULL::text),
  ('PRODUCE FISH FEED', 'produce-fish-feed', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-4';

-- ------------------------------------------------------------------------------
-- Course: BEE PRODUCTS PROCESSING LEVEL 4 (9 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('HARVEST BEE PRODUCTS', 'harvest-bee-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROCESS HONEY', 'process-honey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PROCESS BEE WAX', 'process-bee-wax', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('PROCESS PROPOLIS', 'process-propolis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('PROCESS POLLEN', 'process-pollen', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('PROCESS BEE VENOM', 'process-bee-venom', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('PERFORM BEE PRODUCT VALUE ADDITION', 'perform-bee-product-value-addition', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';

-- Module 8: Module 8
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 8, 'Module 8'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 8
JOIN (VALUES
  ('MANAGE QUALITY OF BEE PRODUCTS', 'manage-quality-of-bee-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';

-- Module 9: Module 9
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 9, 'Module 9'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 9
JOIN (VALUES
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-products-processing-level-4';

-- ------------------------------------------------------------------------------
-- Course: DAIRY FARM OPERATOR LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FEED DAIRY ANIMALS', 'feed-dairy-animals', NULL::text),
  ('MILK DAIRY ANIMALS', 'milk-dairy-animals', NULL::text),
  ('PRODUCE DAIRY FORAGE', 'produce-dairy-forage', NULL::text),
  ('REAR DAIRY YOUNG STOCK', 'rear-dairy-young-stock', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-operator-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BREED DAIRY ANIMALS', 'breed-dairy-animals', NULL::text),
  ('DEVELOP DAIRY FARM STRUCTURES', 'develop-dairy-farm-structures', NULL::text),
  ('FORMULATE DAIRY FEED', 'formulate-dairy-feed', NULL::text),
  ('MAINTAIN DAIRY HERD HEALTH', 'maintain-dairy-herd-health', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-operator-level-4';

-- ------------------------------------------------------------------------------
-- Course: DAIRY PLANT TECHNOLOGY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('HANDLE RAW MILK', 'handle-raw-milk', NULL::text),
  ('PROCESS FLUID MILK PRODUCTS', 'process-fluid-milk-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technology-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROCESS FAT BASED MILK PRODUCTS', 'process-fat-based-milk-products', NULL::text),
  ('PROCESS FERMENTED MILK PRODUCTS', 'process-fermented-milk-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-technology-level-4';

-- ------------------------------------------------------------------------------
-- Course: FARM MACHINERY AND EQUIPMENT OPERATOR LEVEL 4 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'farm-machinery-and-equipment-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('OPERATE COMPUTERIZED AGRICULTURAL EQUIPMENT', 'operate-computerized-agricultural-equipment', NULL::text),
  ('OPERATE FARM MACHINERY AND EQUIPMENT', 'operate-farm-machinery-and-equipment', NULL::text),
  ('OPERATE FARM TRACTOR', 'operate-farm-tractor', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'farm-machinery-and-equipment-operator-level-4';

-- ------------------------------------------------------------------------------
-- Course: GENERAL AGRICULTURE LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'general-agriculture-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ANNUAL CROPS PRODUCTION', 'annual-crops-production', NULL::text),
  ('FARM MACHINERY OPERATION', 'farm-machinery-operation', NULL::text),
  ('HORTICULTURE CROPS PRODUCTION', 'horticulture-crops-production', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'general-agriculture-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'general-agriculture-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('REARING NONRUMINANT ANIMALS', 'rearing-nonruminant-animals', NULL::text),
  ('REARING RUMINANTS ANIMALS', 'rearing-ruminants-animals', NULL::text),
  ('WATER UTILIZATION', 'water-utilization', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'general-agriculture-level-4';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURE FARM ATTENDANT LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-farm-attendant-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PRODUCE HERBS AND SPICES IN OPEN ENVIRONMENT', 'produce-herbs-and-spices-in-open-environment', NULL::text),
  ('PRODUCE HERBS AND SPICES IN PROTECTED ENVIRONMENT', 'produce-herbs-and-spices-in-protected-environment', NULL::text),
  ('PRODUCE VEGETABLE CROPS IN OPEN ENVIRONMENT', 'produce-vegetable-crops-in-open-environment', NULL::text),
  ('PRODUCE VEGETABLE CROPS IN PROTECTED ENVIRONMENT', 'produce-vegetable-crops-in-protected-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-farm-attendant-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-farm-attendant-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OPERATE FARM IRRIGATION AND DRAINAGE SYSTEM', 'operate-farm-irrigation-and-drainage-system', NULL::text),
  ('OPERATE FARM MACHINERY', 'operate-farm-machinery', NULL::text),
  ('PRODUCE CUT FLOWERS', 'produce-cut-flowers', NULL::text),
  ('PRODUCE TROPICAL FRUITS', 'produce-tropical-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-farm-attendant-level-4';

-- ------------------------------------------------------------------------------
-- Course: LIVESTOCK FEED PRODUCER LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'livestock-feed-producer-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY PRINCIPLES OF LIVESTOCK NUTRITION', 'apply-principles-of-livestock-nutrition', NULL::text),
  ('PRODUCE LIVESTOCK FORAGE', 'produce-livestock-forage', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'livestock-feed-producer-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'livestock-feed-producer-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSERVE FARM WATER', 'conserve-farm-water', NULL::text),
  ('OPERATE FEED PROCESSING EQUIPMENT', 'operate-feed-processing-equipment', NULL::text),
  ('PROCESS ANIMAL FEED', 'process-animal-feed', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'livestock-feed-producer-level-4';

-- ------------------------------------------------------------------------------
-- Course: PIG PRODUCTION OPERATOR LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'pig-production-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT PIG UNIT', 'construct-pig-unit', NULL::text),
  ('PRODUCE PIG FEEDS', 'produce-pig-feeds', NULL::text),
  ('PRODUCE PIG STOCK', 'produce-pig-stock', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'pig-production-operator-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'pig-production-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MARKET PIGS PIG PRODUCTS AND PIG BY- PRODUCTS', 'market-pigs-pig-products-and-pig-by-products', NULL::text),
  ('PROCESS PIG PRODUCTS AND BY-PRODUCTS', 'process-pig-products-and-by-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'pig-production-operator-level-4';

-- ------------------------------------------------------------------------------
-- Course: POULTRY (KIENYEJI CHICKEN) PRODUCTION LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-kienyeji-chicken-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT KIENYEJI CHICKEN STRUCTURES', 'construct-kienyeji-chicken-structures', NULL::text),
  ('MANAGE KIENYEJI CHICKEN BREEDING FLOCK', 'manage-kienyeji-chicken-breeding-flock', NULL::text),
  ('MANAGE KIENYEJI CHICKEN HEALTH AND WELFARE', 'manage-kienyeji-chicken-health-and-welfare', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-kienyeji-chicken-production-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-kienyeji-chicken-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE ARTIFICIAL CHICK BROODING', 'manage-artificial-chick-brooding', NULL::text),
  ('MANAGE ARTIFICIAL INCUBATION', 'manage-artificial-incubation', NULL::text),
  ('MANAGE BROODY HEN', 'manage-broody-hen', NULL::text),
  ('MANAGE KIENYEJI CHICKEN GROWERS', 'manage-kienyeji-chicken-growers', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-kienyeji-chicken-production-level-4';

-- ------------------------------------------------------------------------------
-- Course: POULTRY (LAYER PRODUCTION) OPERATOR LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-layer-production-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT POULTRY STRUCTURES', 'construct-poultry-structures', NULL::text),
  ('MANAGE POULTRY BROODING', 'manage-poultry-brooding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-layer-production-operator-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-layer-production-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('MANAGE LAYING POULTRY', 'manage-laying-poultry', NULL::text),
  ('MANAGE POULTRY GROWERS', 'manage-poultry-growers', NULL::text),
  ('MANAGE POULTRY HEALTH AND WELFARE', 'manage-poultry-health-and-welfare', NULL::text),
  ('PRODUCE POULTRY FEEDS', 'produce-poultry-feeds', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-layer-production-operator-level-4';

-- ------------------------------------------------------------------------------
-- Course: POULTRY BROILER PRODUCTION LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-broiler-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT POULTRY STRUCTURES', 'construct-poultry-structures', NULL::text),
  ('MANAGE POULTRY BROODING', 'manage-poultry-brooding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-broiler-production-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-broiler-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRY TRAINING', 'industry-training', NULL::text),
  ('MANAGE BROILER FINISHERS', 'manage-broiler-finishers', NULL::text),
  ('MANAGE POULTRY HEALTH AND WELFARE', 'manage-poultry-health-and-welfare', NULL::text),
  ('PRODUCE BROILER FEED', 'produce-broiler-feed', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-broiler-production-level-4';

-- ------------------------------------------------------------------------------
-- Course: POULTRY HATCHERY OPERATOR LEVEL 4 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-hatchery-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('HANDLE EGGS FOR HATCHING', 'handle-eggs-for-hatching', NULL::text),
  ('HANDLE HATCHED CHICKS', 'handle-hatched-chicks', NULL::text),
  ('HATCH POULTRY EGGS', 'hatch-poultry-eggs', NULL::text),
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-hatchery-operator-level-4';

-- ------------------------------------------------------------------------------
-- Course: AGRIPRENEURSHIP LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ESTABLISH AGRI-ENTERPRISE', 'establish-agri-enterprise', NULL::text),
  ('KEEP AGRI-ENTERPRISE RECORDS', 'keep-agri-enterprise-records', NULL::text),
  ('MAINTAIN PRODUCT AND SERVICE QUALITY', 'maintain-product-and-service-quality', NULL::text),
  ('MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES', 'market-agri-enterprise-products-and-services', NULL::text),
  ('OPERATE AGRI-ENTERPRISE', 'operate-agri-enterprise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-3';

-- ------------------------------------------------------------------------------
-- Course: AQUACULTURE LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM AQUACULTURE HOUSING ACTIVITIES', 'perform-aquaculture-housing-activities', NULL::text),
  ('PRODUCE TABLE SIZE FISH', 'produce-table-size-fish', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-level-3';

-- ------------------------------------------------------------------------------
-- Course: BEE HIVES AND BEE EQUIPMENT CONSTRUCTION LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-hives-and-bee-equipment-construction-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT BEE HIVES AND BEE EQUIPMENT', 'construct-bee-hives-and-bee-equipment', NULL::text),
  ('FABRICATE BEE EQUIPMENT ACCESSORIES', 'fabricate-bee-equipment-accessories', NULL::text),
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'bee-hives-and-bee-equipment-construction-level-3';

-- ------------------------------------------------------------------------------
-- Course: DAIRY FARM ATTENDANCE LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-attendance-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FEED DAIRY ANIMALS', 'feed-dairy-animals', NULL::text),
  ('MILK DAIRY ANIMALS', 'milk-dairy-animals', NULL::text),
  ('PRODUCE DAIRY FORAGE', 'produce-dairy-forage', NULL::text),
  ('REAR DAIRY YOUNG STOCK', 'rear-dairy-young-stock', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-attendance-level-3';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURE LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PRODUCE HERBS AND SPICES IN OPEN ENVIRONMENT', 'produce-herbs-and-spices-in-open-environment', NULL::text),
  ('PRODUCE HERBS AND SPICES IN PROTECTED ENVIRONMENT', 'produce-herbs-and-spices-in-protected-environment', NULL::text),
  ('PRODUCE VEGETABLE CROPS IN OPEN ENVIRONMENT', 'produce-vegetable-crops-in-open-environment', NULL::text),
  ('PRODUCE VEGETABLE CROPS IN PROTECTED ENVIRONMENT', 'produce-vegetable-crops-in-protected-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-level-3';

-- ------------------------------------------------------------------------------
-- Course: PASSION FRUIT PRODUCER AND PROCESSOR LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'passion-fruit-producer-and-processor-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRY TRAINING', 'industry-training', NULL::text),
  ('MARKET PASSION FRUIT PRODUCTS AND SERVICES', 'market-passion-fruit-products-and-services', NULL::text),
  ('OPERATE PASSION FRUIT ORCHARD', 'operate-passion-fruit-orchard', NULL::text),
  ('PROCESS PASSION FRUITS', 'process-passion-fruits', NULL::text),
  ('PRODUCE PASSION FRUIT SEEDLINGS', 'produce-passion-fruit-seedlings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'passion-fruit-producer-and-processor-level-3';

-- ------------------------------------------------------------------------------
-- Course: PIG PRODUCTION OPERATOR LEVEL 3 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'pig-production-operator-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT PIG UNIT', 'construct-pig-unit', NULL::text),
  ('PRODUCE PIG FEEDS', 'produce-pig-feeds', NULL::text),
  ('PRODUCE PIG STOCK', 'produce-pig-stock', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'pig-production-operator-level-3';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'pig-production-operator-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MARKET PIGS PIG PRODUCTS AND PIG BY- PRODUCTS', 'market-pigs-pig-products-and-pig-by-products', NULL::text),
  ('PROCESS PIG PRODUCTS AND BY-PRODUCTS', 'process-pig-products-and-by-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'pig-production-operator-level-3';

-- ------------------------------------------------------------------------------
-- Course: POULTRY (BROILER) PRODUCTION OPERATOR LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-broiler-production-operator-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT POULTRY STRUCTURES', 'construct-poultry-structures', NULL::text),
  ('MANAGE BROILER CHICK BROODING', 'manage-broiler-chick-brooding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-broiler-production-operator-level-3';

-- ------------------------------------------------------------------------------
-- Course: POULTRY (KIENYEJI CHICKEN) PRODUCTION OPERATOR LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-kienyeji-chicken-production-operator-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT KIENYEJI CHICKEN STRUCTURES', 'construct-kienyeji-chicken-structures', NULL::text),
  ('MANAGE KIENYEJI CHICKEN BREEDING FLOCK', 'manage-kienyeji-chicken-breeding-flock', NULL::text),
  ('MANAGE KIENYEJI CHICKEN HEALTH AND WELFARE', 'manage-kienyeji-chicken-health-and-welfare', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-kienyeji-chicken-production-operator-level-3';

-- ------------------------------------------------------------------------------
-- Course: POULTRY (LAYER) PRODUCTION OPERATOR LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-layer-production-operator-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT POULTRY STRUCTURES', 'construct-poultry-structures', NULL::text),
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('MANAGE POULTRY BROODING', 'manage-poultry-brooding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-layer-production-operator-level-3';

-- ------------------------------------------------------------------------------
-- Course: POULTRY LAYER PRODUCTION OPERATOR LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-layer-production-operator-level-3-2';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('LAYER CHICK BROODING MANAGEMENT', 'layer-chick-brooding-management', NULL::text),
  ('POULTRY STRUCTURES CONSTRUCTION', 'poultry-structures-construction', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'poultry-layer-production-operator-level-3-2';


-- ==============================================================================
-- SEED SCRIPT FOR: APPLIED SCIENCE DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 9 | Total Units: 179
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: APPLIED SCIENCE DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'APPLIED SCIENCE DEPARTMENT', 'applied-science-department', 'Accredited TVET CDACC Applied Science modular courses in Analytical Chemistry, Applied Biology, Statistics, Biomedical Engineering, Industrial Chemistry, and Science Laboratory Technology.', 2
FROM programmes WHERE slug = 'modular-cdacc-courses-cycle-3'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & modules/units under this department
-- Cascades automatically to modules and units for a completely clean sync.
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department'
);

-- 4. Insert Courses under APPLIED SCIENCE DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ANALYTICAL CHEMISTRY TECHNICIAN LEVEL 6', 'analytical-chemistry-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'APPLIED BIOLOGY TECHNICIAN LEVEL 6', 'applied-biology-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'APPLIED STATISTICIAN LEVEL 6', 'applied-statistician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BIOMEDICAL ENGINEERING TECHNOLOGIST LEVEL 6', 'biomedical-engineering-technologist-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL CHEMISTRY TECHNOLOGY LEVEL 6', 'industrial-chemistry-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SCIENCE LABORATORY TECHNOLOGY LEVEL 6', 'science-laboratory-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BIOMEDICAL ENGINEERING TECHNICIAN LEVEL 5', 'biomedical-engineering-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ENVIRONMENTAL TECHNICIAN LEVEL 5', 'environmental-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SCIENCE LABORATORY TECHNOLOGY LEVEL 5', 'science-laboratory-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ANALYTICAL CHEMISTRY TECHNICIAN LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM CHEMICAL SEPARATION', 'perform-chemical-separation', NULL::text),
  ('PREPARE CHEMICAL SAMPLES', 'prepare-chemical-samples', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('APPLY ORGANIC CHEMISTRY PRINCIPLES', 'apply-organic-chemistry-principles', NULL::text),
  ('PERFORM BIOCHEMICAL ANALYSIS', 'perform-biochemical-analysis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY INORGANIC CHEMISTRY PRINCIPLES', 'apply-inorganic-chemistry-principles', NULL::text),
  ('PERFORM CLASSICAL ANALYSIS TECHNIQUES', 'perform-classical-analysis-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY PHYSICS PRINCIPLES', 'apply-physics-principles', NULL::text),
  ('PERFORM INSTRUMENTAL ANALYSIS', 'perform-instrumental-analysis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY PHYSICAL CHEMISTRY PRINCIPLES', 'apply-physical-chemistry-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM INDUSTRIAL CHEMISTRY ANALYSIS', 'perform-industrial-chemistry-analysis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('PERFORM QUALITY ASSURANCE AND CONTROL', 'perform-quality-assurance-and-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: APPLIED BIOLOGY TECHNICIAN LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY LABORATORY PRACTICE PRINCIPLES', 'apply-laboratory-practice-principles', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('CONDUCT HISTOLOGICAL AND CYTOLOGICAL TECHNIQUES', 'conduct-histological-and-cytological-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ANIMAL ANATOMY AND PHYSIOLOGY CONCEPTS', 'apply-animal-anatomy-and-physiology-concepts', NULL::text),
  ('CARRY OUT LABORATORY ANIMAL HUSBANDRY', 'carry-out-laboratory-animal-husbandry', NULL::text),
  ('CARRY OUT PLANT HUSBANDRY', 'carry-out-plant-husbandry', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY TAXONOMICAL CONCEPTS', 'apply-taxonomical-concepts', NULL::text),
  ('PERFORM ECOLOGICAL TECHNIQUES', 'perform-ecological-techniques', NULL::text),
  ('PERFORM MUSEUM HERBARIUM AQUARIUM AND VIVARIUM TECHNIQUES', 'perform-museum-herbarium-aquarium-and-vivarium-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM IMMUNOLOGICAL TECHNIQUES', 'perform-immunological-techniques', NULL::text),
  ('PERFORM MICROBIOLOGICAL TECHNIQUES', 'perform-microbiological-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT SCIENTIFIC RESEARCH', 'conduct-scientific-research', NULL::text),
  ('PERFORM PARASITOLOGICAL AND ENTOMOLOGICAL TECHNIQUES', 'perform-parasitological-and-entomological-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY GENETICS PRINCIPLES', 'apply-genetics-principles', NULL::text),
  ('CONDUCT BIOCHEMICAL ANALYSIS', 'conduct-biochemical-analysis', NULL::text),
  ('PERFORM PHARMACOLOGICAL AND TOXICOLOGICAL TECHNIQUES', 'perform-pharmacological-and-toxicological-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: APPLIED STATISTICIAN LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('COLLECT AND MANAGE DATA', 'collect-and-manage-data', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('DEVELOP RESEARCH CONCEPTS', 'develop-research-concepts', NULL::text),
  ('PERFORM DESCRIPTIVE DATA ANALYSIS AND PRESENTATION I', 'perform-descriptive-data-analysis-and-presentation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY STATISTICAL TECHNIQUES', 'apply-statistical-techniques', NULL::text),
  ('PERFORM INFERENTIAL DATA ANALYSIS AND PRESENTATION II', 'perform-inferential-data-analysis-and-presentation-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('DESIGN RESEARCH EXPERIMENTS', 'design-research-experiments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('MANAGE STATISTICAL DATA', 'manage-statistical-data', NULL::text),
  ('PERFORM INFERENTIAL DATA ANALYSIS AND PRESENTATION', 'perform-inferential-data-analysis-and-presentation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('CONDUCT RELIABILITY AND VALIDITY OF DATA', 'conduct-reliability-and-validity-of-data', NULL::text),
  ('DEVELOP DATABASE MANAGEMENT SYSTEMS', 'develop-database-management-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- ------------------------------------------------------------------------------
-- Course: BIOMEDICAL ENGINEERING TECHNOLOGIST LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS I', 'apply-engineering-technician-mathematics-i', NULL::text),
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY PRINCIPLES', 'apply-human-anatomy-and-physiology-principles', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM REFRIGERATION AND AIR CONDITIONING EQUIPMENT INSTALLATION AND MAINTENANCE', 'perform-refrigeration-and-air-conditioning-equipment-installation-and-maintenance', NULL::text),
  ('PERFORM WORKSHOP PRACTICE', 'perform-workshop-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES I', 'apply-electrical-principles-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS II', 'apply-engineering-technician-mathematics-ii', NULL::text),
  ('PERFORM DENTAL EQUIPMENT MAINTENANCE', 'perform-dental-equipment-maintenance', NULL::text),
  ('PERFORM HOSPITAL PLANT AND BUILDING SERVICES EQUIPMENT MAINTENANCE I', 'perform-hospital-plant-and-building-services-equipment-maintenance-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES II', 'apply-electrical-principles-ii', NULL::text),
  ('PERFORM HOSPITAL PLANT AND BUILDING SERVICES EQUIPMENT MAINTENANCE II', 'perform-hospital-plant-and-building-services-equipment-maintenance-ii', NULL::text),
  ('PERFORM MATERNITY EQUIPMENT MAINTENANCE', 'perform-maternity-equipment-maintenance', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS I', 'prepare-technical-drawings-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES III', 'apply-electrical-principles-iii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM DIAGNOSTIC AND LABORATORY EQUIPMENT MAINTENANCE I', 'perform-diagnostic-and-laboratory-equipment-maintenance-i', NULL::text),
  ('PERFORM OPERATION THEATRE EQUIPMENT MAINTENANCE', 'perform-operation-theatre-equipment-maintenance', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS II', 'prepare-technical-drawings-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES IV', 'apply-electrical-principles-iv', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS III', 'apply-engineering-technician-mathematics-iii', NULL::text),
  ('APPLY MEASUREMENTS AND CONTROL SYSTEMS', 'apply-measurements-and-control-systems', NULL::text),
  ('PERFORM DIAGNOSTIC AND LABORATORY EQUIPMENT MAINTENANCE II', 'perform-diagnostic-and-laboratory-equipment-maintenance-ii', NULL::text),
  ('PERFORM OPHTHALMIC AND ENT EQUIPMENT MAINTENANCE', 'perform-ophthalmic-and-ent-equipment-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY DIGITAL ELECTRONICS', 'apply-digital-electronics', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS IV', 'apply-engineering-technician-mathematics-iv', NULL::text),
  ('APPLY MICROCONTROLLERS AND MICROPROCESSORS I', 'apply-microcontrollers-and-microprocessors-i', NULL::text),
  ('PERFORM ICU AND RENAL EQUIPMENT MAINTENANCE', 'perform-icu-and-renal-equipment-maintenance', NULL::text),
  ('PERFORM RADIOLOGY AND IMAGING EQUIPMENT MAINTENANCE', 'perform-radiology-and-imaging-equipment-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY HOSPITAL ORGANIZATION AND MAINTENANCE PRINCIPLES', 'apply-hospital-organization-and-maintenance-principles', NULL::text),
  ('APPLY MICROCONTROLLERS AND MICROPROCESSORS II', 'apply-microcontrollers-and-microprocessors-ii', NULL::text),
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('PERFORM PHYSIOTHERAPY AND ORTHOPAEDIC EQUIPMENT MAINTENANCE', 'perform-physiotherapy-and-orthopaedic-equipment-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL CHEMISTRY TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE CONCEPTS', 'apply-mechanical-science-concepts', NULL::text),
  ('PERFORM UNIT OPERATIONS', 'perform-unit-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL SCIENCE CONCEPTS', 'apply-electrical-science-concepts', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('OPERATE ANALYTICAL EQUIPMENT', 'operate-analytical-equipment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY CHEMICAL SCIENCE CONCEPTS', 'apply-chemical-science-concepts', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('CARRY OUT MATERIAL ANALYSIS', 'carry-out-material-analysis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM PRODUCTION QUALITY CONTROL', 'perform-production-quality-control', NULL::text),
  ('PROCESS INDUSTRIAL PRODUCTS', 'process-industrial-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY LABORATORY SAFETY AND MANAGEMENT PRACTICES', 'apply-laboratory-safety-and-management-practices', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MANAGE INDUSTRIAL WASTES', 'manage-industrial-wastes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CONDUCT SCIENTIFIC RESEARCH', 'conduct-scientific-research', NULL::text),
  ('PERFORM PROCESS CONTROL AND OPTIMIZATION', 'perform-process-control-and-optimization', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: SCIENCE LABORATORY TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY GENERAL SCIENCE PRINCIPLES', 'apply-general-science-principles', NULL::text),
  ('PERFORM BIOLOGY TECHNIQUES', 'perform-biology-techniques', NULL::text),
  ('PERFORM STANDARD LABORATORY PRACTICES', 'perform-standard-laboratory-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('MAINTAIN LABORATORY EQUIPMENT', 'maintain-laboratory-equipment', NULL::text),
  ('PERFORM CHEMISTRY TECHNIQUES', 'perform-chemistry-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT SCIENCE LABORATORY RESEARCH', 'conduct-science-laboratory-research', NULL::text),
  ('PERFORM PHYSICS TECHNIQUES', 'perform-physics-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY CHEMISTRY PRINCIPLES', 'apply-chemistry-principles', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science-module-4', 'apply-mathematics-for-science'),
  ('PERFORM AQUARIUM VIVARIUM AND HERBARIUM TECHNIQUES', 'perform-aquarium-vivarium-and-herbarium-techniques', NULL::text),
  ('PERFORM CHEMICAL ANALYSES', 'perform-chemical-analyses', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY LABORATORY AND MANAGEMENT PRACTICES', 'apply-laboratory-and-management-practices', NULL::text),
  ('APPLY PHYSICS PRINCIPLES', 'apply-physics-principles', NULL::text),
  ('CARRY OUT CYTO-HISTOLOGICAL AND IMMUNOLOGICAL TECHNIQUES', 'carry-out-cyto-histological-and-immunological-techniques', NULL::text),
  ('TEST MATERIAL PROPERTIES', 'test-material-properties', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY BIOLOGY PRINCIPLES', 'apply-biology-principles', NULL::text),
  ('CONDUCT MICROBIOLOGICAL TESTS', 'conduct-microbiological-tests', NULL::text),
  ('MEASURE PHYSICAL QUANTITIES', 'measure-physical-quantities', NULL::text),
  ('PERFORM CHEMISTRY INSTRUMENTATION TECHNOIQUES', 'perform-chemistry-instrumentation-technoiques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: BIOMEDICAL ENGINEERING TECHNICIAN LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS I', 'apply-engineering-technician-mathematics-i', NULL::text),
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY PRINCIPLES', 'apply-human-anatomy-and-physiology-principles', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM REFRIGERATION AND AIR CONDITIONING EQUIPMENT MAINTENANCE', 'perform-refrigeration-and-air-conditioning-equipment-maintenance', NULL::text),
  ('PERFORM WORKSHOP PRACTICE', 'perform-workshop-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES I', 'apply-electrical-principles-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS II', 'apply-engineering-technician-mathematics-ii', NULL::text),
  ('PERFORM DENTAL EQUIPMENT MAINTENANCE', 'perform-dental-equipment-maintenance', NULL::text),
  ('PERFORM HOSPITAL PLANT AND BUILDING SERVICES EQUIPMENT MAINTENANCE I', 'perform-hospital-plant-and-building-services-equipment-maintenance-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES II', 'apply-electrical-principles-ii', NULL::text),
  ('PERFORM HOSPITAL PLANT AND BUILDING SERVICES EQUIPMENT MAINTENANCE II', 'perform-hospital-plant-and-building-services-equipment-maintenance-ii', NULL::text),
  ('PERFORM MATERNITY EQUIPMENT MAINTENANCE', 'perform-maternity-equipment-maintenance', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS I', 'prepare-technical-drawings-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES III', 'apply-electrical-principles-iii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM DIAGNOSTIC AND LABORATORY EQUIPMENT MAINTENANCE I', 'perform-diagnostic-and-laboratory-equipment-maintenance-i', NULL::text),
  ('PERFORM OPERATION THEATRE EQUIPMENT MAINTENANCE', 'perform-operation-theatre-equipment-maintenance', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS II', 'prepare-technical-drawings-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: ENVIRONMENTAL TECHNICIAN LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ORGANIC AND INORGANIC CHEMISTRY', 'apply-organic-and-inorganic-chemistry', NULL::text),
  ('MONITOR ENVIRONMENTAL POLLUTION', 'monitor-environmental-pollution', NULL::text),
  ('PERFORM ENVIRONMENTAL WASTE MANAGEMENT', 'perform-environmental-waste-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY NATURAL RESOURCE ECONOMICS', 'apply-natural-resource-economics', NULL::text),
  ('MAINTAIN ENVIRONMENTAL ECOLOGY', 'maintain-environmental-ecology', NULL::text),
  ('MONITOR CLIMATE CHANGE', 'monitor-climate-change', NULL::text),
  ('PERFORM ENVIRONMENTAL HEALTH AND SAFETY PRACTICES', 'perform-environmental-health-and-safety-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC ENVIRONMENTAL PRINCIPLES', 'apply-basic-environmental-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MONITOR NATURAL RESOURCES', 'monitor-natural-resources', NULL::text),
  ('PERFORM LABORATORY TECHNIQUES', 'perform-laboratory-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: SCIENCE LABORATORY TECHNOLOGY LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY GENERAL SCIENCE PRINCIPLES', 'apply-general-science-principles', NULL::text),
  ('PERFORM BIOLOGY TECHNIQUES', 'perform-biology-techniques', NULL::text),
  ('PERFORM STANDARD LABORATORY PRACTICES', 'perform-standard-laboratory-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS FOR SCIENCE', 'apply-basic-mathematics-for-science', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('MAINTAIN LABORATORY EQUIPMENT', 'maintain-laboratory-equipment', NULL::text),
  ('PERFORM CHEMISTRY TECHNIQUES', 'perform-chemistry-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT SCIENCE LABORATORY RESEARCH', 'conduct-science-laboratory-research', NULL::text),
  ('PERFORM PHYSICS TECHNIQUES', 'perform-physics-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';


-- ==============================================================================
-- SEED SCRIPT FOR: BUILDING AND CIVIL ENGINEERING DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 20 | Total Units: 257
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: BUILDING AND CIVIL ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUILDING AND CIVIL ENGINEERING DEPARTMENT', 'building-and-civil-engineering-department', 'Accredited TVET CDACC Building and Civil Engineering modular courses in Architecture, Civil Engineering, Building Technology, Cartography & GIS, Land Survey, Plumbing, Masonry, and Carpentry.', 3
FROM programmes WHERE slug = 'modular-cdacc-courses-cycle-3'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & modules/units under this department
-- Cascades automatically to modules and units for a completely clean sync.
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department'
);

-- 4. Insert Courses under BUILDING AND CIVIL ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARCHITECTURE LEVEL 6', 'architecture-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING TECHNCIAN LEVEL 6', 'building-techncian-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARTOGRAPHY AND GIS TECHNOLOGY LEVEL 6', 'cartography-and-gis-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CIVIL ENGINEERING LEVEL 6', 'civil-engineering-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LAND SURVEY LEVEL 6', 'land-survey-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING TECHNOLOGY LEVEL 5', 'building-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTRY AND JOINERY LEVEL 5', 'carpentry-and-joinery-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LAND SURVEY LEVEL 5', 'land-survey-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 5', 'plumbing-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ROAD CONSTRUCTION LEVEL 5', 'road-construction-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTRY AND JOINERY LEVEL 4', 'carpentry-and-joinery-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MASONRY LEVEL 4', 'masonry-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 4', 'plumbing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'RIGGING LEVEL 4', 'rigging-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTERY AND JOINERY LEVEL 3', 'carpentery-and-joinery-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GYPSUM INSTALLATION LEVEL 3', 'gypsum-installation-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MASONRY LEVEL 3', 'masonry-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 3', 'plumbing-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'RIGGER LEVEL 3', 'rigger-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TILE FIXER LEVEL 3', 'tile-fixer-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ARCHITECTURE LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ART AND ARCHITECTURAL LANGUAGE PRINCIPLES', 'apply-art-and-architectural-language-principles', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY TECHNICAL DRAWING TECHNIQUES', 'apply-technical-drawing-techniques', NULL::text),
  ('PRODUCE PHYSICAL ARCHITECTURAL MODEL', 'produce-physical-architectural-model', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMPUTER-AIDED DESIGN DRAWING TECHNIQUES', 'apply-computer-aided-design-drawing-techniques', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY MATHEMATICS FOR ARCHITECTS I', 'apply-mathematics-for-architects-i', NULL::text),
  ('PRODUCE DIGITAL ARCHITECTURAL MODEL', 'produce-digital-architectural-model', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENGINEERING SURVEY PRINCIPLES', 'apply-engineering-survey-principles', NULL::text),
  ('APPLY HISTORY OF ARCHITECTURE CONCEPTS', 'apply-history-of-architecture-concepts', NULL::text),
  ('APPLY MATHEMATICS FOR ARCHITECTS II', 'apply-mathematics-for-architects-ii', NULL::text),
  ('CARRY OUT ARCHITECTURAL LANDSCAPING', 'carry-out-architectural-landscaping', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY CONSTRUCTION MATERIALS PRINCIPLES', 'apply-construction-materials-principles', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES', 'apply-structural-analysis-principles', NULL::text),
  ('DESIGN ARCHITECTURAL INTERIORS', 'design-architectural-interiors', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY BUILDING CONSTRUCTION TECHNOLOGY PRINCIPLES', 'apply-building-construction-technology-principles', NULL::text),
  ('MANAGE CONSTRUCTION PROJECT', 'manage-construction-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('BUILDING WORKS MEASUREMENTS PRINCIPLES', 'building-works-measurements-principles', NULL::text),
  ('DESIGN ARCHITECHTURAL PROJECT', 'design-architechtural-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUILDING TECHNCIAN LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM MASONRY WORKS', 'perform-masonry-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES I', 'perform-masonry-works-finishes-i', NULL::text),
  ('PRODUCE MASONRY PRODUCTS', 'produce-masonry-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM BUILDING SITE PRELIMINARY WORKS I', 'perform-building-site-preliminary-works-i', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS I', 'apply-basic-mathematics-i', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('EXECUTE EXTERNAL WORKS', 'execute-external-works', NULL::text),
  ('INSTALL DOORS AND WINDOWS', 'install-doors-and-windows', NULL::text),
  ('PERFORM BUILDING SUBSTRUCTURE WORKS', 'perform-building-substructure-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS II', 'apply-basic-mathematics-ii', NULL::text),
  ('APPLY CONSTRUCTION MATERIAL SCIENCE', 'apply-construction-material-science', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM BUILDING SUPERSTRUCTURE WORKS', 'perform-building-superstructure-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES II', 'perform-masonry-works-finishes-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES I', 'apply-structural-analysis-principles-i', NULL::text),
  ('CARRY OUT ROOF CONSTRUCTION WORK', 'carry-out-roof-construction-work', NULL::text),
  ('PERFORM BUILDING SITE PRELIMINARY WORKS II', 'perform-building-site-preliminary-works-ii', NULL::text),
  ('PERFORM BUILDING SUPER STRUCTURE WORKS II', 'perform-building-super-structure-works-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENGINEERING SURVEY PRINCIPLES I', 'apply-engineering-survey-principles-i', NULL::text),
  ('APPLY MEASUREMENT ESTIMATION AND COSTING OF WORKS I', 'apply-measurement-estimation-and-costing-of-works-i', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES II', 'apply-structural-analysis-principles-ii', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('CARRY OUT BUILDING FINISHES III', 'carry-out-building-finishes-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY ENGINEERING SURVEY PRINCIPLES II', 'apply-engineering-survey-principles-ii', NULL::text),
  ('APPLY MEASUREMENT ESTIMATION AND COSTING OF WORKS II', 'apply-measurement-estimation-and-costing-of-works-ii', NULL::text),
  ('MANAGE BUILDING CONSTRUCTION WORKS', 'manage-building-construction-works', NULL::text),
  ('PREPARE BUILDING DRAWING', 'prepare-building-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- ------------------------------------------------------------------------------
-- Course: CARTOGRAPHY AND GIS TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS I', 'apply-engineering-mathematics-i', NULL::text),
  ('APPLY LAND SURVEYING TECHNIQUES', 'apply-land-surveying-techniques', NULL::text),
  ('APPLY MAP PROJECTION PRINCIPLES', 'apply-map-projection-principles', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY GIS PRINCIPLES', 'apply-gis-principles', NULL::text),
  ('PRODUCE TOPOGRAPHICAL MAPS', 'produce-topographical-maps', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY PRINCIPLES OF REMOTE SENSING', 'apply-principles-of-remote-sensing', NULL::text),
  ('PRODUCE THEMATIC MAPS', 'produce-thematic-maps', NULL::text),
  ('PRODUCE TOPO-CADASTRAL MAPS I', 'produce-topo-cadastral-maps-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS II', 'apply-engineering-mathematics-ii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PRODUCE TOPO-CADASTRAL MAPS II', 'produce-topo-cadastral-maps-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CONDUCT ENGINEERING SURVEY I', 'conduct-engineering-survey-i', NULL::text),
  ('PRODUCE CARTOGRAPHIC CHARTS', 'produce-cartographic-charts', NULL::text),
  ('PRODUCE RELIEF MAPS', 'produce-relief-maps', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY MAP REPRODUCTION TECHNIQUES', 'apply-map-reproduction-techniques', NULL::text),
  ('CONDUCT CONTROL SURVEY', 'conduct-control-survey', NULL::text),
  ('CONDUCT ENGINEERING SURVEY II', 'conduct-engineering-survey-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: CIVIL ENGINEERING LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY CONSTRUCTION MATERIALS SCIENCE I', 'apply-construction-materials-science-i', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CARRY OUT CIVIL ENGINEERING WORKS I', 'carry-out-civil-engineering-works-i', NULL::text),
  ('CARRY OUT SITE SURVEY', 'carry-out-site-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY CONSTRUCTION MATERIALS SCIENCE II', 'apply-construction-materials-science-ii', NULL::text),
  ('APPLY MATHEMATICAL PRINCIPLES', 'apply-mathematical-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('CARRY OUT ROAD CONSTRUCTION WORKS I', 'carry-out-road-construction-works-i', NULL::text),
  ('PREPARE FOR MATERIALS TESTING', 'prepare-for-materials-testing', NULL::text),
  ('PREPARE TECHNICAL DRAWING', 'prepare-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ALGEBRA AND GEOMETRY', 'apply-algebra-and-geometry', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES I', 'apply-structural-analysis-principles-i', NULL::text),
  ('CARRY OUT ENGINEERING SURVEY I', 'carry-out-engineering-survey-i', NULL::text),
  ('CARRY OUT ROAD CONSTRUCTION WORKS II', 'carry-out-road-construction-works-ii', NULL::text),
  ('CONDUCT MATERIAL TESTING I', 'conduct-material-testing-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY MEASUREMENTS ESTIMATION AND COSTING PRINCIPLES I', 'apply-measurements-estimation-and-costing-principles-i', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES II', 'apply-structural-analysis-principles-ii', NULL::text),
  ('APPLY TRIGONOMETRY AND COMPLEX NUMBERS', 'apply-trigonometry-and-complex-numbers', NULL::text),
  ('CARRY OUT CIVIL ENGINEERING WORKS II', 'carry-out-civil-engineering-works-ii', NULL::text),
  ('CARRY OUT ENGINEERING SURVEY II', 'carry-out-engineering-survey-ii', NULL::text),
  ('DESIGN ROAD STRUCTURES I', 'design-road-structures-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY CALCULUS AND DIFFERENTIAL METHODS', 'apply-calculus-and-differential-methods', NULL::text),
  ('APPLY HYDRAULIC PRINCIPLES', 'apply-hydraulic-principles', NULL::text),
  ('APPLY MEASUREMENTS ESTIMATION AND COSTING PRINCIPLES II', 'apply-measurements-estimation-and-costing-principles-ii', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES III', 'apply-structural-analysis-principles-iii', NULL::text),
  ('DESIGN ROAD STRUCTURES II', 'design-road-structures-ii', NULL::text),
  ('PRODUCE CIVIL ENGINEERING DRAWING I', 'produce-civil-engineering-drawing-i', NULL::text),
  ('PRODUCE CIVIL ENGINEERING DRAWING II', 'produce-civil-engineering-drawing-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY MEASUREMENTS ESTIMATION AND COSTING PRINCIPLES III', 'apply-measurements-estimation-and-costing-principles-iii', NULL::text),
  ('APPLY VECTORS MATRICES AND DATA ANALYSIS', 'apply-vectors-matrices-and-data-analysis', NULL::text),
  ('CONDUCT MATERIAL TESTING II', 'conduct-material-testing-ii', NULL::text),
  ('DESIGN CIVIL ENGINEERING STRUCTURES I', 'design-civil-engineering-structures-i', NULL::text),
  ('DESIGN WATER SUPPLY INFRASTRUCTURE', 'design-water-supply-infrastructure', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('CONDUCT RESEARCH PROJECT I', 'conduct-research-project-i', NULL::text),
  ('DESIGN CIVIL ENGINEERING STRUCTURES II', 'design-civil-engineering-structures-ii', NULL::text),
  ('DESIGN WASTE WATER INFRASTRUCTURE', 'design-waste-water-infrastructure', NULL::text),
  ('SUPERVISE CIVIL ENGINEERING PROJECTS', 'supervise-civil-engineering-projects', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- ------------------------------------------------------------------------------
-- Course: LAND SURVEY LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS I', 'apply-engineering-mathematics-i', NULL::text),
  ('APPLY PRINCIPLES OF CARTOGRAPHY', 'apply-principles-of-cartography', NULL::text),
  ('CONDUCT TOPOGRAPHICAL SURVEY', 'conduct-topographical-survey', NULL::text),
  ('OPERATE SURVEY INSTRUMENTS', 'operate-survey-instruments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS II', 'apply-engineering-mathematics-ii', NULL::text),
  ('CONDUCT CONTROL SURVEY', 'conduct-control-survey', NULL::text),
  ('CONDUCT ENGINEERING SURVEY', 'conduct-engineering-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS III', 'apply-engineering-mathematics-iii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF LAND LAW I', 'apply-principles-of-land-law-i', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT CADASTRAL SURVEY', 'conduct-cadastral-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY PRINCIPLES OF GIS', 'apply-principles-of-gis', NULL::text),
  ('APPLY PRINCIPLES OF LAND LAWS II', 'apply-principles-of-land-laws-ii', NULL::text),
  ('CONDUCT ENGINEERING SURVEY II', 'conduct-engineering-survey-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CONDUCT HYDROGRAPHIC SURVEY', 'conduct-hydrographic-survey', NULL::text),
  ('CONDUCT MINE SURVEY', 'conduct-mine-survey', NULL::text),
  ('CONDUCT PHOTOGRAMMETRIC SURVEY', 'conduct-photogrammetric-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUILDING TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM MASONRY WORKS FINISHES I', 'perform-masonry-works-finishes-i', NULL::text),
  ('PERFORM MASONRY WORKS I', 'perform-masonry-works-i', NULL::text),
  ('PRODUCE MASONRY UNITS', 'produce-masonry-units', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM BUILDING SITE PRELIMINARY WORKS', 'perform-building-site-preliminary-works', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS I', 'apply-basic-mathematics-i', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('EXECUTE EXTERNAL WORKS', 'execute-external-works', NULL::text),
  ('INSTALL DOORS AND WINDOWS', 'install-doors-and-windows', NULL::text),
  ('PERFORM BUILDING SUBSTRUCTURE WORKS', 'perform-building-substructure-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS II', 'apply-basic-mathematics-ii', NULL::text),
  ('APPLY CONSTRUCTION MATERIAL SCIENCE', 'apply-construction-material-science', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM BUILDING SUPERSTRUCTURE WORKS', 'perform-building-superstructure-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES II', 'perform-masonry-works-finishes-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: CARPENTRY AND JOINERY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT CABINETRY WORKS', 'carry-out-cabinetry-works', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS', 'construct-temporary-works', NULL::text),
  ('FIX DOOR AND WINDOW FRAMES', 'fix-door-and-window-frames', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT ROUGH CARPENTRY', 'carry-out-rough-carpentry', NULL::text),
  ('CONSTRUCT CABINETS', 'construct-cabinets', NULL::text),
  ('CONSTRUCT DOORS AND WINDOWS', 'construct-doors-and-windows', NULL::text),
  ('CONSTRUCT TIMBER FLOORS AND FRAMED STRUCTURES', 'construct-timber-floors-and-framed-structures', NULL::text),
  ('CONSTRUCT TIMBER ROOFS', 'construct-timber-roofs', NULL::text),
  ('FABRICATE TIMBER FURNITURE ITEMS', 'fabricate-timber-furniture-items', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CONSTRUCT AND INSTALL UPHOLSTERY FURNITURE', 'construct-and-install-upholstery-furniture', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONSTRUCT TIMBER PREFABRICATED BUILDINGS', 'construct-timber-prefabricated-buildings', NULL::text),
  ('CONSTRUCT TIMBER STAIRS', 'construct-timber-stairs', NULL::text),
  ('INSTALL CEILING UNIT', 'install-ceiling-unit', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- ------------------------------------------------------------------------------
-- Course: LAND SURVEY LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS I', 'apply-engineering-mathematics-i', NULL::text),
  ('APPLY PRINCIPLES OF CARTOGRAPHY', 'apply-principles-of-cartography', NULL::text),
  ('CONDUCT TOPOGRAPHICAL SURVEY', 'conduct-topographical-survey', NULL::text),
  ('OPERATE SURVEY INSTRUMENTS', 'operate-survey-instruments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS II', 'apply-engineering-mathematics-ii', NULL::text),
  ('CONDUCT CONTROL SURVEY', 'conduct-control-survey', NULL::text),
  ('CONDUCT ENGINEERING SURVEY I', 'conduct-engineering-survey-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS III', 'apply-engineering-mathematics-iii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF LAND LAWS I', 'apply-principles-of-land-laws-i', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT CADASTRAL SURVEY', 'conduct-cadastral-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM I', 'install-drainage-system-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES I', 'install-sanitary-appliances-i', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM I', 'install-water-supply-system-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM II', 'install-drainage-system-ii', NULL::text),
  ('INSTALL RAINWATER HARVESTING SYSTEM I', 'install-rainwater-harvesting-system-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES II', 'install-sanitary-appliances-ii', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM II', 'install-water-supply-system-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS PRINCIPLES', 'apply-basic-mathematics-principles', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('INSTALL WATER STORAGE SYSTEM', 'install-water-storage-system', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM III', 'install-water-supply-system-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY CONSTRUCTION MATERIAL SCIENCE', 'apply-construction-material-science', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('DEMONSTRATE WORKSHOP TECHNOLOGY SKILLS', 'demonstrate-workshop-technology-skills', NULL::text),
  ('INSTALL FIRE CONTROL SYSTEMS', 'install-fire-control-systems', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- ------------------------------------------------------------------------------
-- Course: ROAD CONSTRUCTION LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY CONSTRUCTION MATERIAL SCIENCE I', 'apply-construction-material-science-i', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CARRY OUT SITE SURVEY', 'carry-out-site-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY CONSTRUCTION MATERIAL SCIENCE II', 'apply-construction-material-science-ii', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('PREPARE FOR MATERIALS TESTING', 'prepare-for-materials-testing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICAL PRINCIPLES', 'apply-mathematical-principles', NULL::text),
  ('CARRY OUT ROAD CONSTRUCTION WORKS I', 'carry-out-road-construction-works-i', NULL::text),
  ('DEMONSTRATE WORKSHOP TECHNOLOGY SKILLS', 'demonstrate-workshop-technology-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CARRY OUT CIVIL WORKS', 'carry-out-civil-works', NULL::text),
  ('CONDUCT MATERIAL TESTING I', 'conduct-material-testing-i', NULL::text),
  ('EXECUTE ROAD MAINTENANCE WORKS', 'execute-road-maintenance-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';

-- ------------------------------------------------------------------------------
-- Course: CARPENTRY AND JOINERY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT CABINETRY WORKS', 'carry-out-cabinetry-works', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS', 'construct-temporary-works', NULL::text),
  ('FIX DOOR & WINDOW FRAMES', 'fix-door-and-window-frames', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT ROUGH CARPENTRY', 'carry-out-rough-carpentry', NULL::text),
  ('CONSTRUCT CABINETS', 'construct-cabinets', NULL::text),
  ('CONSTRUCT DOORS AND WINDOWS', 'construct-doors-and-windows', NULL::text),
  ('CONSTRUCT TIMBER FLOORS AND FRAMED STRUCTURES', 'construct-timber-floors-and-framed-structures', NULL::text),
  ('FABRICATE TIMBER FURNITURE ITEMS', 'fabricate-timber-furniture-items', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- ------------------------------------------------------------------------------
-- Course: MASONRY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM MASONRY WORKS', 'perform-masonry-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES I', 'perform-masonry-works-finishes-i', NULL::text),
  ('PRODUCE MASONRY PRODUCTS', 'produce-masonry-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM BUILDING SITE PRELIMINARY WORKS I', 'perform-building-site-preliminary-works-i', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM I', 'install-drainage-system-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES I', 'install-sanitary-appliances-i', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM I', 'install-water-supply-system-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEMS II', 'install-drainage-systems-ii', NULL::text),
  ('INSTALL RAINWATER HARVESTING SYSTEM I', 'install-rainwater-harvesting-system-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES II', 'install-sanitary-appliances-ii', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM II', 'install-water-supply-system-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- ------------------------------------------------------------------------------
-- Course: RIGGING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigging-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM PRE- RIGGING ACTIVITIES', 'perform-pre-rigging-activities', NULL::text),
  ('PERFORM RIGGING ACTIVITIES', 'perform-rigging-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigging-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigging-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM RIGGING EQUIPMENT INSPECTION', 'perform-rigging-equipment-inspection', NULL::text),
  ('PERFORM RIGGING EQUIPMENT MAINTENANCE', 'perform-rigging-equipment-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigging-level-4';

-- ------------------------------------------------------------------------------
-- Course: CARPENTERY AND JOINERY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT CABINETRY WORKS', 'carry-out-cabinetry-works', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS', 'construct-temporary-works', NULL::text),
  ('FIX DOOR & WINDOW FRAMES', 'fix-door-and-window-frames', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-3';

-- ------------------------------------------------------------------------------
-- Course: GYPSUM INSTALLATION LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'gypsum-installation-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL GYPSUM CABINETS', 'install-gypsum-cabinets', NULL::text),
  ('INSTALL GYPSUM CEILING', 'install-gypsum-ceiling', NULL::text),
  ('INSTALL GYPSUM PARTITIONS', 'install-gypsum-partitions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'gypsum-installation-level-3';

-- ------------------------------------------------------------------------------
-- Course: MASONRY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM MASONRY WORKS', 'perform-masonry-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES', 'perform-masonry-works-finishes', NULL::text),
  ('PRODUCE MASONRY PRODUCTS', 'produce-masonry-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-3';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEMS I', 'install-drainage-systems-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES I', 'install-sanitary-appliances-i', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEMS I', 'install-water-supply-systems-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';

-- ------------------------------------------------------------------------------
-- Course: RIGGER LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigger-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM PRE- RIGGING ACTIVITIES', 'perform-pre-rigging-activities', NULL::text),
  ('PERFORM RIGGING ACTIVITIES', 'perform-rigging-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigger-level-3';

-- ------------------------------------------------------------------------------
-- Course: TILE FIXER LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'tile-fixer-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT TILE INSTALLATION', 'carry-out-tile-installation', NULL::text),
  ('INDUSTRY TRAINING', 'industry-training', NULL::text),
  ('PERFORM TILING WORKS ESTIMATES', 'perform-tiling-works-estimates', NULL::text),
  ('PREPARE SURFACE AND SET OUT', 'prepare-surface-and-set-out', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'tile-fixer-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: BUSINESS STUDIES DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 20 | Total Units: 345
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: BUSINESS STUDIES DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUSINESS STUDIES DEPARTMENT', 'business-studies-department', 'Accredited TVET CDACC Business Studies modular courses in Accountancy, Banking & Finance, Business Management, Cooperative Management, Credit Management, Human Resource Management, Marketing, Office Administration, and Procurement.', 4
FROM programmes WHERE slug = 'modular-cdacc-courses-cycle-3'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & modules/units under this department
-- Cascades automatically to modules and units for a completely clean sync.
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department'
);

-- 4. Insert Courses under BUSINESS STUDIES DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ACCOUNTANCY LEVEL 6', 'accountancy-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BANKING AND FINANCE LEVEL 6', 'banking-and-finance-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUSINESS MANAGEMENT LEVEL 6', 'business-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COOPERATIVE MANAGEMENT LEVEL 6', 'cooperative-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CREDIT MANAGEMENT LEVEL 6', 'credit-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HUMAN RESOURCE MANAGEMENT LEVEL 6', 'human-resource-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MARKETING MANAGEMENT LEVEL 6', 'marketing-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'OFFICE ADMINISTRATION LEVEL 6', 'office-administration-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PROCUREMENT MANAGEMENT LEVEL 6', 'procurement-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PROJECT MANAGEMENT LEVEL 6', 'project-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ASSISTANT PROJECT MANAGER LEVEL 5', 'assistant-project-manager-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUSINESS MANAGEMENT LEVEL 5', 'business-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COOPERATIVE MANAGEMENT LEVEL 5', 'cooperative-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CREDIT MANAGEMENT LEVEL 5', 'credit-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HUMAN RESOURCE MANAGEMENT LEVEL 5', 'human-resource-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MARKETING MANAGEMENT LEVEL 5', 'marketing-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'OFFICE ADMINISTRATION LEVEL 5', 'office-administration-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PROCUREMENT MANAGEMENT LEVEL 5', 'procurement-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'OFFICE ASSISTANCE LEVEL 4', 'office-assistance-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'STORE KEEPING LEVEL 4', 'store-keeping-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ACCOUNTANCY LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY ECONOMICS PRINCIPLES', 'apply-economics-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('DEMONSTRATE FUNDAMENTALS OF ACCOUNTING', 'demonstrate-fundamentals-of-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CARRY OUT FINANCIAL ACCOUNTING', 'carry-out-financial-accounting', NULL::text),
  ('DEMOSTRATE UNDERSTANDING OF INFORMATION COMMUNICATION TECHNOLOGY (ICT)', 'demostrate-understanding-of-information-communication-technology-ict', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('CARRY OUT BUSINESS MATHEMATICS AND STATISTICS', 'carry-out-business-mathematics-and-statistics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT PUBLIC FINANCE AND TAXATION', 'conduct-public-finance-and-taxation', NULL::text),
  ('CONDUCT QUANTITATIVE TECHNIQUES', 'conduct-quantitative-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CONDUCT FINANCIAL AUDITS', 'conduct-financial-audits', NULL::text),
  ('CONDUCT FINANCIAL MANAGEMENT', 'conduct-financial-management', NULL::text),
  ('CONDUCT MANAGEMENT ACCOUNTING', 'conduct-management-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- ------------------------------------------------------------------------------
-- Course: BANKING AND FINANCE LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MARKET BANK PRODUCTS', 'market-bank-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MANAGE CUSTOMER RELATIONSHIP', 'manage-customer-relationship', NULL::text),
  ('MANAGE ELECTRONIC BANKING', 'manage-electronic-banking', NULL::text),
  ('OFFER CUSTOMER SERVICE', 'offer-customer-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY FINANCIAL MANAGEMENT SKILLS', 'apply-financial-management-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('MANAGE BANK COMPLIANCE', 'manage-bank-compliance', NULL::text),
  ('PERFORM CREDIT ADMINISTRATION', 'perform-credit-administration', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT RESEARCH STUDY', 'conduct-research-study', NULL::text),
  ('OFFER TELLERING SERVICE', 'offer-tellering-service', NULL::text),
  ('PROCESS CREDIT APPLICATION', 'process-credit-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('ESTABLISH CREDIT COLLATERALIZATION', 'establish-credit-collateralization', NULL::text),
  ('MANAGE BACK OFFICE', 'manage-back-office', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUSINESS MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM SALES ACTIVITIES', 'perform-sales-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ECONOMICS SKILLS', 'apply-economics-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM PURCHASING SKILLS', 'perform-purchasing-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('PERFORM ADMINISTRATIVE ASSISTANT DUTIES', 'perform-administrative-assistant-duties', NULL::text),
  ('PERFORM STAFFING ACTIVITIES', 'perform-staffing-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT RESEARCH PROJECT', 'conduct-research-project', NULL::text),
  ('MANAGE MARKETING ACTIVITIES', 'manage-marketing-activities', NULL::text),
  ('PERFORM HUMAN RESOURCE ACTIVITIES', 'perform-human-resource-activities', NULL::text),
  ('PERFORM SUPPLY CHAIN ACTIVITIES', 'perform-supply-chain-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CARRY OUT ACCOUNTING OPERATIONS', 'carry-out-accounting-operations', NULL::text),
  ('DEVELOP ORGANIZATIONAL STRATEGIC PLAN', 'develop-organizational-strategic-plan', NULL::text),
  ('MANAGE BUSINESS RISKS', 'manage-business-risks', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: COOPERATIVE MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT COOPERATIVE MARKETING ACTIVITIES', 'conduct-cooperative-marketing-activities', NULL::text),
  ('PERFORM CUSTOMER CARE SERVICES', 'perform-customer-care-services', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM BASIC TELLER OPERATIONS', 'perform-basic-teller-operations', NULL::text),
  ('PERFORM COOPERATIVE STORES ACTIVITIES', 'perform-cooperative-stores-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE COOPERATIVE SOCIETY SECURITY MEASURES', 'manage-cooperative-society-security-measures', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('CONDUCT RESEARCH PROJECT', 'conduct-research-project', NULL::text),
  ('MANAGE CUSTOMER RELATIONS', 'manage-customer-relations', NULL::text),
  ('PERFORM COOPERATIVE ACCOUNTING OPERATIONS', 'perform-cooperative-accounting-operations', NULL::text),
  ('PERFORM HUMAN RESOURCE FUNCTIONS', 'perform-human-resource-functions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CARRY OUT COOPERATIVE BANKING OPERATIONS', 'carry-out-cooperative-banking-operations', NULL::text),
  ('CONDUCT CREDIT ADMINISTRATION', 'conduct-credit-administration', NULL::text),
  ('MANAGE COOPERATIVE MEMBER RECORDS', 'manage-cooperative-member-records', NULL::text),
  ('MANAGE CORPORATE SOCIAL RESPONSIBILITY', 'manage-corporate-social-responsibility', NULL::text),
  ('MARKET COOPERATIVE PRODUCTS AND SERVICES', 'market-cooperative-products-and-services', NULL::text),
  ('PERFORM COOPERATIVE SOCIETY STORES OPERATIONS', 'perform-cooperative-society-stores-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: CREDIT MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MARKET BANK PRODUCTS', 'market-bank-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CARRY OUT CUSTOMER ON-BOARDING', 'carry-out-customer-on-boarding', NULL::text),
  ('MAINTAIN CUSTOMER RELATIONSHIP', 'maintain-customer-relationship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY FINANCIAL MANAGEMENT SKILLS', 'apply-financial-management-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MONITOR LOAN REPAYMENT', 'monitor-loan-repayment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT RESEARCH STUDY', 'conduct-research-study', NULL::text),
  ('PROCESS BANK CREDIT APPLICATION', 'process-bank-credit-application', NULL::text),
  ('PROVIDE TELLERING SERVICE', 'provide-tellering-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('MANAGE CLIENT DEBT COLLECTION', 'manage-client-debt-collection', NULL::text),
  ('MANAGE CREDIT SECURITY', 'manage-credit-security', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: HUMAN RESOURCE MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CO-ORDINATE EMPLOYEE TRAINING AND DEVELOPMENT', 'co-ordinate-employee-training-and-development', NULL::text),
  ('CONDUCT EMPLOYEE RESOURCING', 'conduct-employee-resourcing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('COORDINATE EMPLOYEE PERFORMANCE MANAGEMENT', 'coordinate-employee-performance-management', NULL::text),
  ('MANAGE HUMAN RESOURCE RECORDS', 'manage-human-resource-records', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE EMPLOYEE RELATIONS', 'manage-employee-relations', NULL::text),
  ('UNDERTAKE EMPLOYEE SEPARATION', 'undertake-employee-separation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('MANAGE EMPLOYEE REWARDS', 'manage-employee-rewards', NULL::text),
  ('MANAGE ORGANIZATIONAL BEHAVIOUR', 'manage-organizational-behaviour', NULL::text),
  ('PERFORM HUMAN RESOURCE OPERATIONS', 'perform-human-resource-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('APPLY LABOUR LAWS', 'apply-labour-laws', NULL::text),
  ('CARRY OUT RESEARCH STUDY', 'carry-out-research-study', NULL::text),
  ('PROVIDE EMPLOYEE COUNSELLING', 'provide-employee-counselling', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: MARKETING MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT BRAND PROMOTION', 'conduct-brand-promotion', NULL::text),
  ('PERFORM TRADE ACTIVITIES', 'perform-trade-activities', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ECONOMIC SKILLS', 'apply-economic-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CONDUCT MARKETING COMMUNICATION ACTIVITIES', 'conduct-marketing-communication-activities', NULL::text),
  ('CUSTOMER EXPERIENCE', 'customer-experience', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('CONDUCT MARKET INNOVATIONS/RENOVATIONS', 'conduct-market-innovations-renovations', NULL::text),
  ('MANAGE DIGITAL MARKETING', 'manage-digital-marketing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT RESEARCH PROJECT', 'conduct-research-project', NULL::text),
  ('DEVELOP BRAND STRATEGY', 'develop-brand-strategy', NULL::text),
  ('DEVELOP DISTRIBUTION CHANNELS', 'develop-distribution-channels', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CONDUCT MARKET ANALYSIS', 'conduct-market-analysis', NULL::text),
  ('CONDUCT PROMOTIONAL CAMPAIGN', 'conduct-promotional-campaign', NULL::text),
  ('DEVELOP MARKETING BUDGET', 'develop-marketing-budget', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: OFFICE ADMINISTRATION LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY SHORTHAND SKILLS I', 'apply-shorthand-skills-i', NULL::text),
  ('HANDLE CUSTOMER CARE DUTIES', 'handle-customer-care-duties', NULL::text),
  ('HANDLE OFFICE CORRESPONDENCE', 'handle-office-correspondence', NULL::text),
  ('HANDLE OFFICE ERRANDS', 'handle-office-errands', NULL::text),
  ('PROCESS OFFICE DOCUMENTS I', 'process-office-documents-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY SHORTHAND SKILLS II', 'apply-shorthand-skills-ii', NULL::text),
  ('COORDINATE OFFICE REPAIRS AND MAINTENANCE', 'coordinate-office-repairs-and-maintenance', NULL::text),
  ('MAINTAIN OFFICE PAPER RECORDS', 'maintain-office-paper-records', NULL::text),
  ('MANAGE TELEPHONE CALLS', 'manage-telephone-calls', NULL::text),
  ('PROCESS OFFICE DOCUMENTS II', 'process-office-documents-ii', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ICT SKILLS', 'apply-ict-skills', NULL::text),
  ('APPLY INTERMEDIATE SHORTHAND SKILLS', 'apply-intermediate-shorthand-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PROCESS INTERMEDIATE OFFICE DOCUMENTS PROCESSING', 'process-intermediate-office-documents-processing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMERCE PRINCIPLES', 'apply-commerce-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('COORDINATE OFFICIAL MEETINGS', 'coordinate-official-meetings', NULL::text),
  ('MANAGE OFFICE ADMINISTRATIVE DUTIES', 'manage-office-administrative-duties', NULL::text),
  ('MANAGE OFFICE SECURITY', 'manage-office-security', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ADVANCED SHORTHAND SKILLS 1', 'apply-advanced-shorthand-skills-1', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY MANAGEMENT PRINCIPLES', 'apply-management-principles', NULL::text),
  ('COORDINATE TRAVEL ARRANGEMENTS', 'coordinate-travel-arrangements', NULL::text),
  ('PROCESS ADVANCED OFFICE DOCUMENTS I', 'process-advanced-office-documents-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ADVANCED SHORTHAND SKILLS II', 'apply-advanced-shorthand-skills-ii', NULL::text),
  ('APPLY ECONOMICS PRINCIPLES', 'apply-economics-principles', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('CONDUCT RESEARCH PROJECT', 'conduct-research-project', NULL::text),
  ('PROCESS ADVANCED OFFICE DOCUMENTS II', 'process-advanced-office-documents-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- ------------------------------------------------------------------------------
-- Course: PROCUREMENT MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CLASSIFY AND CODIFY PROCURED GOODS', 'classify-and-codify-procured-goods', NULL::text),
  ('MANAGE STORAGE OF GOODS', 'manage-storage-of-goods', NULL::text),
  ('RECEIVE DELIVERED GOODS', 'receive-delivered-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ISSUE AND DISPATCH GOODS', 'issue-and-dispatch-goods', NULL::text),
  ('MANAGE STORES SAFETY AND SECURITY', 'manage-stores-safety-and-security', NULL::text),
  ('PRESERVE STORED GOODS', 'preserve-stored-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('HANDLE ORGANIZATIONS'' MATERIALS', 'handle-organizations-materials', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PREPARE GOODS FOR DISTRIBUTION', 'prepare-goods-for-distribution', NULL::text),
  ('PROCURE ORGANIZATIONS'' GOODS AND SERVICES', 'procure-organizations-goods-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ECONOMIC SKILLS', 'apply-economic-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE SUPPLY CHAIN OPERATIONS', 'manage-supply-chain-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: PROJECT MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION SKILLS', 'apply-business-communication-skills', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MANAGE PROJECT INCEPTION PHASE', 'manage-project-inception-phase', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MANAGE PROJECT STAKEHOLDERS', 'manage-project-stakeholders', NULL::text),
  ('PROCURE GOODS WORKS AND SERVICES', 'procure-goods-works-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE PROJECT ENVIRONMENT', 'manage-project-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('CARRY OUT RESEARCH STUDY', 'carry-out-research-study', NULL::text),
  ('MANAGE PROJECT IMPLEMENTATION', 'manage-project-implementation', NULL::text),
  ('MANAGE PROJECT PLANNING AND DESIGN', 'manage-project-planning-and-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('AUDIT AND REVIEW PROJECTS', 'audit-and-review-projects', NULL::text),
  ('MANAGE PROJECT CLOSURE', 'manage-project-closure', NULL::text),
  ('MONITOR AND EVALUATE PROJECTS', 'monitor-and-evaluate-projects', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: ASSISTANT PROJECT MANAGER LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION SKILLS', 'apply-business-communication-skills', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MANAGE PROJECT INCEPTION PHASE', 'manage-project-inception-phase', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MANAGE PROJECT STAKEHOLDERS', 'manage-project-stakeholders', NULL::text),
  ('PROCURE GOODS WORKS AND SERVICES', 'procure-goods-works-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE PROJECT ENVIRONMENT', 'manage-project-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';

-- ------------------------------------------------------------------------------
-- Course: BUSINESS MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM SALES ACTIVITIES', 'perform-sales-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ECONOMICS SKILLS', 'apply-economics-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM PURCHASING ACTIVITIES', 'perform-purchasing-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('PERFORM ADMINISTRATIVE ASSISTANT DUTIES', 'perform-administrative-assistant-duties', NULL::text),
  ('PERFORM STAFFING ACTIVITIES', 'perform-staffing-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: COOPERATIVE MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT COOPERATIVE MARKETING ACTIVITIES', 'conduct-cooperative-marketing-activities', NULL::text),
  ('PERFORM CUSTOMER CARE SERVICES', 'perform-customer-care-services', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM BASIC TELLER OPERATIONS', 'perform-basic-teller-operations', NULL::text),
  ('PERFORM COOPERATIVE STORES ACTIVITIES', 'perform-cooperative-stores-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE COOPERATIVE SOCIETY SECURITY MEASURES', 'manage-cooperative-society-security-measures', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: CREDIT MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MARKET BANK PRODUCTS', 'market-bank-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CARRY OUT CUSTOMER ON-BOARDING', 'carry-out-customer-on-boarding', NULL::text),
  ('MAINTAIN CUSTOMER RELATIONSHIP', 'maintain-customer-relationship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY FINANCIAL MANAGEMENT SKILLS', 'apply-financial-management-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MONITOR LOAN REPAYMENT', 'monitor-loan-repayment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: HUMAN RESOURCE MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CO-ORDINATE EMPLOYEE TRAINING AND DEVELOPMENT', 'co-ordinate-employee-training-and-development', NULL::text),
  ('CONDUCT EMPLOYEE RESOURCING', 'conduct-employee-resourcing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('COORDINATE EMPLOYEE PERFORMANCE MANAGEMENT', 'coordinate-employee-performance-management', NULL::text),
  ('MANAGE HUMAN RESOURCE RECORDS', 'manage-human-resource-records', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE EMPLOYEE RELATIONS', 'manage-employee-relations', NULL::text),
  ('UNDERTAKE EMPLOYEE SEPARATION', 'undertake-employee-separation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: MARKETING MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT BRAND PROMOTION', 'conduct-brand-promotion', NULL::text),
  ('CONDUCT TRADE ACTIVITIES', 'conduct-trade-activities', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ECONOMIC SKILLS', 'apply-economic-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CONDUCT MARKETING COMMUNICATION ACTIVITIES', 'conduct-marketing-communication-activities', NULL::text),
  ('MANAGE CUSTOMER EXPERIENCE', 'manage-customer-experience', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('CARRY OUT BUSINESS MATHEMATICS AND STATISTICS', 'carry-out-business-mathematics-and-statistics', NULL::text),
  ('CONDUCT MARKET INNOVATIONS/RENOVATIONS', 'conduct-market-innovations-renovations', NULL::text),
  ('MANAGE DIGITAL MARKETING', 'manage-digital-marketing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: OFFICE ADMINISTRATION LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY SHORTHAND SKILLS I', 'apply-shorthand-skills-i', NULL::text),
  ('HANDLE CUSTOMER CARE DUTIES', 'handle-customer-care-duties', NULL::text),
  ('HANDLE OFFICE CORRESPONDENCE', 'handle-office-correspondence', NULL::text),
  ('HANDLE OFFICE ERRANDS', 'handle-office-errands', NULL::text),
  ('PROCESS OFFICE DOCUMENTS I', 'process-office-documents-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY SHORTHAND SKILLS II', 'apply-shorthand-skills-ii', NULL::text),
  ('COORDINATE OFFICE REPAIRS AND MAINTENANCE', 'coordinate-office-repairs-and-maintenance', NULL::text),
  ('HANDLE OFFICE PAPER RECORDS', 'handle-office-paper-records', NULL::text),
  ('MANAGE TELEPHONE CALLS', 'manage-telephone-calls', NULL::text),
  ('PROCESS OFFICE DOCUMENTS II', 'process-office-documents-ii', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ICT SKILLS', 'apply-ict-skills', NULL::text),
  ('APPLY INTERMEDIATE SHORTHAND SKILLS', 'apply-intermediate-shorthand-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PROCESS INTERMEDIATE OFFICE DOCUMENTS I', 'process-intermediate-office-documents-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMERCE PRINCIPLES', 'apply-commerce-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('COORDINATE OFFICIAL MEETINGS', 'coordinate-official-meetings', NULL::text),
  ('MANAGE OFFICE ADMINISTRATIVE DUTIES', 'manage-office-administrative-duties', NULL::text),
  ('MANAGE OFFICE SECURITY', 'manage-office-security', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';

-- ------------------------------------------------------------------------------
-- Course: PROCUREMENT MANAGEMENT LEVEL 5 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CLASSIFY AND CODIFY PROCURED GOODS', 'classify-and-codify-procured-goods', NULL::text),
  ('MANAGE STORAGE OF GOODS', 'manage-storage-of-goods', NULL::text),
  ('RECEIVE DELIVERED GOODS', 'receive-delivered-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ISSUE AND DISPATCH GOODS', 'issue-and-dispatch-goods', NULL::text),
  ('MANAGE STORES SAFETY AND SECURITY', 'manage-stores-safety-and-security', NULL::text),
  ('PRESERVE STORED GOODS', 'preserve-stored-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('HANDLE ORGANIZATIONS'' MATERIALS', 'handle-organizations-materials', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PREPARE GOODS FOR DISTRIBUTION', 'prepare-goods-for-distribution', NULL::text),
  ('PROCURE ORGANIZATIONS'' GOODS AND SERVICES', 'procure-organizations-goods-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ECONOMIC SKILLS', 'apply-economic-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE SUPPLY CHAIN OPERATIONS', 'manage-supply-chain-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: OFFICE ASSISTANCE LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-assistance-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('HANDLE OFFICE CORRESPONDENCE', 'handle-office-correspondence', NULL::text),
  ('HANDLE OFFICE ERRANDS', 'handle-office-errands', NULL::text),
  ('INTRODUCTION TO PROCESS OFFICE DOCUMENTS 1', 'introduction-to-process-office-documents-1', NULL::text),
  ('INTRODUCTION TO SHORTHAND SKILLS 1', 'introduction-to-shorthand-skills-1', NULL::text),
  ('MANAGE CUSTOMER CARE RELATIONS', 'manage-customer-care-relations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-assistance-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-assistance-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COORDINATE OFFICE REPAIRS AND MAINTENANCE', 'coordinate-office-repairs-and-maintenance', NULL::text),
  ('INTRODUCTION TO PROCESS OFFICE DOCUMENTS 2', 'introduction-to-process-office-documents-2', NULL::text),
  ('INTRODUCTION TO SHORTHAND SKILLS 2', 'introduction-to-shorthand-skills-2', NULL::text),
  ('MAINTAIN OFFICE PAPER RECORDS', 'maintain-office-paper-records', NULL::text),
  ('MANAGE TELEPHONE CALLS', 'manage-telephone-calls', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-assistance-level-4';

-- ------------------------------------------------------------------------------
-- Course: STORE KEEPING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'store-keeping-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CLASSIFY AND CODIFY PROCURED GOODS', 'classify-and-codify-procured-goods', NULL::text),
  ('MANAGE STORAGE OF GOODS', 'manage-storage-of-goods', NULL::text),
  ('RECEIVE DELIVERED GOODS', 'receive-delivered-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'store-keeping-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'store-keeping-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ISSUE AND DISPATCH GOODS', 'issue-and-dispatch-goods', NULL::text),
  ('MANAGE STORES SAFETY AND SECURITY', 'manage-stores-safety-and-security', NULL::text),
  ('PRESERVE STORED GOODS', 'preserve-stored-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'store-keeping-level-4';


COMMIT;

-- Summary check across all departments
SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
FROM departments d
JOIN courses c ON c.department_id = d.id
LEFT JOIN units u ON u.course_id = c.id
GROUP BY d.name ORDER BY d.name;