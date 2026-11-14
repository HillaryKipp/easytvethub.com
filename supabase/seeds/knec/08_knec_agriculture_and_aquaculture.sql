-- ==============================================================================
-- SEED SCRIPT FOR: AGRICULTURE AND AQUACULTURE (KNEC COURSES)
-- Total Courses: 7 | Total Units: 55
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

-- 2. Upsert Department under KNEC: AGRICULTURE AND AQUACULTURE
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'AGRICULTURE AND AQUACULTURE', 'agriculture-and-aquaculture', 'KNEC Diploma, Certificate, and Artisan past examination papers and modules in General Agriculture, Sustainable Agriculture, and Fisheries.', 8
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture'
);

-- 4. Insert KNEC Courses under AGRICULTURE AND AQUACULTURE
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN AGRICULTURE', 'diploma-in-agriculture', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SUSTAINABLE AGRICULTURE AND RURAL DEVELOPMENT', 'diploma-in-sustainable-agriculture-and-rural-development', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN GENERAL AGRICULTURE', 'certificate-in-general-agriculture', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FISHERIES TECHNOLOGY', 'certificate-in-fisheries-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FISHERIES SCIENCE AND TECHNOLOGY', 'certificate-in-fisheries-science-and-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN GENERAL AGRICULTURE', 'artisan-in-general-agriculture', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN AGRICULTURE MECHANICS', 'artisan-in-agriculture-mechanics', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN AGRICULTURE [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING I', 'agricultural-engineering-i', NULL::text),
  ('AGRICULTURAL ECONOMICS I', 'agricultural-economics-i', NULL::text),
  ('AGRICULTURAL EXTENSION EDUCATION I', 'agricultural-extension-education-i', NULL::text),
  ('ANIMAL PRODUCTION I', 'animal-production-i', NULL::text),
  ('PRINCIPLES OF ANIMAL PRODUCTION', 'principles-of-animal-production', NULL::text),
  ('PRINCIPLES OF CROP PRODUCTION I', 'principles-of-crop-production-i', NULL::text),
  ('SOIL SCIENCE', 'soil-science', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING II', 'agricultural-engineering-ii', NULL::text),
  ('AGRICULTURAL ECONOMICS II', 'agricultural-economics-ii', NULL::text),
  ('AGRICULTURAL EXTENSION EDUCATION II', 'agricultural-extension-education-ii', NULL::text),
  ('HOME ECONOMICS', 'home-economics', NULL::text),
  ('ANIMAL PRODUCTION II', 'animal-production-ii', NULL::text),
  ('CROP PRODUCTION II', 'crop-production-ii', NULL::text),
  ('SOIL FERTILITY AND PLANT NUTRITION', 'soil-fertility-and-plant-nutrition', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';

-- Module 3: Module III (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING III', 'agricultural-engineering-iii', NULL::text),
  ('ENVIRONMENTAL MANAGEMENT', 'environmental-management', NULL::text),
  ('ANIMAL PRODUCTION III', 'animal-production-iii', NULL::text),
  ('CROP PRODUCTION III', 'crop-production-iii', NULL::text),
  ('FARM BUSINESS MANAGEMENT', 'farm-business-management', NULL::text),
  ('EXTENSION EDUCATION', 'extension-education', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SUSTAINABLE AGRICULTURE AND RURAL DEVELOPMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING I', 'agricultural-engineering-i', NULL::text),
  ('APPLIED SCIENCE I', 'applied-science-i', NULL::text),
  ('CROP ENTERPRISE MANAGEMENT I', 'crop-enterprise-management-i', NULL::text),
  ('LIVESTOCK ENTERPRISE MANAGEMENT I', 'livestock-enterprise-management-i', NULL::text),
  ('FOUNDATION SUSTAINABLE OF AGRICULTURE', 'foundation-sustainable-of-agriculture', NULL::text),
  ('ICT COMMUNICATION SKILLS AND ENTREPRENEURSHIP', 'ict-communication-skills-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';

-- Module 2: Module II (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING II', 'agricultural-engineering-ii', NULL::text),
  ('APPLIED SCIENCE II', 'applied-science-ii', NULL::text),
  ('CROP ENTERPRISE MANAGEMENT II', 'crop-enterprise-management-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';

-- Module 3: Module III (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('COMMUNITY HEALTH AND RURAL SOCIOLOGY', 'community-health-and-rural-sociology', NULL::text),
  ('CROP ENTERPRISE MANAGEMENT III', 'crop-enterprise-management-iii', NULL::text),
  ('DEVELOPMENT ECONOMICS AND AGRICULTURAL MARKETING', 'development-economics-and-agricultural-marketing', NULL::text),
  ('MANAGEMENT OF NATURAL RESOURCES AND COMMUNITY DEVELOPMENT', 'management-of-natural-resources-and-community-development', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN GENERAL AGRICULTURE [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-general-agriculture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING', 'agricultural-engineering', NULL::text),
  ('ANIMAL PRODUCTION', 'animal-production', NULL::text),
  ('CROP PRODUCTION', 'crop-production', NULL::text),
  ('AGRICULTURAL EXTENSION EDUCATION', 'agricultural-extension-education', NULL::text),
  ('HOME ECONOMICS', 'home-economics', NULL::text),
  ('AGRICULTURAL ECONOMICS AND FARM MANAGEMENT', 'agricultural-economics-and-farm-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-general-agriculture';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-general-agriculture';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FISHERIES TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FISHERIES MANAGEMENT, MARKETING AND UTILIZATION', 'fisheries-management-marketing-and-utilization', NULL::text),
  ('TRADE PRACTICE', 'trade-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-technology';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FISHERIES SCIENCE AND TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-science-and-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FOOD PROCESSING AND PRESERVATION', 'food-processing-and-preservation', NULL::text),
  ('FISH CULTURE AND NUTRITION', 'fish-culture-and-nutrition', NULL::text),
  ('FISH BIOLOGY AQUATIC ECOLOGY', 'fish-biology-aquatic-ecology', NULL::text),
  ('FOOD CHEMISTRY AND MICROBIOLOGY', 'food-chemistry-and-microbiology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-science-and-technology';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-science-and-technology';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN GENERAL AGRICULTURE [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'artisan-in-general-agriculture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLIED GEOMETRY', 'applied-geometry', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('SCIENCE', 'science', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'artisan-in-general-agriculture';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN AGRICULTURE MECHANICS [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'artisan-in-agriculture-mechanics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLIED GEOMETRY', 'applied-geometry', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('SCIENCE', 'science', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'artisan-in-agriculture-mechanics';

COMMIT;
-- Verification Query: Check courses and units inserted for AGRICULTURE AND AQUACULTURE
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'agriculture-and-aquaculture'
-- GROUP BY d.name;