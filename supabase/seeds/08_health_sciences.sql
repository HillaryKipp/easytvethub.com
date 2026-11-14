-- ==============================================================================
-- SEED SCRIPT FOR: HEALTH SCIENCE DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 7 | Total Units: 102
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
BEGIN;

-- 1. Ensure Programme Exists
INSERT INTO programmes (name, slug, description, sort_order)
VALUES (
  'Modular CDACC Courses (Cycle 3)',
  'modular-cdacc-courses-cycle-3',
  'TVET CDACC Cycle 3 modularized competency-based education and training (CBET) courses across Levels 3, 4, 5, and 6 in Kenya.',
  1
) ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 2. Upsert Department: HEALTH SCIENCE DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'HEALTH SCIENCE DEPARTMENT', 'health-science-department', 'Accredited TVET CDACC Health Science modular courses in Community Health, Nutrition & Dietetics, Healthcare Support Services, and Caregiving.', 8
FROM programmes WHERE slug = 'modular-cdacc-courses-cycle-3'
ON CONFLICT (programme_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order;

-- 3. Clean Override: Remove previous courses & modules/units under this department
-- Cascades automatically to modules and units for a completely clean sync.
DELETE FROM courses
WHERE department_id = (
  SELECT d.id FROM departments d
  JOIN programmes p ON p.id = d.programme_id
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'health-science-department'
);

-- 4. Insert Courses under HEALTH SCIENCE DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COMMUNITY HEALTH LEVEL 6', 'community-health-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'NUTRITION AND DIETETICS LEVEL 6', 'nutrition-and-dietetics-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COMMUNITY HEALTH LEVEL 5', 'community-health-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HEALTHCARE SUPPORT SERVICES LEVEL 5', 'healthcare-support-services-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'NUTRITION AND DIETETICS LEVEL 5', 'nutrition-and-dietetics-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARE GIVER LEVEL 4', 'care-giver-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'health-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HOME-BASED CARE ASSISTANT LEVEL 3', 'home-based-care-assistant-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'health-science-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: COMMUNITY HEALTH LEVEL 6 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY NUTRITION IN COMMUNITY HEALTH', 'apply-nutrition-in-community-health', NULL::text),
  ('MANAGE COMMUNITY HEALTH INFORMATION SYSTEMS', 'manage-community-health-information-systems', NULL::text),
  ('PROMOTE MATERNAL NEWBORN AND CHILD HEALTH CARE', 'promote-maternal-newborn-and-child-health-care', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MICROBIOLOGY AND PARASITOLOGY', 'apply-microbiology-and-parasitology', NULL::text),
  ('CONDUCT COMMUNITY HEALTH PROMOTION SERVICES', 'conduct-community-health-promotion-services', NULL::text),
  ('IMPLEMENT COMMUNITY HEALTH SERVICES STRATEGIES', 'implement-community-health-services-strategies', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY', 'apply-human-anatomy-and-physiology', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('ESTABLISH COMMUNITY HEALTH LINKAGES', 'establish-community-health-linkages', NULL::text),
  ('PROVIDE COMMUNITY-BASED HEALTH CARE', 'provide-community-based-health-care', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY EPIDEMIOLOGY IN COMMUNITY HEALTH', 'apply-epidemiology-in-community-health', NULL::text),
  ('CARRY OUT COMMUNITY HEALTH DIAGNOSIS AND PARTNERSHIP', 'carry-out-community-health-diagnosis-and-partnership', NULL::text),
  ('MONITOR GENDER DISABILITY AND VULNERABLE GROUPS', 'monitor-gender-disability-and-vulnerable-groups', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-6';

-- ------------------------------------------------------------------------------
-- Course: NUTRITION AND DIETETICS LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY NUTRITION LEGAL ETHICS', 'apply-nutrition-legal-ethics', NULL::text),
  ('APPLY PRINCIPLES OF HUMAN NUTRITION', 'apply-principles-of-human-nutrition', NULL::text),
  ('PROVIDE NUTRITION CARE PROCESS', 'provide-nutrition-care-process', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY KNOWLEDGE OF HUMAN ANATOMY AND PHYSIOLOGY', 'apply-knowledge-of-human-anatomy-and-physiology', NULL::text),
  ('CONDUCT DIETETICS OPERATIONS', 'conduct-dietetics-operations', NULL::text),
  ('PROVIDE MATERNAL INFANT AND YOUNG CHILD NUTRITION', 'provide-maternal-infant-and-young-child-nutrition', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MANAGE SPECIALIZED MEALS', 'manage-specialized-meals', NULL::text),
  ('PROVIDE FIRST AID SERVICES', 'provide-first-aid-services', NULL::text),
  ('PROVIDE NUTRITION IN COMMUNICABLE AND NON-COMMUNICABLE DISEASES', 'provide-nutrition-in-communicable-and-non-communicable-diseases', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF FOOD PROCESSING AND PRESERVATION', 'apply-principles-of-food-processing-and-preservation', NULL::text),
  ('CONDUCT NUTRITION EDUCATION AND COUNSELLING', 'conduct-nutrition-education-and-counselling', NULL::text),
  ('MANAGE MALNUTRITION CASES', 'manage-malnutrition-cases', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY NUTRITIONAL BIOCHEMISTRY', 'apply-nutritional-biochemistry', NULL::text),
  ('APPLY NUTRITIONAL EPIDEMIOLOGY', 'apply-nutritional-epidemiology', NULL::text),
  ('PROVIDE DIET THERAPY IN SYSTEMIC CONDITIONS', 'provide-diet-therapy-in-systemic-conditions', NULL::text),
  ('PROVIDE NUTRITION IN EMERGENCY', 'provide-nutrition-in-emergency', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY KNOWLEDGE OF FOOD MICROBIOLOGY AND PARASITOLOGY TECHNIQUES', 'apply-knowledge-of-food-microbiology-and-parasitology-techniques', NULL::text),
  ('CONDUCT NUTRITION RESEARCH', 'conduct-nutrition-research', NULL::text),
  ('PROVIDE DIET THERAPY IN NON-SYSTEMIC CONDITIONS', 'provide-diet-therapy-in-non-systemic-conditions', NULL::text),
  ('PROVIDE NUTRITIONAL CARE IN MENTAL HEALTH', 'provide-nutritional-care-in-mental-health', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-6';

-- ------------------------------------------------------------------------------
-- Course: COMMUNITY HEALTH LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY NUTRITION IN COMMUNITY HEALTH', 'apply-nutrition-in-community-health', NULL::text),
  ('MANAGE COMMUNITY HEALTH INFORMATION SYSTEMS', 'manage-community-health-information-systems', NULL::text),
  ('PROMOTE MATERNAL NEWBORN AND CHILD HEALTH CARE', 'promote-maternal-newborn-and-child-health-care', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MICROBIOLOGY AND PARASITOLOGY', 'apply-microbiology-and-parasitology', NULL::text),
  ('CONDUCT COMMUNITY HEALTH PROMOTION SERVICES', 'conduct-community-health-promotion-services', NULL::text),
  ('IMPLEMENT COMMUNITY HEALTH SERVICES STRATEGIES', 'implement-community-health-services-strategies', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY', 'apply-human-anatomy-and-physiology', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('ESTABLISH COMMUNITY HEALTH LINKAGES', 'establish-community-health-linkages', NULL::text),
  ('PROMOTE COMMUNITY-BASED HEALTH CARE', 'promote-community-based-health-care', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY EPIDEMIOLOGY IN COMMUNITY HEALTH', 'apply-epidemiology-in-community-health', NULL::text),
  ('CARRY OUT COMMUNITY HEALTH DIAGNOSIS AND PARTNERSHIP', 'carry-out-community-health-diagnosis-and-partnership', NULL::text),
  ('MONITOR GENDER DISABILITY AND VULNERABLE GROUPS', 'monitor-gender-disability-and-vulnerable-groups', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'community-health-level-5';

-- ------------------------------------------------------------------------------
-- Course: HEALTHCARE SUPPORT SERVICES LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'healthcare-support-services-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT CLIENT''S DIETARY INTERVENTIONS', 'carry-out-client-s-dietary-interventions', NULL::text),
  ('CARRY OUT PRE-DEPARTURE PROCESS', 'carry-out-pre-departure-process', NULL::text),
  ('PERFORM HOUSE KEEPING SERVICES', 'perform-house-keeping-services', NULL::text),
  ('PROVIDE PSYCHOSOCIAL SUPPORT', 'provide-psychosocial-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'healthcare-support-services-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'healthcare-support-services-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROVIDE CARE-GIVING CATERING SERVICES', 'provide-care-giving-catering-services', NULL::text),
  ('PROVIDE FIRST AID SERVICES', 'provide-first-aid-services', NULL::text),
  ('PROVIDE SPECIAL NEEDS CARE SUPPORT', 'provide-special-needs-care-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'healthcare-support-services-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'healthcare-support-services-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY', 'apply-human-anatomy-and-physiology', NULL::text),
  ('APPLY MEDICAL TERMINOLOGIES', 'apply-medical-terminologies', NULL::text),
  ('PERFORM INFECTION PREVENTION AND CONTROL', 'perform-infection-prevention-and-control', NULL::text),
  ('SUPPORT COMMON DISEASES CONTROL', 'support-common-diseases-control', NULL::text),
  ('SUPPORT HOSPITAL STORE PROCEDURES', 'support-hospital-store-procedures', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'healthcare-support-services-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'healthcare-support-services-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MEDICAL-LEGAL ETHICS', 'apply-medical-legal-ethics', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICE', 'apply-work-ethics-and-practice', NULL::text),
  ('SUPPORT HEALTH FACILITY PROCEDURES', 'support-health-facility-procedures', NULL::text),
  ('SUPPORT PATIENT CARE SERVICES', 'support-patient-care-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'healthcare-support-services-level-5';

-- ------------------------------------------------------------------------------
-- Course: NUTRITION AND DIETETICS LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY NUTRITION LEGAL ETHICS', 'apply-nutrition-legal-ethics', NULL::text),
  ('APPLY PRINCIPLES OF HUMAN NUTRITION', 'apply-principles-of-human-nutrition', NULL::text),
  ('PROVIDE NUTRITION CARE PROCESS', 'provide-nutrition-care-process', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY KNOWLEDGE OF HUMAN ANATOMY AND PHYSIOLOGY', 'apply-knowledge-of-human-anatomy-and-physiology', NULL::text),
  ('CONDUCT DIETETICS OPERATIONS', 'conduct-dietetics-operations', NULL::text),
  ('PROVIDE MATERNAL INFANT AND YOUNG CHILD NUTRITION', 'provide-maternal-infant-and-young-child-nutrition', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PLAN AND MANAGE SPECIALIZED MEALS', 'plan-and-manage-specialized-meals', NULL::text),
  ('PROVIDE FIRST AID SERVICES', 'provide-first-aid-services', NULL::text),
  ('PROVIDE NUTRITION IN COMMUNICABLE AND NON-COMMUNICABLE DISEASES', 'provide-nutrition-in-communicable-and-non-communicable-diseases', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF FOOD PROCESSING AND PRESERVATION', 'apply-principles-of-food-processing-and-preservation', NULL::text),
  ('CONDUCT NUTRITION EDUCATION AND COUNSELLING', 'conduct-nutrition-education-and-counselling', NULL::text),
  ('MANAGE MALNUTRITION CASES', 'manage-malnutrition-cases', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'nutrition-and-dietetics-level-5';

-- ------------------------------------------------------------------------------
-- Course: CARE GIVER LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'care-giver-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT CLIENT''S DIETARY INTERVENTIONS', 'carry-out-client-s-dietary-interventions', NULL::text),
  ('CARRY OUT PRE-DEPARTURE PROCESS', 'carry-out-pre-departure-process', NULL::text),
  ('PERFORM HOUSE KEEPING SERVICES', 'perform-house-keeping-services', NULL::text),
  ('PROVIDE PSYCHOSOCIAL SUPPORT', 'provide-psychosocial-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'care-giver-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'care-giver-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROVIDE FIRST AID SERVICES', 'provide-first-aid-services', NULL::text),
  ('PROVIDE SPECIAL NEEDS CARE SUPPORT', 'provide-special-needs-care-support', NULL::text),
  ('SUPPORT CAREGIVING CATERING SERVICES', 'support-caregiving-catering-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'care-giver-level-4';

-- ------------------------------------------------------------------------------
-- Course: HOME-BASED CARE ASSISTANT LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-science-department' AND c.slug = 'home-based-care-assistant-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT CLIENT DIETARY INTERVENTION', 'carry-out-client-dietary-intervention', NULL::text),
  ('CARRY OUT PRE-DEPARTURE PROCESS', 'carry-out-pre-departure-process', NULL::text),
  ('PERFORM HOUSE KEEPING SERVICES', 'perform-house-keeping-services', NULL::text),
  ('PROVIDE PSYCHOSOCIAL CARE', 'provide-psychosocial-care', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-science-department' AND c.slug = 'home-based-care-assistant-level-3';

COMMIT;
-- Verification Query: Check courses and units inserted for HEALTH SCIENCE DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'health-science-department'
-- GROUP BY d.name;