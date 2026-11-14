-- ==============================================================================
-- SEED SCRIPT FOR: MECHANICAL AND AUTOMOTIVE ENGINEERING (KNEC COURSES)
-- Total Courses: 6 | Total Units: 103
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

-- 2. Upsert Department under KNEC: MECHANICAL AND AUTOMOTIVE ENGINEERING
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'MECHANICAL AND AUTOMOTIVE ENGINEERING', 'mechanical-and-automotive-engineering', 'KNEC Diploma, Certificate, and Artisan past examination papers and modules in Automotive Engineering, Mechanical Plant, Production, and Motor Vehicle Mechanics.', 11
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'mechanical-and-automotive-engineering'
);

-- 4. Insert KNEC Courses under MECHANICAL AND AUTOMOTIVE ENGINEERING
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN AUTOMOTIVE ENGINEERING', 'diploma-in-automotive-engineering', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'mechanical-and-automotive-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN MECHANICAL ENGINEERING', 'diploma-in-mechanical-engineering', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'mechanical-and-automotive-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN AUTOMOTIVE ENGINEERING', 'certificate-in-automotive-engineering', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'mechanical-and-automotive-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN MECHANICAL ENGINEERING', 'certificate-in-mechanical-engineering', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'mechanical-and-automotive-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN MOTOR VEHICLE ENGINEERING', 'certificate-in-motor-vehicle-engineering', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'mechanical-and-automotive-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN MOTOR VEHICLE MECHANICS', 'artisan-in-motor-vehicle-mechanics', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'mechanical-and-automotive-engineering';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN AUTOMOTIVE ENGINEERING [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-automotive-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENGINEERING DRAWING I', 'engineering-drawing-i', NULL::text),
  ('ENGINEERING MATHEMATICS I', 'engineering-mathematics-i', NULL::text),
  ('MOTOR VEHICLE TECHNOLOGY AND PRACTICE', 'motor-vehicle-technology-and-practice', NULL::text),
  ('WORKSHOP TECHNOLOGY', 'workshop-technology', NULL::text),
  ('MATERIALS AND METALLURGY', 'materials-and-metallurgy', NULL::text),
  ('MECHANICAL SCIENCE', 'mechanical-science', NULL::text),
  ('ELECTRICAL AND ELECTRONICS PRINCIPLES', 'electrical-and-electronics-principles', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-automotive-engineering';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-automotive-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('STRENGTH OF MATERIALS', 'strength-of-materials', NULL::text),
  ('MACHINE MECHANICS', 'machine-mechanics', NULL::text),
  ('ENGINE TECHNOLOGY AND BODYWORKS', 'engine-technology-and-bodyworks', NULL::text),
  ('ENGINEERING DRAWING AND DESIGN', 'engineering-drawing-and-design', NULL::text),
  ('ENGINEERING MATHEMATICS II', 'engineering-mathematics-ii', NULL::text),
  ('INDUSTRIAL ORGANIZATION AND MANAGEMENT', 'industrial-organization-and-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-automotive-engineering';

-- Module 3: Module III (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-automotive-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('AUTO ELECTRICS AND ELECTRONICS', 'auto-electrics-and-electronics', NULL::text),
  ('CONTROL SYSTEMS AND INSTRUMENTATION', 'control-systems-and-instrumentation', NULL::text),
  ('ENGINEERING MATHEMATICS III', 'engineering-mathematics-iii', NULL::text),
  ('THERMODYNAMICS', 'thermodynamics', NULL::text),
  ('FLUID MECHANICS', 'fluid-mechanics', NULL::text),
  ('COMPUTER AIDED DESIGN', 'computer-aided-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-automotive-engineering';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN MECHANICAL ENGINEERING [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-mechanical-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('MECHANICAL SCIENCE', 'mechanical-science', NULL::text),
  ('ELECTRICAL AND ELECTRONICS PRINCIPLES', 'electrical-and-electronics-principles', NULL::text),
  ('WORKSHOP TECHNOLOGY', 'workshop-technology', NULL::text),
  ('PLANT MAINTENANCE', 'plant-maintenance', NULL::text),
  ('ENGINEERING DRAWING I', 'engineering-drawing-i', NULL::text),
  ('ENGINEERING MATHEMATICS I', 'engineering-mathematics-i', NULL::text),
  ('STRUCTURAL FABRICATION TECHNOLOGY', 'structural-fabrication-technology', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-mechanical-engineering';

-- Module 2: Module II (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-mechanical-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('STRENGTH OF MATERIALS', 'strength-of-materials', NULL::text),
  ('MACHINE MECHANICS', 'machine-mechanics', NULL::text),
  ('MATERIALS AND METALLURGY', 'materials-and-metallurgy', NULL::text),
  ('ENGINEERING DRAWING 2 AND DESIGN', 'engineering-drawing-2-and-design', NULL::text),
  ('BUILDING SERVICES', 'building-services', NULL::text),
  ('ENGINEERING MATHEMATICS II', 'engineering-mathematics-ii', NULL::text),
  ('PLANT ENGINEERING DRAWING', 'plant-engineering-drawing', NULL::text),
  ('TOOL ROOM PROCESSES TECHNOLOGY 2', 'tool-room-processes-technology-2', NULL::text),
  ('METROLOGY', 'metrology', NULL::text),
  ('INDUSTRIAL ORGANIZATION AND MANAGEMENT', 'industrial-organization-and-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-mechanical-engineering';

-- Module 3: Module III (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-mechanical-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('COMPUTER AIDED DESIGN', 'computer-aided-design', NULL::text),
  ('AUTO ELECTRICS AND ELECTRONICS', 'auto-electrics-and-electronics', NULL::text),
  ('CONTROL SYSTEMS', 'control-systems', NULL::text),
  ('INSTRUMENTATION', 'instrumentation', NULL::text),
  ('ENGINEERING MATHEMATICS III', 'engineering-mathematics-iii', NULL::text),
  ('THERMODYNAMICS', 'thermodynamics', NULL::text),
  ('FLUID MECHANICS', 'fluid-mechanics', NULL::text),
  ('CONSTRUCTION PLANT TECHNOLOGY AND PRACTICE 3', 'construction-plant-technology-and-practice-3', NULL::text),
  ('POWER PRODUCTION SYSTEMS', 'power-production-systems', NULL::text),
  ('PRODUCTION LINE PROCESSES', 'production-line-processes', NULL::text),
  ('FOUNDRY TECHNOLOGY', 'foundry-technology', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'diploma-in-mechanical-engineering';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN AUTOMOTIVE ENGINEERING [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-automotive-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MATHEMATICS I', 'mathematics-i', NULL::text),
  ('TECHNICAL DRAWING', 'technical-drawing', NULL::text),
  ('MOTOR VEHICLE TRADE PRACTICE', 'motor-vehicle-trade-practice', NULL::text),
  ('APPLIED SCIENCE', 'applied-science', NULL::text),
  ('ELECTRICAL PRINCIPLES', 'electrical-principles', NULL::text),
  ('VEHICLE TECHNOLOGY', 'vehicle-technology', NULL::text),
  ('WORKSHOP TECHNOLOGY', 'workshop-technology', NULL::text),
  ('VEHICLE BODYWORKS', 'vehicle-bodyworks', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-automotive-engineering';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-automotive-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('MATHEMATICS II', 'mathematics-ii', NULL::text),
  ('ENGINE TECHNOLOGY', 'engine-technology', NULL::text),
  ('AUTO ELECTRICS', 'auto-electrics', NULL::text),
  ('TECHNICAL DRAWING II', 'technical-drawing-ii', NULL::text),
  ('TRADE PRACTICE II', 'trade-practice-ii', NULL::text),
  ('WORKSHOP ORGANIZATION MANAGEMENT', 'workshop-organization-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-automotive-engineering';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN MECHANICAL ENGINEERING [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-mechanical-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ELECTRICAL PRINCIPLES', 'electrical-principles', NULL::text),
  ('FABRICATION TECHNOLOGY', 'fabrication-technology', NULL::text),
  ('MATHEMATICS I', 'mathematics-i', NULL::text),
  ('MECHANICAL SCIENCE I', 'mechanical-science-i', NULL::text),
  ('TECHNICAL DRAWING', 'technical-drawing', NULL::text),
  ('WORKSHOP TECHNOLOGY AND PRACTICE', 'workshop-technology-and-practice', NULL::text),
  ('PLANT MAINTENANCE AND SAFETY', 'plant-maintenance-and-safety', NULL::text),
  ('MATERIALS AND METALLURGY', 'materials-and-metallurgy', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-mechanical-engineering';

-- Module 2: Module II (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-mechanical-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text),
  ('PLANT DRAWING', 'plant-drawing', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('INDUSTRIAL PLANT TECHNOLOGY', 'industrial-plant-technology', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('WORKSHOP ORGANIZATION AND MANAGEMENT', 'workshop-organization-and-management', NULL::text),
  ('MATHEMATICS II', 'mathematics-ii', NULL::text),
  ('MECHANICAL SCIENCE II', 'mechanical-science-ii', NULL::text),
  ('TECHNICAL DRAWING II', 'technical-drawing-ii', NULL::text),
  ('PRODUCTION PROCESS', 'production-process', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-mechanical-engineering';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN MOTOR VEHICLE ENGINEERING [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-motor-vehicle-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLIED SCIENCE AND ELECTRICAL PRINCIPLES', 'applied-science-and-electrical-principles', NULL::text),
  ('VEHICLE TECHNOLOGY', 'vehicle-technology', NULL::text),
  ('BODY WORKS', 'body-works', NULL::text),
  ('WORKSHOP TECHNOLOGY', 'workshop-technology', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-motor-vehicle-engineering';

-- Module 2: Module II (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-motor-vehicle-engineering';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ENGINE TECHNOLOGY AND AUTO ELECTRICS', 'engine-technology-and-auto-electrics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'certificate-in-motor-vehicle-engineering';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN MOTOR VEHICLE MECHANICS [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'artisan-in-motor-vehicle-mechanics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLIED GEOMETRY', 'applied-geometry', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('SCIENCE', 'science', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering' AND c.slug = 'artisan-in-motor-vehicle-mechanics';

COMMIT;
-- Verification Query: Check courses and units inserted for MECHANICAL AND AUTOMOTIVE ENGINEERING
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'mechanical-and-automotive-engineering'
-- GROUP BY d.name;