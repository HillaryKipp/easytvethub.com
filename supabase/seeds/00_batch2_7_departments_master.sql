-- ==============================================================================
-- BATCH 2 SEED SCRIPT (7 DEPARTMENTS: COMPUTING, ELECTRICAL, FASHION, HEALTH, CATERING, MECHANICAL, SOCIAL WORK)
-- Total Courses: 99 | Total Units: 1187
-- Safe to run in Supabase SQL Editor
-- ==============================================================================
BEGIN;

-- Ensure Programme Exists
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

-- ==============================================================================
-- SEED SCRIPT FOR: COMPUTING AND INFORMATICS DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 9 | Total Units: 112
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: COMPUTING AND INFORMATICS DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'COMPUTING AND INFORMATICS DEPARTMENT', 'computing-and-informatics-department', 'Accredited TVET CDACC Computing and Informatics modular courses in ICT, Software Development, Network System Administration, and Library & Information Management.', 5
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department'
);

-- 4. Insert Courses under COMPUTING AND INFORMATICS DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ICT TECHNICIAN LEVEL 6', 'ict-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LIBRARY AND INFORMATION MANAGEMENT LEVEL 6', 'library-and-information-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'NETWORK SYSTEM ADMINISTRATION LEVEL 6', 'network-system-administration-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOFTWARE DEVELOPER LEVEL 6', 'software-developer-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INFORMATION COMMUNICATION TECHNOLOGY LEVEL 5', 'information-communication-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LIBRARY AND INFORMATION MANGMENT LEVEL 5', 'library-and-information-mangment-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'NETWORK SYSTEM ADMINISTRATION LEVEL 5', 'network-system-administration-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOFTWARE DEVELOPMENT LEVEL 5', 'software-development-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INFORMATION AND COMMUNICATION TECHNOLOGY LEVEL 4', 'information-and-communication-technology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'computing-and-informatics-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ICT TECHNICIAN LEVEL 6 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC ELECTRONICS', 'apply-basic-electronics', NULL::text),
  ('APPLY COMPUTER PROGRAMMING PRINCIPLES', 'apply-computer-programming-principles', NULL::text),
  ('APPLY DISCRETE MATHEMATICAL CONCEPTS', 'apply-discrete-mathematical-concepts', NULL::text),
  ('PERFORM SYSTEM ANALYSIS AND DESIGN', 'perform-system-analysis-and-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('DEVELOP DESKTOP APPLICATION', 'develop-desktop-application', NULL::text),
  ('DEVELOP WEBSITE APPLICATION', 'develop-website-application', NULL::text),
  ('INSTALL COMPUTER SOFTWARE', 'install-computer-software', NULL::text),
  ('MANAGE COMPUTERIZED DATABASE SYSTEMS', 'manage-computerized-database-systems', NULL::text),
  ('MANAGE ICT SECURITY', 'manage-ict-security', NULL::text),
  ('PERFORM COMPUTER ESSENTIALS', 'perform-computer-essentials', NULL::text),
  ('PERFORM COMPUTER NETWORK SETUP', 'perform-computer-network-setup', NULL::text),
  ('PERFORM COMPUTER OPERATIONS', 'perform-computer-operations', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text),
  ('PERFORM NETWORK DESIGN AND MANAGEMENT', 'perform-network-design-and-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'ict-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: LIBRARY AND INFORMATION MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('MAINTAIN ORGANIZATIONAL RECORDS', 'maintain-organizational-records', NULL::text),
  ('PERFORM INFORMATION COLLECTION DEVELOPMENT', 'perform-information-collection-development', NULL::text),
  ('PROCESS INFORMATION MATERIALS', 'process-information-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY WORKPLACE ETHICS AND PRACTICES', 'apply-workplace-ethics-and-practices', NULL::text),
  ('PERFORM CIRCULATION DUTIES', 'perform-circulation-duties', NULL::text),
  ('PERFORM RESTORATION OF INFORMATION MATERIALS', 'perform-restoration-of-information-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MANAGEMENT PRINCIPLES', 'apply-management-principles', NULL::text),
  ('PERFORM LIBRARY CATALOGUING', 'perform-library-cataloguing', NULL::text),
  ('PERFORM SYSTEM ANALYSIS AND DESIGN', 'perform-system-analysis-and-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT LIBRARY AND INFORMATION MANAGEMENT RESEARCH', 'conduct-library-and-information-management-research', NULL::text),
  ('MANAGE LIBRARY INFORMATION RESOURCES', 'manage-library-information-resources', NULL::text),
  ('PRESERVE LIBRARY INFORMATION MATERIALS', 'preserve-library-information-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CONDUCT INDEXING AND ABSTRACTING', 'conduct-indexing-and-abstracting', NULL::text),
  ('MANAGE DIGITAL REPOSITORY', 'manage-digital-repository', NULL::text),
  ('MANAGE ORGANIZATIONAL RECORDS', 'manage-organizational-records', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: NETWORK SYSTEM ADMINISTRATION LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMPUTER OPERATIONS', 'apply-computer-operations', NULL::text),
  ('DESIGN COMPUTER NETWORK', 'design-computer-network', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL COMPUTER NETWORK SOFTWARE', 'install-computer-network-software', NULL::text),
  ('SETUP COMPUTER NETWORK', 'setup-computer-network', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONFIGURE COMPUTER NETWORK SECURITY', 'configure-computer-network-security', NULL::text),
  ('PERFORM COMPUTER NETWORK MAINTENANCE', 'perform-computer-network-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC ELECTRONICS', 'apply-basic-electronics', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MONITOR COMPUTER NETWORK SECURITY', 'monitor-computer-network-security', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DISCRETE MATHEMATICAL CONCEPTS', 'apply-discrete-mathematical-concepts', NULL::text),
  ('PERFORM COMPUTER SYSTEM ADMINISTRATION', 'perform-computer-system-administration', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM DATABASE ADMINISTRATION', 'perform-database-administration', NULL::text),
  ('PERFORM SYSTEM VIRTUALIZATION', 'perform-system-virtualization', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-6';

-- ------------------------------------------------------------------------------
-- Course: SOFTWARE DEVELOPER LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY STRUCTURED PROGRAMMING', 'apply-structured-programming', NULL::text),
  ('ESTABLISH SOFTWARE SYSTEM REQUIREMENTS', 'establish-software-system-requirements', NULL::text),
  ('PERFORM COMPUTER OPERATIONS', 'perform-computer-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DISCRETE MATHEMATICAL CONCEPTS', 'apply-discrete-mathematical-concepts', NULL::text),
  ('OFFER APPLICATION END-USER SUPPORT', 'offer-application-end-user-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MANAGE COMPUTERISED DATABASE SYSTEM', 'manage-computerised-database-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY PROJECT MANAGEMENT PRINCIPLES', 'apply-project-management-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CREATE WEB APPLICATION', 'create-web-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY OBJECT ORIENTED PROGRAMMING', 'apply-object-oriented-programming', NULL::text),
  ('DEVELOP DESKTOP APPLICATION', 'develop-desktop-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('DEVELOP MOBILE APPLICATION', 'develop-mobile-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-developer-level-6';

-- ------------------------------------------------------------------------------
-- Course: INFORMATION COMMUNICATION TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-communication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM COMPUTER ESSENTIALS', 'perform-computer-essentials', NULL::text),
  ('PERFORM COMPUTER OPERATIONS', 'perform-computer-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-communication-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-communication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM COMPUTER NETWORK SETUP', 'perform-computer-network-setup', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-communication-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-communication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC ELECTRONICS', 'apply-basic-electronics', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL COMPUTER SOFTWARE', 'install-computer-software', NULL::text),
  ('PERFORM NETWORK DESIGN AND MANAGEMENT', 'perform-network-design-and-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-communication-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-communication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY COMPUTER PROGRAMMING PRINCIPLES', 'apply-computer-programming-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MANAGE COMPUTERIZED DATABASE SYSTEM', 'manage-computerized-database-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-communication-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: LIBRARY AND INFORMATION MANGMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-mangment-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('MAINTAIN ORGANIZATIONAL RECORDS', 'maintain-organizational-records', NULL::text),
  ('PERFORM INFORMATION COLLECTION DEVELOPMENT', 'perform-information-collection-development', NULL::text),
  ('PROCESS INFORMATION MATERIALS', 'process-information-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-mangment-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-mangment-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM CIRCULATION DUTIES', 'perform-circulation-duties', NULL::text),
  ('PERFORM RESTORATION OF INFORMATION MATERIALS', 'perform-restoration-of-information-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-mangment-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-mangment-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF MANAGEMENT', 'apply-principles-of-management', NULL::text),
  ('PERFORM LIBRARY CATALOGUING', 'perform-library-cataloguing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'library-and-information-mangment-level-5';

-- ------------------------------------------------------------------------------
-- Course: NETWORK SYSTEM ADMINISTRATION LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMPUTER OPERATIONS', 'apply-computer-operations', NULL::text),
  ('DESIGN COMPUTER NETWORK', 'design-computer-network', NULL::text),
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL COMPUTER NETWORK SOFTWARE', 'install-computer-network-software', NULL::text),
  ('SETUP COMPUTER NETWORK', 'setup-computer-network', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONFIGURE COMPUTER NETWORK SECURITY', 'configure-computer-network-security', NULL::text),
  ('PERFORM COMPUTER NETWORK MAINTENANCE', 'perform-computer-network-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC ELECTRONICS', 'apply-basic-electronics', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MONITOR COMPUTER NETWORK SECURITY', 'monitor-computer-network-security', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'network-system-administration-level-5';

-- ------------------------------------------------------------------------------
-- Course: SOFTWARE DEVELOPMENT LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-development-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY STRUCTURED PROGRAMMING', 'apply-structured-programming', NULL::text),
  ('ESTABLISH SOFTWARE SYSTEM REQUIREMENTS', 'establish-software-system-requirements', NULL::text),
  ('PERFORM COMPUTER OPERATIONS', 'perform-computer-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-development-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-development-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DISCRETE MATHEMATICAL CONCEPTS', 'apply-discrete-mathematical-concepts', NULL::text),
  ('OFFER APPLICATION END-USER SUPPORT', 'offer-application-end-user-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-development-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-development-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MANAGE COMPUTERISED DATABASE SYSTEM', 'manage-computerised-database-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-development-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-development-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY PROJECT MANAGEMENT PRINCIPLES', 'apply-project-management-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CREATE WEB APPLICATION', 'create-web-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'software-development-level-5';

-- ------------------------------------------------------------------------------
-- Course: INFORMATION AND COMMUNICATION TECHNOLOGY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-and-communication-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM COMPUTER ESSENTIALS', 'perform-computer-essentials', NULL::text),
  ('PERFORM COMPUTER OPERATIONS', 'perform-computer-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-and-communication-technology-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-and-communication-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM COMPUTER REPAIR AND MAINTENANCE', 'perform-computer-repair-and-maintenance', NULL::text),
  ('SETUP COMPUTER NETWORK', 'setup-computer-network', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computing-and-informatics-department' AND c.slug = 'information-and-communication-technology-level-4';


-- ==============================================================================
-- SEED SCRIPT FOR: ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 15 | Total Units: 195
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT', 'electrical-and-electronic-engineering-department', 'Accredited TVET CDACC Electrical and Electronic Engineering modular courses in Electrical Installation, Mechatronics, Instrumentation & Control, Solar PV, and Telecommunications.', 6
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department'
);

-- 4. Insert Courses under ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL ENGINEERING TECHNOLOGY LEVEL 6', 'electrical-engineering-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL MECHATRONICS TECHNOLOGY LEVEL 6', 'industrial-mechatronics-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INSTRUMENTATION AND CONTROL TECHNICIAN LEVEL 6', 'instrumentation-and-control-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TELECOMMUNICATION TECHNOLOGY LEVEL 6', 'telecommunication-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL ENGINEERING TECHNOLOGY LEVEL 5', 'electrical-engineering-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INSTRUMENTATION AND CONTROL TECHNOLOGY LEVEL 5', 'instrumentation-and-control-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV SYSTEM INSTALLATION TECHNOLOGY LEVEL 5', 'solar-pv-system-installation-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TELECOMMUNICATION TECHNOLOGY LEVEL 5', 'telecommunication-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION TECHNOLOGY LEVEL 4', 'electrical-installation-technology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS ARTISAN LEVEL 4', 'electronics-artisan-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INSTRUMENTATION AND CONTROL OPERATOR LEVEL 4', 'instrumentation-and-control-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV SYSTEMS INSTALLER LEVEL 4', 'solar-pv-systems-installer-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION TECHNOLOGY LEVEL 3', 'electrical-installation-technology-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS ARTISAN LEVEL 3', 'electronics-artisan-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV SYSTEMS INSTALLER LEVEL 3', 'solar-pv-systems-installer-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL ENGINEERING TECHNOLOGY LEVEL 6 (8 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL CONDUIT SYSTEM', 'install-conduit-system', NULL::text),
  ('INSTALL PVC SHEATHED CABLE SYSTEM', 'install-pvc-sheathed-cable-system', NULL::text),
  ('INSTALL TRUNKING SYSTEM', 'install-trunking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL STAND-ALONE SOLAR PV SYSTEMS', 'install-stand-alone-solar-pv-systems', NULL::text),
  ('PERFORM BELL AND ALARM INSTALLATION', 'perform-bell-and-alarm-installation', NULL::text),
  ('WIND ELECTRICAL MACHINE', 'wind-electrical-machine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC ELECTRICAL PRINCIPLES', 'apply-basic-electrical-principles', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS', 'prepare-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY DIGITAL ELECTRONICS I', 'apply-digital-electronics-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS I', 'apply-engineering-technician-mathematics-i', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM SECURITY SYSTEM INSTALLATION', 'perform-security-system-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY DIGITAL ELECTRONICS II', 'apply-digital-electronics-ii', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS II', 'apply-engineering-technician-mathematics-ii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('INSTALL SOLAR PV SYSTEMS', 'install-solar-pv-systems', NULL::text),
  ('PERFORM ELECTRICAL MACHINE INSTALLATION', 'perform-electrical-machine-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES I', 'apply-electrical-principles-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS III', 'apply-engineering-technician-mathematics-iii', NULL::text),
  ('APPLY MICRO CONTROL SYSTEMS', 'apply-micro-control-systems', NULL::text),
  ('INSTALL ELECTRICAL POWER LINES', 'install-electrical-power-lines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY CONTROL SYSTEMS', 'apply-control-systems', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES II', 'apply-electrical-principles-ii', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS IV', 'apply-engineering-technician-mathematics-iv', NULL::text),
  ('AUTOMATE ELECTRICAL SYSTEMS', 'automate-electrical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 8: Module 8
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 8, 'Module 8'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 8
JOIN (VALUES
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('FABRICATE POWER ELECTRONICS CIRCUITS', 'fabricate-power-electronics-circuits', NULL::text),
  ('PERFORM ELECTRICAL MEASUREMENT AND FAULT DIAGNOSIS', 'perform-electrical-measurement-and-fault-diagnosis', NULL::text),
  ('SUPERVISE ELECTRICAL PROJECT', 'supervise-electrical-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL MECHATRONICS TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS', 'apply-thermodynamics-and-fluid-mechanics', NULL::text),
  ('DESIGN ELECTROMECHANICAL SYSTEMS', 'design-electromechanical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('INSTALL AND MAINTAIN ELECTROMECHANICAL SYSTEM', 'install-and-maintain-electromechanical-system', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('INSTALL AND MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'install-and-maintain-hydraulic-and-pneumatic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('INSTALL AND MAINTAIN PLC SYSTEM', 'install-and-maintain-plc-system', NULL::text),
  ('INSTALL AND MAINTAIN STAND-ALONE CONTROLLERS', 'install-and-maintain-stand-alone-controllers', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('INSTALL AND MAINTAIN ROBOTIC SYSTEM', 'install-and-maintain-robotic-system', NULL::text),
  ('INSTALL AND MAINTAIN SUPERVISORY CONTROL AND DATA ACQUISITION (SCADA) SYSTEMS', 'install-and-maintain-supervisory-control-and-data-acquisition-scada-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('INSTALL ELECTRICAL MACHINES AND MECHANICAL DRIVES', 'install-electrical-machines-and-mechanical-drives', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('OPERATE FABRICATION MACHINERY', 'operate-fabrication-machinery', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: INSTRUMENTATION AND CONTROL TECHNICIAN LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL INSTRUMENTATION AND CONTROL SYSTEM COMPONENT', 'install-instrumentation-and-control-system-component', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INSTRUMENTATION AND CONTROL SYSTEMS', 'maintain-instrumentation-and-control-systems', NULL::text),
  ('OPERATE INSTRUMENTATION AND CONTROL SYSTEM', 'operate-instrumentation-and-control-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('FABRICATE ELECTRONIC CIRCUITS', 'fabricate-electronic-circuits', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEM', 'install-hydraulic-and-pneumatic-system', NULL::text),
  ('PREPARE ENGINEERING DRAWING AND DESIGN', 'prepare-engineering-drawing-and-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL ELECTRICAL MACHINES', 'install-electrical-machines', NULL::text),
  ('INSTALL LOGIC CONTROLLERS', 'install-logic-controllers', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS', 'apply-engineering-technician-mathematics', NULL::text),
  ('FABRICATE ADVANCE ELECTRONICS CIRCUIT', 'fabricate-advance-electronics-circuit', NULL::text),
  ('MONITOR CONTROL AND INSTRUMENTATION SYSTEMS', 'monitor-control-and-instrumentation-systems', NULL::text),
  ('PERFORM ELECTRICAL AND FAULT DIAGNOSIS', 'perform-electrical-and-fault-diagnosis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY CONTROL SYSTEMS', 'apply-control-systems', NULL::text),
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('CALIBRATE INDUSTRIAL MEASUREMENT INSTRUMENTS', 'calibrate-industrial-measurement-instruments', NULL::text),
  ('SUPERVISE INSTRUMENTATION AND CONTROL SYSTEM', 'supervise-instrumentation-and-control-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: TELECOMMUNICATION TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL SKILLS', 'apply-digital-skills', NULL::text),
  ('INSTALL ELECTRICAL SYSTEMS', 'install-electrical-systems', NULL::text),
  ('PREPARE ENGINEERING DRAWINGS', 'prepare-engineering-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS', 'apply-engineering-technician-mathematics', NULL::text),
  ('INSTALL SPECIALIZED POWER SYSTEMS', 'install-specialized-power-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL COMPUTER NETWORK', 'install-computer-network', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('FABRICATE ELECTRONIC CIRCUITS', 'fabricate-electronic-circuits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY TELECOMMUNICATION PRINCIPLES', 'apply-telecommunication-principles', NULL::text),
  ('FABRICATE EMBEDDED AND RF CIRCUITS', 'fabricate-embedded-and-rf-circuits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('INSTALL BROADCASTING COMMUNICATION SYSTEMS', 'install-broadcasting-communication-systems', NULL::text),
  ('INSTALL TELEPHONY SYSTEM', 'install-telephony-system', NULL::text),
  ('INSTALL WIRELESS COMMUNICATION TRANSMISSION LINKS', 'install-wireless-communication-transmission-links', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('INSTALL ENTERPRISE COMPUTER NETWORKS', 'install-enterprise-computer-networks', NULL::text),
  ('INSTALL FIBER OPTICS NETWORKS', 'install-fiber-optics-networks', NULL::text),
  ('MAINTAIN COMMUNICATION SYSTEMS', 'maintain-communication-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL ENGINEERING TECHNOLOGY LEVEL 5 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL CONDUIT SYSTEM', 'install-conduit-system', NULL::text),
  ('INSTALL PVC SHEATHED CABLE SYSTEM', 'install-pvc-sheathed-cable-system', NULL::text),
  ('INSTALL TRUNKING SYSTEM', 'install-trunking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL STAND-ALONE SOLAR PV SYSTEMS', 'install-stand-alone-solar-pv-systems', NULL::text),
  ('PERFORM BELL AND ALARM INSTALLATION', 'perform-bell-and-alarm-installation', NULL::text),
  ('WIND ELECTRICAL MACHINE', 'wind-electrical-machine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC ELECTRICAL PRINCIPLES', 'apply-basic-electrical-principles', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS', 'prepare-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY DIGITAL ELECTRONICS I', 'apply-digital-electronics-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS 1', 'apply-engineering-technician-mathematics-1', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM SECURITY SYSTEM INSTALLATION', 'perform-security-system-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY DIGITAL ELECTRONICS II', 'apply-digital-electronics-ii', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS 11', 'apply-engineering-technician-mathematics-11', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('INSTALL SOLAR PV SYSTEMS', 'install-solar-pv-systems', NULL::text),
  ('PERFORM ELECTRICAL MACHINE INSTALLATION', 'perform-electrical-machine-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: INSTRUMENTATION AND CONTROL TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL INSTRUMENTATION AND CONTROL SYSTEM COMPONENT', 'install-instrumentation-and-control-system-component', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INSTRUMENTATION AND CONTROL SYSTEMS', 'maintain-instrumentation-and-control-systems', NULL::text),
  ('OPERATE INSTRUMENTATION AND CONTROL SYSTEM', 'operate-instrumentation-and-control-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('FABRICATE ELECTRONICS CIRCUIT', 'fabricate-electronics-circuit', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEM', 'install-hydraulic-and-pneumatic-system', NULL::text),
  ('PREPARE ENGINEERING DRAWING AND DESIGN', 'prepare-engineering-drawing-and-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('INSTALL ELECTRICAL MACHINES', 'install-electrical-machines', NULL::text),
  ('INSTALL LOGIC CONTROLLERS', 'install-logic-controllers', NULL::text),
  ('WORK ETHICS AND PRACTICES', 'work-ethics-and-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV SYSTEM INSTALLATION TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DC SOLAR PV SYSTEMS', 'install-dc-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM I', 'install-solar-water-pump-system-i', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION I', 'perform-electrical-installation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL SOLAR PV SYSTEMS', 'install-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM II', 'install-solar-water-pump-system-ii', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION II', 'perform-electrical-installation-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL ELECTRONICS I', 'apply-digital-electronics-i', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES I', 'apply-electrical-principles-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS I', 'apply-engineering-technician-mathematics-i', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('DESIGN SOLAR PV SYSTEMS', 'design-solar-pv-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION III', 'perform-electrical-installation-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY DIGITAL ELECTRONICS II', 'apply-digital-electronics-ii', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES II', 'apply-electrical-principles-ii', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS II', 'apply-engineering-technician-mathematics-ii', NULL::text),
  ('INSTALL SOLAR PV PUMPS SYSTEM', 'install-solar-pv-pumps-system', NULL::text),
  ('PERFORM SECURITY SYSTEM INSTALLATION', 'perform-security-system-installation', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS', 'prepare-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: TELECOMMUNICATION TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL SKILLS', 'apply-digital-skills', NULL::text),
  ('INSTALL ELECTRICAL SYSTEMS', 'install-electrical-systems', NULL::text),
  ('PREPARE ENGINEERING DRAWINGS', 'prepare-engineering-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS', 'apply-engineering-technician-mathematics', NULL::text),
  ('INSTALL SPECIALIZED POWER SYSTEMS', 'install-specialized-power-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL COMPUTER NETWORK', 'install-computer-network', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('FABRICATE ELECTRONIC CIRCUITS', 'fabricate-electronic-circuits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION TECHNOLOGY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL CONDUIT SYSTEM', 'install-conduit-system', NULL::text),
  ('INSTALL PVC SHEATHED CABLE SYSTEM', 'install-pvc-sheathed-cable-system', NULL::text),
  ('INSTALL TRUNKING SYSTEM', 'install-trunking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL STAND-ALONE SOLAR PV SYSTEMS', 'install-stand-alone-solar-pv-systems', NULL::text),
  ('PERFORM BELL AND ALARM INSTALLATION', 'perform-bell-and-alarm-installation', NULL::text),
  ('WIND ELECTRICAL MACHINE', 'wind-electrical-machine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-4';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS ARTISAN LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('PERFORM ELECTRICAL AND ELECTRONICS EQUIPMENT AND APPLIANCES REPAIRS', 'perform-electrical-and-electronics-equipment-and-appliances-repairs', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION I', 'perform-electrical-installation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL POWER SUPPLY SYSTEMS', 'install-power-supply-systems', NULL::text),
  ('MAINTAIN ELECTRICAL AND ELECTRONIC EQUIPMENT AND APPLIANCES', 'maintain-electrical-and-electronic-equipment-and-appliances', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION II', 'perform-electrical-installation-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-4';

-- ------------------------------------------------------------------------------
-- Course: INSTRUMENTATION AND CONTROL OPERATOR LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL INSTRUMENTATION AND CONTROL SYSTEM COMPONENT', 'install-instrumentation-and-control-system-component', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-operator-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INSTRUMENTATION AND CONTROL SYSTEMS', 'maintain-instrumentation-and-control-systems', NULL::text),
  ('OPERATE INSTRUMENTATION AND CONTROL SYSTEM', 'operate-instrumentation-and-control-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-operator-level-4';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV SYSTEMS INSTALLER LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DC SOLAR PV SYSTEMS', 'install-dc-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM 1', 'install-solar-water-pump-system-1', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION 1', 'perform-electrical-installation-1', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL SOLAR PV SYSTEMS', 'install-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM II', 'install-solar-water-pump-system-ii', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION II', 'perform-electrical-installation-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-4';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION TECHNOLOGY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL CONDUIT SYSTEM', 'install-conduit-system', NULL::text),
  ('INSTALL PVC SHEATHED CABLE SYSTEM', 'install-pvc-sheathed-cable-system', NULL::text),
  ('INSTALL TRUNKING SYSTEM', 'install-trunking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-3';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS ARTISAN LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('PERFORM ELECTRICAL AND ELECTRONICS EQUIPMENT AND APPLIANCES REPAIRS', 'perform-electrical-and-electronics-equipment-and-appliances-repairs', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION I', 'perform-electrical-installation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-3';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV SYSTEMS INSTALLER LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DC SOLAR PV SYSTEMS', 'install-dc-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM', 'install-solar-water-pump-system', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: FASHION DESIGN AND COSMETOLOGY DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 11 | Total Units: 127
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: FASHION DESIGN AND COSMETOLOGY DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'FASHION DESIGN AND COSMETOLOGY DEPARTMENT', 'fashion-design-and-cosmetology-department', 'Accredited TVET CDACC Fashion Design and Cosmetology modular courses in Hairdressing, Beauty Therapy, Nail Care, Fashion Design, and Footwear Production.', 7
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department'
);

-- 4. Insert Courses under FASHION DESIGN AND COSMETOLOGY DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COSMETOLOGY LEVEL 6', 'cosmetology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 6', 'fashion-design-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COSMETOLOGY LEVEL 5', 'cosmetology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 5', 'fashion-design-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOTWEAR PRODUCTION LEVEL 5', 'footwear-production-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COSMETOLOGY LEVEL 4', 'cosmetology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 4', 'fashion-design-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOTWEAR PRODUCTION LEVEL 4', 'footwear-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COSMETOLOGY LEVEL 3', 'cosmetology-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 3', 'fashion-design-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOTWEAR PRODUCTION LEVEL 3', 'footwear-production-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: COSMETOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT BARBERING SERVICE', 'conduct-barbering-service', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE', 'provide-manicure-and-pedicure', NULL::text),
  ('PROVIDE PLAITING AND BRAIDING', 'provide-plaiting-and-braiding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM HAIR STYLING SERVICES', 'perform-hair-styling-services', NULL::text),
  ('PROVIDE HAIR ADDITIONS SERVICES', 'provide-hair-additions-services', NULL::text),
  ('PROVIDE MAKE UP SERVICES', 'provide-make-up-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM NAIL CARE SERVICE', 'perform-nail-care-service', NULL::text),
  ('PROVIDE DREAD LOCKING SERVICE', 'provide-dread-locking-service', NULL::text),
  ('PROVIDE HAIR REMOVAL SERVICE', 'provide-hair-removal-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS PRACTICES', 'apply-work-ethics-practices', NULL::text),
  ('CONDUCT HAIR CUTTING SERVICE', 'conduct-hair-cutting-service', NULL::text),
  ('PROVIDE FACIAL SKIN CARE SERVICE', 'provide-facial-skin-care-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('MANAGE HAIR AND BEAUTY PARLOR', 'manage-hair-and-beauty-parlor', NULL::text),
  ('PERFORM HAIR CHEMICAL REFORMATION', 'perform-hair-chemical-reformation', NULL::text),
  ('PRODUCE HAIR EXTENSIONS', 'produce-hair-extensions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('CARRY OUT COSMETOLOGY RESEARCH', 'carry-out-cosmetology-research', NULL::text),
  ('PROVIDE BODY MASSAGE', 'provide-body-massage', NULL::text),
  ('PROVIDE HAIR COLOURING', 'provide-hair-colouring', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT BASIC GENT''S GARMENTS', 'construct-basic-gent-s-garments', NULL::text),
  ('CONSTRUCT BASIC LADIES'' GARMENTS', 'construct-basic-ladies-garments', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE DECORATED FABRICS (TIE & DYE AND PRINTING)', 'produce-decorated-fabrics-tie-and-dye-and-printing', NULL::text),
  ('PRODUCE STYLED GARMENTS', 'produce-styled-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY FASHION DESIGN AND SKETCHING', 'apply-fashion-design-and-sketching', NULL::text),
  ('APPLY TEXTILE MATERIALS PRINCIPLES', 'apply-textile-materials-principles', NULL::text),
  ('PRODUCE DECORATED FABRICS (BATIK AND EMBROIDERY)', 'produce-decorated-fabrics-batik-and-embroidery', NULL::text),
  ('PRODUCE LADIES'' WEAR', 'produce-ladies-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PATTERN CONSTRUCTION PRINCIPLES', 'apply-pattern-construction-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PRODUCE GENTS'' WEAR', 'produce-gents-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY GARMENT CUTTING PRINCIPLES', 'apply-garment-cutting-principles', NULL::text),
  ('APPLY INDUSTRIAL ORGANISATION MANAGEMENT', 'apply-industrial-organisation-management', NULL::text),
  ('PRODUCE CHILDREN''S WEAR', 'produce-children-s-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY COMPUTER AIDED DESIGN', 'apply-computer-aided-design', NULL::text),
  ('APPLY QUALITY CONTROL PRINCIPLES', 'apply-quality-control-principles', NULL::text),
  ('PRODUCE FASHION ACCESSORIES', 'produce-fashion-accessories', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('PRODUCE LINGERIE WEAR', 'produce-lingerie-wear', NULL::text),
  ('PRODUCE OCCASION WEAR', 'produce-occasion-wear', NULL::text),
  ('PRODUCE SPORTS WEAR', 'produce-sports-wear', NULL::text),
  ('PRODUCE UNIFORM WEAR', 'produce-uniform-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- ------------------------------------------------------------------------------
-- Course: COSMETOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT BARBERING SERVICE', 'conduct-barbering-service', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICE', 'provide-manicure-and-pedicure-service', NULL::text),
  ('PROVIDE PLAITING AND BRAIDING SERVICE', 'provide-plaiting-and-braiding-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONDUCT HAIR ADDITION SERVICE', 'conduct-hair-addition-service', NULL::text),
  ('PERFORM HAIR STYLING SERVICE', 'perform-hair-styling-service', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM NAIL CARE SERVICES', 'perform-nail-care-services', NULL::text),
  ('PROVIDE DREAD LOCKING SERVICE', 'provide-dread-locking-service', NULL::text),
  ('PROVIDE HAIR REMOVAL SERVICE', 'provide-hair-removal-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT HAIR CUTTING SERVICE', 'conduct-hair-cutting-service', NULL::text),
  ('PROVIDE FACIAL SKIN CARE SERVICE', 'provide-facial-skin-care-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT BASIC GENTS'' GARMENTS', 'construct-basic-gents-garments', NULL::text),
  ('CONSTRUCT BASIC LADIES'' GARMENTS', 'construct-basic-ladies-garments', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE DECORATED FABRICS (TIE & DIE AND PRINTING)', 'produce-decorated-fabrics-tie-and-die-and-printing', NULL::text),
  ('PRODUCE STYLED GARMENTS', 'produce-styled-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY FASHION DESIGN AND SKETCHING', 'apply-fashion-design-and-sketching', NULL::text),
  ('APPLY TEXTILE MATERIAL PRINCIPLES', 'apply-textile-material-principles', NULL::text),
  ('PRODUCE DECORATED FABRICS (BATIK AND EMBROIDERY)', 'produce-decorated-fabrics-batik-and-embroidery', NULL::text),
  ('PRODUCE LADIES'' WEAR', 'produce-ladies-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PATTERN CONSTRUCTION AND GRADING PRINCIPLES', 'apply-pattern-construction-and-grading-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PRODUCE GENTS'' WEAR', 'produce-gents-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOTWEAR PRODUCTION LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION I', 'carry-out-foot-wear-materials-preparation-i', NULL::text),
  ('CARRY OUT FOOTWEAR CONSTRUCTION AND FINISHING I', 'carry-out-footwear-construction-and-finishing-i', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS I', 'perform-footwear-closing-operations-i', NULL::text),
  ('REPAIR FOOTWEAR PRODUCTS', 'repair-footwear-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION II', 'carry-out-foot-wear-materials-preparation-ii', NULL::text),
  ('CARRY OUT PATTERN CUTTING', 'carry-out-pattern-cutting', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS II', 'perform-footwear-closing-operations-ii', NULL::text),
  ('PERFORM FOOTWEAR CONSTRUCTION AND FINISHING II', 'perform-footwear-construction-and-finishing-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CARRY OUT FOOT MEASUREMENTS AND CALCULATIONS', 'carry-out-foot-measurements-and-calculations', NULL::text),
  ('CARRY OUT FOOTWEAR DESIGN AND PATTERN CUTTING', 'carry-out-footwear-design-and-pattern-cutting', NULL::text),
  ('CUT FOOTWEAR MATERIALS', 'cut-footwear-materials', NULL::text),
  ('PREPARE FOOTWEAR COMPONENTS', 'prepare-footwear-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CARRY OUT FOOTWEAR CONSTRUCTION', 'carry-out-footwear-construction', NULL::text),
  ('CARRY OUT FOOTWEAR FINISHING OPERATIONS', 'carry-out-footwear-finishing-operations', NULL::text),
  ('PERFORM ESTIMATES AND COSTING', 'perform-estimates-and-costing', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS III', 'perform-footwear-closing-operations-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';

-- ------------------------------------------------------------------------------
-- Course: COSMETOLOGY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT BARBERING SERVICE', 'conduct-barbering-service', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICE', 'provide-manicure-and-pedicure-service', NULL::text),
  ('PROVIDE PLAITING AND BRAIDING SERVICE', 'provide-plaiting-and-braiding-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM HAIR ADDITION SERVICE', 'perform-hair-addition-service', NULL::text),
  ('PERFORM HAIR STYLING SERVICE', 'perform-hair-styling-service', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-4';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT BASIC GENTS'' GARMENTS', 'construct-basic-gents-garments', NULL::text),
  ('CONSTRUCT BASIC LADIES'' GARMENTS', 'construct-basic-ladies-garments', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE DECORATED FABRICS', 'produce-decorated-fabrics', NULL::text),
  ('PRODUCE STYLED GARMENTS', 'produce-styled-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOTWEAR PRODUCTION LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION', 'carry-out-foot-wear-materials-preparation', NULL::text),
  ('CARRY OUT FOOTWEAR CONSTRUCTION AND FINISHING I', 'carry-out-footwear-construction-and-finishing-i', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS I', 'perform-footwear-closing-operations-i', NULL::text),
  ('REPAIR FOOTWEAR PRODUCTS', 'repair-footwear-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION II', 'carry-out-foot-wear-materials-preparation-ii', NULL::text),
  ('CARRY OUT FOOT WEAR PATTERN CUTTING', 'carry-out-foot-wear-pattern-cutting', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS II', 'perform-footwear-closing-operations-ii', NULL::text),
  ('PERFORM FOOTWEAR CONSTRUCTION AND FINISHING II', 'perform-footwear-construction-and-finishing-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-4';

-- ------------------------------------------------------------------------------
-- Course: COSMETOLOGY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT BARBERING SERVICE', 'conduct-barbering-service', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICE', 'provide-manicure-and-pedicure-service', NULL::text),
  ('PROVIDE PLAITING AND BRAIDING SERVICE', 'provide-plaiting-and-braiding-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-3';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT BASIC GENTS'' GARMENTS', 'construct-basic-gents-garments', NULL::text),
  ('CONSTRUCT BASIC LADIES'' GARMENTS', 'construct-basic-ladies-garments', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-3';

-- ------------------------------------------------------------------------------
-- Course: FOOTWEAR PRODUCTION LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION', 'carry-out-foot-wear-materials-preparation', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS', 'perform-footwear-closing-operations', NULL::text),
  ('PERFORM OUT FOOTWEAR CONSTRUCTION AND FINISHING I', 'perform-out-footwear-construction-and-finishing-i', NULL::text),
  ('REPAIR FOOTWEAR PRODUCTS', 'repair-footwear-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: HEALTH SCIENCE DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 7 | Total Units: 102
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
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


-- ==============================================================================
-- SEED SCRIPT FOR: CATERING AND ACCOMMODATION DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 23 | Total Units: 253
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: CATERING AND ACCOMMODATION DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'CATERING AND ACCOMMODATION DEPARTMENT', 'catering-and-accommodation-department', 'Accredited TVET CDACC Catering and Accommodation modular courses in Food & Beverage, Culinary Arts, Baking, Barista, Housekeeping, Tour & Travel, and Hospitality Management.', 9
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department'
);

-- 4. Insert Courses under CATERING AND ACCOMMODATION DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CATERING AND ACCOMMODATION MANAGEMENT LEVEL 6', 'catering-and-accommodation-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE MANAGEMENT LEVEL 6 - PATHWAY A', 'food-and-beverage-management-level-6-pathway-a', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE MANAGEMENT LEVEL 6 - PATHWAY B', 'food-and-beverage-management-level-6-pathway-b', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD TECHNOLOGY LEVEL 6', 'food-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOUR AND TRAVEL MANAGEMENT LEVEL 6', 'tour-and-travel-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CATERING AND ACCOMMODATION OPERATIONS LEVEL 5', 'catering-and-accommodation-operations-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE OPERATIONS LEVEL 5 - PATHWAY A', 'food-and-beverage-operations-level-5-pathway-a', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE OPERATIONS LEVEL 5 - PATHWAY B', 'food-and-beverage-operations-level-5-pathway-b', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD TECHNOLOGY LEVEL 5', 'food-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOUR AND TRAVEL OPERATIONS LEVEL 5', 'tour-and-travel-operations-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOUR GUIDE LEVEL 5', 'tour-guide-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ACCOMMODATION OPERATIONS LEVEL 4', 'accommodation-operations-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BAKING LEVEL 4', 'baking-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BARTENDING LEVEL 4', 'bartending-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE WAITER LEVEL 4', 'food-and-beverage-waiter-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION (COOKERY) LEVEL 4', 'food-production-cookery-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MEAT PRODUCT PROCESSING LEVEL 4', 'meat-product-processing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WILDLIFE TOUR GUIDING LEVEL 4', 'wildlife-tour-guiding-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BAKING LEVEL 3', 'baking-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BARISTA LEVEL 3', 'barista-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE SERVICE (WAITER) LEVEL 3', 'food-and-beverage-service-waiter-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION COOKERY LEVEL 3', 'food-production-cookery-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MIXOLOGY LEVEL 3', 'mixology-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'catering-and-accommodation-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: CATERING AND ACCOMMODATION MANAGEMENT LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MANAGE FRONT OFFICE OPERATIONS', 'manage-front-office-operations', NULL::text),
  ('PERFORM LAUNDRY OPERATIONS', 'perform-laundry-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM HOUSEKEEPING INTERIOR DECORATIONS', 'perform-housekeeping-interior-decorations', NULL::text),
  ('PERFORM HOUSEKEEPING OPERATIONS', 'perform-housekeeping-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY PRINCIPLES OF FOOD SCIENCE AND NUTRITION', 'apply-principles-of-food-science-and-nutrition', NULL::text),
  ('PERFORM BAR KEEPING OPERATIONS', 'perform-bar-keeping-operations', NULL::text),
  ('PREPARE DESSERTS AND BAKERY PRODUCTS', 'prepare-desserts-and-bakery-products', NULL::text),
  ('PREPARE MAIN MEAL', 'prepare-main-meal', NULL::text),
  ('PREPARE STARTERS AND STARTER ACCOMPANIMENTS', 'prepare-starters-and-starter-accompaniments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM CATERING AND ACCOMMODATION COSTING AND CONTROL', 'perform-catering-and-accommodation-costing-and-control', NULL::text),
  ('PREPARE SPECIALTY DISHES', 'prepare-specialty-dishes', NULL::text),
  ('SERVE FOOD AND BEVERAGES', 'serve-food-and-beverages', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY DIET THERAPY', 'apply-diet-therapy', NULL::text),
  ('EXECUTE BANQUET AND EVENTS', 'execute-banquet-and-events', NULL::text),
  ('PERFORM ACCOUNTING OPERATIONS', 'perform-accounting-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MARKETING SKILLS', 'apply-marketing-skills', NULL::text),
  ('MANAGE CATERING AND ACCOMMODATION OPERATIONS', 'manage-catering-and-accommodation-operations', NULL::text),
  ('UNDERTAKE HOSPITALITY RESEARCH', 'undertake-hospitality-research', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE MANAGEMENT LEVEL 6 - PATHWAY A (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PREPARE DESSERTS I', 'prepare-desserts-i', NULL::text),
  ('PREPARE MAIN MEAL I', 'prepare-main-meal-i', NULL::text),
  ('PREPARE STARTERS AND STARTER ACCOMPANIMENT I', 'prepare-starters-and-starter-accompaniment-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PREPARE PASTRIES I', 'prepare-pastries-i', NULL::text),
  ('PREPARE SPECIALTY DISHES I', 'prepare-specialty-dishes-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM FOOD AND BEVERAGE SERVICE TECHNIQUES II', 'perform-food-and-beverage-service-techniques-ii', NULL::text),
  ('PREPARE MOCKTAILS AND COCKTAILS II', 'prepare-mocktails-and-cocktails-ii', NULL::text),
  ('SERVE FOOD AND BEVERAGE II', 'serve-food-and-beverage-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('PERFORM BANQUET AND EVENTS OPERATIONS II', 'perform-banquet-and-events-operations-ii', NULL::text),
  ('PERFORM BAR KEEPING OPERATIONS II', 'perform-bar-keeping-operations-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF FOOD SCIENCE AND NUTRITION', 'apply-principles-of-food-science-and-nutrition', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM FOOD AND BEVERAGE COST CONTROL', 'perform-food-and-beverage-cost-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY DIET THERAPY', 'apply-diet-therapy', NULL::text),
  ('APPLY MARKETING SKILLS', 'apply-marketing-skills', NULL::text),
  ('PERFORM ACCOUNTING OPERATIONS', 'perform-accounting-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY PRINCIPLES OF MANAGEMENT IN FOOD AND BEVERAGE OPERATIONS', 'apply-principles-of-management-in-food-and-beverage-operations', NULL::text),
  ('UNDERTAKE HOSPITALITY RESEARCH', 'undertake-hospitality-research', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-a';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE MANAGEMENT LEVEL 6 - PATHWAY B (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM FOOD AND BEVERAGE SERVICE TECHNIQUES I', 'perform-food-and-beverage-service-techniques-i', NULL::text),
  ('PREPARE MOCKTAILS AND COCKTAILS I', 'prepare-mocktails-and-cocktails-i', NULL::text),
  ('SERVE FOOD AND BEVERAGE I', 'serve-food-and-beverage-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM BANQUET AND EVENTS OPERATIONS I', 'perform-banquet-and-events-operations-i', NULL::text),
  ('PERFORM BAR KEEPING OPERATIONS I', 'perform-bar-keeping-operations-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PREPARE DESSERTS II', 'prepare-desserts-ii', NULL::text),
  ('PREPARE MAIN MEAL II', 'prepare-main-meal-ii', NULL::text),
  ('PREPARE STARTERS AND STARTER ACCOMPANIMENT II', 'prepare-starters-and-starter-accompaniment-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('PREPARE PASTRIES II', 'prepare-pastries-ii', NULL::text),
  ('PREPARE SPECIALTY DISHES II', 'prepare-specialty-dishes-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF FOOD SCIENCE AND NUTRITION', 'apply-principles-of-food-science-and-nutrition', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM FOOD AND BEVERAGE COST CONTROL', 'perform-food-and-beverage-cost-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY DIET THERAPY', 'apply-diet-therapy', NULL::text),
  ('APPLY MARKETING SKILLS', 'apply-marketing-skills', NULL::text),
  ('PERFORM ACCOUNTING OPERATIONS', 'perform-accounting-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY PRINCIPLES OF MANAGEMENT IN FOOD AND BEVERAGE OPERATIONS', 'apply-principles-of-management-in-food-and-beverage-operations', NULL::text),
  ('UNDERTAKE HOSPITALITY RESEARCH', 'undertake-hospitality-research', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-management-level-6-pathway-b';

-- ------------------------------------------------------------------------------
-- Course: FOOD TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('MAINTAIN FOOD PLANT HYGIENE', 'maintain-food-plant-hygiene', NULL::text),
  ('PREPARE FOOD PROCESSING RAW MATERIALS', 'prepare-food-processing-raw-materials', NULL::text),
  ('PROCESS DAIRY PRODUCTS', 'process-dairy-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY FOOD PROCESSING AND PRESERVATION PRINCIPLES I', 'apply-food-processing-and-preservation-principles-i', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PROCESS BAKED PRODUCTS', 'process-baked-products', NULL::text),
  ('PROCESS FRUITS AND VEGETABLES PRODUCTS', 'process-fruits-and-vegetables-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM FOOD LABORATORY PRACTICES', 'perform-food-laboratory-practices', NULL::text),
  ('PROCESS CONFECTIONERIES', 'process-confectioneries', NULL::text),
  ('PROCESS MEAT PRODUCTS I', 'process-meat-products-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY FOOD PROCESSING AND PRESERVATION PRINCIPLES II', 'apply-food-processing-and-preservation-principles-ii', NULL::text),
  ('PERFORM STANDARD FOOD LABORATORY TECHNIQUES', 'perform-standard-food-laboratory-techniques', NULL::text),
  ('PROCESS BEVERAGE PRODUCTS', 'process-beverage-products', NULL::text),
  ('PROCESS MEAT PRODUCTS II', 'process-meat-products-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('PROCESS CEREAL PRODUCTS', 'process-cereal-products', NULL::text),
  ('PROCESS FATS AND OILS', 'process-fats-and-oils', NULL::text),
  ('PROCESS SUGAR', 'process-sugar', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('CONDUCT RESEARCH PROJECT', 'conduct-research-project', NULL::text),
  ('DEVELOP NEW FOOD PRODUCTS', 'develop-new-food-products', NULL::text),
  ('FOOD PROCESSING QUALITY ASSURANCE', 'food-processing-quality-assurance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: TOUR AND TRAVEL MANAGEMENT LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TOURISM INDUSTRY KNOWLEDGE', 'apply-tourism-industry-knowledge', NULL::text),
  ('PERFORM TOUR & TRAVEL BOOKING AND RESERVATIONS', 'perform-tour-and-travel-booking-and-reservations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT TOURISM RESEARCH', 'conduct-tourism-research', NULL::text),
  ('PROCESS FLIGHT BOOKING/RESERVATION', 'process-flight-booking-reservation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM TOUR GUIDE OPERATIONS', 'perform-tour-guide-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BEGINNER FOREIGN LANGUAGE SKILLS', 'apply-beginner-foreign-language-skills', NULL::text),
  ('MANAGE TOURIST EXPERIENCE', 'manage-tourist-experience', NULL::text),
  ('PERFORM TOUR AND TRAVEL OPERATIONS', 'perform-tour-and-travel-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY INTERMEDIATE FOREIGN LANGUAGE SKILLS', 'apply-intermediate-foreign-language-skills', NULL::text),
  ('MANAGE TOUR AND TRAVEL FINANCES', 'manage-tour-and-travel-finances', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('CONDUCT TOUR MARKETING', 'conduct-tour-marketing', NULL::text),
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('MANAGE TOURIST SITE', 'manage-tourist-site', NULL::text),
  ('PROMOTE RESPONSIBLE TOURISM', 'promote-responsible-tourism', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: CATERING AND ACCOMMODATION OPERATIONS LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM FRONT OFFICE OPERATIONS', 'perform-front-office-operations', NULL::text),
  ('PERFORM LAUNDRY OPERATIONS', 'perform-laundry-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-operations-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM HOUSEKEEPING AND INTERIOR DECORATIONS', 'perform-housekeeping-and-interior-decorations', NULL::text),
  ('PERFORM HOUSEKEEPING OPERATIONS', 'perform-housekeeping-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-operations-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY PRINCIPLES OF FOOD SCIENCE AND NUTRITION', 'apply-principles-of-food-science-and-nutrition', NULL::text),
  ('PERFORM BAR KEEPING OPERATIONS', 'perform-bar-keeping-operations', NULL::text),
  ('PREPARE DESSERTS AND BAKERY PRODUCTS', 'prepare-desserts-and-bakery-products', NULL::text),
  ('PREPARE MAIN MEAL', 'prepare-main-meal', NULL::text),
  ('PREPARE STARTERS AND STARTER ACCOMPANIMENTS', 'prepare-starters-and-starter-accompaniments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-operations-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM CATERING AND ACCOMMODATION COSTING AND CONTROL', 'perform-catering-and-accommodation-costing-and-control', NULL::text),
  ('PREPARE SPECIALITY DISHES', 'prepare-speciality-dishes', NULL::text),
  ('SERVE FOOD AND BEVERAGE', 'serve-food-and-beverage', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'catering-and-accommodation-operations-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE OPERATIONS LEVEL 5 - PATHWAY A (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE MAIN MEAL', 'prepare-main-meal', NULL::text),
  ('PREPARE STARTERS AND STARTER ACCOMPANIMENTS', 'prepare-starters-and-starter-accompaniments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE SPECIALITY DISHES', 'prepare-speciality-dishes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM FOOD AND BEVERAGE SERVICE TECHNIQUES', 'perform-food-and-beverage-service-techniques', NULL::text),
  ('PREPARE MOCKTAILS AND COCKTAILS', 'prepare-mocktails-and-cocktails', NULL::text),
  ('SERVE FOOD AND BEVERAGE', 'serve-food-and-beverage', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('PERFORM BANQUET AND EVENTS OPERATIONS', 'perform-banquet-and-events-operations', NULL::text),
  ('PERFORM BAR KEEPING OPERATIONS', 'perform-bar-keeping-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF FOOD SCIENCE AND NUTRITION', 'apply-principles-of-food-science-and-nutrition', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('PERFORM FOOD AND BEVERAGE COST CONTROL', 'perform-food-and-beverage-cost-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-a';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE OPERATIONS LEVEL 5 - PATHWAY B (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM FOOD AND BEVERAGE SERVICE TECHNIQUES', 'perform-food-and-beverage-service-techniques', NULL::text),
  ('PREPARE MOCKTAILS AND COCKTAILS', 'prepare-mocktails-and-cocktails', NULL::text),
  ('SERVE FOOD AND BEVERAGE', 'serve-food-and-beverage', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM BANQUET AND EVENTS OPERATIONS', 'perform-banquet-and-events-operations', NULL::text),
  ('PERFORM BAR KEEPING OPERATIONS', 'perform-bar-keeping-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE MAIN MEAL', 'prepare-main-meal', NULL::text),
  ('PREPARE STARTERS AND STARTER ACCOMPANIMENTS', 'prepare-starters-and-starter-accompaniments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE SPECIALITY DISHES', 'prepare-speciality-dishes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF FOOD SCIENCE AND NUTRITION', 'apply-principles-of-food-science-and-nutrition', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('PERFORM FOOD AND BEVERAGE COST CONTROL', 'perform-food-and-beverage-cost-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-operations-level-5-pathway-b';

-- ------------------------------------------------------------------------------
-- Course: FOOD TECHNOLOGY LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('MAINTAIN FOOD PLANT HYGIENE', 'maintain-food-plant-hygiene', NULL::text),
  ('PREPARE FOOD PROCESSING RAW MATERIALS', 'prepare-food-processing-raw-materials', NULL::text),
  ('PROCESS DAIRY PRODUCTS', 'process-dairy-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY FOOD PROCESSING AND PRESERVATION PRINCIPLES', 'apply-food-processing-and-preservation-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PROCESS BAKED PRODUCTS', 'process-baked-products', NULL::text),
  ('PROCESS FRUITS AND VEGETABLES PRODUCTS', 'process-fruits-and-vegetables-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM FOOD LABORATORY PRACTICES', 'perform-food-laboratory-practices', NULL::text),
  ('PROCESS CONFECTIONERIES', 'process-confectioneries', NULL::text),
  ('PROCESS MEAT PRODUCTS', 'process-meat-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: TOUR AND TRAVEL OPERATIONS LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TOURISM INDUSTRY KNOWLEDGE', 'apply-tourism-industry-knowledge', NULL::text),
  ('CONDUCT TOUR BOOKING RESERVATION', 'conduct-tour-booking-reservation', NULL::text),
  ('DEVELOP TOUR AND TRAVEL PACKAGES', 'develop-tour-and-travel-packages', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-operations-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT TOURISM RESEARCH', 'conduct-tourism-research', NULL::text),
  ('PROCESS FLIGHT BOOKING/RESERVATION', 'process-flight-booking-reservation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-operations-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('ORGANIZE TOUR SAFARIS AND TRANSFER', 'organize-tour-safaris-and-transfer', NULL::text),
  ('PROVIDE TOUR AND TRAVEL CUSTOMER SERVICE', 'provide-tour-and-travel-customer-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-operations-level-5';

-- ------------------------------------------------------------------------------
-- Course: TOUR GUIDE LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BEGINNER FOREIGN LANGUAGE', 'apply-beginner-foreign-language', NULL::text),
  ('APPLY FIRST AID SKILLS', 'apply-first-aid-skills', NULL::text),
  ('CLASSIFY FLORA AND FAUNA', 'classify-flora-and-fauna', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY INTERMEDIATE FOREIGN LANGUAGE SKILLS', 'apply-intermediate-foreign-language-skills', NULL::text),
  ('PERFORM CAMPING OPERATIONS', 'perform-camping-operations', NULL::text),
  ('PERFORM WILDLIFE TOUR GUIDING ACTIVITIES', 'perform-wildlife-tour-guiding-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TOURISM INDUSTRY KNOWLEDGE', 'apply-tourism-industry-knowledge', NULL::text),
  ('PERFORM TOUR VEHICLE OPERATIONS', 'perform-tour-vehicle-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('HANDLE TOURIST ARRIVAL AND DEPARTURES', 'handle-tourist-arrival-and-departures', NULL::text),
  ('PERFORM TOUR GUIDING ACTIVITIES', 'perform-tour-guiding-activities', NULL::text),
  ('PROVIDE OUTDOOR RECREATIONAL ACTIVITIES', 'provide-outdoor-recreational-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';

-- ------------------------------------------------------------------------------
-- Course: ACCOMMODATION OPERATIONS LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'accommodation-operations-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM FRONT OFFICE OPERATIONS', 'perform-front-office-operations', NULL::text),
  ('PERFORM LAUNDRY OPERATIONS', 'perform-laundry-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'accommodation-operations-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'accommodation-operations-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('PERFORM HOUSEKEEPING AND INTERIOR DECORATIONS', 'perform-housekeeping-and-interior-decorations', NULL::text),
  ('PERFORM HOUSEKEEPING OPERATIONS', 'perform-housekeeping-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'accommodation-operations-level-4';

-- ------------------------------------------------------------------------------
-- Course: BAKING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM CAKE ICING', 'perform-cake-icing', NULL::text),
  ('PREPARE BREADS', 'prepare-breads', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM CAKE DECORATION', 'perform-cake-decoration', NULL::text),
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE YEAST PRODUCTS', 'prepare-yeast-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-level-4';

-- ------------------------------------------------------------------------------
-- Course: BARTENDING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'bartending-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM BAR KEEPING OPERATIONS I', 'perform-bar-keeping-operations-i', NULL::text),
  ('PREPARE MOCKTAILS AND COCKTAILS I', 'prepare-mocktails-and-cocktails-i', NULL::text),
  ('PREPARE NON-ALCOHOLIC AND ALCOHOLIC BEVERAGES I', 'prepare-non-alcoholic-and-alcoholic-beverages-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'bartending-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'bartending-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM BAR KEEPING OPERATIONS II', 'perform-bar-keeping-operations-ii', NULL::text),
  ('PREPARE ALCOHOLIC AND NON- ALCOHOLIC BEVERAGES II', 'prepare-alcoholic-and-non-alcoholic-beverages-ii', NULL::text),
  ('PREPARE COFFEE BEVERAGES', 'prepare-coffee-beverages', NULL::text),
  ('PREPARE MOCKTAILS AND COCKTAILS II', 'prepare-mocktails-and-cocktails-ii', NULL::text),
  ('SERVE BAR BEVERAGES AND SNACKS', 'serve-bar-beverages-and-snacks', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'bartending-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE WAITER LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-waiter-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FOOD AND BEVERAGE SERVICE', 'food-and-beverage-service', NULL::text),
  ('FOOD AND BEVERAGE SERVICE TECHNIQUES', 'food-and-beverage-service-techniques', NULL::text),
  ('MOCKTAILS AND COCKTAILS', 'mocktails-and-cocktails', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-waiter-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-waiter-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BANQUETS AND EVENTS', 'banquets-and-events', NULL::text),
  ('BAR KEEPING OPERATIONS', 'bar-keeping-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-waiter-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION (COOKERY) LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-cookery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE MAIN MEALS', 'prepare-main-meals', NULL::text),
  ('PREPARE STARTERS AND STARTER ACCOMPANIMENTS', 'prepare-starters-and-starter-accompaniments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-cookery-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-cookery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE SPECIALTY DISHES', 'prepare-specialty-dishes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-cookery-level-4';

-- ------------------------------------------------------------------------------
-- Course: MEAT PRODUCT PROCESSING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'meat-product-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PACKAGE MEAT PRODUCTS', 'package-meat-products', NULL::text),
  ('PRODUCE MEAT PRODUCTS', 'produce-meat-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'meat-product-processing-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'meat-product-processing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRY TRAINING', 'industry-training', NULL::text),
  ('MANAGE MEAT PRODUCTS HYGIENE', 'manage-meat-products-hygiene', NULL::text),
  ('MANAGE RECORDS AND DOCUMENTS', 'manage-records-and-documents', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'meat-product-processing-level-4';

-- ------------------------------------------------------------------------------
-- Course: WILDLIFE TOUR GUIDING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-tour-guiding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BEGINNER FOREIGN LANGUAGE SKILLS', 'apply-beginner-foreign-language-skills', NULL::text),
  ('APPLY FIRST AID SKILLS', 'apply-first-aid-skills', NULL::text),
  ('CLASSIFY FLORA AND FAUNA', 'classify-flora-and-fauna', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-tour-guiding-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-tour-guiding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY INTERMEDIATE FOREIGN LANGUAGE SKILLS', 'apply-intermediate-foreign-language-skills', NULL::text),
  ('INDUSTRY TRAINING', 'industry-training', NULL::text),
  ('PERFORM CAMPING OPERATIONS', 'perform-camping-operations', NULL::text),
  ('PERFORM WILDLIFE TOUR GUIDING ACTIVITIES', 'perform-wildlife-tour-guiding-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-tour-guiding-level-4';

-- ------------------------------------------------------------------------------
-- Course: BAKING LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM CAKE ICING', 'perform-cake-icing', NULL::text),
  ('PREPARE BREADS', 'prepare-breads', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-level-3';

-- ------------------------------------------------------------------------------
-- Course: BARISTA LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'barista-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PREPARE ESPRESSO', 'prepare-espresso', NULL::text),
  ('PREPARE SMOOTHIES SHAKES AND FRAPPES', 'prepare-smoothies-shakes-and-frappes', NULL::text),
  ('PREPARE TEXTURED MILK', 'prepare-textured-milk', NULL::text),
  ('SERVE COFFEE BEVERAGES', 'serve-coffee-beverages', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'barista-level-3';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE SERVICE (WAITER) LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-service-waiter-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FOOD AND BEVERAGE SERVICE', 'food-and-beverage-service', NULL::text),
  ('FOOD AND BEVERAGE SERVICE TECHNIQUES', 'food-and-beverage-service-techniques', NULL::text),
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('MOCKTAILS AND COCKTAILS', 'mocktails-and-cocktails', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-service-waiter-level-3';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION COOKERY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-cookery-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE MAIN MEAL', 'prepare-main-meal', NULL::text),
  ('PREPARE STARTERS AND STARTER ACCOMPANIMENTS', 'prepare-starters-and-starter-accompaniments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-cookery-level-3';

-- ------------------------------------------------------------------------------
-- Course: MIXOLOGY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'mixology-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM BAR-KEEPING OPERATIONS', 'perform-bar-keeping-operations', NULL::text),
  ('PREPARE MOCKTAILS AND COCKTAILS', 'prepare-mocktails-and-cocktails', NULL::text),
  ('PREPARE NON-ALCOHOLIC AND ALCOHOLIC BEVERAGES', 'prepare-non-alcoholic-and-alcoholic-beverages', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'catering-and-accommodation-department' AND c.slug = 'mixology-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 28 | Total Units: 316
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT', 'mechanical-and-automotive-engineering-department', 'Accredited TVET CDACC Mechanical and Automotive Engineering modular courses in Automotive, Autobody, Construction Plant, Mechanical Production, Welding, and Robotics.', 10
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department'
);

-- 4. Insert Courses under MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOBODY TECHNOLOGY LEVEL 6', 'autobody-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE ENGINEERING TECHNOLOGY LEVEL 6', 'automotive-engineering-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CONSTRUCTION PLANT TECHNOLOGY LEVEL 6', 'construction-plant-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL AUTOMATION AND ROBOTICS TECHNOLOGY LEVEL 6', 'industrial-automation-and-robotics-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PLANT TECHNOLOGY LEVEL 6', 'mechanical-plant-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION TECHNOLOGY LEVEL 6', 'mechanical-production-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOBODY TECHNOLOGY LEVEL 5', 'autobody-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE ENGINEERING TECHNOLOGY LEVEL 5', 'automotive-engineering-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CONSTRUCTION PLANT TECHNOLOGY LEVEL 5', 'construction-plant-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL AUTOMATION AND ROBOTICS TECHNOLOGY LEVEL 5', 'industrial-automation-and-robotics-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PLANT TECHNOLOGY LEVEL 5', 'mechanical-plant-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION TECHNOLOGY LEVEL 5', 'mechanical-production-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING TECHNOLOGY LEVEL 5', 'welding-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CNC LATHE OPERATIONS (PRODUCTION) LEVEL 4', 'cnc-lathe-operations-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CNC MILLING OPERATIONS (PRODUCTION) LEVEL 4', 'cnc-milling-operations-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL AUTOMATION AND ROBOTICS OPERATIONS LEVEL 4', 'industrial-automation-and-robotics-operations-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PIPING FABRICATION LEVEL 4', 'mechanical-piping-fabrication-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION MACHINE OPERATION LEVEL 4', 'mechanical-production-machine-operation-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTOR VEHICLE ELECTRICS LEVEL 4', 'motor-vehicle-electrics-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTOR VEHICLE MECHANICS LEVEL 4', 'motor-vehicle-mechanics-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTORCYCLE MECHANICS LEVEL 4', 'motorcycle-mechanics-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SPRAY PAINTING LEVEL 4', 'spray-painting-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING LEVEL 4', 'welding-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTOR VEHICLE ELECTRICS LEVEL 3', 'motor-vehicle-electrics-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTOR VEHICLE MECHANICS LEVEL 3', 'motor-vehicle-mechanics-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTORCYCLE MECHANICS LEVEL 3', 'motorcycle-mechanics-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PANEL BEATING LEVEL 3', 'panel-beating-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING LEVEL 3', 'welding-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: AUTOBODY TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM VEHICLE FIBRE WORKS', 'perform-vehicle-fibre-works', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('WELD VEHICLE STRUCTURE I', 'weld-vehicle-structure-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM VEHICLE BODY SURFACE PREPARATION', 'perform-vehicle-body-surface-preparation', NULL::text),
  ('PERFORM VEHICLE BODY VALETING', 'perform-vehicle-body-valeting', NULL::text),
  ('PERFORM VEHICLE SPRAY PAINTING', 'perform-vehicle-spray-painting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL VEHICLE GLASS COMPONENTS', 'install-vehicle-glass-components', NULL::text),
  ('PERFORM GLAZING FINISHING PROCESSES', 'perform-glazing-finishing-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRONICS AND CONTROL PRINCIPLES', 'apply-electronics-and-control-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN GLASS COMPONENTS', 'maintain-glass-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text),
  ('WELD VEHICLE STRUCTURE II', 'weld-vehicle-structure-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('DESIGN VEHICLE BODY', 'design-vehicle-body', NULL::text),
  ('TRIM VEHICLE BODY', 'trim-vehicle-body', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS', 'apply-thermodynamics-and-fluid-mechanics', NULL::text),
  ('ASSEMBLE VEHICLE BODY PARTS', 'assemble-vehicle-body-parts', NULL::text),
  ('FABRICATE VEHICLE STRUCTURE', 'fabricate-vehicle-structure', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE ENGINEERING TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN VEHICLE BRAKING SYSTEM', 'maintain-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE PETROL ENGINE', 'maintain-vehicle-petrol-engine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN VEHICLE DIESEL ENGINE', 'maintain-vehicle-diesel-engine', NULL::text),
  ('MAINTAIN VEHICLE SUSPENSION AND STEERING SYSTEM', 'maintain-vehicle-suspension-and-steering-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MAINTAIN AUTOMOTIVE ELECTRICAL SYSTEMS', 'maintain-automotive-electrical-systems', NULL::text),
  ('MAINTAIN VEHICLE FUEL SYSTEM', 'maintain-vehicle-fuel-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN VEHICLE TRANSMISSION SYSTEM', 'maintain-vehicle-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('MAINTAIN HYBRID AND ELECTRIC VEHICLE', 'maintain-hybrid-and-electric-vehicle', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('MAINTAIN VEHICLE SAFETY AND SECURITY SYSTEM', 'maintain-vehicle-safety-and-security-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS', 'apply-thermodynamics-and-fluid-mechanics', NULL::text),
  ('MAINTAIN VEHICLE COMFORT SYSTEM', 'maintain-vehicle-comfort-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: CONSTRUCTION PLANT TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT ENGINES', 'maintain-construction-plant-engines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT HYDRAULIC SYSTEM', 'maintain-construction-plant-hydraulic-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT BRAKE SYSTEM', 'maintain-construction-plant-brake-system', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT TRANSMISSION SYSTEM', 'maintain-construction-plant-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT STEERING AND SUSPENSION SYSTEMS', 'maintain-construction-plant-steering-and-suspension-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS', 'apply-thermodynamics-and-fluid-mechanics', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT ATTACHMENTS', 'maintain-construction-plant-attachments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('MAINTAIN CONSTRUCTION PLANT UNDERCARRIAGE', 'maintain-construction-plant-undercarriage', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY ELECTRONICS AND CONTROL PRINCIPLES', 'apply-electronics-and-control-principles', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT ELECTRICAL SYSTEMS', 'maintain-construction-plant-electrical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL AUTOMATION AND ROBOTICS TECHNOLOGY LEVEL 6 (8 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN PRODUCT QUALITY', 'maintain-product-quality', NULL::text),
  ('OPERATE INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'operate-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'maintain-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('INSTALL AND MAINTAIN INDUSTRIAL AUTOMATION ELECTRICAL SYSTEMS', 'install-and-maintain-industrial-automation-electrical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('INSTALL AND MAINTAIN PNEUMATIC SYSTEMS', 'install-and-maintain-pneumatic-systems', NULL::text),
  ('INSTALL AND MAINTAIN STAND-ALONE CONTROLLED SYSTEMS', 'install-and-maintain-stand-alone-controlled-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL AND MAINTAIN HYDRAULIC SYSTEMS', 'install-and-maintain-hydraulic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('INSTALL AND MAINTAIN ELECTRICAL DRIVES', 'install-and-maintain-electrical-drives', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('INSTALL AND MAINTAIN PROGRAMMABLE LOGIC CONTROLLERS', 'install-and-maintain-programmable-logic-controllers', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 8: Module 8
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 8, 'Module 8'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 8
JOIN (VALUES
  ('INSTALL AND MAINTAIN DISTRIBUTED CONTROL SYSTEMS', 'install-and-maintain-distributed-control-systems', NULL::text),
  ('INSTALL AND MAINTAIN INDUSTRIAL ROBOTIC SYSTEMS', 'install-and-maintain-industrial-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PLANT TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('INSTALL MECHANICAL PUMPS AND COMPRESSORS', 'install-mechanical-pumps-and-compressors', NULL::text),
  ('MAINTAIN MECHANICAL PUMPS AND COMPRESSORS', 'maintain-mechanical-pumps-and-compressors', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEMS', 'install-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('INSTALL MATERIAL HANDLING SYSTEM', 'install-material-handling-system', NULL::text),
  ('MAINTAIN MATERIAL HANDLING SYSTEMS', 'maintain-material-handling-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('INSTALL REFRIGERATION AND AIR CONDITIONING SYSTEM', 'install-refrigeration-and-air-conditioning-system', NULL::text),
  ('MAINTAIN REFRIGERATION AND AIR CONDITIONING SYSTEMS', 'maintain-refrigeration-and-air-conditioning-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('INSTALL STEAM SYSTEM', 'install-steam-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('MAINTAIN BOILER AND STEAM SYSTEM', 'maintain-boiler-and-steam-system', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY ELECTRONICS AND CONTROL PRINCIPLES', 'apply-electronics-and-control-principles', NULL::text),
  ('DESIGN MECHANICAL PLANT SYSTEM', 'design-mechanical-plant-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('JOIN PARTS BY WELDING', 'join-parts-by-welding', NULL::text),
  ('PERFORM GENERAL FITTING OPERATIONS', 'perform-general-fitting-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM LATHE OPERATIONS', 'perform-lathe-operations', NULL::text),
  ('PERFORM MILLING OPERATIONS', 'perform-milling-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATERIAL SCIENCE AND METALLURGY', 'apply-material-science-and-metallurgy', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('PERFORM GRINDING OPERATIONS', 'perform-grinding-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMPUTER AIDED DRAWING', 'apply-computer-aided-drawing', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS PRINCIPLES', 'apply-thermodynamics-and-fluid-mechanics-principles', NULL::text),
  ('PERFORM FORGING WORKS', 'perform-forging-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY CONTROL SYSTEMS', 'apply-control-systems', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('OPERATE CNC MILLING MACHINE', 'operate-cnc-milling-machine', NULL::text),
  ('PERFORM FOUNDRY WORKS', 'perform-foundry-works', NULL::text),
  ('PRODUCE PARTS BY CNC LATHE', 'produce-parts-by-cnc-lathe', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOBODY TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM VEHICLE FIBRE WORKS', 'perform-vehicle-fibre-works', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('WELD VEHICLE STRUCTURE I', 'weld-vehicle-structure-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM VEHICLE BODY SURFACE PREPARATION', 'perform-vehicle-body-surface-preparation', NULL::text),
  ('PERFORM VEHICLE BODY VALETING', 'perform-vehicle-body-valeting', NULL::text),
  ('PERFORM VEHICLE SPRAY PAINTING', 'perform-vehicle-spray-painting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL VEHICLE GLASS COMPONENTS', 'install-vehicle-glass-components', NULL::text),
  ('PERFORM GLAZING FINISHING PROCESSES', 'perform-glazing-finishing-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN GLASS COMPONENTS', 'maintain-glass-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE ENGINEERING TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN VEHICLE BRAKING SYSTEM', 'maintain-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE PETROL ENGINE', 'maintain-vehicle-petrol-engine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN VEHICLE DIESEL ENGINE', 'maintain-vehicle-diesel-engine', NULL::text),
  ('MAINTAIN VEHICLE SUSPENSION AND STEERING SYSTEM', 'maintain-vehicle-suspension-and-steering-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MAINTAIN AUTOMOTIVE ELECTRICAL SYSTEMS', 'maintain-automotive-electrical-systems', NULL::text),
  ('MAINTAIN VEHICLE FUEL SYSTEM', 'maintain-vehicle-fuel-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN VEHICLE TRANSMISSION SYSTEM', 'maintain-vehicle-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: CONSTRUCTION PLANT TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT ENGINES', 'maintain-construction-plant-engines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT HYDRAULIC SYSTEM', 'maintain-construction-plant-hydraulic-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT BRAKE SYSTEM', 'maintain-construction-plant-brake-system', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT TRANSMISSION SYSTEM', 'maintain-construction-plant-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT STEERING AND SUSPENSION SYSTEMS', 'maintain-construction-plant-steering-and-suspension-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL AUTOMATION AND ROBOTICS TECHNOLOGY LEVEL 5 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN PRODUCT QUALITY', 'maintain-product-quality', NULL::text),
  ('OPERATE INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'operate-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'maintain-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('INSTALL AND MAINTAIN INDUSTRIAL AUTOMATION ELECTRICAL SYSTEMS', 'install-and-maintain-industrial-automation-electrical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('INSTALL AND MAINTAIN PNEUMATIC SYSTEMS', 'install-and-maintain-pneumatic-systems', NULL::text),
  ('INSTALL AND MAINTAIN STAND-ALONE CONTROLLED SYSTEMS', 'install-and-maintain-stand-alone-controlled-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL AND MAINTAIN HYDRAULIC SYSTEMS', 'install-and-maintain-hydraulic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PLANT TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('INSTALL MECHANICAL PUMPS AND COMPRESSORS', 'install-mechanical-pumps-and-compressors', NULL::text),
  ('MAINTAIN MECHANICAL PUMPS AND COMPRESSORS', 'maintain-mechanical-pumps-and-compressors', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEMS', 'install-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('INSTALL MATERIAL HANDLING SYSTEM', 'install-material-handling-system', NULL::text),
  ('MAINTAIN MATERIAL HANDLING SYSTEMS', 'maintain-material-handling-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('INSTALL REFRIGERATION AND AIR CONDITIONING SYSTEM', 'install-refrigeration-and-air-conditioning-system', NULL::text),
  ('MAINTAIN REFRIGERATION AND AIR CONDITIONING SYSTEMS', 'maintain-refrigeration-and-air-conditioning-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('JOIN PARTS BY WELDING', 'join-parts-by-welding', NULL::text),
  ('PERFORM GENERAL FITTING OPERATIONS', 'perform-general-fitting-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM LATHE OPERATIONS', 'perform-lathe-operations', NULL::text),
  ('PERFORM MILLING OPERATIONS', 'perform-milling-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATERIAL SCIENCE AND METALLURGY', 'apply-material-science-and-metallurgy', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTICAL AND ELECTRONICS PRINCIPLES', 'apply-electical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('PERFORM GRINDING OPERATIONS', 'perform-grinding-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: WELDING TECHNOLOGY LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM ARC WENDI PROCESSES I', 'perform-arc-wendi-processes-i', NULL::text),
  ('PERFORM BRAZING SOLDERING AND GAS WELDING', 'perform-brazing-soldering-and-gas-welding', NULL::text),
  ('PERFORM FABRICATION PROCESSES I', 'perform-fabrication-processes-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM METAL INERT GAS WELDING', 'perform-metal-inert-gas-welding', NULL::text),
  ('PERFORM TUNGSTEN INERT GAS WELDING', 'perform-tungsten-inert-gas-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY METALLURGY', 'apply-metallurgy', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM ARC WELDING PROCESSES II', 'perform-arc-welding-processes-ii', NULL::text),
  ('PERFORM FABRICATION PROCESSES II', 'perform-fabrication-processes-ii', NULL::text),
  ('PERFORM GAS METAL ARC WELDING OPERATIONS', 'perform-gas-metal-arc-welding-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: CNC LATHE OPERATIONS (PRODUCTION) LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-lathe-operations-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM CAD DESIGN', 'perform-cad-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-lathe-operations-production-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-lathe-operations-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE CNC LATHE COMPONENTS', 'produce-cnc-lathe-components', NULL::text),
  ('PROGRAM CNC LATHE MACHINE', 'program-cnc-lathe-machine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-lathe-operations-production-level-4';

-- ------------------------------------------------------------------------------
-- Course: CNC MILLING OPERATIONS (PRODUCTION) LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-milling-operations-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM CAD DESIGN', 'perform-cad-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-milling-operations-production-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-milling-operations-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE CNC MILLING COMPONENTS', 'produce-cnc-milling-components', NULL::text),
  ('PROGRAM CNC MILLING MACHINES', 'program-cnc-milling-machines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-milling-operations-production-level-4';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL AUTOMATION AND ROBOTICS OPERATIONS LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-operations-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN PRODUCT QUALITY', 'maintain-product-quality', NULL::text),
  ('OPERATE INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'operate-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-operations-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-operations-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRY TRAINING', 'industry-training', NULL::text),
  ('MAINTAIN INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'maintain-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-operations-level-4';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PIPING FABRICATION LEVEL 4 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-piping-fabrication-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-piping-fabrication-level-4';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION MACHINE OPERATION LEVEL 4 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-machine-operation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-machine-operation-level-4';

-- ------------------------------------------------------------------------------
-- Course: MOTOR VEHICLE ELECTRICS LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN VEHICLE CHARGING SYSTEM', 'maintain-vehicle-charging-system', NULL::text),
  ('MAINTAIN VEHICLE LIGHTING SYSTEM', 'maintain-vehicle-lighting-system', NULL::text),
  ('SERVICE VEHICLE STARTING SYSTEMS', 'service-vehicle-starting-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DIAGNOSE CAR ON BOARD SYSTEM', 'diagnose-car-on-board-system', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN VEHICLE ENGINE', 'maintain-vehicle-engine', NULL::text),
  ('SERVICE VEHICLE IGNITION SYSTEMS', 'service-vehicle-ignition-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-4';

-- ------------------------------------------------------------------------------
-- Course: MOTOR VEHICLE MECHANICS LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN VEHICLE BRAKING SYSTEM', 'maintain-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE PETROL ENGINE', 'maintain-vehicle-petrol-engine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN VEHICLE DIESEL ENGINE', 'maintain-vehicle-diesel-engine', NULL::text),
  ('MAINTAIN VEHICLE SUSPENSION AND STEERING SYSTEM', 'maintain-vehicle-suspension-and-steering-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-4';

-- ------------------------------------------------------------------------------
-- Course: MOTORCYCLE MECHANICS LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN MOTORCYCLE ENGINE', 'maintain-motorcycle-engine', NULL::text),
  ('MAINTAIN MOTORCYCLE FRAME', 'maintain-motorcycle-frame', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN ELECTRIC MOTORCYCLE POWER TRAIN', 'maintain-electric-motorcycle-power-train', NULL::text),
  ('MAINTAIN MOTORCYCLE BODY', 'maintain-motorcycle-body', NULL::text),
  ('MAINTAIN MOTORCYCLE ELECTRICAL SYSTEM', 'maintain-motorcycle-electrical-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-4';

-- ------------------------------------------------------------------------------
-- Course: SPRAY PAINTING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'spray-painting-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM VEHICLE FIBRE WORKS', 'perform-vehicle-fibre-works', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('WELD VEHICLE STRUCTURE', 'weld-vehicle-structure', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'spray-painting-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'spray-painting-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM VEHICLE BODY SURFACE PREPARATION', 'perform-vehicle-body-surface-preparation', NULL::text),
  ('PERFORM VEHICLE BODY VALETING', 'perform-vehicle-body-valeting', NULL::text),
  ('PERFORM VEHICLE SPRAY PAINTING', 'perform-vehicle-spray-painting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'spray-painting-level-4';

-- ------------------------------------------------------------------------------
-- Course: WELDING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM ARC WELDING PROCESSES I', 'perform-arc-welding-processes-i', NULL::text),
  ('PERFORM BRAZING', 'perform-brazing', NULL::text),
  ('PERFORM FABRICATION PROCESSES I', 'perform-fabrication-processes-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM METAL INERT GAS WELDING', 'perform-metal-inert-gas-welding', NULL::text),
  ('PERFORM TUNGSTEN INERT GAS WELDING', 'perform-tungsten-inert-gas-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';

-- ------------------------------------------------------------------------------
-- Course: MOTOR VEHICLE ELECTRICS LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN VEHICLE CHARGING SYSTEM', 'maintain-vehicle-charging-system', NULL::text),
  ('MAINTAIN VEHICLE LIGHTING SYSTEM', 'maintain-vehicle-lighting-system', NULL::text),
  ('SERVICE VEHICLE STARTING SYSTEMS', 'service-vehicle-starting-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-3';

-- ------------------------------------------------------------------------------
-- Course: MOTOR VEHICLE MECHANICS LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('MAINTAIN VEHICLE BRAKING SYSTEM', 'maintain-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE PETROL ENGINE', 'maintain-vehicle-petrol-engine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-3';

-- ------------------------------------------------------------------------------
-- Course: MOTORCYCLE MECHANICS LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN MOTORCYCLE ENGINE', 'maintain-motorcycle-engine', NULL::text),
  ('MAINTAIN MOTORCYCLE FRAME', 'maintain-motorcycle-frame', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-3';

-- ------------------------------------------------------------------------------
-- Course: PANEL BEATING LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'panel-beating-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM VEHICLE FIBRE WORKS', 'perform-vehicle-fibre-works', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('WELD VEHICLE STRUCTURE', 'weld-vehicle-structure', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'panel-beating-level-3';

-- ------------------------------------------------------------------------------
-- Course: WELDING LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM ARC WELDING PROCESSES I', 'perform-arc-welding-processes-i', NULL::text),
  ('PERFORM FABRICATION PROCESSES I', 'perform-fabrication-processes-i', NULL::text),
  ('PERFORM GAS WELDING', 'perform-gas-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-3';


-- ==============================================================================
-- SEED SCRIPT FOR: SOCIAL WORK DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 6 | Total Units: 82
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department: SOCIAL WORK DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'SOCIAL WORK DEPARTMENT', 'social-work-department', 'Accredited TVET CDACC Social Work and Community Development modular courses in Social Work, Child Protection, and Professional Counselling.', 11
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'social-work-department'
);

-- 4. Insert Courses under SOCIAL WORK DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CHILD PROTECTION LEVEL 6', 'child-protection-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COUNSELLING LEVEL 6', 'counselling-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOCIAL WORK LEVEL 6', 'social-work-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CHILD PROTECTION LEVEL 5', 'child-protection-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COUNSELING LEVEL 5', 'counseling-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'social-work-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOCIAL WORK LEVEL 5', 'social-work-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'social-work-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: CHILD PROTECTION LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('CONDUCT CHILD PROTECTION INTERVENTIONS', 'conduct-child-protection-interventions', NULL::text),
  ('PROVIDE PSYCHOSOCIAL SUPPORT', 'provide-psychosocial-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CARRY OUT CHILD RIGHTS ADVOCACY', 'carry-out-child-rights-advocacy', NULL::text),
  ('COORDINATE CHILD WELFARE PROGRAMS', 'coordinate-child-welfare-programs', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT CHILD CASE MANAGEMENT', 'conduct-child-case-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT CHILD REINTEGRATION', 'conduct-child-reintegration', NULL::text),
  ('CONDUCT SOCIAL WORK RESEARCH', 'conduct-social-work-research', NULL::text),
  ('COORDINATE CHILD REHABILITATION PROGRAMS', 'coordinate-child-rehabilitation-programs', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CARRY OUT RESOURCE MOBILIZATION', 'carry-out-resource-mobilization', NULL::text),
  ('CONDUCT CHILD EMERGENCY PROGRAMMES', 'conduct-child-emergency-programmes', NULL::text),
  ('MANAGE CHILD WELFARE SERVICES', 'manage-child-welfare-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-6';

-- ------------------------------------------------------------------------------
-- Course: COUNSELLING LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ADMINISTER BASIC COUNSELLING SERVICES', 'administer-basic-counselling-services', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PROVIDE COMMUNITY COUNSELLING', 'provide-community-counselling', NULL::text),
  ('PROVIDE PSYCHOLOGICAL FIRST AID (PFA) SERVICES', 'provide-psychological-first-aid-pfa-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('EXECUTE COUNSELORS'' ADMINISTRATIVE DUTIES', 'execute-counselors-administrative-duties', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT CLIENT ASSESSMENT', 'conduct-client-assessment', NULL::text),
  ('PROVIDE CAREER GUIDANCE AND COUNSELLING', 'provide-career-guidance-and-counselling', NULL::text),
  ('PROVIDE SPECIAL NEEDS AND DISABILITY COUNSELLING', 'provide-special-needs-and-disability-counselling', NULL::text),
  ('PROVIDE WORKPLACE COUNSELLING', 'provide-workplace-counselling', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('PROVIDE ADDICTION COUNSELLING', 'provide-addiction-counselling', NULL::text),
  ('PROVIDE CHILD AND ADOLESCENT COUNSELLING', 'provide-child-and-adolescent-counselling', NULL::text),
  ('PROVIDE LOSS GRIEF AND BEREAVEMENT COUNSELLING', 'provide-loss-grief-and-bereavement-counselling', NULL::text),
  ('PROVIDE MARRIAGE AND FAMILY COUNSELLING', 'provide-marriage-and-family-counselling', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('CONDUCT RESEARCH IN COUNSELLING', 'conduct-research-in-counselling', NULL::text),
  ('MANAGE COUNSELLING SERVICES', 'manage-counselling-services', NULL::text),
  ('PROVIDE CRISIS AND TRAUMA COUNSELLING', 'provide-crisis-and-trauma-counselling', NULL::text),
  ('PROVIDE MENTAL ILLNESSES COUNSELLING', 'provide-mental-illnesses-counselling', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'counselling-level-6';

-- ------------------------------------------------------------------------------
-- Course: SOCIAL WORK LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('CONDUCT CHILD WELFARE PROGRAMMES', 'conduct-child-welfare-programmes', NULL::text),
  ('CONDUCT HOME BASED CARE', 'conduct-home-based-care', NULL::text),
  ('MANAGE COMMUNITY-BASED GROUPS', 'manage-community-based-groups', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CONDUCT COMMUNITY EMPOWERMENT', 'conduct-community-empowerment', NULL::text),
  ('CONDUCT SOCIAL WORK CASE MANAGEMENT', 'conduct-social-work-case-management', NULL::text),
  ('PROVIDE PSYCHO-SOCIAL SUPPORT', 'provide-psycho-social-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CARRY OUT ADVOCACY AND LOBBYING', 'carry-out-advocacy-and-lobbying', NULL::text),
  ('COORDINATE DISASTER MANAGEMENT', 'coordinate-disaster-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CARRY OUT RESOURCE MOBILIZATION', 'carry-out-resource-mobilization', NULL::text),
  ('COORDINATE REHABILITATION AND RE-INTEGRATION PROGRAMMES', 'coordinate-rehabilitation-and-re-integration-programmes', NULL::text),
  ('MANAGE SOCIAL WORK SERVICES', 'manage-social-work-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CONDUCT SOCIAL POLICY ADMINISTRATION', 'conduct-social-policy-administration', NULL::text),
  ('CONDUCT SOCIAL RESEARCH WORK', 'conduct-social-research-work', NULL::text),
  ('MANAGE COMMUNITY PROJECTS', 'manage-community-projects', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-6';

-- ------------------------------------------------------------------------------
-- Course: CHILD PROTECTION LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('IMPLEMENT CHILD PROTECTION STRATEGIES', 'implement-child-protection-strategies', NULL::text),
  ('PROVIDE PSYCHO-SOCIAL SUPPORT', 'provide-psycho-social-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('ENFORCE CHILD RIGHTS POLICIES', 'enforce-child-rights-policies', NULL::text),
  ('MANAGE CHILD WELFARE PROGRAMMES', 'manage-child-welfare-programmes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CARRY OUT CASE MANAGEMENT', 'carry-out-case-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'child-protection-level-5';

-- ------------------------------------------------------------------------------
-- Course: COUNSELING LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'counseling-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ADMINISTER BASIC COUNSELLING SERVICES', 'administer-basic-counselling-services', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'counseling-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'counseling-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PROVIDE COMMUNITY COUNSELLING', 'provide-community-counselling', NULL::text),
  ('PROVIDE PSYCHOLOGICAL FIRST AID (PFA) SERVICES', 'provide-psychological-first-aid-pfa-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'counseling-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'counseling-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM ADMINISTRATIVE DUTIES FOR COUNSELLING SERVICES', 'perform-administrative-duties-for-counselling-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'counseling-level-5';

-- ------------------------------------------------------------------------------
-- Course: SOCIAL WORK LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('CONDUCT CHILD WELFARE PROGRAMMES', 'conduct-child-welfare-programmes', NULL::text),
  ('CONDUCT HOME BASED CARE', 'conduct-home-based-care', NULL::text),
  ('MANAGE COMMUNITY-BASED GROUPS', 'manage-community-based-groups', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CONDUCT COMMUNITY EMPOWERMENT', 'conduct-community-empowerment', NULL::text),
  ('CONDUCT SOCIAL WORK CASE MANAGEMENT', 'conduct-social-work-case-management', NULL::text),
  ('PROVIDE PSYCHO-SOCIAL SUPPORT', 'provide-psycho-social-support', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CARRY OUT ADVOCACY AND LOBBYING ACTIVITIES', 'carry-out-advocacy-and-lobbying-activities', NULL::text),
  ('COORDINATE DISASTER MANAGEMENT PROGRAMMES', 'coordinate-disaster-management-programmes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work-department' AND c.slug = 'social-work-level-5';


COMMIT;

SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
FROM departments d
JOIN courses c ON c.department_id = d.id
LEFT JOIN units u ON u.course_id = c.id
WHERE d.sort_order >= 5
GROUP BY d.name ORDER BY d.name;