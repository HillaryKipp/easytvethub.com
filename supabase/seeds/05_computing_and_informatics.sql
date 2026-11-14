-- ==============================================================================
-- SEED SCRIPT FOR: COMPUTING AND INFORMATICS DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 9 | Total Units: 112
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

COMMIT;
-- Verification Query: Check courses and units inserted for COMPUTING AND INFORMATICS DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'computing-and-informatics-department'
-- GROUP BY d.name;