-- ==============================================================================
-- SEED SCRIPT FOR: MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 28 | Total Units: 316
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

-- 2. Upsert Department: MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT', 'mechanical-and-automotive-engineering-department', 'Accredited TVET CDACC Mechanical and Automotive Engineering modular courses in Automotive, Autobody, Construction Plant, Mechanical Production, Welding, and Robotics.', 10
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department'
);

-- 4. Insert Courses under MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOBODY TECHNOLOGY LEVEL 6', 'autobody-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE ENGINEERING TECHNOLOGY LEVEL 6', 'automotive-engineering-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CONSTRUCTION PLANT TECHNOLOGY LEVEL 6', 'construction-plant-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL AUTOMATION AND ROBOTICS TECHNOLOGY LEVEL 6', 'industrial-automation-and-robotics-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PLANT TECHNOLOGY LEVEL 6', 'mechanical-plant-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION TECHNOLOGY LEVEL 6', 'mechanical-production-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOBODY TECHNOLOGY LEVEL 5', 'autobody-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE ENGINEERING TECHNOLOGY LEVEL 5', 'automotive-engineering-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CONSTRUCTION PLANT TECHNOLOGY LEVEL 5', 'construction-plant-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL AUTOMATION AND ROBOTICS TECHNOLOGY LEVEL 5', 'industrial-automation-and-robotics-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PLANT TECHNOLOGY LEVEL 5', 'mechanical-plant-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION TECHNOLOGY LEVEL 5', 'mechanical-production-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING TECHNOLOGY LEVEL 5', 'welding-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CNC LATHE OPERATIONS (PRODUCTION) LEVEL 4', 'cnc-lathe-operations-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CNC MILLING OPERATIONS (PRODUCTION) LEVEL 4', 'cnc-milling-operations-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL AUTOMATION AND ROBOTICS OPERATIONS LEVEL 4', 'industrial-automation-and-robotics-operations-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PIPING FABRICATION LEVEL 4', 'mechanical-piping-fabrication-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION MACHINE OPERATION LEVEL 4', 'mechanical-production-machine-operation-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTOR VEHICLE ELECTRICS LEVEL 4', 'motor-vehicle-electrics-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTOR VEHICLE MECHANICS LEVEL 4', 'motor-vehicle-mechanics-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTORCYCLE MECHANICS LEVEL 4', 'motorcycle-mechanics-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SPRAY PAINTING LEVEL 4', 'spray-painting-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING LEVEL 4', 'welding-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTOR VEHICLE ELECTRICS LEVEL 3', 'motor-vehicle-electrics-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTOR VEHICLE MECHANICS LEVEL 3', 'motor-vehicle-mechanics-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MOTORCYCLE MECHANICS LEVEL 3', 'motorcycle-mechanics-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'PANEL BEATING LEVEL 3', 'panel-beating-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING LEVEL 3', 'welding-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'mechanical-and-automotive-engineering-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: AUTOBODY TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM VEHICLE FIBRE WORKS', 'perform-vehicle-fibre-works', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('WELD VEHICLE STRUCTURE I', 'weld-vehicle-structure-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM VEHICLE BODY SURFACE PREPARATION', 'perform-vehicle-body-surface-preparation', NULL::text),
  ('PERFORM VEHICLE BODY VALETING', 'perform-vehicle-body-valeting', NULL::text),
  ('PERFORM VEHICLE SPRAY PAINTING', 'perform-vehicle-spray-painting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL VEHICLE GLASS COMPONENTS', 'install-vehicle-glass-components', NULL::text),
  ('PERFORM GLAZING FINISHING PROCESSES', 'perform-glazing-finishing-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRONICS AND CONTROL PRINCIPLES', 'apply-electronics-and-control-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN GLASS COMPONENTS', 'maintain-glass-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text),
  ('WELD VEHICLE STRUCTURE II', 'weld-vehicle-structure-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('DESIGN VEHICLE BODY', 'design-vehicle-body', NULL::text),
  ('TRIM VEHICLE BODY', 'trim-vehicle-body', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS', 'apply-thermodynamics-and-fluid-mechanics', NULL::text),
  ('ASSEMBLE VEHICLE BODY PARTS', 'assemble-vehicle-body-parts', NULL::text),
  ('FABRICATE VEHICLE STRUCTURE', 'fabricate-vehicle-structure', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE ENGINEERING TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN VEHICLE BRAKING SYSTEM', 'maintain-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE PETROL ENGINE', 'maintain-vehicle-petrol-engine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN VEHICLE DIESEL ENGINE', 'maintain-vehicle-diesel-engine', NULL::text),
  ('MAINTAIN VEHICLE SUSPENSION AND STEERING SYSTEM', 'maintain-vehicle-suspension-and-steering-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MAINTAIN AUTOMOTIVE ELECTRICAL SYSTEMS', 'maintain-automotive-electrical-systems', NULL::text),
  ('MAINTAIN VEHICLE FUEL SYSTEM', 'maintain-vehicle-fuel-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN VEHICLE TRANSMISSION SYSTEM', 'maintain-vehicle-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('MAINTAIN HYBRID AND ELECTRIC VEHICLE', 'maintain-hybrid-and-electric-vehicle', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('MAINTAIN VEHICLE SAFETY AND SECURITY SYSTEM', 'maintain-vehicle-safety-and-security-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS', 'apply-thermodynamics-and-fluid-mechanics', NULL::text),
  ('MAINTAIN VEHICLE COMFORT SYSTEM', 'maintain-vehicle-comfort-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: CONSTRUCTION PLANT TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT ENGINES', 'maintain-construction-plant-engines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT HYDRAULIC SYSTEM', 'maintain-construction-plant-hydraulic-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT BRAKE SYSTEM', 'maintain-construction-plant-brake-system', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT TRANSMISSION SYSTEM', 'maintain-construction-plant-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT STEERING AND SUSPENSION SYSTEMS', 'maintain-construction-plant-steering-and-suspension-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS', 'apply-thermodynamics-and-fluid-mechanics', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT ATTACHMENTS', 'maintain-construction-plant-attachments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('MAINTAIN CONSTRUCTION PLANT UNDERCARRIAGE', 'maintain-construction-plant-undercarriage', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY ELECTRONICS AND CONTROL PRINCIPLES', 'apply-electronics-and-control-principles', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT ELECTRICAL SYSTEMS', 'maintain-construction-plant-electrical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL AUTOMATION AND ROBOTICS TECHNOLOGY LEVEL 6 (8 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN PRODUCT QUALITY', 'maintain-product-quality', NULL::text),
  ('OPERATE INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'operate-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'maintain-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('INSTALL AND MAINTAIN INDUSTRIAL AUTOMATION ELECTRICAL SYSTEMS', 'install-and-maintain-industrial-automation-electrical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('INSTALL AND MAINTAIN PNEUMATIC SYSTEMS', 'install-and-maintain-pneumatic-systems', NULL::text),
  ('INSTALL AND MAINTAIN STAND-ALONE CONTROLLED SYSTEMS', 'install-and-maintain-stand-alone-controlled-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL AND MAINTAIN HYDRAULIC SYSTEMS', 'install-and-maintain-hydraulic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('INSTALL AND MAINTAIN ELECTRICAL DRIVES', 'install-and-maintain-electrical-drives', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('INSTALL AND MAINTAIN PROGRAMMABLE LOGIC CONTROLLERS', 'install-and-maintain-programmable-logic-controllers', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- Module 8: Module 8
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 8, 'Module 8'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 8
JOIN (VALUES
  ('INSTALL AND MAINTAIN DISTRIBUTED CONTROL SYSTEMS', 'install-and-maintain-distributed-control-systems', NULL::text),
  ('INSTALL AND MAINTAIN INDUSTRIAL ROBOTIC SYSTEMS', 'install-and-maintain-industrial-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PLANT TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('INSTALL MECHANICAL PUMPS AND COMPRESSORS', 'install-mechanical-pumps-and-compressors', NULL::text),
  ('MAINTAIN MECHANICAL PUMPS AND COMPRESSORS', 'maintain-mechanical-pumps-and-compressors', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEMS', 'install-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('INSTALL MATERIAL HANDLING SYSTEM', 'install-material-handling-system', NULL::text),
  ('MAINTAIN MATERIAL HANDLING SYSTEMS', 'maintain-material-handling-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('INSTALL REFRIGERATION AND AIR CONDITIONING SYSTEM', 'install-refrigeration-and-air-conditioning-system', NULL::text),
  ('MAINTAIN REFRIGERATION AND AIR CONDITIONING SYSTEMS', 'maintain-refrigeration-and-air-conditioning-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('INSTALL STEAM SYSTEM', 'install-steam-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('MAINTAIN BOILER AND STEAM SYSTEM', 'maintain-boiler-and-steam-system', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY ELECTRONICS AND CONTROL PRINCIPLES', 'apply-electronics-and-control-principles', NULL::text),
  ('DESIGN MECHANICAL PLANT SYSTEM', 'design-mechanical-plant-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION TECHNOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('JOIN PARTS BY WELDING', 'join-parts-by-welding', NULL::text),
  ('PERFORM GENERAL FITTING OPERATIONS', 'perform-general-fitting-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM LATHE OPERATIONS', 'perform-lathe-operations', NULL::text),
  ('PERFORM MILLING OPERATIONS', 'perform-milling-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATERIAL SCIENCE AND METALLURGY', 'apply-material-science-and-metallurgy', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('PERFORM GRINDING OPERATIONS', 'perform-grinding-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMPUTER AIDED DRAWING', 'apply-computer-aided-drawing', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS PRINCIPLES', 'apply-thermodynamics-and-fluid-mechanics-principles', NULL::text),
  ('PERFORM FORGING WORKS', 'perform-forging-works', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY CONTROL SYSTEMS', 'apply-control-systems', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('OPERATE CNC MILLING MACHINE', 'operate-cnc-milling-machine', NULL::text),
  ('PERFORM FOUNDRY WORKS', 'perform-foundry-works', NULL::text),
  ('PRODUCE PARTS BY CNC LATHE', 'produce-parts-by-cnc-lathe', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOBODY TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM VEHICLE FIBRE WORKS', 'perform-vehicle-fibre-works', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('WELD VEHICLE STRUCTURE I', 'weld-vehicle-structure-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM VEHICLE BODY SURFACE PREPARATION', 'perform-vehicle-body-surface-preparation', NULL::text),
  ('PERFORM VEHICLE BODY VALETING', 'perform-vehicle-body-valeting', NULL::text),
  ('PERFORM VEHICLE SPRAY PAINTING', 'perform-vehicle-spray-painting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL VEHICLE GLASS COMPONENTS', 'install-vehicle-glass-components', NULL::text),
  ('PERFORM GLAZING FINISHING PROCESSES', 'perform-glazing-finishing-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN GLASS COMPONENTS', 'maintain-glass-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE ENGINEERING TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN VEHICLE BRAKING SYSTEM', 'maintain-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE PETROL ENGINE', 'maintain-vehicle-petrol-engine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN VEHICLE DIESEL ENGINE', 'maintain-vehicle-diesel-engine', NULL::text),
  ('MAINTAIN VEHICLE SUSPENSION AND STEERING SYSTEM', 'maintain-vehicle-suspension-and-steering-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('MAINTAIN AUTOMOTIVE ELECTRICAL SYSTEMS', 'maintain-automotive-electrical-systems', NULL::text),
  ('MAINTAIN VEHICLE FUEL SYSTEM', 'maintain-vehicle-fuel-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN VEHICLE TRANSMISSION SYSTEM', 'maintain-vehicle-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: CONSTRUCTION PLANT TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT ENGINES', 'maintain-construction-plant-engines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT HYDRAULIC SYSTEM', 'maintain-construction-plant-hydraulic-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT BRAKE SYSTEM', 'maintain-construction-plant-brake-system', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT TRANSMISSION SYSTEM', 'maintain-construction-plant-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN CONSTRUCTION PLANT STEERING AND SUSPENSION SYSTEMS', 'maintain-construction-plant-steering-and-suspension-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'construction-plant-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL AUTOMATION AND ROBOTICS TECHNOLOGY LEVEL 5 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN PRODUCT QUALITY', 'maintain-product-quality', NULL::text),
  ('OPERATE INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'operate-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'maintain-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('INSTALL AND MAINTAIN INDUSTRIAL AUTOMATION ELECTRICAL SYSTEMS', 'install-and-maintain-industrial-automation-electrical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('INSTALL AND MAINTAIN PNEUMATIC SYSTEMS', 'install-and-maintain-pneumatic-systems', NULL::text),
  ('INSTALL AND MAINTAIN STAND-ALONE CONTROLLED SYSTEMS', 'install-and-maintain-stand-alone-controlled-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL AND MAINTAIN HYDRAULIC SYSTEMS', 'install-and-maintain-hydraulic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PLANT TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY', 'apply-workshop-technology', NULL::text),
  ('INSTALL MECHANICAL PUMPS AND COMPRESSORS', 'install-mechanical-pumps-and-compressors', NULL::text),
  ('MAINTAIN MECHANICAL PUMPS AND COMPRESSORS', 'maintain-mechanical-pumps-and-compressors', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEMS', 'install-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('INSTALL MATERIAL HANDLING SYSTEM', 'install-material-handling-system', NULL::text),
  ('MAINTAIN MATERIAL HANDLING SYSTEMS', 'maintain-material-handling-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('INSTALL REFRIGERATION AND AIR CONDITIONING SYSTEM', 'install-refrigeration-and-air-conditioning-system', NULL::text),
  ('MAINTAIN REFRIGERATION AND AIR CONDITIONING SYSTEMS', 'maintain-refrigeration-and-air-conditioning-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('JOIN PARTS BY WELDING', 'join-parts-by-welding', NULL::text),
  ('PERFORM GENERAL FITTING OPERATIONS', 'perform-general-fitting-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM LATHE OPERATIONS', 'perform-lathe-operations', NULL::text),
  ('PERFORM MILLING OPERATIONS', 'perform-milling-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY MATERIAL SCIENCE AND METALLURGY', 'apply-material-science-and-metallurgy', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTICAL AND ELECTRONICS PRINCIPLES', 'apply-electical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY TECHNICAL DRAWING', 'apply-technical-drawing', NULL::text),
  ('PERFORM GRINDING OPERATIONS', 'perform-grinding-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: WELDING TECHNOLOGY LEVEL 5 (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM ARC WENDI PROCESSES I', 'perform-arc-wendi-processes-i', NULL::text),
  ('PERFORM BRAZING SOLDERING AND GAS WELDING', 'perform-brazing-soldering-and-gas-welding', NULL::text),
  ('PERFORM FABRICATION PROCESSES I', 'perform-fabrication-processes-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM METAL INERT GAS WELDING', 'perform-metal-inert-gas-welding', NULL::text),
  ('PERFORM TUNGSTEN INERT GAS WELDING', 'perform-tungsten-inert-gas-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY MATHEMATICS', 'apply-mathematics', NULL::text),
  ('APPLY MECHANICAL SCIENCE', 'apply-mechanical-science', NULL::text),
  ('APPLY METALLURGY', 'apply-metallurgy', NULL::text),
  ('APPLY TECHNICAL DRAWINGS', 'apply-technical-drawings', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM ARC WELDING PROCESSES II', 'perform-arc-welding-processes-ii', NULL::text),
  ('PERFORM FABRICATION PROCESSES II', 'perform-fabrication-processes-ii', NULL::text),
  ('PERFORM GAS METAL ARC WELDING OPERATIONS', 'perform-gas-metal-arc-welding-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: CNC LATHE OPERATIONS (PRODUCTION) LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-lathe-operations-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM CAD DESIGN', 'perform-cad-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-lathe-operations-production-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-lathe-operations-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE CNC LATHE COMPONENTS', 'produce-cnc-lathe-components', NULL::text),
  ('PROGRAM CNC LATHE MACHINE', 'program-cnc-lathe-machine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-lathe-operations-production-level-4';

-- ------------------------------------------------------------------------------
-- Course: CNC MILLING OPERATIONS (PRODUCTION) LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-milling-operations-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM CAD DESIGN', 'perform-cad-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-milling-operations-production-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-milling-operations-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE CNC MILLING COMPONENTS', 'produce-cnc-milling-components', NULL::text),
  ('PROGRAM CNC MILLING MACHINES', 'program-cnc-milling-machines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'cnc-milling-operations-production-level-4';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL AUTOMATION AND ROBOTICS OPERATIONS LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-operations-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN PRODUCT QUALITY', 'maintain-product-quality', NULL::text),
  ('OPERATE INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'operate-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-operations-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-operations-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRY TRAINING', 'industry-training', NULL::text),
  ('MAINTAIN INDUSTRIAL AUTOMATION AND ROBOTIC SYSTEMS', 'maintain-industrial-automation-and-robotic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-operations-level-4';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PIPING FABRICATION LEVEL 4 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-piping-fabrication-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-piping-fabrication-level-4';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION MACHINE OPERATION LEVEL 4 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-machine-operation-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-machine-operation-level-4';

-- ------------------------------------------------------------------------------
-- Course: MOTOR VEHICLE ELECTRICS LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN VEHICLE CHARGING SYSTEM', 'maintain-vehicle-charging-system', NULL::text),
  ('MAINTAIN VEHICLE LIGHTING SYSTEM', 'maintain-vehicle-lighting-system', NULL::text),
  ('SERVICE VEHICLE STARTING SYSTEMS', 'service-vehicle-starting-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DIAGNOSE CAR ON BOARD SYSTEM', 'diagnose-car-on-board-system', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN VEHICLE ENGINE', 'maintain-vehicle-engine', NULL::text),
  ('SERVICE VEHICLE IGNITION SYSTEMS', 'service-vehicle-ignition-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-4';

-- ------------------------------------------------------------------------------
-- Course: MOTOR VEHICLE MECHANICS LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN VEHICLE BRAKING SYSTEM', 'maintain-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE PETROL ENGINE', 'maintain-vehicle-petrol-engine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN VEHICLE DIESEL ENGINE', 'maintain-vehicle-diesel-engine', NULL::text),
  ('MAINTAIN VEHICLE SUSPENSION AND STEERING SYSTEM', 'maintain-vehicle-suspension-and-steering-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-4';

-- ------------------------------------------------------------------------------
-- Course: MOTORCYCLE MECHANICS LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN MOTORCYCLE ENGINE', 'maintain-motorcycle-engine', NULL::text),
  ('MAINTAIN MOTORCYCLE FRAME', 'maintain-motorcycle-frame', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN ELECTRIC MOTORCYCLE POWER TRAIN', 'maintain-electric-motorcycle-power-train', NULL::text),
  ('MAINTAIN MOTORCYCLE BODY', 'maintain-motorcycle-body', NULL::text),
  ('MAINTAIN MOTORCYCLE ELECTRICAL SYSTEM', 'maintain-motorcycle-electrical-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-4';

-- ------------------------------------------------------------------------------
-- Course: SPRAY PAINTING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'spray-painting-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM VEHICLE FIBRE WORKS', 'perform-vehicle-fibre-works', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('WELD VEHICLE STRUCTURE', 'weld-vehicle-structure', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'spray-painting-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'spray-painting-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM VEHICLE BODY SURFACE PREPARATION', 'perform-vehicle-body-surface-preparation', NULL::text),
  ('PERFORM VEHICLE BODY VALETING', 'perform-vehicle-body-valeting', NULL::text),
  ('PERFORM VEHICLE SPRAY PAINTING', 'perform-vehicle-spray-painting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'spray-painting-level-4';

-- ------------------------------------------------------------------------------
-- Course: WELDING LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM ARC WELDING PROCESSES I', 'perform-arc-welding-processes-i', NULL::text),
  ('PERFORM BRAZING', 'perform-brazing', NULL::text),
  ('PERFORM FABRICATION PROCESSES I', 'perform-fabrication-processes-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM METAL INERT GAS WELDING', 'perform-metal-inert-gas-welding', NULL::text),
  ('PERFORM TUNGSTEN INERT GAS WELDING', 'perform-tungsten-inert-gas-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';

-- ------------------------------------------------------------------------------
-- Course: MOTOR VEHICLE ELECTRICS LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN VEHICLE CHARGING SYSTEM', 'maintain-vehicle-charging-system', NULL::text),
  ('MAINTAIN VEHICLE LIGHTING SYSTEM', 'maintain-vehicle-lighting-system', NULL::text),
  ('SERVICE VEHICLE STARTING SYSTEMS', 'service-vehicle-starting-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-electrics-level-3';

-- ------------------------------------------------------------------------------
-- Course: MOTOR VEHICLE MECHANICS LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL TRAINING', 'industrial-training', NULL::text),
  ('MAINTAIN VEHICLE BRAKING SYSTEM', 'maintain-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE PETROL ENGINE', 'maintain-vehicle-petrol-engine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motor-vehicle-mechanics-level-3';

-- ------------------------------------------------------------------------------
-- Course: MOTORCYCLE MECHANICS LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('MAINTAIN MOTORCYCLE ENGINE', 'maintain-motorcycle-engine', NULL::text),
  ('MAINTAIN MOTORCYCLE FRAME', 'maintain-motorcycle-frame', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'motorcycle-mechanics-level-3';

-- ------------------------------------------------------------------------------
-- Course: PANEL BEATING LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'panel-beating-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM VEHICLE FIBRE WORKS', 'perform-vehicle-fibre-works', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('WELD VEHICLE STRUCTURE', 'weld-vehicle-structure', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'panel-beating-level-3';

-- ------------------------------------------------------------------------------
-- Course: WELDING LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM ARC WELDING PROCESSES I', 'perform-arc-welding-processes-i', NULL::text),
  ('PERFORM FABRICATION PROCESSES I', 'perform-fabrication-processes-i', NULL::text),
  ('PERFORM GAS WELDING', 'perform-gas-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-3';

COMMIT;
-- Verification Query: Check courses and units inserted for MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'mechanical-and-automotive-engineering-department'
-- GROUP BY d.name;