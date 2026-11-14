-- ==============================================================================
-- SEED SCRIPT FOR: HEALTH SCIENCE DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 12 | Total Units: 211
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

COMMIT;
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'health-science-department'
-- GROUP BY d.name;