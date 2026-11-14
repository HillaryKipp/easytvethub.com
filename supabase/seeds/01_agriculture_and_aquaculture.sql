-- ==============================================================================
-- SEED SCRIPT FOR: AGRICULTURE AND AQUACULTURE DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 39 | Total Units: 362
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
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

COMMIT;
-- Verification Query: Check courses and units inserted for AGRICULTURE AND AQUACULTURE DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'agriculture-and-aquaculture-department'
-- GROUP BY d.name;