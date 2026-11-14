-- ==============================================================================
-- SEED SCRIPT FOR: FASHION DESIGN AND COSMETOLOGY DEPARTMENT
-- TVET CDACC Cycle 3 Modular Courses and Units
-- Total Courses: 11 | Total Units: 127
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

-- 2. Upsert Department: FASHION DESIGN AND COSMETOLOGY DEPARTMENT
INSERT INTO departments (programme_id, name, slug, description, sort_order)
SELECT id, 'FASHION DESIGN AND COSMETOLOGY DEPARTMENT', 'fashion-design-and-cosmetology-department', 'Accredited TVET CDACC Fashion Design and Cosmetology modular courses in Hairdressing, Beauty Therapy, Nail Care, Fashion Design, and Footwear Production.', 7
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
  WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department'
);

-- 4. Insert Courses under FASHION DESIGN AND COSMETOLOGY DEPARTMENT
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COSMETOLOGY LEVEL 6', 'cosmetology-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 6', 'fashion-design-level-6', 6, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COSMETOLOGY LEVEL 5', 'cosmetology-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 5', 'fashion-design-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOTWEAR PRODUCTION LEVEL 5', 'footwear-production-level-5', 5, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COSMETOLOGY LEVEL 4', 'cosmetology-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 4', 'fashion-design-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOTWEAR PRODUCTION LEVEL 4', 'footwear-production-level-4', 4, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'COSMETOLOGY LEVEL 3', 'cosmetology-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FASHION DESIGN LEVEL 3', 'fashion-design-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';
INSERT INTO courses (department_id, name, slug, level, published)
SELECT d.id, 'FOOTWEAR PRODUCTION LEVEL 3', 'footwear-production-level-3', 3, true
FROM departments d
JOIN programmes p ON p.id = d.programme_id
WHERE p.slug = 'modular-cdacc-courses-cycle-3' AND d.slug = 'fashion-design-and-cosmetology-department';

-- 5. Insert Modules and Units for Each Course
-- ------------------------------------------------------------------------------
-- Course: COSMETOLOGY LEVEL 6 (6 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT BARBERING SERVICE', 'conduct-barbering-service', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE', 'provide-manicure-and-pedicure', NULL::text),
  ('PROVIDE PLAITING AND BRAIDING', 'provide-plaiting-and-braiding', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM HAIR STYLING SERVICES', 'perform-hair-styling-services', NULL::text),
  ('PROVIDE HAIR ADDITIONS SERVICES', 'provide-hair-additions-services', NULL::text),
  ('PROVIDE MAKE UP SERVICES', 'provide-make-up-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM NAIL CARE SERVICE', 'perform-nail-care-service', NULL::text),
  ('PROVIDE DREAD LOCKING SERVICE', 'provide-dread-locking-service', NULL::text),
  ('PROVIDE HAIR REMOVAL SERVICE', 'provide-hair-removal-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS PRACTICES', 'apply-work-ethics-practices', NULL::text),
  ('CONDUCT HAIR CUTTING SERVICE', 'conduct-hair-cutting-service', NULL::text),
  ('PROVIDE FACIAL SKIN CARE SERVICE', 'provide-facial-skin-care-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('MANAGE HAIR AND BEAUTY PARLOR', 'manage-hair-and-beauty-parlor', NULL::text),
  ('PERFORM HAIR CHEMICAL REFORMATION', 'perform-hair-chemical-reformation', NULL::text),
  ('PRODUCE HAIR EXTENSIONS', 'produce-hair-extensions', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('CARRY OUT COSMETOLOGY RESEARCH', 'carry-out-cosmetology-research', NULL::text),
  ('PROVIDE BODY MASSAGE', 'provide-body-massage', NULL::text),
  ('PROVIDE HAIR COLOURING', 'provide-hair-colouring', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-6';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 6 (7 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT BASIC GENT''S GARMENTS', 'construct-basic-gent-s-garments', NULL::text),
  ('CONSTRUCT BASIC LADIES'' GARMENTS', 'construct-basic-ladies-garments', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE DECORATED FABRICS (TIE & DYE AND PRINTING)', 'produce-decorated-fabrics-tie-and-dye-and-printing', NULL::text),
  ('PRODUCE STYLED GARMENTS', 'produce-styled-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY FASHION DESIGN AND SKETCHING', 'apply-fashion-design-and-sketching', NULL::text),
  ('APPLY TEXTILE MATERIALS PRINCIPLES', 'apply-textile-materials-principles', NULL::text),
  ('PRODUCE DECORATED FABRICS (BATIK AND EMBROIDERY)', 'produce-decorated-fabrics-batik-and-embroidery', NULL::text),
  ('PRODUCE LADIES'' WEAR', 'produce-ladies-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PATTERN CONSTRUCTION PRINCIPLES', 'apply-pattern-construction-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PRODUCE GENTS'' WEAR', 'produce-gents-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 5: Module 5
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 5, 'Module 5'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 5
JOIN (VALUES
  ('APPLY GARMENT CUTTING PRINCIPLES', 'apply-garment-cutting-principles', NULL::text),
  ('APPLY INDUSTRIAL ORGANISATION MANAGEMENT', 'apply-industrial-organisation-management', NULL::text),
  ('PRODUCE CHILDREN''S WEAR', 'produce-children-s-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 6: Module 6
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 6, 'Module 6'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 6
JOIN (VALUES
  ('APPLY COMPUTER AIDED DESIGN', 'apply-computer-aided-design', NULL::text),
  ('APPLY QUALITY CONTROL PRINCIPLES', 'apply-quality-control-principles', NULL::text),
  ('PRODUCE FASHION ACCESSORIES', 'produce-fashion-accessories', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- Module 7: Module 7
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 7, 'Module 7'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 7
JOIN (VALUES
  ('APPLY RESEARCH METHODS', 'apply-research-methods', NULL::text),
  ('PRODUCE LINGERIE WEAR', 'produce-lingerie-wear', NULL::text),
  ('PRODUCE OCCASION WEAR', 'produce-occasion-wear', NULL::text),
  ('PRODUCE SPORTS WEAR', 'produce-sports-wear', NULL::text),
  ('PRODUCE UNIFORM WEAR', 'produce-uniform-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-6';

-- ------------------------------------------------------------------------------
-- Course: COSMETOLOGY LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT BARBERING SERVICE', 'conduct-barbering-service', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICE', 'provide-manicure-and-pedicure-service', NULL::text),
  ('PROVIDE PLAITING AND BRAIDING SERVICE', 'provide-plaiting-and-braiding-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CONDUCT HAIR ADDITION SERVICE', 'conduct-hair-addition-service', NULL::text),
  ('PERFORM HAIR STYLING SERVICE', 'perform-hair-styling-service', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('PERFORM NAIL CARE SERVICES', 'perform-nail-care-services', NULL::text),
  ('PROVIDE DREAD LOCKING SERVICE', 'provide-dread-locking-service', NULL::text),
  ('PROVIDE HAIR REMOVAL SERVICE', 'provide-hair-removal-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CONDUCT HAIR CUTTING SERVICE', 'conduct-hair-cutting-service', NULL::text),
  ('PROVIDE FACIAL SKIN CARE SERVICE', 'provide-facial-skin-care-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-5';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT BASIC GENTS'' GARMENTS', 'construct-basic-gents-garments', NULL::text),
  ('CONSTRUCT BASIC LADIES'' GARMENTS', 'construct-basic-ladies-garments', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE DECORATED FABRICS (TIE & DIE AND PRINTING)', 'produce-decorated-fabrics-tie-and-die-and-printing', NULL::text),
  ('PRODUCE STYLED GARMENTS', 'produce-styled-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('APPLY FASHION DESIGN AND SKETCHING', 'apply-fashion-design-and-sketching', NULL::text),
  ('APPLY TEXTILE MATERIAL PRINCIPLES', 'apply-textile-material-principles', NULL::text),
  ('PRODUCE DECORATED FABRICS (BATIK AND EMBROIDERY)', 'produce-decorated-fabrics-batik-and-embroidery', NULL::text),
  ('PRODUCE LADIES'' WEAR', 'produce-ladies-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY PATTERN CONSTRUCTION AND GRADING PRINCIPLES', 'apply-pattern-construction-and-grading-principles', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('PRODUCE GENTS'' WEAR', 'produce-gents-wear', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-5';

-- ------------------------------------------------------------------------------
-- Course: FOOTWEAR PRODUCTION LEVEL 5 (4 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION I', 'carry-out-foot-wear-materials-preparation-i', NULL::text),
  ('CARRY OUT FOOTWEAR CONSTRUCTION AND FINISHING I', 'carry-out-footwear-construction-and-finishing-i', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS I', 'perform-footwear-closing-operations-i', NULL::text),
  ('REPAIR FOOTWEAR PRODUCTS', 'repair-footwear-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION II', 'carry-out-foot-wear-materials-preparation-ii', NULL::text),
  ('CARRY OUT PATTERN CUTTING', 'carry-out-pattern-cutting', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS II', 'perform-footwear-closing-operations-ii', NULL::text),
  ('PERFORM FOOTWEAR CONSTRUCTION AND FINISHING II', 'perform-footwear-construction-and-finishing-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';

-- Module 3: Module 3
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 3, 'Module 3'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 3
JOIN (VALUES
  ('APPLY COMMUNICATION SKILLS', 'apply-communication-skills', NULL::text),
  ('APPLY DIGITAL LITERACY', 'apply-digital-literacy', NULL::text),
  ('CARRY OUT FOOT MEASUREMENTS AND CALCULATIONS', 'carry-out-foot-measurements-and-calculations', NULL::text),
  ('CARRY OUT FOOTWEAR DESIGN AND PATTERN CUTTING', 'carry-out-footwear-design-and-pattern-cutting', NULL::text),
  ('CUT FOOTWEAR MATERIALS', 'cut-footwear-materials', NULL::text),
  ('PREPARE FOOTWEAR COMPONENTS', 'prepare-footwear-components', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';

-- Module 4: Module 4
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 4, 'Module 4'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 4
JOIN (VALUES
  ('APPLY ENTREPRENEURIAL SKILLS', 'apply-entrepreneurial-skills', NULL::text),
  ('APPLY WORK ETHICS AND PRACTICES', 'apply-work-ethics-and-practices', NULL::text),
  ('CARRY OUT FOOTWEAR CONSTRUCTION', 'carry-out-footwear-construction', NULL::text),
  ('CARRY OUT FOOTWEAR FINISHING OPERATIONS', 'carry-out-footwear-finishing-operations', NULL::text),
  ('PERFORM ESTIMATES AND COSTING', 'perform-estimates-and-costing', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS III', 'perform-footwear-closing-operations-iii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-5';

-- ------------------------------------------------------------------------------
-- Course: COSMETOLOGY LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT BARBERING SERVICE', 'conduct-barbering-service', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICE', 'provide-manicure-and-pedicure-service', NULL::text),
  ('PROVIDE PLAITING AND BRAIDING SERVICE', 'provide-plaiting-and-braiding-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PERFORM HAIR ADDITION SERVICE', 'perform-hair-addition-service', NULL::text),
  ('PERFORM HAIR STYLING SERVICE', 'perform-hair-styling-service', NULL::text),
  ('PROVIDE MAKE-UP SERVICES', 'provide-make-up-services', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-4';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT BASIC GENTS'' GARMENTS', 'construct-basic-gents-garments', NULL::text),
  ('CONSTRUCT BASIC LADIES'' GARMENTS', 'construct-basic-ladies-garments', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('PRODUCE DECORATED FABRICS', 'produce-decorated-fabrics', NULL::text),
  ('PRODUCE STYLED GARMENTS', 'produce-styled-garments', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-4';

-- ------------------------------------------------------------------------------
-- Course: FOOTWEAR PRODUCTION LEVEL 4 (2 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION', 'carry-out-foot-wear-materials-preparation', NULL::text),
  ('CARRY OUT FOOTWEAR CONSTRUCTION AND FINISHING I', 'carry-out-footwear-construction-and-finishing-i', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS I', 'perform-footwear-closing-operations-i', NULL::text),
  ('REPAIR FOOTWEAR PRODUCTS', 'repair-footwear-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-4';

-- Module 2: Module 2
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 2, 'Module 2'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-4';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 2
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION II', 'carry-out-foot-wear-materials-preparation-ii', NULL::text),
  ('CARRY OUT FOOT WEAR PATTERN CUTTING', 'carry-out-foot-wear-pattern-cutting', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS II', 'perform-footwear-closing-operations-ii', NULL::text),
  ('PERFORM FOOTWEAR CONSTRUCTION AND FINISHING II', 'perform-footwear-construction-and-finishing-ii', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-4';

-- ------------------------------------------------------------------------------
-- Course: COSMETOLOGY LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONDUCT BARBERING SERVICE', 'conduct-barbering-service', NULL::text),
  ('PROVIDE MANICURE AND PEDICURE SERVICE', 'provide-manicure-and-pedicure-service', NULL::text),
  ('PROVIDE PLAITING AND BRAIDING SERVICE', 'provide-plaiting-and-braiding-service', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'cosmetology-level-3';

-- ------------------------------------------------------------------------------
-- Course: FASHION DESIGN LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CONSTRUCT BASIC GENTS'' GARMENTS', 'construct-basic-gents-garments', NULL::text),
  ('CONSTRUCT BASIC LADIES'' GARMENTS', 'construct-basic-ladies-garments', NULL::text),
  ('INDUSTRIAL ATTACHMENT', 'industrial-attachment', NULL::text),
  ('PERFORM SEWING MACHINE OPERATIONS', 'perform-sewing-machine-operations', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'fashion-design-level-3';

-- ------------------------------------------------------------------------------
-- Course: FOOTWEAR PRODUCTION LEVEL 3 (1 Modules)
-- ------------------------------------------------------------------------------
-- Module 1: Module 1
INSERT INTO modules (course_id, module_number, title)
SELECT c.id, 1, 'Module 1'
FROM courses c
JOIN departments d ON d.id = c.department_id
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-3';
INSERT INTO units (module_id, course_id, name, slug, canonical_unit_id, published)
SELECT m.id, c.id, v.name, v.slug, canon.id, true
FROM courses c
JOIN departments d ON d.id = c.department_id
JOIN modules m ON m.course_id = c.id AND m.module_number = 1
JOIN (VALUES
  ('CARRY OUT FOOT WEAR MATERIALS PREPARATION', 'carry-out-foot-wear-materials-preparation', NULL::text),
  ('PERFORM FOOTWEAR CLOSING OPERATIONS', 'perform-footwear-closing-operations', NULL::text),
  ('PERFORM OUT FOOTWEAR CONSTRUCTION AND FINISHING I', 'perform-out-footwear-construction-and-finishing-i', NULL::text),
  ('REPAIR FOOTWEAR PRODUCTS', 'repair-footwear-products', NULL::text)
) AS v(name, slug, canon_slug) ON true
LEFT JOIN units canon ON v.canon_slug IS NOT NULL AND canon.course_id = c.id AND canon.slug = v.canon_slug
WHERE d.slug = 'fashion-design-and-cosmetology-department' AND c.slug = 'footwear-production-level-3';

COMMIT;
-- Verification Query: Check courses and units inserted for FASHION DESIGN AND COSMETOLOGY DEPARTMENT
-- SELECT d.name as department, count(distinct c.id) as total_courses, count(u.id) as total_units
-- FROM departments d
-- JOIN courses c ON c.department_id = d.id
-- LEFT JOIN units u ON u.course_id = c.id
-- WHERE d.slug = 'fashion-design-and-cosmetology-department'
-- GROUP BY d.name;