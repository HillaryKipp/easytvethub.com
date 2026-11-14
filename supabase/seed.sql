-- Idempotent seed SQL for TVET Papers Kenya
-- Run this in the Supabase SQL Editor (bypasses RLS automatically)
BEGIN;

INSERT INTO programmes (name, slug, description, sort_order) VALUES ('Modular CDACC Courses (Cycle 3)', 'modular-cdacc-courses-cycle-3', 'TVET CDACC Cycle 3 modularized competency-based education and training (CBET) courses across Levels 3, 4, 5, and 6 in Kenya.', 1) ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, sort_order = EXCLUDED.sort_order;
INSERT INTO programmes (name, slug, description, sort_order) VALUES ('CDACC Courses (Cycle 1 & 2)', 'cdacc-courses-cycle-1-and-2', 'TVET CDACC Cycle 1 and Cycle 2 competency-based courses, occupational standards, past papers, and assessment tools.', 2) ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, sort_order = EXCLUDED.sort_order;
INSERT INTO programmes (name, slug, description, sort_order) VALUES ('KNEC Courses', 'knec-courses', 'Kenya National Examinations Council (KNEC) Craft, Artisan, and Diploma TVET courses, modules, and past examination papers.', 3) ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name, description = EXCLUDED.description, sort_order = EXCLUDED.sort_order;

-- Insert Department: AGRICULTURE AND AQUACULTURE DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'AGRICULTURE AND AQUACULTURE DEPARTMENT', 'agriculture-and-aquaculture-department', 'Accredited CDACC Agriculture, Agribusiness, Animal Production, Dairy, Horticulture, and Aquaculture TVET courses in Kenya.', 1
FROM programmes WHERE slug = 'modular-cdacc-courses-cycle-3'
ON CONFLICT (programme_id, slug) DO UPDATE SET name = EXCLUDED.name;

-- Insert Courses under AGRICULTURE AND AQUACULTURE DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRI-PRENEURSHIP LEVEL 6', 'agri-preneurship-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURE AND EXTENSION LEVEL 6', 'agriculture-and-extension-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ANIMAL PRODUCTION TECHNOLOGY LEVEL 6', 'animal-production-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY PLANT MANAGEMENT LEVEL 6', 'dairy-plant-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURAL TECHNOLOGIST LEVEL 6', 'horticultural-technologist-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURE AND EXTENSION LEVEL 5', 'agriculture-and-extension-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRIPRENEURSHIP LEVEL 5', 'agripreneurship-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ANIMAL PRODUCTION LEVEL 5', 'animal-production-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AQUACULTURE LEVEL 5', 'aquaculture-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY PLANT TECHNICIAN LEVEL 5', 'dairy-plant-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE LEVEL 5', 'horticulture-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRICULTURAL FARM ATTENDANT LEVEL 4', 'agricultural-farm-attendant-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRIPRENEURSHIP LEVEL 4', 'agripreneurship-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ANIMAL PRODUCTION TECHNOLOGY LEVEL 4', 'animal-production-technology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'APIARY ATTENDANCE LEVEL 4', 'apiary-attendance-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AQUACULTURE LEVEL 4', 'aquaculture-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEE PRODUCTS PROCESSING LEVEL 4', 'bee-products-processing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY FARM OPERATOR LEVEL 4', 'dairy-farm-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY PLANT TECHNOLOGY LEVEL 4', 'dairy-plant-technology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FARM MACHINERY AND EQUIPMENT OPERATOR LEVEL 4', 'farm-machinery-and-equipment-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GENERAL AGRICULTURE LEVEL 4', 'general-agriculture-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE FARM ATTENDANT LEVEL 4', 'horticulture-farm-attendant-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LIVESTOCK FEED PRODUCER LEVEL 4', 'livestock-feed-producer-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PIG PRODUCTION OPERATOR LEVEL 4', 'pig-production-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (KIENYEJI CHICKEN) PRODUCTION LEVEL 4', 'poultry-kienyeji-chicken-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (LAYER PRODUCTION) OPERATOR LEVEL 4', 'poultry-layer-production-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY BROILER PRODUCTION LEVEL 4', 'poultry-broiler-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY HATCHERY OPERATOR LEVEL 4', 'poultry-hatchery-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AGRIPRENEURSHIP LEVEL 3', 'agripreneurship-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AQUACULTURE LEVEL 3', 'aquaculture-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEE HIVES AND BEE EQUIPMENT CONSTRUCTION LEVEL 3', 'bee-hives-and-bee-equipment-construction-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DAIRY FARM ATTENDANCE LEVEL 3', 'dairy-farm-attendance-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HORTICULTURE LEVEL 3', 'horticulture-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PASSION FRUIT PRODUCER AND PROCESSOR LEVEL 3', 'passion-fruit-producer-and-processor-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PIG PRODUCTION OPERATOR LEVEL 3', 'pig-production-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (BROILER) PRODUCTION OPERATOR LEVEL 3', 'poultry-broiler-production-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (KIENYEJI CHICKEN) PRODUCTION OPERATOR LEVEL 3', 'poultry-kienyeji-chicken-production-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY (LAYER) PRODUCTION OPERATOR LEVEL 3', 'poultry-layer-production-operator-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'POULTRY LAYER PRODUCTION OPERATOR LEVEL 3', 'poultry-layer-production-operator-level-3-2', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'agriculture-and-aquaculture-department'
ON CONFLICT (department_id, slug) DO UPDATE SET name = EXCLUDED.name, level = EXCLUDED.level;

-- Insert Modules and Units for AGRI-PRENEURSHIP LEVEL 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'ESTABLISH AGRI-ENTERPRISE', 'establish-agri-enterprise', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'KEEP AGRI-ENTERPRISE RECORDS', 'keep-agri-enterprise-records', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'MAINTAIN PRODUCT AND SERVICE QUALITY', 'maintain-product-and-service-quality', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES', 'market-agri-enterprise-products-and-services', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'OPERATE AGRI-ENTERPRISE', 'operate-agri-enterprise', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'DEVELOP AGRI-ENTERPRISE BUSINESS PLAN', 'develop-agri-enterprise-business-plan', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, 'MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES', 'market-agri-enterprise-products-and-services-module-2', canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
LEFT JOIN units canon ON canon.course_id = c.id AND canon.slug = 'market-agri-enterprise-products-and-services'
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id, canonical_unit_id = EXCLUDED.canonical_unit_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'MARKET AGRICULTURAL PRODUCTS AND SERVICES ONLINE', 'market-agricultural-products-and-services-online', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'OPERATE A SMALL AGRI-ENTERPRISE', 'operate-a-small-agri-enterprise', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'SUPERVISE AGRIPRENEURAL OPERATIONS', 'supervise-agripreneural-operations', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'APPLY COMMUNICATION SKILLS', 'apply-communication-skills', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'APPLY DIGITAL LITERACY', 'apply-digital-literacy', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'START AGRI-ENTERPRISE', 'start-agri-enterprise', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'APPLY ICT IN AGRI-ENTERPRISE', 'apply-ict-in-agri-enterprise', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'CARRY OUT CROP PRODUCTION', 'carry-out-crop-production', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'DEVELOP AGRI-ENTERPRISE RECORDS', 'develop-agri-enterprise-records', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'PERFORM AGRI-ENTERPRISE FARM BUDGETING', 'perform-agri-enterprise-farm-budgeting', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'APPLY GEOGRAPHIC INFORMATION SYSTEMS', 'apply-geographic-information-systems', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'CARRY OUT ANIMAL PRODUCTION', 'carry-out-animal-production', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'APPLY SOIL SCIENCE PRINCIPLES', 'apply-soil-science-principles', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'OPERATE FARM IRRIGATION AND DRAINAGE SYSTEMS', 'operate-farm-irrigation-and-drainage-systems', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 8, 'Module 8'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'OPERATE FARM MACHINERY', 'operate-farm-machinery', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 8
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'PREPARE AGRI-ENTERPRISE WORK PLAN', 'prepare-agri-enterprise-work-plan', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 8
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 9, 'Module 9'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, module_number) DO UPDATE SET title = EXCLUDED.title;
INSERT INTO units (module_id, course_id, name, slug, published)
SELECT m.id, c.id, 'CARRY OUT AGRICULTURE MARKET RESEARCH', 'carry-out-agriculture-market-research', true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 9
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id;
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, 'DEVELOP AGRI-ENTERPRISE BUSINESS PLAN', 'develop-agri-enterprise-business-plan-module-9', canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 9
LEFT JOIN units canon ON canon.course_id = c.id AND canon.slug = 'develop-agri-enterprise-business-plan'
WHERE d.slug = 'agriculture-and-aquaculture-department' AND c.slug = 'agri-preneurship-level-6'
ON CONFLICT (course_id, slug) DO UPDATE SET name = EXCLUDED.name, module_id = EXCLUDED.module_id, canonical_unit_id = EXCLUDED.canonical_unit_id;

-- Insert Resources for UNIT: ESTABLISH AGRI-ENTERPRISE
DELETE FROM resources WHERE unit_id IN (
  SELECT u.id FROM units u
  JOIN courses c ON c.id = u.course_id
  WHERE c.slug = 'agri-preneurship-level-6' AND u.slug = 'establish-agri-enterprise'
);
INSERT INTO resources (unit_id, type, title, file_url, year, sort_order)
SELECT u.id, 'cutting_list'::resource_type, 'Download Cutting List', 'https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_cl.pdf', 2025, 1
FROM units u
JOIN courses c ON c.id = u.course_id
WHERE c.slug = 'agri-preneurship-level-6' AND u.slug = 'establish-agri-enterprise';
INSERT INTO resources (unit_id, type, title, file_url, year, sort_order)
SELECT u.id, 'candidate_tool'::resource_type, 'Download Candidate Tool', 'https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_ct.pdf', 2025, 2
FROM units u
JOIN courses c ON c.id = u.course_id
WHERE c.slug = 'agri-preneurship-level-6' AND u.slug = 'establish-agri-enterprise';
INSERT INTO resources (unit_id, type, title, file_url, year, sort_order)
SELECT u.id, 'assessor_guide'::resource_type, 'Download Assessor Guide', 'https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_ag.pdf', 2025, 3
FROM units u
JOIN courses c ON c.id = u.course_id
WHERE c.slug = 'agri-preneurship-level-6' AND u.slug = 'establish-agri-enterprise';

COMMIT;