-- ==============================================================================
-- SEED SCRIPT FOR: BUSINESS STUDIES DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 20 | Total Units: 345
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

-- 2. Upsert Department: BUSINESS STUDIES DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUSINESS STUDIES DEPARTMENT', 'business-studies-department', 'Accredited TVET CDACC Business Studies modular courses in Accountancy, Banking & Finance, Business Management, Cooperative Management, Credit Management, Human Resource Management, Marketing, Office Administration, and Procurement.', 4
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department'
);

-- 4. Insert Courses under BUSINESS STUDIES DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ACCOUNTANCY LEVEL 6', 'accountancy-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BANKING AND FINANCE LEVEL 6', 'banking-and-finance-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUSINESS MANAGEMENT LEVEL 6', 'business-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COOPERATIVE MANAGEMENT LEVEL 6', 'cooperative-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CREDIT MANAGEMENT LEVEL 6', 'credit-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HUMAN RESOURCE MANAGEMENT LEVEL 6', 'human-resource-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MARKETING MANAGEMENT LEVEL 6', 'marketing-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'OFFICE ADMINISTRATION LEVEL 6', 'office-administration-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PROCUREMENT MANAGEMENT LEVEL 6', 'procurement-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PROJECT MANAGEMENT LEVEL 6', 'project-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ASSISTANT PROJECT MANAGER LEVEL 5', 'assistant-project-manager-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUSINESS MANAGEMENT LEVEL 5', 'business-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COOPERATIVE MANAGEMENT LEVEL 5', 'cooperative-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CREDIT MANAGEMENT LEVEL 5', 'credit-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HUMAN RESOURCE MANAGEMENT LEVEL 5', 'human-resource-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MARKETING MANAGEMENT LEVEL 5', 'marketing-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'OFFICE ADMINISTRATION LEVEL 5', 'office-administration-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PROCUREMENT MANAGEMENT LEVEL 5', 'procurement-management-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'OFFICE ASSISTANCE LEVEL 4', 'office-assistance-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'STORE KEEPING LEVEL 4', 'store-keeping-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'business-studies-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ACCOUNTANCY LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY ECONOMICS PRINCIPLES', 'apply-economics-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('DEMONSTRATE FUNDAMENTALS OF ACCOUNTING', 'demonstrate-fundamentals-of-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CARRY OUT FINANCIAL ACCOUNTING', 'carry-out-financial-accounting', NULL::text),
  ('DEMOSTRATE UNDERSTANDING OF INFORMATION COMMUNICATION TECHNOLOGY (ICT)', 'demostrate-understanding-of-information-communication-technology-ict', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('CARRY OUT BUSINESS MATHEMATICS AND STATISTICS', 'carry-out-business-mathematics-and-statistics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT PUBLIC FINANCE AND TAXATION', 'conduct-public-finance-and-taxation', NULL::text),
  ('CONDUCT QUANTITATIVE TECHNIQUES', 'conduct-quantitative-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CONDUCT FINANCIAL AUDITS', 'conduct-financial-audits', NULL::text),
  ('CONDUCT FINANCIAL MANAGEMENT', 'conduct-financial-management', NULL::text),
  ('CONDUCT MANAGEMENT ACCOUNTING', 'conduct-management-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'accountancy-level-6';

-- ------------------------------------------------------------------------------
-- Course: BANKING AND FINANCE LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MARKET BANK PRODUCTS', 'market-bank-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MANAGE CUSTOMER RELATIONSHIP', 'manage-customer-relationship', NULL::text),
  ('MANAGE ELECTRONIC BANKING', 'manage-electronic-banking', NULL::text),
  ('OFFER CUSTOMER SERVICE', 'offer-customer-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY FINANCIAL MANAGEMENT SKILLS', 'apply-financial-management-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('MANAGE BANK COMPLIANCE', 'manage-bank-compliance', NULL::text),
  ('PERFORM CREDIT ADMINISTRATION', 'perform-credit-administration', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT RESEARCH STUDY', 'conduct-research-study', NULL::text),
  ('OFFER TELLERING SERVICE', 'offer-tellering-service', NULL::text),
  ('PROCESS CREDIT APPLICATION', 'process-credit-application', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('ESTABLISH CREDIT COLLATERALIZATION', 'establish-credit-collateralization', NULL::text),
  ('MANAGE BACK OFFICE', 'manage-back-office', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'banking-and-finance-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUSINESS MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM SALES ACTIVITIES', 'perform-sales-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ECONOMICS SKILLS', 'apply-economics-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM PURCHASING SKILLS', 'perform-purchasing-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('PERFORM ADMINISTRATIVE ASSISTANT DUTIES', 'perform-administrative-assistant-duties', NULL::text),
  ('PERFORM STAFFING ACTIVITIES', 'perform-staffing-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT RESEARCH PROJECT', 'conduct-research-project', NULL::text),
  ('MANAGE MARKETING ACTIVITIES', 'manage-marketing-activities', NULL::text),
  ('PERFORM HUMAN RESOURCE ACTIVITIES', 'perform-human-resource-activities', NULL::text),
  ('PERFORM SUPPLY CHAIN ACTIVITIES', 'perform-supply-chain-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CARRY OUT ACCOUNTING OPERATIONS', 'carry-out-accounting-operations', NULL::text),
  ('DEVELOP ORGANIZATIONAL STRATEGIC PLAN', 'develop-organizational-strategic-plan', NULL::text),
  ('MANAGE BUSINESS RISKS', 'manage-business-risks', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: COOPERATIVE MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT COOPERATIVE MARKETING ACTIVITIES', 'conduct-cooperative-marketing-activities', NULL::text),
  ('PERFORM CUSTOMER CARE SERVICES', 'perform-customer-care-services', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM BASIC TELLER OPERATIONS', 'perform-basic-teller-operations', NULL::text),
  ('PERFORM COOPERATIVE STORES ACTIVITIES', 'perform-cooperative-stores-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE COOPERATIVE SOCIETY SECURITY MEASURES', 'manage-cooperative-society-security-measures', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('CONDUCT RESEARCH PROJECT', 'conduct-research-project', NULL::text),
  ('MANAGE CUSTOMER RELATIONS', 'manage-customer-relations', NULL::text),
  ('PERFORM COOPERATIVE ACCOUNTING OPERATIONS', 'perform-cooperative-accounting-operations', NULL::text),
  ('PERFORM HUMAN RESOURCE FUNCTIONS', 'perform-human-resource-functions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CARRY OUT COOPERATIVE BANKING OPERATIONS', 'carry-out-cooperative-banking-operations', NULL::text),
  ('CONDUCT CREDIT ADMINISTRATION', 'conduct-credit-administration', NULL::text),
  ('MANAGE COOPERATIVE MEMBER RECORDS', 'manage-cooperative-member-records', NULL::text),
  ('MANAGE CORPORATE SOCIAL RESPONSIBILITY', 'manage-corporate-social-responsibility', NULL::text),
  ('MARKET COOPERATIVE PRODUCTS AND SERVICES', 'market-cooperative-products-and-services', NULL::text),
  ('PERFORM COOPERATIVE SOCIETY STORES OPERATIONS', 'perform-cooperative-society-stores-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: CREDIT MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MARKET BANK PRODUCTS', 'market-bank-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CARRY OUT CUSTOMER ON-BOARDING', 'carry-out-customer-on-boarding', NULL::text),
  ('MAINTAIN CUSTOMER RELATIONSHIP', 'maintain-customer-relationship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY FINANCIAL MANAGEMENT SKILLS', 'apply-financial-management-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MONITOR LOAN REPAYMENT', 'monitor-loan-repayment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT RESEARCH STUDY', 'conduct-research-study', NULL::text),
  ('PROCESS BANK CREDIT APPLICATION', 'process-bank-credit-application', NULL::text),
  ('PROVIDE TELLERING SERVICE', 'provide-tellering-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('MANAGE CLIENT DEBT COLLECTION', 'manage-client-debt-collection', NULL::text),
  ('MANAGE CREDIT SECURITY', 'manage-credit-security', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: HUMAN RESOURCE MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CO-ORDINATE EMPLOYEE TRAINING AND DEVELOPMENT', 'co-ordinate-employee-training-and-development', NULL::text),
  ('CONDUCT EMPLOYEE RESOURCING', 'conduct-employee-resourcing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('COORDINATE EMPLOYEE PERFORMANCE MANAGEMENT', 'coordinate-employee-performance-management', NULL::text),
  ('MANAGE HUMAN RESOURCE RECORDS', 'manage-human-resource-records', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE EMPLOYEE RELATIONS', 'manage-employee-relations', NULL::text),
  ('UNDERTAKE EMPLOYEE SEPARATION', 'undertake-employee-separation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('MANAGE EMPLOYEE REWARDS', 'manage-employee-rewards', NULL::text),
  ('MANAGE ORGANIZATIONAL BEHAVIOUR', 'manage-organizational-behaviour', NULL::text),
  ('PERFORM HUMAN RESOURCE OPERATIONS', 'perform-human-resource-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('APPLY LABOUR LAWS', 'apply-labour-laws', NULL::text),
  ('CARRY OUT RESEARCH STUDY', 'carry-out-research-study', NULL::text),
  ('PROVIDE EMPLOYEE COUNSELLING', 'provide-employee-counselling', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: MARKETING MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT BRAND PROMOTION', 'conduct-brand-promotion', NULL::text),
  ('PERFORM TRADE ACTIVITIES', 'perform-trade-activities', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ECONOMIC SKILLS', 'apply-economic-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CONDUCT MARKETING COMMUNICATION ACTIVITIES', 'conduct-marketing-communication-activities', NULL::text),
  ('CUSTOMER EXPERIENCE', 'customer-experience', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('CONDUCT MARKET INNOVATIONS/RENOVATIONS', 'conduct-market-innovations-renovations', NULL::text),
  ('MANAGE DIGITAL MARKETING', 'manage-digital-marketing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CONDUCT RESEARCH PROJECT', 'conduct-research-project', NULL::text),
  ('DEVELOP BRAND STRATEGY', 'develop-brand-strategy', NULL::text),
  ('DEVELOP DISTRIBUTION CHANNELS', 'develop-distribution-channels', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CONDUCT MARKET ANALYSIS', 'conduct-market-analysis', NULL::text),
  ('CONDUCT PROMOTIONAL CAMPAIGN', 'conduct-promotional-campaign', NULL::text),
  ('DEVELOP MARKETING BUDGET', 'develop-marketing-budget', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: OFFICE ADMINISTRATION LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY SHORTHAND SKILLS I', 'apply-shorthand-skills-i', NULL::text),
  ('HANDLE CUSTOMER CARE DUTIES', 'handle-customer-care-duties', NULL::text),
  ('HANDLE OFFICE CORRESPONDENCE', 'handle-office-correspondence', NULL::text),
  ('HANDLE OFFICE ERRANDS', 'handle-office-errands', NULL::text),
  ('PROCESS OFFICE DOCUMENTS I', 'process-office-documents-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY SHORTHAND SKILLS II', 'apply-shorthand-skills-ii', NULL::text),
  ('COORDINATE OFFICE REPAIRS AND MAINTENANCE', 'coordinate-office-repairs-and-maintenance', NULL::text),
  ('MAINTAIN OFFICE PAPER RECORDS', 'maintain-office-paper-records', NULL::text),
  ('MANAGE TELEPHONE CALLS', 'manage-telephone-calls', NULL::text),
  ('PROCESS OFFICE DOCUMENTS II', 'process-office-documents-ii', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ICT SKILLS', 'apply-ict-skills', NULL::text),
  ('APPLY INTERMEDIATE SHORTHAND SKILLS', 'apply-intermediate-shorthand-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PROCESS INTERMEDIATE OFFICE DOCUMENTS PROCESSING', 'process-intermediate-office-documents-processing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMERCE PRINCIPLES', 'apply-commerce-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('COORDINATE OFFICIAL MEETINGS', 'coordinate-official-meetings', NULL::text),
  ('MANAGE OFFICE ADMINISTRATIVE DUTIES', 'manage-office-administrative-duties', NULL::text),
  ('MANAGE OFFICE SECURITY', 'manage-office-security', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ADVANCED SHORTHAND SKILLS 1', 'apply-advanced-shorthand-skills-1', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY MANAGEMENT PRINCIPLES', 'apply-management-principles', NULL::text),
  ('COORDINATE TRAVEL ARRANGEMENTS', 'coordinate-travel-arrangements', NULL::text),
  ('PROCESS ADVANCED OFFICE DOCUMENTS I', 'process-advanced-office-documents-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ADVANCED SHORTHAND SKILLS II', 'apply-advanced-shorthand-skills-ii', NULL::text),
  ('APPLY ECONOMICS PRINCIPLES', 'apply-economics-principles', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('CONDUCT RESEARCH PROJECT', 'conduct-research-project', NULL::text),
  ('PROCESS ADVANCED OFFICE DOCUMENTS II', 'process-advanced-office-documents-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-6';

-- ------------------------------------------------------------------------------
-- Course: PROCUREMENT MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CLASSIFY AND CODIFY PROCURED GOODS', 'classify-and-codify-procured-goods', NULL::text),
  ('MANAGE STORAGE OF GOODS', 'manage-storage-of-goods', NULL::text),
  ('RECEIVE DELIVERED GOODS', 'receive-delivered-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ISSUE AND DISPATCH GOODS', 'issue-and-dispatch-goods', NULL::text),
  ('MANAGE STORES SAFETY AND SECURITY', 'manage-stores-safety-and-security', NULL::text),
  ('PRESERVE STORED GOODS', 'preserve-stored-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('HANDLE ORGANIZATIONS'' MATERIALS', 'handle-organizations-materials', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PREPARE GOODS FOR DISTRIBUTION', 'prepare-goods-for-distribution', NULL::text),
  ('PROCURE ORGANIZATIONS'' GOODS AND SERVICES', 'procure-organizations-goods-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ECONOMIC SKILLS', 'apply-economic-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE SUPPLY CHAIN OPERATIONS', 'manage-supply-chain-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: PROJECT MANAGEMENT LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION SKILLS', 'apply-business-communication-skills', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MANAGE PROJECT INCEPTION PHASE', 'manage-project-inception-phase', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MANAGE PROJECT STAKEHOLDERS', 'manage-project-stakeholders', NULL::text),
  ('PROCURE GOODS WORKS AND SERVICES', 'procure-goods-works-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE PROJECT ENVIRONMENT', 'manage-project-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('CARRY OUT RESEARCH STUDY', 'carry-out-research-study', NULL::text),
  ('MANAGE PROJECT IMPLEMENTATION', 'manage-project-implementation', NULL::text),
  ('MANAGE PROJECT PLANNING AND DESIGN', 'manage-project-planning-and-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('AUDIT AND REVIEW PROJECTS', 'audit-and-review-projects', NULL::text),
  ('MANAGE PROJECT CLOSURE', 'manage-project-closure', NULL::text),
  ('MONITOR AND EVALUATE PROJECTS', 'monitor-and-evaluate-projects', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'project-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: ASSISTANT PROJECT MANAGER LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION SKILLS', 'apply-business-communication-skills', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MANAGE PROJECT INCEPTION PHASE', 'manage-project-inception-phase', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MANAGE PROJECT STAKEHOLDERS', 'manage-project-stakeholders', NULL::text),
  ('PROCURE GOODS WORKS AND SERVICES', 'procure-goods-works-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE PROJECT ENVIRONMENT', 'manage-project-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'assistant-project-manager-level-5';

-- ------------------------------------------------------------------------------
-- Course: BUSINESS MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM SALES ACTIVITIES', 'perform-sales-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ECONOMICS SKILLS', 'apply-economics-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM PURCHASING ACTIVITIES', 'perform-purchasing-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('PERFORM ADMINISTRATIVE ASSISTANT DUTIES', 'perform-administrative-assistant-duties', NULL::text),
  ('PERFORM STAFFING ACTIVITIES', 'perform-staffing-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'business-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: COOPERATIVE MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT COOPERATIVE MARKETING ACTIVITIES', 'conduct-cooperative-marketing-activities', NULL::text),
  ('PERFORM CUSTOMER CARE SERVICES', 'perform-customer-care-services', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM BASIC TELLER OPERATIONS', 'perform-basic-teller-operations', NULL::text),
  ('PERFORM COOPERATIVE STORES ACTIVITIES', 'perform-cooperative-stores-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE COOPERATIVE SOCIETY SECURITY MEASURES', 'manage-cooperative-society-security-measures', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'cooperative-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: CREDIT MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY ECONOMIC PRINCIPLES', 'apply-economic-principles', NULL::text),
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MARKET BANK PRODUCTS', 'market-bank-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CARRY OUT CUSTOMER ON-BOARDING', 'carry-out-customer-on-boarding', NULL::text),
  ('MAINTAIN CUSTOMER RELATIONSHIP', 'maintain-customer-relationship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY FINANCIAL MANAGEMENT SKILLS', 'apply-financial-management-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MONITOR LOAN REPAYMENT', 'monitor-loan-repayment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'credit-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: HUMAN RESOURCE MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BUSINESS COMMUNICATION', 'apply-business-communication', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CO-ORDINATE EMPLOYEE TRAINING AND DEVELOPMENT', 'co-ordinate-employee-training-and-development', NULL::text),
  ('CONDUCT EMPLOYEE RESOURCING', 'conduct-employee-resourcing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('COORDINATE EMPLOYEE PERFORMANCE MANAGEMENT', 'coordinate-employee-performance-management', NULL::text),
  ('MANAGE HUMAN RESOURCE RECORDS', 'manage-human-resource-records', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE EMPLOYEE RELATIONS', 'manage-employee-relations', NULL::text),
  ('UNDERTAKE EMPLOYEE SEPARATION', 'undertake-employee-separation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'human-resource-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: MARKETING MANAGEMENT LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT BRAND PROMOTION', 'conduct-brand-promotion', NULL::text),
  ('CONDUCT TRADE ACTIVITIES', 'conduct-trade-activities', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ECONOMIC SKILLS', 'apply-economic-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CONDUCT MARKETING COMMUNICATION ACTIVITIES', 'conduct-marketing-communication-activities', NULL::text),
  ('MANAGE CUSTOMER EXPERIENCE', 'manage-customer-experience', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('CARRY OUT BUSINESS MATHEMATICS AND STATISTICS', 'carry-out-business-mathematics-and-statistics', NULL::text),
  ('CONDUCT MARKET INNOVATIONS/RENOVATIONS', 'conduct-market-innovations-renovations', NULL::text),
  ('MANAGE DIGITAL MARKETING', 'manage-digital-marketing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'marketing-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: OFFICE ADMINISTRATION LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY SHORTHAND SKILLS I', 'apply-shorthand-skills-i', NULL::text),
  ('HANDLE CUSTOMER CARE DUTIES', 'handle-customer-care-duties', NULL::text),
  ('HANDLE OFFICE CORRESPONDENCE', 'handle-office-correspondence', NULL::text),
  ('HANDLE OFFICE ERRANDS', 'handle-office-errands', NULL::text),
  ('PROCESS OFFICE DOCUMENTS I', 'process-office-documents-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY SHORTHAND SKILLS II', 'apply-shorthand-skills-ii', NULL::text),
  ('COORDINATE OFFICE REPAIRS AND MAINTENANCE', 'coordinate-office-repairs-and-maintenance', NULL::text),
  ('HANDLE OFFICE PAPER RECORDS', 'handle-office-paper-records', NULL::text),
  ('MANAGE TELEPHONE CALLS', 'manage-telephone-calls', NULL::text),
  ('PROCESS OFFICE DOCUMENTS II', 'process-office-documents-ii', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ICT SKILLS', 'apply-ict-skills', NULL::text),
  ('APPLY INTERMEDIATE SHORTHAND SKILLS', 'apply-intermediate-shorthand-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PROCESS INTERMEDIATE OFFICE DOCUMENTS I', 'process-intermediate-office-documents-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMERCE PRINCIPLES', 'apply-commerce-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('COORDINATE OFFICIAL MEETINGS', 'coordinate-official-meetings', NULL::text),
  ('MANAGE OFFICE ADMINISTRATIVE DUTIES', 'manage-office-administrative-duties', NULL::text),
  ('MANAGE OFFICE SECURITY', 'manage-office-security', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-administration-level-5';

-- ------------------------------------------------------------------------------
-- Course: PROCUREMENT MANAGEMENT LEVEL 5 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CLASSIFY AND CODIFY PROCURED GOODS', 'classify-and-codify-procured-goods', NULL::text),
  ('MANAGE STORAGE OF GOODS', 'manage-storage-of-goods', NULL::text),
  ('RECEIVE DELIVERED GOODS', 'receive-delivered-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ISSUE AND DISPATCH GOODS', 'issue-and-dispatch-goods', NULL::text),
  ('MANAGE STORES SAFETY AND SECURITY', 'manage-stores-safety-and-security', NULL::text),
  ('PRESERVE STORED GOODS', 'preserve-stored-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY FINANCIAL ACCOUNTING SKILLS', 'apply-financial-accounting-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('HANDLE ORGANIZATIONS'' MATERIALS', 'handle-organizations-materials', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BUSINESS MATHEMATICS AND STATISTICS', 'apply-business-mathematics-and-statistics', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PREPARE GOODS FOR DISTRIBUTION', 'prepare-goods-for-distribution', NULL::text),
  ('PROCURE ORGANIZATIONS'' GOODS AND SERVICES', 'procure-organizations-goods-and-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ECONOMIC SKILLS', 'apply-economic-skills', NULL::text),
  ('APPLY MANAGEMENT SKILLS', 'apply-management-skills', NULL::text),
  ('APPLY PRINCIPLES OF COMMERCIAL LAW', 'apply-principles-of-commercial-law', NULL::text),
  ('MANAGE SUPPLY CHAIN OPERATIONS', 'manage-supply-chain-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'procurement-management-level-5';

-- ------------------------------------------------------------------------------
-- Course: OFFICE ASSISTANCE LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-assistance-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('HANDLE OFFICE CORRESPONDENCE', 'handle-office-correspondence', NULL::text),
  ('HANDLE OFFICE ERRANDS', 'handle-office-errands', NULL::text),
  ('INTRODUCTION TO PROCESS OFFICE DOCUMENTS 1', 'introduction-to-process-office-documents-1', NULL::text),
  ('INTRODUCTION TO SHORTHAND SKILLS 1', 'introduction-to-shorthand-skills-1', NULL::text),
  ('MANAGE CUSTOMER CARE RELATIONS', 'manage-customer-care-relations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-assistance-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-assistance-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COORDINATE OFFICE REPAIRS AND MAINTENANCE', 'coordinate-office-repairs-and-maintenance', NULL::text),
  ('INTRODUCTION TO PROCESS OFFICE DOCUMENTS 2', 'introduction-to-process-office-documents-2', NULL::text),
  ('INTRODUCTION TO SHORTHAND SKILLS 2', 'introduction-to-shorthand-skills-2', NULL::text),
  ('MAINTAIN OFFICE PAPER RECORDS', 'maintain-office-paper-records', NULL::text),
  ('MANAGE TELEPHONE CALLS', 'manage-telephone-calls', NULL::text),
  ('UNDERTAKE BUSINESS COMMUNICATION', 'undertake-business-communication', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'office-assistance-level-4';

-- ------------------------------------------------------------------------------
-- Course: STORE KEEPING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'store-keeping-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CLASSIFY AND CODIFY PROCURED GOODS', 'classify-and-codify-procured-goods', NULL::text),
  ('MANAGE STORAGE OF GOODS', 'manage-storage-of-goods', NULL::text),
  ('RECEIVE DELIVERED GOODS', 'receive-delivered-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'store-keeping-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies-department' AND c.slug = 'store-keeping-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ISSUE AND DISPATCH GOODS', 'issue-and-dispatch-goods', NULL::text),
  ('MANAGE STORES SAFETY AND SECURITY', 'manage-stores-safety-and-security', NULL::text),
  ('PRESERVE STORED GOODS', 'preserve-stored-goods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies-department' AND c.slug = 'store-keeping-level-4';

COMMIT;
-- Verification Query: Check courses and units inserted for BUSINESS STUDIES DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'business-studies-department'
-- GROUP BY d.name;