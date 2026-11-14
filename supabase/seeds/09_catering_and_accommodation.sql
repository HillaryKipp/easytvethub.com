-- ==============================================================================
-- SEED SCRIPT FOR: CATERING AND ACCOMMODATION DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 23 | Total Units: 253
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

COMMIT;
-- Verification Query: Check courses and units inserted for CATERING AND ACCOMMODATION DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'catering-and-accommodation-department'
-- GROUP BY d.name;