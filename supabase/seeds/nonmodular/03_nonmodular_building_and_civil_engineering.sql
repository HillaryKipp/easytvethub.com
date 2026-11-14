-- ==============================================================================
-- SEED SCRIPT FOR: BUILDING AND CIVIL ENGINEERING DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 20 | Total Units: 336
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

-- 2. Upsert Department under Cycle 1 & 2: BUILDING AND CIVIL ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUILDING AND CIVIL ENGINEERING DEPARTMENT', 'building-and-civil-engineering-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Building and Civil Engineering courses in Architecture, Civil Engineering, Quantity Surveying, Plumbing, and Masonry.', 3
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
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department'
);

-- 4. Insert Non-Modular Courses under BUILDING AND CIVIL ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARCHITECTURAL TECHNOLOGY LEVEL 6', 'architectural-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING TECHNOLOGY LEVEL 6', 'building-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CIVIL ENGINEERING LEVEL 6', 'civil-engineering-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INTERIOR DESIGN LEVEL 6', 'interior-design-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LAND SURVEYING LEVEL 6', 'land-surveying-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'QUANTITY SURVEYING LEVEL 6', 'quantity-surveying-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARCHITECTURAL DRAFTSMANSHIP LEVEL 5', 'architectural-draftsmanship-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING TECHNOLOGY LEVEL 5', 'building-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTRY AND JOINERY LEVEL 5', 'carpentry-and-joinery-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INTERIOR DESIGN LEVEL 5', 'interior-design-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LAND SURVEY AND MAPPING LEVEL 5', 'land-survey-and-mapping-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 5', 'plumbing-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING ARTISAN (MASONRY) LEVEL 4', 'building-artisan-masonry-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTERY AND JOINERY LEVEL 4', 'carpentery-and-joinery-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTRY AND JOINERY LEVEL 4', 'carpentry-and-joinery-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CONSTRUCTION SURVEY LEVEL 4', 'construction-survey-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INTERIOR DESIGN LEVEL 4', 'interior-design-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MASONRY LEVEL 4', 'masonry-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 4', 'plumbing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 3', 'plumbing-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ARCHITECTURAL TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';

-- Section 2: Common Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BUILDING MATERIALS SCIENCE', 'apply-building-materials-science', NULL::text),
  ('APPLY HISTORY OF ARCHITECTURE.', 'apply-history-of-architecture', NULL::text),
  ('APPLY MATHEMATICAL SKILLS', 'apply-mathematical-skills', NULL::text),
  ('APPLY PRINCIPLES OF BUILDING TECHNOLOGY AND SERVICES', 'apply-principles-of-building-technology-and-services', NULL::text),
  ('APPLY PRINCIPLES OF STRUCTURAL DESIGN', 'apply-principles-of-structural-design', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';

-- Section 3: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ALTERNATIVE BUILDING TECHNOLOGY', 'apply-alternative-building-technology', NULL::text),
  ('COST ARCHITECTURAL PROJECTS', 'cost-architectural-projects', NULL::text),
  ('DESIGN AND DETAIL ARCHITECTURAL PROJECTS', 'design-and-detail-architectural-projects', NULL::text),
  ('INSTALL BUILDING FINISHES AND FITTINGS', 'install-building-finishes-and-fittings', NULL::text),
  ('LANDSCAPE ARCHITECTURAL PROJECTS', 'landscape-architectural-projects', NULL::text),
  ('MANAGE CONSTRUCTION SITE', 'manage-construction-site', NULL::text),
  ('PRODUCE ARCHITECTURAL MODELS', 'produce-architectural-models', NULL::text),
  ('PRODUCE ARCHITECTURAL PERSPECTIVES', 'produce-architectural-perspectives', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUILDING TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BUILDING MATERIALS SCIENCE', 'apply-building-materials-science', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';

-- Section 3: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('EXECUTE BUILDING EXTERNAL WORKS', 'execute-building-external-works', NULL::text),
  ('EXECUTE BUILDING FINISHES', 'execute-building-finishes', NULL::text),
  ('EXECUTE BUILDING TEMPORARY WORKS', 'execute-building-temporary-works', NULL::text),
  ('EXECUTE SITE PRELIMINARY WORKS', 'execute-site-preliminary-works', NULL::text),
  ('EXECUTE SUBSTRUCTURE WORKS', 'execute-substructure-works', NULL::text),
  ('EXECUTE SUPERSTRUCTURE WORKS', 'execute-superstructure-works', NULL::text),
  ('INSTALL BUILDING DOORS AND WINDOWS', 'install-building-doors-and-windows', NULL::text),
  ('INSTALL BUILDING SERVICES', 'install-building-services', NULL::text),
  ('MANAGE CONSTRUCTION MATERIALS, PLANT, TOOLS AND EQUIPMENT', 'manage-construction-materials-plant-tools-and-equipment', NULL::text),
  ('PRODUCE BUILDING DRAWINGS', 'produce-building-drawings', NULL::text),
  ('PRODUCE MASONRY UNITS', 'produce-masonry-units', NULL::text),
  ('SUPERVISE A CONSTRUCTION PROJECT', 'supervise-a-construction-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: CIVIL ENGINEERING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MATHEMATICAL SKILLS', 'apply-mathematical-skills', NULL::text),
  ('APPLY WATER RESOURCE, WATER AND SANITATION SERVICES MANAGEMENT PRINCIPLES', 'apply-water-resource-water-and-sanitation-services-management-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PERFORM MEASUREMENT OF WORKS AND COST ESTIMATION', 'perform-measurement-of-works-and-cost-estimation', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Section 3: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY WATER AND WASTEWATER TECHNOLOGY LEVEL 6', 'apply-water-and-wastewater-technology-level-6', NULL::text),
  ('CARRY OUT BUILDING WORKS', 'carry-out-building-works', NULL::text),
  ('CARRY OUT ROAD CONSTRUCTION WORKS', 'carry-out-road-construction-works', NULL::text),
  ('CONDUCT MATERIAL TESTING', 'conduct-material-testing', NULL::text),
  ('CONSTRUCT ON-SITE SANITATION FACILITIES', 'construct-on-site-sanitation-facilities', NULL::text),
  ('CONSTRUCT WASTE WATER INFRASTRUCTURE', 'construct-waste-water-infrastructure', NULL::text),
  ('DESIGN BASIC PAVEMENT STRUCTURES', 'design-basic-pavement-structures', NULL::text),
  ('DESIGN ENGINEERING STRUCTURES.', 'design-engineering-structures', NULL::text),
  ('DESIGN ONSITE SANITATION FACILITIES', 'design-onsite-sanitation-facilities', NULL::text),
  ('MANAGE CIVIL ENGINEERING PROJECTS', 'manage-civil-engineering-projects', NULL::text),
  ('MANAGE WATER RESOURCES QUALITY', 'manage-water-resources-quality', NULL::text),
  ('O DESIGN WASTEWATER COLLECTION AND TREATMENT INFRASTRUCTURE', 'o-design-wastewater-collection-and-treatment-infrastructure', NULL::text),
  ('PERFORM HIGHWAY SURVEY', 'perform-highway-survey', NULL::text),
  ('PERFORM STRUCTURAL DESIGN AND ANALYSIS', 'perform-structural-design-and-analysis', NULL::text),
  ('PRODUCE BUILDING DRAWINGS', 'produce-building-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- ------------------------------------------------------------------------------
-- Course: INTERIOR DESIGN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-6';

-- Section 2: Core Units of Competency (16 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN FUNDAMENTALS', 'apply-design-fundamentals', NULL::text),
  ('APPLYING BUILDING MATERIALS SCIENCE', 'applying-building-materials-science', NULL::text),
  ('COMMUNICATE INTERIOR DESIGN', 'communicate-interior-design', NULL::text),
  ('CONCEPTUALIZE INTERIOR DESIGN', 'conceptualize-interior-design', NULL::text),
  ('CONSTRUCT BUILDING ELEMENTS AND COMPONENTS', 'construct-building-elements-and-components', NULL::text),
  ('CREATE INTERIOR DESIGN STYLES', 'create-interior-design-styles', NULL::text),
  ('DEMONSTRATE COLOUR THEORY', 'demonstrate-colour-theory', NULL::text),
  ('DEMONSTRATE UNDERSTANDING INFORMATION COMMUNICATION TECHNOLOGY', 'demonstrate-understanding-information-communication-technology', NULL::text),
  ('DESIGN ACOUSTICS INTERIOR SPACE', 'design-acoustics-interior-space', NULL::text),
  ('DEVELOP INTERIOR FURNITURE AND FIXTURES', 'develop-interior-furniture-and-fixtures', NULL::text),
  ('INTERIOR DESIGN COSTING', 'interior-design-costing', NULL::text),
  ('MANAGE INTERIOR DESIGN PROJECTS', 'manage-interior-design-projects', NULL::text),
  ('MANAGE INTERIOR FITTINGS AND ACCESSORIES', 'manage-interior-fittings-and-accessories', NULL::text),
  ('PERFORM INTERIOR DESIGN LIGHTING', 'perform-interior-design-lighting', NULL::text),
  ('PERFORM INTERIOR DESIGN SOFT FURNISHING', 'perform-interior-design-soft-furnishing', NULL::text),
  ('PERFORM INTERIOR FINISHING', 'perform-interior-finishing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-6';

-- ------------------------------------------------------------------------------
-- Course: LAND SURVEYING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';

-- Section 2: Common Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY LAND LAWS', 'apply-land-laws', NULL::text),
  ('APPLY PRINCIPLES OF GIS', 'apply-principles-of-gis', NULL::text),
  ('APPLY PRINCIPLES OF PHOTOGRAMMETRY AND REMOTE SENSING', 'apply-principles-of-photogrammetry-and-remote-sensing', NULL::text),
  ('CONDUCT CADASTRAL SURVEY', 'conduct-cadastral-survey', NULL::text),
  ('OPERATE SURVEY INSTRUMENTS', 'operate-survey-instruments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONDUCT CADASTRAL SURVEY', 'conduct-cadastral-survey-part-3', 'conduct-cadastral-survey'),
  ('CONDUCT ENGINEERING SURVEY', 'conduct-engineering-survey', NULL::text),
  ('CONDUCT HYDROGRAPHIC SURVEY', 'conduct-hydrographic-survey', NULL::text),
  ('CONDUCT MINING SURVEY', 'conduct-mining-survey', NULL::text),
  ('CONDUCT TOPOGRAPHICAL SURVEY', 'conduct-topographical-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-surveying-level-6';

-- ------------------------------------------------------------------------------
-- Course: QUANTITY SURVEYING LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONDUCT ENGINEERING SURVEY', 'conduct-engineering-survey', NULL::text),
  ('EXECUTE CONSTRUCTION WORKS', 'execute-construction-works', NULL::text),
  ('MANAGE CONSTRUCTION PROJECT FINANCE', 'manage-construction-project-finance', NULL::text),
  ('MANAGE PROJECT CONTRACTS', 'manage-project-contracts', NULL::text),
  ('PREPARE BILLS OF QUANTITIES', 'prepare-bills-of-quantities', NULL::text),
  ('PRODUCE BUILDING DRAWINGS', 'produce-building-drawings', NULL::text),
  ('PRODUCE CIVIL ENGINEERING DRAWINGS', 'produce-civil-engineering-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'quantity-surveying-level-6';

-- ------------------------------------------------------------------------------
-- Course: ARCHITECTURAL DRAFTSMANSHIP LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MATHEMATICAL SKILLS', 'apply-mathematical-skills', NULL::text),
  ('APPLY PRINCIPLES OF BUILDING TECHNOLOGY', 'apply-principles-of-building-technology', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APLLY HISTORY OF ARCHITECTURE', 'aplly-history-of-architecture', NULL::text),
  ('DETAIL ARCHITECTURAL PROJECTS', 'detail-architectural-projects', NULL::text),
  ('INSTALL BUILDING FINISHES AND FITTINGS', 'install-building-finishes-and-fittings', NULL::text),
  ('PRODUCE ARCHITECTURAL MODELS', 'produce-architectural-models', NULL::text),
  ('PRODUCE ARCHITECTURAL PERSPECTIVES', 'produce-architectural-perspectives', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architectural-draftsmanship-level-5';

-- ------------------------------------------------------------------------------
-- Course: BUILDING TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Section 2: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENTIFIC PRINCIPLES', 'apply-scientific-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Section 3: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONSTRUCT ROOF STRUCTURE', 'construct-roof-structure', NULL::text),
  ('EXECUTE BUILDING EXTERNAL WORKS', 'execute-building-external-works', NULL::text),
  ('EXECUTE BUILDING SUBSTRUCTURE WORKS', 'execute-building-substructure-works', NULL::text),
  ('EXECUTE BUILDING SUPERSTRUCTURE WORKS', 'execute-building-superstructure-works', NULL::text),
  ('INSTALL DOORS AND WINDOWS', 'install-doors-and-windows', NULL::text),
  ('PERFORM BUILDING FINISHES', 'perform-building-finishes', NULL::text),
  ('PERFORM SITE PRELIMINARY WORKS', 'perform-site-preliminary-works', NULL::text),
  ('SUPERVISE CONSTRUCTION PROJECT', 'supervise-construction-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: CARPENTRY AND JOINERY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENCE', 'apply-science', NULL::text),
  ('EXECUTE TEMPORARY WORKS', 'execute-temporary-works', NULL::text),
  ('MANAGE SITES AND WORKSHOPS', 'manage-sites-and-workshops', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONSTRUCT & ERECT TIMBER FLOORS AND PREFABRICATED BUILDINGS', 'construct-and-erect-timber-floors-and-prefabricated-buildings', NULL::text),
  ('CONSTRUCT AND ERECT ROOF STRUCTURES', 'construct-and-erect-roof-structures', NULL::text),
  ('CONSTRUCT DOORS AND DOOR FRAMES', 'construct-doors-and-door-frames', NULL::text),
  ('CONSTRUCT FURNITURE ITEMS', 'construct-furniture-items', NULL::text),
  ('CONSTRUCT TIMBER STAIRS', 'construct-timber-stairs', NULL::text),
  ('CONSTRUCT WINDOWS AND WINDOW FRAMES', 'construct-windows-and-window-frames', NULL::text),
  ('PERFORM JOINER’S SECOND FIXING', 'perform-joiner-s-second-fixing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- ------------------------------------------------------------------------------
-- Course: INTERIOR DESIGN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN FUNDAMENTALS', 'apply-design-fundamentals', NULL::text),
  ('CONCEPTUALIZE INTERIOR DESIGN', 'conceptualize-interior-design', NULL::text),
  ('CONSTRUCT BUILDING ELEMENTS AND COMPONENTS', 'construct-building-elements-and-components', NULL::text),
  ('DEVELOP INTERIOR FURNITURE AND FITTINGS', 'develop-interior-furniture-and-fittings', NULL::text),
  ('PERFORM INTERIOR DESIGN DRAWINGS', 'perform-interior-design-drawings', NULL::text),
  ('PERFORM INTERIOR DESIGN FINISHING', 'perform-interior-design-finishing', NULL::text),
  ('PERFORM INTERIOR DESIGN SOFT FURNISHING AND ACCESSORIES', 'perform-interior-design-soft-furnishing-and-accessories', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-5';

-- ------------------------------------------------------------------------------
-- Course: LAND SURVEY AND MAPPING LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-and-mapping-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-and-mapping-level-5';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-and-mapping-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('CONDUCT ENGINEERING SURVEY', 'conduct-engineering-survey', NULL::text),
  ('CONDUCT TOPOGRAPHICAL SURVEY', 'conduct-topographical-survey', NULL::text),
  ('OPERATE SURVEY INSTRUMENTS', 'operate-survey-instruments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-and-mapping-level-5';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Section 2: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENTIFIC PRINCIPLES', 'apply-scientific-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM', 'install-drainage-system', NULL::text),
  ('INSTALL FIRE CONTROL SYSTEMS', 'install-fire-control-systems', NULL::text),
  ('INSTALL RAINWATER HARVESTING AND DISPOSAL', 'install-rainwater-harvesting-and-disposal', NULL::text),
  ('INSTALL SANITARY APPLIANCE', 'install-sanitary-appliance', NULL::text),
  ('INSTALL WATER STORAGE SYSTEM AND AUXILIARY FITTINGS', 'install-water-storage-system-and-auxiliary-fittings', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM', 'install-water-supply-system', NULL::text),
  ('MAINTAIN PLUMBING SYSTEMS', 'maintain-plumbing-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- ------------------------------------------------------------------------------
-- Course: BUILDING ARTISAN (MASONRY) LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';

-- Section 2: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BUILDING MATERIALS SCIENCE', 'apply-building-materials-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INSTALL BUILDING SERVICES', 'install-building-services', NULL::text),
  ('PERFORM BUILDING FINISHES', 'perform-building-finishes', NULL::text),
  ('PERFORM SITE PRELIMINARY WORKS', 'perform-site-preliminary-works', NULL::text),
  ('PERFORM SUBSTRUCTURE WORKS', 'perform-substructure-works', NULL::text),
  ('PERFORM SUPERSTRUCTURE WORKS', 'perform-superstructure-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-artisan-masonry-level-4';

-- ------------------------------------------------------------------------------
-- Course: CARPENTERY AND JOINERY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENCE', 'apply-science', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS', 'construct-temporary-works', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONSTRUCT & ERECT ROOF STRUCTURES', 'construct-and-erect-roof-structures', NULL::text),
  ('CONSTRUCT DOORS AND DOOR FRAMES', 'construct-doors-and-door-frames', NULL::text),
  ('CONSTRUCT FURNITURE ITEMS.', 'construct-furniture-items', NULL::text),
  ('CONSTRUCT TIMBER FLOORS AND PREFABRICATED BUILDINGS', 'construct-timber-floors-and-prefabricated-buildings', NULL::text),
  ('CONSTRUCT WINDOWS AND WINDOW FRAMES', 'construct-windows-and-window-frames', NULL::text),
  ('PERFORM JOINERS SECOND FIXING', 'perform-joiners-second-fixing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-4';

-- ------------------------------------------------------------------------------
-- Course: CARPENTRY AND JOINERY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- Section 2: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BASIC MATHEMATICS', 'basic-mathematics', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS.', 'construct-temporary-works', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CONSTRUCT AND ERECT ROOF STRUCTURES', 'construct-and-erect-roof-structures', NULL::text),
  ('CONSTRUCT DOOR AND DOOR FRAMES', 'construct-door-and-door-frames', NULL::text),
  ('CONSTRUCT FURNITURE ITEMS', 'construct-furniture-items', NULL::text),
  ('CONSTRUCT TIMBER FLOORS AND PREFABRICATED BUILDINGS', 'construct-timber-floors-and-prefabricated-buildings', NULL::text),
  ('CONSTRUCT WINDOWS AND WINDOW FRAMES', 'construct-windows-and-window-frames', NULL::text),
  ('PERFORM JOINERS SECOND FIXING', 'perform-joiners-second-fixing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- ------------------------------------------------------------------------------
-- Course: CONSTRUCTION SURVEY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'construction-survey-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'construction-survey-level-4';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'construction-survey-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ASSIST IN THE PREPARATION OF DETAILED DRAWINGS, CHARTS AND PLANS', 'assist-in-the-preparation-of-detailed-drawings-charts-and-plans', NULL::text),
  ('CALCULATE SURVEY DATA', 'calculate-survey-data', NULL::text),
  ('CALCULATE TRAVERSE AND TACHEOMETRY DATA', 'calculate-traverse-and-tacheometry-data', NULL::text),
  ('CONDUCT FIELD SURVEY', 'conduct-field-survey', NULL::text),
  ('ESTABLISH GLOBAL POSITIONING SYSTEM (GPS) LOCATION', 'establish-global-positioning-system-gps-location', NULL::text),
  ('MAINTAIN SURVEY RECORDS', 'maintain-survey-records', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'construction-survey-level-4';

-- ------------------------------------------------------------------------------
-- Course: INTERIOR DESIGN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DESIGN FUNDAMENTALS', 'apply-design-fundamentals', NULL::text),
  ('CONSTRUCT INTERIOR SOFT FURNISHINGS', 'construct-interior-soft-furnishings', NULL::text),
  ('PERFORM CEILING FINISHING', 'perform-ceiling-finishing', NULL::text),
  ('PERFORM INTERIOR FLOOR FINISHING', 'perform-interior-floor-finishing', NULL::text),
  ('PERFORM INTERIOR WALL FINISHING', 'perform-interior-wall-finishing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'interior-design-level-4';

-- ------------------------------------------------------------------------------
-- Course: MASONRY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSTRUCT BUILDING SUBSTRUCTURE', 'construct-building-substructure', NULL::text),
  ('CONSTRUCT BUILDING SUPERSTRUCTURE', 'construct-building-superstructure', NULL::text),
  ('FINISH MASONRY WORKS.', 'finish-masonry-works', NULL::text),
  ('INTERPRET AND DRAW SIMPLE WORKING DRAWINGS.', 'interpret-and-draw-simple-working-drawings', NULL::text),
  ('PRODUCE MASONRY CONSTRUCTION UNITS.', 'produce-masonry-construction-units', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY SCIENTIFIC PRINCIPLES', 'apply-scientific-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM', 'install-drainage-system', NULL::text),
  ('INSTALL RAINWATER HARVESTING SYSTEMS', 'install-rainwater-harvesting-systems', NULL::text),
  ('INSTALL SANITARY APPLIANCES', 'install-sanitary-appliances', NULL::text),
  ('INSTALL WATER PIPES AND ANCILLARY APPLIANCES', 'install-water-pipes-and-ancillary-appliances', NULL::text),
  ('INSTALL WATER STORAGE SYSTEMS AND ANCILLARY APPLIANCES', 'install-water-storage-systems-and-ancillary-appliances', NULL::text),
  ('MAINTAIN PLUMBING SYSTEMS', 'maintain-plumbing-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Common Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INTERPRET ARCHITECTURAL AND ENGINEERING DRAWINGS', 'interpret-architectural-and-engineering-drawings', NULL::text),
  ('MEASURE AND CALCULATE OBJECTS PARAMETERS', 'measure-and-calculate-object-s-parameters', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL PIPES IN BUILDINGS', 'install-pipes-in-buildings', NULL::text),
  ('INSTALL SANITARY APPLIANCES', 'install-sanitary-appliances', NULL::text),
  ('INSTALL STORAGE AND PUMPING SYSTEMS', 'install-storage-and-pumping-systems', NULL::text),
  ('MAINTAIN PLUMBING SYSTEMS', 'maintain-plumbing-systems', NULL::text),
  ('MEASURE AND CALCULATE OBJECTS PARAMETERS', 'measure-and-calculate-object-s-parameters-part-2', 'measure-and-calculate-object-s-parameters')
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';

COMMIT;
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'building-and-civil-engineering-department'
-- GROUP BY d.name;