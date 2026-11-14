-- ==============================================================================
-- SEED SCRIPT FOR: HEALTH SCIENCES (KNEC COURSES)
-- Total Courses: 2 | Total Units: 21
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

-- 2. Upsert Department under KNEC: HEALTH SCIENCES
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'HEALTH SCIENCES', 'health-sciences', 'KNEC Diploma and Certificate past examination papers and modules in Nutrition and Dietetics and Community Health.', 4
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'health-sciences'
);

-- 4. Insert KNEC Courses under HEALTH SCIENCES
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN NUTRITION AND DIETETICS', 'diploma-in-nutrition-and-dietetics', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'health-sciences';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN NUTRITION AND DIETETICS', 'certificate-in-nutrition-and-dietetics', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'health-sciences';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN NUTRITION AND DIETETICS [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('DIET THERAPY I, MEAL PLANNING AND MANAGEMENT AND PRINCIPLES OF HUMAN NUTRITION PRACTICE', 'diet-therapy-i-meal-planning-and-management-and-principles-of-human-nutrition-practice', NULL::text),
  ('DIET THERAPY I, PRINCIPLES OF HUMAN NUTRITION AND DIETETICS, ANATOMY AND PHYSIOLOGY', 'diet-therapy-i-principles-of-human-nutrition-and-dietetics-anatomy-and-physiology', NULL::text),
  ('MATHEMATICS AND PHYSICAL SCIENCE', 'mathematics-and-physical-science', NULL::text),
  ('LEGAL ASPECTS OF NUTRITION, HIV/AIDS, NUTRITION IN HIV AND AIDS, MATERNAL AND CHILD HEALTH', 'legal-aspects-of-nutrition-hiv-aids-nutrition-in-hiv-and-aids-maternal-and-child-health', NULL::text),
  ('FOOD SAFETY AND HYGIENE, FOOD PRODUCTION FOR INVALIDS AND CONVALESCENTS AND NUTRITION ANTHROPOLOGY', 'food-safety-and-hygiene-food-production-for-invalids-and-convalescents-and-nutrition-anthropology', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BASIC BIOCHEMISTRY AND INTRODUCTION TO BIOSTATISTICS', 'basic-biochemistry-and-introduction-to-biostatistics', NULL::text),
  ('DIET THERAPY II AND NUTRITION IN LIFESPAN PRACTICE', 'diet-therapy-ii-and-nutrition-in-lifespan-practice', NULL::text),
  ('DIET THERAPY II AND NUTRITION IN LIFESPAN THEORY', 'diet-therapy-ii-and-nutrition-in-lifespan-theory', NULL::text),
  ('INTRODUCTION TO MICROBIOLOGY, FIRST AID, PRINCIPLES OF FOOD PROCESSING AND PRESERVATION', 'introduction-to-microbiology-first-aid-principles-of-food-processing-and-preservation', NULL::text),
  ('INTRODUCTION TO PRIMARY HEALTH CARE, PRINCIPLES OF NUTRITION AND BEHAVIOUR', 'introduction-to-primary-health-care-principles-of-nutrition-and-behaviour', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';

-- Module 3: Module III (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DIET THERAPY III AND NUTRITION EDUCATION AND COUNSELLING THEORY', 'diet-therapy-iii-and-nutrition-education-and-counselling-theory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN NUTRITION AND DIETETICS [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'certificate-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('LEGAL ASPECTS OF NUTRITION AND DIETETICS, HIV AND AIDS AND INTRODUCTION TO PRIMARY HEALTHCARE', 'legal-aspects-of-nutrition-and-dietetics-hiv-and-aids-and-introduction-to-primary-healthcare', NULL::text),
  ('FOOD SCIENCE, FOOD SAFETY AND HYGIENE, MEAL PLANNING MANAGEMENT AND SERVICE PRACTICE', 'food-science-food-safety-and-hygiene-meal-planning-management-and-service-practice', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text),
  ('INTRODUCTION TO NUTRITION AND DIETETICS', 'introduction-to-nutrition-and-dietetics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'certificate-in-nutrition-and-dietetics';

-- Module 2: Module II (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'certificate-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('MATERNAL AND CHILD NUTRITION, NUTRITION IN THE LIFE CYCLE AND NUTRITION FOR THE VULNERABLE GROUPS', 'maternal-and-child-nutrition-nutrition-in-the-life-cycle-and-nutrition-for-the-vulnerable-groups', NULL::text),
  ('COMMUNITY DIAGNOSIS AND MOBILIZATION, INTRODUCTION TO NUTRITION SURVEILLANCE AND NUTRITION IN EMERGENCY', 'community-diagnosis-and-mobilization-introduction-to-nutrition-surveillance-and-nutrition-in-emergency', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'certificate-in-nutrition-and-dietetics';

COMMIT;
-- Verification Query: Check courses and units inserted for HEALTH SCIENCES
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'health-sciences'
-- GROUP BY d.name;