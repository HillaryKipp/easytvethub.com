-- ==============================================================================
-- SEED SCRIPT FOR: APPLIED SCIENCE DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 10 | Total Units: 180
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

COMMIT;
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'applied-science-department'
-- GROUP BY d.name;