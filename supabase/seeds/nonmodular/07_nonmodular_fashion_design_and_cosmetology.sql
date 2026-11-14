-- ==============================================================================
-- SEED SCRIPT FOR: FASHION DESIGN AND COSMETOLOGY DEPARTMENT (CDACC CYCLE 1 & 2 NON-MODULAR)
-- Total Courses: 19 | Total Units: 241
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

-- 2. Upsert Department under Cycle 1 & 2: FASHION DESIGN AND COSMETOLOGY DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'FASHION DESIGN AND COSMETOLOGY DEPARTMENT', 'fashion-design-and-cosmetology-department', 'Accredited TVET CDACC (Cycle 1 & 2) non-modular Fashion Design, Cosmetology, Beauty Therapy, Hairdressing, Leather, and Textile courses.', 7
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
  WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department'
);

-- 4. Insert Non-Modular Courses under FASHION DESIGN AND COSMETOLOGY DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEAUTY THERAPY LEVEL 6', 'beauty-therapy-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN MANAGEMENT LEVEL 6', 'fashion-design-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HAIRDRESSER LEVEL 6', 'hairdresser-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HAIRDRESSING MANAGEMENT LEVEL 6', 'hairdressing-management-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LEATHER TECHNOLOGY LEVEL 6', 'leather-technology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TEXTILE TECHNICIAN LEVEL 6', 'textile-technician-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEAUTY THERAPIST LEVEL 5', 'beauty-therapist-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 5', 'fashion-design-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOTWEAR PRODUCER LEVEL 5', 'footwear-producer-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HAIRDRESSER LEVEL 5', 'hairdresser-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LEATHER GOODS PRODUCTION LEVEL 5', 'leather-goods-production-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'LEATHER PROCESSING (TANNING) LEVEL 5', 'leather-processing-tanning-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'TEXTILE PROCESSING CRAFTSPERSON LEVEL 5', 'textile-processing-craftsperson-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEAUTY THERAPIST LEVEL 4', 'beauty-therapist-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 4', 'fashion-design-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'HAIRDRESSING LEVEL 4', 'hairdressing-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'BEAUTY THERAPIST LEVEL 3', 'beauty-therapist-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN (DRESSMAKING AND TAILORING OPTIONS) LEVEL 3', 'fashion-design-dressmaking-and-tailoring-options-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN (TAILORING OPTION) LEVEL 3', 'fashion-design-tailoring-option-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department';

-- 5. Insert Competency Sections (Modules) and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: BEAUTY THERAPY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapy-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapy-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapy-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BEAUTY THERAPY OPERATION UNIT', 'manage-beauty-therapy-operation-unit', NULL::text),
  ('MANAGE BODY ART OPERATIONS', 'manage-body-art-operations', NULL::text),
  ('MANAGE BODY MASSAGE AND SPA OPERATIONS', 'manage-body-massage-and-spa-operations', NULL::text),
  ('MANAGE HAIR REMOVAL OPERATIONS', 'manage-hair-removal-operations', NULL::text),
  ('MANAGE MAKE UP OPERATIONS', 'manage-make-up-operations', NULL::text),
  ('MANAGE MANICURE AND PEDICURE OPERATIONS', 'manage-manicure-and-pedicure-operations', NULL::text),
  ('PROVIDE HAIR CUTTING SERVICES', 'provide-hair-cutting-services', NULL::text),
  ('PROVIDE NAIL TECHNOLOGY SERVICES', 'provide-nail-technology-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapy-level-6';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-management-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-management-level-6';

-- Section 2: Core Units of Competency (13 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('DESIGN AND CONSTRUCT BAGS', 'design-and-construct-bags', NULL::text),
  ('DESIGN AND CONSTRUCT BRIDAL WEAR', 'design-and-construct-bridal-wear', NULL::text),
  ('DESIGN AND CONSTRUCT CHILDRENS WEAR', 'design-and-construct-children-s-wear', NULL::text),
  ('DESIGN AND CONSTRUCT FASHION ACCESSORIES', 'design-and-construct-fashion-accessories', NULL::text),
  ('DESIGN AND CONSTRUCT GENTS WEAR', 'design-and-construct-gents-wear', NULL::text),
  ('DESIGN AND CONSTRUCT LADIES WEAR', 'design-and-construct-ladies-wear', NULL::text),
  ('DESIGN AND CONSTRUCT LINGERIE', 'design-and-construct-lingerie', NULL::text),
  ('DESIGN AND CONSTRUCT MILLINERY', 'design-and-construct-millinery', NULL::text),
  ('DESIGN AND CONSTRUCT SHOES', 'design-and-construct-shoes', NULL::text),
  ('DESIGN AND CONSTRUCT SPORTS WEAR', 'design-and-construct-sports-wear', NULL::text),
  ('DESIGN AND CONSTRUCT UNIFORM', 'design-and-construct-uniform', NULL::text),
  ('DESIGN AND DECORATE FABRICS', 'design-and-decorate-fabrics', NULL::text),
  ('MANAGE FASHION DESIGN STUDIO', 'manage-fashion-design-studio', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: HAIRDRESSER LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BARBERING OPERATIONS', 'manage-barbering-operations', NULL::text),
  ('MANAGE CHEMICAL REFORMATION OPERATIONS', 'manage-chemical-reformation-operations', NULL::text),
  ('MANAGE HAIR ADDITION OPERATIONS', 'manage-hair-addition-operations', NULL::text),
  ('MANAGE HAIR CUTTING OPERATIONS', 'manage-hair-cutting-operations', NULL::text),
  ('MANAGE HAIR SETTING AND STYLING OPERATIONS', 'manage-hair-setting-and-styling-operations', NULL::text),
  ('MANAGE HAIRDRESSING OPERATIONS UNIT', 'manage-hairdressing-operations-unit', NULL::text),
  ('PRODUCE HAIR PIECE PRODUCTS', 'produce-hair-piece-products', NULL::text),
  ('PROVIDE HAIR COLORING SERVICES', 'provide-hair-coloring-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-6';

-- ------------------------------------------------------------------------------
-- Course: HAIRDRESSING MANAGEMENT LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-management-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-management-level-6';

-- Section 2: Core Units of Competency (10 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-management-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('MANAGE BARBERING OPERATIONS', 'manage-barbering-operations', NULL::text),
  ('MANAGE HAIR ADDITION OPERATIONS', 'manage-hair-addition-operations', NULL::text),
  ('MANAGE HAIR CHEMICAL REFORMATION OPERATIONS', 'manage-hair-chemical-reformation-operations', NULL::text),
  ('MANAGE HAIR COLORING OPERATIONS', 'manage-hair-coloring-operations', NULL::text),
  ('MANAGE HAIR COLOURING AND LIGHTENING OPERATIONS', 'manage-hair-colouring-and-lightening-operations', NULL::text),
  ('MANAGE HAIR CUTTING OPERATIONS', 'manage-hair-cutting-operations', NULL::text),
  ('MANAGE HAIR SETTING AND STYLING OPERATIONS', 'manage-hair-setting-and-styling-operations', NULL::text),
  ('MANAGE HAIRDRESSING OPERATIONS', 'manage-hairdressing-operations', NULL::text),
  ('MANAGE HAIRDRESSING OPERATIONS UNIT', 'manage-hairdressing-operations-unit', NULL::text),
  ('MANAGE PRODUCTION OF HAIR PIECE PRODUCTS', 'manage-production-of-hair-piece-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-management-level-6';

-- ------------------------------------------------------------------------------
-- Course: LEATHER TECHNOLOGY LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-technology-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-technology-level-6';

-- Section 2: Core Units of Competency (8 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-technology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT ANIMAL FLAYING', 'carry-out-animal-flaying', NULL::text),
  ('CARRY OUT LEATHER PROCESSING', 'carry-out-leather-processing', NULL::text),
  ('MANAGE TANNERY WASTE', 'manage-tannery-waste', NULL::text),
  ('OPERATE LEATHER PRODUCTION MACHINES', 'operate-leather-production-machines', NULL::text),
  ('PERFORM HIDES/SKINS CURING', 'perform-hides-skins-curing', NULL::text),
  ('PRODUCE LEATHER FOOTWEAR', 'produce-leather-footwear', NULL::text),
  ('PRODUCE LEATHER GOODS', 'produce-leather-goods', NULL::text),
  ('PRODUCE UPHOLSTERY PRODUCTS', 'produce-upholstery-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-technology-level-6';

-- ------------------------------------------------------------------------------
-- Course: TEXTILE TECHNICIAN LEVEL 6 [Level 6]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';

-- Section 2: Common Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE', 'apply-material-science', NULL::text),
  ('APPLY MATERIAL SCIENCE PRINCIPLES', 'apply-material-science-principles', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('MANAGE TEXTILE PRODUCTION PROCESS', 'manage-textile-production-process', NULL::text),
  ('PERFORM TEXTILE TESTING', 'perform-textile-testing', NULL::text),
  ('PROCESS TEXTILE FABRIC', 'process-textile-fabric', NULL::text),
  ('PRODUCE KNITTED FABRIC', 'produce-knitted-fabric', NULL::text),
  ('PRODUCE NONWOVEN FABRIC', 'produce-nonwoven-fabric', NULL::text),
  ('PRODUCE TEXTILE YARN (SPINNING)', 'produce-textile-yarn-spinning', NULL::text),
  ('PRODUCE WOVEN FABRIC (WEAVING)', 'produce-woven-fabric-weaving', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-technician-level-6';

-- ------------------------------------------------------------------------------
-- Course: BEAUTY THERAPIST LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROVIDE BODY ART SERVICES', 'provide-body-art-services', NULL::text),
  ('PROVIDE BODY MASSAGE SERVICES', 'provide-body-massage-services', NULL::text),
  ('PROVIDE FACIAL SKIN CARE SERVICES', 'provide-facial-skin-care-services', NULL::text),
  ('PROVIDE HAIR REMOVAL SERVICE', 'provide-hair-removal-service', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICES', 'provide-manicure-and-pedicure-services', NULL::text),
  ('PROVIDE NAIL TECHNOLOGY SERVICES', 'provide-nail-technology-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-5';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSTRUCT MENSTRUAL HYGIENE PRODUCT', 'construct-menstrual-hygiene-product', NULL::text),
  ('DESIGN AND CONSTRUCT ACCESSORIES', 'design-and-construct-accessories', NULL::text),
  ('DESIGN AND CONSTRUCT GARMENTS', 'design-and-construct-garments', NULL::text),
  ('DESIGN AND DECORATE FABRICS', 'design-and-decorate-fabrics', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOTWEAR PRODUCER LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-producer-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-producer-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-producer-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT FOOTWEAR CONSTRUCTION', 'carry-out-footwear-construction', NULL::text),
  ('CARRY OUT FOOTWEAR DESIGN AND PATTERN CUTTING', 'carry-out-footwear-design-and-pattern-cutting', NULL::text),
  ('CARRY OUT FOOTWEAR FINISHING', 'carry-out-footwear-finishing', NULL::text),
  ('CARRY OUT FOOTWEAR SHOE ROOM OPERATIONS', 'carry-out-footwear-shoe-room-operations', NULL::text),
  ('CUT FOOTWEAR MATERIAL', 'cut-footwear-material', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS', 'perform-footwear-closing-operations', NULL::text),
  ('PREPARE FOOTWEAR COMPONENTS', 'prepare-footwear-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-producer-level-5';

-- ------------------------------------------------------------------------------
-- Course: HAIRDRESSER LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-5';

-- Section 2: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE HAIR PIECE PRODUCTS', 'produce-hair-piece-products', NULL::text),
  ('PROVIDE HAIR ADDITION SERVICES', 'provide-hair-addition-services', NULL::text),
  ('PROVIDE HAIR BARBERING SERVICES', 'provide-hair-barbering-services', NULL::text),
  ('PROVIDE HAIR CHEMICAL REFORMATION SERVICES', 'provide-hair-chemical-reformation-services', NULL::text),
  ('PROVIDE HAIR COLORING SERVICES', 'provide-hair-coloring-services', NULL::text),
  ('PROVIDE HAIR CUTTING SERVICE', 'provide-hair-cutting-service', NULL::text),
  ('PROVIDE HAIR SETTING AND STYLING SERVICES', 'provide-hair-setting-and-styling-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdresser-level-5';

-- ------------------------------------------------------------------------------
-- Course: LEATHER GOODS PRODUCTION LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-goods-production-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-goods-production-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-goods-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT LEATHER GOODS DESIGN AND PATTERN CUTTING', 'carry-out-leather-goods-design-and-pattern-cutting', NULL::text),
  ('CARRY OUT LEATHER GOODS FINISHING OPERATIONS', 'carry-out-leather-goods-finishing-operations', NULL::text),
  ('CUT LEATHER GOODS MATERIAL', 'cut-leather-goods-material', NULL::text),
  ('PERFORM LEATHER GOODS ASSEMBLY OPERATIONS', 'perform-leather-goods-assembly-operations', NULL::text),
  ('PREPARE LEATHER GOODS COMPONENTS', 'prepare-leather-goods-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-goods-production-level-5';

-- ------------------------------------------------------------------------------
-- Course: LEATHER PROCESSING (TANNING) LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-processing-tanning-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-processing-tanning-level-5';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-processing-tanning-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT FINISHING OPERATIONS', 'carry-out-finishing-operations', NULL::text),
  ('CARRY OUT POST TANNING PROCESSES', 'carry-out-post-tanning-processes', NULL::text),
  ('CARRY OUT PRE-TANNING AND TANNING PROCESSES', 'carry-out-pre-tanning-and-tanning-processes', NULL::text),
  ('MANAGE TANNERY WASTE', 'manage-tannery-waste', NULL::text),
  ('OPERATE LEATHER PRODUCTION MACHINES', 'operate-leather-production-machines', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'leather-processing-tanning-level-5';

-- ------------------------------------------------------------------------------
-- Course: TEXTILE PROCESSING CRAFTSPERSON LEVEL 5 [Level 5]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';

-- Section 2: Common Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Common Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('APPLY ENGINEERING MATHEMATICS', 'apply-engineering-mathematics', NULL::text),
  ('APPLY FLUID MECHANICS PRINCIPLES', 'apply-fluid-mechanics-principles', NULL::text),
  ('APPLY MATERIAL SCIENCE', 'apply-material-science', NULL::text),
  ('PREPARE AND INTERPRET TECHNICAL DRAWINGS', 'prepare-and-interpret-technical-drawings', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';

-- Section 3: Core Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY MECHANICAL SCIENCE PRINCIPLES', 'apply-mechanical-science-principles', NULL::text),
  ('PERFORM MACHINE MAINTENANCE', 'perform-machine-maintenance', NULL::text),
  ('PERFORM QUALITY CONTROL', 'perform-quality-control', NULL::text),
  ('PERFORM TEXTILE FINISHING', 'perform-textile-finishing', NULL::text),
  ('PRODUCE DYED TEXTILES', 'produce-dyed-textiles', NULL::text),
  ('PRODUCE PRE-TREATED TEXTILES', 'produce-pre-treated-textiles', NULL::text),
  ('PRODUCE PRINTED FABRICS', 'produce-printed-fabrics', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'textile-processing-craftsperson-level-5';

-- ------------------------------------------------------------------------------
-- Course: BEAUTY THERAPIST LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PROVIDE BODY ART SERVICES', 'provide-body-art-services', NULL::text),
  ('PROVIDE BODY MASSAGE SERVICES', 'provide-body-massage-services', NULL::text),
  ('PROVIDE HAIR REMOVAL SERVICES', 'provide-hair-removal-services', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICES', 'provide-manicure-and-pedicure-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-4';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONSTRUCT MENSTRUAL HYGIENE PRODUCTS', 'construct-menstrual-hygiene-products', NULL::text),
  ('DECORATE FABRICS AND GARMENTS', 'decorate-fabrics-and-garments', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text),
  ('SKETCH AND CONSTRUCT GARMENTS', 'sketch-and-construct-garments', NULL::text),
  ('SKETCH AND CONSTRUCT LADIES’ GARMENTS', 'sketch-and-construct-ladies-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';

-- ------------------------------------------------------------------------------
-- Course: HAIRDRESSING LEVEL 4 [Level 4]
-- ------------------------------------------------------------------------------
-- Section 1: Basic Units of Competency (7 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Basic Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-level-4';
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
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-level-4';

-- Section 2: Core Units of Competency (5 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE HAIR PIECE PRODUCTS', 'produce-hair-piece-products', NULL::text),
  ('PROVIDE BARBERING SERVICES', 'provide-barbering-services', NULL::text),
  ('PROVIDE HAIR ADDITION SERVICES', 'provide-hair-addition-services', NULL::text),
  ('PROVIDE HAIR COLOURING SERVICES', 'provide-hair-colouring-services', NULL::text),
  ('PROVIDE HAIR SETTING AND STYLING SERVICES', 'provide-hair-setting-and-styling-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'hairdressing-level-4';

-- ------------------------------------------------------------------------------
-- Course: BEAUTY THERAPIST LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (4 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PROVIDE BODY ART SERVICES', 'provide-body-art-services', NULL::text),
  ('PROVIDE HEAD AND SHOULDER MASSAGE SERVICES', 'provide-head-and-shoulder-massage-services', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICES', 'provide-manicure-and-pedicure-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'beauty-therapist-level-3';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN (DRESSMAKING AND TAILORING OPTIONS) LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-dressmaking-and-tailoring-options-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text),
  ('SKETCH AND CONSTRUCT LADIES GARMENTS', 'sketch-and-construct-ladies-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-dressmaking-and-tailoring-options-level-3';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN (TAILORING OPTION) LEVEL 3 [Level 3]
-- ------------------------------------------------------------------------------
-- Section 1: Core Units of Competency (2 units)
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Core Units of Competency'
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-tailoring-option-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN programmes p ON p.id = d.programme_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text),
  ('SKETCH AND CONSTRUCT GENTS GARMENTS', 'sketch-and-construct-gent-s-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-tailoring-option-level-3';

COMMIT;
-- Verification Query:
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN programmes p ON p.id = d.programme_id
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE p.slug = 'cdacc-courses-cycle-1-and-2' AND d.slug = 'fashion-design-and-cosmetology-department'
-- GROUP BY d.name;