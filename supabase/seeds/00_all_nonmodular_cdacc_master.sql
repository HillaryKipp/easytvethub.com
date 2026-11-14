-- ==============================================================================
-- COMPREHENSIVE NON-MODULAR CDACC (CYCLE 1 & 2) MASTER SEED SCRIPT
-- Total: 187 Courses | 2891 Units across 11 Departments
-- Safe to run in Supabase SQL Editor
-- ==============================================================================
BEGIN;

-- Ensure Programme Exists
INSERT INTO programmes (name, slug, description, sort_order)
VALUES (
  'CDACC Courses (Cycle 1 & 2)',
  'cdacc-courses-cycle-1-and-2',
  'TVET CDACC Cycle 1 and Cycle 2 competency-based courses, occupational standards, past papers, and assessment tools.',
  2
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- ==============================================================================
-- SEED SCRIPT FOR: AGRICULTURE AND AQUACULTURE DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 27 | Total Units: 388
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: AGRICULTURE AND AQUACULTURE DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'AGRICULTURE AND AQUACULTURE DEPARTMENT', 'agriculture-and-aquaculture-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Agriculture, Agribusiness, Dairy, Horticulture, and Aquaculture courses in Kenya.', 1
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department'
);

-- 4. Insert Non-Modular Courses under AGRICULTURE AND AQUACULTURE DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURAL ENGINEERING LEVEL 6', 'agricultural-engineering-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURAL EXTENSION LEVEL 6', 'agricultural-extension-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRIPRENEURSHIP LEVEL 6', 'agripreneurship-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AQUACULTURE MANAGEMENT LEVEL 6', 'aquaculture-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY FARM MANAGEMENT LEVEL 6', 'dairy-farm-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURAL CROPS PRODUCTION LEVEL 6', 'horticultural-crops-production-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE NURSERY MANAGEMENT LEVEL 6', 'horticulture-nursery-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE PRODUCTION LEVEL 6', 'horticulture-production-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURAL EXTENSION LEVEL 5', 'agricultural-extension-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURAL MACHINERY & EQUIPMENT MECHATRONICS LEVEL 5', 'agricultural-machinery-and-equipment-mechatronics-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRIPRENEURSHIP LEVEL 5', 'agripreneurship-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AQUACULTURE MANAGEMENT LEVEL 5', 'aquaculture-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY FARM MANAGEMENT LEVEL 5', 'dairy-farm-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY PLANT MANAGEMENT LEVEL 5', 'dairy-plant-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE NURSERY MANAGEMENT LEVEL 5', 'horticulture-nursery-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE PRODUCTION LEVEL 5', 'horticulture-production-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SUSTAINABLE AGRICULTURE FOR RURAL DEVELOPMENT LEVEL 5', 'sustainable-agriculture-for-rural-development-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURAL EXTENSION LEVEL 4', 'agricultural-extension-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURAL MACHINERY AND EQUIPMENT LEVEL 4', 'agricultural-machinery-and-equipment-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRIPRENEURSHIP LEVEL 4', 'agripreneurship-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AQUACULTURE TECHNICIAN LEVEL 4', 'aquaculture-technician-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY FARM MANAGER LEVEL 4', 'dairy-farm-manager-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY PROCESSING LEVEL 4', 'dairy-processing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE NURSERY MANAGEMENT LEVEL 4', 'horticulture-nursery-management-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE PRODUCTION LEVEL 4', 'horticulture-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY FARM MANAGER LEVEL 3', 'dairy-farm-manager-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURAL CROPS PRODUCER LEVEL 3', 'horticultural-crops-producer-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: AGRICULTURAL ENGINEERING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-engineering-level-6';

-- Section 2: Core Units of Competency (16 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY MATERIAL SCIENCE AND METALLURGICAL PROCESSES', 'apply-material-science-and-metallurgical-processes', NULL::text),
  ('APPLY PRINCIPLES OF FLUID MECHANICS', 'apply-principles-of-fluid-mechanics', NULL::text),
  ('APPLY PRINCIPLES OF MECHANICAL SCIENCE', 'apply-principles-of-mechanical-science', NULL::text),
  ('APPLY RENEWABLE ENERGY TECHNOLOGY IN AGRICULTURE', 'apply-renewable-energy-technology-in-agriculture', NULL::text),
  ('CONSTRUCT FARMSTEAD STRUCTURES AND FARM ROADS', 'construct-farmstead-structures-and-farm-roads', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF TRACTORS AND POWER UNITS', 'demonstrate-understanding-of-tractors-and-power-units', NULL::text),
  ('INSTALL REFRIGERATION AND AIR CONDITIONING SYSTEMS', 'install-refrigeration-and-air-conditioning-systems', NULL::text),
  ('OPERATE AGRICULTURAL AND RELATED PRODUCTION MACHINERY AND EQUIPMENT', 'operate-agricultural-and-related-production-machinery-and-equipment', NULL::text),
  ('OPERATE AGRICULTURAL HARVESTING MACHINERY AND EQUIPMENT', 'operate-agricultural-harvesting-machinery-and-equipment', NULL::text),
  ('PERFORM IRRIGATION ACTIVITIES', 'perform-irrigation-activities', NULL::text),
  ('PERFORM PRODUCE POST-HARVEST ACTIVITIES', 'perform-produce-post-harvest-activities', NULL::text),
  ('PERFORM SOIL AND WATER CONSERVATION ACTIVITIES', 'perform-soil-and-water-conservation-activities', NULL::text),
  ('PERFORM WORKSHOP PROCESSES AND MATERIALS', 'perform-workshop-processes-and-materials', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-engineering-level-6';

-- ------------------------------------------------------------------------------
-- Course: AGRICULTURAL EXTENSION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-6';

-- Section 2: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AGRICULTURAL EXTENSION AND RURAL SOCIOLOGY', 'apply-agricultural-extension-and-rural-sociology', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-6';

-- Section 3: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPY AGRICULTURAL EXTENSION AND RURAL SOCIOLOGY', 'appy-agricultural-extension-and-rural-sociology', NULL::text),
  ('FORMULATE LIVESTOCK FEEDS', 'formulate-livestock-feeds', NULL::text),
  ('MANAGE FARM', 'manage-farm', NULL::text),
  ('MANAGE SOIL AND WATER RESOURCES', 'manage-soil-and-water-resources', NULL::text),
  ('PROCESS FARM PRODUCTS', 'process-farm-products', NULL::text),
  ('PRODUCE CONVECTIONAL AND NON-CONVECTIONAL LIVESTOCK', 'produce-convectional-and-non-convectional-livestock', NULL::text),
  ('PRODUCE HORTICULTURAL CROPS', 'produce-horticultural-crops', NULL::text),
  ('PROTECT CROP', 'protect-crop', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-6';

-- ------------------------------------------------------------------------------
-- Course: AGRIPRENEURSHIP LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-6';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ICT IN AGRI-ENTERPRISE', 'apply-ict-in-agri-enterprise', NULL::text),
  ('DEVELOP AGRI-ENTERPRISE BUSINESS PLAN', 'develop-agri-enterprise-business-plan', NULL::text),
  ('MANAGE AN AGRI- ENTERPRISE', 'manage-an-agri-enterprise', NULL::text),
  ('MARKET AGRI-ENTERPRISE PRODUCTS/SERVICES', 'market-agri-enterprise-products-services', NULL::text),
  ('PROCESS FARM PRODUCTS', 'process-farm-products', NULL::text),
  ('START AGRI-ENTERPRISE', 'start-agri-enterprise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-6';

-- ------------------------------------------------------------------------------
-- Course: AQUACULTURE MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-management-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('HANDLE HARVESTED FISH', 'handle-harvested-fish', NULL::text),
  ('MANAGE FISH CAGE FARM', 'manage-fish-cage-farm', NULL::text),
  ('MANAGE FISH HATCHERY', 'manage-fish-hatchery', NULL::text),
  ('PRODUCE FISH FEEDS', 'produce-fish-feeds', NULL::text),
  ('PRODUCE GROW OUT FISH', 'produce-grow-out-fish', NULL::text),
  ('SET UP FISH FARM', 'set-up-fish-farm', NULL::text),
  ('SET UP RECIRCULATING AQUACULTURE SYSTEM (RAS)', 'set-up-recirculating-aquaculture-system-ras', NULL::text),
  ('SET UP SMALL SCALE FISH HATCHERY UNIT', 'set-up-small-scale-fish-hatchery-unit', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: DAIRY FARM MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-management-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BREED DAIRY ANIMALS', 'breed-dairy-animals', NULL::text),
  ('DESIGN FARM STRUCTURES', 'design-farm-structures', NULL::text),
  ('DEVELOP DAIRY FARM STRUCTURES', 'develop-dairy-farm-structures', NULL::text),
  ('FEED DAIRY ANIMALS', 'feed-dairy-animals', NULL::text),
  ('FORMULATE DAIRY FEED', 'formulate-dairy-feed', NULL::text),
  ('LAYOUT DAIRY FARM', 'layout-dairy-farm', NULL::text),
  ('MANAGE DAIRY HERD HEALTH', 'manage-dairy-herd-health', NULL::text),
  ('MANAGE DAIRY YOUNG STOCK', 'manage-dairy-young-stock', NULL::text),
  ('MILK DAIRY ANIMALS', 'milk-dairy-animals', NULL::text),
  ('PRODUCE DAIRY FORAGE', 'produce-dairy-forage', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURAL CROPS PRODUCTION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-crops-production-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-crops-production-level-6';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-crops-production-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AGROFORESTRY', 'apply-agroforestry', NULL::text),
  ('PRODUCE CUT FLOWERS', 'produce-cut-flowers', NULL::text),
  ('PRODUCE HERBS AND SPICES', 'produce-herbs-and-spices', NULL::text),
  ('PRODUCE HORTICULTURAL NUTS', 'produce-horticultural-nuts', NULL::text),
  ('PRODUCE MUSHROOMS', 'produce-mushrooms', NULL::text),
  ('PRODUCE ORNAMENTAL PLANTS', 'produce-ornamental-plants', NULL::text),
  ('PRODUCE SUB-TROPICAL FRUITS', 'produce-sub-tropical-fruits', NULL::text),
  ('PRODUCE TEMPERATE FRUITS', 'produce-temperate-fruits', NULL::text),
  ('PRODUCE TROPICAL FRUITS', 'produce-tropical-fruits', NULL::text),
  ('PRODUCE VEGETABLES', 'produce-vegetables', NULL::text),
  ('PRODUCE VINE FRUITS', 'produce-vine-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-crops-production-level-6';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURE NURSERY MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-6';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ESTABLISH MOTHER BLOCK', 'establish-mother-block', NULL::text),
  ('HARDEN TISSUE CULTURE SEEDLINGS', 'harden-tissue-culture-seedlings', NULL::text),
  ('PREPARE NURSERY PLANTING MEDIA', 'prepare-nursery-planting-media', NULL::text),
  ('PRODUCE GRAFTED/BUDDED SEEDLINGS', 'produce-grafted-budded-seedlings', NULL::text),
  ('PRODUCE POTTED SEEDLINGS', 'produce-potted-seedlings', NULL::text),
  ('PRODUCE VEGETABLE SEEDLINGS', 'produce-vegetable-seedlings', NULL::text),
  ('SET UP HORTICULTURAL NURSERY STRUCTURES', 'set-up-horticultural-nursery-structures', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURE PRODUCTION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-6';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE HORTICULTURAL PRODUCTION FARM', 'manage-horticultural-production-farm', NULL::text),
  ('PRODUCE CUT FLOWERS', 'produce-cut-flowers', NULL::text),
  ('PRODUCE HERBS AND SPICES', 'produce-herbs-and-spices', NULL::text),
  ('PRODUCE HORTICULTURAL NUTS', 'produce-horticultural-nuts', NULL::text),
  ('PRODUCE MUSHROOM', 'produce-mushroom', NULL::text),
  ('PRODUCE ORNAMENTAL PLANTS', 'produce-ornamental-plants', NULL::text),
  ('PRODUCE SUB-TROPICAL FRUITS', 'produce-sub-tropical-fruits', NULL::text),
  ('PRODUCE TEMPERATE FRUITS', 'produce-temperate-fruits', NULL::text),
  ('PRODUCE TROPICAL FRUITS', 'produce-tropical-fruits', NULL::text),
  ('PRODUCE VEGETABLE CROPS', 'produce-vegetable-crops', NULL::text),
  ('PRODUCE VINE FRUITS', 'produce-vine-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-6';

-- ------------------------------------------------------------------------------
-- Course: AGRICULTURAL EXTENSION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM SOIL AND WATER CONSERVATION', 'perform-soil-and-water-conservation', NULL::text),
  ('PRODUCE BEEF CATTLE AND THEIR PRODUCTS', 'produce-beef-cattle-and-their-products', NULL::text),
  ('PRODUCE DAIRY CATTLE AND THEIR PRODUCTS', 'produce-dairy-cattle-and-their-products', NULL::text),
  ('PRODUCE PIGS AND THEIR PRODUCTS', 'produce-pigs-and-their-products', NULL::text),
  ('PRODUCE POULTRY AND THEIR PRODUCTS', 'produce-poultry-and-their-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-5';

-- ------------------------------------------------------------------------------
-- Course: AGRICULTURAL MACHINERY & EQUIPMENT MECHATRONICS LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-mechatronics-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-mechatronics-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-mechatronics-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING SCIENCE PRINCIPLES', 'apply-engineering-science-principles', NULL::text),
  ('DRIVE AGRICULTURAL MECHATRONICS MACHINERY AND EQUIPMENT', 'drive-agricultural-mechatronics-machinery-and-equipment', NULL::text),
  ('MAINTAIN AGRICULTURAL MECHATRONIC MACHINERY AND EQUIPMENT SYSTEMS', 'maintain-agricultural-mechatronic-machinery-and-equipment-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text),
  ('OPERATE AGRICULTURAL MECHATRONICS MACHINERY AND EQUIPMENT', 'operate-agricultural-mechatronics-machinery-and-equipment', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('REPAIR AGRICULTURAL MECHATRONICS MACHINERY AND EQUIPMENT', 'repair-agricultural-mechatronics-machinery-and-equipment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-mechatronics-level-5';

-- ------------------------------------------------------------------------------
-- Course: AGRIPRENEURSHIP LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ICT IN AGRI ENTERPRISE', 'apply-ict-in-agri-enterprise', NULL::text),
  ('DEVELOP AGRI-ENTERPRISE BUSINESS PLAN', 'develop-agri-enterprise-business-plan', NULL::text),
  ('MANAGE AGRI-ENTERPRISE', 'manage-agri-enterprise', NULL::text),
  ('MARKET AGRI-ENTERPRISE PRODUCTS/SERVICES', 'market-agri-enterprise-products-services', NULL::text),
  ('START AGRI-ENTERPRISE', 'start-agri-enterprise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-5';

-- ------------------------------------------------------------------------------
-- Course: AQUACULTURE MANAGEMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-management-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('HANDLE HARVESTED FISH', 'handle-harvested-fish', NULL::text),
  ('OPERATE FISH HATCHERY', 'operate-fish-hatchery', NULL::text),
  ('PRODUCE FISH FEEDS', 'produce-fish-feeds', NULL::text),
  ('PRODUCE GROW-OUT FISH', 'produce-grow-out-fish', NULL::text),
  ('SET UP FISH POND', 'set-up-fish-pond', NULL::text),
  ('SET UP SMALL-SCALE FISH HATCHERY UNIT', 'set-up-small-scale-fish-hatchery-unit', NULL::text),
  ('SETTING UP SMALL-SCALE FISH HATCHERY UNIT', 'setting-up-small-scale-fish-hatchery-unit', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: DAIRY FARM MANAGEMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-management-level-5';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BREED DAIRY ANIMALS', 'breed-dairy-animals', NULL::text),
  ('DAIRY FORAGE PRODUCTION', 'dairy-forage-production', NULL::text),
  ('DEVELOP DAIRY FARM STRUCTURES', 'develop-dairy-farm-structures', NULL::text),
  ('FEED DAIRY ANIMALS', 'feed-dairy-animals', NULL::text),
  ('FORMULATE DAIRY FEED', 'formulate-dairy-feed', NULL::text),
  ('MAINTAIN DAIRY HERD HEALTH', 'maintain-dairy-herd-health', NULL::text),
  ('MILK DAIRY ANIMALS', 'milk-dairy-animals', NULL::text),
  ('REAR DAIRY YOUNG STOCK', 'rear-dairy-young-stock', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: DAIRY PLANT MANAGEMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CHILL RAW MILK', 'chill-raw-milk', NULL::text),
  ('PROCESS CONCENTRATED MILK PRODUCTS', 'process-concentrated-milk-products', NULL::text),
  ('PROCESS FAT BASED MILK PRODUCTS', 'process-fat-based-milk-products', NULL::text),
  ('PROCESS FERMENTED MILK PRODUCTS', 'process-fermented-milk-products', NULL::text),
  ('PROCESS FLUID MILK PRODUCTS', 'process-fluid-milk-products', NULL::text),
  ('PROCURE RAW MILK', 'procure-raw-milk', NULL::text),
  ('PRODUCE CHEESE', 'produce-cheese', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-plant-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURE NURSERY MANAGEMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ESTABLISH MOTHER BLOCK', 'establish-mother-block', NULL::text),
  ('HARDEN TISSUE CULTURE SEEDLINGS', 'harden-tissue-culture-seedlings', NULL::text),
  ('PREPARE NURSERY PLANTING MEDIA', 'prepare-nursery-planting-media', NULL::text),
  ('PRODUCE GRAFTED/BUDDED SEEDLINGS', 'produce-grafted-budded-seedlings', NULL::text),
  ('PRODUCE POTTED SEEDLINGS', 'produce-potted-seedlings', NULL::text),
  ('PRODUCE VEGETABLE SEEDLINGS', 'produce-vegetable-seedlings', NULL::text),
  ('SET UP HORTICULTURAL NURSERY STRUCTURES', 'set-up-horticultural-nursery-structures', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURE PRODUCTION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-5';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE CUT FLOWERS', 'produce-cut-flowers', NULL::text),
  ('PRODUCE HERBS AND SPICES', 'produce-herbs-and-spices', NULL::text),
  ('PRODUCE HORTICULTURAL NUTS', 'produce-horticultural-nuts', NULL::text),
  ('PRODUCE MUSHROOMS', 'produce-mushrooms', NULL::text),
  ('PRODUCE ORNAMENTAL PLANTS', 'produce-ornamental-plants', NULL::text),
  ('PRODUCE SUB-TROPICAL FRUITS', 'produce-sub-tropical-fruits', NULL::text),
  ('PRODUCE TEMPERATE FRUITS', 'produce-temperate-fruits', NULL::text),
  ('PRODUCE TROPICAL FRUITS', 'produce-tropical-fruits', NULL::text),
  ('PRODUCE VEGETABLES', 'produce-vegetables', NULL::text),
  ('PRODUCE VINE FRUITS', 'produce-vine-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-5';

-- ------------------------------------------------------------------------------
-- Course: SUSTAINABLE AGRICULTURE FOR RURAL DEVELOPMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'sustainable-agriculture-for-rural-development-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'sustainable-agriculture-for-rural-development-level-5';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'sustainable-agriculture-for-rural-development-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AGRICULTURAL ENGINEERING PRINCIPLES', 'apply-agricultural-engineering-principles', NULL::text),
  ('APPLY SARD PRINCIPLES', 'apply-sard-principles', NULL::text),
  ('CLIMATE CHANGE RESILIENCE PRACTICES', 'climate-change-resilience-practices', NULL::text),
  ('CONDUCT SARD COMMUNITY DEVELOPMENT', 'conduct-sard-community-development', NULL::text),
  ('DEMONSTRATE KNOWLEDGE OF ORGANIC FARMING', 'demonstrate-knowledge-of-organic-farming', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF SCIENCE FOR SARD', 'demonstrate-understanding-of-science-for-sard', NULL::text),
  ('MANAGE AGROFORESTRY ACTIVITIES', 'manage-agroforestry-activities', NULL::text),
  ('MANAGE ANIMAL PRODUCTION', 'manage-animal-production', NULL::text),
  ('MANAGE CROP PRODUCTION', 'manage-crop-production', NULL::text),
  ('MANAGE FARM BUSINESS', 'manage-farm-business', NULL::text),
  ('MANAGE FARM CHEMICAL USE FOR SARD', 'manage-farm-chemical-use-for-sard', NULL::text),
  ('PROCESS FARM PRODUCE', 'process-farm-produce', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'sustainable-agriculture-for-rural-development-level-5';

-- ------------------------------------------------------------------------------
-- Course: AGRICULTURAL EXTENSION LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-4';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BREED LIVESTOCK', 'breed-livestock', NULL::text),
  ('ESTABLISH AGRICULTURAL CROPS', 'establish-agricultural-crops', NULL::text),
  ('FEED THE LIVESTOCK', 'feed-the-livestock', NULL::text),
  ('HARVEST THE CROP', 'harvest-the-crop', NULL::text),
  ('KEEP FARM RECORDS', 'keep-farm-records', NULL::text),
  ('MAINTAIN LIVESTOCK HEALTH', 'maintain-livestock-health', NULL::text),
  ('PERFORM CROP PROTECTION', 'perform-crop-protection', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-extension-level-4';

-- ------------------------------------------------------------------------------
-- Course: AGRICULTURAL MACHINERY AND EQUIPMENT LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-level-4';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY ENGINEERING SCIENCE PRINCIPLES', 'apply-engineering-science-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('TECHNICAL DRAWING', 'technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-level-4';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL SKILLS IN AGRICULTURAL SYSTEMS', 'apply-digital-skills-in-agricultural-systems', NULL::text),
  ('CALIBRATE FIELD EQUIPMENT', 'calibrate-field-equipment', NULL::text),
  ('MAINTAIN AGRICULTURAL PNEUMATIC SYSTEMS', 'maintain-agricultural-pneumatic-systems', NULL::text),
  ('MAINTAIN HYDRAULIC SYSTEMS', 'maintain-hydraulic-systems', NULL::text),
  ('OPERATE AND MAINTAIN FARM TRACTOR', 'operate-and-maintain-farm-tractor', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agricultural-machinery-and-equipment-level-4';

-- ------------------------------------------------------------------------------
-- Course: AGRIPRENEURSHIP LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP AGRI-ENTERPRISE BUSINESS PLAN', 'develop-agri-enterprise-business-plan', NULL::text),
  ('MARKET AGRICULTURAL PRODUCTS AND SERVICES', 'market-agricultural-products-and-services', NULL::text),
  ('MARKET AGRICULTURAL PRODUCTS AND SERVICES ONLINE', 'market-agricultural-products-and-services-online', NULL::text),
  ('OPERATE A SMALL AGRI-ENTERPRISE', 'operate-a-small-agri-enterprise', NULL::text),
  ('SUPERVISE AGRIPRENEURAL OPERATIONS', 'supervise-agripreneural-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agripreneurship-level-4';

-- ------------------------------------------------------------------------------
-- Course: AQUACULTURE TECHNICIAN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-technician-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-technician-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-technician-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSTRUCT A FISH POND', 'construct-a-fish-pond', NULL::text),
  ('HANDLE HARVESTED FISH', 'handle-harvested-fish', NULL::text),
  ('OPERATE FISH HATCHERY', 'operate-fish-hatchery', NULL::text),
  ('PRODUCE FISH FEEDS', 'produce-fish-feeds', NULL::text),
  ('PRODUCE GROW-OUT FISH', 'produce-grow-out-fish', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'aquaculture-technician-level-4';

-- ------------------------------------------------------------------------------
-- Course: DAIRY FARM MANAGER LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-manager-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-manager-level-4';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-manager-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BREED DAIRY ANIMALS', 'breed-dairy-animals', NULL::text),
  ('DEVELOP DAIRY FARM STRUCTURES', 'develop-dairy-farm-structures', NULL::text),
  ('FEED DAIRY ANIMALS', 'feed-dairy-animals', NULL::text),
  ('FORMULATE DAIRY FEED', 'formulate-dairy-feed', NULL::text),
  ('MAINTAIN DAIRY HERD HEALTH', 'maintain-dairy-herd-health', NULL::text),
  ('MILK DAIRY ANIMALS', 'milk-dairy-animals', NULL::text),
  ('PRODUCE DAIRY FORAGE', 'produce-dairy-forage', NULL::text),
  ('REAR DAIRY YOUNG STOCK', 'rear-dairy-young-stock', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-manager-level-4';

-- ------------------------------------------------------------------------------
-- Course: DAIRY PROCESSING LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-processing-level-4';

-- Section 2: Core Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COLLECT RAW MILK', 'collect-raw-milk', NULL::text),
  ('PACKAGE MILK PRODUCTS', 'package-milk-products', NULL::text),
  ('PROCESS PASTEURIZED MILK', 'process-pasteurized-milk', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-processing-level-4';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURE NURSERY MANAGEMENT LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-4';

-- Section 2: Core Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PREPARE NURSERY PLANTING MEDIA', 'prepare-nursery-planting-media', NULL::text),
  ('PRODUCE VEGETABLE SEEDLINGS', 'produce-vegetable-seedlings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-nursery-management-level-4';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURE PRODUCTION LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-4';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE CUT FLOWERS', 'produce-cut-flowers', NULL::text),
  ('PRODUCE HERBS AND SPICES', 'produce-herbs-and-spices', NULL::text),
  ('PRODUCE HORTICULTURAL NUTS', 'produce-horticultural-nuts', NULL::text),
  ('PRODUCE MUSHROOM', 'produce-mushroom', NULL::text),
  ('PRODUCE ORNAMENTAL PLANTS', 'produce-ornamental-plants', NULL::text),
  ('PRODUCE SUB-TROPICAL FRUITS', 'produce-sub-tropical-fruits', NULL::text),
  ('PRODUCE TEMPERATE FRUITS', 'produce-temperate-fruits', NULL::text),
  ('PRODUCE TROPICAL FRUITS', 'produce-tropical-fruits', NULL::text),
  ('PRODUCE VEGETABLE CROPS', 'produce-vegetable-crops', NULL::text),
  ('PRODUCE VINE FRUITS', 'produce-vine-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticulture-production-level-4';

-- ------------------------------------------------------------------------------
-- Course: DAIRY FARM MANAGER LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-manager-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BREED DAIRY ANIMALS', 'breed-dairy-animals', NULL::text),
  ('DEVELOP DAIRY FARM STRUCTURES', 'develop-dairy-farm-structures', NULL::text),
  ('FEED DAIRY ANIMALS', 'feed-dairy-animals', NULL::text),
  ('FORMULATE DAIRY FEED', 'formulate-dairy-feed', NULL::text),
  ('MAINTAIN DAIRY HERD HEALTH', 'maintain-dairy-herd-health', NULL::text),
  ('MILK DAIRY ANIMALS', 'milk-dairy-animals', NULL::text),
  ('PRODUCE DAIRY FORAGE', 'produce-dairy-forage', NULL::text),
  ('REAR DAIRY YOUNG STOCK', 'rear-dairy-young-stock', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'dairy-farm-manager-level-3';

-- ------------------------------------------------------------------------------
-- Course: HORTICULTURAL CROPS PRODUCER LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-crops-producer-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PRODUCE CUT FLOWERS', 'produce-cut-flowers', NULL::text),
  ('PRODUCE HERBS AND SPICES', 'produce-herbs-and-spices', NULL::text),
  ('PRODUCE HORTICULTURAL NUTS', 'produce-horticultural-nuts', NULL::text),
  ('PRODUCE MUSHROOMS', 'produce-mushrooms', NULL::text),
  ('PRODUCE ORNAMENTAL PLANTS', 'produce-ornamental-plants', NULL::text),
  ('PRODUCE SUB-TROPICAL FRUITS', 'produce-sub-tropical-fruits', NULL::text),
  ('PRODUCE TEMPERATE FRUITS', 'produce-temperate-fruits', NULL::text),
  ('PRODUCE TROPICAL FRUITS', 'produce-tropical-fruits', NULL::text),
  ('PRODUCE VEGETABLES', 'produce-vegetables', NULL::text),
  ('PRODUCE VINE FRUITS', 'produce-vine-fruits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'horticultural-crops-producer-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: APPLIED SCIENCE DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 10 | Total Units: 180
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: APPLIED SCIENCE DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'APPLIED SCIENCE DEPARTMENT', 'applied-science-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Applied Science courses in Analytical Chemistry, Applied Biology, Statistics, Chemical Engineering, and Medical Engineering.', 2
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department'
);

-- 4. Insert Non-Modular Courses under APPLIED SCIENCE DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ANALYTICAL CHEMISTRY LEVEL 6', 'analytical-chemistry-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'APPLIED BIOLOGY LEVEL 6', 'applied-biology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'APPLIED STATISTICS TECHNICIAN LEVEL 6', 'applied-statistics-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CHEMICAL ENGINEERING TECHNICIAN LEVEL 6', 'chemical-engineering-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ENVIRONMENTAL MANAGER LEVEL 6', 'environmental-manager-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LIBRARY AND INFORMATION SCIENCE LEVEL 6', 'library-and-information-science-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MEDICAL ENGINEERING TECHNOLOGIST LEVEL 6', 'medical-engineering-technologist-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ENVIRONMENTAL MANAGEMENT LEVEL 5', 'environmental-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LIBRARY AND INFORMATION SCIENCE LEVEL 5', 'library-and-information-science-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MEDICAL ENGINEERING LEVEL 5', 'medical-engineering-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ANALYTICAL CHEMISTRY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-level-6';

-- Section 2: Core Units of Competency (14 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ANALYSE AND INTERPRET ANALYTICAL CHEMISTRY DATA', 'analyse-and-interpret-analytical-chemistry-data', NULL::text),
  ('APPLY ANALYTICAL CHEMISTRY RESEARCH', 'apply-analytical-chemistry-research', NULL::text),
  ('APPLY INORGANIC CHEMISTRY', 'apply-inorganic-chemistry', NULL::text),
  ('APPLY ORGANIC CHEMISTRY', 'apply-organic-chemistry', NULL::text),
  ('APPLY PHYSICAL CHEMISTRY', 'apply-physical-chemistry', NULL::text),
  ('APPLY PHYSICS PRINCIPLES', 'apply-physics-principles', NULL::text),
  ('APPLY STANDARD LABORATORY PRACTICES', 'apply-standard-laboratory-practices', NULL::text),
  ('APPLY STATISTICAL METHODS', 'apply-statistical-methods', NULL::text),
  ('COLLECT AND PREPARE ANALYTICAL CHEMISTRY SAMPLES', 'collect-and-prepare-analytical-chemistry-samples', NULL::text),
  ('DEVELOP STANDARD OPERATING TEST PROCEDURE', 'develop-standard-operating-test-procedure', NULL::text),
  ('MANAGE ANALYTICAL CHEMISTRY LABORATORY, REAGENTS AND INSTRUMENTS', 'manage-analytical-chemistry-laboratory-reagents-and-instruments', NULL::text),
  ('MANAGE ANALYTICAL CHEMISTRY SAMPLES', 'manage-analytical-chemistry-samples', NULL::text),
  ('PERFORM ANALYTICAL CHEMISTRY TECHNIQUES', 'perform-analytical-chemistry-techniques', NULL::text),
  ('PERFORM ANALYTICAL CHEMISTRY TESTS PROCEDURES', 'perform-analytical-chemistry-tests-procedures', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-level-6';

-- ------------------------------------------------------------------------------
-- Course: APPLIED BIOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-biology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-biology-level-6';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-biology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT MICROSCOPY', 'carry-out-microscopy', NULL::text),
  ('CONDUCT LABORATORY RESEARCH', 'conduct-laboratory-research', NULL::text),
  ('LABORATORY PRACTICE', 'laboratory-practice', NULL::text),
  ('PERFORM ANATOMY AND PHYSIOLOGY STUDIES', 'perform-anatomy-and-physiology-studies', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-biology-level-6';

-- Section 3: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-biology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BIOCHEMICAL TECHNIQUES', 'apply-biochemical-techniques', NULL::text),
  ('APPLY ENTOMOLOGICAL TECHNIQUES', 'apply-entomological-techniques', NULL::text),
  ('APPLY HERBARIUM, MUSEUM, AQUARIUM AND VIVARIUM TECHNIQUES', 'apply-herbarium-museum-aquarium-and-vivarium-techniques', NULL::text),
  ('CARRY OUT ANIMAL HUSBANDRY', 'carry-out-animal-husbandry', NULL::text),
  ('CARRY OUT CYTOLOGICAL AND HISTOLOGICAL TECHNIQUES', 'carry-out-cytological-and-histological-techniques', NULL::text),
  ('CARRY OUT ECOLOGICAL AND SOIL STUDIES', 'carry-out-ecological-and-soil-studies', NULL::text),
  ('CARRY OUT MICROBIOLOGICAL TECHNIQUES', 'carry-out-microbiological-techniques', NULL::text),
  ('CARRY OUT PARASITOLOGICAL TECHNIQUES', 'carry-out-parasitological-techniques', NULL::text),
  ('CARRY OUT PLANT HUSBANDRY', 'carry-out-plant-husbandry', NULL::text),
  ('PERFORM IMMUNOLOGICAL TECHNIQUES', 'perform-immunological-techniques', NULL::text),
  ('PERFORM TAXONOMIC STUDIES', 'perform-taxonomic-studies', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-biology-level-6';

-- ------------------------------------------------------------------------------
-- Course: APPLIED STATISTICS TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-statistics-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-statistics-technician-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-statistics-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MATHEMATICS FOR STATISTICS', 'apply-mathematics-for-statistics', NULL::text),
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('APPLY STATISTICAL TECHNIQUES', 'apply-statistical-techniques', NULL::text),
  ('DEVELOP DATABASE MANAGEMENT SYSTEMS', 'develop-database-management-systems', NULL::text),
  ('MANAGE STATISTICAL DATA', 'manage-statistical-data', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-statistics-technician-level-6';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-statistics-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('COLLECT AND MANAGE RESEARCH DATA', 'collect-and-manage-research-data', NULL::text),
  ('DESIGN RESEARCH EXPERIMENTS', 'design-research-experiments', NULL::text),
  ('DEVELOP RESEARCH CONCEPTS', 'develop-research-concepts', NULL::text),
  ('IMPROVE PROCESS QUALITY', 'improve-process-quality', NULL::text),
  ('PERFORM DESCRIPTIVE DATA ANALYSIS', 'perform-descriptive-data-analysis', NULL::text),
  ('PERFORM INFERENTIAL DATA ANALYSIS', 'perform-inferential-data-analysis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'applied-statistics-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: CHEMICAL ENGINEERING TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'chemical-engineering-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'chemical-engineering-technician-level-6';

-- Section 2: Common Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'chemical-engineering-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY CHEMICAL SCIENCE', 'apply-chemical-science', NULL::text),
  ('APPLY ELECTRICAL SCIENCE', 'apply-electrical-science', NULL::text),
  ('APPLY MATHEMATICAL SKILLS', 'apply-mathematical-skills', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'chemical-engineering-technician-level-6';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'chemical-engineering-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('AUDIT PRODUCTION PROCESS', 'audit-production-process', NULL::text),
  ('MAINTAIN ENVIRONMENTAL HEALTH AND SAFETY (EHS) STANDARDS', 'maintain-environmental-health-and-safety-ehs-standards', NULL::text),
  ('MAINTAIN PRODUCTION LINE EQUIPMENT', 'maintain-production-line-equipment', NULL::text),
  ('OPERATE PROCESS EQUIPMENT', 'operate-process-equipment', NULL::text),
  ('PERFORM PROCESS CONTROL AND OPTIMIZATION', 'perform-process-control-and-optimization', NULL::text),
  ('PERFORM PROCESS QUALITY CONTROL', 'perform-process-quality-control', NULL::text),
  ('PREPARE PROCESS RAW MATERIALS', 'prepare-process-raw-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'chemical-engineering-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: ENVIRONMENTAL MANAGER LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-manager-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-manager-level-6';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-manager-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC PRINCIPLES OF ENVIRONMENT', 'apply-basic-principles-of-environment', NULL::text),
  ('APPLY ENVIRONMENTAL INFORMATION SYSTEMS.', 'apply-environmental-information-systems', NULL::text),
  ('APPLY PRINCIPLES OF ENVIRONMENTAL ECONOMICS', 'apply-principles-of-environmental-economics', NULL::text),
  ('APPLY PRINCIPLES OF ENVIRONMENTAL TOXICOLOGY', 'apply-principles-of-environmental-toxicology', NULL::text),
  ('CARRY OUT ENVIRONMENTAL ANALYTICAL TECHNIQUES', 'carry-out-environmental-analytical-techniques', NULL::text),
  ('PERFORM ENVIRONMENTAL LABORATORY PRACTICE', 'perform-environmental-laboratory-practice', NULL::text),
  ('PERFORM ENVIRONMENTAL MICROBIOLOGICAL TECHNIQUES', 'perform-environmental-microbiological-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-manager-level-6';

-- ------------------------------------------------------------------------------
-- Course: LIBRARY AND INFORMATION SCIENCE LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'library-and-information-science-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'library-and-information-science-level-6';

-- Section 2: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'library-and-information-science-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ANALYZE INFORMATION RESOURCES', 'analyze-information-resources', NULL::text),
  ('CONSERVE AND PRESERVE LIBRARY MATERIALS', 'conserve-and-preserve-library-materials', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF PUBLISHING AND BOOK TRADE', 'demonstrate-understanding-of-publishing-and-book-trade', NULL::text),
  ('MANAGE LIBRARY AND INFORMATION MANAGEMENT SYSTEMS', 'manage-library-and-information-management-systems', NULL::text),
  ('MANAGE RECORDS AND INFORMATION', 'manage-records-and-information', NULL::text),
  ('PERFORM CATALOGUING ACTIVITIES', 'perform-cataloguing-activities', NULL::text),
  ('PROVIDE SUBJECT ACCESS', 'provide-subject-access', NULL::text),
  ('SEARCH LIBRARY AND INFORMATION DATABASE', 'search-library-and-information-database', NULL::text),
  ('USE INTEGRATED MANAGEMENT SYSTEMS', 'use-integrated-management-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'library-and-information-science-level-6';

-- ------------------------------------------------------------------------------
-- Course: MEDICAL ENGINEERING TECHNOLOGIST LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'medical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'medical-engineering-technologist-level-6';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'medical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('MANAGE HOSPITAL ORGANIZATION AND MAINTENANCE', 'manage-hospital-organization-and-maintenance', NULL::text),
  ('OPERATE AND MAINTAIN DENTAL EQUIPMENT', 'operate-and-maintain-dental-equipment', NULL::text),
  ('OPERATE AND MAINTAIN I.C.U EQUIPMENT', 'operate-and-maintain-i-c-u-equipment', NULL::text),
  ('OPERATE AND MAINTAIN LABORATORY AND DIAGNOSTIC EQUIPMENT', 'operate-and-maintain-laboratory-and-diagnostic-equipment', NULL::text),
  ('OPERATE AND MAINTAIN MATERNITY EQUIPMENT', 'operate-and-maintain-maternity-equipment', NULL::text),
  ('OPERATE AND MAINTAIN MEDICAL IMAGING EQUIPMENT', 'operate-and-maintain-medical-imaging-equipment', NULL::text),
  ('OPERATE AND MAINTAIN OPERATION THEATRE EQUIPMENT', 'operate-and-maintain-operation-theatre-equipment', NULL::text),
  ('OPERATE AND MAINTAIN OPHTHALMIC AND AUDIOLOGY EQUIPMENT', 'operate-and-maintain-ophthalmic-and-audiology-equipment', NULL::text),
  ('OPERATE AND MAINTAIN PHYSIOTHERAPY EQUIPMENT', 'operate-and-maintain-physiotherapy-equipment', NULL::text),
  ('OPERATE AND MAINTAIN RENAL EQUIPMENT', 'operate-and-maintain-renal-equipment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'medical-engineering-technologist-level-6';

-- ------------------------------------------------------------------------------
-- Course: ENVIRONMENTAL MANAGEMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-management-level-5';

-- Section 2: Common Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC PRINCIPLES OF ENVIRONMENT', 'apply-basic-principles-of-environment', NULL::text),
  ('ASSESS ENVIRONMENTAL AND SOCIAL IMPACT', 'assess-environmental-and-social-impact', NULL::text),
  ('BUILD CAPACITY FOR COMMUNITY DEVELOPMENT', 'build-capacity-for-community-development', NULL::text),
  ('CONDUCT PROJECT RESEARCH', 'conduct-project-research', NULL::text),
  ('MANAGE CLIMATE CHANGE AND GLOBAL WARMING', 'manage-climate-change-and-global-warming', NULL::text),
  ('PERFORM SAFETY AND SURVIVAL TECHNIQUES', 'perform-safety-and-survival-techniques', NULL::text),
  ('PLAN AND MANAGE LAND USE', 'plan-and-manage-land-use', NULL::text),
  ('PLAN AND MANAGE PROJECTS', 'plan-and-manage-projects', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-management-level-5';

-- Section 3: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENVIRONMENTAL LAW', 'apply-environmental-law', NULL::text),
  ('MANAGE DISASTER AND RISK', 'manage-disaster-and-risk', NULL::text),
  ('MANAGE ENERGY RESOURCES', 'manage-energy-resources', NULL::text),
  ('MANAGE ENVIRONMENTAL POLLUTION AND WASTE', 'manage-environmental-pollution-and-waste', NULL::text),
  ('MANAGE FISHERIES RESOURCES', 'manage-fisheries-resources', NULL::text),
  ('MANAGE FOREST RESOURCES', 'manage-forest-resources', NULL::text),
  ('MANAGE GREENHOUSES', 'manage-greenhouses', NULL::text),
  ('MANAGE MARINE AND WETLAND RESOURCES', 'manage-marine-and-wetland-resources', NULL::text),
  ('MANAGE RANGELAND AND WILDLIFE RESOURCES', 'manage-rangeland-and-wildlife-resources', NULL::text),
  ('MANAGE WATER RESOURCES', 'manage-water-resources', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'environmental-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: LIBRARY AND INFORMATION SCIENCE LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'library-and-information-science-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'library-and-information-science-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'library-and-information-science-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INFORMATION RESOURCES', 'maintain-information-resources', NULL::text),
  ('MAINTAIN SCHOOL LIBRARIES, MEDIA AND DOCUMENTATION CENTRES', 'maintain-school-libraries-media-and-documentation-centres', NULL::text),
  ('PERFORM CATALOGUING PROCESS', 'perform-cataloguing-process', NULL::text),
  ('PERFORM INFORMATION AND RECORDKEEPING PRACTICE', 'perform-information-and-recordkeeping-practice', NULL::text),
  ('SEARCH LIBRARY INFORMATION AND DATABASE', 'search-library-information-and-database', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'library-and-information-science-level-5';

-- ------------------------------------------------------------------------------
-- Course: MEDICAL ENGINEERING LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'medical-engineering-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'medical-engineering-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'medical-engineering-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OPERATE AND MAINTAIN DENTAL EQUIPMENT', 'operate-and-maintain-dental-equipment', NULL::text),
  ('OPERATE AND MAINTAIN LABORATORY AND DIAGNOSTIC EQUIPMENT', 'operate-and-maintain-laboratory-and-diagnostic-equipment', NULL::text),
  ('OPERATE AND MAINTAIN MATERNITY EQUIPMENT', 'operate-and-maintain-maternity-equipment', NULL::text),
  ('OPERATE AND MAINTAIN MEDICAL IMAGING EQUIPMENT', 'operate-and-maintain-medical-imaging-equipment', NULL::text),
  ('OPERATE AND MAINTAIN OPERATION THEATRE EQUIPMENT', 'operate-and-maintain-operation-theatre-equipment', NULL::text),
  ('OPERATE AND MAINTAIN REFRIGERATION AND AIR CONDITIONING EQUIPMENT', 'operate-and-maintain-refrigeration-and-air-conditioning-equipment', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWING', 'prepare-and-interpret-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department' AND c.slug = 'medical-engineering-level-5';


-- ==============================================================================
-- SEED SCRIPT FOR: BUILDING AND CIVIL ENGINEERING DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 20 | Total Units: 336
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: BUILDING AND CIVIL ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUILDING AND CIVIL ENGINEERING DEPARTMENT', 'building-and-civil-engineering-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Building and Civil Engineering courses in Architecture, Civil Engineering, Quantity Surveying, Plumbing, and Masonry.', 3
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department'
);

-- 4. Insert Non-Modular Courses under BUILDING AND CIVIL ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARCHITECTURAL TECHNOLOGY LEVEL 6', 'architectural-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING TECHNOLOGY LEVEL 6', 'building-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CIVIL ENGINEERING LEVEL 6', 'civil-engineering-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INTERIOR DESIGN LEVEL 6', 'interior-design-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LAND SURVEYING LEVEL 6', 'land-surveying-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'QUANTITY SURVEYING LEVEL 6', 'quantity-surveying-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARCHITECTURAL DRAFTSMANSHIP LEVEL 5', 'architectural-draftsmanship-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING TECHNOLOGY LEVEL 5', 'building-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTRY AND JOINERY LEVEL 5', 'carpentry-and-joinery-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INTERIOR DESIGN LEVEL 5', 'interior-design-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LAND SURVEY AND MAPPING LEVEL 5', 'land-survey-and-mapping-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 5', 'plumbing-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING ARTISAN (MASONRY) LEVEL 4', 'building-artisan-masonry-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTERY AND JOINERY LEVEL 4', 'carpentery-and-joinery-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTRY AND JOINERY LEVEL 4', 'carpentry-and-joinery-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CONSTRUCTION SURVEY LEVEL 4', 'construction-survey-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INTERIOR DESIGN LEVEL 4', 'interior-design-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MASONRY LEVEL 4', 'masonry-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 4', 'plumbing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 3', 'plumbing-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ARCHITECTURAL TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';

-- Section 2: Common Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BUILDING MATERIALS SCIENCE', 'apply-building-materials-science', NULL::text),
  ('APPLY HISTORY OF ARCHITECTURE.', 'apply-history-of-architecture', NULL::text),
  ('APPLY MATHEMATICAL SKILLS', 'apply-mathematical-skills', NULL::text),
  ('APPLY PRINCIPLES OF BUILDING TECHNOLOGY AND SERVICES', 'apply-principles-of-building-technology-and-services', NULL::text),
  ('APPLY PRINCIPLES OF STRUCTURAL DESIGN', 'apply-principles-of-structural-design', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';

-- Section 3: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ALTERNATIVE BUILDING TECHNOLOGY', 'apply-alternative-building-technology', NULL::text),
  ('COST ARCHITECTURAL PROJECTS', 'cost-architectural-projects', NULL::text),
  ('DESIGN AND DETAIL ARCHITECTURAL PROJECTS', 'design-and-detail-architectural-projects', NULL::text),
  ('INSTALL BUILDING FINISHES AND FITTINGS', 'install-building-finishes-and-fittings', NULL::text),
  ('LANDSCAPE ARCHITECTURAL PROJECTS', 'landscape-architectural-projects', NULL::text),
  ('MANAGE CONSTRUCTION SITE', 'manage-construction-site', NULL::text),
  ('PRODUCE ARCHITECTURAL MODELS', 'produce-architectural-models', NULL::text),
  ('PRODUCE ARCHITECTURAL PERSPECTIVES', 'produce-architectural-perspectives', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUILDING TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BUILDING MATERIALS SCIENCE', 'apply-building-materials-science', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';

-- Section 3: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('EXECUTE BUILDING EXTERNAL WORKS', 'execute-building-external-works', NULL::text),
  ('EXECUTE BUILDING FINISHES', 'execute-building-finishes', NULL::text),
  ('EXECUTE BUILDING TEMPORARY WORKS', 'execute-building-temporary-works', NULL::text),
  ('EXECUTE SITE PRELIMINARY WORKS', 'execute-site-preliminary-works', NULL::text),
  ('EXECUTE SUBSTRUCTURE WORKS', 'execute-substructure-works', NULL::text),
  ('EXECUTE SUPERSTRUCTURE WORKS', 'execute-superstructure-works', NULL::text),
  ('INSTALL BUILDING DOORS AND WINDOWS', 'install-building-doors-and-windows', NULL::text),
  ('INSTALL BUILDING SERVICES', 'install-building-services', NULL::text),
  ('MANAGE CONSTRUCTION MATERIALS, PLANT, TOOLS AND EQUIPMENT', 'manage-construction-materials-plant-tools-and-equipment', NULL::text),
  ('PRODUCE BUILDING DRAWINGS', 'produce-building-drawings', NULL::text),
  ('PRODUCE MASONRY UNITS', 'produce-masonry-units', NULL::text),
  ('SUPERVISE A CONSTRUCTION PROJECT', 'supervise-a-construction-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: CIVIL ENGINEERING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MATHEMATICAL SKILLS', 'apply-mathematical-skills', NULL::text),
  ('APPLY WATER RESOURCE, WATER AND SANITATION SERVICES MANAGEMENT PRINCIPLES', 'apply-water-resource-water-and-sanitation-services-management-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PERFORM MEASUREMENT OF WORKS AND COST ESTIMATION', 'perform-measurement-of-works-and-cost-estimation', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Section 3: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY WATER AND WASTEWATER TECHNOLOGY LEVEL 6', 'apply-water-and-wastewater-technology-level-6', NULL::text),
  ('CARRY OUT BUILDING WORKS', 'carry-out-building-works', NULL::text),
  ('CARRY OUT ROAD CONSTRUCTION WORKS', 'carry-out-road-construction-works', NULL::text),
  ('CONDUCT MATERIAL TESTING', 'conduct-material-testing', NULL::text),
  ('CONSTRUCT ON-SITE SANITATION FACILITIES', 'construct-on-site-sanitation-facilities', NULL::text),
  ('CONSTRUCT WASTE WATER INFRASTRUCTURE', 'construct-waste-water-infrastructure', NULL::text),
  ('DESIGN BASIC PAVEMENT STRUCTURES', 'design-basic-pavement-structures', NULL::text),
  ('DESIGN ENGINEERING STRUCTURES.', 'design-engineering-structures', NULL::text),
  ('DESIGN ONSITE SANITATION FACILITIES', 'design-onsite-sanitation-facilities', NULL::text),
  ('MANAGE CIVIL ENGINEERING PROJECTS', 'manage-civil-engineering-projects', NULL::text),
  ('MANAGE WATER RESOURCES QUALITY', 'manage-water-resources-quality', NULL::text),
  ('O DESIGN WASTEWATER COLLECTION AND TREATMENT INFRASTRUCTURE', 'o-design-wastewater-collection-and-treatment-infrastructure', NULL::text),
  ('PERFORM HIGHWAY SURVEY', 'perform-highway-survey', NULL::text),
  ('PERFORM STRUCTURAL DESIGN AND ANALYSIS', 'perform-structural-design-and-analysis', NULL::text),
  ('PRODUCE BUILDING DRAWINGS', 'produce-building-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- ------------------------------------------------------------------------------
-- Course: INTERIOR DESIGN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-6';

-- Section 2: Core Units of Competency (16 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN FUNDAMENTALS', 'apply-design-fundamentals', NULL::text),
  ('APPLYING BUILDING MATERIALS SCIENCE', 'applying-building-materials-science', NULL::text),
  ('COMMUNICATE INTERIOR DESIGN', 'communicate-interior-design', NULL::text),
  ('CONCEPTUALIZE INTERIOR DESIGN', 'conceptualize-interior-design', NULL::text),
  ('CONSTRUCT BUILDING ELEMENTS AND COMPONENTS', 'construct-building-elements-and-components', NULL::text),
  ('CREATE INTERIOR DESIGN STYLES', 'create-interior-design-styles', NULL::text),
  ('DEMONSTRATE COLOUR THEORY', 'demonstrate-colour-theory', NULL::text),
  ('DEMONSTRATE UNDERSTANDING INFORMATION COMMUNICATION TECHNOLOGY', 'demonstrate-understanding-information-communication-technology', NULL::text),
  ('DESIGN ACOUSTICS INTERIOR SPACE', 'design-acoustics-interior-space', NULL::text),
  ('DEVELOP INTERIOR FURNITURE AND FIXTURES', 'develop-interior-furniture-and-fixtures', NULL::text),
  ('INTERIOR DESIGN COSTING', 'interior-design-costing', NULL::text),
  ('MANAGE INTERIOR DESIGN PROJECTS', 'manage-interior-design-projects', NULL::text),
  ('MANAGE INTERIOR FITTINGS AND ACCESSORIES', 'manage-interior-fittings-and-accessories', NULL::text),
  ('PERFORM INTERIOR DESIGN LIGHTING', 'perform-interior-design-lighting', NULL::text),
  ('PERFORM INTERIOR DESIGN SOFT FURNISHING', 'perform-interior-design-soft-furnishing', NULL::text),
  ('PERFORM INTERIOR FINISHING', 'perform-interior-finishing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-6';

-- ------------------------------------------------------------------------------
-- Course: LAND SURVEYING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';

-- Section 2: Common Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY LAND LAWS', 'apply-land-laws', NULL::text),
  ('APPLY PRINCIPLES OF GIS', 'apply-principles-of-gis', NULL::text),
  ('APPLY PRINCIPLES OF PHOTOGRAMMETRY AND REMOTE SENSING', 'apply-principles-of-photogrammetry-and-remote-sensing', NULL::text),
  ('CONDUCT CADASTRAL SURVEY', 'conduct-cadastral-survey', NULL::text),
  ('OPERATE SURVEY INSTRUMENTS', 'operate-survey-instruments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONDUCT CADASTRAL SURVEY', 'conduct-cadastral-survey-part-3', 'conduct-cadastral-survey'),
  ('CONDUCT ENGINEERING SURVEY', 'conduct-engineering-survey', NULL::text),
  ('CONDUCT HYDROGRAPHIC SURVEY', 'conduct-hydrographic-survey', NULL::text),
  ('CONDUCT MINING SURVEY', 'conduct-mining-survey', NULL::text),
  ('CONDUCT TOPOGRAPHICAL SURVEY', 'conduct-topographical-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';

-- ------------------------------------------------------------------------------
-- Course: QUANTITY SURVEYING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONDUCT ENGINEERING SURVEY', 'conduct-engineering-survey', NULL::text),
  ('EXECUTE CONSTRUCTION WORKS', 'execute-construction-works', NULL::text),
  ('MANAGE CONSTRUCTION PROJECT FINANCE', 'manage-construction-project-finance', NULL::text),
  ('MANAGE PROJECT CONTRACTS', 'manage-project-contracts', NULL::text),
  ('PREPARE BILLS OF QUANTITIES', 'prepare-bills-of-quantities', NULL::text),
  ('PRODUCE BUILDING DRAWINGS', 'produce-building-drawings', NULL::text),
  ('PRODUCE CIVIL ENGINEERING DRAWINGS', 'produce-civil-engineering-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';

-- ------------------------------------------------------------------------------
-- Course: ARCHITECTURAL DRAFTSMANSHIP LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MATHEMATICAL SKILLS', 'apply-mathematical-skills', NULL::text),
  ('APPLY PRINCIPLES OF BUILDING TECHNOLOGY', 'apply-principles-of-building-technology', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APLLY HISTORY OF ARCHITECTURE', 'aplly-history-of-architecture', NULL::text),
  ('DETAIL ARCHITECTURAL PROJECTS', 'detail-architectural-projects', NULL::text),
  ('INSTALL BUILDING FINISHES AND FITTINGS', 'install-building-finishes-and-fittings', NULL::text),
  ('PRODUCE ARCHITECTURAL MODELS', 'produce-architectural-models', NULL::text),
  ('PRODUCE ARCHITECTURAL PERSPECTIVES', 'produce-architectural-perspectives', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';

-- ------------------------------------------------------------------------------
-- Course: BUILDING TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Section 2: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENTIFIC PRINCIPLES', 'apply-scientific-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Section 3: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONSTRUCT ROOF STRUCTURE', 'construct-roof-structure', NULL::text),
  ('EXECUTE BUILDING EXTERNAL WORKS', 'execute-building-external-works', NULL::text),
  ('EXECUTE BUILDING SUBSTRUCTURE WORKS', 'execute-building-substructure-works', NULL::text),
  ('EXECUTE BUILDING SUPERSTRUCTURE WORKS', 'execute-building-superstructure-works', NULL::text),
  ('INSTALL DOORS AND WINDOWS', 'install-doors-and-windows', NULL::text),
  ('PERFORM BUILDING FINISHES', 'perform-building-finishes', NULL::text),
  ('PERFORM SITE PRELIMINARY WORKS', 'perform-site-preliminary-works', NULL::text),
  ('SUPERVISE CONSTRUCTION PROJECT', 'supervise-construction-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: CARPENTRY AND JOINERY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENCE', 'apply-science', NULL::text),
  ('EXECUTE TEMPORARY WORKS', 'execute-temporary-works', NULL::text),
  ('MANAGE SITES AND WORKSHOPS', 'manage-sites-and-workshops', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONSTRUCT & ERECT TIMBER FLOORS AND PREFABRICATED BUILDINGS', 'construct-and-erect-timber-floors-and-prefabricated-buildings', NULL::text),
  ('CONSTRUCT AND ERECT ROOF STRUCTURES', 'construct-and-erect-roof-structures', NULL::text),
  ('CONSTRUCT DOORS AND DOOR FRAMES', 'construct-doors-and-door-frames', NULL::text),
  ('CONSTRUCT FURNITURE ITEMS', 'construct-furniture-items', NULL::text),
  ('CONSTRUCT TIMBER STAIRS', 'construct-timber-stairs', NULL::text),
  ('CONSTRUCT WINDOWS AND WINDOW FRAMES', 'construct-windows-and-window-frames', NULL::text),
  ('PERFORM JOINER’S SECOND FIXING', 'perform-joiner-s-second-fixing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- ------------------------------------------------------------------------------
-- Course: INTERIOR DESIGN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN FUNDAMENTALS', 'apply-design-fundamentals', NULL::text),
  ('CONCEPTUALIZE INTERIOR DESIGN', 'conceptualize-interior-design', NULL::text),
  ('CONSTRUCT BUILDING ELEMENTS AND COMPONENTS', 'construct-building-elements-and-components', NULL::text),
  ('DEVELOP INTERIOR FURNITURE AND FITTINGS', 'develop-interior-furniture-and-fittings', NULL::text),
  ('PERFORM INTERIOR DESIGN DRAWINGS', 'perform-interior-design-drawings', NULL::text),
  ('PERFORM INTERIOR DESIGN FINISHING', 'perform-interior-design-finishing', NULL::text),
  ('PERFORM INTERIOR DESIGN SOFT FURNISHING AND ACCESSORIES', 'perform-interior-design-soft-furnishing-and-accessories', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-5';

-- ------------------------------------------------------------------------------
-- Course: LAND SURVEY AND MAPPING LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-and-mapping-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-and-mapping-level-5';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-and-mapping-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('CONDUCT ENGINEERING SURVEY', 'conduct-engineering-survey', NULL::text),
  ('CONDUCT TOPOGRAPHICAL SURVEY', 'conduct-topographical-survey', NULL::text),
  ('OPERATE SURVEY INSTRUMENTS', 'operate-survey-instruments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-and-mapping-level-5';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Section 2: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENTIFIC PRINCIPLES', 'apply-scientific-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM', 'install-drainage-system', NULL::text),
  ('INSTALL FIRE CONTROL SYSTEMS', 'install-fire-control-systems', NULL::text),
  ('INSTALL RAINWATER HARVESTING AND DISPOSAL', 'install-rainwater-harvesting-and-disposal', NULL::text),
  ('INSTALL SANITARY APPLIANCE', 'install-sanitary-appliance', NULL::text),
  ('INSTALL WATER STORAGE SYSTEM AND AUXILIARY FITTINGS', 'install-water-storage-system-and-auxiliary-fittings', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM', 'install-water-supply-system', NULL::text),
  ('MAINTAIN PLUMBING SYSTEMS', 'maintain-plumbing-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- ------------------------------------------------------------------------------
-- Course: BUILDING ARTISAN (MASONRY) LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';

-- Section 2: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BUILDING MATERIALS SCIENCE', 'apply-building-materials-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INSTALL BUILDING SERVICES', 'install-building-services', NULL::text),
  ('PERFORM BUILDING FINISHES', 'perform-building-finishes', NULL::text),
  ('PERFORM SITE PRELIMINARY WORKS', 'perform-site-preliminary-works', NULL::text),
  ('PERFORM SUBSTRUCTURE WORKS', 'perform-substructure-works', NULL::text),
  ('PERFORM SUPERSTRUCTURE WORKS', 'perform-superstructure-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';

-- ------------------------------------------------------------------------------
-- Course: CARPENTERY AND JOINERY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENCE', 'apply-science', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS', 'construct-temporary-works', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONSTRUCT & ERECT ROOF STRUCTURES', 'construct-and-erect-roof-structures', NULL::text),
  ('CONSTRUCT DOORS AND DOOR FRAMES', 'construct-doors-and-door-frames', NULL::text),
  ('CONSTRUCT FURNITURE ITEMS.', 'construct-furniture-items', NULL::text),
  ('CONSTRUCT TIMBER FLOORS AND PREFABRICATED BUILDINGS', 'construct-timber-floors-and-prefabricated-buildings', NULL::text),
  ('CONSTRUCT WINDOWS AND WINDOW FRAMES', 'construct-windows-and-window-frames', NULL::text),
  ('PERFORM JOINERS SECOND FIXING', 'perform-joiners-second-fixing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';

-- ------------------------------------------------------------------------------
-- Course: CARPENTRY AND JOINERY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- Section 2: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BASIC MATHEMATICS', 'basic-mathematics', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS.', 'construct-temporary-works', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONSTRUCT AND ERECT ROOF STRUCTURES', 'construct-and-erect-roof-structures', NULL::text),
  ('CONSTRUCT DOOR AND DOOR FRAMES', 'construct-door-and-door-frames', NULL::text),
  ('CONSTRUCT FURNITURE ITEMS', 'construct-furniture-items', NULL::text),
  ('CONSTRUCT TIMBER FLOORS AND PREFABRICATED BUILDINGS', 'construct-timber-floors-and-prefabricated-buildings', NULL::text),
  ('CONSTRUCT WINDOWS AND WINDOW FRAMES', 'construct-windows-and-window-frames', NULL::text),
  ('PERFORM JOINERS SECOND FIXING', 'perform-joiners-second-fixing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- ------------------------------------------------------------------------------
-- Course: CONSTRUCTION SURVEY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'construction-survey-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'construction-survey-level-4';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'construction-survey-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ASSIST IN THE PREPARATION OF DETAILED DRAWINGS, CHARTS AND PLANS', 'assist-in-the-preparation-of-detailed-drawings-charts-and-plans', NULL::text),
  ('CALCULATE SURVEY DATA', 'calculate-survey-data', NULL::text),
  ('CALCULATE TRAVERSE AND TACHEOMETRY DATA', 'calculate-traverse-and-tacheometry-data', NULL::text),
  ('CONDUCT FIELD SURVEY', 'conduct-field-survey', NULL::text),
  ('ESTABLISH GLOBAL POSITIONING SYSTEM (GPS) LOCATION', 'establish-global-positioning-system-gps-location', NULL::text),
  ('MAINTAIN SURVEY RECORDS', 'maintain-survey-records', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'construction-survey-level-4';

-- ------------------------------------------------------------------------------
-- Course: INTERIOR DESIGN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN FUNDAMENTALS', 'apply-design-fundamentals', NULL::text),
  ('CONSTRUCT INTERIOR SOFT FURNISHINGS', 'construct-interior-soft-furnishings', NULL::text),
  ('PERFORM CEILING FINISHING', 'perform-ceiling-finishing', NULL::text),
  ('PERFORM INTERIOR FLOOR FINISHING', 'perform-interior-floor-finishing', NULL::text),
  ('PERFORM INTERIOR WALL FINISHING', 'perform-interior-wall-finishing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-4';

-- ------------------------------------------------------------------------------
-- Course: MASONRY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSTRUCT BUILDING SUBSTRUCTURE', 'construct-building-substructure', NULL::text),
  ('CONSTRUCT BUILDING SUPERSTRUCTURE', 'construct-building-superstructure', NULL::text),
  ('FINISH MASONRY WORKS.', 'finish-masonry-works', NULL::text),
  ('INTERPRET AND DRAW SIMPLE WORKING DRAWINGS.', 'interpret-and-draw-simple-working-drawings', NULL::text),
  ('PRODUCE MASONRY CONSTRUCTION UNITS.', 'produce-masonry-construction-units', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENTIFIC PRINCIPLES', 'apply-scientific-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM', 'install-drainage-system', NULL::text),
  ('INSTALL RAINWATER HARVESTING SYSTEMS', 'install-rainwater-harvesting-systems', NULL::text),
  ('INSTALL SANITARY APPLIANCES', 'install-sanitary-appliances', NULL::text),
  ('INSTALL WATER PIPES AND ANCILLARY APPLIANCES', 'install-water-pipes-and-ancillary-appliances', NULL::text),
  ('INSTALL WATER STORAGE SYSTEMS AND ANCILLARY APPLIANCES', 'install-water-storage-systems-and-ancillary-appliances', NULL::text),
  ('MAINTAIN PLUMBING SYSTEMS', 'maintain-plumbing-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Common Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INTERPRET ARCHITECTURAL AND ENGINEERING DRAWINGS', 'interpret-architectural-and-engineering-drawings', NULL::text),
  ('MEASURE AND CALCULATE OBJECTS PARAMETERS', 'measure-and-calculate-object-s-parameters', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL PIPES IN BUILDINGS', 'install-pipes-in-buildings', NULL::text),
  ('INSTALL SANITARY APPLIANCES', 'install-sanitary-appliances', NULL::text),
  ('INSTALL STORAGE AND PUMPING SYSTEMS', 'install-storage-and-pumping-systems', NULL::text),
  ('MAINTAIN PLUMBING SYSTEMS', 'maintain-plumbing-systems', NULL::text),
  ('MEASURE AND CALCULATE OBJECTS PARAMETERS', 'measure-and-calculate-object-s-parameters-part-2', 'measure-and-calculate-object-s-parameters')
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: BUSINESS STUDIES DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 13 | Total Units: 203
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: BUSINESS STUDIES DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUSINESS STUDIES DEPARTMENT', 'business-studies-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Business Studies courses in Accountancy, Banking & Finance, Business Management, HRM, Project Management, and Supply Chain.', 4
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department'
);

-- 4. Insert Non-Modular Courses under BUSINESS STUDIES DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ACCOUNTANT LEVEL 6', 'accountant-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BANKING AND FINANCE OFFICER LEVEL 6', 'banking-and-finance-officer-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUSINESS MANAGER LEVEL 6', 'business-manager-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HUMAN RESOURCE MANAGEMENT LEVEL 6', 'human-resource-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'OFFICE ADMINISTRATOR LEVEL 6', 'office-administrator-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PROJECT MANAGEMENT LEVEL 6', 'project-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SUPPLY CHAIN MANAGER LEVEL 6', 'supply-chain-manager-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUSINESS MANAGEMENT LEVEL 5', 'business-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HUMAN RESOURCE MANAGEMENT LEVEL 5', 'human-resource-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'OFFICE ADMINISTRATOR LEVEL 5', 'office-administrator-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PROJECT MANAGER LEVEL 5', 'project-manager-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SUPPLY CHAIN MANAGEMENT LEVEL 5', 'supply-chain-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'OFFICE ASSISTANT LEVEL 4', 'office-assistant-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ACCOUNTANT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'accountant-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'accountant-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'accountant-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ECONOMICS SKILLS', 'apply-economics-skills', NULL::text),
  ('APPLY PRINCIPLES OF BUSINESS LAW', 'apply-principles-of-business-law', NULL::text),
  ('APPLY PRINCIPLES OF MANAGEMENT ACCOUNTING', 'apply-principles-of-management-accounting', NULL::text),
  ('APPLY PRINCIPLES OF QUANTITATIVE TECHNIQUES', 'apply-principles-of-quantitative-techniques', NULL::text),
  ('DEMONSTRATE THE UNDERSTANDING OF INFORMATION COMMUNICATION TECHNOLOGY (ICT)', 'demonstrate-the-understanding-of-information-communication-technology-ict', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'accountant-level-6';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'accountant-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY FUNDAMENTALS OF ACCOUNTING', 'apply-fundamentals-of-accounting', NULL::text),
  ('APPLY PRINCIPLES OF FINANCIAL MANAGEMENT', 'apply-principles-of-financial-management', NULL::text),
  ('APPLY PRINCIPLES OF MANAGEMENT', 'apply-principles-of-management', NULL::text),
  ('APPLY PRINCIPLES OF TAXATION', 'apply-principles-of-taxation', NULL::text),
  ('CARRY OUT BUSINESS MATHEMATICS AND STATISTICS', 'carry-out-business-mathematics-and-statistics', NULL::text),
  ('CARRY OUT FINANCIAL ACCOUNTING', 'carry-out-financial-accounting', NULL::text),
  ('CONDUCT FINANCIAL AUDITS', 'conduct-financial-audits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'accountant-level-6';

-- ------------------------------------------------------------------------------
-- Course: BANKING AND FINANCE OFFICER LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-officer-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-officer-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-officer-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ESTABLISH CREDIT COLLATERAL', 'establish-credit-collateral', NULL::text),
  ('MANAGE BACK OFFICE', 'manage-back-office', NULL::text),
  ('MANAGE BANK COMPLIANCE', 'manage-bank-compliance', NULL::text),
  ('MANAGE CUSTOMER RELATIONSHIP', 'manage-customer-relationship', NULL::text),
  ('MANAGE ELECTRONIC BANKING', 'manage-electronic-banking', NULL::text),
  ('MARKET BANK PRODUCTS', 'market-bank-products', NULL::text),
  ('OFFER CUSTOMER SERVICE', 'offer-customer-service', NULL::text),
  ('PERFORM CREDIT ADMINISTRATION', 'perform-credit-administration', NULL::text),
  ('PROCESS CREDIT FACILITIES', 'process-credit-facilities', NULL::text),
  ('PROVIDE TELLERING SERVICE', 'provide-tellering-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-officer-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUSINESS MANAGER LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'business-manager-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'business-manager-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'business-manager-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COORDINATE BUSINESS DEVELOPMENT.', 'coordinate-business-development', NULL::text),
  ('COORDINATE ICT FUNCTIONS', 'coordinate-ict-functions', NULL::text),
  ('DEVELOP BUSINESS STRATEGIES', 'develop-business-strategies', NULL::text),
  ('DEVELOP CORPORATE IMAGE', 'develop-corporate-image', NULL::text),
  ('MANAGE BUSINESS ASSETS AND LIABILITIES', 'manage-business-assets-and-liabilities', NULL::text),
  ('MANAGE BUSINESS RESEARCH AND DEVELOPMENT', 'manage-business-research-and-development', NULL::text),
  ('MANAGE BUSINESS RISKS', 'manage-business-risks', NULL::text),
  ('MANAGE CUSTOMER EXPERIENCE', 'manage-customer-experience', NULL::text),
  ('MANAGE FINANCIAL OPERATIONS', 'manage-financial-operations', NULL::text),
  ('MANAGE HUMAN RESOURCE', 'manage-human-resource', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'business-manager-level-6';

-- ------------------------------------------------------------------------------
-- Course: HUMAN RESOURCE MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Section 2: Common Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEMONSTRATE MANAGEMENT OF HUMAN RESOURCES', 'demonstrate-management-of-human-resources', NULL::text),
  ('MANAGE ORGANIZATIONAL BEHAVIOUR', 'manage-organizational-behaviour', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Section 3: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('COORDINATE LEARNING AND DEVELOPMENT', 'coordinate-learning-and-development', NULL::text),
  ('COORDINATE ORGANIZATIONAL DEVELOPMENT', 'coordinate-organizational-development', NULL::text),
  ('COORDINATE PERFORMANCE MANAGEMENT', 'coordinate-performance-management', NULL::text),
  ('ENFORCE COMPLIANCE WITH LEGISLATIONS', 'enforce-compliance-with-legislations', NULL::text),
  ('INITIATE EMPLOYEE RESOURCING', 'initiate-employee-resourcing', NULL::text),
  ('MANAGE EMPLOYEE RELATIONS', 'manage-employee-relations', NULL::text),
  ('MANAGE EMPLOYEE REWARDS', 'manage-employee-rewards', NULL::text),
  ('MANAGE HUMAN RESOURCE INFORMATION SYSTEM', 'manage-human-resource-information-system', NULL::text),
  ('PREPARE HUMAN RESOURCE BUDGETS', 'prepare-human-resource-budgets', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text),
  ('UNDERTAKE EMPLOYEE SEPARATION', 'undertake-employee-separation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: OFFICE ADMINISTRATOR LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-administrator-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-administrator-level-6';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-administrator-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COORDINATE OFFICIAL MEETINGS', 'coordinate-official-meetings', NULL::text),
  ('MANAGE FRONT OFFICE OPERATION', 'manage-front-office-operation', NULL::text),
  ('MANAGE OFFICE MAIL', 'manage-office-mail', NULL::text),
  ('MANAGE OFFICE SECURITY', 'manage-office-security', NULL::text),
  ('MANAGE TELEPHONE CALLS', 'manage-telephone-calls', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-administrator-level-6';

-- ------------------------------------------------------------------------------
-- Course: PROJECT MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Section 2: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE PROCUREMENT FOR GOODS, WORKS AND SERVICES', 'manage-procurement-for-goods-works-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Section 3: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('AUDIT AND REVIEW PROJECTS', 'audit-and-review-projects', NULL::text),
  ('MANAGE AND EVALUATE PROJECTS', 'manage-and-evaluate-projects', NULL::text),
  ('MANAGE PROJECT CLOSURE', 'manage-project-closure', NULL::text),
  ('MANAGE PROJECT DESIGN AND PLANNING', 'manage-project-design-and-planning', NULL::text),
  ('MANAGE PROJECT ENVIRONMENT', 'manage-project-environment', NULL::text),
  ('MANAGE PROJECT FINANCING', 'manage-project-financing', NULL::text),
  ('MANAGE PROJECT IMPLEMENTATION', 'manage-project-implementation', NULL::text),
  ('MANAGE PROJECT INCEPTION', 'manage-project-inception', NULL::text),
  ('MANAGE PROJECT RISKS', 'manage-project-risks', NULL::text),
  ('MANAGE PROJECT SCOPE', 'manage-project-scope', NULL::text),
  ('MANAGE PROJECT STAKEHOLDERS', 'manage-project-stakeholders', NULL::text),
  ('MONITOR AND EVALUATE PROJECTS', 'monitor-and-evaluate-projects', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: SUPPLY CHAIN MANAGER LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'supply-chain-manager-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'supply-chain-manager-level-6';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'supply-chain-manager-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DISPOSE ORGANIZATION’S ASSETS', 'dispose-organization-s-assets', NULL::text),
  ('MANAGE PROCUREMENT CONTRACTS', 'manage-procurement-contracts', NULL::text),
  ('O MANAGE SUPPLY CHAIN OPERATIONS', 'o-manage-supply-chain-operations', NULL::text),
  ('OVERSEE DISTRIBUTION OF STORED GOODS', 'oversee-distribution-of-stored-goods', NULL::text),
  ('OVERSEE WAREHOUSING OF PROCURED GOODS', 'oversee-warehousing-of-procured-goods', NULL::text),
  ('PROCURE ORGANIZATIONS’ GOODS AND SERVICES', 'procure-organizations-goods-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'supply-chain-manager-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUSINESS MANAGEMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT CORPORATE IMAGE STRATEGIES', 'carry-out-corporate-image-strategies', NULL::text),
  ('CONTROL BUSINESS RISKS.', 'control-business-risks', NULL::text),
  ('COORDINATE HUMAN RESOURCES FUNCTIONS', 'coordinate-human-resources-functions', NULL::text),
  ('COORDINATE ICT FUNCTIONS.', 'coordinate-ict-functions', NULL::text),
  ('MAINTAIN BUSINESS ASSETS AND LIABILITIES', 'maintain-business-assets-and-liabilities', NULL::text),
  ('MAINTAIN CUSTOMER EXPERIENCE', 'maintain-customer-experience', NULL::text),
  ('MANAGE BUSINESS RESEARCH AND DEVELOPMENT', 'manage-business-research-and-development', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: HUMAN RESOURCE MANAGEMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';

-- Section 2: Common Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEMONSTRATE MANAGEMENT OF HUMAN RESOURCES', 'demonstrate-management-of-human-resources', NULL::text),
  ('MANAGE ORGANIZATIONAL BEHAVIOUR', 'manage-organizational-behaviour', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';

-- Section 3: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONDUCT LEARNING AND DEVELOPMENT', 'conduct-learning-and-development', NULL::text),
  ('ENGAGE IN EMPLOYEE RELATIONS', 'engage-in-employee-relations', NULL::text),
  ('MANAGE HUMAN RESOURCE RECORDS', 'manage-human-resource-records', NULL::text),
  ('OPERATE HUMAN RESOURCE INFORMATION SYSTEM (HRIS)', 'operate-human-resource-information-system-hris', NULL::text),
  ('PARTICIPATE IN PERFOMANCE MANAGAEMENT', 'participate-in-perfomance-managaement', NULL::text),
  ('PREPARE HUMAN RESOURCE BUDGETS', 'prepare-human-resource-budgets', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text),
  ('UNDERTAKE EMPLOYEE RESOURCING', 'undertake-employee-resourcing', NULL::text),
  ('UNDERTAKE EMPLOYEE SEPARATION', 'undertake-employee-separation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: OFFICE ADMINISTRATOR LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-administrator-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-administrator-level-5';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-administrator-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEMONSTRATE SHORTHAND SKILLS', 'demonstrate-shorthand-skills', NULL::text),
  ('FILE OFFICE DOCUMENTS', 'file-office-documents', NULL::text),
  ('MANAGE FRONT OFFICE OPERATIONS', 'manage-front-office-operations', NULL::text),
  ('MANAGE OFFICE MAIL', 'manage-office-mail', NULL::text),
  ('MANAGE TELEPHONE CALLS', 'manage-telephone-calls', NULL::text),
  ('PROCESS COMPUTERIZED DOCUMENTS', 'process-computerized-documents', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-administrator-level-5';

-- ------------------------------------------------------------------------------
-- Course: PROJECT MANAGER LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-manager-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-manager-level-5';

-- Section 2: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-manager-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROCURE GOODS, WORKS AND SERVICES', 'procure-goods-works-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-manager-level-5';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-manager-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('AUDIT AND REVIEW PROJECTS', 'audit-and-review-projects', NULL::text),
  ('MANAGE PROJECT CLOSURE', 'manage-project-closure', NULL::text),
  ('MANAGE PROJECT ENVIRONMENT', 'manage-project-environment', NULL::text),
  ('MANAGE PROJECT IMPLEMENTATION', 'manage-project-implementation', NULL::text),
  ('MANAGE PROJECT INCEPTION PHASE', 'manage-project-inception-phase', NULL::text),
  ('MONITOR AND EVALUATE PROJECTS', 'monitor-and-evaluate-projects', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'project-manager-level-5';

-- ------------------------------------------------------------------------------
-- Course: SUPPLY CHAIN MANAGEMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'supply-chain-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'supply-chain-management-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'supply-chain-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONDUCT MARKET SURVEY', 'conduct-market-survey', NULL::text),
  ('DISTRIBUTE STORED GOODS', 'distribute-stored-goods', NULL::text),
  ('O HANDLE ORGANIZATIONS MATERIALS', 'o-handle-organizations-materials', NULL::text),
  ('PARTICIPATE IN ORGANIZATIONAL ASSETS DISPOSAL', 'participate-in-organizational-assets-disposal', NULL::text),
  ('PARTICIPATE IN PROCUREMENT CONTRACTS MANAGEMENT', 'participate-in-procurement-contracts-management', NULL::text),
  ('PERFORM WAREHOUSING OPERATIONS', 'perform-warehousing-operations', NULL::text),
  ('PROCURE ORGANIZATIONS’ GOODS AND SERVICES', 'procure-organizations-goods-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'supply-chain-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: OFFICE ASSISTANT LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-assistant-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-assistant-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-assistant-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COORDINATE OFFICE REPAIRS AND MAINTENANCE', 'coordinate-office-repairs-and-maintenance', NULL::text),
  ('HANDLE CUSTOMER CARE DUTIES', 'handle-customer-care-duties', NULL::text),
  ('HANDLE OFFICE CORRESPONDENCE', 'handle-office-correspondence', NULL::text),
  ('HANDLE OFFICE ERRANDS', 'handle-office-errands', NULL::text),
  ('HANDLE OFFICE RECORDS', 'handle-office-records', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'business-studies-department' AND c.slug = 'office-assistant-level-4';


-- ==============================================================================
-- SEED SCRIPT FOR: COMPUTING AND INFORMATICS DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 9 | Total Units: 153
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: COMPUTING AND INFORMATICS DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'COMPUTING AND INFORMATICS DEPARTMENT', 'computing-and-informatics-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Computing and Informatics courses in Computer Science, Programming, Cyber Security, Graphic Design, and ICT.', 5
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department'
);

-- 4. Insert Non-Modular Courses under COMPUTING AND INFORMATICS DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COMPUTER PROGRAMMING LEVEL 6', 'computer-programming-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COMPUTER SCIENCE LEVEL 6', 'computer-science-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CYBER SECURITY TECHNICIAN LEVEL 6', 'cyber-security-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GRAPHIC DESIGN LEVEL 6', 'graphic-design-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ICT TECHNICIAN LEVEL 6', 'ict-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CYBER SECURITY LEVEL 5', 'cyber-security-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GRAPHIC DESIGN LEVEL 5', 'graphic-design-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ICT TECHNICIAN LEVEL 5', 'ict-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ICT TECHNICIAN LEVEL 4', 'ict-technician-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: COMPUTER PROGRAMMING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-programming-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-programming-level-6';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-programming-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC COMPUTER SKILLS', 'apply-basic-computer-skills', NULL::text),
  ('APPLY DISCRETE MATHEMATICAL CONCEPTS', 'apply-discrete-mathematical-concepts', NULL::text),
  ('APPLY EVENT DRIVEN PROGRAMMING CONCEPTS USING VB.NET', 'apply-event-driven-programming-concepts-using-vb-net', NULL::text),
  ('APPLY OBJECT ORIENTED PROGRAMMING CONCEPTS USING JAVA', 'apply-object-oriented-programming-concepts-using-java', NULL::text),
  ('DEMONSTRATE DATABASE DESIGN AND DEVELOPMENT', 'demonstrate-database-design-and-development', NULL::text),
  ('DEMONSTRATE PROGRAMMING CONCEPTS', 'demonstrate-programming-concepts', NULL::text),
  ('DESIGN ALGORITHMS AND DATA STRUCTURES', 'design-algorithms-and-data-structures', NULL::text),
  ('DEVELOP CLIENT-SIDE WEB APPLICATIONS', 'develop-client-side-web-applications', NULL::text),
  ('DEVELOP MOBILE APPLICATIONS', 'develop-mobile-applications', NULL::text),
  ('DEVELOP SERVER-SIDE WEB APPLICATIONS', 'develop-server-side-web-applications', NULL::text),
  ('UNDERSTAND AGILE DEVELOPMENT CONCEPTS', 'understand-agile-development-concepts', NULL::text),
  ('UNDERSTAND COMPUTING BASICS', 'understand-computing-basics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-programming-level-6';

-- ------------------------------------------------------------------------------
-- Course: COMPUTER SCIENCE LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';

-- Section 2: Common Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEMONSTRATE BASIC ELECTRONIC SKILLS', 'demonstrate-basic-electronic-skills', NULL::text),
  ('UNDERSTAND MATHEMATICS FOR COMPUTER SCIENCE', 'understand-mathematics-for-computer-science', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';

-- Section 3: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DEMONSTRATE DATABASE MANAGEMENT SKILLS', 'demonstrate-database-management-skills', NULL::text),
  ('DEMONSTRATE WEB DESIGN SKILLS', 'demonstrate-web-design-skills', NULL::text),
  ('DEVELOP AN INFORMATION SYSTEM', 'develop-an-information-system', NULL::text),
  ('UNDERSTAND ALGORITHMS AND DATA STRUCTURES', 'understand-algorithms-and-data-structures', NULL::text),
  ('UNDERSTAND ARTIFICIAL INTELLIGENCE', 'understand-artificial-intelligence', NULL::text),
  ('UNDERSTAND COMPUTER ORGANIZATION AND ARCHITECTURE', 'understand-computer-organization-and-architecture', NULL::text),
  ('UNDERSTAND FUNDAMENTALS OF PROGRAMMING', 'understand-fundamentals-of-programming', NULL::text),
  ('UNDERSTAND GRAPHIC DESIGN', 'understand-graphic-design', NULL::text),
  ('UNDERSTAND NETWORKING AND DISTRIBUTED SYSTEMS', 'understand-networking-and-distributed-systems', NULL::text),
  ('UNDERSTAND OPERATING SYSTEMS', 'understand-operating-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';

-- ------------------------------------------------------------------------------
-- Course: CYBER SECURITY TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-technician-level-6';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUILD SECURE NETWORK', 'build-secure-network', NULL::text),
  ('CONDUCT SECURITY ASSESSMENT AND TESTING', 'conduct-security-assessment-and-testing', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF CYBER SECURITY LAWS, POLICIES AND REGULATIONS', 'demonstrate-understanding-of-cyber-security-laws-policies-and-regulations', NULL::text),
  ('DEVELOP COMPUTER SOFTWARE', 'develop-computer-software', NULL::text),
  ('INSTALL CYBER SECURITY SYSTEM', 'install-cyber-security-system', NULL::text),
  ('MANAGE CYBER SECURITY RISKS', 'manage-cyber-security-risks', NULL::text),
  ('MANAGE SECURITY OPERATIONS', 'manage-security-operations', NULL::text),
  ('PERFORM COMPUTER NETWORKING', 'perform-computer-networking', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text),
  ('SECURE DATABASES', 'secure-databases', NULL::text),
  ('SECURE SOFTWARE APPLICATION', 'secure-software-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: GRAPHIC DESIGN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-6';

-- Section 2: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN ELEMENTS AND PRINCIPLES', 'apply-design-elements-and-principles', NULL::text),
  ('CONCEPTUALIZE GRAPHIC DESIGN', 'conceptualize-graphic-design', NULL::text),
  ('CREATE ADVERTISING DESIGN', 'create-advertising-design', NULL::text),
  ('CREATE DIGITAL GRAPHIC DESIGN', 'create-digital-graphic-design', NULL::text),
  ('CREATE TYPOGRAPHY', 'create-typography', NULL::text),
  ('DEVELOP CORPORATE IDENTITY', 'develop-corporate-identity', NULL::text),
  ('DEVELOP USER EXPERIENCE DESIGN', 'develop-user-experience-design', NULL::text),
  ('GENERATE GRAPHIC DESIGN BUDGET', 'generate-graphic-design-budget', NULL::text),
  ('MANAGE GRAPHIC PRODUCTION', 'manage-graphic-production', NULL::text),
  ('PERFORM HAND DRAWING', 'perform-hand-drawing', NULL::text),
  ('PERFORM PHOTOGRAPHY OPERATIONS', 'perform-photography-operations', NULL::text),
  ('PRODUCE GRAPHIC ILLUSTRATIONS', 'produce-graphic-illustrations', NULL::text),
  ('PRODUCE PACKAGING DESIGN', 'produce-packaging-design', NULL::text),
  ('PRODUCE PUBLICATION DESIGN', 'produce-publication-design', NULL::text),
  ('PRODUCE SIGNAGE', 'produce-signage', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-6';

-- ------------------------------------------------------------------------------
-- Course: ICT TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';

-- Section 2: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC ELECTRONICS', 'apply-basic-electronics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';

-- Section 3: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONTROL ICT SECURITY THREATS', 'control-ict-security-threats', NULL::text),
  ('DEVELOP COMPUTER PROGRAM', 'develop-computer-program', NULL::text),
  ('INSTALL COMPUTER SOFTWARE', 'install-computer-software', NULL::text),
  ('MANAGE DATABASE SYSTEMS', 'manage-database-systems', NULL::text),
  ('MANAGE INFORMATION SYSTEM', 'manage-information-system', NULL::text),
  ('MOBILE APPLICATION DEVELOPMENT', 'mobile-application-development', NULL::text),
  ('PERFORM COMPUTER NETWORKING', 'perform-computer-networking', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text),
  ('PERFORM GRAPHIC DESIGN', 'perform-graphic-design', NULL::text),
  ('PERFORM ICT SYSTEM SUPPORT', 'perform-ict-system-support', NULL::text),
  ('PERFORM SYSTEM ANALYSIS AND DESIGN', 'perform-system-analysis-and-design', NULL::text),
  ('PERFORM WEBSITE DESIGN', 'perform-website-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: CYBER SECURITY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-level-5';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONDUCT CYBER SECURITY ASSESSMENT AND TESTING', 'conduct-cyber-security-assessment-and-testing', NULL::text),
  ('CONDUCT CYBER SECURITY ASSESSMENT AND TESTING.', 'conduct-cyber-security-assessment-and-testing-2', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF CYBER SECURITY LAWS, POLICIES AND REGULATIONS', 'demonstrate-understanding-of-cyber-security-laws-policies-and-regulations', NULL::text),
  ('INSTALL CYBER SECURITY SYSTEM', 'install-cyber-security-system', NULL::text),
  ('PERFORM COMPUTER NETWORKING', 'perform-computer-networking', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text),
  ('SECURE DATABASES', 'secure-databases', NULL::text),
  ('SECURE SOFTWARE APPLICATION', 'secure-software-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-level-5';

-- ------------------------------------------------------------------------------
-- Course: GRAPHIC DESIGN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN ELEMENTS AND PRINCIPLES', 'apply-design-elements-and-principles', NULL::text),
  ('CONCEPTUALIZE GRAPHIC DESIGN', 'conceptualize-graphic-design', NULL::text),
  ('CREATE DIGITAL GRAPHICS', 'create-digital-graphics', NULL::text),
  ('CREATE GRAPHIC ARTWORK', 'create-graphic-artwork', NULL::text),
  ('PERFORM HAND DRAWING', 'perform-hand-drawing', NULL::text),
  ('PRODUCE GRAPHIC DESIGN ARTWORK', 'produce-graphic-design-artwork', NULL::text),
  ('PRODUCE GRAPHIC ILLUSTRATIONS', 'produce-graphic-illustrations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-5';

-- ------------------------------------------------------------------------------
-- Course: ICT TECHNICIAN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';

-- Section 2: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC ELECTRONICS', 'apply-basic-electronics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DEVELOP COMPUTER PROGRAM', 'develop-computer-program', NULL::text),
  ('INSTALL COMPUTER SOFTWARE', 'install-computer-software', NULL::text),
  ('MANAGE DATABASE SYSTEMS', 'manage-database-systems', NULL::text),
  ('MANAGE OPERATING SYSTEM', 'manage-operating-system', NULL::text),
  ('PERFORM COMPUTER NETWORKING', 'perform-computer-networking', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: ICT TECHNICIAN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MICROSOFT OFFICE TOOLS', 'apply-microsoft-office-tools', NULL::text),
  ('INSTALL COMPUTER SOFTWARE', 'install-computer-software', NULL::text),
  ('REPAIR AND MAINTAIN A COMPUTER', 'repair-and-maintain-a-computer', NULL::text),
  ('USE OF ICT DEVICES', 'use-of-ict-devices', NULL::text),
  ('USE THE INTERNET', 'use-the-internet', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-4';


-- ==============================================================================
-- SEED SCRIPT FOR: ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 14 | Total Units: 204
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT', 'electrical-and-electronic-engineering-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Electrical and Electronic Engineering courses in Power, Instrumentation, Telecommunication, and Solar PV.', 6
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department'
);

-- 4. Insert Non-Modular Courses under ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL ENGINEERING (POWER OPTION) LEVEL 6', 'electrical-engineering-power-option-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION LEVEL 6', 'electrical-installation-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL TECHNICIAN (POWER OPTION) LEVEL 6', 'electrical-technician-power-option-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS ENGINEERING LEVEL 6', 'electronics-engineering-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS TECHNICIAN LEVEL 6', 'electronics-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TELECOMMUNICATION ENGINEERING LEVEL 6', 'telecommunication-engineering-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION LEVEL 5', 'electrical-installation-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL OPERATION LEVEL 5', 'electrical-operation-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS CRAFTSPERSON LEVEL 5', 'electronics-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS ENGINEERING LEVEL 5', 'electronics-engineering-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION LEVEL 4', 'electrical-installation-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV INSTALLATION LEVEL 4', 'solar-pv-installation-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION LEVEL 3', 'electrical-installation-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV INSTALLATION LEVEL 3', 'solar-pv-installation-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL ENGINEERING (POWER OPTION) LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-power-option-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-power-option-level-6';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-power-option-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('AUTOMATE AN ELECTRICAL MACHINE', 'automate-an-electrical-machine', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF POWER GENERATION', 'demonstrate-understanding-of-power-generation', NULL::text),
  ('INSTALL ELECTRICAL MACHINES', 'install-electrical-machines', NULL::text),
  ('INSTALL ELECTRICAL POWER LINES', 'install-electrical-power-lines', NULL::text),
  ('INSTALL SECURITY SYSTEMS', 'install-security-systems', NULL::text),
  ('INSTALL SOLAR SYSTEMS', 'install-solar-systems', NULL::text),
  ('MAINTAIN ELECTRICAL EQUIPMENT AND SYSTEMS', 'maintain-electrical-equipment-and-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWING', 'prepare-and-interpret-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-power-option-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP PROCESS', 'apply-workshop-process', NULL::text),
  ('PERFORM WORKSHOP PROCESS', 'perform-workshop-process', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('MAINTAIN ELECTRICAL SYSTEMS', 'maintain-electrical-systems', NULL::text),
  ('MANAGE ELECTRICAL INSTALLATION SITES', 'manage-electrical-installation-sites', NULL::text),
  ('PERFORM COMMISSIONING OF ELECTRICAL SYSTEMS.', 'perform-commissioning-of-electrical-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM ELECTRICAL SYSTEM BREAKDOWN MAINTENANCE', 'perform-electrical-system-breakdown-maintenance', NULL::text),
  ('PERFORM TESTING OF ELECTRICAL INSTALLATION', 'perform-testing-of-electrical-installation', NULL::text),
  ('PLAN ELECTRICAL INSTALLATION WORK', 'plan-electrical-installation-work', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL TECHNICIAN (POWER OPTION) LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-technician-power-option-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-technician-power-option-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-technician-power-option-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('AUTOMATE AN ELECTRICAL MACHINE', 'automate-an-electrical-machine', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF POWER GENERATION', 'demonstrate-understanding-of-power-generation', NULL::text),
  ('ELECTRICAL TRANSMISSION POWER LINES', 'electrical-transmission-power-lines', NULL::text),
  ('INSTALL ELECTRICAL MACHINE', 'install-electrical-machine', NULL::text),
  ('MAINTAIN ELECTRICAL EQUIPMENT AND SYSTEMS', 'maintain-electrical-equipment-and-systems', NULL::text),
  ('MANAGE AN ELECTRICAL PROJECT', 'manage-an-electrical-project', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-technician-power-option-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS ENGINEERING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-6';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('INSTALL ELECTRICAL MACHINES CONTROL SYSTEM', 'install-electrical-machines-control-system', NULL::text),
  ('INSTALL POWER SUPPLY SYSTEM', 'install-power-supply-system', NULL::text),
  ('MAINTAIN AUTOMATION AND RADIO FREQUENCY SYSTEMS', 'maintain-automation-and-radio-frequency-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM INDUSTRIAL AUTOMATION', 'perform-industrial-automation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATIC', 'apply-engineering-mathematic', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('INSTALL ELECTRICAL MACHINE CONTROL SYSTEM', 'install-electrical-machine-control-system', NULL::text),
  ('INSTALL POWER SUPPLY SYSTEM', 'install-power-supply-system', NULL::text),
  ('MAINTAIN AUTOMATION AND RADIO FREQUENCY SYSTEMS', 'maintain-automation-and-radio-frequency-systems', NULL::text),
  ('PERFORM INDUSTRIAL AUTOMATION', 'perform-industrial-automation', NULL::text),
  ('PERFORMING ELECTRICAL INSTALLATION', 'performing-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: TELECOMMUNICATION ENGINEERING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-engineering-level-6';

-- Section 2: Core Units of Competency (21 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP PROCESSES', 'apply-workshop-processes', NULL::text),
  ('BROADCAST TV AND RADIO SIGNALS', 'broadcast-tv-and-radio-signals', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('INSTALL BASE TRANSCEIVER STATION', 'install-base-transceiver-station', NULL::text),
  ('INSTALL BROADCASTING MONITOR', 'install-broadcasting-monitor', NULL::text),
  ('INSTALL COMMUNICATION EQUIPMENT', 'install-communication-equipment', NULL::text),
  ('INSTALL FIBER OPTIC CABLE', 'install-fiber-optic-cable', NULL::text),
  ('INSTALL INSIDE PLANT NETWORK', 'install-inside-plant-network', NULL::text),
  ('INSTALL IP PABX', 'install-ip-pabx', NULL::text),
  ('INSTALL RADAR SYSTEM', 'install-radar-system', NULL::text),
  ('INSTALL SATELLITE SIGNAL REFLECTORS', 'install-satellite-signal-reflectors', NULL::text),
  ('INSTALL SECURITY SYSTEMS', 'install-security-systems', NULL::text),
  ('INSTALL TELECOMMUNICATION TRANSMISSION EQUIPMENT', 'install-telecommunication-transmission-equipment', NULL::text),
  ('INSTALL TELEPHONE NETWORK', 'install-telephone-network', NULL::text),
  ('INSTALL WI-FI NETWORK', 'install-wi-fi-network', NULL::text),
  ('MAINTAIN TELECOMMUNICATION EQUIPMENT AND SYSTEMS', 'maintain-telecommunication-equipment-and-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM TCP-IP AND NETWORKING', 'perform-tcp-ip-and-networking', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWING', 'prepare-and-interpret-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-engineering-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWING', 'prepare-and-interpret-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('MAINTAIN ELECTRICAL INSTALLATION SYSTEMS', 'maintain-electrical-installation-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM ELECTRICAL SYSTEM BREAKDOWN MAINTENANCE', 'perform-electrical-system-breakdown-maintenance', NULL::text),
  ('PERFORM TESTING OF ELECTRICAL INSTALLATION', 'perform-testing-of-electrical-installation', NULL::text),
  ('PLAN ELECTRICAL INSTALLATION WORKS', 'plan-electrical-installation-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL OPERATION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM WORKSHOP PROCESS.', 'perform-workshop-process', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('INSTALL ELECTRICAL MACHINE', 'install-electrical-machine', NULL::text),
  ('INSTALL ELECTRICAL POWER LINES', 'install-electrical-power-lines', NULL::text),
  ('INSTALL SECURITY SYSTEM', 'install-security-system', NULL::text),
  ('INSTALL SOLAR SYSTEMS', 'install-solar-systems', NULL::text),
  ('PERFORM ELECTRICAL BREAKDOWN MAINTENANCE', 'perform-electrical-breakdown-maintenance', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-craftsperson-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('INSTALL ELECTRICAL MACHINE CONTROL SYSTEMS', 'install-electrical-machine-control-systems', NULL::text),
  ('INSTALL POWER SUPPLY SYSTEMS', 'install-power-supply-systems', NULL::text),
  ('MAINTAIN RADIO FREQUENCY SYSTEMS', 'maintain-radio-frequency-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS ENGINEERING LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('INSTALL ELECTRICAL MACHINE CONTROL SYSTEM', 'install-electrical-machine-control-system', NULL::text),
  ('INSTALL POWER SUPPLY SYSTEMS', 'install-power-supply-systems', NULL::text),
  ('MAINTAIN RADIO FREQUENCY SYSTEMS', 'maintain-radio-frequency-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-4';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION TESTING', 'perform-electrical-installation-testing', NULL::text),
  ('PERFORM ELECTRICAL SYSTEM BREAKDOWN MAINTENANCE', 'perform-electrical-system-breakdown-maintenance', NULL::text),
  ('PERFORM WORKSHOP PRACTICES', 'perform-workshop-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS.', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-4';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV INSTALLATION LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-4';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSPECT SOLAR PHOTOVOLTAIC SYSTEM INSTALLATION SITE', 'inspect-solar-photovoltaic-system-installation-site', NULL::text),
  ('INSTALL DC AND AC SOLAR PHOTOVOLTAIC SYSTEM', 'install-dc-and-ac-solar-photovoltaic-system', NULL::text),
  ('INSTALL DC SOLAR PHOTOVOLTAIC SYSTEM', 'install-dc-solar-photovoltaic-system', NULL::text),
  ('MAINTAIN SOLAR PV SYSTEMS', 'maintain-solar-pv-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-4';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM FIXING AND MAINTENANCE OF LIGHT FITTINGS, POWER OUTLETS AND BASIC APPLIANCES', 'perform-fixing-and-maintenance-of-light-fittings-power-outlets-and-basic-appliances', NULL::text),
  ('PERFORM PVC SHEATHED CABLING, CONDUITING, TRUNKING AND CABLE TRAYS LAYING', 'perform-pvc-sheathed-cabling-conduiting-trunking-and-cable-trays-laying', NULL::text),
  ('PERFORM SINGLE PHASE ELECTRICAL INSTALLATION AND MAINTENANCE', 'perform-single-phase-electrical-installation-and-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-3';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV INSTALLATION LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT SOLAR PV SITE SURVEY', 'conduct-solar-pv-site-survey', NULL::text),
  ('DESIGN A SOLAR PV INSTALLATION SYSTEM', 'design-a-solar-pv-installation-system', NULL::text),
  ('INSTALL SOLAR PV SYSTEM', 'install-solar-pv-system', NULL::text),
  ('MAINTAIN SOLAR PV SYSTEM', 'maintain-solar-pv-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: FASHION DESIGN AND COSMETOLOGY DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 19 | Total Units: 241
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: FASHION DESIGN AND COSMETOLOGY DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'FASHION DESIGN AND COSMETOLOGY DEPARTMENT', 'fashion-design-and-cosmetology-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Fashion Design, Cosmetology, Beauty Therapy, Hairdressing, Leather, and Textile courses.', 7
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department'
);

-- 4. Insert Non-Modular Courses under FASHION DESIGN AND COSMETOLOGY DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEAUTY THERAPY LEVEL 6', 'beauty-therapy-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN MANAGEMENT LEVEL 6', 'fashion-design-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HAIRDRESSER LEVEL 6', 'hairdresser-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HAIRDRESSING MANAGEMENT LEVEL 6', 'hairdressing-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LEATHER TECHNOLOGY LEVEL 6', 'leather-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TEXTILE TECHNICIAN LEVEL 6', 'textile-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEAUTY THERAPIST LEVEL 5', 'beauty-therapist-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 5', 'fashion-design-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOTWEAR PRODUCER LEVEL 5', 'footwear-producer-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HAIRDRESSER LEVEL 5', 'hairdresser-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LEATHER GOODS PRODUCTION LEVEL 5', 'leather-goods-production-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LEATHER PROCESSING (TANNING) LEVEL 5', 'leather-processing-tanning-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TEXTILE PROCESSING CRAFTSPERSON LEVEL 5', 'textile-processing-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEAUTY THERAPIST LEVEL 4', 'beauty-therapist-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 4', 'fashion-design-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HAIRDRESSING LEVEL 4', 'hairdressing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEAUTY THERAPIST LEVEL 3', 'beauty-therapist-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN (DRESSMAKING AND TAILORING OPTIONS) LEVEL 3', 'fashion-design-dressmaking-and-tailoring-options-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN (TAILORING OPTION) LEVEL 3', 'fashion-design-tailoring-option-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: BEAUTY THERAPY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapy-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BEAUTY THERAPY OPERATION UNIT', 'manage-beauty-therapy-operation-unit', NULL::text),
  ('MANAGE BODY ART OPERATIONS', 'manage-body-art-operations', NULL::text),
  ('MANAGE BODY MASSAGE AND SPA OPERATIONS', 'manage-body-massage-and-spa-operations', NULL::text),
  ('MANAGE HAIR REMOVAL OPERATIONS', 'manage-hair-removal-operations', NULL::text),
  ('MANAGE MAKE UP OPERATIONS', 'manage-make-up-operations', NULL::text),
  ('MANAGE MANICURE AND PEDICURE OPERATIONS', 'manage-manicure-and-pedicure-operations', NULL::text),
  ('PROVIDE HAIR CUTTING SERVICES', 'provide-hair-cutting-services', NULL::text),
  ('PROVIDE NAIL TECHNOLOGY SERVICES', 'provide-nail-technology-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapy-level-6';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-management-level-6';

-- Section 2: Core Units of Competency (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DESIGN AND CONSTRUCT BAGS', 'design-and-construct-bags', NULL::text),
  ('DESIGN AND CONSTRUCT BRIDAL WEAR', 'design-and-construct-bridal-wear', NULL::text),
  ('DESIGN AND CONSTRUCT CHILDRENS WEAR', 'design-and-construct-children-s-wear', NULL::text),
  ('DESIGN AND CONSTRUCT FASHION ACCESSORIES', 'design-and-construct-fashion-accessories', NULL::text),
  ('DESIGN AND CONSTRUCT GENTS WEAR', 'design-and-construct-gents-wear', NULL::text),
  ('DESIGN AND CONSTRUCT LADIES WEAR', 'design-and-construct-ladies-wear', NULL::text),
  ('DESIGN AND CONSTRUCT LINGERIE', 'design-and-construct-lingerie', NULL::text),
  ('DESIGN AND CONSTRUCT MILLINERY', 'design-and-construct-millinery', NULL::text),
  ('DESIGN AND CONSTRUCT SHOES', 'design-and-construct-shoes', NULL::text),
  ('DESIGN AND CONSTRUCT SPORTS WEAR', 'design-and-construct-sports-wear', NULL::text),
  ('DESIGN AND CONSTRUCT UNIFORM', 'design-and-construct-uniform', NULL::text),
  ('DESIGN AND DECORATE FABRICS', 'design-and-decorate-fabrics', NULL::text),
  ('MANAGE FASHION DESIGN STUDIO', 'manage-fashion-design-studio', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: HAIRDRESSER LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BARBERING OPERATIONS', 'manage-barbering-operations', NULL::text),
  ('MANAGE CHEMICAL REFORMATION OPERATIONS', 'manage-chemical-reformation-operations', NULL::text),
  ('MANAGE HAIR ADDITION OPERATIONS', 'manage-hair-addition-operations', NULL::text),
  ('MANAGE HAIR CUTTING OPERATIONS', 'manage-hair-cutting-operations', NULL::text),
  ('MANAGE HAIR SETTING AND STYLING OPERATIONS', 'manage-hair-setting-and-styling-operations', NULL::text),
  ('MANAGE HAIRDRESSING OPERATIONS UNIT', 'manage-hairdressing-operations-unit', NULL::text),
  ('PRODUCE HAIR PIECE PRODUCTS', 'produce-hair-piece-products', NULL::text),
  ('PROVIDE HAIR COLORING SERVICES', 'provide-hair-coloring-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-6';

-- ------------------------------------------------------------------------------
-- Course: HAIRDRESSING MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-management-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BARBERING OPERATIONS', 'manage-barbering-operations', NULL::text),
  ('MANAGE HAIR ADDITION OPERATIONS', 'manage-hair-addition-operations', NULL::text),
  ('MANAGE HAIR CHEMICAL REFORMATION OPERATIONS', 'manage-hair-chemical-reformation-operations', NULL::text),
  ('MANAGE HAIR COLORING OPERATIONS', 'manage-hair-coloring-operations', NULL::text),
  ('MANAGE HAIR COLOURING AND LIGHTENING OPERATIONS', 'manage-hair-colouring-and-lightening-operations', NULL::text),
  ('MANAGE HAIR CUTTING OPERATIONS', 'manage-hair-cutting-operations', NULL::text),
  ('MANAGE HAIR SETTING AND STYLING OPERATIONS', 'manage-hair-setting-and-styling-operations', NULL::text),
  ('MANAGE HAIRDRESSING OPERATIONS', 'manage-hairdressing-operations', NULL::text),
  ('MANAGE HAIRDRESSING OPERATIONS UNIT', 'manage-hairdressing-operations-unit', NULL::text),
  ('MANAGE PRODUCTION OF HAIR PIECE PRODUCTS', 'manage-production-of-hair-piece-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: LEATHER TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-technology-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT ANIMAL FLAYING', 'carry-out-animal-flaying', NULL::text),
  ('CARRY OUT LEATHER PROCESSING', 'carry-out-leather-processing', NULL::text),
  ('MANAGE TANNERY WASTE', 'manage-tannery-waste', NULL::text),
  ('OPERATE LEATHER PRODUCTION MACHINES', 'operate-leather-production-machines', NULL::text),
  ('PERFORM HIDES/SKINS CURING', 'perform-hides-skins-curing', NULL::text),
  ('PRODUCE LEATHER FOOTWEAR', 'produce-leather-footwear', NULL::text),
  ('PRODUCE LEATHER GOODS', 'produce-leather-goods', NULL::text),
  ('PRODUCE UPHOLSTERY PRODUCTS', 'produce-upholstery-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: TEXTILE TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE', 'apply-material-science', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('MANAGE TEXTILE PRODUCTION PROCESS', 'manage-textile-production-process', NULL::text),
  ('PERFORM TEXTILE TESTING', 'perform-textile-testing', NULL::text),
  ('PROCESS TEXTILE FABRIC', 'process-textile-fabric', NULL::text),
  ('PRODUCE KNITTED FABRIC', 'produce-knitted-fabric', NULL::text),
  ('PRODUCE NONWOVEN FABRIC', 'produce-nonwoven-fabric', NULL::text),
  ('PRODUCE TEXTILE YARN (SPINNING)', 'produce-textile-yarn-spinning', NULL::text),
  ('PRODUCE WOVEN FABRIC (WEAVING)', 'produce-woven-fabric-weaving', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: BEAUTY THERAPIST LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROVIDE BODY ART SERVICES', 'provide-body-art-services', NULL::text),
  ('PROVIDE BODY MASSAGE SERVICES', 'provide-body-massage-services', NULL::text),
  ('PROVIDE FACIAL SKIN CARE SERVICES', 'provide-facial-skin-care-services', NULL::text),
  ('PROVIDE HAIR REMOVAL SERVICE', 'provide-hair-removal-service', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICES', 'provide-manicure-and-pedicure-services', NULL::text),
  ('PROVIDE NAIL TECHNOLOGY SERVICES', 'provide-nail-technology-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-5';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSTRUCT MENSTRUAL HYGIENE PRODUCT', 'construct-menstrual-hygiene-product', NULL::text),
  ('DESIGN AND CONSTRUCT ACCESSORIES', 'design-and-construct-accessories', NULL::text),
  ('DESIGN AND CONSTRUCT GARMENTS', 'design-and-construct-garments', NULL::text),
  ('DESIGN AND DECORATE FABRICS', 'design-and-decorate-fabrics', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOTWEAR PRODUCER LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-producer-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-producer-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-producer-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT FOOTWEAR CONSTRUCTION', 'carry-out-footwear-construction', NULL::text),
  ('CARRY OUT FOOTWEAR DESIGN AND PATTERN CUTTING', 'carry-out-footwear-design-and-pattern-cutting', NULL::text),
  ('CARRY OUT FOOTWEAR FINISHING', 'carry-out-footwear-finishing', NULL::text),
  ('CARRY OUT FOOTWEAR SHOE ROOM OPERATIONS', 'carry-out-footwear-shoe-room-operations', NULL::text),
  ('CUT FOOTWEAR MATERIAL', 'cut-footwear-material', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS', 'perform-footwear-closing-operations', NULL::text),
  ('PREPARE FOOTWEAR COMPONENTS', 'prepare-footwear-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-producer-level-5';

-- ------------------------------------------------------------------------------
-- Course: HAIRDRESSER LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE HAIR PIECE PRODUCTS', 'produce-hair-piece-products', NULL::text),
  ('PROVIDE HAIR ADDITION SERVICES', 'provide-hair-addition-services', NULL::text),
  ('PROVIDE HAIR BARBERING SERVICES', 'provide-hair-barbering-services', NULL::text),
  ('PROVIDE HAIR CHEMICAL REFORMATION SERVICES', 'provide-hair-chemical-reformation-services', NULL::text),
  ('PROVIDE HAIR COLORING SERVICES', 'provide-hair-coloring-services', NULL::text),
  ('PROVIDE HAIR CUTTING SERVICE', 'provide-hair-cutting-service', NULL::text),
  ('PROVIDE HAIR SETTING AND STYLING SERVICES', 'provide-hair-setting-and-styling-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-5';

-- ------------------------------------------------------------------------------
-- Course: LEATHER GOODS PRODUCTION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-goods-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-goods-production-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-goods-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT LEATHER GOODS DESIGN AND PATTERN CUTTING', 'carry-out-leather-goods-design-and-pattern-cutting', NULL::text),
  ('CARRY OUT LEATHER GOODS FINISHING OPERATIONS', 'carry-out-leather-goods-finishing-operations', NULL::text),
  ('CUT LEATHER GOODS MATERIAL', 'cut-leather-goods-material', NULL::text),
  ('PERFORM LEATHER GOODS ASSEMBLY OPERATIONS', 'perform-leather-goods-assembly-operations', NULL::text),
  ('PREPARE LEATHER GOODS COMPONENTS', 'prepare-leather-goods-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-goods-production-level-5';

-- ------------------------------------------------------------------------------
-- Course: LEATHER PROCESSING (TANNING) LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-processing-tanning-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-processing-tanning-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-processing-tanning-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT FINISHING OPERATIONS', 'carry-out-finishing-operations', NULL::text),
  ('CARRY OUT POST TANNING PROCESSES', 'carry-out-post-tanning-processes', NULL::text),
  ('CARRY OUT PRE-TANNING AND TANNING PROCESSES', 'carry-out-pre-tanning-and-tanning-processes', NULL::text),
  ('MANAGE TANNERY WASTE', 'manage-tannery-waste', NULL::text),
  ('OPERATE LEATHER PRODUCTION MACHINES', 'operate-leather-production-machines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-processing-tanning-level-5';

-- ------------------------------------------------------------------------------
-- Course: TEXTILE PROCESSING CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE', 'apply-material-science', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('PERFORM MACHINE MAINTENANCE', 'perform-machine-maintenance', NULL::text),
  ('PERFORM QUALITY CONTROL', 'perform-quality-control', NULL::text),
  ('PERFORM TEXTILE FINISHING', 'perform-textile-finishing', NULL::text),
  ('PRODUCE DYED TEXTILES', 'produce-dyed-textiles', NULL::text),
  ('PRODUCE PRE-TREATED TEXTILES', 'produce-pre-treated-textiles', NULL::text),
  ('PRODUCE PRINTED FABRICS', 'produce-printed-fabrics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: BEAUTY THERAPIST LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROVIDE BODY ART SERVICES', 'provide-body-art-services', NULL::text),
  ('PROVIDE BODY MASSAGE SERVICES', 'provide-body-massage-services', NULL::text),
  ('PROVIDE HAIR REMOVAL SERVICES', 'provide-hair-removal-services', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICES', 'provide-manicure-and-pedicure-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-4';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSTRUCT MENSTRUAL HYGIENE PRODUCTS', 'construct-menstrual-hygiene-products', NULL::text),
  ('DECORATE FABRICS AND GARMENTS', 'decorate-fabrics-and-garments', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text),
  ('SKETCH AND CONSTRUCT GARMENTS', 'sketch-and-construct-garments', NULL::text),
  ('SKETCH AND CONSTRUCT LADIES’ GARMENTS', 'sketch-and-construct-ladies-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';

-- ------------------------------------------------------------------------------
-- Course: HAIRDRESSING LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE HAIR PIECE PRODUCTS', 'produce-hair-piece-products', NULL::text),
  ('PROVIDE BARBERING SERVICES', 'provide-barbering-services', NULL::text),
  ('PROVIDE HAIR ADDITION SERVICES', 'provide-hair-addition-services', NULL::text),
  ('PROVIDE HAIR COLOURING SERVICES', 'provide-hair-colouring-services', NULL::text),
  ('PROVIDE HAIR SETTING AND STYLING SERVICES', 'provide-hair-setting-and-styling-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-level-4';

-- ------------------------------------------------------------------------------
-- Course: BEAUTY THERAPIST LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PROVIDE BODY ART SERVICES', 'provide-body-art-services', NULL::text),
  ('PROVIDE HEAD AND SHOULDER MASSAGE SERVICES', 'provide-head-and-shoulder-massage-services', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICES', 'provide-manicure-and-pedicure-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-3';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN (DRESSMAKING AND TAILORING OPTIONS) LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-dressmaking-and-tailoring-options-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text),
  ('SKETCH AND CONSTRUCT LADIES GARMENTS', 'sketch-and-construct-ladies-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-dressmaking-and-tailoring-options-level-3';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN (TAILORING OPTION) LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-tailoring-option-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text),
  ('SKETCH AND CONSTRUCT GENTS GARMENTS', 'sketch-and-construct-gent-s-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-tailoring-option-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: HEALTH SCIENCE DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 12 | Total Units: 211
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: HEALTH SCIENCE DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'HEALTH SCIENCE DEPARTMENT', 'health-science-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Health Science courses in Community Health, Health Records, Medical Laboratory, Nutrition, and Perioperative Theatre.', 8
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department'
);

-- 4. Insert Non-Modular Courses under HEALTH SCIENCE DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COMMUNITY HEALTH LEVEL 6', 'community-health-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HEALTH RECORDS AND INFORMATION TECHNOLOGY LEVEL 6', 'health-records-and-information-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MEDICAL LABORATORY TECHNOLOGY LEVEL 6', 'medical-laboratory-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'NUTRITION AND DIETETICS LEVEL 6', 'nutrition-and-dietetics-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PERIOPERATIVE THEATRE TECHNOLOGY LEVEL 6', 'perioperative-theatre-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SCIENCE LABORATORY TECHNOLOGY LEVEL 6', 'science-laboratory-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COMMUNITY HEALTH LEVEL 5', 'community-health-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HEALTH RECORDS AND INFORMATION TECHNOLOGY LEVEL 5', 'health-records-and-information-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'NUTRITION AND DIETETICS LEVEL 5', 'nutrition-and-dietetics-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PERIOPERATIVE THEATRE TECHNOLOGY LEVEL 5', 'perioperative-theatre-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SCIENCE LABORATORY TECHNOLOGY LEVEL 5', 'science-laboratory-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COMMUNITY HEALTH LEVEL 4', 'community-health-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: COMMUNITY HEALTH LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';

-- Section 2: Core Units of Competency (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MICROBIOLOGY AND PARASITOLOGY', 'apply-basic-microbiology-and-parasitology', NULL::text),
  ('APPLY EPIDEMIOLOGY IN COMMUNITY HEALTH', 'apply-epidemiology-in-community-health', NULL::text),
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY', 'apply-human-anatomy-and-physiology', NULL::text),
  ('APPLY NUTRITION IN COMMUNITY HEALTH', 'apply-nutrition-in-community-health', NULL::text),
  ('CONDUCT COMMUNITY HEALTH DIAGNOSIS AND PARTNERSHIPS', 'conduct-community-health-diagnosis-and-partnerships', NULL::text),
  ('CONDUCT COMMUNITY HEALTH LINKAGES', 'conduct-community-health-linkages', NULL::text),
  ('CONDUCT COMMUNITY HEALTH RESEARCH', 'conduct-community-health-research', NULL::text),
  ('CONDUCT COMMUNITY-BASED HEALTH CARE', 'conduct-community-based-health-care', NULL::text),
  ('COORDINATE COMMUNITY HEALTH STRATEGIES', 'coordinate-community-health-strategies', NULL::text),
  ('MAINTAIN COMMUNITY HEALTH INFORMATION SYSTEM', 'maintain-community-health-information-system', NULL::text),
  ('MANAGE COMMUNITY HEALTH CARE', 'manage-community-health-care', NULL::text),
  ('MANAGE GENDER, DISABILITY, AND VULNERABLE GROUPS', 'manage-gender-disability-and-vulnerable-groups', NULL::text),
  ('MONITOR AND EVALUATE COMMUNITY HEALTH PROGRAMS', 'monitor-and-evaluate-community-health-programs', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';

-- ------------------------------------------------------------------------------
-- Course: HEALTH RECORDS AND INFORMATION TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'health-records-and-information-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'health-records-and-information-technology-level-6';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'health-records-and-information-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNITY HEALTH', 'apply-community-health', NULL::text),
  ('APPLY MEDICAL INSTRUMENTATION', 'apply-medical-instrumentation', NULL::text),
  ('APPLY MEDICAL PATHOLOGY', 'apply-medical-pathology', NULL::text),
  ('ARCHIVE MEDICAL RECORDS', 'archive-medical-records', NULL::text),
  ('CODE AND INDEX DISEASES', 'code-and-index-diseases', NULL::text),
  ('FILE MEDICAL RECORDS', 'file-medical-records', NULL::text),
  ('MANAGE ELECTRONIC HEALTH', 'manage-electronic-health', NULL::text),
  ('MANAGE HEALTH INFORMATION', 'manage-health-information', NULL::text),
  ('MANAGE HEALTH RECORDS', 'manage-health-records', NULL::text),
  ('MANAGE HEALTH RECORDS DATABASE', 'manage-health-records-database', NULL::text),
  ('REGISTER PATIENTS', 'register-patients', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'health-records-and-information-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: MEDICAL LABORATORY TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'medical-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'medical-laboratory-technology-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'medical-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BLOOD BANK AND TRANSFUSION', 'manage-blood-bank-and-transfusion', NULL::text),
  ('MANAGE MEDICAL LABORATORY FACILITY', 'manage-medical-laboratory-facility', NULL::text),
  ('MANAGE MEDICAL LABORATORY SAMPLES', 'manage-medical-laboratory-samples', NULL::text),
  ('PERFORM CLINICAL CHEMISTRY, PHARMACOLOGY AND TOXICOLOGY TESTS', 'perform-clinical-chemistry-pharmacology-and-toxicology-tests', NULL::text),
  ('PERFORM HEMATOLOGICAL TEST', 'perform-hematological-test', NULL::text),
  ('PERFORM HISTOLOGICAL TESTS', 'perform-histological-tests', NULL::text),
  ('PERFORM MICROBIOLOGICAL/MYCOLOGICAL AND SEROLOGICAL TESTS', 'perform-microbiological-mycological-and-serological-tests', NULL::text),
  ('PERFORM PARASITOLOGICAL TESTS', 'perform-parasitological-tests', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'medical-laboratory-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: NUTRITION AND DIETETICS LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';

-- Section 2: Common Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BIOCHEMICAL TECHNIQUES', 'apply-biochemical-techniques', NULL::text),
  ('CONDUCT RESEARCH METHODS AND STATISTICS', 'conduct-research-methods-and-statistics', NULL::text),
  ('DEMONSTRATE KNOWLEDGE OF FOOD MICROBIOLOGY TECHNIQUES', 'demonstrate-knowledge-of-food-microbiology-techniques', NULL::text),
  ('DEMONSTRATE THE KNOWLEDGE OF HUMAN ANATOMY', 'demonstrate-the-knowledge-of-human-anatomy', NULL::text),
  ('FOOD PROCESSING, SAFETY AND HYGIENE', 'food-processing-safety-and-hygiene', NULL::text),
  ('PECIFIES THE COMPETENCIES REQUIRED TO D', 'pecifies-the-competencies-required-to-d', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';

-- Section 3: Core Units of Competency (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIETETICS PRINCIPLES', 'apply-dietetics-principles', NULL::text),
  ('APPLY NUTRITION IN EMERGENCY', 'apply-nutrition-in-emergency', NULL::text),
  ('APPLY PRINCIPLES OF HUMAN NUTRITION', 'apply-principles-of-human-nutrition', NULL::text),
  ('CONDUCT NUTRITION ASSESSMENT AND SURVEILLANCE', 'conduct-nutrition-assessment-and-surveillance', NULL::text),
  ('CONDUCT NUTRITION CARE PROCESS', 'conduct-nutrition-care-process', NULL::text),
  ('CONDUCT NUTRITION EDUCATION AND COUNSELLING', 'conduct-nutrition-education-and-counselling', NULL::text),
  ('MANAGE MATERNAL AND CHILD NUTRITION', 'manage-maternal-and-child-nutrition', NULL::text),
  ('MANAGE NUTRITION IN THE LIFE CYCLE', 'manage-nutrition-in-the-life-cycle', NULL::text),
  ('PERFORM DIETETICS OPERATIONS', 'perform-dietetics-operations', NULL::text),
  ('PLAN AND MANAGE MEALS', 'plan-and-manage-meals', NULL::text),
  ('PROVIDE DIET THERAPY 1', 'provide-diet-therapy-1', NULL::text),
  ('PROVIDE DIET THERAPY 2', 'provide-diet-therapy-2', NULL::text),
  ('PROVIDE FIRST AID SERVICES', 'provide-first-aid-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';

-- ------------------------------------------------------------------------------
-- Course: PERIOPERATIVE THEATRE TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'perioperative-theatre-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'perioperative-theatre-technology-level-6';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'perioperative-theatre-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MEDICAL LEGAL ETHICS', 'apply-medical-legal-ethics', NULL::text),
  ('DEMONSTRATE KNOWLEDGE OF HUMAN ANATOMY AND PHYSIOLOGY', 'demonstrate-knowledge-of-human-anatomy-and-physiology', NULL::text),
  ('EXECUTE PERIOPERATIVE THEATRE SAFETY PRECAUTIONS', 'execute-perioperative-theatre-safety-precautions', NULL::text),
  ('EXECUTE THEATRE ADMINISTRATIVE SERVICES', 'execute-theatre-administrative-services', NULL::text),
  ('MAINTAIN PERIOPERATIVE THEATRE INSTRUMENTS AND APPARATUS', 'maintain-perioperative-theatre-instruments-and-apparatus', NULL::text),
  ('MANAGE PERIOPERATIVE THEATRE RESOURCES', 'manage-perioperative-theatre-resources', NULL::text),
  ('PARTICIPATE IN PERIOPERATIVE THEATRE CLINICAL SERVICES', 'participate-in-perioperative-theatre-clinical-services', NULL::text),
  ('PREVENT NOSOCOMIAL INFECTIONS', 'prevent-nosocomial-infections', NULL::text),
  ('PROVIDE FIRST AID SERVICES', 'provide-first-aid-services', NULL::text),
  ('PROVIDE HEALTH EDUCATION AND PROMOTION SERVICES', 'provide-health-education-and-promotion-services', NULL::text),
  ('PROVIDE PERIOPERATIVE THEATRE TECHNICAL SERVICES', 'provide-perioperative-theatre-technical-services', NULL::text),
  ('PROVIDE PSYCHOSOCIAL HEALTH SUPPORT SERVICES', 'provide-psychosocial-health-support-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'perioperative-theatre-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: SCIENCE LABORATORY TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Section 2: Core Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BIOLOGY TECHNIQUES', 'apply-biology-techniques', NULL::text),
  ('APPLY CHEMISTRY TECHNIQUES', 'apply-chemistry-techniques', NULL::text),
  ('APPLY PHYSICS TECHNIQUES', 'apply-physics-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: COMMUNITY HEALTH LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MICROBIOLOGY AND PARASITOLOGY', 'apply-basic-microbiology-and-parasitology', NULL::text),
  ('APPLY EPIDEMIOLOGY IN COMMUNITY HEALTH', 'apply-epidemiology-in-community-health', NULL::text),
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY', 'apply-human-anatomy-and-physiology', NULL::text),
  ('APPLY NUTRITION IN COMMUNITY HEALTH', 'apply-nutrition-in-community-health', NULL::text),
  ('CONDUCT COMMUNITY HEALTH LINKAGES', 'conduct-community-health-linkages', NULL::text),
  ('CONDUCT COMMUNITY HEALTH SERVICE STRATEGIES', 'conduct-community-health-service-strategies', NULL::text),
  ('CONDUCT COMMUNITY-BASED HEALTH CARE', 'conduct-community-based-health-care', NULL::text),
  ('MAINTAIN COMMUNITY HEALTH INFORMATION SYSTEM', 'maintain-community-health-information-system', NULL::text),
  ('MONITOR COMMUNITY HEALTH CARE', 'monitor-community-health-care', NULL::text),
  ('MONITOR GENDER, DISABILITY AND VULNERABLE GROUPS', 'monitor-gender-disability-and-vulnerable-groups', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';

-- ------------------------------------------------------------------------------
-- Course: HEALTH RECORDS AND INFORMATION TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'health-records-and-information-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'health-records-and-information-technology-level-5';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'health-records-and-information-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNITY HEALTH', 'apply-community-health', NULL::text),
  ('APPLY MEDICAL INSTRUMENTATION', 'apply-medical-instrumentation', NULL::text),
  ('ARCHIVE MEDICAL RECORDS', 'archive-medical-records', NULL::text),
  ('CODE AND INDEX DISEASES', 'code-and-index-diseases', NULL::text),
  ('COLLECT AND SUBMIT HEALTH DATA', 'collect-and-submit-health-data', NULL::text),
  ('FILE MEDICAL RECORDS', 'file-medical-records', NULL::text),
  ('MAINTAIN HEALTH RECORDS', 'maintain-health-records', NULL::text),
  ('MAINTAIN HEALTH RECORDS DATABASE', 'maintain-health-records-database', NULL::text),
  ('MANAGE ELECTRONIC HEALTH', 'manage-electronic-health', NULL::text),
  ('MANAGE HEALTH RECORDS', 'manage-health-records', NULL::text),
  ('REGISTER PATIENTS', 'register-patients', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'health-records-and-information-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: NUTRITION AND DIETETICS LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';

-- Section 2: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEMONSTRATE KNOWLEDGE OF FOOD MICROBIOLOGY TECHNIQUES', 'demonstrate-knowledge-of-food-microbiology-techniques', NULL::text),
  ('DEMONSTRATE KNOWLEDGE OF GENERAL BIOLOGY', 'demonstrate-knowledge-of-general-biology', NULL::text),
  ('MANAGE FOOD PROCESSING, SAFETY AND HYGIENE', 'manage-food-processing-safety-and-hygiene', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';

-- Section 3: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIETETIC PRINCIPLES', 'apply-dietetic-principles', NULL::text),
  ('APPLY NUTRITION IN EMERGENCY', 'apply-nutrition-in-emergency', NULL::text),
  ('APPLY PRINCIPLES OF HUMAN NUTRITION', 'apply-principles-of-human-nutrition', NULL::text),
  ('CONDUCT COMMUNITY HEALTH AND NUTRITION EDUCATION AND COUNSELLING', 'conduct-community-health-and-nutrition-education-and-counselling', NULL::text),
  ('CONDUCT NUTRITION ASSESSMENT AND SURVEILLANCE', 'conduct-nutrition-assessment-and-surveillance', NULL::text),
  ('CONDUCT NUTRITION CARE PROCESS', 'conduct-nutrition-care-process', NULL::text),
  ('PERFORM DIETETICS OPERATIONS', 'perform-dietetics-operations', NULL::text),
  ('PLAN AND MANAGE MEALS', 'plan-and-manage-meals', NULL::text),
  ('PROVIDE MATERNAL AND CHILD NUTRITION CARE', 'provide-maternal-and-child-nutrition-care', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';

-- ------------------------------------------------------------------------------
-- Course: PERIOPERATIVE THEATRE TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'perioperative-theatre-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'perioperative-theatre-technology-level-5';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'perioperative-theatre-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC HOSPITAL PROCEDURES', 'apply-basic-hospital-procedures', NULL::text),
  ('APPLY MEDICAL LEGAL ETHICS', 'apply-medical-legal-ethics', NULL::text),
  ('DEMONSTRATE KNOWLEDGE ON COMMON DISEASES', 'demonstrate-knowledge-on-common-diseases', NULL::text),
  ('DEMONSTRATE THE KNOWLEDGE OF HUMAN ANATOMY', 'demonstrate-the-knowledge-of-human-anatomy', NULL::text),
  ('EXECUTE PERIOPERATIVE SAFETY PRECAUTIONS', 'execute-perioperative-safety-precautions', NULL::text),
  ('EXECUTE PERIOPERATIVE THEATRE SAFETY PRACTICES', 'execute-perioperative-theatre-safety-practices', NULL::text),
  ('MAINTAIN OPERATION THEATRE INSTRUMENTS AND APPARATUS', 'maintain-operation-theatre-instruments-and-apparatus', NULL::text),
  ('PREVENT NOSOCOMIAL INFECTIONS', 'prevent-nosocomial-infections', NULL::text),
  ('PROVIDE FIRST AID SERVICES', 'provide-first-aid-services', NULL::text),
  ('PROVIDE HEALTH EDUCATION AND PROMOTION SERVICES', 'provide-health-education-and-promotion-services', NULL::text),
  ('PROVIDE PERIOPERATIVE THEATRE TECHNICAL SERVICES', 'provide-perioperative-theatre-technical-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'perioperative-theatre-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: SCIENCE LABORATORY TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'science-laboratory-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'science-laboratory-technology-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'science-laboratory-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BIOLOGY TECHNIQUES', 'apply-biology-techniques', NULL::text),
  ('APPLY CHEMISTRY TECHNIQUES', 'apply-chemistry-techniques', NULL::text),
  ('APPLY LABORATORY INSTRUMENTATION', 'apply-laboratory-instrumentation', NULL::text),
  ('APPLY PHYSICS TECHNIQUES', 'apply-physics-techniques', NULL::text),
  ('APPLY STANDARD LABORATORY PRACTICES', 'apply-standard-laboratory-practices', NULL::text),
  ('CARRY OUT WORKSHOP PRACTICE', 'carry-out-workshop-practice', NULL::text),
  ('CONDUCT SCIENCE LABORATORY PROJECT', 'conduct-science-laboratory-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'science-laboratory-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: COMMUNITY HEALTH LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-4';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MICROBIOLOGY AND PARASITOLOGY', 'apply-basic-microbiology-and-parasitology', NULL::text),
  ('APPLY EPIDEMIOLOGY IN COMMUNITY HEALTH WORKS', 'apply-epidemiology-in-community-health-works', NULL::text),
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY', 'apply-human-anatomy-and-physiology', NULL::text),
  ('APPLY NUTRITION IN COMMUNITY HEALTH', 'apply-nutrition-in-community-health', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-4';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONDUCT COMMUNITY HEALTH LINKAGES', 'conduct-community-health-linkages', NULL::text),
  ('CONDUCT COMMUNITY HEALTH SERVICE STRATEGIES', 'conduct-community-health-service-strategies', NULL::text),
  ('CONDUCT COMMUNITY-BASED HEALTHCARE', 'conduct-community-based-healthcare', NULL::text),
  ('MAINTAIN COMMUNITY HEALTH INFORMATION SYSTEMS', 'maintain-community-health-information-systems', NULL::text),
  ('MONITOR GENDER, DISABILITY AND VULNERABLE GROUPS', 'monitor-gender-disability-and-vulnerable-groups', NULL::text),
  ('PROVIDE COMMUNITY HEALTH CARE', 'provide-community-health-care', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department' AND c.slug = 'community-health-level-4';


-- ==============================================================================
-- SEED SCRIPT FOR: CATERING AND ACCOMMODATION DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 23 | Total Units: 325
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: CATERING AND ACCOMMODATION DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'CATERING AND ACCOMMODATION DEPARTMENT', 'catering-and-accommodation-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Catering, Baking, Food Production, Housekeeping, Tour & Travel, and Wildlife Management courses.', 9
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department'
);

-- 4. Insert Non-Modular Courses under CATERING AND ACCOMMODATION DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BAKING TECHNOLOGY LEVEL 6', 'baking-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD & BEVERAGE SALES AND SERVICE MANAGEMENT LEVEL 6', 'food-and-beverage-sales-and-service-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION (CULINARY ARTS) LEVEL 6', 'food-production-culinary-arts-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD TECHNOLOGY LEVEL 6', 'food-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HOUSEKEEPING AND ACCOMMODATION LEVEL 6', 'housekeeping-and-accommodation-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOURISM AND TRAVEL MANAGEMENT LEVEL 6', 'tourism-and-travel-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BAKING TECHNOLOGY LEVEL 5', 'baking-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE PRODUCTION (CULINARY ARTS) LEVEL 5', 'food-and-beverage-production-culinary-arts-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE SALES AND SERVICE LEVEL 5', 'food-and-beverage-sales-and-service-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION (CULINARY ARTS) LEVEL 5', 'food-production-culinary-arts-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD TECHNOLOGY LEVEL 5', 'food-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HOUSEKEEPING AND ACCOMMODATION LEVEL 5', 'housekeeping-and-accommodation-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOUR AND TRAVEL CONSULTANCY LEVEL 5', 'tour-and-travel-consultancy-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOUR AND TRAVEL CONSULTANT LEVEL 5', 'tour-and-travel-consultant-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOUR GUIDE LEVEL 5', 'tour-guide-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WILDLIFE MANAGEMENT ASSISTANT LEVEL 5', 'wildlife-management-assistant-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BAKING TECHNOLOGY (CAKE DECORATION AND PASTRY) LEVEL 4', 'baking-technology-cake-decoration-and-pastry-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE PRODUCTION (CULINARY ART) LEVEL 4', 'food-and-beverage-production-culinary-art-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE SALES AND SERVICE LEVEL 4', 'food-and-beverage-sales-and-service-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION (CULINARY ARTS) LEVEL 4', 'food-production-culinary-arts-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HOUSEKEEPING AND ACCOMMODATION LEVEL 4', 'housekeeping-and-accommodation-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE SALES AND SERVICE OPERATOR LEVEL 3', 'food-and-beverage-sales-and-service-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION (CULINARY ARTS) TECHNICIAN LEVEL 3', 'food-production-culinary-arts-technician-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: BAKING TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEMONSTRATE UNDERSTANDING OF BAKERY PLANT AND EQUIPMENT', 'demonstrate-understanding-of-bakery-plant-and-equipment', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF BAKING RAW MATERIALS SCIENCE', 'demonstrate-understanding-of-baking-raw-materials-science', NULL::text),
  ('MANAGE BAKERY PRODUCTION DEPARTMENT', 'manage-bakery-production-department', NULL::text),
  ('MANAGE BAKERY PRODUCTS QUALITY', 'manage-bakery-products-quality', NULL::text),
  ('MANAGE CAKE DECORATION', 'manage-cake-decoration', NULL::text),
  ('MANAGE CAKE PRODUCTION', 'manage-cake-production', NULL::text),
  ('MANAGE PRODUCTION OF PASTRY PRODUCTS', 'manage-production-of-pastry-products', NULL::text),
  ('MANAGE PRODUCTION OF YEAST PRODUCTS', 'manage-production-of-yeast-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: FOOD & BEVERAGE SALES AND SERVICE MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-management-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BANQUET AND EVENT OPERATIONS', 'manage-banquet-and-event-operations', NULL::text),
  ('MANAGE BAR OPERATIONS', 'manage-bar-operations', NULL::text),
  ('MANAGE FOOD AND BEVERAGE GUEST EXPERIENCE', 'manage-food-and-beverage-guest-experience', NULL::text),
  ('MANAGE FOOD AND BEVERAGE OPERATIONS', 'manage-food-and-beverage-operations', NULL::text),
  ('MANAGE FOOD AND BEVERAGES REVENUE PERFORMANCE', 'manage-food-and-beverages-revenue-performance', NULL::text),
  ('MANAGE ROOM SERVICE', 'manage-room-service', NULL::text),
  ('MANAGE SPECIALTY OUTLETS', 'manage-specialty-outlets', NULL::text),
  ('PERFORM FOOD AND BEVERAGE DEPARTMENT ADMINISTRATIVE DUTIES', 'perform-food-and-beverage-department-administrative-duties', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION (CULINARY ARTS) LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE BREADS', 'prepare-breads', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE MEATS', 'prepare-meats', NULL::text),
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE SALADS', 'prepare-salads', NULL::text),
  ('PREPARE SAUCES', 'prepare-sauces', NULL::text),
  ('PREPARE SOUPS', 'prepare-soups', NULL::text),
  ('PREPARE STOCKS', 'prepare-stocks', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-6';

-- ------------------------------------------------------------------------------
-- Course: FOOD TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP NEW FOOD PRODUCT', 'develop-new-food-product', NULL::text),
  ('MANAGE FOOD PROCESSING PLANT', 'manage-food-processing-plant', NULL::text),
  ('MANAGE QUALITY OF FOOD PRODUCTS', 'manage-quality-of-food-products', NULL::text),
  ('PROCESS FOOD PRODUCTS', 'process-food-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: HOUSEKEEPING AND ACCOMMODATION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-6';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE FACILITIES, PROPERTY REPAIRS AND MAINTENANCE', 'manage-facilities-property-repairs-and-maintenance', NULL::text),
  ('MANAGE FRONT OFFICE OPERATIONS', 'manage-front-office-operations', NULL::text),
  ('MANAGE GUEST EXPERIENCE', 'manage-guest-experience', NULL::text),
  ('MANAGE HOUSEKEEPING OPERATIONS', 'manage-housekeeping-operations', NULL::text),
  ('MANAGE LAUNDRY AND LINEN OPERATIONS', 'manage-laundry-and-linen-operations', NULL::text),
  ('PERFORM HOUSEKEEPING DEPARTMENT ADMINISTRATIVE DUTIES', 'perform-housekeeping-department-administrative-duties', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-6';

-- ------------------------------------------------------------------------------
-- Course: TOURISM AND TRAVEL MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tourism-and-travel-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tourism-and-travel-management-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tourism-and-travel-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP TOUR PACKAGES', 'develop-tour-packages', NULL::text),
  ('DEVELOP TRAVEL PACKAGE', 'develop-travel-package', NULL::text),
  ('MANAGE TOUR AND TRAVEL PRODUCT QUALITY', 'manage-tour-and-travel-product-quality', NULL::text),
  ('MANAGE TOUR DELIVERY', 'manage-tour-delivery', NULL::text),
  ('MANAGE TOUR OFFICE OPERATIONS', 'manage-tour-office-operations', NULL::text),
  ('MANAGE TRAVEL OFFICE OPERATIONS', 'manage-travel-office-operations', NULL::text),
  ('MANAGE TRAVEL SERVICE DELIVERY', 'manage-travel-service-delivery', NULL::text),
  ('MARKET TOUR AND TRAVEL PRODUCTS', 'market-tour-and-travel-products', NULL::text),
  ('PROMOTE SUSTAINABLE TOURISM', 'promote-sustainable-tourism', NULL::text),
  ('SUPERVISE CUSTOMER SERVICE', 'supervise-customer-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tourism-and-travel-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: BAKING TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY SCIENTIFIC THEORY IN BAKING TECHNOLOGY', 'apply-scientific-theory-in-baking-technology', NULL::text),
  ('DECORATE CAKES', 'decorate-cakes', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF BAKING RAW MATERIALS', 'demonstrate-understanding-of-baking-raw-materials', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF PLANT AND EQUIPMENT', 'demonstrate-understanding-of-plant-and-equipment', NULL::text),
  ('PRODUCE CAKES', 'produce-cakes', NULL::text),
  ('PRODUCE PASTRY PRODUCTS', 'produce-pastry-products', NULL::text),
  ('PRODUCE YEAST PRODUCTS', 'produce-yeast-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE PRODUCTION (CULINARY ARTS) LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-arts-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-arts-level-5';

-- Section 2: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-arts-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUTCHERY', 'butchery', NULL::text),
  ('COOK MEAT AND SAUCES', 'cook-meat-and-sauces', NULL::text),
  ('MANAGE FOOD AND BEVERAGE OPERATIONS', 'manage-food-and-beverage-operations', NULL::text),
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text),
  ('PREPARE COLD STARTERS, FRUIT VEGETABLE SALADS AND CANAPES', 'prepare-cold-starters-fruit-vegetable-salads-and-canapes', NULL::text),
  ('PREPARE CUTS OF MEAT', 'prepare-cuts-of-meat', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE EGGS', 'prepare-eggs', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE SALADS AND SALAD DRESSINGS', 'prepare-salads-and-salad-dressings', NULL::text),
  ('PREPARE SANDWICHES', 'prepare-sandwiches', NULL::text),
  ('PREPARE STOCKS AND SOUPS', 'prepare-stocks-and-soups', NULL::text),
  ('PREPARE YEAST PRODUCT', 'prepare-yeast-product', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-arts-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE SALES AND SERVICE LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BANQUET AND EVENT OPERATIONS', 'manage-banquet-and-event-operations', NULL::text),
  ('MANAGE BAR OPERATIONS', 'manage-bar-operations', NULL::text),
  ('MANAGE FOOD AND BEVERAGE GUEST EXPERIENCE', 'manage-food-and-beverage-guest-experience', NULL::text),
  ('MANAGE FOOD AND BEVERAGE OPERATIONS', 'manage-food-and-beverage-operations', NULL::text),
  ('MANAGE SPECIALITY OUTLETS', 'manage-speciality-outlets', NULL::text),
  ('PERFORM FOOD AND BEVERAGE DEPARTMENT ADMINISTRATIVE DUTIES', 'perform-food-and-beverage-department-administrative-duties', NULL::text),
  ('SUPERVISE ROOM SERVICE OPERATIONS', 'supervise-room-service-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION (CULINARY ARTS) LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-5';

-- Section 2: Core Units of Competency (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COOK MEAT AND SAUCES', 'cook-meat-and-sauces', NULL::text),
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text),
  ('PREPARE COLD STARTERS, FRUIT VEGETABLE SALADS AND CANAPES', 'prepare-cold-starters-fruit-vegetable-salads-and-canapes', NULL::text),
  ('PREPARE CUTS OF MEAT', 'prepare-cuts-of-meat', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE EGGS', 'prepare-eggs', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE SALADS AND SALAD DRESSING', 'prepare-salads-and-salad-dressing', NULL::text),
  ('PREPARE SANDWICHES', 'prepare-sandwiches', NULL::text),
  ('PREPARE STOCKS, SOUPS AND SAUCES', 'prepare-stocks-soups-and-sauces', NULL::text),
  ('PREPARE YEAST PRODUCTS', 'prepare-yeast-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOD TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP NEW FOOD PRODUCT', 'develop-new-food-product', NULL::text),
  ('MAINTAIN FOOD PRODUCT QUALITY', 'maintain-food-product-quality', NULL::text),
  ('MAINTAINING FOOD PLANT HYGIENE', 'maintaining-food-plant-hygiene', NULL::text),
  ('PROCESS FOOD PRODUCTS', 'process-food-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: HOUSEKEEPING AND ACCOMMODATION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COORDINATE LAUNDRY AND LINEN OPERATIONS', 'coordinate-laundry-and-linen-operations', NULL::text),
  ('MANAGE GUEST EXPERIENCE', 'manage-guest-experience', NULL::text),
  ('MANAGE HOUSEKEEPING OPERATIONS', 'manage-housekeeping-operations', NULL::text),
  ('OVERSEE FACILITY AND PROPERTY REPAIRS AND MAINTENANCE', 'oversee-facility-and-property-repairs-and-maintenance', NULL::text),
  ('OVERSEE FRONT OFFICE OPERATIONS', 'oversee-front-office-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-5';

-- ------------------------------------------------------------------------------
-- Course: TOUR AND TRAVEL CONSULTANCY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultancy-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultancy-level-5';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultancy-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP TOUR PACKAGES', 'develop-tour-packages', NULL::text),
  ('DEVELOP TRAVEL PACKAGES', 'develop-travel-packages', NULL::text),
  ('MANAGE TOUR DELIVERY', 'manage-tour-delivery', NULL::text),
  ('MARKET TOUR AND TRAVEL PRODUCTS', 'market-tour-and-travel-products', NULL::text),
  ('PARTICIPATE IN TOUR OFFICE OPERATIONS', 'participate-in-tour-office-operations', NULL::text),
  ('PARTICIPATE IN TRAVEL OFFICE OPERATIONS', 'participate-in-travel-office-operations', NULL::text),
  ('PARTICIPATE IN TRAVEL SERVICE DELIVERY', 'participate-in-travel-service-delivery', NULL::text),
  ('PROMOTE SUSTAINABLE TOURISM', 'promote-sustainable-tourism', NULL::text),
  ('PROVIDE TOUR AND TRAVEL CUSTOMER SERVICE', 'provide-tour-and-travel-customer-service', NULL::text),
  ('PROVIDE TOUR GUIDING SERVICES', 'provide-tour-guiding-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultancy-level-5';

-- ------------------------------------------------------------------------------
-- Course: TOUR AND TRAVEL CONSULTANT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultant-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultant-level-5';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultant-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP TOUR PACKAGE', 'develop-tour-package', NULL::text),
  ('DEVELOP TRAVEL PACKAGE', 'develop-travel-package', NULL::text),
  ('MARKET TRAVEL AND TOUR PRODUCT', 'market-travel-and-tour-product', NULL::text),
  ('PARTICIPATE IN TOUR DELIVERY', 'participate-in-tour-delivery', NULL::text),
  ('PARTICIPATE IN TRAVEL OFFICE OPERATIONS', 'participate-in-travel-office-operations', NULL::text),
  ('PARTICIPATE IN TRAVEL SERVICE DELIVERY', 'participate-in-travel-service-delivery', NULL::text),
  ('PROMOTE SUSTAINABLE TOURISM', 'promote-sustainable-tourism', NULL::text),
  ('PROVIDE TOUR GUIDING SERVICES', 'provide-tour-guiding-services', NULL::text),
  ('SUPERVISE CUSTOMER SERVICE', 'supervise-customer-service', NULL::text),
  ('SUPERVISE TOUR OFFICE OPERATIONS', 'supervise-tour-office-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultant-level-5';

-- ------------------------------------------------------------------------------
-- Course: TOUR GUIDE LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ACQUIRE TOUR RESOURCES (HUMAN RESOURCE, TOOLS AND EQUIPMENT)', 'acquire-tour-resources-human-resource-tools-and-equipment', NULL::text),
  ('CONDUCT EXPERIENTIAL TOUR BOOKINGS & RESERVATIONS', 'conduct-experiential-tour-bookings-and-reservations', NULL::text),
  ('DEMONSTRATE RISK MANAGEMENT SKILLS', 'demonstrate-risk-management-skills', NULL::text),
  ('HANDLE TOURIST ARRIVALS AND DEPARTURES', 'handle-tourist-arrivals-and-departures', NULL::text),
  ('HOSPITALITY AND TOURISM CAREER PATHWAYS', 'hospitality-and-tourism-career-pathways', NULL::text),
  ('MANAGE GUEST EXPERIENCE', 'manage-guest-experience', NULL::text),
  ('ORGANIZE EXPERIENTIAL TOURS (FOOD AND BEVERAGE)', 'organize-experiential-tours-food-and-beverage', NULL::text),
  ('PACKAGE EXPERIENTIAL TOURS', 'package-experiential-tours', NULL::text),
  ('PROVIDE EXPERIENTIAL TOUR INTERPRETATION', 'provide-experiential-tour-interpretation', NULL::text),
  ('SUSTAINABLE TOURISM', 'sustainable-tourism', NULL::text),
  ('TOURISM AND HOSPITALITY MARKETING EXPERIENCES', 'tourism-and-hospitality-marketing-experiences', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';

-- ------------------------------------------------------------------------------
-- Course: WILDLIFE MANAGEMENT ASSISTANT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-management-assistant-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-management-assistant-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-management-assistant-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MONITOR WILDLIFE HABITATS', 'monitor-wildlife-habitats', NULL::text),
  ('PROVIDE HERPETOLOGICAL SERVICES', 'provide-herpetological-services', NULL::text),
  ('PROVIDE MAMMALOGY SERVICES', 'provide-mammalogy-services', NULL::text),
  ('PROVIDE ORNITHOLOGICAL SERVICES', 'provide-ornithological-services', NULL::text),
  ('PROVIDE PLANT TAXONOMY SERVICES', 'provide-plant-taxonomy-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-management-assistant-level-5';

-- ------------------------------------------------------------------------------
-- Course: BAKING TECHNOLOGY (CAKE DECORATION AND PASTRY) LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-cake-decoration-and-pastry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DECORATE CAKES', 'decorate-cakes', NULL::text),
  ('PRODUCE PASTRY PRODUCTS', 'produce-pastry-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-cake-decoration-and-pastry-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE PRODUCTION (CULINARY ART) LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-art-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-art-level-4';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-art-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUTCHERY', 'butchery', NULL::text),
  ('COOK MEATS', 'cook-meats', NULL::text),
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text),
  ('PREPARE CUTS OF MEATS (BUTCHERY)', 'prepare-cuts-of-meats-butchery', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE EGGS', 'prepare-eggs', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE SALAD AND SALAD DRESSINGS', 'prepare-salad-and-salad-dressings', NULL::text),
  ('PREPARE SANDWICHES', 'prepare-sandwiches', NULL::text),
  ('PREPARE STOCKS AND SOUPS', 'prepare-stocks-and-soups', NULL::text),
  ('PREPARE YEAST PRODUCT', 'prepare-yeast-product', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-art-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE SALES AND SERVICE LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-4';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT BAR OPERATIONS', 'carry-out-bar-operations', NULL::text),
  ('HANDLE GUEST RESERVATIONS', 'handle-guest-reservations', NULL::text),
  ('OPERATE SPECIALITY OUTLETS', 'operate-speciality-outlets', NULL::text),
  ('PERFORM FOOD AND BEVERAGE OPERATIONS', 'perform-food-and-beverage-operations', NULL::text),
  ('PREPARE CEREALS, VEGETABLES, FRUITS AND NUTS', 'prepare-cereals-vegetables-fruits-and-nuts', NULL::text),
  ('PROVIDE BANQUETS AND EVENTS SERVICES', 'provide-banquets-and-events-services', NULL::text),
  ('PROVIDE FOOD AND BEVERAGE GUEST EXPERIENCE', 'provide-food-and-beverage-guest-experience', NULL::text),
  ('SUPERVISE ROOM SERVICE OPERATIONS', 'supervise-room-service-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION (CULINARY ARTS) LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-4';

-- Section 2: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COOK RED, WHITE MEATS AND OFFAL', 'cook-red-white-meats-and-offal', NULL::text),
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text),
  ('PREPARE CEREALS, VEGETABLES, FRUITS AND NUTS', 'prepare-cereals-vegetables-fruits-and-nuts', NULL::text),
  ('PREPARE CUTS OF MEAT', 'prepare-cuts-of-meat', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE EGGS', 'prepare-eggs', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE MAIN DISHES', 'prepare-main-dishes', NULL::text),
  ('PREPARE SALADS AND SALAD DRESSING', 'prepare-salads-and-salad-dressing', NULL::text),
  ('PREPARE SANDWICHES', 'prepare-sandwiches', NULL::text),
  ('PREPARE SAUCES', 'prepare-sauces', NULL::text),
  ('PREPARE SOUPS', 'prepare-soups', NULL::text),
  ('PREPARE STOCKS AND SOUPS', 'prepare-stocks-and-soups', NULL::text),
  ('PREPARE YEAST PRODUCTS', 'prepare-yeast-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-4';

-- ------------------------------------------------------------------------------
-- Course: HOUSEKEEPING AND ACCOMMODATION LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COORDINATE FACILITY AND PROPERTY REPAIRS AND MAINTENANCE', 'coordinate-facility-and-property-repairs-and-maintenance', NULL::text),
  ('COORDINATE FRONT OFFICE OPERATIONS', 'coordinate-front-office-operations', NULL::text),
  ('SUPERVISE GUEST EXPERIENCE', 'supervise-guest-experience', NULL::text),
  ('SUPERVISE HOUSEKEEPING OPERATIONS', 'supervise-housekeeping-operations', NULL::text),
  ('SUPERVISE LAUNDRY AND LINEN OPERATIONS', 'supervise-laundry-and-linen-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE SALES AND SERVICE OPERATOR LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-operator-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MERCHANDIZE FOOD AND BEVERAGE PRODUCTS', 'merchandize-food-and-beverage-products', NULL::text),
  ('SERVE FOOD AND BEVERAGE ORDERS', 'serve-food-and-beverage-orders', NULL::text),
  ('SET-UP FOR FOOD AND BEVERAGE SERVICE', 'set-up-for-food-and-beverage-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-operator-level-3';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION (CULINARY ARTS) TECHNICIAN LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-technician-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BUTCHERY', 'butchery', NULL::text),
  ('PREPARE HOT AND COLD BEVERAGES', 'prepare-hot-and-cold-beverages', NULL::text),
  ('PREPARE MEATS, FISH, SEA FOODS AND POULTRY AND SAUCES', 'prepare-meats-fish-sea-foods-and-poultry-and-sauces', NULL::text),
  ('PREPARE PASTRY AND BREADS', 'prepare-pastry-and-breads', NULL::text),
  ('PREPARE SALADS AND SALAD DRESSINGS', 'prepare-salads-and-salad-dressings', NULL::text),
  ('PREPARE VEGETABLES, STARCHES AND SOUPS', 'prepare-vegetables-starches-and-soups', NULL::text),
  ('REPAIR STOCKS', 'repair-stocks', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-technician-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 33 | Total Units: 538
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT', 'mechanical-and-automotive-engineering-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Mechanical and Automotive Engineering courses in Automotive, Mechatronics, Industrial Plant, Refrigeration, and Welding.', 10
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department'
);

-- 4. Insert Non-Modular Courses under MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOBODY TECHNICIAN LEVEL 6', 'autobody-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE MECHATRONICS TECHNOLOGY LEVEL 6', 'automotive-mechatronics-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE ENGINEERING TECHNICIAN LEVEL 6', 'automotive-engineering-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE TECHNICIAN LEVEL 6', 'automotive-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL AUTOMATION AND ROBOTICS LEVEL 6', 'industrial-automation-and-robotics-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL CONTROL AND INSTRUMENTATION LEVEL 6', 'industrial-control-and-instrumentation-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL MECHATRONICS TECHNOLOGY LEVEL 6', 'industrial-mechatronics-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL PLANT OPERATIONS LEVEL 6', 'industrial-plant-operations-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PLANT TECHNOLOGY LEVEL 6', 'mechanical-plant-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL TECHNOLOGY (PRODUCTION) LEVEL 6', 'mechanical-technology-production-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL TECHNOLOGY AND MAINTENANCE TECHNICIAN LEVEL 6', 'mechanical-technology-and-maintenance-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHATRONIC TECHNICIAN LEVEL 6', 'mechatronic-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'REFRIGERATION AND AIR CONDITIONING TECHNICIAN LEVEL 6', 'refrigeration-and-air-conditioning-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING AND FABRICATION LEVEL 6', 'welding-and-fabrication-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE CRAFTSPERSON LEVEL 5', 'automotive-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE ENGINEERING LEVEL 5', 'automotive-engineering-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE TECHNICIAN LEVEL 5', 'automotive-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL PLANT OPERATIONS LEVEL 5', 'industrial-plant-operations-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PLANT TECHNICIAN LEVEL 5', 'mechanical-plant-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION TECHNICIAN LEVEL 5', 'mechanical-production-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHATRONICS TECHNOLOGY LEVEL 5', 'mechatronics-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'REFRIGERATION AND AIR CONDITIONING CRAFTSPERSON LEVEL 5', 'refrigeration-and-air-conditioning-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING AND FABRICATION CRAFTSPERSON LEVEL 5', 'welding-and-fabrication-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE MECHANIC LEVEL 4', 'automotive-mechanic-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE TECHNOLOGY LEVEL 4', 'automotive-technology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE TECHNOLOGY LEVEL 4', 'automotive-technology-level-4-2', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL PLANT OPERATIONS LEVEL 4', 'industrial-plant-operations-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MANUAL METAL ARC AND GAS METAL ARC WELDING LEVEL 4', 'manual-metal-arc-and-gas-metal-arc-welding-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION (LATHE AND FABRICATION) ARTISAN LEVEL 4', 'mechanical-production-lathe-and-fabrication-artisan-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'REFRIGERATION AND AIR CONDITIONING ARTISAN LEVEL 4', 'refrigeration-and-air-conditioning-artisan-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING LEVEL 4', 'welding-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE MECHANIC LEVEL 3', 'automotive-mechanic-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GAS WELDING LEVEL 3', 'gas-welding-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: AUTOBODY TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technician-level-6';

-- Section 2: Core Units of Competency (17 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY ENGINEERING MECHANICS PRINCIPLES', 'apply-engineering-mechanics-principles', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('ASSEMBLE VEHICLE BODY PARTS', 'assemble-vehicle-body-parts', NULL::text),
  ('DESIGN VEHICLE BODY STRUCTURE', 'design-vehicle-body-structure', NULL::text),
  ('DRIVE MOTOR VEHICLE', 'drive-motor-vehicle', NULL::text),
  ('FABRICATE AUTOMOTIVE STRUCTURE', 'fabricate-automotive-structure', NULL::text),
  ('PANEL VEHICLE STRUCTURE', 'panel-vehicle-structure', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text),
  ('PERFORM VEHICLE PREVENTIVE MAINTENANCE', 'perform-vehicle-preventive-maintenance', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('SPRAY PAINT VEHICLE BODY', 'spray-paint-vehicle-body', NULL::text),
  ('TRIM VEHICLE BODY', 'trim-vehicle-body', NULL::text),
  ('WELD VEHICLE BODY PARTS', 'weld-vehicle-body-parts', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE MECHATRONICS TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechatronics-technology-level-6';

-- Section 2: Core Units of Competency (23 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('MAINTAIN BUS VEHICLE COMMUNICATION SYSTEMS', 'maintain-bus-vehicle-communication-systems', NULL::text),
  ('MAINTAIN MOTOR VEHICLE BRAKING SYSTEM', 'maintain-motor-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE ELECTRICAL SYSTEM', 'maintain-vehicle-electrical-system', NULL::text),
  ('MAINTAIN VEHICLE ELECTRONICS AND TRANSDUCERS', 'maintain-vehicle-electronics-and-transducers', NULL::text),
  ('MAINTAIN VEHICLE ENGINE', 'maintain-vehicle-engine', NULL::text),
  ('MAINTAIN VEHICLE FUEL SYSTEM', 'maintain-vehicle-fuel-system', NULL::text),
  ('MAINTAIN VEHICLE POWER STEERING SYSTEM', 'maintain-vehicle-power-steering-system', NULL::text),
  ('MAINTAIN VEHICLE SAFETY AND COMFORT SYSTEM', 'maintain-vehicle-safety-and-comfort-system', NULL::text),
  ('MAINTAIN VEHICLE STEERING SYSTEM', 'maintain-vehicle-steering-system', NULL::text),
  ('MAINTAIN VEHICLE SUSPENSION SYSTEM', 'maintain-vehicle-suspension-system', NULL::text),
  ('MAINTAIN VEHICLE TRANSMISSION SYSTEM', 'maintain-vehicle-transmission-system', NULL::text),
  ('PERFORM VEHICLE PREVENTIVE MAINTENANCE', 'perform-vehicle-preventive-maintenance', NULL::text),
  ('RETROFIT MOTOR VEHICLE ELECTROMECHANICAL EQUIPMENT', 'retrofit-motor-vehicle-electromechanical-equipment', NULL::text),
  ('SERVICE VEHICLE AIR CONDITIONING SYSTEM', 'service-vehicle-air-conditioning-system', NULL::text),
  ('SERVICE VEHICLE HYBRID SYSTEMS', 'service-vehicle-hybrid-systems', NULL::text),
  ('SERVICE VEHICLE INFOTAINMENT SYSTEM', 'service-vehicle-infotainment-system', NULL::text),
  ('SERVICE VEHICLE SECURITY SYSTEM', 'service-vehicle-security-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechatronics-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE ENGINEERING TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technician-level-6';

-- Section 2: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLE', 'apply-workshop-technology-principle', NULL::text),
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE COMPONENTS', 'service-and-repair-vehicle-engine-components', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEM', 'service-vehicle-steering-system', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEMS', 'service-vehicle-suspension-systems', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEMS', 'service-vehicle-transmission-systems', NULL::text),
  ('SERVICING VEHICLE BRAKING SYSTEM', 'servicing-vehicle-braking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AUTOMOTIVE ENGINEERING SCIENCE PRINCIPLES', 'apply-automotive-engineering-science-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';

-- Section 3: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE COMPONENTS', 'service-and-repair-vehicle-engine-components', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEM', 'service-vehicle-braking-system', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEM', 'service-vehicle-steering-system', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEMS', 'service-vehicle-suspension-systems', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEM', 'service-vehicle-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL AUTOMATION AND ROBOTICS LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-level-6';

-- Section 2: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP AND MAINTAIN DATA COMMUNICATIONS SYSTEMS', 'develop-and-maintain-data-communications-systems', NULL::text),
  ('INSTALL AND MAINTAIN AUTOMATION SYSTEM COMPONENTS', 'install-and-maintain-automation-system-components', NULL::text),
  ('INSTALL AND MAINTAIN DISTRIBUTED CONTROL SYSTEMS (DCSS)', 'install-and-maintain-distributed-control-systems-dcss', NULL::text),
  ('INSTALL AND MAINTAIN HUMAN MACHINE INTERFACES', 'install-and-maintain-human-machine-interfaces', NULL::text),
  ('INSTALL AND MAINTAIN PROGRAMMABLE LOGIC CONTROLLERS', 'install-and-maintain-programmable-logic-controllers', NULL::text),
  ('INSTALL AND MAINTAIN ROBOTIC SYSTEMS', 'install-and-maintain-robotic-systems', NULL::text),
  ('INSTALL AND MAINTAIN STAND-ALONE CONTROLLERS', 'install-and-maintain-stand-alone-controllers', NULL::text),
  ('INSTALL AND MAINTAIN SUPERVISORY CONTROL AND DATA ACQUISITION', 'install-and-maintain-supervisory-control-and-data-acquisition', NULL::text),
  ('MAINTAIN MECHANICAL SYSTEMS', 'maintain-mechanical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL CONTROL AND INSTRUMENTATION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-control-and-instrumentation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-control-and-instrumentation-level-6';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-control-and-instrumentation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ANALYZE ALTERNATIVE ENERGY SYSTEMS/ SOLAR PV', 'analyze-alternative-energy-systems-solar-pv', NULL::text),
  ('MANAGE ELECTRICAL MOTOR CONTROL SYSTEMS', 'manage-electrical-motor-control-systems', NULL::text),
  ('MANAGE HIGH VOLTAGE SYSTEMS', 'manage-high-voltage-systems', NULL::text),
  ('MANAGE INSTRUMENTATION AND PROCESS CONTROL SYSTEMS', 'manage-instrumentation-and-process-control-systems', NULL::text),
  ('MANAGE PROGRAMMABLE LOGIC CONTROLLERS (PLCS) AND SCADA SYSTEMS', 'manage-programmable-logic-controllers-plcs-and-scada-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-control-and-instrumentation-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL MECHATRONICS TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Section 2: Core Units of Competency (21 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONIC PRINCIPLES.', 'apply-electrical-and-electronic-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY ENGINEERING MECHANICS PRINCIPLES', 'apply-engineering-mechanics-principles', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('DESIGN ELECTROMECHANICAL SYSTEMS', 'design-electromechanical-systems', NULL::text),
  ('DESIGN HYDRAULIC AND PNEUMATIC SYSTEMS', 'design-hydraulic-and-pneumatic-systems', NULL::text),
  ('INSTALL ELECTROMECHANICAL SYSTEMS', 'install-electromechanical-systems', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEMS', 'install-hydraulic-and-pneumatic-systems', NULL::text),
  ('INSTALL ROBOTIC SYSTEMS', 'install-robotic-systems', NULL::text),
  ('MAINTAIN ELECTROMECHANICAL SYSTEMS', 'maintain-electromechanical-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN PROGRAMMABLE LOGIC CONTROLLER (PLC) SYSTEMS', 'maintain-programmable-logic-controller-plc-systems', NULL::text),
  ('MAINTAIN ROBOTIC SYSTEMS', 'maintain-robotic-systems', NULL::text),
  ('MAINTAIN SUPERVISORY CONTROL AND DATA ACQUISITION (SCADA) SYSTEMS', 'maintain-supervisory-control-and-data-acquisition-scada-systems', NULL::text),
  ('MANAGE INDUSTRIAL RESOURCES', 'manage-industrial-resources', NULL::text),
  ('OPERATE FABRICATION MACHINERY', 'operate-fabrication-machinery', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text),
  ('PROGRAM PROGRAMMABLE LOGIC CONTROLLER (PLC) SYSTEMS', 'program-programmable-logic-controller-plc-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL PLANT OPERATIONS LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-6';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INDUSTRIAL PUMPS', 'maintain-industrial-pumps', NULL::text),
  ('OPERATE AND MAINTAIN INDUSTRIAL BOILERS', 'operate-and-maintain-industrial-boilers', NULL::text),
  ('OPERATE AND MAINTAIN INDUSTRIAL HYDRAULICS SYSTEMS', 'operate-and-maintain-industrial-hydraulics-systems', NULL::text),
  ('OPERATE AND MAINTAIN INDUSTRIAL STEAM TURBINES', 'operate-and-maintain-industrial-steam-turbines', NULL::text),
  ('OPERATE AND MAINTAIN PNEUMATIC SYSTEMS', 'operate-and-maintain-pneumatic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PLANT TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL PLANT MACHINERY', 'install-plant-machinery', NULL::text),
  ('MAINTAIN BOILER AND STEAM SYSTEMS', 'maintain-boiler-and-steam-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN MATERIAL HANDLING SYSTEMS', 'maintain-material-handling-systems', NULL::text),
  ('MAINTAIN PLANT MACHINERY', 'maintain-plant-machinery', NULL::text),
  ('MANAGE SPARES AND CONSUMABLES INVENTORY', 'manage-spares-and-consumables-inventory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL TECHNOLOGY (PRODUCTION) LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-production-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-production-level-6';

-- Section 2: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-production-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE AND PERFORM METALLURGICAL PROCESSES', 'apply-material-science-and-perform-metallurgical-processes', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text),
  ('JOIN PARTS BY MANUAL METAL ARC WELDING (MMAW)', 'join-parts-by-manual-metal-arc-welding-mmaw', NULL::text),
  ('MANAGE WORKSHOP PROCESSES', 'manage-workshop-processes', NULL::text),
  ('PERFORM LATHE WORK', 'perform-lathe-work', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('PRODUCE PARTS BY BENCH WORK', 'produce-parts-by-bench-work', NULL::text),
  ('PRODUCE PARTS BY GRINDING MACHINE', 'produce-parts-by-grinding-machine', NULL::text),
  ('PRODUCE PARTS BY MILLING', 'produce-parts-by-milling', NULL::text),
  ('PRODUCE PARTS BY SURFACE GRINDING', 'produce-parts-by-surface-grinding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-production-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL TECHNOLOGY AND MAINTENANCE TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-and-maintenance-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-and-maintenance-technician-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-and-maintenance-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL MACHINE/EQUIPMENT', 'install-machine-equipment', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN PUMPS AND AIR COMPRESSORS', 'maintain-pumps-and-air-compressors', NULL::text),
  ('PERFORM BENCHWORK OPERATIONS', 'perform-benchwork-operations', NULL::text),
  ('PERFORM LATHE OPERATIONS', 'perform-lathe-operations', NULL::text),
  ('PERFORM MACHINE/ EQUIPMENT MAINTENANCE', 'perform-machine-equipment-maintenance', NULL::text),
  ('PERFORM MANUAL METAL ARC WELDING (MMAW)', 'perform-manual-metal-arc-welding-mmaw', NULL::text),
  ('PERFORM OXY-ACETYLENE GAS WELDING AND CUTTING', 'perform-oxy-acetylene-gas-welding-and-cutting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-and-maintenance-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHATRONIC TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';

-- Section 2: Common Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('PERFORM WORKSHOP PROCESSES AND PRACTICES', 'perform-workshop-processes-and-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CARRY OUT MECHATRONIC PROGRAMMING', 'carry-out-mechatronic-programming', NULL::text),
  ('DESIGN OF ELECTRO-MECHANICAL SYSTEMS.', 'design-of-electro-mechanical-systems', NULL::text),
  ('INSTALL MECHATRONIC SYSTEMS', 'install-mechatronic-systems', NULL::text),
  ('MAINTAIN ELECTRO-MECHANICAL SYSTEMS', 'maintain-electro-mechanical-systems', NULL::text),
  ('OPERATE MECHATRONIC SYSTEMS', 'operate-mechatronic-systems', NULL::text),
  ('PERFORM MECHATRONIC SYSTEM INSTRUMENTATION AND CONTROL', 'perform-mechatronic-system-instrumentation-and-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: REFRIGERATION AND AIR CONDITIONING TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-technician-level-6';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DESIGN AIR CONDITIONING SYSTEMS', 'design-air-conditioning-systems', NULL::text),
  ('DESIGN REFRIGERATION SYSTEMS', 'design-refrigeration-systems', NULL::text),
  ('INSTALL AIR CONDITIONING SYSTEMS', 'install-air-conditioning-systems', NULL::text),
  ('INSTALL REFRIGERATION SYSTEMS', 'install-refrigeration-systems', NULL::text),
  ('MAINTAIN AIR CONDITIONING SYSTEMS', 'maintain-air-conditioning-systems', NULL::text),
  ('MAINTAIN RAC CONTROL SYSTEMS', 'maintain-rac-control-systems', NULL::text),
  ('MAINTAIN REFRIGERATION SYSTEMS', 'maintain-refrigeration-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: WELDING AND FABRICATION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';

-- Section 2: Common Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE AND PERFORM METALLURGICAL PROCESSES', 'apply-material-science-and-perform-metallurgical-processes', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';

-- Section 3: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DESIGN PRODUCTS AND STRUCTURES', 'design-products-and-structures', NULL::text),
  ('FABRICATE PRODUCTS AND STRUCTURES', 'fabricate-products-and-structures', NULL::text),
  ('PERFORM MANUAL METAL ARC WELDING', 'perform-manual-metal-arc-welding', NULL::text),
  ('PERFORM METAL ACTIVE GAS (MAG) WELDING', 'perform-metal-active-gas-mag-welding', NULL::text),
  ('PERFORM PLASMA AND LASER BEAM WELDING', 'perform-plasma-and-laser-beam-welding', NULL::text),
  ('PERFORM SOLDERING AND GAS WELDING', 'perform-soldering-and-gas-welding', NULL::text),
  ('PERFORM SPOT AND SEAM RESISTANCE WELDING', 'perform-spot-and-seam-resistance-welding', NULL::text),
  ('PERFORM SUBMERGED ARC WELDING', 'perform-submerged-arc-welding', NULL::text),
  ('PERFORM TUNGSTEN INERT GAS (TIG) WELDING', 'perform-tungsten-inert-gas-tig-welding', NULL::text),
  ('PERFORM UNDERWATER ARC WELDING', 'perform-underwater-arc-welding', NULL::text),
  ('PERFORM WELDING INSPECTION AND QUALITY CONTROL', 'perform-welding-inspection-and-quality-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AUTOMOTIVE ENGINEERING PRINCIPLES', 'apply-automotive-engineering-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';

-- Section 3: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('PERFORM VEHICLE BODY WORKS', 'perform-vehicle-body-works', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE COMPONENTS', 'service-and-repair-vehicle-engine-components', NULL::text),
  ('SERVICE MOTOR VEHICLE BRAKING SYSTEM', 'service-motor-vehicle-braking-system', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEM', 'service-vehicle-electrical-system', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEMS', 'service-vehicle-steering-systems', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEMS', 'service-vehicle-suspension-systems', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEMS', 'service-vehicle-transmission-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE ENGINEERING LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-level-5';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AUTOMOTIVE ENGINEERING SCIENCE PRINCIPLES', 'apply-automotive-engineering-science-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLE', 'apply-workshop-technology-principle', NULL::text),
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('PERFORM VEHICLE BODY WORKS', 'perform-vehicle-body-works', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE COMPONENTS', 'service-and-repair-vehicle-engine-components', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEM', 'service-vehicle-braking-system', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEM', 'service-vehicle-steering-system', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEM', 'service-vehicle-suspension-system', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEMS', 'service-vehicle-transmission-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-level-5';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE TECHNICIAN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-5';

-- Section 2: Core Units of Competency (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AUTOMOTIVE ENGINEERING SCIENCE PRINCIPLES', 'apply-automotive-engineering-science-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('PERFORM VEHICLE BODY WORK', 'perform-vehicle-body-work', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE PARTS', 'service-and-repair-vehicle-engine-parts', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEM', 'service-vehicle-braking-system', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEM', 'service-vehicle-steering-system', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEM', 'service-vehicle-suspension-system', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEMS', 'service-vehicle-transmission-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL PLANT OPERATIONS LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM WORKSHOP PRACTICE', 'perform-workshop-practice', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('MAINTAIN INDUSTRIAL BOILERS', 'maintain-industrial-boilers', NULL::text),
  ('MAINTAIN INDUSTRIAL HYDRAULIC SYSTEMS', 'maintain-industrial-hydraulic-systems', NULL::text),
  ('MAINTAIN INDUSTRIAL MATERIAL HANDLING EQUIPMENT', 'maintain-industrial-material-handling-equipment', NULL::text),
  ('MAINTAIN INDUSTRIAL PNEUMATIC SYSTEMS', 'maintain-industrial-pneumatic-systems', NULL::text),
  ('MAINTAIN INDUSTRIAL PUMPS', 'maintain-industrial-pumps', NULL::text),
  ('MAINTAIN INDUSTRIAL STEAM TURBINES', 'maintain-industrial-steam-turbines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PLANT TECHNICIAN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technician-level-5';

-- Section 2: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL MECHANICAL PLANT MACHINERY', 'install-mechanical-plant-machinery', NULL::text),
  ('MAINTAIN BOILER AND STEAM SYSTEMS', 'maintain-boiler-and-steam-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN MATERIAL HANDLING SYSTEMS', 'maintain-material-handling-systems', NULL::text),
  ('MAINTAIN PLANT MACHINERY', 'maintain-plant-machinery', NULL::text),
  ('MANAGE SPARES AND CONSUMABLES INVENTORY', 'manage-spares-and-consumables-inventory', NULL::text),
  ('OPERATE PLANT MACHINES/UTILITIES', 'operate-plant-machines-utilities', NULL::text),
  ('PERFORM PLANT MAINTENANCE.', 'perform-plant-maintenance', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION TECHNICIAN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technician-level-5';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text),
  ('INTERPRET TECHNICAL DRAWINGS', 'interpret-technical-drawings', NULL::text),
  ('PERFORM BENCH WORK OPERATIONS', 'perform-bench-work-operations', NULL::text),
  ('PERFORM GRINDING OPERATION', 'perform-grinding-operation', NULL::text),
  ('PRODUCE COMPONENTS ON A LATHE', 'produce-components-on-a-lathe', NULL::text),
  ('PRODUCE COMPONENTS ON A MILLING MACHINE', 'produce-components-on-a-milling-machine', NULL::text),
  ('USE COMMON METALLIC AND NON-METALLIC MATERIALS', 'use-common-metallic-and-non-metallic-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHATRONICS TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronics-technology-level-5';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('INSTALL MECHATRONIC SYSTEMS', 'install-mechatronic-systems', NULL::text),
  ('MAINTAIN ELECTROMECHANICAL SYSTEMS', 'maintain-electromechanical-systems', NULL::text),
  ('MAINTAIN MECHATRONIC SYSTEMS INSTRUMENTATION AND CONTROL', 'maintain-mechatronic-systems-instrumentation-and-control', NULL::text),
  ('OPERATE PNEUMATIC AND HYDRAULIC SYSTEMS', 'operate-pneumatic-and-hydraulic-systems', NULL::text),
  ('OPERATE PROGRAMMABLE LOGIC CONTROL (PLC) SYSTEMS', 'operate-programmable-logic-control-plc-systems', NULL::text),
  ('OPERATE ROBOTIC AND AUTOMATED SYSTEMS', 'operate-robotic-and-automated-systems', NULL::text),
  ('PERFORM WORKSHOP PROCESSES AND PRACTICES', 'perform-workshop-processes-and-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronics-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: REFRIGERATION AND AIR CONDITIONING CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLE', 'apply-electrical-principle', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM WORKSHOP PRACTICE', 'perform-workshop-practice', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';

-- Section 3: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INSTALL AIR CONDITIONING UNITS', 'install-air-conditioning-units', NULL::text),
  ('INSTALL REFRIGERATION UNITS', 'install-refrigeration-units', NULL::text),
  ('INSTALL, SERVICE AND REPAIR AIR-CONDITIONING UNITS', 'install-service-and-repair-air-conditioning-units', NULL::text),
  ('INSTALL, SERVICE AND REPAIR REFRIGERATION UNITS', 'install-service-and-repair-refrigeration-units', NULL::text),
  ('MAINTAIN AIR CONDITIONING UNITS', 'maintain-air-conditioning-units', NULL::text),
  ('MAINTAIN AUTOMOBILE AIR CONDITIONING UNITS', 'maintain-automobile-air-conditioning-units', NULL::text),
  ('MAINTAIN REFRIGERATION SYSTEMS', 'maintain-refrigeration-systems', NULL::text),
  ('SERVICE AND REPAIR AUTOMOBILE AIR CONDITIONING UNITS', 'service-and-repair-automobile-air-conditioning-units', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: WELDING AND FABRICATION CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-craftsperson-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FABRICATE PRODUCTS AND STRUCTURES', 'fabricate-products-and-structures', NULL::text),
  ('PERFORM GAS METAL ARC WELDING', 'perform-gas-metal-arc-welding', NULL::text),
  ('PERFORM MANUAL METAL ARC WELDING', 'perform-manual-metal-arc-welding', NULL::text),
  ('PERFORM SOLDERING AND GAS WELDING', 'perform-soldering-and-gas-welding', NULL::text),
  ('PERFORM SPOT AND SEAM RESISTANCE WELDING', 'perform-spot-and-seam-resistance-welding', NULL::text),
  ('PERFORM TUNGSTEN INERT GAS (TIG) WELDING', 'perform-tungsten-inert-gas-tig-welding', NULL::text),
  ('PERFORM WELD TESTING', 'perform-weld-testing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE MECHANIC LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-4';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('SERVICE AND REPAIR VEHICLE BRAKING SYSTEMS', 'service-and-repair-vehicle-braking-systems', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINES', 'service-and-repair-vehicle-engines', NULL::text),
  ('SERVICE AND REPAIR VEHICLE FUEL SYSTEM', 'service-and-repair-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE STEERING AND SUSPENSION SYSTEMS', 'service-vehicle-steering-and-suspension-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-4';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE TECHNOLOGY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY BASIC SCIENCE PRINCIPLES', 'apply-basic-science-principles', NULL::text),
  ('MAINTAIN WORKSHOP TOOLS, EQUIPMENT AND MEASURING DEVICES', 'maintain-workshop-tools-equipment-and-measuring-devices', NULL::text),
  ('PERFORM WORKSHOP TECHNOLOGY APPLICATIONS', 'perform-workshop-technology-applications', NULL::text),
  ('PREPARE AND INTERPRET APPLIED GEOMETRY DRAWINGS', 'prepare-and-interpret-applied-geometry-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('SERVICE AND REPAIR VEHICLE FUEL SYSTEMS', 'service-and-repair-vehicle-fuel-systems', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEMS', 'service-vehicle-braking-systems', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE STEERING AND SUSPENSION SYSTEMS', 'service-vehicle-steering-and-suspension-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE TECHNOLOGY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY BASIC SCIENCE PRINCIPLES', 'apply-basic-science-principles', NULL::text),
  ('MAINTAIN WORKSHOP TOOLS, EQUIPMENT AND MEASURING DEVICES', 'maintain-workshop-tools-equipment-and-measuring-devices', NULL::text),
  ('PERFORM WORKSHOP APPLICATIONS', 'perform-workshop-applications', NULL::text),
  ('PREPARE AND INTERPRET APPLIED GOEMETRY', 'prepare-and-interpret-applied-goemetry', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINES', 'service-and-repair-vehicle-engines', NULL::text),
  ('SERVICE AND REPAIR VEHICLE FUEL SYSTEM', 'service-and-repair-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEMS', 'service-vehicle-braking-systems', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE STEERING AND SUSPENSION SYSTEM', 'service-vehicle-steering-and-suspension-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL PLANT OPERATIONS LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-4';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OPERATE INDUSTRIAL BOILER', 'operate-industrial-boiler', NULL::text),
  ('OPERATE INDUSTRIAL HYDRAULIC SYSTEM', 'operate-industrial-hydraulic-system', NULL::text),
  ('OPERATE INDUSTRIAL PNEUMATIC SYSTEM', 'operate-industrial-pneumatic-system', NULL::text),
  ('OPERATE INDUSTRIAL PUMP', 'operate-industrial-pump', NULL::text),
  ('OPERATE INDUSTRIAL STEAM TURBINE', 'operate-industrial-steam-turbine', NULL::text),
  ('OPERATE MATERIAL HANDLING EQUIPMENT', 'operate-material-handling-equipment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-4';

-- ------------------------------------------------------------------------------
-- Course: MANUAL METAL ARC AND GAS METAL ARC WELDING LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'manual-metal-arc-and-gas-metal-arc-welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'manual-metal-arc-and-gas-metal-arc-welding-level-4';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'manual-metal-arc-and-gas-metal-arc-welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY WORKPLACE ESSENTIAL SKILLS', 'apply-workplace-essential-skills', NULL::text),
  ('APPLY WORKPLACE HEALTH AND SAFETY', 'apply-workplace-health-and-safety', NULL::text),
  ('APPLY WORKSHOP CONCEPTS, TOOLS AND ORGANIZATION SKILLS', 'apply-workshop-concepts-tools-and-organization-skills', NULL::text),
  ('PERFORM MANUAL METAL ARC WELDING', 'perform-manual-metal-arc-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'manual-metal-arc-and-gas-metal-arc-welding-level-4';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION (LATHE AND FABRICATION) ARTISAN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';

-- Section 2: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INTERPRET BASIC TECHNICAL DRAWINGS', 'interpret-basic-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';

-- Section 3: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text),
  ('PERFORM BENCH WORK OPERATIONS', 'perform-bench-work-operations', NULL::text),
  ('PRODUCE COMPONENTS ON THE LATHE', 'produce-components-on-the-lathe', NULL::text),
  ('USE COMMON METALLIC AND NON-METALLIC MATERIALS', 'use-common-metallic-and-non-metallic-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';

-- ------------------------------------------------------------------------------
-- Course: REFRIGERATION AND AIR CONDITIONING ARTISAN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-artisan-level-4';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC ENGINEERING SCIENCE', 'apply-basic-engineering-science', NULL::text),
  ('INSTALL, SERVICE AND REPAIR DOMESTIC REFRIGERATION UNITS', 'install-service-and-repair-domestic-refrigeration-units', NULL::text),
  ('INSTALL, SERVICE AND REPAIR WINDOW TYPE AIR CONDITIONING UNITS', 'install-service-and-repair-window-type-air-conditioning-units', NULL::text),
  ('PERFORM ELECTRICAL AND ELECTRONIC CIRCUITRY', 'perform-electrical-and-electronic-circuitry', NULL::text),
  ('PERFORM WORKSHOP PRACTICES.', 'perform-workshop-practices', NULL::text),
  ('PPLY BASIC MATHEMATICS', 'pply-basic-mathematics', NULL::text),
  ('SERVICE AND REPAIR AUTOMOBILE AIR-CONDITIONING UNITS', 'service-and-repair-automobile-air-conditioning-units', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-artisan-level-4';

-- ------------------------------------------------------------------------------
-- Course: WELDING LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM GAS WELDING IN ALL POSITIONS WITH VARIOUS METAL WORK PIECES', 'perform-gas-welding-in-all-positions-with-various-metal-work-pieces', NULL::text),
  ('PERFORM MANUAL ARC (STICK) WELDING IN ALL POSITIONS WITH VARIOUS METAL', 'perform-manual-arc-stick-welding-in-all-positions-with-various-metal', NULL::text),
  ('PERFORM MIG WELDING IN ALL POSITIONS WITH VARIOUS METAL WORK PIECES', 'perform-mig-welding-in-all-positions-with-various-metal-work-pieces', NULL::text),
  ('PERFORM TIG WELDING IN ALL POSITIONS WITH VARIOUS METAL WORK PIECES', 'perform-tig-welding-in-all-positions-with-various-metal-work-pieces', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE MECHANIC LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN SHOP TOOLS, EQUIPMENT AND MEASURING DEVICES', 'maintain-shop-tools-equipment-and-measuring-devices', NULL::text),
  ('PARTICIPATE IN AN AUTOMOTIVE INDUSTRY ATTACHMENT', 'participate-in-an-automotive-industry-attachment', NULL::text),
  ('PERFORM WORKSHOP HOUSEKEEPING', 'perform-workshop-housekeeping', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-3';

-- Section 2: Core Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSPECT AUTOMOTIVE BRAKE SYSTEMS', 'inspect-automotive-brake-systems', NULL::text),
  ('INSPECT AUTOMOTIVE STEERING AND SUSPENSION SYSTEMS', 'inspect-automotive-steering-and-suspension-systems', NULL::text),
  ('PERFORM VEHICLE PREVENTIVE MAINTENANCE', 'perform-vehicle-preventive-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-3';

-- ------------------------------------------------------------------------------
-- Course: GAS WELDING LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'gas-welding-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BASIC WORKSHOP CONCEPTS', 'apply-basic-workshop-concepts', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'gas-welding-level-3';

-- Section 2: Core Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'gas-welding-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM OXY-ACETYLENE WELDING', 'perform-oxy-acetylene-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'gas-welding-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: SOCIAL WORK DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 7 | Total Units: 112
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under Cycle 1 & 2: SOCIAL WORK DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'SOCIAL WORK DEPARTMENT', 'social-work-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Social Work, Child Protection, and Counselling Psychology courses.', 11
FROM programmes WHERE slug = 'cdacc-courses-cycle-1-and-2'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & units under this department in Cycle 1 & 2
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department'
);

-- 4. Insert Non-Modular Courses under SOCIAL WORK DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CHILD PROTECTION LEVEL 6', 'child-protection-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COUNSELLING PSYCHOLOGY LEVEL 6', 'counselling-psychology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOCIAL WORK AND COMMUNITY DEVELOPMENT LEVEL 6', 'social-work-and-community-development-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CHILD PROTECTION LEVEL 5', 'child-protection-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COUNSELLING PSYCHOLOGY LEVEL 5', 'counselling-psychology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOCIAL WORK AND COMMUNITY DEVELOPMENT LEVEL 5', 'social-work-and-community-development-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOCIAL WORK AND COMMUNITY DEVELOPMENT LEVEL 4', 'social-work-and-community-development-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: CHILD PROTECTION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT CASE MANAGEMENT', 'carry-out-case-management', NULL::text),
  ('CARRY OUT COMMUNITY BASED CHILD PROTECTION STRATEGIES', 'carry-out-community-based-child-protection-strategies', NULL::text),
  ('COORDINATE ENFORCEMENT OF CHILD RIGHTS', 'coordinate-enforcement-of-child-rights', NULL::text),
  ('MANAGE CHILD ABUSE CASES', 'manage-child-abuse-cases', NULL::text),
  ('MANAGE CHILD WELFARE PROGRAMMES', 'manage-child-welfare-programmes', NULL::text),
  ('MANAGE CHILDREN PLACEMENT CENTRE', 'manage-children-placement-centre', NULL::text),
  ('PROVIDE PSYCHO SOCIAL SUPPORT', 'provide-psycho-social-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';

-- ------------------------------------------------------------------------------
-- Course: COUNSELLING PSYCHOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'counselling-psychology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'counselling-psychology-level-6';

-- Section 2: Core Units of Competency (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'counselling-psychology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ASSESS THE CLIENT', 'assess-the-client', NULL::text),
  ('MANAGE COUNSELLING SERVICES', 'manage-counselling-services', NULL::text),
  ('PROVIDE ADDICTION COUNSELLING', 'provide-addiction-counselling', NULL::text),
  ('PROVIDE ADOLESCENT COUNSELLING', 'provide-adolescent-counselling', NULL::text),
  ('PROVIDE CHILD COUNSELLING', 'provide-child-counselling', NULL::text),
  ('PROVIDE COUNSELLING SERVICES', 'provide-counselling-services', NULL::text),
  ('PROVIDE CRISIS COUNSELLING', 'provide-crisis-counselling', NULL::text),
  ('PROVIDE GUIDANCE AND COUNSELLING IN LEARNING INSTITUTIONS', 'provide-guidance-and-counselling-in-learning-institutions', NULL::text),
  ('PROVIDE MARRIAGE AND FAMILY COUNSELLING', 'provide-marriage-and-family-counselling', NULL::text),
  ('PROVIDE MEDICAL CONDITIONS COUNSELLING', 'provide-medical-conditions-counselling', NULL::text),
  ('PROVIDE SPECIAL NEEDS AND DISABILITIES COUNSELLING', 'provide-special-needs-and-disabilities-counselling', NULL::text),
  ('PROVIDE TRAUMA COUNSELLING', 'provide-trauma-counselling', NULL::text),
  ('PROVIDE WORKPLACE COUNSELLING', 'provide-workplace-counselling', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'counselling-psychology-level-6';

-- ------------------------------------------------------------------------------
-- Course: SOCIAL WORK AND COMMUNITY DEVELOPMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-6';

-- Section 2: Core Units of Competency (17 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT ADVOCACY AND LOBBYING', 'carry-out-advocacy-and-lobbying', NULL::text),
  ('CARRY OUT CHILD WELFARE PROGRAMS', 'carry-out-child-welfare-programs', NULL::text),
  ('CARRY OUT CRISIS AND DISASTER MANAGEMENT', 'carry-out-crisis-and-disaster-management', NULL::text),
  ('CARRYOUT RESOURCE MOBILIZATION AND FUNDRAISING', 'carryout-resource-mobilization-and-fundraising', NULL::text),
  ('CONDUCT CASE MANAGEMENT', 'conduct-case-management', NULL::text),
  ('CONDUCT COMMUNITY AWARENESS ACTIVITIES', 'conduct-community-awareness-activities', NULL::text),
  ('CONDUCT COMMUNITY EMPOWERMENT', 'conduct-community-empowerment', NULL::text),
  ('CONDUCT SOCIAL POLICY FORMULATION AND PUBLIC ADMINISTRATION', 'conduct-social-policy-formulation-and-public-administration', NULL::text),
  ('CONDUCT SOCIAL RESEARCH WORKS', 'conduct-social-research-works', NULL::text),
  ('COORDINATE COMMUNITY HEALTH STRATEGY', 'coordinate-community-health-strategy', NULL::text),
  ('COORDINATE COMMUNITY PROJECT', 'coordinate-community-project', NULL::text),
  ('COORDINATE CONFLICT RESOLUTION AND MANAGEMENT', 'coordinate-conflict-resolution-and-management', NULL::text),
  ('COORDINATE REHABILITATION PROGRAMS', 'coordinate-rehabilitation-programs', NULL::text),
  ('MANAGE COMMUNITY BASED GROUPS', 'manage-community-based-groups', NULL::text),
  ('MANAGE COMMUNITY RESOURCES', 'manage-community-resources', NULL::text),
  ('PERFORM HOME BASED CARE AND SUPPORT', 'perform-home-based-care-and-support', NULL::text),
  ('PERFORM PSYCHOSOCIAL SUPPORT', 'perform-psychosocial-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-6';

-- ------------------------------------------------------------------------------
-- Course: CHILD PROTECTION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT CASE MANAGEMENT', 'carry-out-case-management', NULL::text),
  ('CARRY OUT COMMUNITY BASED CHILD PROTECTION STRATEGIES', 'carry-out-community-based-child-protection-strategies', NULL::text),
  ('COORDINATE ENFORCEMENT OF CHILD RIGHTS', 'coordinate-enforcement-of-child-rights', NULL::text),
  ('MANAGE CHILD WELFARE PROGRAMS', 'manage-child-welfare-programs', NULL::text),
  ('PROVIDE PSYCHO-SOCIAL SUPPORT', 'provide-psycho-social-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';

-- ------------------------------------------------------------------------------
-- Course: COUNSELLING PSYCHOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'counselling-psychology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'counselling-psychology-level-5';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'counselling-psychology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ASSESS THE CLIENT', 'assess-the-client', NULL::text),
  ('PERFORM ADMINISTRATIVE DUTIES FOR COUNSELLING SERVICE', 'perform-administrative-duties-for-counselling-service', NULL::text),
  ('PROVIDE BASIC COUNSELLING SERVICES', 'provide-basic-counselling-services', NULL::text),
  ('PROVIDE PSYCHOLOGICAL FIRST AID SERVICES', 'provide-psychological-first-aid-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'counselling-psychology-level-5';

-- ------------------------------------------------------------------------------
-- Course: SOCIAL WORK AND COMMUNITY DEVELOPMENT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS', 'demonstrate-entrepreneurial-skills', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICES', 'demonstrate-occupational-safety-and-health-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-5';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT ADVOCACY AND LOBBYING', 'carry-out-advocacy-and-lobbying', NULL::text),
  ('CARRY OUT CHILD WELFARE PROGRAMS', 'carry-out-child-welfare-programs', NULL::text),
  ('CONDUCT COMMUNITY AWARENESS ACTIVITIES', 'conduct-community-awareness-activities', NULL::text),
  ('CONDUCT COMMUNITY CRISIS AND DISASTER SENSITIZATION PROGRAMS', 'conduct-community-crisis-and-disaster-sensitization-programs', NULL::text),
  ('CONDUCT SOCIAL POLICY FORMULATION AND IMPLEMENTATION', 'conduct-social-policy-formulation-and-implementation', NULL::text),
  ('CONDUCT SOCIAL RESEARCH WORK', 'conduct-social-research-work', NULL::text),
  ('MANAGE COMMUNITY-BASED GROUPS', 'manage-community-based-groups', NULL::text),
  ('MANAGE PROJECT RESOURCES', 'manage-project-resources', NULL::text),
  ('PERFORM HOME-BASED CARE AND SUPPORT', 'perform-home-based-care-and-support', NULL::text),
  ('PERFORM PSYCHO SOCIAL SUPPORT', 'perform-psycho-social-support', NULL::text),
  ('UNDERTAKE CONFLICT RESOLUTION AND MANAGEMENT', 'undertake-conflict-resolution-and-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-5';

-- ------------------------------------------------------------------------------
-- Course: SOCIAL WORK AND COMMUNITY DEVELOPMENT LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DEMONSTRATE COMMUNICATION SKILLS', 'demonstrate-communication-skills', NULL::text),
  ('DEMONSTRATE DIGITAL LITERACY', 'demonstrate-digital-literacy', NULL::text),
  ('DEMONSTRATE EMPLOYABILITY SKILLS', 'demonstrate-employability-skills', NULL::text),
  ('DEMONSTRATE ENTREPRENEURIAL SKILLS LEVEL', 'demonstrate-entrepreneurial-skills-level', NULL::text),
  ('DEMONSTRATE ENVIRONMENTAL LITERACY', 'demonstrate-environmental-literacy', NULL::text),
  ('DEMONSTRATE NUMERACY SKILLS', 'demonstrate-numeracy-skills', NULL::text),
  ('DEMONSTRATE OCCUPATIONAL SAFETY AND HEALTH PRACTICE', 'demonstrate-occupational-safety-and-health-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-4';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONDUCT CHILD WELFARE PROGRAMS', 'conduct-child-welfare-programs', NULL::text),
  ('CONDUCT SOCIAL RESEARCH', 'conduct-social-research', NULL::text),
  ('MANAGE COMMUNITY-BASED GROUPS', 'manage-community-based-groups', NULL::text),
  ('MANAGE PROJECT RESOURCES', 'manage-project-resources', NULL::text),
  ('PERFORM HOME BASED CARE AND CHILD WELFARE', 'perform-home-based-care-and-child-welfare', NULL::text),
  ('PERFORM HOME BASED CARE SUPPORT', 'perform-home-based-care-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department' AND c.slug = 'social-work-and-community-development-level-4';


COMMIT;

SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
FROM departments d
JOIN programmes p ON p.id = d.programme_id
JOIN courses c ON c.department_id = d.id
LEFT JOIN units u ON u.course_id = c.id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2'
GROUP BY d.name ORDER BY d.name;