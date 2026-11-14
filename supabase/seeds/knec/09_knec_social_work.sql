-- ==============================================================================
-- SEED SCRIPT FOR: SOCIAL WORK (KNEC COURSES)
-- Total Courses: 2 | Total Units: 51
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

-- 2. Upsert Department under KNEC: SOCIAL WORK
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'SOCIAL WORK', 'social-work', 'KNEC Diploma and Certificate past examination papers and modules in Social Work, Community Development, and Project Management.', 9
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'social-work'
);

-- 4. Insert KNEC Courses under SOCIAL WORK
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SOCIAL WORK AND COMMUNITY DEVELOPMENT', 'diploma-in-social-work-and-community-development', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'social-work';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'NATIONAL CERTIFICATE IN SOCIAL DEVELOPMENT', 'national-certificate-in-social-development', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'social-work';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SOCIAL WORK AND COMMUNITY DEVELOPMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('SOCIAL WORK THEORY AND PRACTICE', 'social-work-theory-and-practice', NULL::text),
  ('INTRODUCTION TO COMMUNITY DEVELOPMENT', 'introduction-to-community-development', NULL::text),
  ('DEVELOPMENT ECONOMICS', 'development-economics', NULL::text),
  ('ENTREPRENEURSHIP STUDIES', 'entrepreneurship-studies', NULL::text),
  ('COMMUNITY CAPACITY BUILDING AND EMPOWERMENT', 'community-capacity-building-and-empowerment', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(ICT)', 'information-communication-technology-ict', NULL::text),
  ('COMMUNITY BASED ORGANIZATIONS', 'community-based-organizations', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('LEGAL ASPECTS IN SOCIAL DEVELOPMENT WORK', 'legal-aspects-in-social-development-work', NULL::text),
  ('RESOURCE MOBILIZATION AND FUNDRAISING', 'resource-mobilization-and-fundraising', NULL::text),
  ('PROJECT MANAGEMENT', 'project-management', NULL::text),
  ('ADVOCACY AND LOBBYING', 'advocacy-and-lobbying', NULL::text),
  ('HIV/AIDS AND OTHER PANDEMICS', 'hiv-aids-and-other-pandemics', NULL::text),
  ('STATISTICS', 'statistics', NULL::text),
  ('RESOURCE MANAGEMENT', 'resource-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';

-- Module 3: Module III (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DISASTER MANAGEMENT', 'disaster-management', NULL::text),
  ('SOCIAL PSYCHOLOGY AND HUMAN DEVELOPMENT', 'social-psychology-and-human-development', NULL::text),
  ('SOCIAL REHABILITATION AND REINTEGRATION', 'social-rehabilitation-and-reintegration', NULL::text),
  ('SOCIAL POLICY AND ADMINISTRATION', 'social-policy-and-administration', NULL::text),
  ('COMMUNITY LEADERSHIP', 'community-leadership', NULL::text),
  ('INTRODUCTION TO COUNSELING PSYCHOLOGY', 'introduction-to-counseling-psychology', NULL::text),
  ('TRANSFORMATION', 'transformation', NULL::text),
  ('SOCIAL MARKETING', 'social-marketing', NULL::text),
  ('COMMUNITY DEVELOPMENT METHODOLOGIES', 'community-development-methodologies', NULL::text),
  ('MANAGEMENT OF COMMUNITY CONCERNS', 'management-of-community-concerns', NULL::text),
  ('GENDER AND DEVELOPMENT', 'gender-and-development', NULL::text),
  ('SOCIAL RESEARCH PROJECT', 'social-research-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';

-- ------------------------------------------------------------------------------
-- Course: NATIONAL CERTIFICATE IN SOCIAL DEVELOPMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'national-certificate-in-social-development';

-- Module 2: Module II (23 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'national-certificate-in-social-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('HUMAN GROWTH, DEVELOPMENT AND COMMUNITY HEALTH', 'human-growth-development-and-community-health', NULL::text),
  ('SOCIAL DEVELOPMENT, THEORY, METHODS, POLICY AND ADMINISTRATION', 'social-development-theory-methods-policy-and-administration', NULL::text),
  ('LAW, HISTORY AND GOVERNMENT', 'law-history-and-government', NULL::text),
  ('PROJECT DEVELOPMENT MANAGEMENT, ECONOMICS AND ADMINISTRATION', 'project-development-management-economics-and-administration', NULL::text),
  ('SOCIAL RESEARCH PROJECT', 'social-research-project', NULL::text),
  ('KISWAHILI', 'kiswahili', NULL::text),
  ('SOCIAL RESEARCH METHODS AND COMMUNICATION SKILLS', 'social-research-methods-and-communication-skills', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('COMMUNITY HEALTH', 'community-health', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('ADMINISTRATION AND MANAGEMENT', 'administration-and-management', NULL::text),
  ('DEVELOPMENT ECONOMICS', 'development-economics', NULL::text),
  ('FIELD PRACTICUM/REPORT', 'field-practicum-report', NULL::text),
  ('PROJECT', 'project', NULL::text),
  ('ENGLISH LANGUAGE', 'english-language', NULL::text),
  ('ESSENTIALS OF SOCIAL POLICY AND ADMINISTRATION', 'essentials-of-social-policy-and-administration', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('SOCIOLOGY', 'sociology', NULL::text),
  ('INTRODUCTION TO COMMUNITY DEVELOPMENT', 'introduction-to-community-development', NULL::text),
  ('LEGAL ASPECTS IN SOCIAL WORK', 'legal-aspects-in-social-work', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY', 'information-and-communication-technology', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work' AND c.slug = 'national-certificate-in-social-development';

COMMIT;
-- Verification Query: Check courses and units inserted for SOCIAL WORK
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'social-work'
-- GROUP BY d.name;