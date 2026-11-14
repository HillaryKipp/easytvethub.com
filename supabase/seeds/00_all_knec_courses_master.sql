-- ==============================================================================
-- COMPREHENSIVE KNEC COURSES MASTER SEED SCRIPT (12 DEPARTMENTS)
-- Total Courses: 71 | Total Units: 1151
-- Safe to run in Supabase SQL Editor
-- ==============================================================================
BEGIN;

-- Ensure KNEC Programme Exists
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

-- ==============================================================================
-- SEED SCRIPT FOR: ELECTRICAL AND ELECTRONIC ENGINEERING (KNEC COURSES)
-- Total Courses: 8 | Total Units: 164
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under KNEC: ELECTRICAL AND ELECTRONIC ENGINEERING
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'ELECTRICAL AND ELECTRONIC ENGINEERING', 'electrical-and-electronic-engineering', 'KNEC Diploma, Craft Certificate, and Artisan past examination papers and modules in Electrical, Electronics, Telecommunication, and Solar PV.', 1
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'electrical-and-electronic-engineering'
);

-- 4. Insert KNEC Courses under ELECTRICAL AND ELECTRONIC ENGINEERING
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN ELECTRICAL AND ELECTRONIC ENGINEERING (POWER OPTION)', 'diploma-in-electrical-and-electronic-engineering-power-option', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'electrical-and-electronic-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN ELECTRICAL AND ELECTRONIC ENGINEERING (TELECOMMUNICATION OPTION)', 'diploma-in-electrical-and-electronic-engineering-telecommunication-option', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'electrical-and-electronic-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN ELECTRICAL AND ELECTRONIC (INSTRUMENTATION & CONTROL OPTION)', 'diploma-in-electrical-and-electronic-instrumentation-and-control-option', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'electrical-and-electronic-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN ELECTRICAL AND ELECTRONIC ENGINEERING (POWER OPTION)', 'certificate-in-electrical-and-electronic-engineering-power-option', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'electrical-and-electronic-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN ELECTRICAL AND ELECTRONIC ENGINEERING (TELECOMMUNICATION OPTION)', 'certificate-in-electrical-and-electronic-engineering-telecommunication-option', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'electrical-and-electronic-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN ELECTRICAL INSTALLATION', 'artisan-in-electrical-installation', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'electrical-and-electronic-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'EPRA ELECTRICIAN LICENSE EXAMS QUESTIONS', 'epra-electrician-license-exams-questions', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'electrical-and-electronic-engineering';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'EPRA FOR SOLAR PV TECHNICIANS LICENSE', 'epra-for-solar-pv-technicians-license', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'electrical-and-electronic-engineering';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN ELECTRICAL AND ELECTRONIC ENGINEERING (POWER OPTION) [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (14 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-power-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENGINEERING MATHEMATICS I', 'engineering-mathematics-i', NULL::text),
  ('PHYSICAL SCIENCE', 'physical-science', NULL::text),
  ('MECHANICAL SCIENCE', 'mechanical-science', NULL::text),
  ('MATERIALS, PROCESSES AND WORKSHOP PRACTICE', 'materials-processes-and-workshop-practice', NULL::text),
  ('ENGINEERING DRAWING', 'engineering-drawing', NULL::text),
  ('ELECTRICAL ENGINEERING PRINCIPLES', 'electrical-engineering-principles', NULL::text),
  ('ELECTRICAL INSTALLATION TECHNOLOGY', 'electrical-installation-technology', NULL::text),
  ('SOLAR INSTALLATION SYSTEMS', 'solar-installation-systems', NULL::text),
  ('ANALOGUE ELECTRONICS I', 'analogue-electronics-i', NULL::text),
  ('ELECTRICAL MEASUREMENTS AND FAULT DIAGNOSIS', 'electrical-measurements-and-fault-diagnosis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-power-option';

-- Module 2: Module II (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-power-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONTROL SYSTEMS', 'control-systems', NULL::text),
  ('ANALOGUE ELECTRONICS II', 'analogue-electronics-ii', NULL::text),
  ('ENGINEERING MATHEMATICS II', 'engineering-mathematics-ii', NULL::text),
  ('DIGITAL ELECTRONICS', 'digital-electronics', NULL::text),
  ('ENGINEERING DRAWING AND DESIGN', 'engineering-drawing-and-design', NULL::text),
  ('INDUSTRIAL PROGRAMMABLE LOGIC CONTROLLERS', 'industrial-programmable-logic-controllers', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('ELECTRIC CIRCUIT ANALYSIS', 'electric-circuit-analysis', NULL::text),
  ('BUILDING SERVICES AND PROTECTION', 'building-services-and-protection', NULL::text),
  ('ELECTRIC POWER GENERATION AND TRANSMISSION', 'electric-power-generation-and-transmission', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-power-option';

-- Module 3: Module III (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-power-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('ENGINEERING MATHEMATICS III', 'engineering-mathematics-iii', NULL::text),
  ('MICRO-CONTROLLER TECHNOLOGY', 'micro-controller-technology', NULL::text),
  ('INDUSTRIAL ORGANIZATION AND MANAGEMENT', 'industrial-organization-and-management', NULL::text),
  ('MICROPROCESSOR SYSTEMS', 'microprocessor-systems', NULL::text),
  ('ESTIMATING, TENDERING AND ENGINEERING SERVICES CONTRACTS', 'estimating-tendering-and-engineering-services-contracts', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text),
  ('ELECTROMAGNETIC FIELD THEORY', 'electromagnetic-field-theory', NULL::text),
  ('MACHINES AND UTILIZATION', 'machines-and-utilization', NULL::text),
  ('ELECTRICAL POWER TRANSMISSION AND DISTRIBUTION', 'electrical-power-transmission-and-distribution', NULL::text),
  ('POWER ELECTRONICS', 'power-electronics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-power-option';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN ELECTRICAL AND ELECTRONIC ENGINEERING (TELECOMMUNICATION OPTION) [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (14 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-telecommunication-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENGINEERING MATHEMATICS I', 'engineering-mathematics-i', NULL::text),
  ('PHYSICAL SCIENCE', 'physical-science', NULL::text),
  ('MECHANICAL SCIENCE', 'mechanical-science', NULL::text),
  ('MATERIALS, PROCESSES AND WORKSHOP PRACTICE', 'materials-processes-and-workshop-practice', NULL::text),
  ('ENGINEERING DRAWING', 'engineering-drawing', NULL::text),
  ('ELECTRICAL ENGINEERING PRINCIPLES', 'electrical-engineering-principles', NULL::text),
  ('ELECTRICAL INSTALLATION TECHNOLOGY', 'electrical-installation-technology', NULL::text),
  ('SOLAR INSTALLATION SYSTEMS', 'solar-installation-systems', NULL::text),
  ('ANALOGUE ELECTRONICS I', 'analogue-electronics-i', NULL::text),
  ('ELECTRICAL MEASUREMENTS AND FAULT DIAGNOSIS', 'electrical-measurements-and-fault-diagnosis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-telecommunication-option';

-- Module 2: Module II (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-telecommunication-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONTROL SYSTEMS', 'control-systems', NULL::text),
  ('ANALOGUE ELECTRONICS II', 'analogue-electronics-ii', NULL::text),
  ('ENGINEERING MATHEMATICS II', 'engineering-mathematics-ii', NULL::text),
  ('DIGITAL ELECTRONICS', 'digital-electronics', NULL::text),
  ('ENGINEERING DRAWING AND DESIGN', 'engineering-drawing-and-design', NULL::text),
  ('INDUSTRIAL PROGRAMMABLE LOGIC CONTROLLERS', 'industrial-programmable-logic-controllers', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('ELECTRIC CIRCUIT ANALYSIS', 'electric-circuit-analysis', NULL::text),
  ('INDUSTRIAL MEASUREMENTS I', 'industrial-measurements-i', NULL::text),
  ('TELECOMMUNICATION PRINCIPLES', 'telecommunication-principles', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-telecommunication-option';

-- Module 3: Module III (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-telecommunication-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('ENGINEERING MATHEMATICS III', 'engineering-mathematics-iii', NULL::text),
  ('MICRO-CONTROLLER TECHNOLOGY', 'micro-controller-technology', NULL::text),
  ('INDUSTRIAL ORGANIZATION AND MANAGEMENT', 'industrial-organization-and-management', NULL::text),
  ('MICROPROCESSOR SYSTEMS', 'microprocessor-systems', NULL::text),
  ('ESTIMATING, TENDERING AND ENGINEERING SERVICE S CONTRACTS', 'estimating-tendering-and-engineering-service-s-contracts', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text),
  ('ELECTROMAGNETIC FIELD THEORY', 'electromagnetic-field-theory', NULL::text),
  ('DATA COMMUNICATION', 'data-communication', NULL::text),
  ('NETWORKING', 'networking', NULL::text),
  ('COMMUNICATION SYSTEMS', 'communication-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-engineering-telecommunication-option';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN ELECTRICAL AND ELECTRONIC (INSTRUMENTATION & CONTROL OPTION) [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (14 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-instrumentation-and-control-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENGINEERING MATHEMATICS I', 'engineering-mathematics-i', NULL::text),
  ('PHYSICAL SCIENCE', 'physical-science', NULL::text),
  ('MECHANICAL SCIENCE', 'mechanical-science', NULL::text),
  ('MATERIALS, PROCESSES AND WORKSHOP PRACTICE', 'materials-processes-and-workshop-practice', NULL::text),
  ('ENGINEERING DRAWING', 'engineering-drawing', NULL::text),
  ('ELECTRICAL ENGINEERING PRINCIPLES', 'electrical-engineering-principles', NULL::text),
  ('ELECTRICAL INSTALLATION TECHNOLOGY', 'electrical-installation-technology', NULL::text),
  ('SOLAR INSTALLATION SYSTEMS', 'solar-installation-systems', NULL::text),
  ('ANALOGUE ELECTRONICS I', 'analogue-electronics-i', NULL::text),
  ('ELECTRICAL MEASUREMENTS AND FAULT DIAGNOSIS', 'electrical-measurements-and-fault-diagnosis', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-instrumentation-and-control-option';

-- Module 2: Module II (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-instrumentation-and-control-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONTROL SYSTEMS', 'control-systems', NULL::text),
  ('ANALOGUE ELECTRONICS II', 'analogue-electronics-ii', NULL::text),
  ('ENGINEERING MATHEMATICS II', 'engineering-mathematics-ii', NULL::text),
  ('DIGITAL ELECTRONICS', 'digital-electronics', NULL::text),
  ('ENGINEERING DRAWING AND DESIGN', 'engineering-drawing-and-design', NULL::text),
  ('INDUSTRIAL PROGRAMMABLE LOGIC CONTROLLERS', 'industrial-programmable-logic-controllers', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('ELECTRIC CIRCUIT ANALYSIS', 'electric-circuit-analysis', NULL::text),
  ('BUILDING SERVICES AND PROTECTION', 'building-services-and-protection', NULL::text),
  ('ELECTRIC POWER GENERATION AND TRANSMISSION', 'electric-power-generation-and-transmission', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-instrumentation-and-control-option';

-- Module 3: Module III (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-instrumentation-and-control-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('ENGINEERING MATHEMATICS III', 'engineering-mathematics-iii', NULL::text),
  ('MICRO-CONTROLLER TECHNOLOGY', 'micro-controller-technology', NULL::text),
  ('INDUSTRIAL ORGANIZATION AND MANAGEMENT', 'industrial-organization-and-management', NULL::text),
  ('MICROPROCESSOR SYSTEMS', 'microprocessor-systems', NULL::text),
  ('ESTIMATING, TENDERING AND ENGINEERING SERVICES CONTRACTS', 'estimating-tendering-and-engineering-services-contracts', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text),
  ('ELECTROMAGNETIC FIELD THEORY', 'electromagnetic-field-theory', NULL::text),
  ('MACHINES AND UTILIZATION', 'machines-and-utilization', NULL::text),
  ('ELECTRICAL POWER TRANSMISSION AND DISTRIBUTION', 'electrical-power-transmission-and-distribution', NULL::text),
  ('POWER ELECTRONICS', 'power-electronics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'diploma-in-electrical-and-electronic-instrumentation-and-control-option';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN ELECTRICAL AND ELECTRONIC ENGINEERING (POWER OPTION) [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'certificate-in-electrical-and-electronic-engineering-power-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('COURSE FOUNDATIONS AND GENERAL INFORMATION', 'course-foundations-and-general-information', NULL::text),
  ('TECHNICAL DRAWING', 'technical-drawing', NULL::text),
  ('MATHEMATICS I', 'mathematics-i', NULL::text),
  ('APPLIED SCIENCE', 'applied-science', NULL::text),
  ('WORKSHOP TECHNOLOGY', 'workshop-technology', NULL::text),
  ('ELECTRICAL PRINCIPLES I', 'electrical-principles-i', NULL::text),
  ('ELECTRONICS', 'electronics', NULL::text),
  ('ELECTRICAL INSTALLATIONS TECHNOLOGY I', 'electrical-installations-technology-i', NULL::text),
  ('SOLAR INSTALLATION SYSTEMS', 'solar-installation-systems', NULL::text),
  ('TRADE PRACTICE I', 'trade-practice-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'certificate-in-electrical-and-electronic-engineering-power-option';

-- Module 2: Module II (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'certificate-in-electrical-and-electronic-engineering-power-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ELECTRICAL PRINCIPLES II', 'electrical-principles-ii', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('WORKSHOP ORGANISATION AND MANAGEMENT', 'workshop-organisation-and-management', NULL::text),
  ('MATHEMATICS II', 'mathematics-ii', NULL::text),
  ('MICRO-ELECTRONICS', 'micro-electronics', NULL::text),
  ('ELECTRICAL INSTALLATIONS TECHNOLOGY II', 'electrical-installations-technology-ii', NULL::text),
  ('ELECTRICAL MAINTENANCE AND FAULT DIAGNOSIS', 'electrical-maintenance-and-fault-diagnosis', NULL::text),
  ('TRADE PRACTICE II', 'trade-practice-ii', NULL::text),
  ('ELECTRICAL DESIGN ESTIMATING AND TENDERING', 'electrical-design-estimating-and-tendering', NULL::text),
  ('INDUSTRIAL MACHINES AND CONTROLS', 'industrial-machines-and-controls', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'certificate-in-electrical-and-electronic-engineering-power-option';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN ELECTRICAL AND ELECTRONIC ENGINEERING (TELECOMMUNICATION OPTION) [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'certificate-in-electrical-and-electronic-engineering-telecommunication-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('COURSE FOUNDATIONS AND GENERAL INFORMATION', 'course-foundations-and-general-information', NULL::text),
  ('TECHNICAL DRAWING', 'technical-drawing', NULL::text),
  ('MATHEMATICS I', 'mathematics-i', NULL::text),
  ('APPLIED SCIENCE', 'applied-science', NULL::text),
  ('WORKSHOP TECHNOLOGY', 'workshop-technology', NULL::text),
  ('ELECTRICAL PRINCIPLES I', 'electrical-principles-i', NULL::text),
  ('ELECTRONICS', 'electronics', NULL::text),
  ('ELECTRICAL INSTALLATIONS TECHNOLOGY I', 'electrical-installations-technology-i', NULL::text),
  ('SOLAR INSTALLATION SYSTEMS', 'solar-installation-systems', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'certificate-in-electrical-and-electronic-engineering-telecommunication-option';

-- Module 2: Module II (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'certificate-in-electrical-and-electronic-engineering-telecommunication-option';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ELECTRICAL PRINCIPLES II', 'electrical-principles-ii', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('WORKSHOP ORGANISATION AND MANAGEMENT', 'workshop-organisation-and-management', NULL::text),
  ('MATHEMATICS II', 'mathematics-ii', NULL::text),
  ('MICRO-ELECTRONICS', 'micro-electronics', NULL::text),
  ('RADIO SYSTEMS', 'radio-systems', NULL::text),
  ('TELEVISION FUNDAMENTALS', 'television-fundamentals', NULL::text),
  ('DATA COMMUNICATION', 'data-communication', NULL::text),
  ('TELECOMMUNICATION SYSTEMS', 'telecommunication-systems', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'certificate-in-electrical-and-electronic-engineering-telecommunication-option';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN ELECTRICAL INSTALLATION [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'artisan-in-electrical-installation';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLIED GEOMETRY', 'applied-geometry', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('SCIENCE', 'science', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text),
  ('ELECTRICAL INSTALLATION TRADE THEORY', 'electrical-installation-trade-theory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'artisan-in-electrical-installation';

-- ------------------------------------------------------------------------------
-- Course: EPRA ELECTRICIAN LICENSE EXAMS QUESTIONS [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'epra-electrician-license-exams-questions';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('EPRA ELECTRICIAN CLASS C-2 QUESTIONS', 'epra-electrician-class-c-2-questions', NULL::text),
  ('EPRA ELECTRICIAN CLASS C-1 QUESTIONS', 'epra-electrician-class-c-1-questions', NULL::text),
  ('EPRA ELECTRICIAN CLASS B QUESTIONS', 'epra-electrician-class-b-questions', NULL::text),
  ('EPRA ELECTRICIAN CLASS A-1 QUESTIONS', 'epra-electrician-class-a-1-questions', NULL::text),
  ('ELECTRICAL INSTALLATION REGULATIONS AND STANDARDS', 'electrical-installation-regulations-and-standards', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'epra-electrician-license-exams-questions';

-- ------------------------------------------------------------------------------
-- Course: EPRA FOR SOLAR PV TECHNICIANS LICENSE [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'epra-for-solar-pv-technicians-license';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('SOLAR PV TECHNICIAN CLASS T1 (BASIC PHOTOVOLTAIC SYSTEMS)', 'solar-pv-technician-class-t1-basic-photovoltaic-systems', NULL::text),
  ('SOLAR PV TECHNICIAN CLASS T2 (MEDIUM PHOTOVOLTAIC SYSTEMS)', 'solar-pv-technician-class-t2-medium-photovoltaic-systems', NULL::text),
  ('SOLAR PV TECHNICIAN CLASS T3 (ADVANCED GRID TIE SYSTEMS)', 'solar-pv-technician-class-t3-advanced-grid-tie-systems', NULL::text),
  ('SOLAR WATER PUMPING INSTALLATION & SIZING', 'solar-water-pumping-installation-and-sizing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'electrical-and-electronic-engineering' AND c.slug = 'epra-for-solar-pv-technicians-license';


-- ==============================================================================
-- SEED SCRIPT FOR: BUILDING AND CIVIL ENGINEERING (KNEC COURSES)
-- Total Courses: 12 | Total Units: 169
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
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


-- ==============================================================================
-- SEED SCRIPT FOR: HOSPITALITY AND TOURISM MANAGEMENT (KNEC COURSES)
-- Total Courses: 8 | Total Units: 156
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under KNEC: HOSPITALITY AND TOURISM MANAGEMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'HOSPITALITY AND TOURISM MANAGEMENT', 'hospitality-and-tourism-management', 'KNEC Diploma and Certificate past examination papers and modules in Food & Beverage, Catering & Accommodation, Tourism Management, and Food Technology.', 3
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management'
);

-- 4. Insert KNEC Courses under HOSPITALITY AND TOURISM MANAGEMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN FOOD AND BEVERAGE MANAGEMENT', 'diploma-in-food-and-beverage-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN CATERING AND ACCOMMODATION MANAGEMENT', 'diploma-in-catering-and-accommodation-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN TOURISM MANAGEMENT', 'diploma-in-tourism-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN FOOD SCIENCE PROCESSING TECHNOLOGY', 'diploma-in-food-science-processing-technology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FOOD PROCESSING AND PRESERVATION TECHNOLOGY', 'certificate-in-food-processing-and-preservation-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN CATERING AND ACCOMMODATION', 'certificate-in-catering-and-accommodation', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FOOD AND BEVERAGE PRODUCTION AND SERVICE', 'certificate-in-food-and-beverage-production-and-service', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN TOUR GUIDING AND TRAVEL OPERATIONS', 'certificate-in-tour-guiding-and-travel-operations', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'hospitality-and-tourism-management';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN FOOD AND BEVERAGE MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FOOD AND BEVERAGE PRODUCTION THEORY', 'food-and-beverage-production-theory', NULL::text),
  ('FOOD AND BEVERAGE SERVICE THEORY', 'food-and-beverage-service-theory', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND CONTROL THEORY', 'food-and-beverage-service-and-control-theory', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('CATERING PREMISES AND EQUIPMENT', 'catering-premises-and-equipment', NULL::text),
  ('INFORMATION & COMMUNICATION TECHNOLOGY (ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FOOD AND BEVERAGE PRODUCTION MANAGEMENT PRACTICE', 'food-and-beverage-production-management-practice', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION MANAGEMENT THEORY', 'food-and-beverage-production-management-theory', NULL::text),
  ('NUTRITION, DIET THERAPY AND HOME NURSING', 'nutrition-diet-therapy-and-home-nursing', NULL::text),
  ('FOOD AND BEVERAGE CONTROL', 'food-and-beverage-control', NULL::text),
  ('LAW RELATING TO CATERING', 'law-relating-to-catering', NULL::text),
  ('HOSPITALITY ACCOUNTING', 'hospitality-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';

-- Module 3: Module III (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('FOOD AND BEVERAGE SERVICE AND SALES MANAGEMENT THEORY', 'food-and-beverage-service-and-sales-management-theory', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND SALES MANAGEMENT PRACTICE', 'food-and-beverage-service-and-sales-management-practice', NULL::text),
  ('SALES AND MARKETING', 'sales-and-marketing', NULL::text),
  ('HUMAN RELATIONS', 'human-relations', NULL::text),
  ('PRINCIPLES OF ACCOUNTS', 'principles-of-accounts', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('RESEARCH PROJECT', 'research-project', NULL::text),
  ('BEVERAGE PREPARATION, SERVICE AND SALES MANAGEMENT', 'beverage-preparation-service-and-sales-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-and-beverage-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN CATERING AND ACCOMMODATION MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FOOD SCIENCE AND NUTRITION', 'food-science-and-nutrition', NULL::text),
  ('ACCOMMODATION OPERATIONS THEORY', 'accommodation-operations-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(ICT)', 'information-communication-technology-ict', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION', 'food-and-beverage-production', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND CONTROL THEORY', 'food-and-beverage-service-and-control-theory', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND SALES', 'food-and-beverage-service-and-sales', NULL::text),
  ('HOUSEKEEPING, FRONT OFFICE LAUNDRY', 'housekeeping-front-office-laundry', NULL::text),
  ('CATERING AND ACCOMMODATION CONTROL I', 'catering-and-accommodation-control-i', NULL::text),
  ('CATERING AND ACCOMMODATION PREMISE', 'catering-and-accommodation-premise', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';

-- Module 2: Module II (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CATERING AND ACCOMMODATION CONTROL II', 'catering-and-accommodation-control-ii', NULL::text),
  ('DIET THERAPY', 'diet-therapy', NULL::text),
  ('HOSPITALITY ACCOUNTING AND CONTROL', 'hospitality-accounting-and-control', NULL::text),
  ('FOOD BEVERAGE PRODUCTION MANAGEMENT PRACTICE', 'food-beverage-production-management-practice', NULL::text),
  ('FOOD BEVERAGE PRODUCTION MANAGEMENT THEORY', 'food-beverage-production-management-theory', NULL::text),
  ('ACCOMMODATION OPERATIONS MANAGEMENT I AND LAW THEORY', 'accommodation-operations-management-i-and-law-theory', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('LAW RELATED TO HOSPITALITY INDUSTRY', 'law-related-to-hospitality-industry', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';

-- Module 3: Module III (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('ACCOMMODATION OPERATIONS MANAGEMENT II', 'accommodation-operations-management-ii', NULL::text),
  ('PRINCIPLES AND PRACTICES OF MANAGEMENT', 'principles-and-practices-of-management', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION MANAGEMENT THEORY', 'food-and-beverage-production-management-theory', NULL::text),
  ('FOOD AND BEVERAGE SERVICE AND SALES MANAGEMENT THEORY', 'food-and-beverage-service-and-sales-management-theory', NULL::text),
  ('PRINCIPLES OF ACCOUNTING AND MANAGEMENT', 'principles-of-accounting-and-management', NULL::text),
  ('SALES AND MARKETING FOR HOSPITALITY INDUSTRY', 'sales-and-marketing-for-hospitality-industry', NULL::text),
  ('HUMAN RELATIONS', 'human-relations', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-catering-and-accommodation-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN TOURISM MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FUNDAMENTALS OF TOURISM', 'fundamentals-of-tourism', NULL::text),
  ('FAUNA, FLORA AND TOURISTIC GEOGRAPHY', 'fauna-flora-and-touristic-geography', NULL::text),
  ('TOUR GUIDING TECHNIQUES', 'tour-guiding-techniques', NULL::text),
  ('TOURISTIC HISTORY', 'touristic-history', NULL::text),
  ('TRAVEL OPERATIONS AND CUSTOMER CARE', 'travel-operations-and-customer-care', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('FRENCH PAPER 1', 'french-paper-1', NULL::text),
  ('TOURISM ECONOMICS', 'tourism-economics', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';

-- Module 2: Module II (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('TOUR OPERATIONS', 'tour-operations', NULL::text),
  ('TRAVEL AGENCY', 'travel-agency', NULL::text),
  ('FUNDAMENTALS OF HOTEL OPERATIONS', 'fundamentals-of-hotel-operations', NULL::text),
  ('PUBLIC RELATIONS', 'public-relations', NULL::text),
  ('TOURISM ACCOUNTING', 'tourism-accounting', NULL::text),
  ('TOURISM ECONOMICS II', 'tourism-economics-ii', NULL::text),
  ('ASTRONOMY', 'astronomy', NULL::text),
  ('TOURISM GEOGRAPHY', 'tourism-geography', NULL::text),
  ('FOREIGN LANGUAGE II', 'foreign-language-ii', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';

-- Module 3: Module III (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PRINCIPLES AND PRACTICES OF MANAGEMENT', 'principles-and-practices-of-management', NULL::text),
  ('TOURISM POLICY AND PLANNING', 'tourism-policy-and-planning', NULL::text),
  ('TOURISM PRODUCT DEVELOPMENT', 'tourism-product-development', NULL::text),
  ('ECOTOURISM', 'ecotourism', NULL::text),
  ('TOURISM MARKETING', 'tourism-marketing', NULL::text),
  ('TOURISM LAW III', 'tourism-law-iii', NULL::text),
  ('FRENCH', 'french', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-tourism-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN FOOD SCIENCE PROCESSING TECHNOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL PRODUCTION AND GENERAL MICROBIOLOGY', 'agricultural-production-and-general-microbiology', NULL::text),
  ('APPLIED SCIENCE AND MICROBIOLOGY PRACTICAL', 'applied-science-and-microbiology-practical', NULL::text),
  ('FOOD ENGINEERING I', 'food-engineering-i', NULL::text),
  ('LABORATORY AND WORKSHOP PRACTICE', 'laboratory-and-workshop-practice', NULL::text),
  ('MATHEMATICS AND APPLIED SCIENCE', 'mathematics-and-applied-science', NULL::text),
  ('ICT COMMUNICATION SKILLS AND ENTREPRENEURSHIP', 'ict-communication-skills-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FOOD ANALYSIS AND QUALITY ASSURANCE', 'food-analysis-and-quality-assurance', NULL::text),
  ('FOOD CHEMISTRY I AND FOOD MICROBIOLOGY I', 'food-chemistry-i-and-food-microbiology-i', NULL::text),
  ('FOOD ENGINEERING II', 'food-engineering-ii', NULL::text),
  ('TECHNOLOGY OF SPECIFIC PRODUCTS I', 'technology-of-specific-products-i', NULL::text),
  ('FOOD PROCESSING AND PRESERVATION I', 'food-processing-and-preservation-i', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';

-- Module 3: Module III (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PRODUCT DEVELOPMENT, INDUSTRIAL ORGANIZATION AND MANAGEMENT', 'product-development-industrial-organization-and-management', NULL::text),
  ('FOOD ANALYSIS AND INSTRUMENTATION', 'food-analysis-and-instrumentation', NULL::text),
  ('FOOD CHEMISTRY II AND FOOD MICROBIOLOGY II', 'food-chemistry-ii-and-food-microbiology-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'diploma-in-food-science-processing-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FOOD PROCESSING AND PRESERVATION TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-processing-and-preservation-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL PRODUCTION AND MICROBIOLOGY', 'agricultural-production-and-microbiology', NULL::text),
  ('APPLIED SCIENCE AND LABORATORY PRACTICE', 'applied-science-and-laboratory-practice', NULL::text),
  ('FOOD ENGINEERING I', 'food-engineering-i', NULL::text),
  ('FOOD PROCESSING AND PRESERVATION I', 'food-processing-and-preservation-i', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-processing-and-preservation-technology';

-- Module 2: Module II (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-processing-and-preservation-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FOOD PROCESSING AND PRESERVATION II', 'food-processing-and-preservation-ii', NULL::text),
  ('FOOD ENGINEERING II', 'food-engineering-ii', NULL::text),
  ('FOOD CHEMISTRY AND FOOD MICROBIOLOGY', 'food-chemistry-and-food-microbiology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-processing-and-preservation-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN CATERING AND ACCOMMODATION [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-catering-and-accommodation';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('FOOD SCIENCE AND NUTRITION', 'food-science-and-nutrition', NULL::text),
  ('FIRST AID AND HOME NURSING', 'first-aid-and-home-nursing', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION', 'food-and-beverage-production', NULL::text),
  ('FOOD, BEVERAGE SERVICE AND SALES', 'food-beverage-service-and-sales', NULL::text),
  ('CATERING AND ACCOMMODATION CONTROL', 'catering-and-accommodation-control', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-catering-and-accommodation';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-catering-and-accommodation';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('HOUSE KEEPING', 'house-keeping', NULL::text),
  ('FRONT OFFICE OPERATIONS', 'front-office-operations', NULL::text),
  ('LAUNDRY, CATERING AND ACCOMMODATION PREMISES', 'laundry-catering-and-accommodation-premises', NULL::text),
  ('CATERING AND ACCOMMODATION PREMISE', 'catering-and-accommodation-premise', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('RESEARCH PROJECT', 'research-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-catering-and-accommodation';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FOOD AND BEVERAGE PRODUCTION AND SERVICE [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-and-beverage-production-and-service';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('FOOD AND BEVERAGE CONTROL THEORY', 'food-and-beverage-control-theory', NULL::text),
  ('FOOD AND BEVERAGE PRODUCTION THEORY', 'food-and-beverage-production-theory', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('BASIC MATHEMATICAL OPERATIONS', 'basic-mathematical-operations', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-and-beverage-production-and-service';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-and-beverage-production-and-service';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('FOOD AND BEVERAGE SERVICE AND SALES THEORY', 'food-and-beverage-service-and-sales-theory', NULL::text),
  ('CATERING PREMISES AND EQUIPMENT', 'catering-premises-and-equipment', NULL::text),
  ('FOOD, BEVERAGE SALES AND SERVICE THEORY', 'food-beverage-sales-and-service-theory', NULL::text),
  ('FOOD, BEVERAGE SALES AND SERVICE PRACTICE', 'food-beverage-sales-and-service-practice', NULL::text),
  ('FOOD AND BEVERAGE CONTROL', 'food-and-beverage-control', NULL::text),
  ('TRADE PROJECT ORIENTATION', 'trade-project-orientation', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-food-and-beverage-production-and-service';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN TOUR GUIDING AND TRAVEL OPERATIONS [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-tour-guiding-and-travel-operations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATION', 'communication', NULL::text),
  ('CUSTOMER CARE', 'customer-care', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('GERMAN 1', 'german-1', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('FRENCH MODULE 1', 'french-module-1', NULL::text),
  ('FUNDAMENTALS OF TOURISM', 'fundamentals-of-tourism', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('TOUR GUIDING TECHNIQUES', 'tour-guiding-techniques', NULL::text),
  ('TOURISM ECONOMICS', 'tourism-economics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-tour-guiding-and-travel-operations';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-tour-guiding-and-travel-operations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('TOURISTIC GEOGRAPHY', 'touristic-geography', NULL::text),
  ('TOURISTIC HISTORY', 'touristic-history', NULL::text),
  ('TRAVEL OPERATIONS', 'travel-operations', NULL::text),
  ('FRENCH MODULE II', 'french-module-ii', NULL::text),
  ('FAUNA, FLORA AND ENVIRONMENTAL STUDIES', 'fauna-flora-and-environmental-studies', NULL::text),
  ('GERMAN II', 'german-ii', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'hospitality-and-tourism-management' AND c.slug = 'certificate-in-tour-guiding-and-travel-operations';


-- ==============================================================================
-- SEED SCRIPT FOR: HEALTH SCIENCES (KNEC COURSES)
-- Total Courses: 2 | Total Units: 21
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under KNEC: HEALTH SCIENCES
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'HEALTH SCIENCES', 'health-sciences', 'KNEC Diploma and Certificate past examination papers and modules in Nutrition and Dietetics and Community Health.', 4
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'health-sciences'
);

-- 4. Insert KNEC Courses under HEALTH SCIENCES
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN NUTRITION AND DIETETICS', 'diploma-in-nutrition-and-dietetics', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'health-sciences';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN NUTRITION AND DIETETICS', 'certificate-in-nutrition-and-dietetics', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'health-sciences';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN NUTRITION AND DIETETICS [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('DIET THERAPY I, MEAL PLANNING AND MANAGEMENT AND PRINCIPLES OF HUMAN NUTRITION PRACTICE', 'diet-therapy-i-meal-planning-and-management-and-principles-of-human-nutrition-practice', NULL::text),
  ('DIET THERAPY I, PRINCIPLES OF HUMAN NUTRITION AND DIETETICS, ANATOMY AND PHYSIOLOGY', 'diet-therapy-i-principles-of-human-nutrition-and-dietetics-anatomy-and-physiology', NULL::text),
  ('MATHEMATICS AND PHYSICAL SCIENCE', 'mathematics-and-physical-science', NULL::text),
  ('LEGAL ASPECTS OF NUTRITION, HIV/AIDS, NUTRITION IN HIV AND AIDS, MATERNAL AND CHILD HEALTH', 'legal-aspects-of-nutrition-hiv-aids-nutrition-in-hiv-and-aids-maternal-and-child-health', NULL::text),
  ('FOOD SAFETY AND HYGIENE, FOOD PRODUCTION FOR INVALIDS AND CONVALESCENTS AND NUTRITION ANTHROPOLOGY', 'food-safety-and-hygiene-food-production-for-invalids-and-convalescents-and-nutrition-anthropology', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BASIC BIOCHEMISTRY AND INTRODUCTION TO BIOSTATISTICS', 'basic-biochemistry-and-introduction-to-biostatistics', NULL::text),
  ('DIET THERAPY II AND NUTRITION IN LIFESPAN PRACTICE', 'diet-therapy-ii-and-nutrition-in-lifespan-practice', NULL::text),
  ('DIET THERAPY II AND NUTRITION IN LIFESPAN THEORY', 'diet-therapy-ii-and-nutrition-in-lifespan-theory', NULL::text),
  ('INTRODUCTION TO MICROBIOLOGY, FIRST AID, PRINCIPLES OF FOOD PROCESSING AND PRESERVATION', 'introduction-to-microbiology-first-aid-principles-of-food-processing-and-preservation', NULL::text),
  ('INTRODUCTION TO PRIMARY HEALTH CARE, PRINCIPLES OF NUTRITION AND BEHAVIOUR', 'introduction-to-primary-health-care-principles-of-nutrition-and-behaviour', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';

-- Module 3: Module III (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DIET THERAPY III AND NUTRITION EDUCATION AND COUNSELLING THEORY', 'diet-therapy-iii-and-nutrition-education-and-counselling-theory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'diploma-in-nutrition-and-dietetics';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN NUTRITION AND DIETETICS [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'certificate-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('LEGAL ASPECTS OF NUTRITION AND DIETETICS, HIV AND AIDS AND INTRODUCTION TO PRIMARY HEALTHCARE', 'legal-aspects-of-nutrition-and-dietetics-hiv-and-aids-and-introduction-to-primary-healthcare', NULL::text),
  ('FOOD SCIENCE, FOOD SAFETY AND HYGIENE, MEAL PLANNING MANAGEMENT AND SERVICE PRACTICE', 'food-science-food-safety-and-hygiene-meal-planning-management-and-service-practice', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text),
  ('INTRODUCTION TO NUTRITION AND DIETETICS', 'introduction-to-nutrition-and-dietetics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'certificate-in-nutrition-and-dietetics';

-- Module 2: Module II (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'health-sciences' AND c.slug = 'certificate-in-nutrition-and-dietetics';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('MATERNAL AND CHILD NUTRITION, NUTRITION IN THE LIFE CYCLE AND NUTRITION FOR THE VULNERABLE GROUPS', 'maternal-and-child-nutrition-nutrition-in-the-life-cycle-and-nutrition-for-the-vulnerable-groups', NULL::text),
  ('COMMUNITY DIAGNOSIS AND MOBILIZATION, INTRODUCTION TO NUTRITION SURVEILLANCE AND NUTRITION IN EMERGENCY', 'community-diagnosis-and-mobilization-introduction-to-nutrition-surveillance-and-nutrition-in-emergency', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'health-sciences' AND c.slug = 'certificate-in-nutrition-and-dietetics';


-- ==============================================================================
-- SEED SCRIPT FOR: BUSINESS STUDIES (KNEC COURSES)
-- Total Courses: 13 | Total Units: 259
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under KNEC: BUSINESS STUDIES
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'BUSINESS STUDIES', 'business-studies', 'KNEC Diploma and Certificate past examination papers and modules in Business Management, HRM, Supply Chain, Sales & Marketing, Project Management, and Secretarial Studies.', 5
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies'
);

-- 4. Insert KNEC Courses under BUSINESS STUDIES
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN BUSINESS MANAGEMENT', 'diploma-in-business-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN HUMAN RESOURCE MANAGEMENT', 'diploma-in-human-resource-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SUPPLY CHAIN MANAGEMENT', 'diploma-in-supply-chain-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SALES AND MARKETING', 'diploma-in-sales-and-marketing', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SECRETARIAL STUDIES', 'diploma-in-secretarial-studies', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN PROJECT MANAGEMENT', 'diploma-in-project-management', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BUSINESS EDUCATION SINGLE AND GROUP CERTIFICATE EXAMINATIONS', 'business-education-single-and-group-certificate-examinations', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN BUSINESS MANAGEMENT', 'certificate-in-business-management', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN HUMAN RESOURCE MANAGEMENT', 'certificate-in-human-resource-management', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN PROJECT MANAGEMENT', 'certificate-in-project-management', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN SUPPLY CHAIN MANAGEMENT', 'certificate-in-supply-chain-management', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN SALES AND MARKETING', 'certificate-in-sales-and-marketing', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CRAFT CERTIFICATE IN SECRETARIAL STUDIES', 'craft-certificate-in-secretarial-studies', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'business-studies';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN BUSINESS MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('ICT PRACTICAL', 'ict-practical', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('HUMAN AND PUBLIC RELATIONS', 'human-and-public-relations', NULL::text),
  ('SALES AND MARKETING', 'sales-and-marketing', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(ICT)', 'information-communication-technology-ict', NULL::text),
  ('OCCUPATIONAL SAFETY & PRECAUTIONS', 'occupational-safety-and-precautions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OFFICE ADMINISTRATION AND MANAGEMENT', 'office-administration-and-management', NULL::text),
  ('MARKETING MANAGEMENT', 'marketing-management', NULL::text),
  ('SUPPLY AND TRANSPORT MANAGEMENT', 'supply-and-transport-management', NULL::text),
  ('QUANTITATIVE TECHNIQUES', 'quantitative-techniques', NULL::text),
  ('COMMERCIAL AND ADMINISTRATIVE LAW', 'commercial-and-administrative-law', NULL::text),
  ('COST ACCOUNTING', 'cost-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';

-- Module 3: Module III (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('ORGANIZATION THEORY AND BEHAVIOR', 'organization-theory-and-behavior', NULL::text),
  ('LABOR AND INDUSTRIAL RELATIONS', 'labor-and-industrial-relations', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('HUMAN RESOURCE MANAGEMENT', 'human-resource-management', NULL::text),
  ('MANAGERIAL ACCOUNTING', 'managerial-accounting', NULL::text),
  ('FINANCIAL MANAGEMENT', 'financial-management', NULL::text),
  ('RESEARCH METHODS (PROJECT)', 'research-methods-project', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-business-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN HUMAN RESOURCE MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('COMMUNICATIONS', 'communications', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ICT', 'ict', NULL::text),
  ('ICT PRACTICALS', 'ict-practicals', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('FOUNDATIONS OF HUMAN RESOURCE MANAGEMENT', 'foundations-of-human-resource-management', NULL::text),
  ('OFFICE ADMINISTRATION AND MANAGEMENT', 'office-administration-and-management', NULL::text),
  ('FUNDAMENTALS OF HUMAN RESOURCE MANAGEMENT', 'fundamentals-of-human-resource-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';

-- Module 2: Module II (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('QUANTITATIVE METHODS', 'quantitative-methods', NULL::text),
  ('QUANTITATIVE TECHNIQUES', 'quantitative-techniques', NULL::text),
  ('LABOUR AND INDUSTRIAL LAW', 'labour-and-industrial-law', NULL::text),
  ('LABOUR ECONOMICS', 'labour-economics', NULL::text),
  ('HUMAN RESOURCE DEVELOPMENT', 'human-resource-development', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('PUBLIC RELATIONS', 'public-relations', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MARKETING', 'principles-and-practice-of-marketing', NULL::text),
  ('THEORY AND PRACTICE OF HUMAN RESOURCE MANAGEMENT', 'theory-and-practice-of-human-resource-management', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('OFFICE ADMIN & MANAGEMENT II', 'office-admin-and-management-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';

-- Module 3: Module III (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('ACCOUNTING AND CONTROL', 'accounting-and-control', NULL::text),
  ('EMPLOYEE RELATIONS', 'employee-relations', NULL::text),
  ('MANAGERIAL ACCOUNTING', 'managerial-accounting', NULL::text),
  ('ORGANIZATIONAL THEORY & BEHAVIOUR', 'organizational-theory-and-behaviour', NULL::text),
  ('REWARD MANAGEMENT', 'reward-management', NULL::text),
  ('FINANCIAL MANAGEMENT', 'financial-management', NULL::text),
  ('LABOUR AND INDUSTRIAL RELATIONS', 'labour-and-industrial-relations', NULL::text),
  ('ORGANIZATION BEHAVIOUR', 'organization-behaviour', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-human-resource-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SUPPLY CHAIN MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (14 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('WAREHOUSING AND OPERATIONS AND STOCK CONTROL', 'warehousing-and-operations-and-stock-control', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(ICT)', 'information-communication-technology-ict', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('ELEMENTS OF LAW', 'elements-of-law', NULL::text),
  ('SUPPLY CHAIN MANAGEMENT AND PURCHASING PRINCIPLES', 'supply-chain-management-and-purchasing-principles', NULL::text),
  ('ICT PRACTICALS', 'ict-practicals', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PURCHASING MANAGEMENT', 'purchasing-management', NULL::text),
  ('PUBLIC PROCUREMENT AND FINANCE', 'public-procurement-and-finance', NULL::text),
  ('SUPPLY MANAGEMENT', 'supply-management', NULL::text),
  ('QUANTITATIVE METHODS', 'quantitative-methods', NULL::text),
  ('QUANTITATIVE TECHNIQUES', 'quantitative-techniques', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MARKETING', 'principles-and-practice-of-marketing', NULL::text),
  ('COST ACCOUNTING', 'cost-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';

-- Module 3: Module III (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('PURCHASING AND SUPPLIES STRATEGY', 'purchasing-and-supplies-strategy', NULL::text),
  ('OPERATIONS MANAGEMENT', 'operations-management', NULL::text),
  ('PRINCIPLES AND PRACTICES OF MANAGEMENT', 'principles-and-practices-of-management', NULL::text),
  ('INTERNATIONAL PURCHASING', 'international-purchasing', NULL::text),
  ('PROJECT AND CONTRACT MANAGEMENT', 'project-and-contract-management', NULL::text),
  ('MANAGERIAL ACCOUNTING', 'managerial-accounting', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-supply-chain-management';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SALES AND MARKETING [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATIONS', 'communications', NULL::text),
  ('PRINCIPLES AND PRACTICE OF SELLING', 'principles-and-practice-of-selling', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MARKETING', 'principles-and-practice-of-marketing', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY(ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('ICT PRACTICAL', 'ict-practical', NULL::text),
  ('OCCUPATIONAL SAFETY & PRECAUTIONS', 'occupational-safety-and-precautions', NULL::text),
  ('ENTREPRENEURSHIP EDUCATION', 'entrepreneurship-education', NULL::text),
  ('BUSINESS COMMUNICATION', 'business-communication', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('SALES MANAGEMENT', 'sales-management', NULL::text),
  ('LEGAL ASPECTS IN SALES AND MARKETING', 'legal-aspects-in-sales-and-marketing', NULL::text),
  ('QUANTITATIVE METHODS', 'quantitative-methods', NULL::text),
  ('PUBLIC RELATIONS', 'public-relations', NULL::text),
  ('MARKETING MANAGEMENT', 'marketing-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';

-- Module 3: Module III (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INTERNATIONAL MARKETING', 'international-marketing', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('FINANCIAL ASPECTS OF MARKETING', 'financial-aspects-of-marketing', NULL::text),
  ('STRATEGIC PLANNING IN SALES AND MARKETING', 'strategic-planning-in-sales-and-marketing', NULL::text),
  ('MARKETING RESEARCH', 'marketing-research', NULL::text),
  ('MARKETING PLANNING', 'marketing-planning', NULL::text),
  ('PROJECT', 'project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-sales-and-marketing';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SECRETARIAL STUDIES [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('SECRETARIAL DUTIES', 'secretarial-duties', NULL::text),
  ('COMPUTERIZED DOCUMENT PROCESSING I', 'computerized-document-processing-i', NULL::text),
  ('COMMUNICATION I', 'communication-i', NULL::text),
  ('SHORTHAND', 'shorthand', NULL::text),
  ('ECONOMICS', 'economics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';

-- Module 2: Module II (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMMUNICATION II', 'communication-ii', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY II (THEORY)', 'information-communication-technology-ii-theory', NULL::text),
  ('SHORTHAND', 'shorthand-module-2', 'shorthand')
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';

-- Module 3: Module III (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('INFORMATION COMMUNICATION TECHNOLOGY III (THEORY)', 'information-communication-technology-iii-theory', NULL::text),
  ('SHORTHAND', 'shorthand-module-3', 'shorthand'),
  ('COMPUTERIZED DOCUMENT PROCESSING III', 'computerized-document-processing-iii', NULL::text),
  ('STATISTICS', 'statistics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-secretarial-studies';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN PROJECT MANAGEMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FUNDAMENTALS OF PROJECT MANAGEMENT', 'fundamentals-of-project-management', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (THEORY)', 'information-and-communication-technology-theory', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-and-communication-technology-practical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROJECT MONITORING AND EVALUATION', 'project-monitoring-and-evaluation', NULL::text),
  ('PROJECT PROCUREMENT AND MANAGEMENT', 'project-procurement-and-management', NULL::text),
  ('PROJECT QUALITY MANAGEMENT', 'project-quality-management', NULL::text),
  ('PROJECT MANAGEMENT INFORMATION SYSTEMS (THEORY)', 'project-management-information-systems-theory', NULL::text),
  ('QUANTITATIVE TECHNIQUES', 'quantitative-techniques', NULL::text),
  ('COST ACCOUNTING', 'cost-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';

-- Module 3: Module III (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('RISK MANAGEMENT IN PROJECTS', 'risk-management-in-projects', NULL::text),
  ('LEGAL ISSUES IN PROJECT MANAGEMENT', 'legal-issues-in-project-management', NULL::text),
  ('FUNDAMENTALS OF STRATEGIC MANAGEMENT', 'fundamentals-of-strategic-management', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'diploma-in-project-management';

-- ------------------------------------------------------------------------------
-- Course: BUSINESS EDUCATION SINGLE AND GROUP CERTIFICATE EXAMINATIONS [Level 5] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY I (THEORY)', 'information-communication-technology-i-theory', NULL::text),
  ('COMMERCE', 'commerce', NULL::text),
  ('FOUNDATIONS OF ACCOUNTING', 'foundations-of-accounting', NULL::text),
  ('SECRETARIAL DUTIES', 'secretarial-duties', NULL::text),
  ('SHORTHAND', 'shorthand', NULL::text),
  ('OFFICE PROCEDURES I', 'office-procedures-i', NULL::text),
  ('COMMUNICATION SKILLS I', 'communication-skills-i', NULL::text),
  ('COMPUTERIZED DOCUMENT PROCESSING I', 'computerized-document-processing-i', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';

-- Module 2: Module II (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMMUNICATION SKILLS II', 'communication-skills-ii', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY II (THEORY)', 'information-communication-technology-ii-theory', NULL::text),
  ('OFFICE PROCEDURES II', 'office-procedures-ii', NULL::text),
  ('PUBLIC PROCUREMENT AND FINANCE', 'public-procurement-and-finance', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';

-- Module 3: Module III (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('SUPPLY AND TRANSPORT MANAGEMENT', 'supply-and-transport-management', NULL::text),
  ('MARKET RESEARCH', 'market-research', NULL::text),
  ('SHORTHAND', 'shorthand-module-3', 'shorthand'),
  ('INTERNATIONAL PURCHASING', 'international-purchasing', NULL::text),
  ('MANAGERIAL ACCOUNTING', 'managerial-accounting', NULL::text),
  ('OPERATIONS MANAGEMENT', 'operations-management', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text),
  ('PROJECT AND CONTRACT MANAGEMENT', 'project-and-contract-management', NULL::text),
  ('PURCHASING AND SUPPLY STRATEGY', 'purchasing-and-supply-strategy', NULL::text),
  ('LABOUR AND INDUSTRIAL RELATIONS', 'labour-and-industrial-relations', NULL::text),
  ('ORGANIZATION THEORY AND BEHAVIOUR', 'organization-theory-and-behaviour', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'business-education-single-and-group-certificate-examinations';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN BUSINESS MANAGEMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BUSINESS CALCULATIONS AND STATISTICS', 'business-calculations-and-statistics', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY', 'information-and-communication-technology', NULL::text),
  ('COMMERCE', 'commerce', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-business-management';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-business-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('SALES AND MARKETING', 'sales-and-marketing', NULL::text),
  ('HUMAN AND PUBLIC RELATIONS', 'human-and-public-relations', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-business-management';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN HUMAN RESOURCE MANAGEMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INFORMATION AND COMMUNICATION TECHNOLOGY (ICT)', 'information-and-communication-technology-ict', NULL::text),
  ('BUSINESS CALCULATIONS AND STATISTICS', 'business-calculations-and-statistics', NULL::text),
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('OCCUPATIONAL SAFETY & PRECAUTIONS', 'occupational-safety-and-precautions', NULL::text),
  ('OFFICE ADMINISTRATION AND MANAGEMENT', 'office-administration-and-management', NULL::text),
  ('COMMERCE', 'commerce', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ELEMENTS OF HUMAN RESOURCE MANAGEMENT', 'elements-of-human-resource-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-human-resource-management';

-- Module 2: Module II (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-human-resource-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('PRACTICE OF HUMAN RESOURCE MANAGEMENT', 'practice-of-human-resource-management', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('BOOK-KEEPING AND ACCOUNTS', 'book-keeping-and-accounts', NULL::text),
  ('ELEMENT OF LABOUR LAW AND INDUSTRIAL RELATIONS', 'element-of-labour-law-and-industrial-relations', NULL::text),
  ('TRADE PROJECT', 'trade-project', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('HUMAN RESOURCE MANAGEMENT RECORDS', 'human-resource-management-records', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-human-resource-management';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN PROJECT MANAGEMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (11 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BUSINESS CALCULATIONS AND STATISTICS', 'business-calculations-and-statistics', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('FUNDAMENTALS OF PROJECT MANAGEMENT', 'fundamentals-of-project-management', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('OCCUPATIONAL SAFETY & PRECAUTIONS', 'occupational-safety-and-precautions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-project-management';

-- Module 2: Module II (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-project-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('PURCHASING AND SUPPLIES MANAGEMENT', 'purchasing-and-supplies-management', NULL::text),
  ('RESOURCE MOBILIZATION', 'resource-mobilization', NULL::text),
  ('PROJECT FINANCING', 'project-financing', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text),
  ('PRINCIPLES OF ACCOUNTING', 'principles-of-accounting', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-project-management';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN SUPPLY CHAIN MANAGEMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BUSINESS CALCULATIONS AND STATISTICS', 'business-calculations-and-statistics', NULL::text),
  ('WAREHOUSING OPERATION AND STOCK CONTROL', 'warehousing-operation-and-stock-control', NULL::text),
  ('COMMERCE', 'commerce', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('FINANCIAL ACCOUNTING', 'financial-accounting', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-supply-chain-management';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-supply-chain-management';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BUSINESS FINANCE', 'business-finance', NULL::text),
  ('FUNDAMENTALS OF MANAGEMENT AND ENVIRONMENT', 'fundamentals-of-management-and-environment', NULL::text),
  ('RESEARCH METHODS', 'research-methods', NULL::text),
  ('BUSINESS LAW', 'business-law', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('OFFICE ORGANIZATION', 'office-organization', NULL::text),
  ('SUPPLY CHAIN MANAGEMENT AND PURCHASING PRINCIPLE', 'supply-chain-management-and-purchasing-principle', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-supply-chain-management';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN SALES AND MARKETING [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (14 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BOOK-KEEPING AND ACCOUNTS', 'book-keeping-and-accounts', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('BUSINESS MANAGEMENT AND ADMINISTRATION', 'business-management-and-administration', NULL::text),
  ('INTERNATIONAL BUSINESS COMMUNICATIONS', 'international-business-communications', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('CONSUMER BEHAVIOUR', 'consumer-behaviour', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (THEORY)', 'information-communication-technology-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY (PRACTICAL)', 'information-communication-technology-practical', NULL::text),
  ('INTRODUCTION TO LAW', 'introduction-to-law', NULL::text),
  ('MARKETING COMMUNICATION', 'marketing-communication', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MARKETING', 'principles-and-practice-of-marketing', NULL::text),
  ('PRINCIPLES AND PRACTICE OF SELLING', 'principles-and-practice-of-selling', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-sales-and-marketing';

-- Module 2: Module II (1 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-sales-and-marketing';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('SALES AND MARKETING', 'sales-and-marketing', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'certificate-in-sales-and-marketing';

-- ------------------------------------------------------------------------------
-- Course: CRAFT CERTIFICATE IN SECRETARIAL STUDIES [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'craft-certificate-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('COMMUNICATION AND REPORT WRITING', 'communication-and-report-writing', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY I (THEORY)', 'information-communication-technology-i-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY I (PRACTICAL)', 'information-communication-technology-i-practical', NULL::text),
  ('SECRETARIAL DUTIES', 'secretarial-duties', NULL::text),
  ('COMPUTERIZED DOCUMENT PROCESSING I', 'computerized-document-processing-i', NULL::text),
  ('SHORTHAND', 'shorthand', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'craft-certificate-in-secretarial-studies';

-- Module 2: Module II (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'business-studies' AND c.slug = 'craft-certificate-in-secretarial-studies';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('SHORTHAND', 'shorthand-module-2', 'shorthand'),
  ('COMMUNICATION SKILLS II', 'communication-skills-ii', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY II (THEORY)', 'information-communication-technology-ii-theory', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY II (PRACTICAL)', 'information-communication-technology-ii-practical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'business-studies' AND c.slug = 'craft-certificate-in-secretarial-studies';


-- ==============================================================================
-- SEED SCRIPT FOR: COMPUTER STUDIES AND ICT (KNEC COURSES)
-- Total Courses: 2 | Total Units: 36
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under KNEC: COMPUTER STUDIES AND ICT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'COMPUTER STUDIES AND ICT', 'computer-studies-and-ict', 'KNEC Diploma and Certificate past examination papers and modules in Information Communication Technology (ICT) and Computer Applications.', 6
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'computer-studies-and-ict'
);

-- 4. Insert KNEC Courses under COMPUTER STUDIES AND ICT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN INFORMATION COMMUNICATION TECHNOLOGY', 'diploma-in-information-communication-technology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'computer-studies-and-ict';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN INFORMATION COMMUNICATION TECHNOLOGY', 'certificate-in-information-communication-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'computer-studies-and-ict';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN INFORMATION COMMUNICATION TECHNOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('INTRODUCTION TO INFORMATION COMMUNICATION TECHNOLOGY AND ETHICS', 'introduction-to-information-communication-technology-and-ethics', NULL::text),
  ('COMPUTER APPLICATION I', 'computer-application-i', NULL::text),
  ('COMPUTER APPLICATION I (PRACTICAL)', 'computer-application-i-practical', NULL::text),
  ('COMMUNICATION', 'communication', NULL::text),
  ('STRUCTURED PROGRAMMING', 'structured-programming', NULL::text),
  ('INFORMATION SYSTEM MANAGEMENT', 'information-system-management', NULL::text),
  ('COMPUTATIONAL MATHEMATICS', 'computational-mathematics', NULL::text),
  ('OPERATING SYSTEMS', 'operating-systems', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';

-- Module 2: Module II (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('RESEARCH PROJECT', 'research-project', NULL::text),
  ('COMPUTER APPLICATION II (THEORY)', 'computer-application-ii-theory', NULL::text),
  ('COMPUTER APPLICATION II (PRACTICAL)', 'computer-application-ii-practical', NULL::text),
  ('SYSTEMS ANALYSIS AND DESIGN', 'systems-analysis-and-design', NULL::text),
  ('OBJECT ORIENTED PROGRAMMING', 'object-oriented-programming', NULL::text),
  ('VISUAL PROGRAMMING', 'visual-programming', NULL::text),
  ('DATABASE MANAGEMENT SYSTEM', 'database-management-system', NULL::text),
  ('QUANTITATIVE METHODS', 'quantitative-methods', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';

-- Module 3: Module III (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DATA COMMUNICATION AND NETWORKING', 'data-communication-and-networking', NULL::text),
  ('INTERNET BASED PROGRAMMING', 'internet-based-programming', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text),
  ('MANAGEMENT INFORMATION SYSTEM', 'management-information-system', NULL::text),
  ('PRINCIPLES AND PRACTICE OF MANAGEMENT', 'principles-and-practice-of-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'diploma-in-information-communication-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN INFORMATION COMMUNICATION TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'certificate-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('BASIC ELECTRONICS', 'basic-electronics', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('COMPUTER APPLICATION I (THEORY)', 'computer-application-i-theory', NULL::text),
  ('COMPUTER APPLICATION I (PRACTICAL)', 'computer-application-i-practical', NULL::text),
  ('INTRODUCTION TO INFORMATION COMMUNICATION TECHNOLOGY', 'introduction-to-information-communication-technology', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('OPERATING SYSTEM', 'operating-system', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'certificate-in-information-communication-technology';

-- Module 2: Module II (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'certificate-in-information-communication-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('COMPUTER MAINTENANCE AND SUPPORT', 'computer-maintenance-and-support', NULL::text),
  ('STRUCTURED PROGRAMMING', 'structured-programming', NULL::text),
  ('COMPUTER APPLICATION II (THEORY)', 'computer-application-ii-theory', NULL::text),
  ('COMPUTER APPLICATION II (PRACTICAL)', 'computer-application-ii-practical', NULL::text),
  ('BUSINESS PLAN', 'business-plan', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'computer-studies-and-ict' AND c.slug = 'certificate-in-information-communication-technology';


-- ==============================================================================
-- SEED SCRIPT FOR: APPLIED SCIENCES (KNEC COURSES)
-- Total Courses: 6 | Total Units: 78
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
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


-- ==============================================================================
-- SEED SCRIPT FOR: AGRICULTURE AND AQUACULTURE (KNEC COURSES)
-- Total Courses: 7 | Total Units: 55
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under KNEC: AGRICULTURE AND AQUACULTURE
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'AGRICULTURE AND AQUACULTURE', 'agriculture-and-aquaculture', 'KNEC Diploma, Certificate, and Artisan past examination papers and modules in General Agriculture, Sustainable Agriculture, and Fisheries.', 8
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture'
);

-- 4. Insert KNEC Courses under AGRICULTURE AND AQUACULTURE
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN AGRICULTURE', 'diploma-in-agriculture', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SUSTAINABLE AGRICULTURE AND RURAL DEVELOPMENT', 'diploma-in-sustainable-agriculture-and-rural-development', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN GENERAL AGRICULTURE', 'certificate-in-general-agriculture', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FISHERIES TECHNOLOGY', 'certificate-in-fisheries-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FISHERIES SCIENCE AND TECHNOLOGY', 'certificate-in-fisheries-science-and-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN GENERAL AGRICULTURE', 'artisan-in-general-agriculture', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN AGRICULTURE MECHANICS', 'artisan-in-agriculture-mechanics', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'agriculture-and-aquaculture';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN AGRICULTURE [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING I', 'agricultural-engineering-i', NULL::text),
  ('AGRICULTURAL ECONOMICS I', 'agricultural-economics-i', NULL::text),
  ('AGRICULTURAL EXTENSION EDUCATION I', 'agricultural-extension-education-i', NULL::text),
  ('ANIMAL PRODUCTION I', 'animal-production-i', NULL::text),
  ('PRINCIPLES OF ANIMAL PRODUCTION', 'principles-of-animal-production', NULL::text),
  ('PRINCIPLES OF CROP PRODUCTION I', 'principles-of-crop-production-i', NULL::text),
  ('SOIL SCIENCE', 'soil-science', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING II', 'agricultural-engineering-ii', NULL::text),
  ('AGRICULTURAL ECONOMICS II', 'agricultural-economics-ii', NULL::text),
  ('AGRICULTURAL EXTENSION EDUCATION II', 'agricultural-extension-education-ii', NULL::text),
  ('HOME ECONOMICS', 'home-economics', NULL::text),
  ('ANIMAL PRODUCTION II', 'animal-production-ii', NULL::text),
  ('CROP PRODUCTION II', 'crop-production-ii', NULL::text),
  ('SOIL FERTILITY AND PLANT NUTRITION', 'soil-fertility-and-plant-nutrition', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';

-- Module 3: Module III (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING III', 'agricultural-engineering-iii', NULL::text),
  ('ENVIRONMENTAL MANAGEMENT', 'environmental-management', NULL::text),
  ('ANIMAL PRODUCTION III', 'animal-production-iii', NULL::text),
  ('CROP PRODUCTION III', 'crop-production-iii', NULL::text),
  ('FARM BUSINESS MANAGEMENT', 'farm-business-management', NULL::text),
  ('EXTENSION EDUCATION', 'extension-education', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-agriculture';

-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SUSTAINABLE AGRICULTURE AND RURAL DEVELOPMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING I', 'agricultural-engineering-i', NULL::text),
  ('APPLIED SCIENCE I', 'applied-science-i', NULL::text),
  ('CROP ENTERPRISE MANAGEMENT I', 'crop-enterprise-management-i', NULL::text),
  ('LIVESTOCK ENTERPRISE MANAGEMENT I', 'livestock-enterprise-management-i', NULL::text),
  ('FOUNDATION SUSTAINABLE OF AGRICULTURE', 'foundation-sustainable-of-agriculture', NULL::text),
  ('ICT COMMUNICATION SKILLS AND ENTREPRENEURSHIP', 'ict-communication-skills-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';

-- Module 2: Module II (3 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING II', 'agricultural-engineering-ii', NULL::text),
  ('APPLIED SCIENCE II', 'applied-science-ii', NULL::text),
  ('CROP ENTERPRISE MANAGEMENT II', 'crop-enterprise-management-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';

-- Module 3: Module III (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('COMMUNITY HEALTH AND RURAL SOCIOLOGY', 'community-health-and-rural-sociology', NULL::text),
  ('CROP ENTERPRISE MANAGEMENT III', 'crop-enterprise-management-iii', NULL::text),
  ('DEVELOPMENT ECONOMICS AND AGRICULTURAL MARKETING', 'development-economics-and-agricultural-marketing', NULL::text),
  ('MANAGEMENT OF NATURAL RESOURCES AND COMMUNITY DEVELOPMENT', 'management-of-natural-resources-and-community-development', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'diploma-in-sustainable-agriculture-and-rural-development';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN GENERAL AGRICULTURE [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-general-agriculture';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('AGRICULTURAL ENGINEERING', 'agricultural-engineering', NULL::text),
  ('ANIMAL PRODUCTION', 'animal-production', NULL::text),
  ('CROP PRODUCTION', 'crop-production', NULL::text),
  ('AGRICULTURAL EXTENSION EDUCATION', 'agricultural-extension-education', NULL::text),
  ('HOME ECONOMICS', 'home-economics', NULL::text),
  ('AGRICULTURAL ECONOMICS AND FARM MANAGEMENT', 'agricultural-economics-and-farm-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-general-agriculture';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-general-agriculture';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FISHERIES TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FISHERIES MANAGEMENT, MARKETING AND UTILIZATION', 'fisheries-management-marketing-and-utilization', NULL::text),
  ('TRADE PRACTICE', 'trade-practice', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-technology';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FISHERIES SCIENCE AND TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-science-and-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('FOOD PROCESSING AND PRESERVATION', 'food-processing-and-preservation', NULL::text),
  ('FISH CULTURE AND NUTRITION', 'fish-culture-and-nutrition', NULL::text),
  ('FISH BIOLOGY AQUATIC ECOLOGY', 'fish-biology-aquatic-ecology', NULL::text),
  ('FOOD CHEMISTRY AND MICROBIOLOGY', 'food-chemistry-and-microbiology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-science-and-technology';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'certificate-in-fisheries-science-and-technology';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN GENERAL AGRICULTURE [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'artisan-in-general-agriculture';
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
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'artisan-in-general-agriculture';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN AGRICULTURE MECHANICS [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'artisan-in-agriculture-mechanics';
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
WHERE d.slug = 'agriculture-and-aquaculture' AND c.slug = 'artisan-in-agriculture-mechanics';


-- ==============================================================================
-- SEED SCRIPT FOR: SOCIAL WORK (KNEC COURSES)
-- Total Courses: 2 | Total Units: 51
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under KNEC: SOCIAL WORK
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'SOCIAL WORK', 'social-work', 'KNEC Diploma and Certificate past examination papers and modules in Social Work, Community Development, and Project Management.', 9
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'social-work'
);

-- 4. Insert KNEC Courses under SOCIAL WORK
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN SOCIAL WORK AND COMMUNITY DEVELOPMENT', 'diploma-in-social-work-and-community-development', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'social-work';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'NATIONAL CERTIFICATE IN SOCIAL DEVELOPMENT', 'national-certificate-in-social-development', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'social-work';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN SOCIAL WORK AND COMMUNITY DEVELOPMENT [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('SOCIAL WORK THEORY AND PRACTICE', 'social-work-theory-and-practice', NULL::text),
  ('INTRODUCTION TO COMMUNITY DEVELOPMENT', 'introduction-to-community-development', NULL::text),
  ('DEVELOPMENT ECONOMICS', 'development-economics', NULL::text),
  ('ENTREPRENEURSHIP STUDIES', 'entrepreneurship-studies', NULL::text),
  ('COMMUNITY CAPACITY BUILDING AND EMPOWERMENT', 'community-capacity-building-and-empowerment', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY(ICT)', 'information-communication-technology-ict', NULL::text),
  ('COMMUNITY BASED ORGANIZATIONS', 'community-based-organizations', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';

-- Module 2: Module II (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('LEGAL ASPECTS IN SOCIAL DEVELOPMENT WORK', 'legal-aspects-in-social-development-work', NULL::text),
  ('RESOURCE MOBILIZATION AND FUNDRAISING', 'resource-mobilization-and-fundraising', NULL::text),
  ('PROJECT MANAGEMENT', 'project-management', NULL::text),
  ('ADVOCACY AND LOBBYING', 'advocacy-and-lobbying', NULL::text),
  ('HIV/AIDS AND OTHER PANDEMICS', 'hiv-aids-and-other-pandemics', NULL::text),
  ('STATISTICS', 'statistics', NULL::text),
  ('RESOURCE MANAGEMENT', 'resource-management', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';

-- Module 3: Module III (12 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('DISASTER MANAGEMENT', 'disaster-management', NULL::text),
  ('SOCIAL PSYCHOLOGY AND HUMAN DEVELOPMENT', 'social-psychology-and-human-development', NULL::text),
  ('SOCIAL REHABILITATION AND REINTEGRATION', 'social-rehabilitation-and-reintegration', NULL::text),
  ('SOCIAL POLICY AND ADMINISTRATION', 'social-policy-and-administration', NULL::text),
  ('COMMUNITY LEADERSHIP', 'community-leadership', NULL::text),
  ('INTRODUCTION TO COUNSELING PSYCHOLOGY', 'introduction-to-counseling-psychology', NULL::text),
  ('TRANSFORMATION', 'transformation', NULL::text),
  ('SOCIAL MARKETING', 'social-marketing', NULL::text),
  ('COMMUNITY DEVELOPMENT METHODOLOGIES', 'community-development-methodologies', NULL::text),
  ('MANAGEMENT OF COMMUNITY CONCERNS', 'management-of-community-concerns', NULL::text),
  ('GENDER AND DEVELOPMENT', 'gender-and-development', NULL::text),
  ('SOCIAL RESEARCH PROJECT', 'social-research-project', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work' AND c.slug = 'diploma-in-social-work-and-community-development';

-- ------------------------------------------------------------------------------
-- Course: NATIONAL CERTIFICATE IN SOCIAL DEVELOPMENT [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'national-certificate-in-social-development';

-- Module 2: Module II (23 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'social-work' AND c.slug = 'national-certificate-in-social-development';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('HUMAN GROWTH, DEVELOPMENT AND COMMUNITY HEALTH', 'human-growth-development-and-community-health', NULL::text),
  ('SOCIAL DEVELOPMENT, THEORY, METHODS, POLICY AND ADMINISTRATION', 'social-development-theory-methods-policy-and-administration', NULL::text),
  ('LAW, HISTORY AND GOVERNMENT', 'law-history-and-government', NULL::text),
  ('PROJECT DEVELOPMENT MANAGEMENT, ECONOMICS AND ADMINISTRATION', 'project-development-management-economics-and-administration', NULL::text),
  ('SOCIAL RESEARCH PROJECT', 'social-research-project', NULL::text),
  ('KISWAHILI', 'kiswahili', NULL::text),
  ('SOCIAL RESEARCH METHODS AND COMMUNICATION SKILLS', 'social-research-methods-and-communication-skills', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('COMMUNITY HEALTH', 'community-health', NULL::text),
  ('LIFE SKILLS', 'life-skills', NULL::text),
  ('ECONOMICS', 'economics', NULL::text),
  ('ADMINISTRATION AND MANAGEMENT', 'administration-and-management', NULL::text),
  ('DEVELOPMENT ECONOMICS', 'development-economics', NULL::text),
  ('FIELD PRACTICUM/REPORT', 'field-practicum-report', NULL::text),
  ('PROJECT', 'project', NULL::text),
  ('ENGLISH LANGUAGE', 'english-language', NULL::text),
  ('ESSENTIALS OF SOCIAL POLICY AND ADMINISTRATION', 'essentials-of-social-policy-and-administration', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('SOCIOLOGY', 'sociology', NULL::text),
  ('INTRODUCTION TO COMMUNITY DEVELOPMENT', 'introduction-to-community-development', NULL::text),
  ('LEGAL ASPECTS IN SOCIAL WORK', 'legal-aspects-in-social-work', NULL::text),
  ('INFORMATION AND COMMUNICATION TECHNOLOGY', 'information-and-communication-technology', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'social-work' AND c.slug = 'national-certificate-in-social-development';


-- ==============================================================================
-- SEED SCRIPT FOR: CLOTHING AND TEXTILE (KNEC COURSES)
-- Total Courses: 3 | Total Units: 44
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under KNEC: CLOTHING AND TEXTILE
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'CLOTHING AND TEXTILE', 'clothing-and-textile', 'KNEC Diploma, Certificate, and Artisan past examination papers and modules in Fashion Design, Clothing Technology, and Garment Making.', 10
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'clothing-and-textile'
);

-- 4. Insert KNEC Courses under CLOTHING AND TEXTILE
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN FASHION DESIGN AND CLOTHING TECHNOLOGY', 'diploma-in-fashion-design-and-clothing-technology', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'clothing-and-textile';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN FASHION DESIGN AND GARMENT MAKING TECHNOLOGY', 'certificate-in-fashion-design-and-garment-making-technology', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'clothing-and-textile';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'ARTISAN IN GARMENT MAKING', 'artisan-in-garment-making', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'clothing-and-textile';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN FASHION DESIGN AND CLOTHING TECHNOLOGY [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ART AND DESIGN', 'art-and-design', NULL::text),
  ('FASHION DESIGN AND SKETCHING I', 'fashion-design-and-sketching-i', NULL::text),
  ('CUTTING TECHNOLOGY I', 'cutting-technology-i', NULL::text),
  ('CLOTHING CONSTRUCTION I PRACTICAL', 'clothing-construction-i-practical', NULL::text),
  ('INFORMATION COMMUNICATION TECHNOLOGY', 'information-communication-technology', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text),
  ('ENTREPRENEURSHIP', 'entrepreneurship', NULL::text),
  ('PATTERN CONSTRUCTION I PRACTICAL', 'pattern-construction-i-practical', NULL::text),
  ('TEXTILE SCIENCE I', 'textile-science-i', NULL::text),
  ('CONSTRUCTION I THEORY', 'construction-i-theory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';

-- Module 2: Module II (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CLOTHING CONSTRUCTION II PRACTICAL', 'clothing-construction-ii-practical', NULL::text),
  ('FASHION DESIGN AND SKETCHING II', 'fashion-design-and-sketching-ii', NULL::text),
  ('CUTTING TECHNOLOGY II THEORY', 'cutting-technology-ii-theory', NULL::text),
  ('INDUSTRIAL ORGANIZATION MANAGEMENT I', 'industrial-organization-management-i', NULL::text),
  ('QUALITY CONTROL I', 'quality-control-i', NULL::text),
  ('PATTERN CONSTRUCTION II AND GRADING TECHNIQUES I PRACTICAL', 'pattern-construction-ii-and-grading-techniques-i-practical', NULL::text),
  ('TEXTILE SCIENCE II', 'textile-science-ii', NULL::text),
  ('CLOTHING CONSTRUCTION II THEORY', 'clothing-construction-ii-theory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';

-- Module 3: Module III (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('CLOTHING CONSTRUCTION III PRACTICAL', 'clothing-construction-iii-practical', NULL::text),
  ('CLOTHING CONSTRUCTION III THEORY', 'clothing-construction-iii-theory', NULL::text),
  ('FASHION MARKETING', 'fashion-marketing', NULL::text),
  ('INDUSTRIAL ORGANIZATION MANAGEMENT II', 'industrial-organization-management-ii', NULL::text),
  ('QUALITY CONTROL II', 'quality-control-ii', NULL::text),
  ('PATTERN CONSTRUCTION III AND GRADING TECHNIQUES II PRACTICAL', 'pattern-construction-iii-and-grading-techniques-ii-practical', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'diploma-in-fashion-design-and-clothing-technology';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN FASHION DESIGN AND GARMENT MAKING TECHNOLOGY [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'certificate-in-fashion-design-and-garment-making-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('ART, FASHION DESIGN SKETCHING', 'art-fashion-design-sketching', NULL::text),
  ('PATTERN DRAFTING I', 'pattern-drafting-i', NULL::text),
  ('FABRIC COLOURATION PRACTICAL', 'fabric-colouration-practical', NULL::text),
  ('ICT, MATHEMATICS AND ENTREPRENEURSHIP', 'ict-mathematics-and-entrepreneurship', NULL::text),
  ('TEXTILE MATERIAL KNOWLEDGE AND FABRIC COLOURATION THEORY', 'textile-material-knowledge-and-fabric-colouration-theory', NULL::text),
  ('WORKSHOP ORGANIZATION AND GENERAL INFORMATION', 'workshop-organization-and-general-information', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'certificate-in-fashion-design-and-garment-making-technology';

-- Module 2: Module II (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'certificate-in-fashion-design-and-garment-making-technology';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('BATIK PRACTICAL', 'batik-practical', NULL::text),
  ('EMBROIDERY PRACTICAL', 'embroidery-practical', NULL::text),
  ('GARMENT MAKING PRACTICAL FOR MEN', 'garment-making-practical-for-men', NULL::text),
  ('GARMENT CUTTING THEORY', 'garment-cutting-theory', NULL::text),
  ('GARMENT MAKING THEORY', 'garment-making-theory', NULL::text),
  ('PATTERN DRAFTING II AND GRADING I', 'pattern-drafting-ii-and-grading-i', NULL::text),
  ('GARMENT MAKING PRACTICAL FOR WOMEN', 'garment-making-practical-for-women', NULL::text),
  ('COMMUNICATION SKILLS', 'communication-skills', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'certificate-in-fashion-design-and-garment-making-technology';

-- ------------------------------------------------------------------------------
-- Course: ARTISAN IN GARMENT MAKING [Level 4] (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'artisan-in-garment-making';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('APPLIED GEOMETRY', 'applied-geometry', NULL::text),
  ('PATTERN DRAFTING PRACTICAL', 'pattern-drafting-practical', NULL::text),
  ('MATHEMATICS', 'mathematics', NULL::text),
  ('SCIENCE', 'science', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text),
  ('TRADE THEORY', 'trade-theory', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'clothing-and-textile' AND c.slug = 'artisan-in-garment-making';


-- ==============================================================================
-- SEED SCRIPT FOR: MECHANICAL AND AUTOMOTIVE ENGINEERING (KNEC COURSES)
-- Total Courses: 6 | Total Units: 103
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
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


-- ==============================================================================
-- SEED SCRIPT FOR: EDUCATION (KNEC COURSES)
-- Total Courses: 2 | Total Units: 15
-- Target: Supabase Free Tier (Idempotent, Transactional & High Performance)
-- ==============================================================================
-- 2. Upsert Department under KNEC: EDUCATION
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'EDUCATION', 'education', 'KNEC Diploma and Certificate past examination papers and modules in Early Childhood Development and Education (ECDE).', 12
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
  WHERE p.slug = 'knec-courses' AND d.slug = 'education'
);

-- 4. Insert KNEC Courses under EDUCATION
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'DIPLOMA IN EARLY CHILDHOOD DEVELOPMENT AND EDUCATION (ECDE)', 'diploma-in-early-childhood-development-and-education-ecde', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'education';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'CERTIFICATE IN EARLY CHILDHOOD DEVELOPMENT AND EDUCATION (ECDE)', 'certificate-in-early-childhood-development-and-education-ecde', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'knec-courses' AND d.slug = 'education';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: DIPLOMA IN EARLY CHILDHOOD DEVELOPMENT AND EDUCATION (ECDE) [Level 6] (3 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (6 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'diploma-in-early-childhood-development-and-education-ecde';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CHILD DEVELOPMENT', 'child-development', NULL::text),
  ('FOUNDATIONS OF ECDE AND CURRICULUM DEVELOPMENT', 'foundations-of-ecde-and-curriculum-development', NULL::text),
  ('GENERAL PSYCHOLOGY, PERSONALITY DEVELOPMENT, GUIDANCE AND COUNSELLING', 'general-psychology-personality-development-guidance-and-counselling', NULL::text),
  ('HEALTH, NUTRITION AND CHILD RIGHTS', 'health-nutrition-and-child-rights', NULL::text),
  ('METHODOLOGY AND CURRICULUM ACTIVITY AREAS', 'methodology-and-curriculum-activity-areas', NULL::text),
  ('MANAGEMENT OF ECDE, COMMUNITY DEVELOPMENT AND RESEARCH', 'management-of-ecde-community-development-and-research', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'education' AND c.slug = 'diploma-in-early-childhood-development-and-education-ecde';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'diploma-in-early-childhood-development-and-education-ecde';

-- Module 3: Module III (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module III'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'diploma-in-early-childhood-development-and-education-ecde';

-- ------------------------------------------------------------------------------
-- Course: CERTIFICATE IN EARLY CHILDHOOD DEVELOPMENT AND EDUCATION (ECDE) [Level 5] (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module I (9 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module I'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'certificate-in-early-childhood-development-and-education-ecde';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CHILD DEVELOPMENT AND PSYCHOLOGY', 'child-development-and-psychology', NULL::text),
  ('CHILD HEALTH, NUTRITION, GUIDANCE AND COUNSELLING', 'child-health-nutrition-guidance-and-counselling', NULL::text),
  ('CURRICULUM AND METHODOLOGY', 'curriculum-and-methodology', NULL::text),
  ('CURRICULUM AND ACTIVITIES', 'curriculum-and-activities', NULL::text),
  ('ENGLISH', 'english', NULL::text),
  ('FOUNDATION OF ECDE AND CURRICULUM DEVELOPMENT', 'foundation-of-ecde-and-curriculum-development', NULL::text),
  ('FOUNDATIONS AND MANAGEMENT OF ECDE', 'foundations-and-management-of-ecde', NULL::text),
  ('GENERAL STUDIES', 'general-studies', NULL::text),
  ('KISWAHILI', 'kiswahili', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'education' AND c.slug = 'certificate-in-early-childhood-development-and-education-ecde';

-- Module 2: Module II (0 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module II'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'education' AND c.slug = 'certificate-in-early-childhood-development-and-education-ecde';


COMMIT;

SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
FROM departments d
JOIN programmes p ON p.id = d.programme_id
JOIN courses c ON c.department_id = d.id
LEFT JOIN units u ON u.course_id = c.id
WHERE p.slug = 'knec-courses'
GROUP BY d.name ORDER BY d.name;