-- ==============================================================================
-- SEED SCRIPT FOR: COMPUTER STUDIES AND ICT (KNEC COURSES)
-- Total Courses: 2 | Total Units: 36
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

-- 2. Upsert Department under KNEC: COMPUTER STUDIES AND ICT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'COMPUTER STUDIES AND ICT', 'computer-studies-and-ict', 'KNEC Diploma and Certificate past examination papers and modules in Information Communication Technology (ICT) and Computer Applications.', 6
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'computer-studies-and-ict'
);

-- 4. Insert KNEC Courses under COMPUTER STUDIES AND ICT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN INFORMATION COMMUNICATION TECHNOLOGY', 'diploma-in-information-communication-technology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'computer-studies-and-ict';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN INFORMATION COMMUNICATION TECHNOLOGY', 'certificate-in-information-communication-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'computer-studies-and-ict';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN INFORMATION COMMUNICATION TECHNOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INTRODUCTION TO INFORMATION COMMUNICATION TECHNOLOGY AND ETHICS', 'introduction-to-information-communication-technology-and-ethics', NULL::text),
  ('COMPUTER APPLICATION I', 'computer-application-i', NULL::text),
  ('COMPUTER APPLICATION I (PRACTICAL)', 'computer-application-i-practical', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('STRUCTURED PROGRAMMING', 'structured-programming', NULL::text),
  ('INFORMATION SYSTEM MANAGEMENT', 'information-system-management', NULL::text),
  ('COMPUTATIONAL MATHEMATICS', 'computational-mathematics', NULL::text),
  ('OPERATING SYSTEMS', 'operating-systems', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';

-- Module 2: Module II (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('RESEARCH PROJECT', 'research-project', NULL::text),
  ('COMPUTER APPLICATION II (THEORY)', 'computer-application-ii-theory', NULL::text),
  ('COMPUTER APPLICATION II (PRACTICAL)', 'computer-application-ii-practical', NULL::text),
  ('SYSTEMS ANALYSIS AND DESIGN', 'systems-analysis-and-design', NULL::text),
  ('OBJECT ORIENTED PROGRAMMING', 'object-oriented-programming', NULL::text),
  ('VISUAL PROGRAMMING', 'visual-programming', NULL::text),
  ('DATABASE MANAGEMENT SYSTEM', 'database-management-system', NULL::text),
  ('QUANTITATIVE METHODS', 'quantitative-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';

-- Module 3: Module III (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DATA COMMUNICATION AND NETWORKING', 'data-communication-and-networking', NULL::text),
  ('INTERNET BASED PROGRAMMING', 'internet-based-programming', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('MANAGEMENT INFORMATION SYSTEM', 'management-information-system', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN INFORMATION COMMUNICATION TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'certificate-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BASIC ELECTRONICS', 'basic-electronics', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('COMPUTER APPLICATION I (THEORY)', 'computer-application-i-theory', NULL::text),
  ('COMPUTER APPLICATION I (PRACTICAL)', 'computer-application-i-practical', NULL::text),
  ('INTRODUCTION TO INFORMATION COMMUNICATION TECHNOLOGY', 'introduction-to-information-communication-technology', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('OPERATING SYSTEM', 'operating-system', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'certificate-in-information-communication-technology';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'certificate-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMPUTER MAINTENANCE AND SUPPORT', 'computer-maintenance-and-support', NULL::text),
  ('STRUCTURED PROGRAMMING', 'structured-programming', NULL::text),
  ('COMPUTER APPLICATION II (THEORY)', 'computer-application-ii-theory', NULL::text),
  ('COMPUTER APPLICATION II (PRACTICAL)', 'computer-application-ii-practical', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'certificate-in-information-communication-technology';

COMMIT;
-- Verification Query: Check courses and units inserted for COMPUTER STUDIES AND ICT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'computer-studies-and-ict'
-- GROUP BY d.name;