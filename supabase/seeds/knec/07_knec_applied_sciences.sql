-- ==============================================================================
-- SEED SCRIPT FOR: APPLIED SCIENCES (KNEC COURSES)
-- Total Courses: 6 | Total Units: 78
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

-- 2. Upsert Department under KNEC: APPLIED SCIENCES
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'APPLIED SCIENCES', 'applied-sciences', 'KNEC Diploma and Certificate past examination papers and modules in Analytical Chemistry, Applied Biology, Statistics, Medical Lab, and Environmental Science.', 7
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'applied-sciences'
);

-- 4. Insert KNEC Courses under APPLIED SCIENCES
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN ANALYTICAL CHEMISTRY', 'diploma-in-analytical-chemistry', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'applied-sciences';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN APPLIED BIOLOGY', 'diploma-in-applied-biology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'applied-sciences';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN APPLIED STATISTICS', 'diploma-in-applied-statistics', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'applied-sciences';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN MEDICAL LABORATORY TECHNOLOGY', 'diploma-in-medical-laboratory-technology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'applied-sciences';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SCIENCE LABORATORY TECHNOLOGY', 'science-laboratory-technology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'applied-sciences';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN ENVIRONMENTAL SCIENCE', 'diploma-in-environmental-science', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'applied-sciences';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN ANALYTICAL CHEMISTRY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-analytical-chemistry';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ORGANIC AND INORGANIC CHEMISTRY', 'organic-and-inorganic-chemistry', NULL::text),
  ('LABORATORY AND WORKSHOP PRACTICE', 'laboratory-and-workshop-practice', NULL::text),
  ('PHYSICAL CHEMISTRY 1', 'physical-chemistry-1', NULL::text),
  ('MATHEMATICS AND APPLIED SCIENCE', 'mathematics-and-applied-science', NULL::text),
  ('ANALYTICAL CHEMISTRY I', 'analytical-chemistry-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-analytical-chemistry';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-analytical-chemistry';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CHEMICAL ANALYTICAL METHODS II AND BIOCHEMICAL TECHNIQUES', 'chemical-analytical-methods-ii-and-biochemical-techniques', NULL::text),
  ('PHYSICAL CHEMISTRY 2', 'physical-chemistry-2', NULL::text),
  ('INDUSTRIAL CHEMISTRY I AND INSTRUMENTAL METHODS OF ANALYSIS I', 'industrial-chemistry-i-and-instrumental-methods-of-analysis-i', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text),
  ('ANALYTICAL CHEMISTRY II', 'analytical-chemistry-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-analytical-chemistry';

-- Module 3: Module III (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-analytical-chemistry';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CHEMICAL ANALYTICAL METHODS AND BIOCHEMISTRY', 'chemical-analytical-methods-and-biochemistry', NULL::text),
  ('INORGANIC CHEMISTRY', 'inorganic-chemistry', NULL::text),
  ('INSTRUMENTAL METHODS OF ANALYSIS', 'instrumental-methods-of-analysis', NULL::text),
  ('LABORATORY PRACTICE AND MANAGEMENT', 'laboratory-practice-and-management', NULL::text),
  ('ORGANIC CHEMISTRY', 'organic-chemistry', NULL::text),
  ('PHYSICAL CHEMISTRY 3', 'physical-chemistry-3', NULL::text),
  ('ANALYTICAL CHEMISTRY III', 'analytical-chemistry-iii', NULL::text),
  ('INSTRUMENTATION METHODS II AND BIOCHEMISTRY', 'instrumentation-methods-ii-and-biochemistry', NULL::text),
  ('INDUSTRIAL CHEMISTRY II AND QUALITY ASSURANCE', 'industrial-chemistry-ii-and-quality-assurance', NULL::text),
  ('ORGANIC AND INORGANIC CHEMISTRY III', 'organic-and-inorganic-chemistry-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-analytical-chemistry';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN APPLIED BIOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-biology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('LABORATORY AND WORKSHOP PRACTICE', 'laboratory-and-workshop-practice', NULL::text),
  ('APPLIED BIOLOGY PRACTICAL I', 'applied-biology-practical-i', NULL::text),
  ('MATHEMATICS AND APPLIED SCIENCE', 'mathematics-and-applied-science', NULL::text),
  ('TAXONOMY, CYTOLOGY AND MICROBIOLOGY', 'taxonomy-cytology-and-microbiology', NULL::text),
  ('ANIMAL HUSBANDRY, MUSEUM AND HERBARIUM TECHNIQUES', 'animal-husbandry-museum-and-herbarium-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-biology';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-biology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PARASITOLOGY AND HISTOLOGY', 'parasitology-and-histology', NULL::text),
  ('APPLIED BIOLOGY PRACTICAL II', 'applied-biology-practical-ii', NULL::text),
  ('ECOLOGY AND PLANT HUSBANDRY', 'ecology-and-plant-husbandry', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text),
  ('TAXONOMY, ANATOMY AND PHYSIOLOGY', 'taxonomy-anatomy-and-physiology', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-biology';

-- Module 3: Module III (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-biology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('ANIMAL AND PLANT HUSBANDRY, PHARMACOLOGY, TOXICOLOGY, ENTOMOLOGY AND PLANT PATHOLOGY', 'animal-and-plant-husbandry-pharmacology-toxicology-entomology-and-plant-pathology', NULL::text),
  ('BIOCHEMISTRY, ANATOMY AND PHYSIOLOGY', 'biochemistry-anatomy-and-physiology', NULL::text),
  ('CYTOLOGY, HISTOLOGY AND GENETICS', 'cytology-histology-and-genetics', NULL::text),
  ('MICROBIOLOGY, PARASITOLOGY AND IMMUNOLOGY', 'microbiology-parasitology-and-immunology', NULL::text),
  ('APPLIED BIOLOGY PRACTICAL III', 'applied-biology-practical-iii', NULL::text),
  ('IMMUNOLOGY AND BIOCHEMISTRY', 'immunology-and-biochemistry', NULL::text),
  ('LABORATORY PRACTICE AND MANAGEMENT', 'laboratory-practice-and-management', NULL::text),
  ('TAXONOMY, ECOLOGY, SOIL STUDY, HERBARIUM', 'taxonomy-ecology-soil-study-herbarium', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-biology';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN APPLIED STATISTICS [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-statistics';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-statistics';

-- Module 3: Module III (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-statistics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLIED ECONOMICS', 'applied-economics', NULL::text),
  ('APPLIED STATISTICS', 'applied-statistics', NULL::text),
  ('COMPUTING', 'computing', NULL::text),
  ('ELEMENTS OF ACCOUNTS', 'elements-of-accounts', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('STATISTICAL METHODS', 'statistical-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-applied-statistics';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN MEDICAL LABORATORY TECHNOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-medical-laboratory-technology';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-medical-laboratory-technology';

-- Module 3: Module III (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-medical-laboratory-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CHEMICAL PATHOLOGY', 'chemical-pathology', NULL::text),
  ('HAEMATOLOGY AND IMMUNO-HAEMATOLOGY', 'haematology-and-immuno-haematology', NULL::text),
  ('PARASITOLOGY AND HISTOLOGICAL TECHNIQUES', 'parasitology-and-histological-techniques', NULL::text),
  ('MEDICAL MICROBIOLOGY', 'medical-microbiology', NULL::text),
  ('IMMUNOLOGY', 'immunology', NULL::text),
  ('LABORATORY PRACTICE AND MANAGEMENT', 'laboratory-practice-and-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-medical-laboratory-technology';

-- ------------------------------------------------------------------------------
-- Course: SCIENCE LABORATORY TECHNOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'science-laboratory-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BIOLOGY TECHNIQUES', 'biology-techniques', NULL::text),
  ('SCIENCE LABORATORY', 'science-laboratory', NULL::text),
  ('CHEMISTRY TECHNIQUES', 'chemistry-techniques', NULL::text),
  ('PHYSICAL TECHNIQUES', 'physical-techniques', NULL::text),
  ('PRINCIPLE OF LABORATORY AND WORKSHOP PRACTICES', 'principle-of-laboratory-and-workshop-practices', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'science-laboratory-technology';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'science-laboratory-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMMUNICATION', 'communication', NULL::text),
  ('BIOLOGY TECHNIQUES II', 'biology-techniques-ii', NULL::text),
  ('PHYSICS TECHNIQUES II', 'physics-techniques-ii', NULL::text),
  ('CHEMISTRY TECHNIQUES II', 'chemistry-techniques-ii', NULL::text),
  ('SCIENCE LABORATORY TECHNIQUES II (PRACTICAL)', 'science-laboratory-techniques-ii-practical', NULL::text),
  ('PRINCIPLES OF LABORATORY AND WORKSHOP PRACTICE II', 'principles-of-laboratory-and-workshop-practice-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'science-laboratory-technology';

-- Module 3: Module III (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'science-laboratory-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('LABORATORY PRACTICES', 'laboratory-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'science-laboratory-technology';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN ENVIRONMENTAL SCIENCE [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-environmental-science';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENVIRONMENTAL ECOLOGY AND ECONOMICS', 'environmental-ecology-and-economics', NULL::text),
  ('ENVIRONMENTAL BIOLOGY', 'environmental-biology', NULL::text),
  ('ENVIRONMENTAL CHEMISTRY AND APPLIED SCIENCE', 'environmental-chemistry-and-applied-science', NULL::text),
  ('ENVIRONMENTAL LABORATORY PRACTICE', 'environmental-laboratory-practice', NULL::text),
  ('HUMAN ECOLOGY AND ECONOMICS', 'human-ecology-and-economics', NULL::text),
  ('ICT, COMMUNICATION SKILLS AND ENTREPRENEURSHIP', 'ict-communication-skills-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-environmental-science';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-environmental-science';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('EARTH SCIENCE AND ENVIRONMENTAL INFORMATION SYSTEM', 'earth-science-and-environmental-information-system', NULL::text),
  ('ENVIRONMENTAL POLLUTION CONTROL, HEALTH AND SAFETY', 'environmental-pollution-control-health-and-safety', NULL::text),
  ('ENVIRONMENTAL MICROBIOLOGY', 'environmental-microbiology', NULL::text),
  ('ENVIRONMENTAL RESOURCE MANAGEMENT AND ECONOMICS', 'environmental-resource-management-and-economics', NULL::text),
  ('ENVIRONMENTAL ANALYTICAL TECHNIQUES', 'environmental-analytical-techniques', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-environmental-science';

-- Module 3: Module III (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-environmental-science';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('ATMOSPHERIC SCIENCE', 'atmospheric-science', NULL::text),
  ('ENVIRONMENTAL ANALYTICAL TECHNIQUES AND LABORATORY MANAGEMENT', 'environmental-analytical-techniques-and-laboratory-management', NULL::text),
  ('ENVIRONMENTAL BIOCHEMISTRY AND TOXICOLOGY', 'environmental-biochemistry-and-toxicology', NULL::text),
  ('ENVIRONMENTAL WASTE MANAGEMENT, EIA AND ENVIRONMENTAL LAW', 'environmental-waste-management-eia-and-environmental-law', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'applied-sciences' AND c.slug = 'diploma-in-environmental-science';

COMMIT;
-- Verification Query: Check courses and units inserted for APPLIED SCIENCES
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'applied-sciences'
-- GROUP BY d.name;