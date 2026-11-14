-- ==============================================================================
-- SEED SCRIPT FOR: BUILDING AND CIVIL ENGINEERING DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 20 | Total Units: 257
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

-- 2. Upsert Department: BUILDING AND CIVIL ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUILDING AND CIVIL ENGINEERING DEPARTMENT', 'building-and-civil-engineering-department', 'Accredited TVET CDACC Building and Civil Engineering modular courses in Architecture, Civil Engineering, Building Technology, Cartography & GIS, Land Survey, Plumbing, Masonry, and Carpentry.', 3
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department'
);

-- 4. Insert Courses under BUILDING AND CIVIL ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARCHITECTURE LEVEL 6', 'architecture-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING TECHNCIAN LEVEL 6', 'building-techncian-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARTOGRAPHY AND GIS TECHNOLOGY LEVEL 6', 'cartography-and-gis-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CIVIL ENGINEERING LEVEL 6', 'civil-engineering-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LAND SURVEY LEVEL 6', 'land-survey-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUILDING TECHNOLOGY LEVEL 5', 'building-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTRY AND JOINERY LEVEL 5', 'carpentry-and-joinery-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LAND SURVEY LEVEL 5', 'land-survey-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 5', 'plumbing-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ROAD CONSTRUCTION LEVEL 5', 'road-construction-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTRY AND JOINERY LEVEL 4', 'carpentry-and-joinery-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MASONRY LEVEL 4', 'masonry-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 4', 'plumbing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'RIGGING LEVEL 4', 'rigging-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CARPENTERY AND JOINERY LEVEL 3', 'carpentery-and-joinery-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GYPSUM INSTALLATION LEVEL 3', 'gypsum-installation-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MASONRY LEVEL 3', 'masonry-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PLUMBING LEVEL 3', 'plumbing-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'RIGGER LEVEL 3', 'rigger-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TILE FIXER LEVEL 3', 'tile-fixer-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'building-and-civil-engineering-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ARCHITECTURE LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ART AND ARCHITECTURAL LANGUAGE PRINCIPLES', 'apply-art-and-architectural-language-principles', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY TECHNICAL DRAWING TECHNIQUES', 'apply-technical-drawing-techniques', NULL::text),
  ('PRODUCE PHYSICAL ARCHITECTURAL MODEL', 'produce-physical-architectural-model', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMPUTER-AIDED DESIGN DRAWING TECHNIQUES', 'apply-computer-aided-design-drawing-techniques', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY MATHEMATICS FOR ARCHITECTS I', 'apply-mathematics-for-architects-i', NULL::text),
  ('PRODUCE DIGITAL ARCHITECTURAL MODEL', 'produce-digital-architectural-model', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENGINEERING SURVEY PRINCIPLES', 'apply-engineering-survey-principles', NULL::text),
  ('APPLY HISTORY OF ARCHITECTURE CONCEPTS', 'apply-history-of-architecture-concepts', NULL::text),
  ('APPLY MATHEMATICS FOR ARCHITECTS II', 'apply-mathematics-for-architects-ii', NULL::text),
  ('CARRY OUT ARCHITECTURAL LANDSCAPING', 'carry-out-architectural-landscaping', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY CONSTRUCTION MATERIALS PRINCIPLES', 'apply-construction-materials-principles', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES', 'apply-structural-analysis-principles', NULL::text),
  ('DESIGN ARCHITECTURAL INTERIORS', 'design-architectural-interiors', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY BUILDING CONSTRUCTION TECHNOLOGY PRINCIPLES', 'apply-building-construction-technology-principles', NULL::text),
  ('MANAGE CONSTRUCTION PROJECT', 'manage-construction-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('BUILDING WORKS MEASUREMENTS PRINCIPLES', 'building-works-measurements-principles', NULL::text),
  ('DESIGN ARCHITECHTURAL PROJECT', 'design-architechtural-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'architecture-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUILDING TECHNCIAN LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM MASONRY WORKS', 'perform-masonry-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES I', 'perform-masonry-works-finishes-i', NULL::text),
  ('PRODUCE MASONRY PRODUCTS', 'produce-masonry-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM BUILDING SITE PRELIMINARY WORKS I', 'perform-building-site-preliminary-works-i', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS I', 'apply-basic-mathematics-i', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('EXECUTE EXTERNAL WORKS', 'execute-external-works', NULL::text),
  ('INSTALL DOORS AND WINDOWS', 'install-doors-and-windows', NULL::text),
  ('PERFORM BUILDING SUBSTRUCTURE WORKS', 'perform-building-substructure-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS II', 'apply-basic-mathematics-ii', NULL::text),
  ('APPLY CONSTRUCTION MATERIAL SCIENCE', 'apply-construction-material-science', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM BUILDING SUPERSTRUCTURE WORKS', 'perform-building-superstructure-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES II', 'perform-masonry-works-finishes-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES I', 'apply-structural-analysis-principles-i', NULL::text),
  ('CARRY OUT ROOF CONSTRUCTION WORK', 'carry-out-roof-construction-work', NULL::text),
  ('PERFORM BUILDING SITE PRELIMINARY WORKS II', 'perform-building-site-preliminary-works-ii', NULL::text),
  ('PERFORM BUILDING SUPER STRUCTURE WORKS II', 'perform-building-super-structure-works-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENGINEERING SURVEY PRINCIPLES I', 'apply-engineering-survey-principles-i', NULL::text),
  ('APPLY MEASUREMENT ESTIMATION AND COSTING OF WORKS I', 'apply-measurement-estimation-and-costing-of-works-i', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES II', 'apply-structural-analysis-principles-ii', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('CARRY OUT BUILDING FINISHES III', 'carry-out-building-finishes-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY ENGINEERING SURVEY PRINCIPLES II', 'apply-engineering-survey-principles-ii', NULL::text),
  ('APPLY MEASUREMENT ESTIMATION AND COSTING OF WORKS II', 'apply-measurement-estimation-and-costing-of-works-ii', NULL::text),
  ('MANAGE BUILDING CONSTRUCTION WORKS', 'manage-building-construction-works', NULL::text),
  ('PREPARE BUILDING DRAWING', 'prepare-building-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-techncian-level-6';

-- ------------------------------------------------------------------------------
-- Course: CARTOGRAPHY AND GIS TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS I', 'apply-engineering-mathematics-i', NULL::text),
  ('APPLY LAND SURVEYING TECHNIQUES', 'apply-land-surveying-techniques', NULL::text),
  ('APPLY MAP PROJECTION PRINCIPLES', 'apply-map-projection-principles', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY GIS PRINCIPLES', 'apply-gis-principles', NULL::text),
  ('PRODUCE TOPOGRAPHICAL MAPS', 'produce-topographical-maps', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY PRINCIPLES OF REMOTE SENSING', 'apply-principles-of-remote-sensing', NULL::text),
  ('PRODUCE THEMATIC MAPS', 'produce-thematic-maps', NULL::text),
  ('PRODUCE TOPO-CADASTRAL MAPS I', 'produce-topo-cadastral-maps-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS II', 'apply-engineering-mathematics-ii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PRODUCE TOPO-CADASTRAL MAPS II', 'produce-topo-cadastral-maps-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CONDUCT ENGINEERING SURVEY I', 'conduct-engineering-survey-i', NULL::text),
  ('PRODUCE CARTOGRAPHIC CHARTS', 'produce-cartographic-charts', NULL::text),
  ('PRODUCE RELIEF MAPS', 'produce-relief-maps', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY MAP REPRODUCTION TECHNIQUES', 'apply-map-reproduction-techniques', NULL::text),
  ('CONDUCT CONTROL SURVEY', 'conduct-control-survey', NULL::text),
  ('CONDUCT ENGINEERING SURVEY II', 'conduct-engineering-survey-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'cartography-and-gis-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: CIVIL ENGINEERING LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY CONSTRUCTION MATERIALS SCIENCE I', 'apply-construction-materials-science-i', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CARRY OUT CIVIL ENGINEERING WORKS I', 'carry-out-civil-engineering-works-i', NULL::text),
  ('CARRY OUT SITE SURVEY', 'carry-out-site-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY CONSTRUCTION MATERIALS SCIENCE II', 'apply-construction-materials-science-ii', NULL::text),
  ('APPLY MATHEMATICAL PRINCIPLES', 'apply-mathematical-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRACTICES', 'apply-workshop-technology-practices', NULL::text),
  ('CARRY OUT ROAD CONSTRUCTION WORKS I', 'carry-out-road-construction-works-i', NULL::text),
  ('PREPARE FOR MATERIALS TESTING', 'prepare-for-materials-testing', NULL::text),
  ('PREPARE TECHNICAL DRAWING', 'prepare-technical-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ALGEBRA AND GEOMETRY', 'apply-algebra-and-geometry', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES I', 'apply-structural-analysis-principles-i', NULL::text),
  ('CARRY OUT ENGINEERING SURVEY I', 'carry-out-engineering-survey-i', NULL::text),
  ('CARRY OUT ROAD CONSTRUCTION WORKS II', 'carry-out-road-construction-works-ii', NULL::text),
  ('CONDUCT MATERIAL TESTING I', 'conduct-material-testing-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY MEASUREMENTS ESTIMATION AND COSTING PRINCIPLES I', 'apply-measurements-estimation-and-costing-principles-i', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES II', 'apply-structural-analysis-principles-ii', NULL::text),
  ('APPLY TRIGONOMETRY AND COMPLEX NUMBERS', 'apply-trigonometry-and-complex-numbers', NULL::text),
  ('CARRY OUT CIVIL ENGINEERING WORKS II', 'carry-out-civil-engineering-works-ii', NULL::text),
  ('CARRY OUT ENGINEERING SURVEY II', 'carry-out-engineering-survey-ii', NULL::text),
  ('DESIGN ROAD STRUCTURES I', 'design-road-structures-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY CALCULUS AND DIFFERENTIAL METHODS', 'apply-calculus-and-differential-methods', NULL::text),
  ('APPLY HYDRAULIC PRINCIPLES', 'apply-hydraulic-principles', NULL::text),
  ('APPLY MEASUREMENTS ESTIMATION AND COSTING PRINCIPLES II', 'apply-measurements-estimation-and-costing-principles-ii', NULL::text),
  ('APPLY STRUCTURAL ANALYSIS PRINCIPLES III', 'apply-structural-analysis-principles-iii', NULL::text),
  ('DESIGN ROAD STRUCTURES II', 'design-road-structures-ii', NULL::text),
  ('PRODUCE CIVIL ENGINEERING DRAWING I', 'produce-civil-engineering-drawing-i', NULL::text),
  ('PRODUCE CIVIL ENGINEERING DRAWING II', 'produce-civil-engineering-drawing-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY MEASUREMENTS ESTIMATION AND COSTING PRINCIPLES III', 'apply-measurements-estimation-and-costing-principles-iii', NULL::text),
  ('APPLY VECTORS MATRICES AND DATA ANALYSIS', 'apply-vectors-matrices-and-data-analysis', NULL::text),
  ('CONDUCT MATERIAL TESTING II', 'conduct-material-testing-ii', NULL::text),
  ('DESIGN CIVIL ENGINEERING STRUCTURES I', 'design-civil-engineering-structures-i', NULL::text),
  ('DESIGN WATER SUPPLY INFRASTRUCTURE', 'design-water-supply-infrastructure', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('CONDUCT RESEARCH PROJECT I', 'conduct-research-project-i', NULL::text),
  ('DESIGN CIVIL ENGINEERING STRUCTURES II', 'design-civil-engineering-structures-ii', NULL::text),
  ('DESIGN WASTE WATER INFRASTRUCTURE', 'design-waste-water-infrastructure', NULL::text),
  ('SUPERVISE CIVIL ENGINEERING PROJECTS', 'supervise-civil-engineering-projects', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'civil-engineering-level-6';

-- ------------------------------------------------------------------------------
-- Course: LAND SURVEY LEVEL 6 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS I', 'apply-engineering-mathematics-i', NULL::text),
  ('APPLY PRINCIPLES OF CARTOGRAPHY', 'apply-principles-of-cartography', NULL::text),
  ('CONDUCT TOPOGRAPHICAL SURVEY', 'conduct-topographical-survey', NULL::text),
  ('OPERATE SURVEY INSTRUMENTS', 'operate-survey-instruments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS II', 'apply-engineering-mathematics-ii', NULL::text),
  ('CONDUCT CONTROL SURVEY', 'conduct-control-survey', NULL::text),
  ('CONDUCT ENGINEERING SURVEY', 'conduct-engineering-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS III', 'apply-engineering-mathematics-iii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF LAND LAW I', 'apply-principles-of-land-law-i', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT CADASTRAL SURVEY', 'conduct-cadastral-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY PRINCIPLES OF GIS', 'apply-principles-of-gis', NULL::text),
  ('APPLY PRINCIPLES OF LAND LAWS II', 'apply-principles-of-land-laws-ii', NULL::text),
  ('CONDUCT ENGINEERING SURVEY II', 'conduct-engineering-survey-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('CONDUCT HYDROGRAPHIC SURVEY', 'conduct-hydrographic-survey', NULL::text),
  ('CONDUCT MINE SURVEY', 'conduct-mine-survey', NULL::text),
  ('CONDUCT PHOTOGRAMMETRIC SURVEY', 'conduct-photogrammetric-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-6';

-- ------------------------------------------------------------------------------
-- Course: BUILDING TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM MASONRY WORKS FINISHES I', 'perform-masonry-works-finishes-i', NULL::text),
  ('PERFORM MASONRY WORKS I', 'perform-masonry-works-i', NULL::text),
  ('PRODUCE MASONRY UNITS', 'produce-masonry-units', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM BUILDING SITE PRELIMINARY WORKS', 'perform-building-site-preliminary-works', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS I', 'apply-basic-mathematics-i', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('EXECUTE EXTERNAL WORKS', 'execute-external-works', NULL::text),
  ('INSTALL DOORS AND WINDOWS', 'install-doors-and-windows', NULL::text),
  ('PERFORM BUILDING SUBSTRUCTURE WORKS', 'perform-building-substructure-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS II', 'apply-basic-mathematics-ii', NULL::text),
  ('APPLY CONSTRUCTION MATERIAL SCIENCE', 'apply-construction-material-science', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM BUILDING SUPERSTRUCTURE WORKS', 'perform-building-superstructure-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES II', 'perform-masonry-works-finishes-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'building-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: CARPENTRY AND JOINERY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT CABINETRY WORKS', 'carry-out-cabinetry-works', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS', 'construct-temporary-works', NULL::text),
  ('FIX DOOR AND WINDOW FRAMES', 'fix-door-and-window-frames', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT ROUGH CARPENTRY', 'carry-out-rough-carpentry', NULL::text),
  ('CONSTRUCT CABINETS', 'construct-cabinets', NULL::text),
  ('CONSTRUCT DOORS AND WINDOWS', 'construct-doors-and-windows', NULL::text),
  ('CONSTRUCT TIMBER FLOORS AND FRAMED STRUCTURES', 'construct-timber-floors-and-framed-structures', NULL::text),
  ('CONSTRUCT TIMBER ROOFS', 'construct-timber-roofs', NULL::text),
  ('FABRICATE TIMBER FURNITURE ITEMS', 'fabricate-timber-furniture-items', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CONSTRUCT AND INSTALL UPHOLSTERY FURNITURE', 'construct-and-install-upholstery-furniture', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONSTRUCT TIMBER PREFABRICATED BUILDINGS', 'construct-timber-prefabricated-buildings', NULL::text),
  ('CONSTRUCT TIMBER STAIRS', 'construct-timber-stairs', NULL::text),
  ('INSTALL CEILING UNIT', 'install-ceiling-unit', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-5';

-- ------------------------------------------------------------------------------
-- Course: LAND SURVEY LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS I', 'apply-engineering-mathematics-i', NULL::text),
  ('APPLY PRINCIPLES OF CARTOGRAPHY', 'apply-principles-of-cartography', NULL::text),
  ('CONDUCT TOPOGRAPHICAL SURVEY', 'conduct-topographical-survey', NULL::text),
  ('OPERATE SURVEY INSTRUMENTS', 'operate-survey-instruments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS II', 'apply-engineering-mathematics-ii', NULL::text),
  ('CONDUCT CONTROL SURVEY', 'conduct-control-survey', NULL::text),
  ('CONDUCT ENGINEERING SURVEY I', 'conduct-engineering-survey-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS III', 'apply-engineering-mathematics-iii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PRINCIPLES OF LAND LAWS I', 'apply-principles-of-land-laws-i', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT CADASTRAL SURVEY', 'conduct-cadastral-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'land-survey-level-5';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM I', 'install-drainage-system-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES I', 'install-sanitary-appliances-i', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM I', 'install-water-supply-system-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM II', 'install-drainage-system-ii', NULL::text),
  ('INSTALL RAINWATER HARVESTING SYSTEM I', 'install-rainwater-harvesting-system-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES II', 'install-sanitary-appliances-ii', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM II', 'install-water-supply-system-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS PRINCIPLES', 'apply-basic-mathematics-principles', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('INSTALL WATER STORAGE SYSTEM', 'install-water-storage-system', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM III', 'install-water-supply-system-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY CONSTRUCTION MATERIAL SCIENCE', 'apply-construction-material-science', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('DEMONSTRATE WORKSHOP TECHNOLOGY SKILLS', 'demonstrate-workshop-technology-skills', NULL::text),
  ('INSTALL FIRE CONTROL SYSTEMS', 'install-fire-control-systems', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-5';

-- ------------------------------------------------------------------------------
-- Course: ROAD CONSTRUCTION LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY CONSTRUCTION MATERIAL SCIENCE I', 'apply-construction-material-science-i', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CARRY OUT SITE SURVEY', 'carry-out-site-survey', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY CONSTRUCTION MATERIAL SCIENCE II', 'apply-construction-material-science-ii', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('PREPARE FOR MATERIALS TESTING', 'prepare-for-materials-testing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICAL PRINCIPLES', 'apply-mathematical-principles', NULL::text),
  ('CARRY OUT ROAD CONSTRUCTION WORKS I', 'carry-out-road-construction-works-i', NULL::text),
  ('DEMONSTRATE WORKSHOP TECHNOLOGY SKILLS', 'demonstrate-workshop-technology-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('CARRY OUT CIVIL WORKS', 'carry-out-civil-works', NULL::text),
  ('CONDUCT MATERIAL TESTING I', 'conduct-material-testing-i', NULL::text),
  ('EXECUTE ROAD MAINTENANCE WORKS', 'execute-road-maintenance-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'road-construction-level-5';

-- ------------------------------------------------------------------------------
-- Course: CARPENTRY AND JOINERY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT CABINETRY WORKS', 'carry-out-cabinetry-works', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS', 'construct-temporary-works', NULL::text),
  ('FIX DOOR & WINDOW FRAMES', 'fix-door-and-window-frames', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT ROUGH CARPENTRY', 'carry-out-rough-carpentry', NULL::text),
  ('CONSTRUCT CABINETS', 'construct-cabinets', NULL::text),
  ('CONSTRUCT DOORS AND WINDOWS', 'construct-doors-and-windows', NULL::text),
  ('CONSTRUCT TIMBER FLOORS AND FRAMED STRUCTURES', 'construct-timber-floors-and-framed-structures', NULL::text),
  ('FABRICATE TIMBER FURNITURE ITEMS', 'fabricate-timber-furniture-items', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentry-and-joinery-level-4';

-- ------------------------------------------------------------------------------
-- Course: MASONRY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM MASONRY WORKS', 'perform-masonry-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES I', 'perform-masonry-works-finishes-i', NULL::text),
  ('PRODUCE MASONRY PRODUCTS', 'produce-masonry-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM BUILDING SITE PRELIMINARY WORKS I', 'perform-building-site-preliminary-works-i', NULL::text),
  ('PERFORM BUILDING TEMPORARY WORKS', 'perform-building-temporary-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-4';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEM I', 'install-drainage-system-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES I', 'install-sanitary-appliances-i', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM I', 'install-water-supply-system-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEMS II', 'install-drainage-systems-ii', NULL::text),
  ('INSTALL RAINWATER HARVESTING SYSTEM I', 'install-rainwater-harvesting-system-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES II', 'install-sanitary-appliances-ii', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEM II', 'install-water-supply-system-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-4';

-- ------------------------------------------------------------------------------
-- Course: RIGGING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigging-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM PRE- RIGGING ACTIVITIES', 'perform-pre-rigging-activities', NULL::text),
  ('PERFORM RIGGING ACTIVITIES', 'perform-rigging-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigging-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigging-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM RIGGING EQUIPMENT INSPECTION', 'perform-rigging-equipment-inspection', NULL::text),
  ('PERFORM RIGGING EQUIPMENT MAINTENANCE', 'perform-rigging-equipment-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigging-level-4';

-- ------------------------------------------------------------------------------
-- Course: CARPENTERY AND JOINERY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT CABINETRY WORKS', 'carry-out-cabinetry-works', NULL::text),
  ('CONSTRUCT TEMPORARY WORKS', 'construct-temporary-works', NULL::text),
  ('FIX DOOR & WINDOW FRAMES', 'fix-door-and-window-frames', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'carpentery-and-joinery-level-3';

-- ------------------------------------------------------------------------------
-- Course: GYPSUM INSTALLATION LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'gypsum-installation-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL GYPSUM CABINETS', 'install-gypsum-cabinets', NULL::text),
  ('INSTALL GYPSUM CEILING', 'install-gypsum-ceiling', NULL::text),
  ('INSTALL GYPSUM PARTITIONS', 'install-gypsum-partitions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'gypsum-installation-level-3';

-- ------------------------------------------------------------------------------
-- Course: MASONRY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM MASONRY WORKS', 'perform-masonry-works', NULL::text),
  ('PERFORM MASONRY WORKS FINISHES', 'perform-masonry-works-finishes', NULL::text),
  ('PRODUCE MASONRY PRODUCTS', 'produce-masonry-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'masonry-level-3';

-- ------------------------------------------------------------------------------
-- Course: PLUMBING LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DRAINAGE SYSTEMS I', 'install-drainage-systems-i', NULL::text),
  ('INSTALL SANITARY APPLIANCES I', 'install-sanitary-appliances-i', NULL::text),
  ('INSTALL WATER SUPPLY SYSTEMS I', 'install-water-supply-systems-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'plumbing-level-3';

-- ------------------------------------------------------------------------------
-- Course: RIGGER LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigger-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM PRE- RIGGING ACTIVITIES', 'perform-pre-rigging-activities', NULL::text),
  ('PERFORM RIGGING ACTIVITIES', 'perform-rigging-activities', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'rigger-level-3';

-- ------------------------------------------------------------------------------
-- Course: TILE FIXER LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'tile-fixer-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT TILE INSTALLATION', 'carry-out-tile-installation', NULL::text),
  ('INDUSTRY TRAINING', 'industry-training', NULL::text),
  ('PERFORM TILING WORKS ESTIMATES', 'perform-tiling-works-estimates', NULL::text),
  ('PREPARE SURFACE AND SET OUT', 'prepare-surface-and-set-out', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'building-and-civil-engineering-department' AND c.slug = 'tile-fixer-level-3';

COMMIT;
-- Verification Query: Check courses and units inserted for BUILDING AND CIVIL ENGINEERING DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'building-and-civil-engineering-department'
-- GROUP BY d.name;