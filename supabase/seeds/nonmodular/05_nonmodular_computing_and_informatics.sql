-- ==============================================================================
-- SEED SCRIPT FOR: COMPUTING AND INFORMATICS DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 9 | Total Units: 153
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

-- 2. Upsert Department under Cycle 1 & 2: COMPUTING AND INFORMATICS DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'COMPUTING AND INFORMATICS DEPARTMENT', 'computing-and-informatics-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Computing and Informatics courses in Computer Science, Programming, Cyber Security, Graphic Design, and ICT.', 5
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
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department'
);

-- 4. Insert Non-Modular Courses under COMPUTING AND INFORMATICS DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COMPUTER PROGRAMMING LEVEL 6', 'computer-programming-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COMPUTER SCIENCE LEVEL 6', 'computer-science-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CYBER SECURITY TECHNICIAN LEVEL 6', 'cyber-security-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GRAPHIC DESIGN LEVEL 6', 'graphic-design-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ICT TECHNICIAN LEVEL 6', 'ict-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CYBER SECURITY LEVEL 5', 'cyber-security-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GRAPHIC DESIGN LEVEL 5', 'graphic-design-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ICT TECHNICIAN LEVEL 5', 'ict-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ICT TECHNICIAN LEVEL 4', 'ict-technician-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: COMPUTER PROGRAMMING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-programming-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-programming-level-6';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-programming-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC COMPUTER SKILLS', 'apply-basic-computer-skills', NULL::text),
  ('APPLY DISCRETE MATHEMATICAL CONCEPTS', 'apply-discrete-mathematical-concepts', NULL::text),
  ('APPLY EVENT DRIVEN PROGRAMMING CONCEPTS USING VB.NET', 'apply-event-driven-programming-concepts-using-vb-net', NULL::text),
  ('APPLY OBJECT ORIENTED PROGRAMMING CONCEPTS USING JAVA', 'apply-object-oriented-programming-concepts-using-java', NULL::text),
  ('DEMONSTRATE DATABASE DESIGN AND DEVELOPMENT', 'demonstrate-database-design-and-development', NULL::text),
  ('DEMONSTRATE PROGRAMMING CONCEPTS', 'demonstrate-programming-concepts', NULL::text),
  ('DESIGN ALGORITHMS AND DATA STRUCTURES', 'design-algorithms-and-data-structures', NULL::text),
  ('DEVELOP CLIENT-SIDE WEB APPLICATIONS', 'develop-client-side-web-applications', NULL::text),
  ('DEVELOP MOBILE APPLICATIONS', 'develop-mobile-applications', NULL::text),
  ('DEVELOP SERVER-SIDE WEB APPLICATIONS', 'develop-server-side-web-applications', NULL::text),
  ('UNDERSTAND AGILE DEVELOPMENT CONCEPTS', 'understand-agile-development-concepts', NULL::text),
  ('UNDERSTAND COMPUTING BASICS', 'understand-computing-basics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-programming-level-6';

-- ------------------------------------------------------------------------------
-- Course: COMPUTER SCIENCE LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';

-- Section 2: Common Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEMONSTRATE BASIC ELECTRONIC SKILLS', 'demonstrate-basic-electronic-skills', NULL::text),
  ('UNDERSTAND MATHEMATICS FOR COMPUTER SCIENCE', 'understand-mathematics-for-computer-science', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';

-- Section 3: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DEMONSTRATE DATABASE MANAGEMENT SKILLS', 'demonstrate-database-management-skills', NULL::text),
  ('DEMONSTRATE WEB DESIGN SKILLS', 'demonstrate-web-design-skills', NULL::text),
  ('DEVELOP AN INFORMATION SYSTEM', 'develop-an-information-system', NULL::text),
  ('UNDERSTAND ALGORITHMS AND DATA STRUCTURES', 'understand-algorithms-and-data-structures', NULL::text),
  ('UNDERSTAND ARTIFICIAL INTELLIGENCE', 'understand-artificial-intelligence', NULL::text),
  ('UNDERSTAND COMPUTER ORGANIZATION AND ARCHITECTURE', 'understand-computer-organization-and-architecture', NULL::text),
  ('UNDERSTAND FUNDAMENTALS OF PROGRAMMING', 'understand-fundamentals-of-programming', NULL::text),
  ('UNDERSTAND GRAPHIC DESIGN', 'understand-graphic-design', NULL::text),
  ('UNDERSTAND NETWORKING AND DISTRIBUTED SYSTEMS', 'understand-networking-and-distributed-systems', NULL::text),
  ('UNDERSTAND OPERATING SYSTEMS', 'understand-operating-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'computer-science-level-6';

-- ------------------------------------------------------------------------------
-- Course: CYBER SECURITY TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-technician-level-6';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUILD SECURE NETWORK', 'build-secure-network', NULL::text),
  ('CONDUCT SECURITY ASSESSMENT AND TESTING', 'conduct-security-assessment-and-testing', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF CYBER SECURITY LAWS, POLICIES AND REGULATIONS', 'demonstrate-understanding-of-cyber-security-laws-policies-and-regulations', NULL::text),
  ('DEVELOP COMPUTER SOFTWARE', 'develop-computer-software', NULL::text),
  ('INSTALL CYBER SECURITY SYSTEM', 'install-cyber-security-system', NULL::text),
  ('MANAGE CYBER SECURITY RISKS', 'manage-cyber-security-risks', NULL::text),
  ('MANAGE SECURITY OPERATIONS', 'manage-security-operations', NULL::text),
  ('PERFORM COMPUTER NETWORKING', 'perform-computer-networking', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text),
  ('SECURE DATABASES', 'secure-databases', NULL::text),
  ('SECURE SOFTWARE APPLICATION', 'secure-software-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: GRAPHIC DESIGN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-6';

-- Section 2: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN ELEMENTS AND PRINCIPLES', 'apply-design-elements-and-principles', NULL::text),
  ('CONCEPTUALIZE GRAPHIC DESIGN', 'conceptualize-graphic-design', NULL::text),
  ('CREATE ADVERTISING DESIGN', 'create-advertising-design', NULL::text),
  ('CREATE DIGITAL GRAPHIC DESIGN', 'create-digital-graphic-design', NULL::text),
  ('CREATE TYPOGRAPHY', 'create-typography', NULL::text),
  ('DEVELOP CORPORATE IDENTITY', 'develop-corporate-identity', NULL::text),
  ('DEVELOP USER EXPERIENCE DESIGN', 'develop-user-experience-design', NULL::text),
  ('GENERATE GRAPHIC DESIGN BUDGET', 'generate-graphic-design-budget', NULL::text),
  ('MANAGE GRAPHIC PRODUCTION', 'manage-graphic-production', NULL::text),
  ('PERFORM HAND DRAWING', 'perform-hand-drawing', NULL::text),
  ('PERFORM PHOTOGRAPHY OPERATIONS', 'perform-photography-operations', NULL::text),
  ('PRODUCE GRAPHIC ILLUSTRATIONS', 'produce-graphic-illustrations', NULL::text),
  ('PRODUCE PACKAGING DESIGN', 'produce-packaging-design', NULL::text),
  ('PRODUCE PUBLICATION DESIGN', 'produce-publication-design', NULL::text),
  ('PRODUCE SIGNAGE', 'produce-signage', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-6';

-- ------------------------------------------------------------------------------
-- Course: ICT TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';

-- Section 2: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC ELECTRONICS', 'apply-basic-electronics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';

-- Section 3: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONTROL ICT SECURITY THREATS', 'control-ict-security-threats', NULL::text),
  ('DEVELOP COMPUTER PROGRAM', 'develop-computer-program', NULL::text),
  ('INSTALL COMPUTER SOFTWARE', 'install-computer-software', NULL::text),
  ('MANAGE DATABASE SYSTEMS', 'manage-database-systems', NULL::text),
  ('MANAGE INFORMATION SYSTEM', 'manage-information-system', NULL::text),
  ('MOBILE APPLICATION DEVELOPMENT', 'mobile-application-development', NULL::text),
  ('PERFORM COMPUTER NETWORKING', 'perform-computer-networking', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text),
  ('PERFORM GRAPHIC DESIGN', 'perform-graphic-design', NULL::text),
  ('PERFORM ICT SYSTEM SUPPORT', 'perform-ict-system-support', NULL::text),
  ('PERFORM SYSTEM ANALYSIS AND DESIGN', 'perform-system-analysis-and-design', NULL::text),
  ('PERFORM WEBSITE DESIGN', 'perform-website-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: CYBER SECURITY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-level-5';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONDUCT CYBER SECURITY ASSESSMENT AND TESTING', 'conduct-cyber-security-assessment-and-testing', NULL::text),
  ('CONDUCT CYBER SECURITY ASSESSMENT AND TESTING.', 'conduct-cyber-security-assessment-and-testing-2', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF CYBER SECURITY LAWS, POLICIES AND REGULATIONS', 'demonstrate-understanding-of-cyber-security-laws-policies-and-regulations', NULL::text),
  ('INSTALL CYBER SECURITY SYSTEM', 'install-cyber-security-system', NULL::text),
  ('PERFORM COMPUTER NETWORKING', 'perform-computer-networking', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text),
  ('SECURE DATABASES', 'secure-databases', NULL::text),
  ('SECURE SOFTWARE APPLICATION', 'secure-software-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'cyber-security-level-5';

-- ------------------------------------------------------------------------------
-- Course: GRAPHIC DESIGN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN ELEMENTS AND PRINCIPLES', 'apply-design-elements-and-principles', NULL::text),
  ('CONCEPTUALIZE GRAPHIC DESIGN', 'conceptualize-graphic-design', NULL::text),
  ('CREATE DIGITAL GRAPHICS', 'create-digital-graphics', NULL::text),
  ('CREATE GRAPHIC ARTWORK', 'create-graphic-artwork', NULL::text),
  ('PERFORM HAND DRAWING', 'perform-hand-drawing', NULL::text),
  ('PRODUCE GRAPHIC DESIGN ARTWORK', 'produce-graphic-design-artwork', NULL::text),
  ('PRODUCE GRAPHIC ILLUSTRATIONS', 'produce-graphic-illustrations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'graphic-design-level-5';

-- ------------------------------------------------------------------------------
-- Course: ICT TECHNICIAN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';

-- Section 2: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC ELECTRONICS', 'apply-basic-electronics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DEVELOP COMPUTER PROGRAM', 'develop-computer-program', NULL::text),
  ('INSTALL COMPUTER SOFTWARE', 'install-computer-software', NULL::text),
  ('MANAGE DATABASE SYSTEMS', 'manage-database-systems', NULL::text),
  ('MANAGE OPERATING SYSTEM', 'manage-operating-system', NULL::text),
  ('PERFORM COMPUTER NETWORKING', 'perform-computer-networking', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: ICT TECHNICIAN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MICROSOFT OFFICE TOOLS', 'apply-microsoft-office-tools', NULL::text),
  ('INSTALL COMPUTER SOFTWARE', 'install-computer-software', NULL::text),
  ('REPAIR AND MAINTAIN A COMPUTER', 'repair-and-maintain-a-computer', NULL::text),
  ('USE OF ICT DEVICES', 'use-of-ict-devices', NULL::text),
  ('USE THE INTERNET', 'use-the-internet', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-4';

COMMIT;
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'computing-and-informatics-department'
-- GROUP BY d.name;