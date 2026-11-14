-- ==============================================================================
-- SEED SCRIPT FOR: ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 15 | Total Units: 195
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

-- 2. Upsert Department: ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT', 'electrical-and-electronic-engineering-department', 'Accredited TVET CDACC Electrical and Electronic Engineering modular courses in Electrical Installation, Mechatronics, Instrumentation & Control, Solar PV, and Telecommunications.', 6
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department'
);

-- 4. Insert Courses under ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL ENGINEERING TECHNOLOGY LEVEL 6', 'electrical-engineering-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL MECHATRONICS TECHNOLOGY LEVEL 6', 'industrial-mechatronics-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INSTRUMENTATION AND CONTROL TECHNICIAN LEVEL 6', 'instrumentation-and-control-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TELECOMMUNICATION TECHNOLOGY LEVEL 6', 'telecommunication-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL ENGINEERING TECHNOLOGY LEVEL 5', 'electrical-engineering-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INSTRUMENTATION AND CONTROL TECHNOLOGY LEVEL 5', 'instrumentation-and-control-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV SYSTEM INSTALLATION TECHNOLOGY LEVEL 5', 'solar-pv-system-installation-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TELECOMMUNICATION TECHNOLOGY LEVEL 5', 'telecommunication-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION TECHNOLOGY LEVEL 4', 'electrical-installation-technology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS ARTISAN LEVEL 4', 'electronics-artisan-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INSTRUMENTATION AND CONTROL OPERATOR LEVEL 4', 'instrumentation-and-control-operator-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV SYSTEMS INSTALLER LEVEL 4', 'solar-pv-systems-installer-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRICAL INSTALLATION TECHNOLOGY LEVEL 3', 'electrical-installation-technology-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ELECTRONICS ARTISAN LEVEL 3', 'electronics-artisan-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'SOLAR PV SYSTEMS INSTALLER LEVEL 3', 'solar-pv-systems-installer-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'electrical-and-electronic-engineering-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL ENGINEERING TECHNOLOGY LEVEL 6 (8 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL CONDUIT SYSTEM', 'install-conduit-system', NULL::text),
  ('INSTALL PVC SHEATHED CABLE SYSTEM', 'install-pvc-sheathed-cable-system', NULL::text),
  ('INSTALL TRUNKING SYSTEM', 'install-trunking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL STAND-ALONE SOLAR PV SYSTEMS', 'install-stand-alone-solar-pv-systems', NULL::text),
  ('PERFORM BELL AND ALARM INSTALLATION', 'perform-bell-and-alarm-installation', NULL::text),
  ('WIND ELECTRICAL MACHINE', 'wind-electrical-machine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC ELECTRICAL PRINCIPLES', 'apply-basic-electrical-principles', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS', 'prepare-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY DIGITAL ELECTRONICS I', 'apply-digital-electronics-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS I', 'apply-engineering-technician-mathematics-i', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM SECURITY SYSTEM INSTALLATION', 'perform-security-system-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY DIGITAL ELECTRONICS II', 'apply-digital-electronics-ii', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS II', 'apply-engineering-technician-mathematics-ii', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('INSTALL SOLAR PV SYSTEMS', 'install-solar-pv-systems', NULL::text),
  ('PERFORM ELECTRICAL MACHINE INSTALLATION', 'perform-electrical-machine-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES I', 'apply-electrical-principles-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS III', 'apply-engineering-technician-mathematics-iii', NULL::text),
  ('APPLY MICRO CONTROL SYSTEMS', 'apply-micro-control-systems', NULL::text),
  ('INSTALL ELECTRICAL POWER LINES', 'install-electrical-power-lines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY CONTROL SYSTEMS', 'apply-control-systems', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES II', 'apply-electrical-principles-ii', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS IV', 'apply-engineering-technician-mathematics-iv', NULL::text),
  ('AUTOMATE ELECTRICAL SYSTEMS', 'automate-electrical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- Module 8: Module 8
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 8, 'Module 8'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 8
JOIN (VALUES
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('FABRICATE POWER ELECTRONICS CIRCUITS', 'fabricate-power-electronics-circuits', NULL::text),
  ('PERFORM ELECTRICAL MEASUREMENT AND FAULT DIAGNOSIS', 'perform-electrical-measurement-and-fault-diagnosis', NULL::text),
  ('SUPERVISE ELECTRICAL PROJECT', 'supervise-electrical-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL MECHATRONICS TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY THERMODYNAMICS AND FLUID MECHANICS', 'apply-thermodynamics-and-fluid-mechanics', NULL::text),
  ('DESIGN ELECTROMECHANICAL SYSTEMS', 'design-electromechanical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('INSTALL AND MAINTAIN ELECTROMECHANICAL SYSTEM', 'install-and-maintain-electromechanical-system', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('INSTALL AND MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'install-and-maintain-hydraulic-and-pneumatic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('INSTALL AND MAINTAIN PLC SYSTEM', 'install-and-maintain-plc-system', NULL::text),
  ('INSTALL AND MAINTAIN STAND-ALONE CONTROLLERS', 'install-and-maintain-stand-alone-controllers', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('INSTALL AND MAINTAIN ROBOTIC SYSTEM', 'install-and-maintain-robotic-system', NULL::text),
  ('INSTALL AND MAINTAIN SUPERVISORY CONTROL AND DATA ACQUISITION (SCADA) SYSTEMS', 'install-and-maintain-supervisory-control-and-data-acquisition-scada-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ENGINEERING MECHANICS', 'apply-engineering-mechanics', NULL::text),
  ('INSTALL ELECTRICAL MACHINES AND MECHANICAL DRIVES', 'install-electrical-machines-and-mechanical-drives', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('OPERATE FABRICATION MACHINERY', 'operate-fabrication-machinery', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: INSTRUMENTATION AND CONTROL TECHNICIAN LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL INSTRUMENTATION AND CONTROL SYSTEM COMPONENT', 'install-instrumentation-and-control-system-component', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INSTRUMENTATION AND CONTROL SYSTEMS', 'maintain-instrumentation-and-control-systems', NULL::text),
  ('OPERATE INSTRUMENTATION AND CONTROL SYSTEM', 'operate-instrumentation-and-control-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('FABRICATE ELECTRONIC CIRCUITS', 'fabricate-electronic-circuits', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEM', 'install-hydraulic-and-pneumatic-system', NULL::text),
  ('PREPARE ENGINEERING DRAWING AND DESIGN', 'prepare-engineering-drawing-and-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL ELECTRICAL MACHINES', 'install-electrical-machines', NULL::text),
  ('INSTALL LOGIC CONTROLLERS', 'install-logic-controllers', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS', 'apply-engineering-technician-mathematics', NULL::text),
  ('FABRICATE ADVANCE ELECTRONICS CIRCUIT', 'fabricate-advance-electronics-circuit', NULL::text),
  ('MONITOR CONTROL AND INSTRUMENTATION SYSTEMS', 'monitor-control-and-instrumentation-systems', NULL::text),
  ('PERFORM ELECTRICAL AND FAULT DIAGNOSIS', 'perform-electrical-and-fault-diagnosis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY CONTROL SYSTEMS', 'apply-control-systems', NULL::text),
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('CALIBRATE INDUSTRIAL MEASUREMENT INSTRUMENTS', 'calibrate-industrial-measurement-instruments', NULL::text),
  ('SUPERVISE INSTRUMENTATION AND CONTROL SYSTEM', 'supervise-instrumentation-and-control-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: TELECOMMUNICATION TECHNOLOGY LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL SKILLS', 'apply-digital-skills', NULL::text),
  ('INSTALL ELECTRICAL SYSTEMS', 'install-electrical-systems', NULL::text),
  ('PREPARE ENGINEERING DRAWINGS', 'prepare-engineering-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS', 'apply-engineering-technician-mathematics', NULL::text),
  ('INSTALL SPECIALIZED POWER SYSTEMS', 'install-specialized-power-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL COMPUTER NETWORK', 'install-computer-network', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('FABRICATE ELECTRONIC CIRCUITS', 'fabricate-electronic-circuits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY TELECOMMUNICATION PRINCIPLES', 'apply-telecommunication-principles', NULL::text),
  ('FABRICATE EMBEDDED AND RF CIRCUITS', 'fabricate-embedded-and-rf-circuits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('INSTALL BROADCASTING COMMUNICATION SYSTEMS', 'install-broadcasting-communication-systems', NULL::text),
  ('INSTALL TELEPHONY SYSTEM', 'install-telephony-system', NULL::text),
  ('INSTALL WIRELESS COMMUNICATION TRANSMISSION LINKS', 'install-wireless-communication-transmission-links', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('INSTALL ENTERPRISE COMPUTER NETWORKS', 'install-enterprise-computer-networks', NULL::text),
  ('INSTALL FIBER OPTICS NETWORKS', 'install-fiber-optics-networks', NULL::text),
  ('MAINTAIN COMMUNICATION SYSTEMS', 'maintain-communication-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL ENGINEERING TECHNOLOGY LEVEL 5 (5 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL CONDUIT SYSTEM', 'install-conduit-system', NULL::text),
  ('INSTALL PVC SHEATHED CABLE SYSTEM', 'install-pvc-sheathed-cable-system', NULL::text),
  ('INSTALL TRUNKING SYSTEM', 'install-trunking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL STAND-ALONE SOLAR PV SYSTEMS', 'install-stand-alone-solar-pv-systems', NULL::text),
  ('PERFORM BELL AND ALARM INSTALLATION', 'perform-bell-and-alarm-installation', NULL::text),
  ('WIND ELECTRICAL MACHINE', 'wind-electrical-machine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY BASIC ELECTRICAL PRINCIPLES', 'apply-basic-electrical-principles', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS', 'prepare-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY DIGITAL ELECTRONICS I', 'apply-digital-electronics-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS 1', 'apply-engineering-technician-mathematics-1', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PERFORM SECURITY SYSTEM INSTALLATION', 'perform-security-system-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY DIGITAL ELECTRONICS II', 'apply-digital-electronics-ii', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS 11', 'apply-engineering-technician-mathematics-11', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('INSTALL SOLAR PV SYSTEMS', 'install-solar-pv-systems', NULL::text),
  ('PERFORM ELECTRICAL MACHINE INSTALLATION', 'perform-electrical-machine-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-engineering-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: INSTRUMENTATION AND CONTROL TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL INSTRUMENTATION AND CONTROL SYSTEM COMPONENT', 'install-instrumentation-and-control-system-component', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INSTRUMENTATION AND CONTROL SYSTEMS', 'maintain-instrumentation-and-control-systems', NULL::text),
  ('OPERATE INSTRUMENTATION AND CONTROL SYSTEM', 'operate-instrumentation-and-control-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('FABRICATE ELECTRONICS CIRCUIT', 'fabricate-electronics-circuit', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEM', 'install-hydraulic-and-pneumatic-system', NULL::text),
  ('PREPARE ENGINEERING DRAWING AND DESIGN', 'prepare-engineering-drawing-and-design', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('INSTALL ELECTRICAL MACHINES', 'install-electrical-machines', NULL::text),
  ('INSTALL LOGIC CONTROLLERS', 'install-logic-controllers', NULL::text),
  ('WORK ETHICS AND PRACTICES', 'work-ethics-and-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV SYSTEM INSTALLATION TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DC SOLAR PV SYSTEMS', 'install-dc-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM I', 'install-solar-water-pump-system-i', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION I', 'perform-electrical-installation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL SOLAR PV SYSTEMS', 'install-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM II', 'install-solar-water-pump-system-ii', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION II', 'perform-electrical-installation-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS I', 'apply-analogue-electronics-i', NULL::text),
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL ELECTRONICS I', 'apply-digital-electronics-i', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES I', 'apply-electrical-principles-i', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS I', 'apply-engineering-technician-mathematics-i', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('DESIGN SOLAR PV SYSTEMS', 'design-solar-pv-systems', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION III', 'perform-electrical-installation-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ANALOGUE ELECTRONICS II', 'apply-analogue-electronics-ii', NULL::text),
  ('APPLY DIGITAL ELECTRONICS II', 'apply-digital-electronics-ii', NULL::text),
  ('APPLY ELECTRICAL PRINCIPLES II', 'apply-electrical-principles-ii', NULL::text),
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS II', 'apply-engineering-technician-mathematics-ii', NULL::text),
  ('INSTALL SOLAR PV PUMPS SYSTEM', 'install-solar-pv-pumps-system', NULL::text),
  ('PERFORM SECURITY SYSTEM INSTALLATION', 'perform-security-system-installation', NULL::text),
  ('PREPARE TECHNICAL DRAWINGS', 'prepare-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-system-installation-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: TELECOMMUNICATION TECHNOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY DIGITAL SKILLS', 'apply-digital-skills', NULL::text),
  ('INSTALL ELECTRICAL SYSTEMS', 'install-electrical-systems', NULL::text),
  ('PREPARE ENGINEERING DRAWINGS', 'prepare-engineering-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING TECHNICIAN MATHEMATICS', 'apply-engineering-technician-mathematics', NULL::text),
  ('INSTALL SPECIALIZED POWER SYSTEMS', 'install-specialized-power-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('INSTALL COMPUTER NETWORK', 'install-computer-network', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('FABRICATE ELECTRONIC CIRCUITS', 'fabricate-electronic-circuits', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'telecommunication-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION TECHNOLOGY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL CONDUIT SYSTEM', 'install-conduit-system', NULL::text),
  ('INSTALL PVC SHEATHED CABLE SYSTEM', 'install-pvc-sheathed-cable-system', NULL::text),
  ('INSTALL TRUNKING SYSTEM', 'install-trunking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL STAND-ALONE SOLAR PV SYSTEMS', 'install-stand-alone-solar-pv-systems', NULL::text),
  ('PERFORM BELL AND ALARM INSTALLATION', 'perform-bell-and-alarm-installation', NULL::text),
  ('WIND ELECTRICAL MACHINE', 'wind-electrical-machine', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-4';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS ARTISAN LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('PERFORM ELECTRICAL AND ELECTRONICS EQUIPMENT AND APPLIANCES REPAIRS', 'perform-electrical-and-electronics-equipment-and-appliances-repairs', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION I', 'perform-electrical-installation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL POWER SUPPLY SYSTEMS', 'install-power-supply-systems', NULL::text),
  ('MAINTAIN ELECTRICAL AND ELECTRONIC EQUIPMENT AND APPLIANCES', 'maintain-electrical-and-electronic-equipment-and-appliances', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION II', 'perform-electrical-installation-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-4';

-- ------------------------------------------------------------------------------
-- Course: INSTRUMENTATION AND CONTROL OPERATOR LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL INSTRUMENTATION AND CONTROL SYSTEM COMPONENT', 'install-instrumentation-and-control-system-component', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-operator-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-operator-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INSTRUMENTATION AND CONTROL SYSTEMS', 'maintain-instrumentation-and-control-systems', NULL::text),
  ('OPERATE INSTRUMENTATION AND CONTROL SYSTEM', 'operate-instrumentation-and-control-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'instrumentation-and-control-operator-level-4';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV SYSTEMS INSTALLER LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DC SOLAR PV SYSTEMS', 'install-dc-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM 1', 'install-solar-water-pump-system-1', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION 1', 'perform-electrical-installation-1', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL SOLAR PV SYSTEMS', 'install-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM II', 'install-solar-water-pump-system-ii', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION II', 'perform-electrical-installation-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-4';

-- ------------------------------------------------------------------------------
-- Course: ELECTRICAL INSTALLATION TECHNOLOGY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL CONDUIT SYSTEM', 'install-conduit-system', NULL::text),
  ('INSTALL PVC SHEATHED CABLE SYSTEM', 'install-pvc-sheathed-cable-system', NULL::text),
  ('INSTALL TRUNKING SYSTEM', 'install-trunking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electrical-installation-technology-level-3';

-- ------------------------------------------------------------------------------
-- Course: ELECTRONICS ARTISAN LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY ELECTRICAL INSTRUMENTATION', 'apply-electrical-instrumentation', NULL::text),
  ('PERFORM ELECTRICAL AND ELECTRONICS EQUIPMENT AND APPLIANCES REPAIRS', 'perform-electrical-and-electronics-equipment-and-appliances-repairs', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION I', 'perform-electrical-installation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'electronics-artisan-level-3';

-- ------------------------------------------------------------------------------
-- Course: SOLAR PV SYSTEMS INSTALLER LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INSTALL DC SOLAR PV SYSTEMS', 'install-dc-solar-pv-systems', NULL::text),
  ('INSTALL SOLAR WATER PUMP SYSTEM', 'install-solar-water-pump-system', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering-department' AND c.slug = 'solar-pv-systems-installer-level-3';

COMMIT;
-- Verification Query: Check courses and units inserted for ELECTRICAL AND ELECTRONIC ENGINEERING DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'electrical-and-electronic-engineering-department'
-- GROUP BY d.name;