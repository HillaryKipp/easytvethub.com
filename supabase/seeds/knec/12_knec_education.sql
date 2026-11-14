-- ==============================================================================
-- SEED SCRIPT FOR: EDUCATION (KNEC COURSES)
-- Total Courses: 2 | Total Units: 15
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
BEGIN;

-- 1. Ensure KNEC Programme Exists
INSERT INTO programmes (name, slug, description, sort_order)
VALUES (
  'KNEC Courses',
  'knec-courses',
  'Kenya National Examinations Council (KNEC) Craft, Artisan, and Diploma TVET courses, modules, and past examination papers.',
  3
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 2. Upsert Department under KNEC: EDUCATION
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'EDUCATION', 'education', 'KNEC Diploma and Certificate past examination papers and modules in Early Childhood Development and Education (ECDE).', 12
FROM programmes WHERE slug = 'knec-courses'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & modules/units under this department in KNEC
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'knec-courses' AND d.slug = 'education'
);

-- 4. Insert KNEC Courses under EDUCATION
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN EARLY CHILDHOOD DEVELOPMENT AND EDUCATION (ECDE)', 'diploma-in-early-childhood-development-and-education-ecde', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'education';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN EARLY CHILDHOOD DEVELOPMENT AND EDUCATION (ECDE)', 'certificate-in-early-childhood-development-and-education-ecde', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'education';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN EARLY CHILDHOOD DEVELOPMENT AND EDUCATION (ECDE) [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'diploma-in-early-childhood-development-and-education-ecde';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CHILD DEVELOPMENT', 'child-development', NULL::text),
  ('FOUNDATIONS OF ECDE AND CURRICULUM DEVELOPMENT', 'foundations-of-ecde-and-curriculum-development', NULL::text),
  ('GENERAL PSYCHOLOGY, PERSONALITY DEVELOPMENT, GUIDANCE AND COUNSELLING', 'general-psychology-personality-development-guidance-and-counselling', NULL::text),
  ('HEALTH, NUTRITION AND CHILD RIGHTS', 'health-nutrition-and-child-rights', NULL::text),
  ('METHODOLOGY AND CURRICULUM ACTIVITY AREAS', 'methodology-and-curriculum-activity-areas', NULL::text),
  ('MANAGEMENT OF ECDE, COMMUNITY DEVELOPMENT AND RESEARCH', 'management-of-ecde-community-development-and-research', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'education' AND c.slug = 'diploma-in-early-childhood-development-and-education-ecde';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'diploma-in-early-childhood-development-and-education-ecde';

-- Module 3: Module III (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'diploma-in-early-childhood-development-and-education-ecde';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN EARLY CHILDHOOD DEVELOPMENT AND EDUCATION (ECDE) [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'certificate-in-early-childhood-development-and-education-ecde';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CHILD DEVELOPMENT AND PSYCHOLOGY', 'child-development-and-psychology', NULL::text),
  ('CHILD HEALTH, NUTRITION, GUIDANCE AND COUNSELLING', 'child-health-nutrition-guidance-and-counselling', NULL::text),
  ('CURRICULUM AND METHODOLOGY', 'curriculum-and-methodology', NULL::text),
  ('CURRICULUM AND ACTIVITIES', 'curriculum-and-activities', NULL::text),
  ('ENGLISH', 'english', NULL::text),
  ('FOUNDATION OF ECDE AND CURRICULUM DEVELOPMENT', 'foundation-of-ecde-and-curriculum-development', NULL::text),
  ('FOUNDATIONS AND MANAGEMENT OF ECDE', 'foundations-and-management-of-ecde', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text),
  ('KISWAHILI', 'kiswahili', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'education' AND c.slug = 'certificate-in-early-childhood-development-and-education-ecde';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'certificate-in-early-childhood-development-and-education-ecde';

COMMIT;
-- Verification Query: Check courses and units inserted for EDUCATION
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'education'
-- GROUP BY d.name;