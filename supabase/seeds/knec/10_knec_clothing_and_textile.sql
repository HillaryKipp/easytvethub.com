-- ==============================================================================
-- SEED SCRIPT FOR: CLOTHING AND TEXTILE (KNEC COURSES)
-- Total Courses: 3 | Total Units: 44
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

-- 2. Upsert Department under KNEC: CLOTHING AND TEXTILE
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'CLOTHING AND TEXTILE', 'clothing-and-textile', 'KNEC Diploma, Certificate, and Artisan past examination papers and modules in Fashion Design, Clothing Technology, and Garment Making.', 10
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'clothing-and-textile'
);

-- 4. Insert KNEC Courses under CLOTHING AND TEXTILE
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN FASHION DESIGN AND CLOTHING TECHNOLOGY', 'diploma-in-fashion-design-and-clothing-technology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'clothing-and-textile';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FASHION DESIGN AND GARMENT MAKING TECHNOLOGY', 'certificate-in-fashion-design-and-garment-making-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'clothing-and-textile';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN GARMENT MAKING', 'artisan-in-garment-making', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'clothing-and-textile';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN FASHION DESIGN AND CLOTHING TECHNOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ART AND DESIGN', 'art-and-design', NULL::text),
  ('FASHION DESIGN AND SKETCHING I', 'fashion-design-and-sketching-i', NULL::text),
  ('CUTTING TECHNOLOGY I', 'cutting-technology-i', NULL::text),
  ('CLOTHING CONSTRUCTION I PRACTICAL', 'clothing-construction-i-practical', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('PATTERN CONSTRUCTION I PRACTICAL', 'pattern-construction-i-practical', NULL::text),
  ('TEXTILE SCIENCE I', 'textile-science-i', NULL::text),
  ('CONSTRUCTION I THEORY', 'construction-i-theory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';

-- Module 2: Module II (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CLOTHING CONSTRUCTION II PRACTICAL', 'clothing-construction-ii-practical', NULL::text),
  ('FASHION DESIGN AND SKETCHING II', 'fashion-design-and-sketching-ii', NULL::text),
  ('CUTTING TECHNOLOGY II THEORY', 'cutting-technology-ii-theory', NULL::text),
  ('INDUSTRIAL ORGANIZATION MANAGEMENT I', 'industrial-organization-management-i', NULL::text),
  ('QUALITY CONTROL I', 'quality-control-i', NULL::text),
  ('PATTERN CONSTRUCTION II AND GRADING TECHNIQUES I PRACTICAL', 'pattern-construction-ii-and-grading-techniques-i-practical', NULL::text),
  ('TEXTILE SCIENCE II', 'textile-science-ii', NULL::text),
  ('CLOTHING CONSTRUCTION II THEORY', 'clothing-construction-ii-theory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';

-- Module 3: Module III (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CLOTHING CONSTRUCTION III PRACTICAL', 'clothing-construction-iii-practical', NULL::text),
  ('CLOTHING CONSTRUCTION III THEORY', 'clothing-construction-iii-theory', NULL::text),
  ('FASHION MARKETING', 'fashion-marketing', NULL::text),
  ('INDUSTRIAL ORGANIZATION MANAGEMENT II', 'industrial-organization-management-ii', NULL::text),
  ('QUALITY CONTROL II', 'quality-control-ii', NULL::text),
  ('PATTERN CONSTRUCTION III AND GRADING TECHNIQUES II PRACTICAL', 'pattern-construction-iii-and-grading-techniques-ii-practical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FASHION DESIGN AND GARMENT MAKING TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'certificate-in-fashion-design-and-garment-making-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ART, FASHION DESIGN SKETCHING', 'art-fashion-design-sketching', NULL::text),
  ('PATTERN DRAFTING I', 'pattern-drafting-i', NULL::text),
  ('FABRIC COLOURATION PRACTICAL', 'fabric-colouration-practical', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text),
  ('TEXTILE MATERIAL KNOWLEDGE AND FABRIC COLOURATION THEORY', 'textile-material-knowledge-and-fabric-colouration-theory', NULL::text),
  ('WORKSHOP ORGANIZATION AND GENERAL INFORMATION', 'workshop-organization-and-general-information', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'certificate-in-fashion-design-and-garment-making-technology';

-- Module 2: Module II (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'certificate-in-fashion-design-and-garment-making-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BATIK PRACTICAL', 'batik-practical', NULL::text),
  ('EMBROIDERY PRACTICAL', 'embroidery-practical', NULL::text),
  ('GARMENT MAKING PRACTICAL FOR MEN', 'garment-making-practical-for-men', NULL::text),
  ('GARMENT CUTTING THEORY', 'garment-cutting-theory', NULL::text),
  ('GARMENT MAKING THEORY', 'garment-making-theory', NULL::text),
  ('PATTERN DRAFTING II AND GRADING I', 'pattern-drafting-ii-and-grading-i', NULL::text),
  ('GARMENT MAKING PRACTICAL FOR WOMEN', 'garment-making-practical-for-women', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'certificate-in-fashion-design-and-garment-making-technology';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN GARMENT MAKING [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'artisan-in-garment-making';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLIED GEOMETRY', 'applied-geometry', NULL::text),
  ('PATTERN DRAFTING PRACTICAL', 'pattern-drafting-practical', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('SCIENCE', 'science', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text),
  ('TRADE THEORY', 'trade-theory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'artisan-in-garment-making';

COMMIT;
-- Verification Query: Check courses and units inserted for CLOTHING AND TEXTILE
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'clothing-and-textile'
-- GROUP BY d.name;