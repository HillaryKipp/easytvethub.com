import {
  Course,
  Department,
  EnrichedCourse,
  EnrichedUnit,
  FAQItem,
  Programme,
} from './types';
import { formatResourceType, toTitleCase, truncateDescription } from './utils';

export function resolveOgImage(
  entityOg?: string | null,
  parentOg?: string | null,
  grandParentOg?: string | null,
  greatGrandParentOg?: string | null
): string {
  const candidate =
    entityOg?.trim() ||
    parentOg?.trim() ||
    grandParentOg?.trim() ||
    greatGrandParentOg?.trim() ||
    '/og-default.png';
  return candidate;
}

export function getUnitIntro(unit: EnrichedUnit): string {
  if (unit.intro && unit.intro.trim()) {
    return unit.intro.trim();
  }
  const unitTitle = toTitleCase(unit.name);
  const courseTitle = toTitleCase(unit.course.name);
  const deptTitle = toTitleCase(unit.department.name);
  const progTitle = unit.programme.name;
  const levelText = unit.course.level ? `Level ${unit.course.level}` : 'TVET';
  const modNum = unit.module.module_number;
  const resCount = unit.resources.length;

  const docSummary =
    resCount > 0
      ? `Download ${resCount} verified assessment ${resCount === 1 ? 'document' : 'documents'} including ${Array.from(
          new Set(unit.resources.map((r) => formatResourceType(r.type).toLowerCase() + 's'))
        ).join(', ')} for practical and written exam preparation.`
      : `Review the official competency requirements, module placement, and assessment structure for trainees and assessors in Kenya.`;

  return `${unitTitle} is a core Module ${modNum} competency unit in the ${courseTitle} (${levelText}) qualification under the ${deptTitle}, ${progTitle}. ${docSummary}`;
}

export function getUnitWhatIsSummary(unit: EnrichedUnit): string {
  if (unit.description && unit.description.trim()) {
    return unit.description.trim();
  }
  const unitTitle = toTitleCase(unit.name);
  const courseTitle = toTitleCase(unit.course.name);
  const modTitle = unit.module.title
    ? `Module ${unit.module.module_number} (${unit.module.title})`
    : `Module ${unit.module.module_number}`;

  return `${unitTitle} equips TVET trainees with practical competencies, workplace standards, and technical skills required under ${modTitle} of ${courseTitle}. Candidates are assessed through practical performance tasks, portfolio of evidence, written tests, and oral questioning using standardized CDACC or KNEC assessment tools.`;
}

export function getUnitFAQs(unit: EnrichedUnit): FAQItem[] {
  if (unit.faq && unit.faq.length > 0) {
    return unit.faq;
  }

  const unitTitle = toTitleCase(unit.name);
  const courseTitle = toTitleCase(unit.course.name);
  const deptTitle = toTitleCase(unit.department.name);
  const levelText = unit.course.level ? `Level ${unit.course.level}` : 'standard TVET level';

  const docTypes =
    unit.resources.length > 0
      ? Array.from(new Set(unit.resources.map((r) => formatResourceType(r.type)))).join(', ')
      : 'Cutting Lists, Candidate Tools, Assessor Guides, Past Papers, and Marking Schemes';

  return [
    {
      question: `Where can I download the ${unitTitle} assessor guide and candidate tool?`,
      answer: `You can download the ${unitTitle} assessor guide, candidate tool, cutting list, and past papers directly from the Downloads table on this page in PDF format at no cost.`,
    },
    {
      question: `Which documents are available for ${unitTitle}?`,
      answer:
        unit.resources.length > 0
          ? `Currently available assessment documents for ${unitTitle} include: ${docTypes} (${unit.resources.length} total ${unit.resources.length === 1 ? 'file' : 'files'} ready for direct PDF download).`
          : `Standard TVET assessment packages for ${unitTitle} cover ${docTypes}. New files are added as soon as assessment cycles are released.`,
    },
    {
      question: `Which level and course does ${unitTitle} belong to?`,
      answer: `${unitTitle} belongs to Module ${unit.module.module_number} of ${courseTitle} (${levelText}) in the ${deptTitle} under ${unit.programme.name}.`,
    },
  ];
}

export function getUnitMetaTitle(unit: EnrichedUnit): string {
  if (unit.seo_title && unit.seo_title.trim()) {
    return unit.seo_title.trim();
  }
  const unitTitle = toTitleCase(unit.name);
  return `${unitTitle} - Past Papers, Assessor Guide & Candidate Tool | TVET Papers Kenya`;
}

export function getUnitMetaDescription(unit: EnrichedUnit): string {
  if (unit.seo_description && unit.seo_description.trim()) {
    return truncateDescription(unit.seo_description.trim(), 160);
  }
  const unitTitle = toTitleCase(unit.name);
  const courseTitle = toTitleCase(unit.course.name);
  const raw = `Download free ${unitTitle} past papers, assessor guide, candidate tool, and cutting list PDF for ${courseTitle} (Module ${unit.module.module_number}) in Kenya.`;
  return truncateDescription(raw, 160);
}

export function getCourseIntro(course: EnrichedCourse): string {
  if (course.intro && course.intro.trim()) {
    return course.intro.trim();
  }
  const courseTitle = toTitleCase(course.name);
  const deptTitle = toTitleCase(course.department.name);
  const progTitle = course.programme.name;
  const levelText = course.level ? `Level ${course.level}` : 'Accredited';
  const modCount = course.modules.length;
  const unitCount = course.units.length;

  return `${courseTitle} is an accredited Kenyan TVET ${levelText} qualification in the ${deptTitle} under ${progTitle}. The curriculum is structured into ${modCount} ${modCount === 1 ? 'module' : 'modules'} and ${unitCount} competency ${unitCount === 1 ? 'unit' : 'units'}, providing trainees and trainers with downloadable past papers, assessor guides, candidate tools, and cutting lists.`;
}

export function getCourseFAQs(course: EnrichedCourse): FAQItem[] {
  if (course.faq && course.faq.length > 0) {
    return course.faq;
  }
  const courseTitle = toTitleCase(course.name);
  const deptTitle = toTitleCase(course.department.name);
  const levelText = course.level ? `Level ${course.level}` : 'TVET';

  return [
    {
      question: `How many modules and units are in ${courseTitle}?`,
      answer: `${courseTitle} has ${course.modules.length} ${course.modules.length === 1 ? 'module' : 'modules'} and ${course.units.length} indexed ${course.units.length === 1 ? 'unit' : 'units'} across its competency-based curriculum structure.`,
    },
    {
      question: `Where can I download ${courseTitle} past papers and assessment tools?`,
      answer: `Select any unit listed under the modules on this page to download free PDF past papers, candidate tools, assessor guides, and practical cutting lists for ${courseTitle}.`,
    },
    {
      question: `Which department offers ${courseTitle} in Kenya?`,
      answer: `${courseTitle} is offered under the ${deptTitle} as part of ${course.programme.name} (${levelText} qualification framework).`,
    },
  ];
}

export function getCourseMetaTitle(course: EnrichedCourse): string {
  if (course.seo_title && course.seo_title.trim()) {
    return course.seo_title.trim();
  }
  const courseTitle = toTitleCase(course.name);
  return `${courseTitle} - Modules, Units & Past Papers | TVET Papers Kenya`;
}

export function getCourseMetaDescription(course: EnrichedCourse): string {
  if (course.seo_description && course.seo_description.trim()) {
    return truncateDescription(course.seo_description.trim(), 160);
  }
  const courseTitle = toTitleCase(course.name);
  const deptTitle = toTitleCase(course.department.name);
  const raw = `Explore all ${course.modules.length} modules and ${course.units.length} units for ${courseTitle} (${deptTitle}). Download CDACC & KNEC past papers, assessor guides, and candidate tools.`;
  return truncateDescription(raw, 160);
}

export function getDepartmentIntro(
  dept: Department,
  prog: Programme,
  courses: EnrichedCourse[]
): string {
  if (dept.intro && dept.intro.trim()) {
    return dept.intro.trim();
  }
  const deptTitle = toTitleCase(dept.name);
  const levels = Array.from(new Set(courses.map((c) => c.level).filter(Boolean))).sort((a, b) => (b || 0) - (a || 0));
  const levelStr = levels.length > 0 ? `across Levels ${levels.join(', ')}` : 'across all TVET levels';

  return `The ${deptTitle} under ${prog.name} offers ${courses.length} accredited technical and vocational courses ${levelStr} in Kenya. Browse courses by qualification level below to access modular units, downloadable past papers, practical cutting lists, candidate tools, and assessor guides for exam preparation.`;
}

export function getDepartmentFAQs(
  dept: Department,
  prog: Programme,
  courses: EnrichedCourse[]
): FAQItem[] {
  if (dept.faq && dept.faq.length > 0) {
    return dept.faq;
  }
  const deptTitle = toTitleCase(dept.name);
  const levels = Array.from(new Set(courses.map((c) => c.level).filter(Boolean))).sort((a, b) => (b || 0) - (a || 0));

  return [
    {
      question: `Which courses are offered in the ${deptTitle}?`,
      answer: `The ${deptTitle} under ${prog.name} includes ${courses.length} courses spanning Levels ${levels.join(', ') || '3 to 6'}, covering certificate, artisan, craft, and diploma TVET qualifications.`,
    },
    {
      question: `How do I find past papers for ${deptTitle} courses?`,
      answer: `Choose your course level (such as Level 6, Level 5, Level 4, or Level 3) on this page, open your specific course, and select any unit to download PDF past papers and assessment tools.`,
    },
  ];
}

export function getProgrammeIntro(
  prog: Programme,
  depts: Department[],
  courses: EnrichedCourse[]
): string {
  if (prog.intro && prog.intro.trim()) {
    return prog.intro.trim();
  }
  return `${prog.name} is a comprehensive Kenyan TVET curriculum framework featuring ${depts.length} specialized ${depts.length === 1 ? 'department' : 'departments'} and ${courses.length} indexed courses across Levels 3, 4, 5, and 6. Select a department or qualification level below to browse modules, competency units, and free downloadable assessment documents.`;
}

export function getProgrammeFAQs(
  prog: Programme,
  depts: Department[],
  courses: EnrichedCourse[]
): FAQItem[] {
  if (prog.faq && prog.faq.length > 0) {
    return prog.faq;
  }
  return [
    {
      question: `What is ${prog.name} in Kenya?`,
      answer: `${prog.name} covers nationally accredited technical and vocational education courses in Kenya across ${depts.length} departments and ${courses.length} courses, assessed through practical and written competency evaluations.`,
    },
    {
      question: `Which levels are available under ${prog.name}?`,
      answer: `Courses under ${prog.name} are organized by Kenyan National Qualifications Framework (KNQF) levels, including Level 6 (Diploma), Level 5 (Craft Certificate), Level 4 (Artisan), and Level 3 (National Skills Certificate).`,
    },
  ];
}
