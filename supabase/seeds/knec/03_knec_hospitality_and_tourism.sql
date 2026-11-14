-- ==============================================================================
-- SEED SCRIPT FOR: HOSPITALITY AND TOURISM MANAGEMENT (KNEC COURSES)
-- Total Courses: 8 | Total Units: 156
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

-- 2. Upsert Department under KNEC: HOSPITALITY AND TOURISM MANAGEMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'HOSPITALITY AND TOURISM MANAGEMENT', 'hospitality-and-tourism-management', 'KNEC Diploma and Certificate past examination papers and modules in Food & Beverage, Catering & Accommodation, Tourism Management, and Food Technology.', 3
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management'
);

-- 4. Insert KNEC Courses under HOSPITALITY AND TOURISM MANAGEMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN FOOD AND BEVERAGE MANAGEMENT', 'diploma-in-food-and-beverage-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN CATERING AND ACCOMMODATION MANAGEMENT', 'diploma-in-catering-and-accommodation-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN TOURISM MANAGEMENT', 'diploma-in-tourism-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN FOOD SCIENCE PROCESSING TECHNOLOGY', 'diploma-in-food-science-processing-technology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FOOD PROCESSING AND PRESERVATION TECHNOLOGY', 'certificate-in-food-processing-and-preservation-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN CATERING AND ACCOMMODATION', 'certificate-in-catering-and-accommodation', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FOOD AND BEVERAGE PRODUCTION AND SERVICE', 'certificate-in-food-and-beverage-production-and-service', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN TOUR GUIDING AND TRAVEL OPERATIONS', 'certificate-in-tour-guiding-and-travel-operations', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN FOOD AND BEVERAGE MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FOOD AND BEVERAGE PRODUCTION THEORY', 'food-and-beverage-production-theory', NULL::text),
  ('FOOD AND BEVERAGE SERVICE THEORY', 'food-and-beverage-service-theory', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND CONTROL THEORY', 'food-and-beverage-service-and-control-theory', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('CATERING PREMISES AND EQUIPMENT', 'catering-premises-and-equipment', NULL::text),
  ('INFORMATION & COMMUNICATION TECHNOLOGY (ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FOOD AND BEVERAGE PRODUCTION MANAGEMENT PRACTICE', 'food-and-beverage-production-management-practice', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION MANAGEMENT THEORY', 'food-and-beverage-production-management-theory', NULL::text),
  ('NUTRITION, DIET THERAPY AND HOME NURSING', 'nutrition-diet-therapy-and-home-nursing', NULL::text),
  ('FOOD AND BEVERAGE CONTROL', 'food-and-beverage-control', NULL::text),
  ('LAW RELATING TO CATERING', 'law-relating-to-catering', NULL::text),
  ('HOSPITALITY ACCOUNTING', 'hospitality-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';

-- Module 3: Module III (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('FOOD AND BEVERAGE SERVICE AND SALES MANAGEMENT THEORY', 'food-and-beverage-service-and-sales-management-theory', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND SALES MANAGEMENT PRACTICE', 'food-and-beverage-service-and-sales-management-practice', NULL::text),
  ('SALES AND MARKETING', 'sales-and-marketing', NULL::text),
  ('HUMAN RELATIONS', 'human-relations', NULL::text),
  ('PRINCIPLES OF ACCOUNTS', 'principles-of-accounts', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('RESEARCH PROJECT', 'research-project', NULL::text),
  ('BEVERAGE PREPARATION, SERVICE AND SALES MANAGEMENT', 'beverage-preparation-service-and-sales-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN CATERING AND ACCOMMODATION MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FOOD SCIENCE AND NUTRITION', 'food-science-and-nutrition', NULL::text),
  ('ACCOMMODATION OPERATIONS THEORY', 'accommodation-operations-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(ICT)', 'information-communication-technology-ict', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION', 'food-and-beverage-production', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND CONTROL THEORY', 'food-and-beverage-service-and-control-theory', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND SALES', 'food-and-beverage-service-and-sales', NULL::text),
  ('HOUSEKEEPING, FRONT OFFICE LAUNDRY', 'housekeeping-front-office-laundry', NULL::text),
  ('CATERING AND ACCOMMODATION CONTROL I', 'catering-and-accommodation-control-i', NULL::text),
  ('CATERING AND ACCOMMODATION PREMISE', 'catering-and-accommodation-premise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';

-- Module 2: Module II (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CATERING AND ACCOMMODATION CONTROL II', 'catering-and-accommodation-control-ii', NULL::text),
  ('DIET THERAPY', 'diet-therapy', NULL::text),
  ('HOSPITALITY ACCOUNTING AND CONTROL', 'hospitality-accounting-and-control', NULL::text),
  ('FOOD BEVERAGE PRODUCTION MANAGEMENT PRACTICE', 'food-beverage-production-management-practice', NULL::text),
  ('FOOD BEVERAGE PRODUCTION MANAGEMENT THEORY', 'food-beverage-production-management-theory', NULL::text),
  ('ACCOMMODATION OPERATIONS MANAGEMENT I AND LAW THEORY', 'accommodation-operations-management-i-and-law-theory', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('LAW RELATED TO HOSPITALITY INDUSTRY', 'law-related-to-hospitality-industry', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';

-- Module 3: Module III (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('ACCOMMODATION OPERATIONS MANAGEMENT II', 'accommodation-operations-management-ii', NULL::text),
  ('PRINCIPLES AND PRACTICES OF MANAGEMENT', 'principles-and-practices-of-management', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION MANAGEMENT THEORY', 'food-and-beverage-production-management-theory', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND SALES MANAGEMENT THEORY', 'food-and-beverage-service-and-sales-management-theory', NULL::text),
  ('PRINCIPLES OF ACCOUNTING AND MANAGEMENT', 'principles-of-accounting-and-management', NULL::text),
  ('SALES AND MARKETING FOR HOSPITALITY INDUSTRY', 'sales-and-marketing-for-hospitality-industry', NULL::text),
  ('HUMAN RELATIONS', 'human-relations', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN TOURISM MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FUNDAMENTALS OF TOURISM', 'fundamentals-of-tourism', NULL::text),
  ('FAUNA, FLORA AND TOURISTIC GEOGRAPHY', 'fauna-flora-and-touristic-geography', NULL::text),
  ('TOUR GUIDING TECHNIQUES', 'tour-guiding-techniques', NULL::text),
  ('TOURISTIC HISTORY', 'touristic-history', NULL::text),
  ('TRAVEL OPERATIONS AND CUSTOMER CARE', 'travel-operations-and-customer-care', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('FRENCH PAPER 1', 'french-paper-1', NULL::text),
  ('TOURISM ECONOMICS', 'tourism-economics', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';

-- Module 2: Module II (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('TOUR OPERATIONS', 'tour-operations', NULL::text),
  ('TRAVEL AGENCY', 'travel-agency', NULL::text),
  ('FUNDAMENTALS OF HOTEL OPERATIONS', 'fundamentals-of-hotel-operations', NULL::text),
  ('PUBLIC RELATIONS', 'public-relations', NULL::text),
  ('TOURISM ACCOUNTING', 'tourism-accounting', NULL::text),
  ('TOURISM ECONOMICS II', 'tourism-economics-ii', NULL::text),
  ('ASTRONOMY', 'astronomy', NULL::text),
  ('TOURISM GEOGRAPHY', 'tourism-geography', NULL::text),
  ('FOREIGN LANGUAGE II', 'foreign-language-ii', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';

-- Module 3: Module III (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PRINCIPLES AND PRACTICES OF MANAGEMENT', 'principles-and-practices-of-management', NULL::text),
  ('TOURISM POLICY AND PLANNING', 'tourism-policy-and-planning', NULL::text),
  ('TOURISM PRODUCT DEVELOPMENT', 'tourism-product-development', NULL::text),
  ('ECOTOURISM', 'ecotourism', NULL::text),
  ('TOURISM MARKETING', 'tourism-marketing', NULL::text),
  ('TOURISM LAW III', 'tourism-law-iii', NULL::text),
  ('FRENCH', 'french', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN FOOD SCIENCE PROCESSING TECHNOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL PRODUCTION AND GENERAL MICROBIOLOGY', 'agricultural-production-and-general-microbiology', NULL::text),
  ('APPLIED SCIENCE AND MICROBIOLOGY PRACTICAL', 'applied-science-and-microbiology-practical', NULL::text),
  ('FOOD ENGINEERING I', 'food-engineering-i', NULL::text),
  ('LABORATORY AND WORKSHOP PRACTICE', 'laboratory-and-workshop-practice', NULL::text),
  ('MATHEMATICS AND APPLIED SCIENCE', 'mathematics-and-applied-science', NULL::text),
  ('ICT COMMUNICATION SKILLS AND ENTREPRENEURSHIP', 'ict-communication-skills-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FOOD ANALYSIS AND QUALITY ASSURANCE', 'food-analysis-and-quality-assurance', NULL::text),
  ('FOOD CHEMISTRY I AND FOOD MICROBIOLOGY I', 'food-chemistry-i-and-food-microbiology-i', NULL::text),
  ('FOOD ENGINEERING II', 'food-engineering-ii', NULL::text),
  ('TECHNOLOGY OF SPECIFIC PRODUCTS I', 'technology-of-specific-products-i', NULL::text),
  ('FOOD PROCESSING AND PRESERVATION I', 'food-processing-and-preservation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';

-- Module 3: Module III (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PRODUCT DEVELOPMENT, INDUSTRIAL ORGANIZATION AND MANAGEMENT', 'product-development-industrial-organization-and-management', NULL::text),
  ('FOOD ANALYSIS AND INSTRUMENTATION', 'food-analysis-and-instrumentation', NULL::text),
  ('FOOD CHEMISTRY II AND FOOD MICROBIOLOGY II', 'food-chemistry-ii-and-food-microbiology-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FOOD PROCESSING AND PRESERVATION TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-processing-and-preservation-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL PRODUCTION AND MICROBIOLOGY', 'agricultural-production-and-microbiology', NULL::text),
  ('APPLIED SCIENCE AND LABORATORY PRACTICE', 'applied-science-and-laboratory-practice', NULL::text),
  ('FOOD ENGINEERING I', 'food-engineering-i', NULL::text),
  ('FOOD PROCESSING AND PRESERVATION I', 'food-processing-and-preservation-i', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-processing-and-preservation-technology';

-- Module 2: Module II (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-processing-and-preservation-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FOOD PROCESSING AND PRESERVATION II', 'food-processing-and-preservation-ii', NULL::text),
  ('FOOD ENGINEERING II', 'food-engineering-ii', NULL::text),
  ('FOOD CHEMISTRY AND FOOD MICROBIOLOGY', 'food-chemistry-and-food-microbiology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-processing-and-preservation-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN CATERING AND ACCOMMODATION [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-catering-and-accommodation';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('FOOD SCIENCE AND NUTRITION', 'food-science-and-nutrition', NULL::text),
  ('FIRST AID AND HOME NURSING', 'first-aid-and-home-nursing', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION', 'food-and-beverage-production', NULL::text),
  ('FOOD, BEVERAGE SERVICE AND SALES', 'food-beverage-service-and-sales', NULL::text),
  ('CATERING AND ACCOMMODATION CONTROL', 'catering-and-accommodation-control', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-catering-and-accommodation';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-catering-and-accommodation';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('HOUSE KEEPING', 'house-keeping', NULL::text),
  ('FRONT OFFICE OPERATIONS', 'front-office-operations', NULL::text),
  ('LAUNDRY, CATERING AND ACCOMMODATION PREMISES', 'laundry-catering-and-accommodation-premises', NULL::text),
  ('CATERING AND ACCOMMODATION PREMISE', 'catering-and-accommodation-premise', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('RESEARCH PROJECT', 'research-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-catering-and-accommodation';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FOOD AND BEVERAGE PRODUCTION AND SERVICE [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-and-beverage-production-and-service';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('FOOD AND BEVERAGE CONTROL THEORY', 'food-and-beverage-control-theory', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION THEORY', 'food-and-beverage-production-theory', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('BASIC MATHEMATICAL OPERATIONS', 'basic-mathematical-operations', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-and-beverage-production-and-service';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-and-beverage-production-and-service';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FOOD AND BEVERAGE SERVICE AND SALES THEORY', 'food-and-beverage-service-and-sales-theory', NULL::text),
  ('CATERING PREMISES AND EQUIPMENT', 'catering-premises-and-equipment', NULL::text),
  ('FOOD, BEVERAGE SALES AND SERVICE THEORY', 'food-beverage-sales-and-service-theory', NULL::text),
  ('FOOD, BEVERAGE SALES AND SERVICE PRACTICE', 'food-beverage-sales-and-service-practice', NULL::text),
  ('FOOD AND BEVERAGE CONTROL', 'food-and-beverage-control', NULL::text),
  ('TRADE PROJECT ORIENTATION', 'trade-project-orientation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-and-beverage-production-and-service';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN TOUR GUIDING AND TRAVEL OPERATIONS [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-tour-guiding-and-travel-operations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATION', 'communication', NULL::text),
  ('CUSTOMER CARE', 'customer-care', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('GERMAN 1', 'german-1', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('FRENCH MODULE 1', 'french-module-1', NULL::text),
  ('FUNDAMENTALS OF TOURISM', 'fundamentals-of-tourism', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('TOUR GUIDING TECHNIQUES', 'tour-guiding-techniques', NULL::text),
  ('TOURISM ECONOMICS', 'tourism-economics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-tour-guiding-and-travel-operations';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-tour-guiding-and-travel-operations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('TOURISTIC GEOGRAPHY', 'touristic-geography', NULL::text),
  ('TOURISTIC HISTORY', 'touristic-history', NULL::text),
  ('TRAVEL OPERATIONS', 'travel-operations', NULL::text),
  ('FRENCH MODULE II', 'french-module-ii', NULL::text),
  ('FAUNA, FLORA AND ENVIRONMENTAL STUDIES', 'fauna-flora-and-environmental-studies', NULL::text),
  ('GERMAN II', 'german-ii', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-tour-guiding-and-travel-operations';

COMMIT;
-- Verification Query: Check courses and units inserted for HOSPITALITY AND TOURISM MANAGEMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'hospitality-and-tourism-management'
-- GROUP BY d.name;