-- ==============================================================================
-- SEED SCRIPT FOR: BUSINESS STUDIES (KNEC COURSES)
-- Total Courses: 13 | Total Units: 259
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

-- 2. Upsert Department under KNEC: BUSINESS STUDIES
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUSINESS STUDIES', 'business-studies', 'KNEC Diploma and Certificate past examination papers and modules in Business Management, HRM, Supply Chain, Sales & Marketing, Project Management, and Secretarial Studies.', 5
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies'
);

-- 4. Insert KNEC Courses under BUSINESS STUDIES
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN BUSINESS MANAGEMENT', 'diploma-in-business-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN HUMAN RESOURCE MANAGEMENT', 'diploma-in-human-resource-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SUPPLY CHAIN MANAGEMENT', 'diploma-in-supply-chain-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SALES AND MARKETING', 'diploma-in-sales-and-marketing', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SECRETARIAL STUDIES', 'diploma-in-secretarial-studies', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN PROJECT MANAGEMENT', 'diploma-in-project-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUSINESS EDUCATION SINGLE AND GROUP CERTIFICATE EXAMINATIONS', 'business-education-single-and-group-certificate-examinations', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN BUSINESS MANAGEMENT', 'certificate-in-business-management', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN HUMAN RESOURCE MANAGEMENT', 'certificate-in-human-resource-management', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN PROJECT MANAGEMENT', 'certificate-in-project-management', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN SUPPLY CHAIN MANAGEMENT', 'certificate-in-supply-chain-management', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN SALES AND MARKETING', 'certificate-in-sales-and-marketing', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CRAFT CERTIFICATE IN SECRETARIAL STUDIES', 'craft-certificate-in-secretarial-studies', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN BUSINESS MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('ICT PRACTICAL', 'ict-practical', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('HUMAN AND PUBLIC RELATIONS', 'human-and-public-relations', NULL::text),
  ('SALES AND MARKETING', 'sales-and-marketing', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(ICT)', 'information-communication-technology-ict', NULL::text),
  ('OCCUPATIONAL SAFETY & PRECAUTIONS', 'occupational-safety-and-precautions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OFFICE ADMINISTRATION AND MANAGEMENT', 'office-administration-and-management', NULL::text),
  ('MARKETING MANAGEMENT', 'marketing-management', NULL::text),
  ('SUPPLY AND TRANSPORT MANAGEMENT', 'supply-and-transport-management', NULL::text),
  ('QUANTITATIVE TECHNIQUES', 'quantitative-techniques', NULL::text),
  ('COMMERCIAL AND ADMINISTRATIVE LAW', 'commercial-and-administrative-law', NULL::text),
  ('COST ACCOUNTING', 'cost-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';

-- Module 3: Module III (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('ORGANIZATION THEORY AND BEHAVIOR', 'organization-theory-and-behavior', NULL::text),
  ('LABOR AND INDUSTRIAL RELATIONS', 'labor-and-industrial-relations', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('HUMAN RESOURCE MANAGEMENT', 'human-resource-management', NULL::text),
  ('MANAGERIAL ACCOUNTING', 'managerial-accounting', NULL::text),
  ('FINANCIAL MANAGEMENT', 'financial-management', NULL::text),
  ('RESEARCH METHODS (PROJECT)', 'research-methods-project', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN HUMAN RESOURCE MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('COMMUNICATIONS', 'communications', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ICT', 'ict', NULL::text),
  ('ICT PRACTICALS', 'ict-practicals', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('FOUNDATIONS OF HUMAN RESOURCE MANAGEMENT', 'foundations-of-human-resource-management', NULL::text),
  ('OFFICE ADMINISTRATION AND MANAGEMENT', 'office-administration-and-management', NULL::text),
  ('FUNDAMENTALS OF HUMAN RESOURCE MANAGEMENT', 'fundamentals-of-human-resource-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';

-- Module 2: Module II (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('QUANTITATIVE METHODS', 'quantitative-methods', NULL::text),
  ('QUANTITATIVE TECHNIQUES', 'quantitative-techniques', NULL::text),
  ('LABOUR AND INDUSTRIAL LAW', 'labour-and-industrial-law', NULL::text),
  ('LABOUR ECONOMICS', 'labour-economics', NULL::text),
  ('HUMAN RESOURCE DEVELOPMENT', 'human-resource-development', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('PUBLIC RELATIONS', 'public-relations', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MARKETING', 'principles-and-practice-of-marketing', NULL::text),
  ('THEORY AND PRACTICE OF HUMAN RESOURCE MANAGEMENT', 'theory-and-practice-of-human-resource-management', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('OFFICE ADMIN & MANAGEMENT II', 'office-admin-and-management-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';

-- Module 3: Module III (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('ACCOUNTING AND CONTROL', 'accounting-and-control', NULL::text),
  ('EMPLOYEE RELATIONS', 'employee-relations', NULL::text),
  ('MANAGERIAL ACCOUNTING', 'managerial-accounting', NULL::text),
  ('ORGANIZATIONAL THEORY & BEHAVIOUR', 'organizational-theory-and-behaviour', NULL::text),
  ('REWARD MANAGEMENT', 'reward-management', NULL::text),
  ('FINANCIAL MANAGEMENT', 'financial-management', NULL::text),
  ('LABOUR AND INDUSTRIAL RELATIONS', 'labour-and-industrial-relations', NULL::text),
  ('ORGANIZATION BEHAVIOUR', 'organization-behaviour', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SUPPLY CHAIN MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (14 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('WAREHOUSING AND OPERATIONS AND STOCK CONTROL', 'warehousing-and-operations-and-stock-control', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(ICT)', 'information-communication-technology-ict', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('ELEMENTS OF LAW', 'elements-of-law', NULL::text),
  ('SUPPLY CHAIN MANAGEMENT AND PURCHASING PRINCIPLES', 'supply-chain-management-and-purchasing-principles', NULL::text),
  ('ICT PRACTICALS', 'ict-practicals', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PURCHASING MANAGEMENT', 'purchasing-management', NULL::text),
  ('PUBLIC PROCUREMENT AND FINANCE', 'public-procurement-and-finance', NULL::text),
  ('SUPPLY MANAGEMENT', 'supply-management', NULL::text),
  ('QUANTITATIVE METHODS', 'quantitative-methods', NULL::text),
  ('QUANTITATIVE TECHNIQUES', 'quantitative-techniques', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MARKETING', 'principles-and-practice-of-marketing', NULL::text),
  ('COST ACCOUNTING', 'cost-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';

-- Module 3: Module III (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PURCHASING AND SUPPLIES STRATEGY', 'purchasing-and-supplies-strategy', NULL::text),
  ('OPERATIONS MANAGEMENT', 'operations-management', NULL::text),
  ('PRINCIPLES AND PRACTICES OF MANAGEMENT', 'principles-and-practices-of-management', NULL::text),
  ('INTERNATIONAL PURCHASING', 'international-purchasing', NULL::text),
  ('PROJECT AND CONTRACT MANAGEMENT', 'project-and-contract-management', NULL::text),
  ('MANAGERIAL ACCOUNTING', 'managerial-accounting', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SALES AND MARKETING [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATIONS', 'communications', NULL::text),
  ('PRINCIPLES AND PRACTICE OF SELLING', 'principles-and-practice-of-selling', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MARKETING', 'principles-and-practice-of-marketing', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY(ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('ICT PRACTICAL', 'ict-practical', NULL::text),
  ('OCCUPATIONAL SAFETY & PRECAUTIONS', 'occupational-safety-and-precautions', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('BUSINESS COMMUNICATION', 'business-communication', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('SALES MANAGEMENT', 'sales-management', NULL::text),
  ('LEGAL ASPECTS IN SALES AND MARKETING', 'legal-aspects-in-sales-and-marketing', NULL::text),
  ('QUANTITATIVE METHODS', 'quantitative-methods', NULL::text),
  ('PUBLIC RELATIONS', 'public-relations', NULL::text),
  ('MARKETING MANAGEMENT', 'marketing-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';

-- Module 3: Module III (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INTERNATIONAL MARKETING', 'international-marketing', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('FINANCIAL ASPECTS OF MARKETING', 'financial-aspects-of-marketing', NULL::text),
  ('STRATEGIC PLANNING IN SALES AND MARKETING', 'strategic-planning-in-sales-and-marketing', NULL::text),
  ('MARKETING RESEARCH', 'marketing-research', NULL::text),
  ('MARKETING PLANNING', 'marketing-planning', NULL::text),
  ('PROJECT', 'project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SECRETARIAL STUDIES [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('SECRETARIAL DUTIES', 'secretarial-duties', NULL::text),
  ('COMPUTERIZED DOCUMENT PROCESSING I', 'computerized-document-processing-i', NULL::text),
  ('COMMUNICATION I', 'communication-i', NULL::text),
  ('SHORTHAND', 'shorthand', NULL::text),
  ('ECONOMICS', 'economics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';

-- Module 2: Module II (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMMUNICATION II', 'communication-ii', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY II (THEORY)', 'information-communication-technology-ii-theory', NULL::text),
  ('SHORTHAND', 'shorthand-module-2', 'shorthand')
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';

-- Module 3: Module III (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INFORMATION COMMUNICATION TECHNOLOGY III (THEORY)', 'information-communication-technology-iii-theory', NULL::text),
  ('SHORTHAND', 'shorthand-module-3', 'shorthand'),
  ('COMPUTERIZED DOCUMENT PROCESSING III', 'computerized-document-processing-iii', NULL::text),
  ('STATISTICS', 'statistics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN PROJECT MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FUNDAMENTALS OF PROJECT MANAGEMENT', 'fundamentals-of-project-management', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (THEORY)', 'information-and-communication-technology-theory', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-and-communication-technology-practical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROJECT MONITORING AND EVALUATION', 'project-monitoring-and-evaluation', NULL::text),
  ('PROJECT PROCUREMENT AND MANAGEMENT', 'project-procurement-and-management', NULL::text),
  ('PROJECT QUALITY MANAGEMENT', 'project-quality-management', NULL::text),
  ('PROJECT MANAGEMENT INFORMATION SYSTEMS (THEORY)', 'project-management-information-systems-theory', NULL::text),
  ('QUANTITATIVE TECHNIQUES', 'quantitative-techniques', NULL::text),
  ('COST ACCOUNTING', 'cost-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';

-- Module 3: Module III (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('RISK MANAGEMENT IN PROJECTS', 'risk-management-in-projects', NULL::text),
  ('LEGAL ISSUES IN PROJECT MANAGEMENT', 'legal-issues-in-project-management', NULL::text),
  ('FUNDAMENTALS OF STRATEGIC MANAGEMENT', 'fundamentals-of-strategic-management', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';

-- ------------------------------------------------------------------------------
-- Course: BUSINESS EDUCATION SINGLE AND GROUP CERTIFICATE EXAMINATIONS [Level 5] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY I (THEORY)', 'information-communication-technology-i-theory', NULL::text),
  ('COMMERCE', 'commerce', NULL::text),
  ('FOUNDATIONS OF ACCOUNTING', 'foundations-of-accounting', NULL::text),
  ('SECRETARIAL DUTIES', 'secretarial-duties', NULL::text),
  ('SHORTHAND', 'shorthand', NULL::text),
  ('OFFICE PROCEDURES I', 'office-procedures-i', NULL::text),
  ('COMMUNICATION SKILLS I', 'communication-skills-i', NULL::text),
  ('COMPUTERIZED DOCUMENT PROCESSING I', 'computerized-document-processing-i', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';

-- Module 2: Module II (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMMUNICATION SKILLS II', 'communication-skills-ii', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY II (THEORY)', 'information-communication-technology-ii-theory', NULL::text),
  ('OFFICE PROCEDURES II', 'office-procedures-ii', NULL::text),
  ('PUBLIC PROCUREMENT AND FINANCE', 'public-procurement-and-finance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';

-- Module 3: Module III (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('SUPPLY AND TRANSPORT MANAGEMENT', 'supply-and-transport-management', NULL::text),
  ('MARKET RESEARCH', 'market-research', NULL::text),
  ('SHORTHAND', 'shorthand-module-3', 'shorthand'),
  ('INTERNATIONAL PURCHASING', 'international-purchasing', NULL::text),
  ('MANAGERIAL ACCOUNTING', 'managerial-accounting', NULL::text),
  ('OPERATIONS MANAGEMENT', 'operations-management', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('PROJECT AND CONTRACT MANAGEMENT', 'project-and-contract-management', NULL::text),
  ('PURCHASING AND SUPPLY STRATEGY', 'purchasing-and-supply-strategy', NULL::text),
  ('LABOUR AND INDUSTRIAL RELATIONS', 'labour-and-industrial-relations', NULL::text),
  ('ORGANIZATION THEORY AND BEHAVIOUR', 'organization-theory-and-behaviour', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN BUSINESS MANAGEMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BUSINESS CALCULATIONS AND STATISTICS', 'business-calculations-and-statistics', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY', 'information-and-communication-technology', NULL::text),
  ('COMMERCE', 'commerce', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-business-management';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('SALES AND MARKETING', 'sales-and-marketing', NULL::text),
  ('HUMAN AND PUBLIC RELATIONS', 'human-and-public-relations', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-business-management';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN HUMAN RESOURCE MANAGEMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('BUSINESS CALCULATIONS AND STATISTICS', 'business-calculations-and-statistics', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('OCCUPATIONAL SAFETY & PRECAUTIONS', 'occupational-safety-and-precautions', NULL::text),
  ('OFFICE ADMINISTRATION AND MANAGEMENT', 'office-administration-and-management', NULL::text),
  ('COMMERCE', 'commerce', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ELEMENTS OF HUMAN RESOURCE MANAGEMENT', 'elements-of-human-resource-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-human-resource-management';

-- Module 2: Module II (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('PRACTICE OF HUMAN RESOURCE MANAGEMENT', 'practice-of-human-resource-management', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('BOOK-KEEPING AND ACCOUNTS', 'book-keeping-and-accounts', NULL::text),
  ('ELEMENT OF LABOUR LAW AND INDUSTRIAL RELATIONS', 'element-of-labour-law-and-industrial-relations', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('HUMAN RESOURCE MANAGEMENT RECORDS', 'human-resource-management-records', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-human-resource-management';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN PROJECT MANAGEMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BUSINESS CALCULATIONS AND STATISTICS', 'business-calculations-and-statistics', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('FUNDAMENTALS OF PROJECT MANAGEMENT', 'fundamentals-of-project-management', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('OCCUPATIONAL SAFETY & PRECAUTIONS', 'occupational-safety-and-precautions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-project-management';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('PURCHASING AND SUPPLIES MANAGEMENT', 'purchasing-and-supplies-management', NULL::text),
  ('RESOURCE MOBILIZATION', 'resource-mobilization', NULL::text),
  ('PROJECT FINANCING', 'project-financing', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text),
  ('PRINCIPLES OF ACCOUNTING', 'principles-of-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-project-management';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN SUPPLY CHAIN MANAGEMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BUSINESS CALCULATIONS AND STATISTICS', 'business-calculations-and-statistics', NULL::text),
  ('WAREHOUSING OPERATION AND STOCK CONTROL', 'warehousing-operation-and-stock-control', NULL::text),
  ('COMMERCE', 'commerce', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-supply-chain-management';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('SUPPLY CHAIN MANAGEMENT AND PURCHASING PRINCIPLE', 'supply-chain-management-and-purchasing-principle', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-supply-chain-management';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN SALES AND MARKETING [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (14 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BOOK-KEEPING AND ACCOUNTS', 'book-keeping-and-accounts', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('BUSINESS MANAGEMENT AND ADMINISTRATION', 'business-management-and-administration', NULL::text),
  ('INTERNATIONAL BUSINESS COMMUNICATIONS', 'international-business-communications', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('CONSUMER BEHAVIOUR', 'consumer-behaviour', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('INTRODUCTION TO LAW', 'introduction-to-law', NULL::text),
  ('MARKETING COMMUNICATION', 'marketing-communication', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MARKETING', 'principles-and-practice-of-marketing', NULL::text),
  ('PRINCIPLES AND PRACTICE OF SELLING', 'principles-and-practice-of-selling', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-sales-and-marketing';

-- Module 2: Module II (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('SALES AND MARKETING', 'sales-and-marketing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-sales-and-marketing';

-- ------------------------------------------------------------------------------
-- Course: CRAFT CERTIFICATE IN SECRETARIAL STUDIES [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'craft-certificate-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATION AND REPORT WRITING', 'communication-and-report-writing', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY I (THEORY)', 'information-communication-technology-i-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY I (PRACTICAL)', 'information-communication-technology-i-practical', NULL::text),
  ('SECRETARIAL DUTIES', 'secretarial-duties', NULL::text),
  ('COMPUTERIZED DOCUMENT PROCESSING I', 'computerized-document-processing-i', NULL::text),
  ('SHORTHAND', 'shorthand', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'craft-certificate-in-secretarial-studies';

-- Module 2: Module II (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'craft-certificate-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('SHORTHAND', 'shorthand-module-2', 'shorthand'),
  ('COMMUNICATION SKILLS II', 'communication-skills-ii', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY II (THEORY)', 'information-communication-technology-ii-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY II (PRACTICAL)', 'information-communication-technology-ii-practical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'craft-certificate-in-secretarial-studies';

COMMIT;
-- Verification Query: Check courses and units inserted for BUSINESS STUDIES
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'business-studies'
-- GROUP BY d.name;