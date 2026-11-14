-- ==============================================================================
-- SEED SCRIPT FOR: SOCIAL WORK DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 7 | Total Units: 112
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
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'social-work-department'
-- GROUP BY d.name;