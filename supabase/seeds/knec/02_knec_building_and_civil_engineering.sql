-- ==============================================================================
-- SEED SCRIPT FOR: BUILDING AND CIVIL ENGINEERING (KNEC COURSES)
-- Total Courses: 12 | Total Units: 169
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

-- 2. Upsert Department under KNEC: BUILDING AND CIVIL ENGINEERING
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUILDING AND CIVIL ENGINEERING', 'building-and-civil-engineering', 'KNEC Diploma, Craft Certificate, and Artisan past examination papers and modules in Building Technology, Civil Engineering, Architecture, Plumbing, and Masonry.', 2
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering'
);

-- 4. Insert KNEC Courses under BUILDING AND CIVIL ENGINEERING
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN BUILDING TECHNOLOGY', 'diploma-in-building-technology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN CIVIL ENGINEERING', 'diploma-in-civil-engineering', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN QUANTITY SURVEYING', 'diploma-in-quantity-surveying', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN ROAD TRANSPORT', 'diploma-in-road-transport', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN LAND SURVEYING', 'diploma-in-land-surveying', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN PETROLEUM AND GEOSCIENCE', 'diploma-in-petroleum-and-geoscience', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN ARCHITECTURE', 'diploma-in-architecture', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN BUILDING TECHNOLOGY', 'certificate-in-building-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN PLUMBING', 'certificate-in-plumbing', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CRAFT CERTIFICATE IN LAND SURVEYING', 'craft-certificate-in-land-surveying', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN PLUMBING', 'artisan-in-plumbing', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN MASONRY', 'artisan-in-masonry', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'building-and-civil-engineering';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN BUILDING TECHNOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-building-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MATHEMATICS I', 'mathematics-i', NULL::text),
  ('PHYSICAL SCIENCE', 'physical-science', NULL::text),
  ('BUILDING CONSTRUCTION I', 'building-construction-i', NULL::text),
  ('TECHNICAL DRAWING', 'technical-drawing', NULL::text),
  ('CONSTRUCTION PLANT', 'construction-plant', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('CONSTRUCTION MATERIALS I', 'construction-materials-i', NULL::text),
  ('STRUCTURES I', 'structures-i', NULL::text),
  ('SURVEYING I', 'surveying-i', NULL::text),
  ('WORKSHOP TECHNOLOGY I', 'workshop-technology-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-building-technology';

-- Module 2: Module II (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-building-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUILDING CONSTRUCTION II', 'building-construction-ii', NULL::text),
  ('DRAWING II', 'drawing-ii', NULL::text),
  ('CONSTRUCTION MANAGEMENT I', 'construction-management-i', NULL::text),
  ('CONCRETE TECHNOLOGY II', 'concrete-technology-ii', NULL::text),
  ('GEOTECHNOLOGY II', 'geotechnology-ii', NULL::text),
  ('STRUCTURES II', 'structures-ii', NULL::text),
  ('WORKSHOP TECHNOLOGY II (ELECTRICAL)', 'workshop-technology-ii-electrical', NULL::text),
  ('SURVEYING II', 'surveying-ii', NULL::text),
  ('MATHEMATICS II', 'mathematics-ii', NULL::text),
  ('ESTIMATING AND COSTING I', 'estimating-and-costing-i', NULL::text),
  ('MEASUREMENT OF BUILDING AND CIVIL ENGINEERING WORKS', 'measurement-of-building-and-civil-engineering-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-building-technology';

-- Module 3: Module III (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-building-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('BUILDING CONSTRUCTION III', 'building-construction-iii', NULL::text),
  ('DRAWING III', 'drawing-iii', NULL::text),
  ('BUILDING SERVICES', 'building-services', NULL::text),
  ('CONSTRUCTION MANAGEMENT II', 'construction-management-ii', NULL::text),
  ('ESTIMATING AND COSTING II', 'estimating-and-costing-ii', NULL::text),
  ('MATHEMATICS III', 'mathematics-iii', NULL::text),
  ('SURVEYING III', 'surveying-iii', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('STRUCTURES III', 'structures-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-building-technology';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN CIVIL ENGINEERING [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-civil-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MATHEMATICS I', 'mathematics-i', NULL::text),
  ('PHYSICAL SCIENCE', 'physical-science', NULL::text),
  ('BUILDING CONSTRUCTION I', 'building-construction-i', NULL::text),
  ('TECHNICAL DRAWING', 'technical-drawing', NULL::text),
  ('CONSTRUCTION PLANT', 'construction-plant', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('CONSTRUCTION MATERIALS I', 'construction-materials-i', NULL::text),
  ('STRUCTURES I', 'structures-i', NULL::text),
  ('SURVEYING I', 'surveying-i', NULL::text),
  ('WORKSHOP TECHNOLOGY I(MECHANICAL)', 'workshop-technology-i-mechanical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-civil-engineering';

-- Module 2: Module II (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-civil-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUILDING CONSTRUCTION II', 'building-construction-ii', NULL::text),
  ('CIVIL CONSTRUCTION', 'civil-construction', NULL::text),
  ('TRANSPORT ENGINEERING I', 'transport-engineering-i', NULL::text),
  ('CONSTRUCTION MANAGEMENT I', 'construction-management-i', NULL::text),
  ('WORKSHOP TECHNOLOGY II (ELECTRICAL)', 'workshop-technology-ii-electrical', NULL::text),
  ('WATER SUPPLY', 'water-supply', NULL::text),
  ('CONCRETE TECHNOLOGY II', 'concrete-technology-ii', NULL::text),
  ('GEOTECHNOLOGY II', 'geotechnology-ii', NULL::text),
  ('STRUCTURES II', 'structures-ii', NULL::text),
  ('SURVEYING II', 'surveying-ii', NULL::text),
  ('MATHEMATICS II', 'mathematics-ii', NULL::text),
  ('ESTIMATING AND COSTING I', 'estimating-and-costing-i', NULL::text),
  ('MEASUREMENT OF BUILDING AND CIVIL ENGINEERING WORKS', 'measurement-of-building-and-civil-engineering-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-civil-engineering';

-- Module 3: Module III (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-civil-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('TRANSPORT ENGINEERING II', 'transport-engineering-ii', NULL::text),
  ('BUILDING CONSTRUCTION III', 'building-construction-iii', NULL::text),
  ('CONSTRUCTION MANAGEMENT II', 'construction-management-ii', NULL::text),
  ('ESTIMATING AND COSTING II', 'estimating-and-costing-ii', NULL::text),
  ('MATHEMATICS III', 'mathematics-iii', NULL::text),
  ('SURVEYING III', 'surveying-iii', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('STRUCTURES III', 'structures-iii', NULL::text),
  ('CIVIL ENGINEERING CONSTRUCTION', 'civil-engineering-construction', NULL::text),
  ('CIVIL ENGINEERING DRAWING', 'civil-engineering-drawing', NULL::text),
  ('SOIL MECHANICS AND HYDRAULICS', 'soil-mechanics-and-hydraulics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-civil-engineering';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN QUANTITY SURVEYING [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-quantity-surveying';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-quantity-surveying';

-- Module 3: Module III (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-quantity-surveying';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('SURVEYING', 'surveying', NULL::text),
  ('MEASUREMENT OF BUILDING AND CIVIL ENGINEERING WORKS', 'measurement-of-building-and-civil-engineering-works', NULL::text),
  ('BUILDING ECONOMICS', 'building-economics', NULL::text),
  ('CONSTRUCTION LAW', 'construction-law', NULL::text),
  ('ESTIMATING AND COSTING', 'estimating-and-costing', NULL::text),
  ('CIVIL ENGINEERING CONSTRUCTION', 'civil-engineering-construction', NULL::text),
  ('DRAWING', 'drawing', NULL::text),
  ('BUILDING CONSTRUCTION', 'building-construction', NULL::text),
  ('CONSTRUCTION MANAGEMENT', 'construction-management', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-quantity-surveying';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN ROAD TRANSPORT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-road-transport';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MOTOR VEHICLE CARE AND SERVICING', 'motor-vehicle-care-and-servicing', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (THEORY)', 'information-and-communication-technology-theory', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-and-communication-technology-practical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-road-transport';

-- Module 2: Module II (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-road-transport';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ROAD TRANSPORT MANAGEMENT', 'road-transport-management', NULL::text),
  ('BASIC MOTOR VEHICLE CARE AND SERVICING', 'basic-motor-vehicle-care-and-servicing', NULL::text),
  ('LOGISTICS AND PHYSICAL DISTRIBUTION', 'logistics-and-physical-distribution', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-road-transport';

-- Module 3: Module III (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-road-transport';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('FLEET MANAGEMENT', 'fleet-management', NULL::text),
  ('LABOUR AND INDUSTRIAL RELATIONS', 'labour-and-industrial-relations', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-road-transport';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN LAND SURVEYING [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-land-surveying';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-land-surveying';

-- Module 3: Module III (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-land-surveying';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('LAND LAW', 'land-law', NULL::text),
  ('CADASTRAL SURVEYING', 'cadastral-surveying', NULL::text),
  ('MANAGEMENT', 'management', NULL::text),
  ('PHOTOGRAMMETRY AND REMOTE SENSING', 'photogrammetry-and-remote-sensing', NULL::text),
  ('CARTOGRAPHY', 'cartography', NULL::text),
  ('SURVEY CONTROL', 'survey-control', NULL::text),
  ('ENGINEERING SURVEYING', 'engineering-surveying', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-land-surveying';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN PETROLEUM AND GEOSCIENCE [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-petroleum-and-geoscience';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PETROLEUM GEOLOGY AND EXPLORATION TECHNIQUES', 'petroleum-geology-and-exploration-techniques', NULL::text),
  ('APPLIED MATHEMATICS', 'applied-mathematics', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('ENGINEERING DRAWING', 'engineering-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-petroleum-and-geoscience';

-- Module 2: Module II (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-petroleum-and-geoscience';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLIED MATHEMATICS', 'applied-mathematics-module-2', 'applied-mathematics'),
  ('ROCK AND FLUIDS', 'rock-and-fluids', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-petroleum-and-geoscience';

-- Module 3: Module III (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-petroleum-and-geoscience';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PETROLEUM EXPLORATION AND DRILLING', 'petroleum-exploration-and-drilling', NULL::text),
  ('PROJECT MANAGEMENT', 'project-management', NULL::text),
  ('REMOTE SENSING', 'remote-sensing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-petroleum-and-geoscience';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN ARCHITECTURE [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-architecture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MATHEMATICS I', 'mathematics-i', NULL::text),
  ('PHYSICAL SCIENCE', 'physical-science', NULL::text),
  ('BUILDING CONSTRUCTION I', 'building-construction-i', NULL::text),
  ('TECHNICAL DRAWING', 'technical-drawing', NULL::text),
  ('CONSTRUCTION PLANT', 'construction-plant', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('CONSTRUCTION MATERIALS I', 'construction-materials-i', NULL::text),
  ('STRUCTURES I', 'structures-i', NULL::text),
  ('SURVEYING I', 'surveying-i', NULL::text),
  ('WORKSHOP TECHNOLOGY I', 'workshop-technology-i', NULL::text),
  ('ARCHITECTURE COMMUNICATION AND TECHNICAL DRAWING', 'architecture-communication-and-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-architecture';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-architecture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONCRETE TECHNOLOGY II', 'concrete-technology-ii', NULL::text),
  ('GEOTECHNOLOGY II', 'geotechnology-ii', NULL::text),
  ('STRUCTURES II', 'structures-ii', NULL::text),
  ('SURVEYING II', 'surveying-ii', NULL::text),
  ('MATHEMATICS II', 'mathematics-ii', NULL::text),
  ('ARCHITECTURE DESIGN AND LANDSCAPING', 'architecture-design-and-landscaping', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-architecture';

-- Module 3: Module III (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-architecture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('BUILDING CONSTRUCTION III', 'building-construction-iii', NULL::text),
  ('DRAWING III', 'drawing-iii', NULL::text),
  ('BUILDING SERVICES', 'building-services', NULL::text),
  ('CONSTRUCTION MANAGEMENT II', 'construction-management-ii', NULL::text),
  ('ESTIMATING AND COSTING II', 'estimating-and-costing-ii', NULL::text),
  ('MATHEMATICS III', 'mathematics-iii', NULL::text),
  ('SURVEYING III', 'surveying-iii', NULL::text),
  ('ENVIRONMENTAL PLANNING AND MANAGEMENT', 'environmental-planning-and-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'diploma-in-architecture';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN BUILDING TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'certificate-in-building-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BUILDING CONSTRUCTION I', 'building-construction-i', NULL::text),
  ('DRAWING', 'drawing', NULL::text),
  ('CARPENTRY', 'carpentry', NULL::text),
  ('CONSTRUCTION MATERIALS I', 'construction-materials-i', NULL::text),
  ('CONSTRUCTION PLANT', 'construction-plant', NULL::text),
  ('SITE MANAGEMENT', 'site-management', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY', 'information-and-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('MATHEMATICS I', 'mathematics-i', NULL::text),
  ('PHYSICAL SCIENCE', 'physical-science', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'certificate-in-building-technology';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'certificate-in-building-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MATHEMATICS II', 'mathematics-ii', NULL::text),
  ('BUILDING CONSTRUCTION II', 'building-construction-ii', NULL::text),
  ('COMPUTER AIDED DESIGN', 'computer-aided-design', NULL::text),
  ('BUILDING SERVICES', 'building-services', NULL::text),
  ('JOINERY', 'joinery', NULL::text),
  ('CONSTRUCTION MATERIALS II', 'construction-materials-ii', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'certificate-in-building-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN PLUMBING [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'certificate-in-plumbing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('PLUMBING CRAFT THEORY', 'plumbing-craft-theory', NULL::text),
  ('SITE AND WORKSHOP MANAGEMENT', 'site-and-workshop-management', NULL::text),
  ('TECHNICAL DRAWING', 'technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'certificate-in-plumbing';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'certificate-in-plumbing';

-- ------------------------------------------------------------------------------
-- Course: CRAFT CERTIFICATE IN LAND SURVEYING [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'craft-certificate-in-land-surveying';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'craft-certificate-in-land-surveying';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('WORK PLANNING AND MANAGEMENT', 'work-planning-and-management', NULL::text),
  ('LAND SURVEYING THEORY', 'land-surveying-theory', NULL::text),
  ('LAND SURVEYING CRAFT PRACTICE', 'land-surveying-craft-practice', NULL::text),
  ('SURVEY DRAWING', 'survey-drawing', NULL::text),
  ('CARTOGRAPHY', 'cartography', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'craft-certificate-in-land-surveying';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN PLUMBING [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'artisan-in-plumbing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLIED GEOMETRY', 'applied-geometry', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('SCIENCE', 'science', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'artisan-in-plumbing';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN MASONRY [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'artisan-in-masonry';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLIED GEOMETRY', 'applied-geometry', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('SCIENCE', 'science', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering' AND c.slug = 'artisan-in-masonry';

COMMIT;
-- Verification Query: Check courses and units inserted for BUILDING AND CIVIL ENGINEERING
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'building-and-civil-engineering'
-- GROUP BY d.name;