-- ==============================================================================
-- SEED SCRIPT FOR: MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 33 | Total Units: 538
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

-- 2. Upsert Department under Cycle 1 & 2: MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT', 'mechanical-and-automotive-engineering-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Mechanical and Automotive Engineering courses in Automotive, Mechatronics, Industrial Plant, Refrigeration, and Welding.', 10
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
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department'
);

-- 4. Insert Non-Modular Courses under MECHANICAL AND AUTOMOTIVE ENGINEERING DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOBODY TECHNICIAN LEVEL 6', 'autobody-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE MECHATRONICS TECHNOLOGY LEVEL 6', 'automotive-mechatronics-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE ENGINEERING TECHNICIAN LEVEL 6', 'automotive-engineering-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE TECHNICIAN LEVEL 6', 'automotive-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL AUTOMATION AND ROBOTICS LEVEL 6', 'industrial-automation-and-robotics-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL CONTROL AND INSTRUMENTATION LEVEL 6', 'industrial-control-and-instrumentation-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL MECHATRONICS TECHNOLOGY LEVEL 6', 'industrial-mechatronics-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL PLANT OPERATIONS LEVEL 6', 'industrial-plant-operations-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PLANT TECHNOLOGY LEVEL 6', 'mechanical-plant-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL TECHNOLOGY (PRODUCTION) LEVEL 6', 'mechanical-technology-production-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL TECHNOLOGY AND MAINTENANCE TECHNICIAN LEVEL 6', 'mechanical-technology-and-maintenance-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHATRONIC TECHNICIAN LEVEL 6', 'mechatronic-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'REFRIGERATION AND AIR CONDITIONING TECHNICIAN LEVEL 6', 'refrigeration-and-air-conditioning-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING AND FABRICATION LEVEL 6', 'welding-and-fabrication-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE CRAFTSPERSON LEVEL 5', 'automotive-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE ENGINEERING LEVEL 5', 'automotive-engineering-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE TECHNICIAN LEVEL 5', 'automotive-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL PLANT OPERATIONS LEVEL 5', 'industrial-plant-operations-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PLANT TECHNICIAN LEVEL 5', 'mechanical-plant-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION TECHNICIAN LEVEL 5', 'mechanical-production-technician-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHATRONICS TECHNOLOGY LEVEL 5', 'mechatronics-technology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'REFRIGERATION AND AIR CONDITIONING CRAFTSPERSON LEVEL 5', 'refrigeration-and-air-conditioning-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING AND FABRICATION CRAFTSPERSON LEVEL 5', 'welding-and-fabrication-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE MECHANIC LEVEL 4', 'automotive-mechanic-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE TECHNOLOGY LEVEL 4', 'automotive-technology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE TECHNOLOGY LEVEL 4', 'automotive-technology-level-4-2', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'INDUSTRIAL PLANT OPERATIONS LEVEL 4', 'industrial-plant-operations-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MANUAL METAL ARC AND GAS METAL ARC WELDING LEVEL 4', 'manual-metal-arc-and-gas-metal-arc-welding-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'MECHANICAL PRODUCTION (LATHE AND FABRICATION) ARTISAN LEVEL 4', 'mechanical-production-lathe-and-fabrication-artisan-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'REFRIGERATION AND AIR CONDITIONING ARTISAN LEVEL 4', 'refrigeration-and-air-conditioning-artisan-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'WELDING LEVEL 4', 'welding-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'AUTOMOTIVE MECHANIC LEVEL 3', 'automotive-mechanic-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'GAS WELDING LEVEL 3', 'gas-welding-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: AUTOBODY TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technician-level-6';

-- Section 2: Core Units of Competency (17 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY ENGINEERING MECHANICS PRINCIPLES', 'apply-engineering-mechanics-principles', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('ASSEMBLE VEHICLE BODY PARTS', 'assemble-vehicle-body-parts', NULL::text),
  ('DESIGN VEHICLE BODY STRUCTURE', 'design-vehicle-body-structure', NULL::text),
  ('DRIVE MOTOR VEHICLE', 'drive-motor-vehicle', NULL::text),
  ('FABRICATE AUTOMOTIVE STRUCTURE', 'fabricate-automotive-structure', NULL::text),
  ('PANEL VEHICLE STRUCTURE', 'panel-vehicle-structure', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text),
  ('PERFORM VEHICLE PREVENTIVE MAINTENANCE', 'perform-vehicle-preventive-maintenance', NULL::text),
  ('REPAIR VEHICLE BODY', 'repair-vehicle-body', NULL::text),
  ('SPRAY PAINT VEHICLE BODY', 'spray-paint-vehicle-body', NULL::text),
  ('TRIM VEHICLE BODY', 'trim-vehicle-body', NULL::text),
  ('WELD VEHICLE BODY PARTS', 'weld-vehicle-body-parts', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'autobody-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE MECHATRONICS TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechatronics-technology-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechatronics-technology-level-6';

-- Section 2: Core Units of Competency (23 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('MAINTAIN BUS VEHICLE COMMUNICATION SYSTEMS', 'maintain-bus-vehicle-communication-systems', NULL::text),
  ('MAINTAIN MOTOR VEHICLE BRAKING SYSTEM', 'maintain-motor-vehicle-braking-system', NULL::text),
  ('MAINTAIN VEHICLE ELECTRICAL SYSTEM', 'maintain-vehicle-electrical-system', NULL::text),
  ('MAINTAIN VEHICLE ELECTRONICS AND TRANSDUCERS', 'maintain-vehicle-electronics-and-transducers', NULL::text),
  ('MAINTAIN VEHICLE ENGINE', 'maintain-vehicle-engine', NULL::text),
  ('MAINTAIN VEHICLE FUEL SYSTEM', 'maintain-vehicle-fuel-system', NULL::text),
  ('MAINTAIN VEHICLE POWER STEERING SYSTEM', 'maintain-vehicle-power-steering-system', NULL::text),
  ('MAINTAIN VEHICLE SAFETY AND COMFORT SYSTEM', 'maintain-vehicle-safety-and-comfort-system', NULL::text),
  ('MAINTAIN VEHICLE STEERING SYSTEM', 'maintain-vehicle-steering-system', NULL::text),
  ('MAINTAIN VEHICLE SUSPENSION SYSTEM', 'maintain-vehicle-suspension-system', NULL::text),
  ('MAINTAIN VEHICLE TRANSMISSION SYSTEM', 'maintain-vehicle-transmission-system', NULL::text),
  ('PERFORM VEHICLE PREVENTIVE MAINTENANCE', 'perform-vehicle-preventive-maintenance', NULL::text),
  ('RETROFIT MOTOR VEHICLE ELECTROMECHANICAL EQUIPMENT', 'retrofit-motor-vehicle-electromechanical-equipment', NULL::text),
  ('SERVICE VEHICLE AIR CONDITIONING SYSTEM', 'service-vehicle-air-conditioning-system', NULL::text),
  ('SERVICE VEHICLE HYBRID SYSTEMS', 'service-vehicle-hybrid-systems', NULL::text),
  ('SERVICE VEHICLE INFOTAINMENT SYSTEM', 'service-vehicle-infotainment-system', NULL::text),
  ('SERVICE VEHICLE SECURITY SYSTEM', 'service-vehicle-security-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechatronics-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE ENGINEERING TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technician-level-6';

-- Section 2: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLE', 'apply-workshop-technology-principle', NULL::text),
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE COMPONENTS', 'service-and-repair-vehicle-engine-components', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEM', 'service-vehicle-steering-system', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEMS', 'service-vehicle-suspension-systems', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEMS', 'service-vehicle-transmission-systems', NULL::text),
  ('SERVICING VEHICLE BRAKING SYSTEM', 'servicing-vehicle-braking-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AUTOMOTIVE ENGINEERING SCIENCE PRINCIPLES', 'apply-automotive-engineering-science-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';

-- Section 3: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE COMPONENTS', 'service-and-repair-vehicle-engine-components', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEM', 'service-vehicle-braking-system', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEM', 'service-vehicle-steering-system', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEMS', 'service-vehicle-suspension-systems', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEM', 'service-vehicle-transmission-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL AUTOMATION AND ROBOTICS LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-level-6';

-- Section 2: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DEVELOP AND MAINTAIN DATA COMMUNICATIONS SYSTEMS', 'develop-and-maintain-data-communications-systems', NULL::text),
  ('INSTALL AND MAINTAIN AUTOMATION SYSTEM COMPONENTS', 'install-and-maintain-automation-system-components', NULL::text),
  ('INSTALL AND MAINTAIN DISTRIBUTED CONTROL SYSTEMS (DCSS)', 'install-and-maintain-distributed-control-systems-dcss', NULL::text),
  ('INSTALL AND MAINTAIN HUMAN MACHINE INTERFACES', 'install-and-maintain-human-machine-interfaces', NULL::text),
  ('INSTALL AND MAINTAIN PROGRAMMABLE LOGIC CONTROLLERS', 'install-and-maintain-programmable-logic-controllers', NULL::text),
  ('INSTALL AND MAINTAIN ROBOTIC SYSTEMS', 'install-and-maintain-robotic-systems', NULL::text),
  ('INSTALL AND MAINTAIN STAND-ALONE CONTROLLERS', 'install-and-maintain-stand-alone-controllers', NULL::text),
  ('INSTALL AND MAINTAIN SUPERVISORY CONTROL AND DATA ACQUISITION', 'install-and-maintain-supervisory-control-and-data-acquisition', NULL::text),
  ('MAINTAIN MECHANICAL SYSTEMS', 'maintain-mechanical-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-automation-and-robotics-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL CONTROL AND INSTRUMENTATION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-control-and-instrumentation-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-control-and-instrumentation-level-6';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-control-and-instrumentation-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('ANALYZE ALTERNATIVE ENERGY SYSTEMS/ SOLAR PV', 'analyze-alternative-energy-systems-solar-pv', NULL::text),
  ('MANAGE ELECTRICAL MOTOR CONTROL SYSTEMS', 'manage-electrical-motor-control-systems', NULL::text),
  ('MANAGE HIGH VOLTAGE SYSTEMS', 'manage-high-voltage-systems', NULL::text),
  ('MANAGE INSTRUMENTATION AND PROCESS CONTROL SYSTEMS', 'manage-instrumentation-and-process-control-systems', NULL::text),
  ('MANAGE PROGRAMMABLE LOGIC CONTROLLERS (PLCS) AND SCADA SYSTEMS', 'manage-programmable-logic-controllers-plcs-and-scada-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-control-and-instrumentation-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL MECHATRONICS TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- Section 2: Core Units of Competency (21 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONIC PRINCIPLES.', 'apply-electrical-and-electronic-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY ENGINEERING MECHANICS PRINCIPLES', 'apply-engineering-mechanics-principles', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('DESIGN ELECTROMECHANICAL SYSTEMS', 'design-electromechanical-systems', NULL::text),
  ('DESIGN HYDRAULIC AND PNEUMATIC SYSTEMS', 'design-hydraulic-and-pneumatic-systems', NULL::text),
  ('INSTALL ELECTROMECHANICAL SYSTEMS', 'install-electromechanical-systems', NULL::text),
  ('INSTALL HYDRAULIC AND PNEUMATIC SYSTEMS', 'install-hydraulic-and-pneumatic-systems', NULL::text),
  ('INSTALL ROBOTIC SYSTEMS', 'install-robotic-systems', NULL::text),
  ('MAINTAIN ELECTROMECHANICAL SYSTEMS', 'maintain-electromechanical-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN PROGRAMMABLE LOGIC CONTROLLER (PLC) SYSTEMS', 'maintain-programmable-logic-controller-plc-systems', NULL::text),
  ('MAINTAIN ROBOTIC SYSTEMS', 'maintain-robotic-systems', NULL::text),
  ('MAINTAIN SUPERVISORY CONTROL AND DATA ACQUISITION (SCADA) SYSTEMS', 'maintain-supervisory-control-and-data-acquisition-scada-systems', NULL::text),
  ('MANAGE INDUSTRIAL RESOURCES', 'manage-industrial-resources', NULL::text),
  ('OPERATE FABRICATION MACHINERY', 'operate-fabrication-machinery', NULL::text),
  ('PERFORM COMPUTER AIDED DRAWING', 'perform-computer-aided-drawing', NULL::text),
  ('PROGRAM PROGRAMMABLE LOGIC CONTROLLER (PLC) SYSTEMS', 'program-programmable-logic-controller-plc-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-mechatronics-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL PLANT OPERATIONS LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-6';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MAINTAIN INDUSTRIAL PUMPS', 'maintain-industrial-pumps', NULL::text),
  ('OPERATE AND MAINTAIN INDUSTRIAL BOILERS', 'operate-and-maintain-industrial-boilers', NULL::text),
  ('OPERATE AND MAINTAIN INDUSTRIAL HYDRAULICS SYSTEMS', 'operate-and-maintain-industrial-hydraulics-systems', NULL::text),
  ('OPERATE AND MAINTAIN INDUSTRIAL STEAM TURBINES', 'operate-and-maintain-industrial-steam-turbines', NULL::text),
  ('OPERATE AND MAINTAIN PNEUMATIC SYSTEMS', 'operate-and-maintain-pneumatic-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PLANT TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL PLANT MACHINERY', 'install-plant-machinery', NULL::text),
  ('MAINTAIN BOILER AND STEAM SYSTEMS', 'maintain-boiler-and-steam-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN MATERIAL HANDLING SYSTEMS', 'maintain-material-handling-systems', NULL::text),
  ('MAINTAIN PLANT MACHINERY', 'maintain-plant-machinery', NULL::text),
  ('MANAGE SPARES AND CONSUMABLES INVENTORY', 'manage-spares-and-consumables-inventory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL TECHNOLOGY (PRODUCTION) LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-production-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-production-level-6';

-- Section 2: Core Units of Competency (15 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-production-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE AND PERFORM METALLURGICAL PROCESSES', 'apply-material-science-and-perform-metallurgical-processes', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text),
  ('JOIN PARTS BY MANUAL METAL ARC WELDING (MMAW)', 'join-parts-by-manual-metal-arc-welding-mmaw', NULL::text),
  ('MANAGE WORKSHOP PROCESSES', 'manage-workshop-processes', NULL::text),
  ('PERFORM LATHE WORK', 'perform-lathe-work', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('PRODUCE PARTS BY BENCH WORK', 'produce-parts-by-bench-work', NULL::text),
  ('PRODUCE PARTS BY GRINDING MACHINE', 'produce-parts-by-grinding-machine', NULL::text),
  ('PRODUCE PARTS BY MILLING', 'produce-parts-by-milling', NULL::text),
  ('PRODUCE PARTS BY SURFACE GRINDING', 'produce-parts-by-surface-grinding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-production-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL TECHNOLOGY AND MAINTENANCE TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-and-maintenance-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-and-maintenance-technician-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-and-maintenance-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL MACHINE/EQUIPMENT', 'install-machine-equipment', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN PUMPS AND AIR COMPRESSORS', 'maintain-pumps-and-air-compressors', NULL::text),
  ('PERFORM BENCHWORK OPERATIONS', 'perform-benchwork-operations', NULL::text),
  ('PERFORM LATHE OPERATIONS', 'perform-lathe-operations', NULL::text),
  ('PERFORM MACHINE/ EQUIPMENT MAINTENANCE', 'perform-machine-equipment-maintenance', NULL::text),
  ('PERFORM MANUAL METAL ARC WELDING (MMAW)', 'perform-manual-metal-arc-welding-mmaw', NULL::text),
  ('PERFORM OXY-ACETYLENE GAS WELDING AND CUTTING', 'perform-oxy-acetylene-gas-welding-and-cutting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-technology-and-maintenance-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: MECHATRONIC TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';

-- Section 2: Common Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL AND ELECTRONICS PRINCIPLES', 'apply-electrical-and-electronics-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('PERFORM WORKSHOP PROCESSES AND PRACTICES', 'perform-workshop-processes-and-practices', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CARRY OUT MECHATRONIC PROGRAMMING', 'carry-out-mechatronic-programming', NULL::text),
  ('DESIGN OF ELECTRO-MECHANICAL SYSTEMS.', 'design-of-electro-mechanical-systems', NULL::text),
  ('INSTALL MECHATRONIC SYSTEMS', 'install-mechatronic-systems', NULL::text),
  ('MAINTAIN ELECTRO-MECHANICAL SYSTEMS', 'maintain-electro-mechanical-systems', NULL::text),
  ('OPERATE MECHATRONIC SYSTEMS', 'operate-mechatronic-systems', NULL::text),
  ('PERFORM MECHATRONIC SYSTEM INSTRUMENTATION AND CONTROL', 'perform-mechatronic-system-instrumentation-and-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronic-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: REFRIGERATION AND AIR CONDITIONING TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-technician-level-6';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DESIGN AIR CONDITIONING SYSTEMS', 'design-air-conditioning-systems', NULL::text),
  ('DESIGN REFRIGERATION SYSTEMS', 'design-refrigeration-systems', NULL::text),
  ('INSTALL AIR CONDITIONING SYSTEMS', 'install-air-conditioning-systems', NULL::text),
  ('INSTALL REFRIGERATION SYSTEMS', 'install-refrigeration-systems', NULL::text),
  ('MAINTAIN AIR CONDITIONING SYSTEMS', 'maintain-air-conditioning-systems', NULL::text),
  ('MAINTAIN RAC CONTROL SYSTEMS', 'maintain-rac-control-systems', NULL::text),
  ('MAINTAIN REFRIGERATION SYSTEMS', 'maintain-refrigeration-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: WELDING AND FABRICATION LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';

-- Section 2: Common Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE AND PERFORM METALLURGICAL PROCESSES', 'apply-material-science-and-perform-metallurgical-processes', NULL::text),
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('APPLY THERMODYNAMICS PRINCIPLES', 'apply-thermodynamics-principles', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';

-- Section 3: Core Units of Competency (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DESIGN PRODUCTS AND STRUCTURES', 'design-products-and-structures', NULL::text),
  ('FABRICATE PRODUCTS AND STRUCTURES', 'fabricate-products-and-structures', NULL::text),
  ('PERFORM MANUAL METAL ARC WELDING', 'perform-manual-metal-arc-welding', NULL::text),
  ('PERFORM METAL ACTIVE GAS (MAG) WELDING', 'perform-metal-active-gas-mag-welding', NULL::text),
  ('PERFORM PLASMA AND LASER BEAM WELDING', 'perform-plasma-and-laser-beam-welding', NULL::text),
  ('PERFORM SOLDERING AND GAS WELDING', 'perform-soldering-and-gas-welding', NULL::text),
  ('PERFORM SPOT AND SEAM RESISTANCE WELDING', 'perform-spot-and-seam-resistance-welding', NULL::text),
  ('PERFORM SUBMERGED ARC WELDING', 'perform-submerged-arc-welding', NULL::text),
  ('PERFORM TUNGSTEN INERT GAS (TIG) WELDING', 'perform-tungsten-inert-gas-tig-welding', NULL::text),
  ('PERFORM UNDERWATER ARC WELDING', 'perform-underwater-arc-welding', NULL::text),
  ('PERFORM WELDING INSPECTION AND QUALITY CONTROL', 'perform-welding-inspection-and-quality-control', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-level-6';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AUTOMOTIVE ENGINEERING PRINCIPLES', 'apply-automotive-engineering-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';

-- Section 3: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('PERFORM VEHICLE BODY WORKS', 'perform-vehicle-body-works', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE COMPONENTS', 'service-and-repair-vehicle-engine-components', NULL::text),
  ('SERVICE MOTOR VEHICLE BRAKING SYSTEM', 'service-motor-vehicle-braking-system', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEM', 'service-vehicle-electrical-system', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEMS', 'service-vehicle-steering-systems', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEMS', 'service-vehicle-suspension-systems', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEMS', 'service-vehicle-transmission-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE ENGINEERING LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-level-5';

-- Section 2: Core Units of Competency (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AUTOMOTIVE ENGINEERING SCIENCE PRINCIPLES', 'apply-automotive-engineering-science-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLE', 'apply-workshop-technology-principle', NULL::text),
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('PERFORM VEHICLE BODY WORKS', 'perform-vehicle-body-works', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE COMPONENTS', 'service-and-repair-vehicle-engine-components', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEM', 'service-vehicle-braking-system', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEM', 'service-vehicle-steering-system', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEM', 'service-vehicle-suspension-system', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEMS', 'service-vehicle-transmission-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-engineering-level-5';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE TECHNICIAN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-5';

-- Section 2: Core Units of Competency (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY AUTOMOTIVE ENGINEERING SCIENCE PRINCIPLES', 'apply-automotive-engineering-science-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY WORKSHOP TECHNOLOGY PRINCIPLES', 'apply-workshop-technology-principles', NULL::text),
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('PERFORM VEHICLE BODY WORK', 'perform-vehicle-body-work', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINE PARTS', 'service-and-repair-vehicle-engine-parts', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEM', 'service-vehicle-braking-system', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE FUEL SYSTEM', 'service-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE STEERING SYSTEM', 'service-vehicle-steering-system', NULL::text),
  ('SERVICE VEHICLE SUSPENSION SYSTEM', 'service-vehicle-suspension-system', NULL::text),
  ('SERVICE VEHICLE TRANSMISSION SYSTEMS', 'service-vehicle-transmission-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL PLANT OPERATIONS LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLES', 'apply-electrical-principles', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM WORKSHOP PRACTICE', 'perform-workshop-practice', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('MAINTAIN INDUSTRIAL BOILERS', 'maintain-industrial-boilers', NULL::text),
  ('MAINTAIN INDUSTRIAL HYDRAULIC SYSTEMS', 'maintain-industrial-hydraulic-systems', NULL::text),
  ('MAINTAIN INDUSTRIAL MATERIAL HANDLING EQUIPMENT', 'maintain-industrial-material-handling-equipment', NULL::text),
  ('MAINTAIN INDUSTRIAL PNEUMATIC SYSTEMS', 'maintain-industrial-pneumatic-systems', NULL::text),
  ('MAINTAIN INDUSTRIAL PUMPS', 'maintain-industrial-pumps', NULL::text),
  ('MAINTAIN INDUSTRIAL STEAM TURBINES', 'maintain-industrial-steam-turbines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PLANT TECHNICIAN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technician-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technician-level-5';

-- Section 2: Core Units of Competency (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSTALL MECHANICAL PLANT MACHINERY', 'install-mechanical-plant-machinery', NULL::text),
  ('MAINTAIN BOILER AND STEAM SYSTEMS', 'maintain-boiler-and-steam-systems', NULL::text),
  ('MAINTAIN HYDRAULIC AND PNEUMATIC SYSTEMS', 'maintain-hydraulic-and-pneumatic-systems', NULL::text),
  ('MAINTAIN MATERIAL HANDLING SYSTEMS', 'maintain-material-handling-systems', NULL::text),
  ('MAINTAIN PLANT MACHINERY', 'maintain-plant-machinery', NULL::text),
  ('MANAGE SPARES AND CONSUMABLES INVENTORY', 'manage-spares-and-consumables-inventory', NULL::text),
  ('OPERATE PLANT MACHINES/UTILITIES', 'operate-plant-machines-utilities', NULL::text),
  ('PERFORM PLANT MAINTENANCE.', 'perform-plant-maintenance', NULL::text),
  ('PERFORM WORKSHOP PROCESSES', 'perform-workshop-processes', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-plant-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION TECHNICIAN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technician-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technician-level-5';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technician-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text),
  ('INTERPRET TECHNICAL DRAWINGS', 'interpret-technical-drawings', NULL::text),
  ('PERFORM BENCH WORK OPERATIONS', 'perform-bench-work-operations', NULL::text),
  ('PERFORM GRINDING OPERATION', 'perform-grinding-operation', NULL::text),
  ('PRODUCE COMPONENTS ON A LATHE', 'produce-components-on-a-lathe', NULL::text),
  ('PRODUCE COMPONENTS ON A MILLING MACHINE', 'produce-components-on-a-milling-machine', NULL::text),
  ('USE COMMON METALLIC AND NON-METALLIC MATERIALS', 'use-common-metallic-and-non-metallic-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-technician-level-5';

-- ------------------------------------------------------------------------------
-- Course: MECHATRONICS TECHNOLOGY LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronics-technology-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronics-technology-level-5';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronics-technology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('INSTALL MECHATRONIC SYSTEMS', 'install-mechatronic-systems', NULL::text),
  ('MAINTAIN ELECTROMECHANICAL SYSTEMS', 'maintain-electromechanical-systems', NULL::text),
  ('MAINTAIN MECHATRONIC SYSTEMS INSTRUMENTATION AND CONTROL', 'maintain-mechatronic-systems-instrumentation-and-control', NULL::text),
  ('OPERATE PNEUMATIC AND HYDRAULIC SYSTEMS', 'operate-pneumatic-and-hydraulic-systems', NULL::text),
  ('OPERATE PROGRAMMABLE LOGIC CONTROL (PLC) SYSTEMS', 'operate-programmable-logic-control-plc-systems', NULL::text),
  ('OPERATE ROBOTIC AND AUTOMATED SYSTEMS', 'operate-robotic-and-automated-systems', NULL::text),
  ('PERFORM WORKSHOP PROCESSES AND PRACTICES', 'perform-workshop-processes-and-practices', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechatronics-technology-level-5';

-- ------------------------------------------------------------------------------
-- Course: REFRIGERATION AND AIR CONDITIONING CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ELECTRICAL PRINCIPLE', 'apply-electrical-principle', NULL::text),
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('PERFORM ELECTRICAL INSTALLATION', 'perform-electrical-installation', NULL::text),
  ('PERFORM WORKSHOP PRACTICE', 'perform-workshop-practice', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';

-- Section 3: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INSTALL AIR CONDITIONING UNITS', 'install-air-conditioning-units', NULL::text),
  ('INSTALL REFRIGERATION UNITS', 'install-refrigeration-units', NULL::text),
  ('INSTALL, SERVICE AND REPAIR AIR-CONDITIONING UNITS', 'install-service-and-repair-air-conditioning-units', NULL::text),
  ('INSTALL, SERVICE AND REPAIR REFRIGERATION UNITS', 'install-service-and-repair-refrigeration-units', NULL::text),
  ('MAINTAIN AIR CONDITIONING UNITS', 'maintain-air-conditioning-units', NULL::text),
  ('MAINTAIN AUTOMOBILE AIR CONDITIONING UNITS', 'maintain-automobile-air-conditioning-units', NULL::text),
  ('MAINTAIN REFRIGERATION SYSTEMS', 'maintain-refrigeration-systems', NULL::text),
  ('SERVICE AND REPAIR AUTOMOBILE AIR CONDITIONING UNITS', 'service-and-repair-automobile-air-conditioning-units', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: WELDING AND FABRICATION CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-craftsperson-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-craftsperson-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FABRICATE PRODUCTS AND STRUCTURES', 'fabricate-products-and-structures', NULL::text),
  ('PERFORM GAS METAL ARC WELDING', 'perform-gas-metal-arc-welding', NULL::text),
  ('PERFORM MANUAL METAL ARC WELDING', 'perform-manual-metal-arc-welding', NULL::text),
  ('PERFORM SOLDERING AND GAS WELDING', 'perform-soldering-and-gas-welding', NULL::text),
  ('PERFORM SPOT AND SEAM RESISTANCE WELDING', 'perform-spot-and-seam-resistance-welding', NULL::text),
  ('PERFORM TUNGSTEN INERT GAS (TIG) WELDING', 'perform-tungsten-inert-gas-tig-welding', NULL::text),
  ('PERFORM WELD TESTING', 'perform-weld-testing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-and-fabrication-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE MECHANIC LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-4';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('SERVICE AND REPAIR VEHICLE BRAKING SYSTEMS', 'service-and-repair-vehicle-braking-systems', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINES', 'service-and-repair-vehicle-engines', NULL::text),
  ('SERVICE AND REPAIR VEHICLE FUEL SYSTEM', 'service-and-repair-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE STEERING AND SUSPENSION SYSTEMS', 'service-vehicle-steering-and-suspension-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-4';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE TECHNOLOGY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY BASIC SCIENCE PRINCIPLES', 'apply-basic-science-principles', NULL::text),
  ('MAINTAIN WORKSHOP TOOLS, EQUIPMENT AND MEASURING DEVICES', 'maintain-workshop-tools-equipment-and-measuring-devices', NULL::text),
  ('PERFORM WORKSHOP TECHNOLOGY APPLICATIONS', 'perform-workshop-technology-applications', NULL::text),
  ('PREPARE AND INTERPRET APPLIED GEOMETRY DRAWINGS', 'prepare-and-interpret-applied-geometry-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';

-- Section 3: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('SERVICE AND REPAIR VEHICLE FUEL SYSTEMS', 'service-and-repair-vehicle-fuel-systems', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEMS', 'service-vehicle-braking-systems', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE STEERING AND SUSPENSION SYSTEMS', 'service-vehicle-steering-and-suspension-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE TECHNOLOGY LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC MATHEMATICS', 'apply-basic-mathematics', NULL::text),
  ('APPLY BASIC SCIENCE PRINCIPLES', 'apply-basic-science-principles', NULL::text),
  ('MAINTAIN WORKSHOP TOOLS, EQUIPMENT AND MEASURING DEVICES', 'maintain-workshop-tools-equipment-and-measuring-devices', NULL::text),
  ('PERFORM WORKSHOP APPLICATIONS', 'perform-workshop-applications', NULL::text),
  ('PREPARE AND INTERPRET APPLIED GOEMETRY', 'prepare-and-interpret-applied-goemetry', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';

-- Section 3: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PERFORM VEHICLE BASIC MAINTENANCE', 'perform-vehicle-basic-maintenance', NULL::text),
  ('SERVICE AND REPAIR VEHICLE ENGINES', 'service-and-repair-vehicle-engines', NULL::text),
  ('SERVICE AND REPAIR VEHICLE FUEL SYSTEM', 'service-and-repair-vehicle-fuel-system', NULL::text),
  ('SERVICE VEHICLE BRAKING SYSTEMS', 'service-vehicle-braking-systems', NULL::text),
  ('SERVICE VEHICLE ELECTRICAL SYSTEMS', 'service-vehicle-electrical-systems', NULL::text),
  ('SERVICE VEHICLE STEERING AND SUSPENSION SYSTEM', 'service-vehicle-steering-and-suspension-system', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-technology-level-4-2';

-- ------------------------------------------------------------------------------
-- Course: INDUSTRIAL PLANT OPERATIONS LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-4';

-- Section 2: Core Units of Competency (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OPERATE INDUSTRIAL BOILER', 'operate-industrial-boiler', NULL::text),
  ('OPERATE INDUSTRIAL HYDRAULIC SYSTEM', 'operate-industrial-hydraulic-system', NULL::text),
  ('OPERATE INDUSTRIAL PNEUMATIC SYSTEM', 'operate-industrial-pneumatic-system', NULL::text),
  ('OPERATE INDUSTRIAL PUMP', 'operate-industrial-pump', NULL::text),
  ('OPERATE INDUSTRIAL STEAM TURBINE', 'operate-industrial-steam-turbine', NULL::text),
  ('OPERATE MATERIAL HANDLING EQUIPMENT', 'operate-material-handling-equipment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'industrial-plant-operations-level-4';

-- ------------------------------------------------------------------------------
-- Course: MANUAL METAL ARC AND GAS METAL ARC WELDING LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'manual-metal-arc-and-gas-metal-arc-welding-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'manual-metal-arc-and-gas-metal-arc-welding-level-4';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'manual-metal-arc-and-gas-metal-arc-welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY WORKPLACE ESSENTIAL SKILLS', 'apply-workplace-essential-skills', NULL::text),
  ('APPLY WORKPLACE HEALTH AND SAFETY', 'apply-workplace-health-and-safety', NULL::text),
  ('APPLY WORKSHOP CONCEPTS, TOOLS AND ORGANIZATION SKILLS', 'apply-workshop-concepts-tools-and-organization-skills', NULL::text),
  ('PERFORM MANUAL METAL ARC WELDING', 'perform-manual-metal-arc-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'manual-metal-arc-and-gas-metal-arc-welding-level-4';

-- ------------------------------------------------------------------------------
-- Course: MECHANICAL PRODUCTION (LATHE AND FABRICATION) ARTISAN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';

-- Section 2: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INTERPRET BASIC TECHNICAL DRAWINGS', 'interpret-basic-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';

-- Section 3: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('FABRICATE SHEET METAL PARTS', 'fabricate-sheet-metal-parts', NULL::text),
  ('PERFORM BENCH WORK OPERATIONS', 'perform-bench-work-operations', NULL::text),
  ('PRODUCE COMPONENTS ON THE LATHE', 'produce-components-on-the-lathe', NULL::text),
  ('USE COMMON METALLIC AND NON-METALLIC MATERIALS', 'use-common-metallic-and-non-metallic-materials', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'mechanical-production-lathe-and-fabrication-artisan-level-4';

-- ------------------------------------------------------------------------------
-- Course: REFRIGERATION AND AIR CONDITIONING ARTISAN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-artisan-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-artisan-level-4';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-artisan-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY BASIC ENGINEERING SCIENCE', 'apply-basic-engineering-science', NULL::text),
  ('INSTALL, SERVICE AND REPAIR DOMESTIC REFRIGERATION UNITS', 'install-service-and-repair-domestic-refrigeration-units', NULL::text),
  ('INSTALL, SERVICE AND REPAIR WINDOW TYPE AIR CONDITIONING UNITS', 'install-service-and-repair-window-type-air-conditioning-units', NULL::text),
  ('PERFORM ELECTRICAL AND ELECTRONIC CIRCUITRY', 'perform-electrical-and-electronic-circuitry', NULL::text),
  ('PERFORM WORKSHOP PRACTICES.', 'perform-workshop-practices', NULL::text),
  ('PPLY BASIC MATHEMATICS', 'pply-basic-mathematics', NULL::text),
  ('SERVICE AND REPAIR AUTOMOBILE AIR-CONDITIONING UNITS', 'service-and-repair-automobile-air-conditioning-units', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'refrigeration-and-air-conditioning-artisan-level-4';

-- ------------------------------------------------------------------------------
-- Course: WELDING LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';

-- Section 2: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM GAS WELDING IN ALL POSITIONS WITH VARIOUS METAL WORK PIECES', 'perform-gas-welding-in-all-positions-with-various-metal-work-pieces', NULL::text),
  ('PERFORM MANUAL ARC (STICK) WELDING IN ALL POSITIONS WITH VARIOUS METAL', 'perform-manual-arc-stick-welding-in-all-positions-with-various-metal', NULL::text),
  ('PERFORM MIG WELDING IN ALL POSITIONS WITH VARIOUS METAL WORK PIECES', 'perform-mig-welding-in-all-positions-with-various-metal-work-pieces', NULL::text),
  ('PERFORM TIG WELDING IN ALL POSITIONS WITH VARIOUS METAL WORK PIECES', 'perform-tig-welding-in-all-positions-with-various-metal-work-pieces', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'welding-level-4';

-- ------------------------------------------------------------------------------
-- Course: AUTOMOTIVE MECHANIC LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Common Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('MAINTAIN SHOP TOOLS, EQUIPMENT AND MEASURING DEVICES', 'maintain-shop-tools-equipment-and-measuring-devices', NULL::text),
  ('PARTICIPATE IN AN AUTOMOTIVE INDUSTRY ATTACHMENT', 'participate-in-an-automotive-industry-attachment', NULL::text),
  ('PERFORM WORKSHOP HOUSEKEEPING', 'perform-workshop-housekeeping', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-3';

-- Section 2: Core Units of Competency (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INSPECT AUTOMOTIVE BRAKE SYSTEMS', 'inspect-automotive-brake-systems', NULL::text),
  ('INSPECT AUTOMOTIVE STEERING AND SUSPENSION SYSTEMS', 'inspect-automotive-steering-and-suspension-systems', NULL::text),
  ('PERFORM VEHICLE PREVENTIVE MAINTENANCE', 'perform-vehicle-preventive-maintenance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'automotive-mechanic-level-3';

-- ------------------------------------------------------------------------------
-- Course: GAS WELDING LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Common Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'gas-welding-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLY BASIC WORKSHOP CONCEPTS', 'apply-basic-workshop-concepts', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'gas-welding-level-3';

-- Section 2: Core Units of Competency (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'gas-welding-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM OXY-ACETYLENE WELDING', 'perform-oxy-acetylene-welding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department' AND c.slug = 'gas-welding-level-3';

COMMIT;
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'mechanical-and-automotive-engineering-department'
-- GROUP BY d.name;