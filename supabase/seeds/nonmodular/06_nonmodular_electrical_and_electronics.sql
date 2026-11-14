-- ==============================================================================
-- SEED SCRIPT FOR: ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 14 | Total Units: 204
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

-- 2. Upsert Department under Cycle 1 & 2: ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT', 'electrical-and-electronic-engineering-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Electrical and Electronic Engineering courses in Power, Instrumentation, Telecommunication, and Solar PV.', 6
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
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department'
);

-- 4. Insert Non-Modular Courses under ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL ENGINEERING (POWER OPTION) LEVEL 6', 'electrical-engineering-power-option-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION LEVEL 6', 'electrical-installation-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL TECHNICIAN (POWER OPTION) LEVEL 6', 'electrical-technician-power-option-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS ENGINEERING LEVEL 6', 'electronics-engineering-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS TECHNICIAN LEVEL 6', 'electronics-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TELECOMMUNICATION ENGINEERING LEVEL 6', 'telecommunication-engineering-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION LEVEL 5', 'electrical-installation-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL OPERATION LEVEL 5', 'electrical-operation-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS CRAFTSPERSON LEVEL 5', 'electronics-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS ENGINEERING LEVEL 5', 'electronics-engineering-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION LEVEL 4', 'electrical-installation-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV INSTALLATION LEVEL 4', 'solar-pv-installation-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION LEVEL 3', 'electrical-installation-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV INSTALLATION LEVEL 3', 'solar-pv-installation-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL ENGINEERING (POWER OPTION) LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-power-option-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-power-option-level-6';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-power-option-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('AUTOMATE AN ELECTRICAL MACHINE', 'automate-an-electrical-machine', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF POWER GENERATION', 'demonstrate-understanding-of-power-generation', NULL::text),
  ('INSTALL ELECTRICAL MACHINES', 'install-electrical-machines', NULL::text),
  ('INSTALL ELECTRICAL POWER LINES', 'install-electrical-power-lines', NULL::text),
  ('INSTALL SECURITY SYSTEMS', 'install-security-systems', NULL::text),
  ('INSTALL SOLAR SYSTEMS', 'install-solar-systems', NULL::text),
  ('MAINTAIN ELECTRICAL EQUIPMENT AND SYSTEMS', 'maintain-electrical-equipment-and-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWING', 'prepare-and-interpret-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-power-option-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP PROCESS', 'apply-workshop-process', NULL::text),
  ('PERFORM WORKSHOP PROCESS', 'perform-workshop-process', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('MAINTAIN ELECTRICAL SYSTEMS', 'maintain-electrical-systems', NULL::text),
  ('MANAGE ELECTRICAL INSTALLATION SITES', 'manage-electrical-installation-sites', NULL::text),
  ('PERFORM COMMISSIONING OF ELECTRICAL SYSTEMS.', 'perform-commissioning-of-electrical-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM ELECTRICAL SYSTEM BREAKDOWN MAINTENANCE', 'perform-electrical-system-breakdown-maintenance', NULL::text),
  ('PERFORM TESTING OF ELECTRICAL INSTALLATION', 'perform-testing-of-electrical-installation', NULL::text),
  ('PLAN ELECTRICAL INSTALLATION WORK', 'plan-electrical-installation-work', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL TECHNICIAN (POWER OPTION) LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-technician-power-option-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-technician-power-option-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-technician-power-option-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('AUTOMATE AN ELECTRICAL MACHINE', 'automate-an-electrical-machine', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF POWER GENERATION', 'demonstrate-understanding-of-power-generation', NULL::text),
  ('ELECTRICAL TRANSMISSION POWER LINES', 'electrical-transmission-power-lines', NULL::text),
  ('INSTALL ELECTRICAL MACHINE', 'install-electrical-machine', NULL::text),
  ('MAINTAIN ELECTRICAL EQUIPMENT AND SYSTEMS', 'maintain-electrical-equipment-and-systems', NULL::text),
  ('MANAGE AN ELECTRICAL PROJECT', 'manage-an-electrical-project', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-technician-power-option-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS ENGINEERING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-6';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('INSTALL ELECTRICAL MACHINES CONTROL SYSTEM', 'install-electrical-machines-control-system', NULL::text),
  ('INSTALL POWER SUPPLY SYSTEM', 'install-power-supply-system', NULL::text),
  ('MAINTAIN AUTOMATION AND RADIO FREQUENCY SYSTEMS', 'maintain-automation-and-radio-frequency-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM INDUSTRIAL AUTOMATION', 'perform-industrial-automation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATIC', 'apply-engineering-mathematic', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('INSTALL ELECTRICAL MACHINE CONTROL SYSTEM', 'install-electrical-machine-control-system', NULL::text),
  ('INSTALL POWER SUPPLY SYSTEM', 'install-power-supply-system', NULL::text),
  ('MAINTAIN AUTOMATION AND RADIO FREQUENCY SYSTEMS', 'maintain-automation-and-radio-frequency-systems', NULL::text),
  ('PERFORM INDUSTRIAL AUTOMATION', 'perform-industrial-automation', NULL::text),
  ('PERFORMING ELECTRICAL INSTALLATION', 'performing-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: TELECOMMUNICATION ENGINEERING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-engineering-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-engineering-level-6';

-- Section 2: Core Units of Competency (21 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP PROCESSES', 'apply-workshop-processes', NULL::text),
  ('BROADCAST TV AND RADIO SIGNALS', 'broadcast-tv-and-radio-signals', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('INSTALL BASE TRANSCEIVER STATION', 'install-base-transceiver-station', NULL::text),
  ('INSTALL BROADCASTING MONITOR', 'install-broadcasting-monitor', NULL::text),
  ('INSTALL COMMUNICATION EQUIPMENT', 'install-communication-equipment', NULL::text),
  ('INSTALL FIBER OPTIC CABLE', 'install-fiber-optic-cable', NULL::text),
  ('INSTALL INSIDE PLANT NETWORK', 'install-inside-plant-network', NULL::text),
  ('INSTALL IP PABX', 'install-ip-pabx', NULL::text),
  ('INSTALL RADAR SYSTEM', 'install-radar-system', NULL::text),
  ('INSTALL SATELLITE SIGNAL REFLECTORS', 'install-satellite-signal-reflectors', NULL::text),
  ('INSTALL SECURITY SYSTEMS', 'install-security-systems', NULL::text),
  ('INSTALL TELECOMMUNICATION TRANSMISSION EQUIPMENT', 'install-telecommunication-transmission-equipment', NULL::text),
  ('INSTALL TELEPHONE NETWORK', 'install-telephone-network', NULL::text),
  ('INSTALL WI-FI NETWORK', 'install-wi-fi-network', NULL::text),
  ('MAINTAIN TELECOMMUNICATION EQUIPMENT AND SYSTEMS', 'maintain-telecommunication-equipment-and-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM TCP-IP AND NETWORKING', 'perform-tcp-ip-and-networking', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWING', 'prepare-and-interpret-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-engineering-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWING', 'prepare-and-interpret-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('MAINTAIN ELECTRICAL INSTALLATION SYSTEMS', 'maintain-electrical-installation-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM ELECTRICAL SYSTEM BREAKDOWN MAINTENANCE', 'perform-electrical-system-breakdown-maintenance', NULL::text),
  ('PERFORM TESTING OF ELECTRICAL INSTALLATION', 'perform-testing-of-electrical-installation', NULL::text),
  ('PLAN ELECTRICAL INSTALLATION WORKS', 'plan-electrical-installation-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL OPERATION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM WORKSHOP PROCESS.', 'perform-workshop-process', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DEMONSTRATE UNDERSTANDING OF ELECTRONICS', 'demonstrate-understanding-of-electronics', NULL::text),
  ('INSTALL ELECTRICAL MACHINE', 'install-electrical-machine', NULL::text),
  ('INSTALL ELECTRICAL POWER LINES', 'install-electrical-power-lines', NULL::text),
  ('INSTALL SECURITY SYSTEM', 'install-security-system', NULL::text),
  ('INSTALL SOLAR SYSTEMS', 'install-solar-systems', NULL::text),
  ('PERFORM ELECTRICAL BREAKDOWN MAINTENANCE', 'perform-electrical-breakdown-maintenance', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-operation-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-craftsperson-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-craftsperson-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('INSTALL ELECTRICAL MACHINE CONTROL SYSTEMS', 'install-electrical-machine-control-systems', NULL::text),
  ('INSTALL POWER SUPPLY SYSTEMS', 'install-power-supply-systems', NULL::text),
  ('MAINTAIN RADIO FREQUENCY SYSTEMS', 'maintain-radio-frequency-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS ENGINEERING LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('INSTALL ELECTRICAL MACHINE CONTROL SYSTEM', 'install-electrical-machine-control-system', NULL::text),
  ('INSTALL POWER SUPPLY SYSTEMS', 'install-power-supply-systems', NULL::text),
  ('MAINTAIN RADIO FREQUENCY SYSTEMS', 'maintain-radio-frequency-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-engineering-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-4';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION TESTING', 'perform-electrical-installation-testing', NULL::text),
  ('PERFORM ELECTRICAL SYSTEM BREAKDOWN MAINTENANCE', 'perform-electrical-system-breakdown-maintenance', NULL::text),
  ('PERFORM WORKSHOP PRACTICES', 'perform-workshop-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS.', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-4';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV INSTALLATION LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-4';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSPECT SOLAR PHOTOVOLTAIC SYSTEM INSTALLATION SITE', 'inspect-solar-photovoltaic-system-installation-site', NULL::text),
  ('INSTALL DC AND AC SOLAR PHOTOVOLTAIC SYSTEM', 'install-dc-and-ac-solar-photovoltaic-system', NULL::text),
  ('INSTALL DC SOLAR PHOTOVOLTAIC SYSTEM', 'install-dc-solar-photovoltaic-system', NULL::text),
  ('MAINTAIN SOLAR PV SYSTEMS', 'maintain-solar-pv-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-4';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM FIXING AND MAINTENANCE OF LIGHT FITTINGS, POWER OUTLETS AND BASIC APPLIANCES', 'perform-fixing-and-maintenance-of-light-fittings-power-outlets-and-basic-appliances', NULL::text),
  ('PERFORM PVC SHEATHED CABLING, CONDUITING, TRUNKING AND CABLE TRAYS LAYING', 'perform-pvc-sheathed-cabling-conduiting-trunking-and-cable-trays-laying', NULL::text),
  ('PERFORM SINGLE PHASE ELECTRICAL INSTALLATION AND MAINTENANCE', 'perform-single-phase-electrical-installation-and-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-level-3';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV INSTALLATION LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT SOLAR PV SITE SURVEY', 'conduct-solar-pv-site-survey', NULL::text),
  ('DESIGN A SOLAR PV INSTALLATION SYSTEM', 'design-a-solar-pv-installation-system', NULL::text),
  ('INSTALL SOLAR PV SYSTEM', 'install-solar-pv-system', NULL::text),
  ('MAINTAIN SOLAR PV SYSTEM', 'maintain-solar-pv-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-installation-level-3';

COMMIT;
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'electrical-and-electronic-engineering-department'
-- GROUP BY d.name;