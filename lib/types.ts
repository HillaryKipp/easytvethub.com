export type ResourceType =
  | 'cutting_list'
  | 'candidate_tool'
  | 'assessor_guide'
  | 'past_paper'
  | 'marking_scheme'
  | 'other';

export interface FAQItem {
  question: string;
  answer: string;
}

export interface Programme {
  id: string;
  name: string;
  slug: string;
  description: string | null;
  intro: string | null;
  faq: FAQItem[];
  og_image_url: string | null;
  seo_title: string | null;
  seo_description: string | null;
  sort_order: number;
  created_at: string;
  updated_at: string;
}

export interface Department {
  id: string;
  programme_id: string;
  name: string;
  slug: string;
  description: string | null;
  intro: string | null;
  faq: FAQItem[];
  og_image_url: string | null;
  seo_title: string | null;
  seo_description: string | null;
  sort_order: number;
  created_at: string;
  updated_at: string;
}

export interface Course {
  id: string;
  department_id: string;
  name: string;
  slug: string;
  level: number | null;
  description: string | null;
  intro: string | null;
  faq: FAQItem[];
  og_image_url: string | null;
  seo_title: string | null;
  seo_description: string | null;
  published: boolean;
  created_at: string;
  updated_at: string;
}

export interface Module {
  id: string;
  course_id: string;
  module_number: number;
  title: string | null;
}

export interface Unit {
  id: string;
  module_id: string;
  course_id: string;
  name: string;
  slug: string;
  unit_code: string | null;
  description: string | null;
  intro: string | null;
  faq: FAQItem[];
  og_image_url: string | null;
  seo_title: string | null;
  seo_description: string | null;
  canonical_unit_id: string | null;
  published: boolean;
  created_at: string;
  updated_at: string;
}

export interface Resource {
  id: string;
  unit_id: string;
  type: ResourceType;
  title: string | null;
  file_url: string;
  year: number | null;
  sort_order: number;
  created_at: string;
}

export interface EnrichedCourse extends Course {
  department: Department;
  programme: Programme;
  modules: EnrichedModule[];
  units: EnrichedUnit[];
  path: string;
}

export interface EnrichedModule extends Module {
  units: EnrichedUnit[];
}

export interface EnrichedUnit extends Unit {
  module: Module;
  course: Course;
  department: Department;
  programme: Programme;
  resources: Resource[];
  path: string;
  canonicalPath: string | null;
  duplicatePaths: { unit: EnrichedUnit; moduleNumber: number }[];
}

export interface DirectoryData {
  programmes: Programme[];
  departments: Department[];
  courses: EnrichedCourse[];
  modules: Module[];
  units: EnrichedUnit[];
  resources: Resource[];
  levels: number[];
}

export type ArticleCategory =
  | 'exam_news'
  | 'revision_guide'
  | 'course_spotlight'
  | 'curriculum_update';

export interface AuthorSocialLinks {
  twitter?: string;
  linkedin?: string;
  website?: string;
  facebook?: string;
}

export interface Author {
  id: string;
  user_id?: string | null;
  name: string;
  slug: string;
  role_title: string;
  bio: string;
  avatar_url?: string | null;
  social_links: AuthorSocialLinks;
  is_verified: boolean;
  created_at: string;
  updated_at: string;
}

export interface Article {
  id: string;
  author_id: string;
  title: string;
  slug: string;
  excerpt: string;
  content: string;
  category: ArticleCategory;
  source_name?: string | null;
  source_url?: string | null;
  is_official_source: boolean;
  featured_image_url?: string | null;
  featured_image_alt?: string | null;
  is_cover_mockup: boolean;
  published: boolean;
  noindex: boolean;
  published_at?: string | null;
  created_at?: string;
  updated_at: string;
}

export interface EnrichedArticle extends Article {
  author: Author;
  path: string;
  reading_time_minutes: number;
}

export interface SearchDocument {
  id: string;
  type: 'course' | 'unit' | 'article';
  name: string;
  code?: string | null;
  level: number | null;
  path: string;
  breadcrumb: string;
  resourceCount?: number;
}
