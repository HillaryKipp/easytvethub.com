-- ==============================================================================
-- SEED SCRIPT FOR: CATERING AND ACCOMMODATION DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 23 | Total Units: 325
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

-- 2. Upsert Department under Cycle 1 & 2: CATERING AND ACCOMMODATION DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'CATERING AND ACCOMMODATION DEPARTMENT', 'catering-and-accommodation-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Catering, Baking, Food Production, Housekeeping, Tour & Travel, and Wildlife Management courses.', 9
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
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department'
);

-- 4. Insert Non-Modular Courses under CATERING AND ACCOMMODATION DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BAKING TECHNOLOGY LEVEL 6', 'baking-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD & BEVERAGE SALES AND SERVICE MANAGEMENT LEVEL 6', 'food-and-beverage-sales-and-service-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION (CULINARY ARTS) LEVEL 6', 'food-production-culinary-arts-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD TECHNOLOGY LEVEL 6', 'food-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HOUSEKEEPING AND ACCOMMODATION LEVEL 6', 'housekeeping-and-accommodation-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOURISM AND TRAVEL MANAGEMENT LEVEL 6', 'tourism-and-travel-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BAKING TECHNOLOGY LEVEL 5', 'baking-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE PRODUCTION (CULINARY ARTS) LEVEL 5', 'food-and-beverage-production-culinary-arts-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE SALES AND SERVICE LEVEL 5', 'food-and-beverage-sales-and-service-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION (CULINARY ARTS) LEVEL 5', 'food-production-culinary-arts-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD TECHNOLOGY LEVEL 5', 'food-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HOUSEKEEPING AND ACCOMMODATION LEVEL 5', 'housekeeping-and-accommodation-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOUR AND TRAVEL CONSULTANCY LEVEL 5', 'tour-and-travel-consultancy-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOUR AND TRAVEL CONSULTANT LEVEL 5', 'tour-and-travel-consultant-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TOUR GUIDE LEVEL 5', 'tour-guide-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WILDLIFE MANAGEMENT ASSISTANT LEVEL 5', 'wildlife-management-assistant-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BAKING TECHNOLOGY (CAKE DECORATION AND PASTRY) LEVEL 4', 'baking-technology-cake-decoration-and-pastry-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE PRODUCTION (CULINARY ART) LEVEL 4', 'food-and-beverage-production-culinary-art-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE SALES AND SERVICE LEVEL 4', 'food-and-beverage-sales-and-service-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION (CULINARY ARTS) LEVEL 4', 'food-production-culinary-arts-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HOUSEKEEPING AND ACCOMMODATION LEVEL 4', 'housekeeping-and-accommodation-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD AND BEVERAGE SALES AND SERVICE OPERATOR LEVEL 3', 'food-and-beverage-sales-and-service-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOD PRODUCTION (CULINARY ARTS) TECHNICIAN LEVEL 3', 'food-production-culinary-arts-technician-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: BAKING TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEMONSTRATE UNDERSTANDING OF BAKERY PLANT AND EQUIPMENT', 'demonstrate-understanding-of-bakery-plant-and-equipment', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF BAKING RAW MATERIALS SCIENCE', 'demonstrate-understanding-of-baking-raw-materials-science', NULL::text),
  ('MANAGE BAKERY PRODUCTION DEPARTMENT', 'manage-bakery-production-department', NULL::text),
  ('MANAGE BAKERY PRODUCTS QUALITY', 'manage-bakery-products-quality', NULL::text),
  ('MANAGE CAKE DECORATION', 'manage-cake-decoration', NULL::text),
  ('MANAGE CAKE PRODUCTION', 'manage-cake-production', NULL::text),
  ('MANAGE PRODUCTION OF PASTRY PRODUCTS', 'manage-production-of-pastry-products', NULL::text),
  ('MANAGE PRODUCTION OF YEAST PRODUCTS', 'manage-production-of-yeast-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: FOOD & BEVERAGE SALES AND SERVICE MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-management-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-management-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BANQUET AND EVENT OPERATIONS', 'manage-banquet-and-event-operations', NULL::text),
  ('MANAGE BAR OPERATIONS', 'manage-bar-operations', NULL::text),
  ('MANAGE FOOD AND BEVERAGE GUEST EXPERIENCE', 'manage-food-and-beverage-guest-experience', NULL::text),
  ('MANAGE FOOD AND BEVERAGE OPERATIONS', 'manage-food-and-beverage-operations', NULL::text),
  ('MANAGE FOOD AND BEVERAGES REVENUE PERFORMANCE', 'manage-food-and-beverages-revenue-performance', NULL::text),
  ('MANAGE ROOM SERVICE', 'manage-room-service', NULL::text),
  ('MANAGE SPECIALTY OUTLETS', 'manage-specialty-outlets', NULL::text),
  ('PERFORM FOOD AND BEVERAGE DEPARTMENT ADMINISTRATIVE DUTIES', 'perform-food-and-beverage-department-administrative-duties', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION (CULINARY ARTS) LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE BREADS', 'prepare-breads', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE MEATS', 'prepare-meats', NULL::text),
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE SALADS', 'prepare-salads', NULL::text),
  ('PREPARE SAUCES', 'prepare-sauces', NULL::text),
  ('PREPARE SOUPS', 'prepare-soups', NULL::text),
  ('PREPARE STOCKS', 'prepare-stocks', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-6';

-- ------------------------------------------------------------------------------
-- Course: FOOD TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP NEW FOOD PRODUCT', 'develop-new-food-product', NULL::text),
  ('MANAGE FOOD PROCESSING PLANT', 'manage-food-processing-plant', NULL::text),
  ('MANAGE QUALITY OF FOOD PRODUCTS', 'manage-quality-of-food-products', NULL::text),
  ('PROCESS FOOD PRODUCTS', 'process-food-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: HOUSEKEEPING AND ACCOMMODATION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-6';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE FACILITIES, PROPERTY REPAIRS AND MAINTENANCE', 'manage-facilities-property-repairs-and-maintenance', NULL::text),
  ('MANAGE FRONT OFFICE OPERATIONS', 'manage-front-office-operations', NULL::text),
  ('MANAGE GUEST EXPERIENCE', 'manage-guest-experience', NULL::text),
  ('MANAGE HOUSEKEEPING OPERATIONS', 'manage-housekeeping-operations', NULL::text),
  ('MANAGE LAUNDRY AND LINEN OPERATIONS', 'manage-laundry-and-linen-operations', NULL::text),
  ('PERFORM HOUSEKEEPING DEPARTMENT ADMINISTRATIVE DUTIES', 'perform-housekeeping-department-administrative-duties', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-6';

-- ------------------------------------------------------------------------------
-- Course: TOURISM AND TRAVEL MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tourism-and-travel-management-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tourism-and-travel-management-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tourism-and-travel-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP TOUR PACKAGES', 'develop-tour-packages', NULL::text),
  ('DEVELOP TRAVEL PACKAGE', 'develop-travel-package', NULL::text),
  ('MANAGE TOUR AND TRAVEL PRODUCT QUALITY', 'manage-tour-and-travel-product-quality', NULL::text),
  ('MANAGE TOUR DELIVERY', 'manage-tour-delivery', NULL::text),
  ('MANAGE TOUR OFFICE OPERATIONS', 'manage-tour-office-operations', NULL::text),
  ('MANAGE TRAVEL OFFICE OPERATIONS', 'manage-travel-office-operations', NULL::text),
  ('MANAGE TRAVEL SERVICE DELIVERY', 'manage-travel-service-delivery', NULL::text),
  ('MARKET TOUR AND TRAVEL PRODUCTS', 'market-tour-and-travel-products', NULL::text),
  ('PROMOTE SUSTAINABLE TOURISM', 'promote-sustainable-tourism', NULL::text),
  ('SUPERVISE CUSTOMER SERVICE', 'supervise-customer-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tourism-and-travel-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: BAKING TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY SCIENTIFIC THEORY IN BAKING TECHNOLOGY', 'apply-scientific-theory-in-baking-technology', NULL::text),
  ('DECORATE CAKES', 'decorate-cakes', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF BAKING RAW MATERIALS', 'demonstrate-understanding-of-baking-raw-materials', NULL::text),
  ('DEMONSTRATE UNDERSTANDING OF PLANT AND EQUIPMENT', 'demonstrate-understanding-of-plant-and-equipment', NULL::text),
  ('PRODUCE CAKES', 'produce-cakes', NULL::text),
  ('PRODUCE PASTRY PRODUCTS', 'produce-pastry-products', NULL::text),
  ('PRODUCE YEAST PRODUCTS', 'produce-yeast-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE PRODUCTION (CULINARY ARTS) LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-arts-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-arts-level-5';

-- Section 2: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-arts-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUTCHERY', 'butchery', NULL::text),
  ('COOK MEAT AND SAUCES', 'cook-meat-and-sauces', NULL::text),
  ('MANAGE FOOD AND BEVERAGE OPERATIONS', 'manage-food-and-beverage-operations', NULL::text),
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text),
  ('PREPARE COLD STARTERS, FRUIT VEGETABLE SALADS AND CANAPES', 'prepare-cold-starters-fruit-vegetable-salads-and-canapes', NULL::text),
  ('PREPARE CUTS OF MEAT', 'prepare-cuts-of-meat', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE EGGS', 'prepare-eggs', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE SALADS AND SALAD DRESSINGS', 'prepare-salads-and-salad-dressings', NULL::text),
  ('PREPARE SANDWICHES', 'prepare-sandwiches', NULL::text),
  ('PREPARE STOCKS AND SOUPS', 'prepare-stocks-and-soups', NULL::text),
  ('PREPARE YEAST PRODUCT', 'prepare-yeast-product', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-arts-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE SALES AND SERVICE LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BANQUET AND EVENT OPERATIONS', 'manage-banquet-and-event-operations', NULL::text),
  ('MANAGE BAR OPERATIONS', 'manage-bar-operations', NULL::text),
  ('MANAGE FOOD AND BEVERAGE GUEST EXPERIENCE', 'manage-food-and-beverage-guest-experience', NULL::text),
  ('MANAGE FOOD AND BEVERAGE OPERATIONS', 'manage-food-and-beverage-operations', NULL::text),
  ('MANAGE SPECIALITY OUTLETS', 'manage-speciality-outlets', NULL::text),
  ('PERFORM FOOD AND BEVERAGE DEPARTMENT ADMINISTRATIVE DUTIES', 'perform-food-and-beverage-department-administrative-duties', NULL::text),
  ('SUPERVISE ROOM SERVICE OPERATIONS', 'supervise-room-service-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION (CULINARY ARTS) LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-5';

-- Section 2: Core Units of Competency (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COOK MEAT AND SAUCES', 'cook-meat-and-sauces', NULL::text),
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text),
  ('PREPARE COLD STARTERS, FRUIT VEGETABLE SALADS AND CANAPES', 'prepare-cold-starters-fruit-vegetable-salads-and-canapes', NULL::text),
  ('PREPARE CUTS OF MEAT', 'prepare-cuts-of-meat', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE EGGS', 'prepare-eggs', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE PASTRIES', 'prepare-pastries', NULL::text),
  ('PREPARE SALADS AND SALAD DRESSING', 'prepare-salads-and-salad-dressing', NULL::text),
  ('PREPARE SANDWICHES', 'prepare-sandwiches', NULL::text),
  ('PREPARE STOCKS, SOUPS AND SAUCES', 'prepare-stocks-soups-and-sauces', NULL::text),
  ('PREPARE YEAST PRODUCTS', 'prepare-yeast-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOD TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP NEW FOOD PRODUCT', 'develop-new-food-product', NULL::text),
  ('MAINTAIN FOOD PRODUCT QUALITY', 'maintain-food-product-quality', NULL::text),
  ('MAINTAINING FOOD PLANT HYGIENE', 'maintaining-food-plant-hygiene', NULL::text),
  ('PROCESS FOOD PRODUCTS', 'process-food-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: HOUSEKEEPING AND ACCOMMODATION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COORDINATE LAUNDRY AND LINEN OPERATIONS', 'coordinate-laundry-and-linen-operations', NULL::text),
  ('MANAGE GUEST EXPERIENCE', 'manage-guest-experience', NULL::text),
  ('MANAGE HOUSEKEEPING OPERATIONS', 'manage-housekeeping-operations', NULL::text),
  ('OVERSEE FACILITY AND PROPERTY REPAIRS AND MAINTENANCE', 'oversee-facility-and-property-repairs-and-maintenance', NULL::text),
  ('OVERSEE FRONT OFFICE OPERATIONS', 'oversee-front-office-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-5';

-- ------------------------------------------------------------------------------
-- Course: TOUR AND TRAVEL CONSULTANCY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultancy-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultancy-level-5';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultancy-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP TOUR PACKAGES', 'develop-tour-packages', NULL::text),
  ('DEVELOP TRAVEL PACKAGES', 'develop-travel-packages', NULL::text),
  ('MANAGE TOUR DELIVERY', 'manage-tour-delivery', NULL::text),
  ('MARKET TOUR AND TRAVEL PRODUCTS', 'market-tour-and-travel-products', NULL::text),
  ('PARTICIPATE IN TOUR OFFICE OPERATIONS', 'participate-in-tour-office-operations', NULL::text),
  ('PARTICIPATE IN TRAVEL OFFICE OPERATIONS', 'participate-in-travel-office-operations', NULL::text),
  ('PARTICIPATE IN TRAVEL SERVICE DELIVERY', 'participate-in-travel-service-delivery', NULL::text),
  ('PROMOTE SUSTAINABLE TOURISM', 'promote-sustainable-tourism', NULL::text),
  ('PROVIDE TOUR AND TRAVEL CUSTOMER SERVICE', 'provide-tour-and-travel-customer-service', NULL::text),
  ('PROVIDE TOUR GUIDING SERVICES', 'provide-tour-guiding-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultancy-level-5';

-- ------------------------------------------------------------------------------
-- Course: TOUR AND TRAVEL CONSULTANT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultant-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultant-level-5';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultant-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP TOUR PACKAGE', 'develop-tour-package', NULL::text),
  ('DEVELOP TRAVEL PACKAGE', 'develop-travel-package', NULL::text),
  ('MARKET TRAVEL AND TOUR PRODUCT', 'market-travel-and-tour-product', NULL::text),
  ('PARTICIPATE IN TOUR DELIVERY', 'participate-in-tour-delivery', NULL::text),
  ('PARTICIPATE IN TRAVEL OFFICE OPERATIONS', 'participate-in-travel-office-operations', NULL::text),
  ('PARTICIPATE IN TRAVEL SERVICE DELIVERY', 'participate-in-travel-service-delivery', NULL::text),
  ('PROMOTE SUSTAINABLE TOURISM', 'promote-sustainable-tourism', NULL::text),
  ('PROVIDE TOUR GUIDING SERVICES', 'provide-tour-guiding-services', NULL::text),
  ('SUPERVISE CUSTOMER SERVICE', 'supervise-customer-service', NULL::text),
  ('SUPERVISE TOUR OFFICE OPERATIONS', 'supervise-tour-office-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-and-travel-consultant-level-5';

-- ------------------------------------------------------------------------------
-- Course: TOUR GUIDE LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';

-- Section 2: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ACQUIRE TOUR RESOURCES (HUMAN RESOURCE, TOOLS AND EQUIPMENT)', 'acquire-tour-resources-human-resource-tools-and-equipment', NULL::text),
  ('CONDUCT EXPERIENTIAL TOUR BOOKINGS & RESERVATIONS', 'conduct-experiential-tour-bookings-and-reservations', NULL::text),
  ('DEMONSTRATE RISK MANAGEMENT SKILLS', 'demonstrate-risk-management-skills', NULL::text),
  ('HANDLE TOURIST ARRIVALS AND DEPARTURES', 'handle-tourist-arrivals-and-departures', NULL::text),
  ('HOSPITALITY AND TOURISM CAREER PATHWAYS', 'hospitality-and-tourism-career-pathways', NULL::text),
  ('MANAGE GUEST EXPERIENCE', 'manage-guest-experience', NULL::text),
  ('ORGANIZE EXPERIENTIAL TOURS (FOOD AND BEVERAGE)', 'organize-experiential-tours-food-and-beverage', NULL::text),
  ('PACKAGE EXPERIENTIAL TOURS', 'package-experiential-tours', NULL::text),
  ('PROVIDE EXPERIENTIAL TOUR INTERPRETATION', 'provide-experiential-tour-interpretation', NULL::text),
  ('SUSTAINABLE TOURISM', 'sustainable-tourism', NULL::text),
  ('TOURISM AND HOSPITALITY MARKETING EXPERIENCES', 'tourism-and-hospitality-marketing-experiences', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'tour-guide-level-5';

-- ------------------------------------------------------------------------------
-- Course: WILDLIFE MANAGEMENT ASSISTANT LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-management-assistant-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-management-assistant-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-management-assistant-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MONITOR WILDLIFE HABITATS', 'monitor-wildlife-habitats', NULL::text),
  ('PROVIDE HERPETOLOGICAL SERVICES', 'provide-herpetological-services', NULL::text),
  ('PROVIDE MAMMALOGY SERVICES', 'provide-mammalogy-services', NULL::text),
  ('PROVIDE ORNITHOLOGICAL SERVICES', 'provide-ornithological-services', NULL::text),
  ('PROVIDE PLANT TAXONOMY SERVICES', 'provide-plant-taxonomy-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'wildlife-management-assistant-level-5';

-- ------------------------------------------------------------------------------
-- Course: BAKING TECHNOLOGY (CAKE DECORATION AND PASTRY) LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-cake-decoration-and-pastry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('DECORATE CAKES', 'decorate-cakes', NULL::text),
  ('PRODUCE PASTRY PRODUCTS', 'produce-pastry-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'baking-technology-cake-decoration-and-pastry-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE PRODUCTION (CULINARY ART) LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-art-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-art-level-4';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-art-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUTCHERY', 'butchery', NULL::text),
  ('COOK MEATS', 'cook-meats', NULL::text),
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text),
  ('PREPARE CUTS OF MEATS (BUTCHERY)', 'prepare-cuts-of-meats-butchery', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE EGGS', 'prepare-eggs', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE SALAD AND SALAD DRESSINGS', 'prepare-salad-and-salad-dressings', NULL::text),
  ('PREPARE SANDWICHES', 'prepare-sandwiches', NULL::text),
  ('PREPARE STOCKS AND SOUPS', 'prepare-stocks-and-soups', NULL::text),
  ('PREPARE YEAST PRODUCT', 'prepare-yeast-product', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-production-culinary-art-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE SALES AND SERVICE LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-4';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT BAR OPERATIONS', 'carry-out-bar-operations', NULL::text),
  ('HANDLE GUEST RESERVATIONS', 'handle-guest-reservations', NULL::text),
  ('OPERATE SPECIALITY OUTLETS', 'operate-speciality-outlets', NULL::text),
  ('PERFORM FOOD AND BEVERAGE OPERATIONS', 'perform-food-and-beverage-operations', NULL::text),
  ('PREPARE CEREALS, VEGETABLES, FRUITS AND NUTS', 'prepare-cereals-vegetables-fruits-and-nuts', NULL::text),
  ('PROVIDE BANQUETS AND EVENTS SERVICES', 'provide-banquets-and-events-services', NULL::text),
  ('PROVIDE FOOD AND BEVERAGE GUEST EXPERIENCE', 'provide-food-and-beverage-guest-experience', NULL::text),
  ('SUPERVISE ROOM SERVICE OPERATIONS', 'supervise-room-service-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION (CULINARY ARTS) LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-4';

-- Section 2: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COOK RED, WHITE MEATS AND OFFAL', 'cook-red-white-meats-and-offal', NULL::text),
  ('PREPARE BEVERAGES', 'prepare-beverages', NULL::text),
  ('PREPARE CAKES', 'prepare-cakes', NULL::text),
  ('PREPARE CEREALS, VEGETABLES, FRUITS AND NUTS', 'prepare-cereals-vegetables-fruits-and-nuts', NULL::text),
  ('PREPARE CUTS OF MEAT', 'prepare-cuts-of-meat', NULL::text),
  ('PREPARE DESSERTS', 'prepare-desserts', NULL::text),
  ('PREPARE EGGS', 'prepare-eggs', NULL::text),
  ('PREPARE FOOD ACCOMPANIMENTS', 'prepare-food-accompaniments', NULL::text),
  ('PREPARE MAIN DISHES', 'prepare-main-dishes', NULL::text),
  ('PREPARE SALADS AND SALAD DRESSING', 'prepare-salads-and-salad-dressing', NULL::text),
  ('PREPARE SANDWICHES', 'prepare-sandwiches', NULL::text),
  ('PREPARE SAUCES', 'prepare-sauces', NULL::text),
  ('PREPARE SOUPS', 'prepare-soups', NULL::text),
  ('PREPARE STOCKS AND SOUPS', 'prepare-stocks-and-soups', NULL::text),
  ('PREPARE YEAST PRODUCTS', 'prepare-yeast-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-level-4';

-- ------------------------------------------------------------------------------
-- Course: HOUSEKEEPING AND ACCOMMODATION LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COORDINATE FACILITY AND PROPERTY REPAIRS AND MAINTENANCE', 'coordinate-facility-and-property-repairs-and-maintenance', NULL::text),
  ('COORDINATE FRONT OFFICE OPERATIONS', 'coordinate-front-office-operations', NULL::text),
  ('SUPERVISE GUEST EXPERIENCE', 'supervise-guest-experience', NULL::text),
  ('SUPERVISE HOUSEKEEPING OPERATIONS', 'supervise-housekeeping-operations', NULL::text),
  ('SUPERVISE LAUNDRY AND LINEN OPERATIONS', 'supervise-laundry-and-linen-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'housekeeping-and-accommodation-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOD AND BEVERAGE SALES AND SERVICE OPERATOR LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-operator-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MERCHANDIZE FOOD AND BEVERAGE PRODUCTS', 'merchandize-food-and-beverage-products', NULL::text),
  ('SERVE FOOD AND BEVERAGE ORDERS', 'serve-food-and-beverage-orders', NULL::text),
  ('SET-UP FOR FOOD AND BEVERAGE SERVICE', 'set-up-for-food-and-beverage-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-and-beverage-sales-and-service-operator-level-3';

-- ------------------------------------------------------------------------------
-- Course: FOOD PRODUCTION (CULINARY ARTS) TECHNICIAN LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-technician-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BUTCHERY', 'butchery', NULL::text),
  ('PREPARE HOT AND COLD BEVERAGES', 'prepare-hot-and-cold-beverages', NULL::text),
  ('PREPARE MEATS, FISH, SEA FOODS AND POULTRY AND SAUCES', 'prepare-meats-fish-sea-foods-and-poultry-and-sauces', NULL::text),
  ('PREPARE PASTRY AND BREADS', 'prepare-pastry-and-breads', NULL::text),
  ('PREPARE SALADS AND SALAD DRESSINGS', 'prepare-salads-and-salad-dressings', NULL::text),
  ('PREPARE VEGETABLES, STARCHES AND SOUPS', 'prepare-vegetables-starches-and-soups', NULL::text),
  ('REPAIR STOCKS', 'repair-stocks', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department' AND c.slug = 'food-production-culinary-arts-technician-level-3';

COMMIT;
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'catering-and-accommodation-department'
-- GROUP BY d.name;