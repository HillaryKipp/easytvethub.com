import type { SeedModule, SeedResource } from './seed';

export const PROGRAMMES_SEED = [
  {
    name: 'Modular CDACC Courses (Cycle 3)',
    slug: 'modular-cdacc-courses-cycle-3',
    sort_order: 1,
    description:
      'TVET CDACC Cycle 3 modularized competency-based education and training (CBET) courses across Levels 3, 4, 5, and 6 in Kenya.',
  },
  {
    name: 'CDACC Courses (Cycle 1 & 2)',
    slug: 'cdacc-courses-cycle-1-and-2',
    sort_order: 2,
    description:
      'TVET CDACC Cycle 1 and Cycle 2 competency-based courses, occupational standards, past papers, and assessment tools.',
  },
  {
    name: 'KNEC Courses',
    slug: 'knec-courses',
    sort_order: 3,
    description:
      'Kenya National Examinations Council (KNEC) Craft, Artisan, and Diploma TVET courses, modules, and past examination papers.',
  },
];

export const AGRICULTURE_COURSES_RAW = [
  'AGRI-PRENEURSHIP LEVEL 6',
  'AGRICULTURE AND EXTENSION LEVEL 6',
  'ANIMAL PRODUCTION TECHNOLOGY LEVEL 6',
  'DAIRY PLANT MANAGEMENT LEVEL 6',
  'HORTICULTURAL TECHNOLOGIST LEVEL 6',
  'AGRICULTURE AND EXTENSION LEVEL 5',
  'AGRIPRENEURSHIP LEVEL 5',
  'ANIMAL PRODUCTION LEVEL 5',
  'AQUACULTURE LEVEL 5',
  'DAIRY PLANT TECHNICIAN LEVEL 5',
  'HORTICULTURE LEVEL 5',
  'AGRICULTURAL FARM ATTENDANT LEVEL 4',
  'AGRIPRENEURSHIP LEVEL 4',
  'ANIMAL PRODUCTION TECHNOLOGY LEVEL 4',
  'APIARY ATTENDANCE LEVEL 4',
  'AQUACULTURE LEVEL 4',
  'BEE PRODUCTS PROCESSING LEVEL 4',
  'DAIRY FARM OPERATOR LEVEL 4',
  'DAIRY PLANT TECHNOLOGY LEVEL 4',
  'FARM MACHINERY AND EQUIPMENT OPERATOR LEVEL 4',
  'GENERAL AGRICULTURE LEVEL 4',
  'HORTICULTURE FARM ATTENDANT LEVEL 4',
  'LIVESTOCK FEED PRODUCER LEVEL 4',
  'PIG PRODUCTION OPERATOR LEVEL 4',
  'POULTRY (KIENYEJI CHICKEN) PRODUCTION LEVEL 4',
  'POULTRY (LAYER PRODUCTION) OPERATOR LEVEL 4',
  'POULTRY BROILER PRODUCTION LEVEL 4',
  'POULTRY HATCHERY OPERATOR LEVEL 4',
  'AGRIPRENEURSHIP LEVEL 3',
  'AQUACULTURE LEVEL 3',
  'BEE HIVES AND BEE EQUIPMENT CONSTRUCTION LEVEL 3',
  'DAIRY FARM ATTENDANCE LEVEL 3',
  'HORTICULTURE LEVEL 3',
  'PASSION FRUIT PRODUCER AND PROCESSOR LEVEL 3',
  'PIG PRODUCTION OPERATOR LEVEL 3',
  'POULTRY (BROILER) PRODUCTION OPERATOR LEVEL 3',
  'POULTRY (KIENYEJI CHICKEN) PRODUCTION OPERATOR LEVEL 3',
  'POULTRY (LAYER) PRODUCTION OPERATOR LEVEL 3',
  'POULTRY LAYER PRODUCTION OPERATOR LEVEL 3',
];

export const AGRIPRENEURSHIP_L6_MODULES: SeedModule[] = [
  {
    module_number: 1,
    title: 'Module 1',
    units: [
      'ESTABLISH AGRI-ENTERPRISE',
      'KEEP AGRI-ENTERPRISE RECORDS',
      'MAINTAIN PRODUCT AND SERVICE QUALITY',
      'MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES',
      'OPERATE AGRI-ENTERPRISE',
    ],
  },
  {
    module_number: 2,
    title: 'Module 2',
    units: [
      'DEVELOP AGRI-ENTERPRISE BUSINESS PLAN',
      'MARKET AGRI-ENTERPRISE PRODUCTS AND SERVICES',
      'MARKET AGRICULTURAL PRODUCTS AND SERVICES ONLINE',
      'OPERATE A SMALL AGRI-ENTERPRISE',
      'SUPERVISE AGRIPRENEURAL OPERATIONS',
    ],
  },
  {
    module_number: 3,
    title: 'Module 3',
    units: [
      'APPLY COMMUNICATION SKILLS',
      'APPLY DIGITAL LITERACY',
      'START AGRI-ENTERPRISE',
    ],
  },
  {
    module_number: 4,
    title: 'Module 4',
    units: [
      'APPLY ICT IN AGRI-ENTERPRISE',
      'APPLY WORK ETHICS AND PRACTICES',
    ],
  },
  {
    module_number: 5,
    title: 'Module 5',
    units: [
      'CARRY OUT CROP PRODUCTION',
      'DEVELOP AGRI-ENTERPRISE RECORDS',
      'PERFORM AGRI-ENTERPRISE FARM BUDGETING',
    ],
  },
  {
    module_number: 6,
    title: 'Module 6',
    units: [
      'APPLY GEOGRAPHIC INFORMATION SYSTEMS',
      'CARRY OUT ANIMAL PRODUCTION',
    ],
  },
  {
    module_number: 7,
    title: 'Module 7',
    units: [
      'APPLY SOIL SCIENCE PRINCIPLES',
      'OPERATE FARM IRRIGATION AND DRAINAGE SYSTEMS',
    ],
  },
  {
    module_number: 8,
    title: 'Module 8',
    units: [
      'OPERATE FARM MACHINERY',
      'PREPARE AGRI-ENTERPRISE WORK PLAN',
    ],
  },
  {
    module_number: 9,
    title: 'Module 9',
    units: [
      'CARRY OUT AGRICULTURE MARKET RESEARCH',
      'DEVELOP AGRI-ENTERPRISE BUSINESS PLAN',
    ],
  },
];

export const ESTABLISH_AGRI_ENTERPRISE_RESOURCES: SeedResource[] = [
  {
    type: 'cutting_list',
    title: 'Download Cutting List',
    file_url: 'https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_cl.pdf',
    year: 2025,
  },
  {
    type: 'candidate_tool',
    title: 'Download Candidate Tool',
    file_url: 'https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_ct.pdf',
    year: 2025,
  },
  {
    type: 'assessor_guide',
    title: 'Download Assessor Guide',
    file_url: 'https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_ag.pdf',
    year: 2025,
  },
];
