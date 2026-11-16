import {
  Course,
  Department,
  EnrichedArticle,
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

export interface DepartmentDomainProfile {
  key: string;
  overviewParagraph: string;
  practicalFocus: string;
  regulatoryBodies: string;
  careerPathways: string[];
  industrySettings: string;
  recommendedTools: string;
}

const DEPARTMENT_PROFILES: Record<string, DepartmentDomainProfile> = {
  business: {
    key: 'business',
    overviewParagraph:
      'Courses in the Business Studies Department prepare learners for financial management, corporate governance, statutory taxation, procurement compliance, human capital administration, and entrepreneurial leadership within Kenya’s public and private sectors.',
    practicalFocus:
      'Workplace simulations, computerized accounting software (such as QuickBooks, Sage, and ERP modules), payroll processing, tax return filing on KRA iTax, public procurement documentation under PPADA rules, and case-study portfolio evaluations.',
    regulatoryBodies:
      'TVET-CDACC, the Kenya National Examinations Council (KNEC), KASNEB (for professional exemptions in CPA, CS, and CIFA), the Kenya Institute of Supplies Management (KISM), and the Institute of Human Resource Management (IHRM).',
    careerPathways: [
      'Accounts Assistant & Bookkeeper',
      'Tax Compliance & Audit Associate',
      'Supply Chain & Procurement Officer',
      'Human Resource & Payroll Administrator',
      'Credit Control & Microfinance Officer',
      'Marketing & Business Development Executive',
    ],
    industrySettings:
      'commercial banks, SACCOs, auditing firms, county and national government ministries, NGOs, manufacturing enterprises, and retail corporations',
    recommendedTools:
      'financial calculators, updated Kenya Finance Act tax tables, IFRS accounting standards summaries, and computerized spreadsheet templates',
  },
  computing: {
    key: 'computing',
    overviewParagraph:
      'Courses in the Computing and Informatics Department train technical specialists in software engineering, systems administration, network infrastructure, cybersecurity, database management, and digital information services.',
    practicalFocus:
      'Hands-on coding and debugging, local area network (LAN) cabling and router configuration, relational database querying (SQL), web and mobile application deployment, hardware diagnostics, and preventive ICT maintenance.',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the Information Communications Technology Authority (ICTA), and the Computer Society of Kenya (CSK).',
    careerPathways: [
      'Systems & Network Administrator',
      'Full-Stack & Mobile Software Developer',
      'IT Helpdesk & Technical Support Specialist',
      'Database & Cloud Infrastructure Technician',
      'Cybersecurity & Information Systems Auditor',
      'Digital Library & Records Management Officer',
    ],
    industrySettings:
      'software development agencies, telecommunications firms, commercial banks, government e-citizen support centers, educational institutions, and corporate IT departments',
    recommendedTools:
      'crimping and network testing kits, development IDEs, Linux/Windows server virtual machines, and structured database design tools',
  },
  electrical: {
    key: 'electrical',
    overviewParagraph:
      'Courses in the Electrical and Electronic Engineering Department develop hands-on engineering technicians and technologists skilled in domestic and industrial power installation, solar photovoltaic (PV) systems, industrial automation, mechatronics, and telecommunications.',
    practicalFocus:
      'Single-phase and three-phase wiring installation, conduit bending and trunking, motor control circuit design (DOL, Star-Delta), Programmable Logic Controller (PLC) programming, solar PV array sizing, and fault diagnosis using digital multimeters and insulation testers.',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the Energy and Petroleum Regulatory Authority (EPRA) for electrical contractor and solar technician licensing, and the Institution of Engineering Technologists and Technicians (IET).',
    careerPathways: [
      'Licensed Electrical Installation Technician',
      'Solar PV System Designer & Installer',
      'Industrial Automation & PLC Maintenance Technician',
      'Power Distribution & Substation Technician',
      'Telecommunications & Fiber Optic Technician',
      'Biomedical & Electronic Equipment Technologist',
    ],
    industrySettings:
      'power utilities (Kenya Power, KenGen, REREC), renewable energy engineering firms, automated manufacturing plants, commercial construction projects, and telecommunications providers',
    recommendedTools:
      'digital multimeters, insulation resistance testers (Megger), conduit bending machines, soldering stations, and IEE/EPRA wiring regulation handbooks',
  },
  building: {
    key: 'building',
    overviewParagraph:
      'Courses in the Building and Civil Engineering Department train technical professionals in structural construction, quantity surveying, architectural drafting, highway and water engineering, land surveying, GIS cartography, plumbing, and masonry.',
    practicalFocus:
      'Technical and CAD drawing interpretation, site leveling with dumpy levels and total stations, concrete mix design and cube crushing tests, pipe threading and sanitary fitting installation, timber joinery, and bill of quantities (BoQ) takeoff.',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the National Construction Authority (NCA) for site supervisor and contractor accreditation, and the Institution of Surveyors of Kenya (ISK).',
    careerPathways: [
      'Civil Engineering & Site Construction Supervisor',
      'Architectural & Structural CAD Draughtsman',
      'Assistant Quantity Surveyor & Estimator',
      'Land Engineering Surveyor & GIS Technician',
      'Licensed Plumbing & Sanitary Pipework Technician',
      'Masonry, Tiling & Structural Finishing Foreman',
    ],
    industrySettings:
      'civil engineering contractors, architectural and quantity surveying consultancies, water and sanitation companies, road authorities (KeNHA, KURA, KeRRA), and real estate developers',
    recommendedTools:
      'scale rules, technical drawing instruments, AutoCAD/Archicad workstations, spirit levels, surveying tripods, and Standard Method of Measurement (SMM) guides',
  },
  mechanical: {
    key: 'mechanical',
    overviewParagraph:
      'Courses in the Mechanical and Automotive Engineering Department equip trainees with competencies in internal combustion and hybrid vehicle diagnostics, lathe and CNC machining, TIG/MIG/Arc welding fabrication, refrigeration and air conditioning (HVAC), and heavy construction plant maintenance.',
    practicalFocus:
      'Engine overhaul and OBD-II electronic diagnostics, precision turning and milling on center lathes, structural metal fabrication and non-destructive weld testing, hydraulic and pneumatic circuit servicing, and workshop metrology using vernier calipers and micrometers.',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the National Industrial Training Authority (NITA), the Directorate of Occupational Safety and Health Services (DOSHS), and the Institution of Engineering Technologists and Technicians (IET).',
    careerPathways: [
      'Automotive Diagnostic & Service Technician',
      'Mechanical Production & CNC Machinist',
      'Certified Structural Welder & Metal Fabricator',
      'Construction Plant & Heavy Machinery Mechanic',
      'Industrial Plant Maintenance Technologist',
      'HVAC & Refrigeration Systems Technician',
    ],
    industrySettings:
      'automotive dealerships and service centers, heavy manufacturing industries, sugar and tea processing factories, engineering machine shops, and infrastructure equipment fleets',
    recommendedTools:
      'vernier calipers, outside micrometers, torque wrenches, OBD-II diagnostic scanners, welding PPE helmets, and technical workshop manuals',
  },
  health: {
    key: 'health',
    overviewParagraph:
      'Courses in the Health Science Department prepare compassionate, evidence-based healthcare practitioners in community health extension, clinical nutrition and dietetics, perioperative theatre technology, health records management, and patient caregiving.',
    practicalFocus:
      'Anthropometric nutritional assessments, therapeutic meal planning, community disease surveillance and WASH interventions, vital signs monitoring, infection prevention and control (IPC), and electronic health information systems (KHIS/DHIS2).',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the Kenya Nutritionists and Dieticians Institute (KNDI), the Public Health Officers and Technicians Council (PHOTC), and the Ministry of Health.',
    careerPathways: [
      'Community Health Assistant (CHA) & Extension Worker',
      'Registered Nutrition & Dietetics Technologist',
      'Perioperative Theatre Technologist',
      'Health Records & Information Officer',
      'Certified Patient Caregiver & Home-Based Care Specialist',
      'Orthopaedic & Trauma Medicine Technician',
    ],
    industrySettings:
      'county referral and sub-county hospitals, private medical centers, maternal and child health clinics, humanitarian health NGOs, school feeding programmes, and rehabilitation facilities',
    recommendedTools:
      'MUAC tapes, weighing scales, clinical thermometers, blood pressure monitors, Kenya Clinical Nutrition Reference Manuals, and IPC safety gear',
  },
  agriculture: {
    key: 'agriculture',
    overviewParagraph:
      'Courses in the Agriculture and Aquaculture Department focus on climate-smart crop production, livestock health and husbandry, dairy processing technology, agribusiness value-chain management, horticulture, and commercial fish farming.',
    practicalFocus:
      'Soil sampling and fertility testing, greenhouse and drip irrigation setup, livestock feed formulation, artificial insemination and herd health routines, milk quality testing and pasteurization, and farm financial record keeping.',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the Kenya Dairy Board (KDB), the Agriculture and Food Authority (AFA), and the Kenya Veterinary Board (KVB).',
    careerPathways: [
      'Agricultural Extension & Field Advisory Officer',
      'Commercial Farm & Greenhouse Manager',
      'Dairy Plant & Food Processing Technologist',
      'Livestock Production & Animal Health Assistant',
      'Agribusiness & Cooperative Enterprise Officer',
      'Aquaculture & Hatchery Production Technician',
    ],
    industrySettings:
      'commercial agribusiness estates, dairy processing cooperatives, county agricultural extension offices, seed and agro-chemical companies, and export horticulture farms',
    recommendedTools:
      'soil pH testing kits, lactometers, pruning and grafting knives, farm budgeting templates, and protective field boots and overalls',
  },
  catering: {
    key: 'catering',
    overviewParagraph:
      'Courses in the Catering and Accommodation Department train hospitality professionals in culinary arts, commercial food and beverage production, pastry and baking technology, barista skills, housekeeping and laundry management, and tour and travel operations.',
    practicalFocus:
      'Commercial kitchen mise-en-place, multi-course menu preparation, HACCP food safety and hygiene compliance, restaurant silver and plated service, professional espresso extraction, front-office reservation systems, and accommodation housekeeping standards.',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the Tourism Regulatory Authority (TRA), and the Kenya Utalii hospitality standards framework.',
    careerPathways: [
      'Commis Chef & Culinary Arts Specialist',
      'Food and Beverage Service Supervisor',
      'Commercial Pastry Chef & Baker',
      'Executive Housekeeper & Accommodation Manager',
      'Professional Barista & Mixology Specialist',
      'Tour & Travel Operations Consultant',
    ],
    industrySettings:
      'five-star hotels and safari lodges, commercial restaurants and cafes, airline and institutional catering units, cruise lines, and tour operator agencies',
    recommendedTools:
      'professional chef knife sets, food temperature probes, kitchen uniform (chef jacket, toque, apron, safety clogs), and standard recipe costing sheets',
  },
  fashion: {
    key: 'fashion',
    overviewParagraph:
      'Courses in the Fashion Design and Cosmetology Department develop creative and technical artisans in garment pattern drafting, industrial apparel construction, textile decoration, professional hairdressing, beauty therapy, nail technology, and leather footwear production.',
    practicalFocus:
      'Body measurement and commercial pattern grading, industrial lockstitch and overlock machine operation, fabric cutting and garment assembly, chemical hair relaxer and color application, facial electrotherapy, manicure/pedicure sanitation, and salon enterprise management.',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the National Industrial Training Authority (NITA), and Kenyan fashion and cosmetology industry associations.',
    careerPathways: [
      'Fashion Designer & Pattern Maker',
      'Garment Production & Quality Control Supervisor',
      'Professional Hairdresser & Salon Stylist',
      'Licensed Beauty Therapist & Aesthetician',
      'Nail Care & Bridal Makeup Artist',
      'Leatherwork & Footwear Production Technologist',
    ],
    industrySettings:
      'apparel export processing zones (EPZs), bespoke fashion houses, commercial hair and beauty spas, media and film wardrobe departments, and independent studios',
    recommendedTools:
      'pattern drafting curves, tape measures, fabric shears, industrial sewing bobbins, sterilization autoclaves, and mannequin styling heads',
  },
  applied_science: {
    key: 'applied_science',
    overviewParagraph:
      'Courses in the Applied Science Department train laboratory technologists and analytical specialists in industrial and analytical chemistry, applied biology, microbiology, science laboratory technology, environmental science, and applied statistics.',
    practicalFocus:
      'Volumetric and gravimetric chemical analysis, spectrophotometry and chromatography, aseptic microbiological media preparation and culturing, laboratory safety and hazardous waste disposal, reagent standardization, and statistical data modeling.',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the Kenya Bureau of Standards (KEBS), the National Environment Management Authority (NEMA), and the Kenya Medical Laboratory Technicians and Technologists Board (KMLTTB) where applicable.',
    careerPathways: [
      'Science Laboratory Technologist',
      'Quality Assurance & Analytical Chemist',
      'Microbiology & Food Safety Lab Analyst',
      'Industrial Process Control Technician',
      'Research & Environmental Monitoring Assistant',
      'Applied Statistics & Data Research Officer',
    ],
    industrySettings:
      'pharmaceutical and food manufacturing laboratories, water quality testing agencies, university and school laboratories, agricultural research institutes (KALRO, KEMRI), and KEBS testing facilities',
    recommendedTools:
      'analytical balances, burettes and pipettes, laboratory coats and safety goggles, scientific calculators, and standard operating procedure (SOP) manuals',
  },
  social_work: {
    key: 'social_work',
    overviewParagraph:
      'Courses in the Social Work Department prepare community development practitioners, social welfare officers, child protection specialists, and psychosocial counselors dedicated to empowering vulnerable populations and managing social impact programmes.',
    practicalFocus:
      'Participatory rural appraisal (PRA), community mobilization and project proposal writing, case management and referral protocols, ethical client counseling sessions, monitoring and evaluation (M&E) data collection, and advocacy under Kenyan social protection laws.',
    regulatoryBodies:
      'TVET-CDACC, KNEC, the Kenya National Association of Social Workers (KNASW), and the Counsellors and Psychologists (CAP) regulatory framework.',
    careerPathways: [
      'Social Work & Welfare Case Officer',
      'Community Development & Project Coordinator',
      'Child Protection & Gender Officer',
      'Psychosocial Support & Guidance Counselor',
      'NGO Monitoring, Evaluation & Learning (MEL) Assistant',
      'County Social Services & Rehabilitation Officer',
    ],
    industrySettings:
      'international and local NGOs, county government social development departments, children’s homes and protection agencies, healthcare social work units, and faith-based community organizations',
    recommendedTools:
      'case management intake forms, Kenya Children Act and Social Protection policy guidelines, M&E logframe templates, and ethical counseling codes',
  },
};

export function getDepartmentDomainProfile(deptNameOrSlug: string): DepartmentDomainProfile {
  const s = deptNameOrSlug.toLowerCase();
  if (s.includes('business') || s.includes('account') || s.includes('commerce')) {
    return DEPARTMENT_PROFILES.business;
  }
  if (s.includes('comput') || s.includes('ict') || s.includes('informat')) {
    return DEPARTMENT_PROFILES.computing;
  }
  if (s.includes('electric') || s.includes('electronic')) {
    return DEPARTMENT_PROFILES.electrical;
  }
  if (s.includes('build') || s.includes('civil') || s.includes('construct')) {
    return DEPARTMENT_PROFILES.building;
  }
  if (s.includes('mechan') || s.includes('automot')) {
    return DEPARTMENT_PROFILES.mechanical;
  }
  if (s.includes('health') || s.includes('medic') || s.includes('nutrit')) {
    return DEPARTMENT_PROFILES.health;
  }
  if (s.includes('agric') || s.includes('aquacult')) {
    return DEPARTMENT_PROFILES.agriculture;
  }
  if (s.includes('cater') || s.includes('hospital') || s.includes('accommod') || s.includes('tour')) {
    return DEPARTMENT_PROFILES.catering;
  }
  if (s.includes('fashion') || s.includes('cosmet') || s.includes('cloth') || s.includes('textile')) {
    return DEPARTMENT_PROFILES.fashion;
  }
  if (s.includes('science') || s.includes('applied')) {
    return DEPARTMENT_PROFILES.applied_science;
  }
  if (s.includes('social') || s.includes('communit') || s.includes('educat')) {
    return DEPARTMENT_PROFILES.social_work;
  }
  return DEPARTMENT_PROFILES.business;
}

export interface LevelAcademicProfile {
  level: number;
  qualificationTitle: string;
  knqfBand: string;
  minimumEntry: string;
  typicalDuration: string;
  industrialAttachment: string;
  progressionPath: string;
  competencyExpectation: string;
}

export function getLevelAcademicProfile(level: number | null | undefined): LevelAcademicProfile {
  switch (level) {
    case 6:
      return {
        level: 6,
        qualificationTitle: 'TVET National Diploma (KNQF Level 6)',
        knqfBand: 'Level 6 Technologist / Supervisory Qualification',
        minimumEntry:
          'KCSE Mean Grade of C- (Minus) or a recognized KNQF Level 5 (Craft Certificate) qualification in a related technical discipline.',
        typicalDuration:
          '2 to 3 academic years (typically structured across 3 progressive modular cycles or 6–9 terms including industrial attachment).',
        industrialAttachment:
          'Mandatory 3 to 6 months (minimum 360–480 hours) of supervised industrial attachment in an accredited workplace setting.',
        progressionPath:
          'Graduates qualify for direct entry into the job market at supervisory/technologist level, professional licensing examinations (such as KASNEB CPA, EPRA, or NCA), or credit-transfer progression to a Bachelor of Technology (BTech) or Bachelor of Science degree.',
        competencyExpectation:
          'Trainees at Level 6 are expected to demonstrate autonomous technical execution, complex fault diagnosis, project estimation, resource supervision, and compliance with national occupational standards.',
      };
    case 5:
      return {
        level: 5,
        qualificationTitle: 'TVET Craft / National Certificate (KNQF Level 5)',
        knqfBand: 'Level 5 Skilled Technician / Craft Qualification',
        minimumEntry:
          'KCSE Mean Grade of D (Plain) or an accredited KNQF Level 4 (Artisan Certificate) qualification in the relevant trade area.',
        typicalDuration:
          '1.5 to 2 academic years (structured across modular competency cycles with integrated practical workshop training).',
        industrialAttachment:
          'Mandatory 3 months (minimum 320 hours) of practical workplace attachment logged in an official NITA/institutional attachment logbook.',
        progressionPath:
          'Graduates can enter technical employment as skilled technicians or progress seamlessly into KNQF Level 6 National Diploma programmes with exemptions for completed common and basic units.',
        competencyExpectation:
          'Trainees at Level 5 master practical trade execution, routine equipment maintenance, interpretation of technical specifications, and adherence to occupational health and safety (OHS) standards.',
      };
    case 4:
      return {
        level: 4,
        qualificationTitle: 'TVET Artisan / National Certificate II (KNQF Level 4)',
        knqfBand: 'Level 4 Artisan / Trade Operator Qualification',
        minimumEntry:
          'KCSE Mean Grade of D- (Minus), a KCSE Certificate, or completion of a KNQF Level 3 National Skills Certificate.',
        typicalDuration:
          '1 academic year (typically 2 to 3 intensive practical modules combining workshop practice and underpinning theory).',
        industrialAttachment:
          'Mandatory 2 to 3 months of field or workshop industrial attachment under a certified master craftsperson or company supervisor.',
        progressionPath:
          'Graduates can launch independent trade enterprises, secure employment as certified artisans, or articulate directly into KNQF Level 5 Craft Certificate programmes.',
        competencyExpectation:
          'Trainees at Level 4 focus heavily on hands-on workshop dexterity, safe tool handling, material preparation from cutting lists, and producing finished trade items within specified tolerances.',
      };
    case 3:
    default:
      return {
        level: level || 3,
        qualificationTitle: 'TVET National Vocational Certificate I (KNQF Level 3)',
        knqfBand: 'Level 3 Foundation Vocational & Trade Qualification',
        minimumEntry:
          'Kenya Certificate of Primary Education (KCPE), Kenya Primary School Education Assessment (KPSEA), or Recognition of Prior Learning (RPL) trade assessment.',
        typicalDuration:
          '6 to 12 months of intensive competency-based workshop and practical trade training.',
        industrialAttachment:
          '1 to 3 months of supervised workplace practice or institutional production unit attachment.',
        progressionPath:
          'Graduates gain foundational trade employability and can progress directly into KNQF Level 4 Artisan Certificate courses at any accredited Vocational Training Centre (VTC) or TTI.',
        competencyExpectation:
          'Trainees at Level 3 acquire essential workshop safety habits, basic hand and power tool operation, routine assembly procedures, and foundational entrepreneurial literacy.',
      };
  }
}

function getUnitYearRange(unit: EnrichedUnit): string | null {
  const years = Array.from(
    new Set(unit.resources.map((r) => r.year).filter((y): y is number => typeof y === 'number' && y > 1900))
  ).sort((a, b) => a - b);
  if (years.length === 0) return null;
  if (years.length === 1) return String(years[0]);
  return `${years[0]}–${years[years.length - 1]}`;
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

  if (unit.programme.slug === 'knec-courses') {
    const yearRange = getUnitYearRange(unit);
    const knecDocSummary =
      resCount > 0
        ? `Download ${resCount} free KNEC past ${resCount === 1 ? 'paper' : 'papers'} in PDF format${
            yearRange ? ` (${yearRange} July & November series)` : ''
          } for national exam revision.`
        : `Review the KNEC syllabus scope, module placement, and exam preparation guide for trainees in Kenya.`;
    return `${unitTitle} is an examinable Module ${modNum} unit in ${courseTitle} (${levelText}) under the ${deptTitle}, ${progTitle}. ${knecDocSummary}`;
  }

  const docSummary =
    resCount > 0
      ? `Download ${resCount} verified assessment ${resCount === 1 ? 'document' : 'documents'} including ${Array.from(
          new Set(unit.resources.map((r) => formatResourceType(r.type).toLowerCase() + 's'))
        ).join(', ')} for practical and written exam preparation.`
      : `Review the official competency requirements, module placement, practical performance criteria, and assessment structure for trainees and assessors in Kenya.`;

  return `${unitTitle} is a core Module ${modNum} competency unit in the ${courseTitle} (${levelText}) qualification under the ${deptTitle}, ${progTitle}. ${docSummary}`;
}

export function getUnitWhatIsSummary(unit: EnrichedUnit): string {
  if (unit.description && unit.description.trim()) {
    return unit.description.trim();
  }
  const unitTitle = toTitleCase(unit.name);
  const courseTitle = toTitleCase(unit.course.name);
  const deptProfile = getDepartmentDomainProfile(unit.department.name);
  const modTitle = unit.module.title
    ? `Module ${unit.module.module_number} (${unit.module.title})`
    : `Module ${unit.module.module_number}`;

  if (unit.programme.slug === 'knec-courses') {
    return `${unitTitle} equips TVET trainees with core theoretical principles and applied technical skills under ${modTitle} of ${courseTitle}. Within the ${toTitleCase(
      unit.department.name
    )}, this subject emphasizes ${deptProfile.practicalFocus.charAt(0).toLowerCase() + deptProfile.practicalFocus.slice(1)} Candidates sit for national Kenya National Examinations Council (KNEC) written and/or practical papers administered during the July and November examination series.`;
  }

  return `${unitTitle} equips TVET trainees with practical competencies, workplace standards, and underpinning technical knowledge required under ${modTitle} of ${courseTitle}. Within the ${toTitleCase(
    unit.department.name
  )}, this unit emphasizes ${deptProfile.practicalFocus.charAt(0).toLowerCase() + deptProfile.practicalFocus.slice(1)} Candidates are evaluated through practical performance tasks, Portfolio of Evidence (PoE) compilation, written theory papers, and oral questioning using standardized TVET-CDACC or KNEC assessment tools.`;
}

export interface UnitStudyGuide {
  competencyObjectives: string[];
  assessmentStructure: string;
  preparationSteps: string[];
}

export function getUnitStudyGuide(unit: EnrichedUnit): UnitStudyGuide {
  const unitTitle = toTitleCase(unit.name);
  const courseTitle = toTitleCase(unit.course.name);
  const deptProfile = getDepartmentDomainProfile(unit.department.name);
  const levelProfile = getLevelAcademicProfile(unit.course.level);
  const uUpper = unit.name.toUpperCase();

  const isCommonUnit =
    uUpper.includes('COMMUNICATION') ||
    uUpper.includes('ENTREPRENEUR') ||
    uUpper.includes('DIGITAL LITERACY') ||
    uUpper.includes('EMPLOYABILITY') ||
    uUpper.includes('ENVIRONMENTAL') ||
    uUpper.includes('OCCUPATIONAL SAFETY');

  const isMathOrScience =
    uUpper.includes('MATHEMATICS') ||
    uUpper.includes('SCIENCE') ||
    uUpper.includes('STATISTICS') ||
    uUpper.includes('CALCULATION') ||
    uUpper.includes('PHYSICS') ||
    uUpper.includes('CHEMISTRY');

  let competencyObjectives: string[];
  if (isCommonUnit) {
    competencyObjectives = [
      `Apply workplace communication, digital documentation, and professional ethics required in ${courseTitle}.`,
      `Demonstrate compliance with Kenyan Occupational Safety and Health Act (OSHA) regulations and environmental sustainability standards.`,
      `Develop viable business plans, financial budgets, and enterprise management strategies for self-employment or corporate innovation.`,
      `Compile verifiable workplace artifacts and reflective logs for the unit's Portfolio of Evidence (PoE).`,
    ];
  } else if (isMathOrScience) {
    competencyObjectives = [
      `Formulate and solve quantitative problems, technical equations, and analytical calculations relevant to ${courseTitle}.`,
      `Interpret engineering tables, statistical charts, scientific formulas, and measurement tolerances accurately.`,
      `Apply foundational scientific and mathematical principles to real-world troubleshooting in ${deptProfile.industrySettings}.`,
      `Verify calculated outputs against standard reference tables during both written theory exams and practical workshop tasks.`,
    ];
  } else {
    competencyObjectives = [
      `Execute hands-on technical procedures and workplace tasks for ${unitTitle} in accordance with ${deptProfile.regulatoryBodies.split(',')[0]} occupational standards.`,
      `Select, calibrate, and safely operate ${deptProfile.recommendedTools} while observing strict personal and workshop safety protocols.`,
      `Interpret candidate tools, technical blueprints, or operational briefs to produce deliverables that meet industry quality tolerances.`,
      `Document completed practical work, inspection checklists, and assessor feedback within the trainee Portfolio of Evidence (PoE).`,
    ];
  }

  if (unit.programme.slug === 'knec-courses') {
    const assessmentStructure = `In the ${unit.programme.name} framework, ${unitTitle} (Module ${unit.module.module_number}) is examined nationally by the Kenya National Examinations Council (KNEC) during the July and November exam series. Candidates are evaluated through timed written theory papers (and practical or project components where applicable), combined with institutional coursework/CATs. KNEC awards grades on the national technical scale (Distinction, Credit, Pass, or Refer/Fail). ${levelProfile.competencyExpectation}`;

    const preparationSteps = [
      `Review the official KNEC ${courseTitle} Module ${unit.module.module_number} syllabus for ${unitTitle} to map every examinable topic and sub-topic.`,
      `Download and solve past ${unitTitle} KNEC papers from both the July and November series to spot recurring question patterns, diagrams, and calculation formats.`,
      `Practice under strict exam timing (typically 2.5 to 3 hours per paper) and practice structured technical answers with clear formulas, labeled sketches, and units.`,
      `Focus on frequently tested core areas and revise institutional CATs alongside past KNEC papers well before the national examination sitting.`,
    ];

    return {
      competencyObjectives,
      assessmentStructure,
      preparationSteps,
    };
  }

  const assessmentStructure = `In the ${unit.programme.name} framework, ${unitTitle} (Module ${unit.module.module_number}) is assessed through a combination of formative continuous assessment and summative national evaluation. Trainees must demonstrate competence across both the Written Assessment (which tests underpinning theoretical concepts, safety rules, and analytical problem-solving) and the Practical Assessment (guided by the official Cutting List and Candidate Tool). Certified internal and external assessors score candidate performance using the official Assessor Guide rubric, grading trainees as Mastery, Proficient, Competent, or Not Yet Competent. ${levelProfile.competencyExpectation}`;

  const preparationSteps = [
    `Review the ${unitTitle} Occupational Standard (OS) and curriculum learning outcomes to ensure you can perform every listed performance criterion.`,
    `If a Cutting List is issued ahead of the practical sitting, verify all material dimensions, reagent grades, or software setups with your workshop technician prior to exam day.`,
    `Practice timed exercises using past Candidate Tools and Past Papers, paying close attention to how marks are allocated in the Assessor Guide between process skills and final product quality.`,
    `Organize your Portfolio of Evidence (PoE) binder with signed workshop job cards, practical photos, and continuous assessment test (CAT) scripts before external verification.`,
  ];

  return {
    competencyObjectives,
    assessmentStructure,
    preparationSteps,
  };
}

export function getUnitFAQs(unit: EnrichedUnit): FAQItem[] {
  if (unit.faq && unit.faq.length > 0) {
    return unit.faq;
  }

  const unitTitle = toTitleCase(unit.name);
  const courseTitle = toTitleCase(unit.course.name);
  const deptTitle = toTitleCase(unit.department.name);
  const levelText = unit.course.level ? `Level ${unit.course.level}` : 'standard TVET level';

  if (unit.programme.slug === 'knec-courses') {
    const yearRange = getUnitYearRange(unit);
    const resCount = unit.resources.length;
    return [
      {
        question: `How can I access ${unitTitle} KNEC past papers?`,
        answer: `Simply click on any ${unitTitle} KNEC past paper title (such as the July or November series) in the Available Past Papers list at the top of this page to open and view the full paper.`,
      },
      {
        question: `Which years of ${unitTitle} KNEC past papers are available?`,
        answer:
          resCount > 0
            ? `This page currently hosts ${resCount} ${unitTitle} KNEC ${resCount === 1 ? 'paper' : 'papers'}${
                yearRange ? ` spanning ${yearRange}` : ''
              } across the July and November examination series.`
            : `${unitTitle} KNEC past papers for July and November sittings are updated regularly as verified copies become available.`,
      },
      {
        question: `Which course and module does ${unitTitle} belong to?`,
        answer: `${unitTitle} is part of Module ${unit.module.module_number} in ${courseTitle} under the ${deptTitle} (${unit.programme.name}).`,
      },
      {
        question: `How is ${unitTitle} examined by KNEC?`,
        answer: `KNEC examines ${unitTitle} through national theory and/or practical papers during the July and November series, graded as Distinction, Credit, Pass, or Refer.`,
      },
    ];
  }

  const docTypes =
    unit.resources.length > 0
      ? Array.from(new Set(unit.resources.map((r) => formatResourceType(r.type)))).join(', ')
      : 'Cutting Lists, Candidate Tools, Assessor Guides, Past Papers, and Marking Schemes';

  return [
    {
      question: `How can I access the ${unitTitle} past papers, assessor guide, and candidate tool?`,
      answer: `Click on any listed document title under Available ${unitTitle} Past Papers & Assessment Tools at the top of this page to open the official cutting list, candidate tool, assessor guide, or past paper.`,
    },
    {
      question: `Which documents are available for ${unitTitle}?`,
      answer:
        unit.resources.length > 0
          ? `Currently available assessment documents for ${unitTitle} include: ${docTypes} (${unit.resources.length} total ${unit.resources.length === 1 ? 'document' : 'documents'}).`
          : `Standard TVET assessment packages for ${unitTitle} cover ${docTypes}. New documents are added as soon as assessment cycles are released.`,
    },
    {
      question: `Which level and course does ${unitTitle} belong to?`,
      answer: `${unitTitle} belongs to Module ${unit.module.module_number} of ${courseTitle} (${levelText}) in the ${deptTitle} under ${unit.programme.name}.`,
    },
    {
      question: `How is ${unitTitle} assessed in TVET exams?`,
      answer: `Candidates taking ${unitTitle} are evaluated through a written theory paper testing underpinning knowledge and a practical performance assessment scored by an accredited assessor using an official observation checklist and marking rubric.`,
    },
  ];
}

function getProgrammeShortTag(programmeSlug: string): string {
  if (programmeSlug.includes('modular')) return 'CDACC Cycle 3 Modular';
  if (programmeSlug.includes('knec')) return 'KNEC';
  return 'CDACC Cycle 1 & 2';
}

function getUniqueCourseDisplayTitle(course: { name: string; slug: string; level?: number | null; programme?: { slug: string } }): string {
  const baseTitle = toTitleCase(course.name);
  const isKnec = course.programme?.slug.includes('knec');
  const withLevel =
    !isKnec && course.level && !/\blevel\s*\d+\b/i.test(baseTitle)
      ? `${baseTitle} Level ${course.level}`
      : baseTitle;
  if (/-\d+$/.test(course.slug) && !course.slug.endsWith(`level-${course.level}`)) {
    const suffixMatch = course.slug.match(/-(\d+)$/);
    if (suffixMatch) {
      return `${withLevel} (Track ${suffixMatch[1]})`;
    }
  }
  return withLevel;
}

export function getUnitMetaTitle(unit: EnrichedUnit): string {
  if (unit.seo_title && unit.seo_title.trim()) {
    return unit.seo_title.trim();
  }
  const unitTitle = toTitleCase(unit.name);
  const courseTitle = getUniqueCourseDisplayTitle({
    ...unit.course,
    programme: unit.programme,
  });
  const modNum = unit.module.module_number;
  const progTag = getProgrammeShortTag(unit.programme.slug);
  const yearRange = getUnitYearRange(unit);
  const codeStr = unit.unit_code ? ` (${unit.unit_code})` : '';

  if (unit.programme.slug === 'knec-courses') {
    return `${unitTitle}${codeStr} - ${courseTitle} (Module ${modNum}) KNEC Past Papers${
      yearRange ? ` ${yearRange}` : ''
    } | EasyTVET`;
  }
  return `${unitTitle}${codeStr} - ${courseTitle} (Module ${modNum}, ${progTag}) Past Papers & Tools | EasyTVET`;
}

export function getUnitMetaDescription(unit: EnrichedUnit): string {
  if (unit.seo_description && unit.seo_description.trim()) {
    return truncateDescription(unit.seo_description.trim(), 160);
  }
  const unitTitle = toTitleCase(unit.name);
  const courseTitle = getUniqueCourseDisplayTitle({
    ...unit.course,
    programme: unit.programme,
  });
  const modNum = unit.module.module_number;
  const progTag = getProgrammeShortTag(unit.programme.slug);
  const yearRange = getUnitYearRange(unit);
  const count = unit.resources.length;

  if (unit.programme.slug === 'knec-courses') {
    const raw =
      count > 0
        ? `${unitTitle} (${courseTitle}, Module ${modNum} - KNEC): Download ${count} free PDF past ${
            count === 1 ? 'paper' : 'papers'
          }${yearRange ? ` (${yearRange})` : ''} and revision guide in Kenya.`
        : `${unitTitle} (${courseTitle}, Module ${modNum} - KNEC): Syllabus scope, exam structure, revision checklist, and free KNEC past papers PDF in Kenya.`;
    return truncateDescription(raw, 160);
  }

  const raw =
    count > 0
      ? `${unitTitle} (${courseTitle}, Module ${modNum} - ${progTag}): Download ${count} free past papers, candidate tools, assessor guides & cutting lists${
          yearRange ? ` (${yearRange})` : ''
        }.`
      : `${unitTitle} (${courseTitle}, Module ${modNum} - ${progTag}): Official competency outcomes, practical exam guide, past papers, candidate tool & cutting list.`;
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
  const deptProfile = getDepartmentDomainProfile(course.department.name);

  return `${courseTitle} is an accredited Kenyan TVET ${levelText} qualification offered under the ${deptTitle} (${progTitle}). Structured across ${modCount} progressive ${modCount === 1 ? 'module' : 'modules'} and ${unitCount} competency ${unitCount === 1 ? 'unit' : 'units'}, this programme equips trainees with hands-on industry skills for employment in ${deptProfile.industrySettings}, supported by downloadable past papers, assessor guides, candidate tools, and practical cutting lists.`;
}

export interface CourseDetailedGuide {
  curriculumOverview: string;
  entryAndProgression: string;
  assessmentMethodology: string;
  careerAndIndustry: string;
  careerRoles: string[];
  moduleSummaries: { moduleNumber: number; title: string; summary: string }[];
}

export function getCourseDetailedGuide(course: EnrichedCourse): CourseDetailedGuide {
  const courseTitle = toTitleCase(course.name);
  const deptTitle = toTitleCase(course.department.name);
  const deptProfile = getDepartmentDomainProfile(course.department.name);
  const levelProfile = getLevelAcademicProfile(course.level);
  const sampleUnits = course.units
    .slice(0, 5)
    .map((u) => toTitleCase(u.name))
    .join(', ');

  const isModularCdacc = course.programme.slug.includes('modular');
  const isKnec = course.programme.slug.includes('knec');

  const curriculumOverview = `${courseTitle} is designed under the Kenya National Qualifications Framework (${levelProfile.knqfBand}) to bridge the gap between classroom theory and modern workplace demands. ${deptProfile.overviewParagraph} Across its ${course.modules.length} ${
    course.modules.length === 1 ? 'module' : 'modules'
  } and ${course.units.length} competency ${
    course.units.length === 1 ? 'unit' : 'units'
  }${sampleUnits ? ` - including core subjects such as ${sampleUnits}-` : '-'}trainees engage in intensive practical work focused on ${
    deptProfile.practicalFocus.charAt(0).toLowerCase() + deptProfile.practicalFocus.slice(1)
  }`;

  const entryAndProgression = `To enroll in ${courseTitle}, applicants must meet the standard admission criteria: ${levelProfile.minimumEntry} The full programme typically takes ${levelProfile.typicalDuration} In addition to institutional workshop and classroom sessions, trainees must complete a ${
    levelProfile.industrialAttachment.charAt(0).toLowerCase() + levelProfile.industrialAttachment.slice(1)
  } ${levelProfile.progressionPath}`;

  const assessmentMethodology = isModularCdacc
    ? `Under the TVET-CDACC Cycle 3 Modularized CBET curriculum, ${courseTitle} is assessed module-by-module rather than waiting for a single end-of-course examination. Upon completing each module, candidates sit for summative written theory papers and practical performance assessments governed by official Cutting Lists, Candidate Tools, and Assessor Guides. Trainees also maintain a verifiable Portfolio of Evidence (PoE) containing workplace assignments, logbooks, and internal verification records. Partial certificates of competency are awarded per completed module, culminating in the full ${levelProfile.qualificationTitle} upon mastering all ${course.modules.length} modules.`
    : isKnec
    ? `Under the Kenya National Examinations Council (KNEC) technical syllabus, ${courseTitle} is evaluated through national modular or stage examinations conducted during the March/April, July/August, and November/December series. Candidates are tested through written theory papers, trade projects, practical workshop assessments, and compulsory business plan or trade project defenses, alongside a mandatory NITA-logged industrial attachment.`
    : `Under the TVET-CDACC Competency-Based Education and Training (CBET) framework, ${courseTitle} groups units of learning into Basic, Common, and Core competencies. Assessment is continuous and summative, combining practical workplace demonstrations (using official Candidate Tools and Cutting Lists), written underpinning knowledge tests, and a comprehensive Portfolio of Evidence (PoE) verified by registered internal and external TVET assessors.`;

  const careerAndIndustry = `Graduates holding the ${courseTitle} qualification are prepared for immediate deployment across ${deptProfile.industrySettings}. Curriculum standards and licensing alignment are benchmarked against ${deptProfile.regulatoryBodies} Trainees are advised to equip themselves with ${deptProfile.recommendedTools} throughout their training and assessment preparation.`;

  const moduleSummaries = course.modules.map((mod) => {
    const unitNames = mod.units
      .slice(0, 4)
      .map((u) => toTitleCase(u.name))
      .join(', ');
    const moreCount = Math.max(0, mod.units.length - 4);
    const unitListStr = unitNames
      ? `covering ${unitNames}${moreCount > 0 ? ` and ${moreCount} additional ${moreCount === 1 ? 'unit' : 'units'}` : ''}`
      : 'covering foundational and specialized trade competencies';

    let stageFocus = 'foundational workplace safety, core technical principles, and introductory practical skills';
    if (mod.module_number === 2) {
      stageFocus = 'intermediate technical operations, applied trade systems, and specialized problem-solving';
    } else if (mod.module_number >= 3) {
      stageFocus = 'advanced supervisory competencies, complex diagnostics, quality assurance, and enterprise management';
    }

    return {
      moduleNumber: mod.module_number,
      title: mod.title || `Module ${mod.module_number}`,
      summary: `Module ${mod.module_number} of ${courseTitle} comprises ${mod.units.length} competency ${
        mod.units.length === 1 ? 'unit' : 'units'
      } ${unitListStr}. This module emphasizes ${stageFocus} within the ${deptTitle}.`,
    };
  });

  return {
    curriculumOverview,
    entryAndProgression,
    assessmentMethodology,
    careerAndIndustry,
    careerRoles: deptProfile.careerPathways,
    moduleSummaries,
  };
}

export function getCourseFAQs(course: EnrichedCourse): FAQItem[] {
  if (course.faq && course.faq.length > 0) {
    return course.faq;
  }
  const courseTitle = toTitleCase(course.name);
  const deptTitle = toTitleCase(course.department.name);
  const levelProfile = getLevelAcademicProfile(course.level);
  const deptProfile = getDepartmentDomainProfile(course.department.name);

  return [
    {
      question: `What are the minimum entry requirements for ${courseTitle} in Kenya?`,
      answer: `To enroll in ${courseTitle} (${levelProfile.qualificationTitle}), candidates require ${levelProfile.minimumEntry} Admission is open through KUCCPS placement or direct application to TVETA-accredited National Polytechnics and Technical Training Institutes.`,
    },
    {
      question: `How many modules and units are in ${courseTitle}?`,
      answer: `${courseTitle} has ${course.modules.length} ${course.modules.length === 1 ? 'module' : 'modules'} and ${course.units.length} indexed competency ${course.units.length === 1 ? 'unit' : 'units'} across its accredited curriculum structure.`,
    },
    {
      question: `Where can I download ${courseTitle} past papers and assessment tools?`,
      answer: `Select any unit listed under the modules on this page to download free PDF past papers, candidate tools, assessor guides, and practical cutting lists for ${courseTitle}.`,
    },
    {
      question: `What career opportunities are available after completing ${courseTitle}?`,
      answer: `Graduates of ${courseTitle} in the ${deptTitle} can work as ${deptProfile.careerPathways.slice(0, 4).join(', ')}, or pursue self-employment and further academic progression.`,
    },
    {
      question: `How long does ${courseTitle} take to complete?`,
      answer: `${courseTitle} typically takes ${levelProfile.typicalDuration} This includes classroom instruction, practical workshop mastery, and ${levelProfile.industrialAttachment.toLowerCase()}`,
    },
  ];
}

export function getCourseMetaTitle(course: EnrichedCourse): string {
  if (course.seo_title && course.seo_title.trim()) {
    return course.seo_title.trim();
  }
  const courseTitle = getUniqueCourseDisplayTitle(course);
  const progTag = getProgrammeShortTag(course.programme.slug);
  return `${courseTitle} (${progTag}) - ${course.modules.length} ${
    course.modules.length === 1 ? 'Module' : 'Modules'
  }, ${course.units.length} Units & Past Papers | EasyTVET`;
}

export function getCourseMetaDescription(course: EnrichedCourse): string {
  if (course.seo_description && course.seo_description.trim()) {
    return truncateDescription(course.seo_description.trim(), 160);
  }
  const courseTitle = getUniqueCourseDisplayTitle(course);
  const deptTitle = toTitleCase(course.department.name);
  const progTag = getProgrammeShortTag(course.programme.slug);
  const raw = `${courseTitle} (${progTag}, ${deptTitle}): Explore all ${course.modules.length} ${
    course.modules.length === 1 ? 'module' : 'modules'
  }, ${course.units.length} units, entry requirements, career paths & free past papers.`;
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
  const deptProfile = getDepartmentDomainProfile(dept.name);
  const levels = Array.from(new Set(courses.map((c) => c.level).filter(Boolean))).sort((a, b) => (b || 0) - (a || 0));
  const levelStr = levels.length > 0 ? `across KNQF Levels ${levels.join(', ')}` : 'across all TVET levels';

  return `The ${deptTitle} under ${prog.name} offers ${courses.length} accredited technical and vocational courses ${levelStr} in Kenya. ${deptProfile.overviewParagraph} Browse courses by qualification level below to access modular competency units, downloadable past papers, practical cutting lists, candidate tools, and assessor guides.`;
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
  const deptProfile = getDepartmentDomainProfile(dept.name);
  const levels = Array.from(new Set(courses.map((c) => c.level).filter(Boolean))).sort((a, b) => (b || 0) - (a || 0));

  return [
    {
      question: `Which courses are offered in the ${deptTitle}?`,
      answer: `The ${deptTitle} under ${prog.name} includes ${courses.length} accredited courses spanning Levels ${levels.join(', ') || '3 to 6'}, covering National Skills Certificate (Level 3), Artisan (Level 4), Craft Certificate (Level 5), and National Diploma (Level 6) TVET qualifications.`,
    },
    {
      question: `What careers do courses in the ${deptTitle} lead to?`,
      answer: `Graduates from the ${deptTitle} qualify for roles such as ${deptProfile.careerPathways.join(', ')} across ${deptProfile.industrySettings}.`,
    },
    {
      question: `Which regulatory bodies accredit ${deptTitle} qualifications in Kenya?`,
      answer: `Curricula and professional pathways in the ${deptTitle} align with ${deptProfile.regulatoryBodies}`,
    },
    {
      question: `How do I find past papers for ${deptTitle} courses?`,
      answer: `Choose your course level (such as Level 6, Level 5, Level 4, or Level 3) on this page, open your specific course, and select any competency unit to download free PDF past papers and assessment tools.`,
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
  return `${prog.name} is a comprehensive Kenyan TVET curriculum framework featuring ${depts.length} specialized academic ${depts.length === 1 ? 'department' : 'departments'} and ${courses.length} indexed courses across KNQF Levels 3, 4, 5, and 6. Select a department or qualification level below to browse modules, competency units, entry requirements, career guides, and free downloadable assessment documents.`;
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
      answer: `Courses under ${prog.name} are organized by Kenya National Qualifications Framework (KNQF) levels, including Level 6 (National Diploma), Level 5 (Craft Certificate), Level 4 (Artisan Certificate), and Level 3 (National Vocational Certificate).`,
    },
    {
      question: `How are trainees assessed in ${prog.name}?`,
      answer: `Trainees undergo both continuous institutional assessment (forming a Portfolio of Evidence) and summative national assessments comprising Written Theory Papers and Practical Performance Tasks guided by official Cutting Lists and Candidate Tools.`,
    },
  ];
}

export interface CourseContextualArticles {
  curriculumArticles: EnrichedArticle[];
  entryArticles: EnrichedArticle[];
  assessmentArticles: EnrichedArticle[];
  careerArticles: EnrichedArticle[];
  freshEditorialFeed: EnrichedArticle[];
}

const DEPT_KEYWORDS: Record<string, string[]> = {
  business: ['accountancy', 'business', 'kasneb', 'taxation', 'cpa', 'procurement', 'financial'],
  computing: ['ict', 'software', 'networking', 'computing', 'computer', 'digital'],
  electrical: ['electrical', 'solar', 'epra', 'electronics', 'wiring'],
  building: ['building', 'civil', 'plumbing', 'nca', 'construction', 'masonry', 'surveying'],
  mechanical: ['mechanical', 'automotive', 'welding', 'machining', 'plant'],
  health: ['health', 'nutrition', 'dietetics', 'kndi', 'caregiving', 'clinical'],
  agriculture: ['agriculture', 'agribusiness', 'dairy', 'aquaculture', 'horticulture', 'livestock'],
  catering: ['catering', 'hospitality', 'culinary', 'baking', 'food', 'accommodation'],
  fashion: ['fashion', 'cosmetology', 'hairdressing', 'beauty', 'garment', 'textile'],
  applied_science: ['applied-science', 'laboratory', 'chemistry', 'biology', 'science'],
  social_work: ['social-work', 'community', 'counselling', 'child-protection'],
};

function scoreArticleByKeywords(
  article: EnrichedArticle,
  keywords: string[],
  preferredCategories: string[] = []
): number {
  const hay = `${article.slug} ${article.title} ${article.excerpt}`.toLowerCase();
  let score = 0;
  for (const kw of keywords) {
    if (hay.includes(kw.toLowerCase())) {
      score += 3;
    }
  }
  if (preferredCategories.includes(article.category)) {
    score += 2;
  }
  return score;
}

function pickTopArticles(
  articles: EnrichedArticle[],
  keywords: string[],
  preferredCategories: string[],
  limit = 2
): EnrichedArticle[] {
  return [...articles]
    .map((article) => ({
      article,
      score: scoreArticleByKeywords(article, keywords, preferredCategories),
      time: new Date(article.updated_at || article.published_at || 0).getTime(),
    }))
    .filter((item) => item.score > 0)
    .sort((a, b) => b.score - a.score || b.time - a.time)
    .slice(0, limit)
    .map((item) => item.article);
}

/**
 * Dynamically matches live/latest published blog articles to each section of a Course or Department page
 * so links automatically reflect newly added or updated blog posts without hardcoding.
 */
export function getContextualArticlesForCourse(
  course: EnrichedCourse,
  articles: EnrichedArticle[]
): CourseContextualArticles {
  const deptProfile = getDepartmentDomainProfile(course.department.name);
  const deptKws = DEPT_KEYWORDS[deptProfile.key] || [];
  const isKnec = course.programme.slug.includes('knec');
  const isModular = course.programme.slug.includes('modular');

  // 1. Curriculum Structure & Training Scope articles
  const curriculumKws = [
    ...(isModular ? ['cycle-3', 'modular'] : []),
    ...(isKnec ? ['knec', 'difference-between-knec'] : ['cdacc', 'cbet']),
    'curriculum',
    'common-basic-units',
    'industrial-attachment',
  ];
  const curriculumArticles = pickTopArticles(
    articles,
    curriculumKws,
    ['curriculum_update'],
    2
  );

  // 2. Entry Requirements & KNQF Progression articles
  const entryKws = [
    'knqf',
    'levels-3-to-6',
    'kcse-grade',
    'kuccps',
    'helb',
    'rpl',
    ...(course.level === 6 ? ['bachelor-of-technology', 'level-6'] : []),
  ];
  const entryArticles = pickTopArticles(
    articles,
    entryKws,
    ['curriculum_update', 'exam_news'],
    2
  );

  // 3. Assessment & Certification Methodology articles
  const assessmentKws = [
    'cutting-list',
    'portfolio-of-evidence',
    'how-to-prepare-for-tvet',
    'practical-workshop',
    'written-theory',
    'business-plan',
    ...deptKws.slice(0, 2),
  ];
  const assessmentArticles = pickTopArticles(
    articles,
    assessmentKws,
    ['revision_guide'],
    2
  );

  // 4. Career Opportunities & Industry Pathways articles (matches the exact department!)
  const careerKws = [
    ...deptKws,
    'marketable',
    'career',
    'licensing',
    'exemptions',
    'registration',
  ];
  const careerArticles = pickTopArticles(
    articles,
    careerKws,
    ['course_spotlight'],
    3
  );

  // 5. Fresh Editorial Feed (prioritizes department-matching + most recently updated posts)
  const freshEditorialFeed = [...articles]
    .map((article) => ({
      article,
      deptScore: scoreArticleByKeywords(article, deptKws, ['course_spotlight', 'revision_guide']),
      time: new Date(article.updated_at || article.published_at || 0).getTime(),
    }))
    .sort((a, b) => b.deptScore - a.deptScore || b.time - a.time)
    .slice(0, 3)
    .map((item) => item.article);

  return {
    curriculumArticles,
    entryArticles,
    assessmentArticles,
    careerArticles,
    freshEditorialFeed,
  };
}

