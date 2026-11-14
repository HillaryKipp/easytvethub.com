-- ==============================================================================
-- SEED SCRIPT FOR: AGRICULTURE AND AQUACULTURE DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 27 | Total Units: 388
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
BEGIN;

-- 1. Ensure Programme Exists
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

COMMIT;
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'agriculture-and-aquaculture-department'
-- GROUP BY d.name;