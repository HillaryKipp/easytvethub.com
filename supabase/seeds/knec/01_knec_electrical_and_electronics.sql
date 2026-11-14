-- ==============================================================================
-- SEED SCRIPT FOR: ELECTRICAL AND ELECTRONIC ENGINEERING (KNEC COURSES)
-- Total Courses: 8 | Total Units: 164
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

COMMIT;
-- Verification Query: Check courses and units inserted for ELECTRICAL AND ELECTRONIC ENGINEERING
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'electrical-and-electronic-engineering'
-- GROUP BY d.name;