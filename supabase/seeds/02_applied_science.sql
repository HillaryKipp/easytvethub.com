-- ==============================================================================
-- SEED SCRIPT FOR: APPLIED SCIENCE DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 9 | Total Units: 179
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

-- 2. Upsert Department: APPLIED SCIENCE DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'APPLIED SCIENCE DEPARTMENT', 'applied-science-department', 'Accredited TVET CDACC Applied Science modular courses in Analytical Chemistry, Applied Biology, Statistics, Biomedical Engineering, Industrial Chemistry, and Science Laboratory Technology.', 2
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department'
);

-- 4. Insert Courses under APPLIED SCIENCE DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ANALYTICAL CHEMISTRY TECHNICIAN LEVEL 6', 'analytical-chemistry-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'APPLIED BIOLOGY TECHNICIAN LEVEL 6', 'applied-biology-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'APPLIED STATISTICIAN LEVEL 6', 'applied-statistician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BIOMEDICAL ENGINEERING TECHNOLOGIST LEVEL 6', 'biomedical-engineering-technologist-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL CHEMISTRY TECHNOLOGY LEVEL 6', 'industrial-chemistry-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SCIENCE LABORATORY TECHNOLOGY LEVEL 6', 'science-laboratory-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BIOMEDICAL ENGINEERING TECHNICIAN LEVEL 5', 'biomedical-engineering-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ENVIRONMENTAL TECHNICIAN LEVEL 5', 'environmental-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SCIENCE LABORATORY TECHNOLOGY LEVEL 5', 'science-laboratory-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'applied-science-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ANALYTICAL CHEMISTRY TECHNICIAN LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM CHEMICAL SEPARATION', 'perform-chemical-separation', NULL::text),
  ('PREPARE CHEMICAL SAMPLES', 'prepare-chemical-samples', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('APPLY ORGANIC CHEMISTRY PRINCIPLES', 'apply-organic-chemistry-principles', NULL::text),
  ('PERFORM BIOCHEMICAL ANALYSIS', 'perform-biochemical-analysis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY INORGANIC CHEMISTRY PRINCIPLES', 'apply-inorganic-chemistry-principles', NULL::text),
  ('PERFORM CLASSICAL ANALYSIS TECHNIQUES', 'perform-classical-analysis-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY PHYSICS PRINCIPLES', 'apply-physics-principles', NULL::text),
  ('PERFORM INSTRUMENTAL ANALYSIS', 'perform-instrumental-analysis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY PHYSICAL CHEMISTRY PRINCIPLES', 'apply-physical-chemistry-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM INDUSTRIAL CHEMISTRY ANALYSIS', 'perform-industrial-chemistry-analysis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('PERFORM QUALITY ASSURANCE AND CONTROL', 'perform-quality-assurance-and-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'analytical-chemistry-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: APPLIED BIOLOGY TECHNICIAN LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY LABORATORY PRACTICE PRINCIPLES', 'apply-laboratory-practice-principles', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('CONDUCT HISTOLOGICAL AND CYTOLOGICAL TECHNIQUES', 'conduct-histological-and-cytological-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ANIMAL ANATOMY AND PHYSIOLOGY CONCEPTS', 'apply-animal-anatomy-and-physiology-concepts', NULL::text),
  ('CARRY OUT LABORATORY ANIMAL HUSBANDRY', 'carry-out-laboratory-animal-husbandry', NULL::text),
  ('CARRY OUT PLANT HUSBANDRY', 'carry-out-plant-husbandry', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY TAXONOMICAL CONCEPTS', 'apply-taxonomical-concepts', NULL::text),
  ('PERFORM ECOLOGICAL TECHNIQUES', 'perform-ecological-techniques', NULL::text),
  ('PERFORM MUSEUM HERBARIUM AQUARIUM AND VIVARIUM TECHNIQUES', 'perform-museum-herbarium-aquarium-and-vivarium-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM IMMUNOLOGICAL TECHNIQUES', 'perform-immunological-techniques', NULL::text),
  ('PERFORM MICROBIOLOGICAL TECHNIQUES', 'perform-microbiological-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT SCIENTIFIC RESEARCH', 'conduct-scientific-research', NULL::text),
  ('PERFORM PARASITOLOGICAL AND ENTOMOLOGICAL TECHNIQUES', 'perform-parasitological-and-entomological-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY GENETICS PRINCIPLES', 'apply-genetics-principles', NULL::text),
  ('CONDUCT BIOCHEMICAL ANALYSIS', 'conduct-biochemical-analysis', NULL::text),
  ('PERFORM PHARMACOLOGICAL AND TOXICOLOGICAL TECHNIQUES', 'perform-pharmacological-and-toxicological-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-biology-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: APPLIED STATISTICIAN LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('COLLECT AND MANAGE DATA', 'collect-and-manage-data', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('DEVELOP RESEARCH CONCEPTS', 'develop-research-concepts', NULL::text),
  ('PERFORM DESCRIPTIVE DATA ANALYSIS AND PRESENTATION I', 'perform-descriptive-data-analysis-and-presentation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY STATISTICAL TECHNIQUES', 'apply-statistical-techniques', NULL::text),
  ('PERFORM INFERENTIAL DATA ANALYSIS AND PRESENTATION II', 'perform-inferential-data-analysis-and-presentation-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('DESIGN RESEARCH EXPERIMENTS', 'design-research-experiments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('MANAGE STATISTICAL DATA', 'manage-statistical-data', NULL::text),
  ('PERFORM INFERENTIAL DATA ANALYSIS AND PRESENTATION', 'perform-inferential-data-analysis-and-presentation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('CONDUCT RELIABILITY AND VALIDITY OF DATA', 'conduct-reliability-and-validity-of-data', NULL::text),
  ('DEVELOP DATABASE MANAGEMENT SYSTEMS', 'develop-database-management-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'applied-statistician-level-6';

-- ------------------------------------------------------------------------------
-- Course: BIOMEDICAL ENGINEERING TECHNOLOGIST LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS I', 'apply-engineering-technician-mathematics-i', NULL::text),
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY PRINCIPLES', 'apply-human-anatomy-and-physiology-principles', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM REFRIGERATION AND AIR CONDITIONING EQUIPMENT INSTALLATION AND MAINTENANCE', 'perform-refrigeration-and-air-conditioning-equipment-installation-and-maintenance', NULL::text),
  ('PERFORM WORKSHOP PRACTICE', 'perform-workshop-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES I', 'apply-electrical-principles-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS II', 'apply-engineering-technician-mathematics-ii', NULL::text),
  ('PERFORM DENTAL EQUIPMENT MAINTENANCE', 'perform-dental-equipment-maintenance', NULL::text),
  ('PERFORM HOSPITAL PLANT AND BUILDING SERVICES EQUIPMENT MAINTENANCE I', 'perform-hospital-plant-and-building-services-equipment-maintenance-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES II', 'apply-electrical-principles-ii', NULL::text),
  ('PERFORM HOSPITAL PLANT AND BUILDING SERVICES EQUIPMENT MAINTENANCE II', 'perform-hospital-plant-and-building-services-equipment-maintenance-ii', NULL::text),
  ('PERFORM MATERNITY EQUIPMENT MAINTENANCE', 'perform-maternity-equipment-maintenance', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS I', 'prepare-technical-drawings-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES III', 'apply-electrical-principles-iii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM DIAGNOSTIC AND LABORATORY EQUIPMENT MAINTENANCE I', 'perform-diagnostic-and-laboratory-equipment-maintenance-i', NULL::text),
  ('PERFORM OPERATION THEATRE EQUIPMENT MAINTENANCE', 'perform-operation-theatre-equipment-maintenance', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS II', 'prepare-technical-drawings-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES IV', 'apply-electrical-principles-iv', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS III', 'apply-engineering-technician-mathematics-iii', NULL::text),
  ('APPLY MEASUREMENTS AND CONTROL SYSTEMS', 'apply-measurements-and-control-systems', NULL::text),
  ('PERFORM DIAGNOSTIC AND LABORATORY EQUIPMENT MAINTENANCE II', 'perform-diagnostic-and-laboratory-equipment-maintenance-ii', NULL::text),
  ('PERFORM OPHTHALMIC AND ENT EQUIPMENT MAINTENANCE', 'perform-ophthalmic-and-ent-equipment-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY DIGITAL ELECTRONICS', 'apply-digital-electronics', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS IV', 'apply-engineering-technician-mathematics-iv', NULL::text),
  ('APPLY MICROCONTROLLERS AND MICROPROCESSORS I', 'apply-microcontrollers-and-microprocessors-i', NULL::text),
  ('PERFORM ICU AND RENAL EQUIPMENT MAINTENANCE', 'perform-icu-and-renal-equipment-maintenance', NULL::text),
  ('PERFORM RADIOLOGY AND IMAGING EQUIPMENT MAINTENANCE', 'perform-radiology-and-imaging-equipment-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY HOSPITAL ORGANIZATION AND MAINTENANCE PRINCIPLES', 'apply-hospital-organization-and-maintenance-principles', NULL::text),
  ('APPLY MICROCONTROLLERS AND MICROPROCESSORS II', 'apply-microcontrollers-and-microprocessors-ii', NULL::text),
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('PERFORM PHYSIOTHERAPY AND ORTHOPAEDIC EQUIPMENT MAINTENANCE', 'perform-physiotherapy-and-orthopaedic-equipment-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technologist-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL CHEMISTRY TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE CONCEPTS', 'apply-mechanical-science-concepts', NULL::text),
  ('PERFORM UNIT OPERATIONS', 'perform-unit-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL SCIENCE CONCEPTS', 'apply-electrical-science-concepts', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('OPERATE ANALYTICAL EQUIPMENT', 'operate-analytical-equipment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY CHEMICAL SCIENCE CONCEPTS', 'apply-chemical-science-concepts', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('CARRY OUT MATERIAL ANALYSIS', 'carry-out-material-analysis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM PRODUCTION QUALITY CONTROL', 'perform-production-quality-control', NULL::text),
  ('PROCESS INDUSTRIAL PRODUCTS', 'process-industrial-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY LABORATORY SAFETY AND MANAGEMENT PRACTICES', 'apply-laboratory-safety-and-management-practices', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MANAGE INDUSTRIAL WASTES', 'manage-industrial-wastes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('CONDUCT SCIENTIFIC RESEARCH', 'conduct-scientific-research', NULL::text),
  ('PERFORM PROCESS CONTROL AND OPTIMIZATION', 'perform-process-control-and-optimization', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'industrial-chemistry-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: SCIENCE LABORATORY TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY GENERAL SCIENCE PRINCIPLES', 'apply-general-science-principles', NULL::text),
  ('PERFORM BIOLOGY TECHNIQUES', 'perform-biology-techniques', NULL::text),
  ('PERFORM STANDARD LABORATORY PRACTICES', 'perform-standard-laboratory-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science', NULL::text),
  ('MAINTAIN LABORATORY EQUIPMENT', 'maintain-laboratory-equipment', NULL::text),
  ('PERFORM CHEMISTRY TECHNIQUES', 'perform-chemistry-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT SCIENCE LABORATORY RESEARCH', 'conduct-science-laboratory-research', NULL::text),
  ('PERFORM PHYSICS TECHNIQUES', 'perform-physics-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY CHEMISTRY PRINCIPLES', 'apply-chemistry-principles', NULL::text),
  ('APPLY MATHEMATICS FOR SCIENCE', 'apply-mathematics-for-science-module-4', 'apply-mathematics-for-science'),
  ('PERFORM AQUARIUM VIVARIUM AND HERBARIUM TECHNIQUES', 'perform-aquarium-vivarium-and-herbarium-techniques', NULL::text),
  ('PERFORM CHEMICAL ANALYSES', 'perform-chemical-analyses', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY LABORATORY AND MANAGEMENT PRACTICES', 'apply-laboratory-and-management-practices', NULL::text),
  ('APPLY PHYSICS PRINCIPLES', 'apply-physics-principles', NULL::text),
  ('CARRY OUT CYTO-HISTOLOGICAL AND IMMUNOLOGICAL TECHNIQUES', 'carry-out-cyto-histological-and-immunological-techniques', NULL::text),
  ('TEST MATERIAL PROPERTIES', 'test-material-properties', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY BIOLOGY PRINCIPLES', 'apply-biology-principles', NULL::text),
  ('CONDUCT MICROBIOLOGICAL TESTS', 'conduct-microbiological-tests', NULL::text),
  ('MEASURE PHYSICAL QUANTITIES', 'measure-physical-quantities', NULL::text),
  ('PERFORM CHEMISTRY INSTRUMENTATION TECHNOIQUES', 'perform-chemistry-instrumentation-technoiques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: BIOMEDICAL ENGINEERING TECHNICIAN LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS I', 'apply-engineering-technician-mathematics-i', NULL::text),
  ('APPLY HUMAN ANATOMY AND PHYSIOLOGY PRINCIPLES', 'apply-human-anatomy-and-physiology-principles', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM REFRIGERATION AND AIR CONDITIONING EQUIPMENT MAINTENANCE', 'perform-refrigeration-and-air-conditioning-equipment-maintenance', NULL::text),
  ('PERFORM WORKSHOP PRACTICE', 'perform-workshop-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES I', 'apply-electrical-principles-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS II', 'apply-engineering-technician-mathematics-ii', NULL::text),
  ('PERFORM DENTAL EQUIPMENT MAINTENANCE', 'perform-dental-equipment-maintenance', NULL::text),
  ('PERFORM HOSPITAL PLANT AND BUILDING SERVICES EQUIPMENT MAINTENANCE I', 'perform-hospital-plant-and-building-services-equipment-maintenance-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES II', 'apply-electrical-principles-ii', NULL::text),
  ('PERFORM HOSPITAL PLANT AND BUILDING SERVICES EQUIPMENT MAINTENANCE II', 'perform-hospital-plant-and-building-services-equipment-maintenance-ii', NULL::text),
  ('PERFORM MATERNITY EQUIPMENT MAINTENANCE', 'perform-maternity-equipment-maintenance', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS I', 'prepare-technical-drawings-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES III', 'apply-electrical-principles-iii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('PERFORM DIAGNOSTIC AND LABORATORY EQUIPMENT MAINTENANCE I', 'perform-diagnostic-and-laboratory-equipment-maintenance-i', NULL::text),
  ('PERFORM OPERATION THEATRE EQUIPMENT MAINTENANCE', 'perform-operation-theatre-equipment-maintenance', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS II', 'prepare-technical-drawings-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'biomedical-engineering-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: ENVIRONMENTAL TECHNICIAN LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ORGANIC AND INORGANIC CHEMISTRY', 'apply-organic-and-inorganic-chemistry', NULL::text),
  ('MONITOR ENVIRONMENTAL POLLUTION', 'monitor-environmental-pollution', NULL::text),
  ('PERFORM ENVIRONMENTAL WASTE MANAGEMENT', 'perform-environmental-waste-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY NATURAL RESOURCE ECONOMICS', 'apply-natural-resource-economics', NULL::text),
  ('MAINTAIN ENVIRONMENTAL ECOLOGY', 'maintain-environmental-ecology', NULL::text),
  ('MONITOR CLIMATE CHANGE', 'monitor-climate-change', NULL::text),
  ('PERFORM ENVIRONMENTAL HEALTH AND SAFETY PRACTICES', 'perform-environmental-health-and-safety-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC ENVIRONMENTAL PRINCIPLES', 'apply-basic-environmental-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MONITOR NATURAL RESOURCES', 'monitor-natural-resources', NULL::text),
  ('PERFORM LABORATORY TECHNIQUES', 'perform-laboratory-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'environmental-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: SCIENCE LABORATORY TECHNOLOGY LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY GENERAL SCIENCE PRINCIPLES', 'apply-general-science-principles', NULL::text),
  ('PERFORM BIOLOGY TECHNIQUES', 'perform-biology-techniques', NULL::text),
  ('PERFORM STANDARD LABORATORY PRACTICES', 'perform-standard-laboratory-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS FOR SCIENCE', 'apply-basic-mathematics-for-science', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('MAINTAIN LABORATORY EQUIPMENT', 'maintain-laboratory-equipment', NULL::text),
  ('PERFORM CHEMISTRY TECHNIQUES', 'perform-chemistry-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT SCIENCE LABORATORY RESEARCH', 'conduct-science-laboratory-research', NULL::text),
  ('PERFORM PHYSICS TECHNIQUES', 'perform-physics-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-science-department' AND c.slug = 'science-laboratory-technology-level-5';

COMMIT;
-- Verification Query: Check courses and units inserted for APPLIED SCIENCE DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'applied-science-department'
-- GROUP BY d.name;