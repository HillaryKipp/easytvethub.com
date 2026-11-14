import { getSupabaseClient } from './supabase';
import { Article, Author, EnrichedArticle } from './types';

export const DEFAULT_AUTHORS: Author[] = [
  {
    id: 'author-hillary-kipkorir-001',
    name: 'Hillary Kipkorir',
    slug: 'hillary-kipkorir',
    role_title: 'TVET Curriculum Specialist & Technical Assessor',
    bio: 'Experienced educator and curriculum specialist with a decade of expertise in Kenyan technical vocational training, TVET CDACC Competency-Based Education and Training (CBET) standards, and national technical assessment methodologies.',
    avatar_url: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=300&q=80',
    social_links: {
      linkedin: 'https://www.linkedin.com/in/hillary-kipkorir',
      twitter: 'https://twitter.com/easytvethub',
    },
    is_verified: true,
    created_at: '2026-01-15T08:00:00Z',
    updated_at: '2026-11-01T10:00:00Z',
  },
  {
    id: 'author-editorial-team-002',
    name: 'EasyTVET Editorial Board',
    slug: 'editorial-board',
    role_title: 'TVET Quality Assurance & Verification Desk',
    bio: 'The independent verification team at EasyTVET Hub Kenya, dedicated to screening official KNEC and TVET-CDACC assessment circulars, cross-referencing national qualification frameworks, and maintaining past paper accuracy.',
    avatar_url: 'https://images.unsplash.com/photo-1557804506-669a67965ba0?auto=format&fit=crop&w=300&q=80',
    social_links: {
      website: 'https://easytvethub.com/about/',
    },
    is_verified: true,
    created_at: '2026-01-15T08:00:00Z',
    updated_at: '2026-11-01T10:00:00Z',
  },
];

export const DEFAULT_ARTICLES: Article[] = [
  {
    id: 'article-cdacc-assessment-guide-001',
    author_id: 'author-hillary-kipkorir-001',
    title: 'How to Prepare for TVET CDACC Practical and Written Assessments: 2026 Guide',
    slug: 'how-to-prepare-for-tvet-cdacc-assessments',
    excerpt:
      'A comprehensive guide for TVET trainees on tackling CDACC modular assessments, reading candidate tools, interpreting cutting lists, and meeting performance criteria.',
    category: 'revision_guide',
    source_name: 'TVET-CDACC Competency Assessment Manual',
    source_url: 'https://cdacc.go.ke',
    is_official_source: true,
    featured_image_url: 'https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=1200&q=80',
    featured_image_alt: 'Technical student working on practical electrical workshop assessment',
    is_cover_mockup: false,
    published: true,
    noindex: false,
    published_at: '2026-10-15T09:00:00Z',
    updated_at: '2026-11-02T12:00:00Z',
    content: `## Understanding the CBET Assessment Philosophy

Under Kenya's Competency-Based Education and Training (CBET) framework implemented through **TVET-CDACC**, assessment is fundamentally different from traditional knowledge-only exams. You are evaluated on **demonstrated competency**—what you can perform in a realistic workplace setting.

### 1. Key Assessment Components Explained

When entering an assessment series, trainees encounter four core types of documentation:

1. **Candidate Tool:** The student instruction booklet that details the practical tasks to execute, dimensions, tolerances, and allocated time.
2. **Cutting List:** Issued prior to the practical assessment to workshop technicians and candidates specifying materials, sizes, and quantities required.
3. **Assessor Guide:** The rubric and marking standard utilized by certified external and internal assessors to judge competence.
4. **Written Assessment (Theory):** Tests the underpinning technical knowledge required to carry out the practical tasks safely and effectively.

### 2. How to Approach the Cutting List Before Exam Day

The cutting list is usually provided days or weeks in advance of the practical sitting. Always verify each material specification:

- Confirm all raw stock matches the specified grade and dimensions.
- Test that all hand tools, measuring instruments, and power equipment are properly calibrated.
- Rehearse preliminary layout procedures to minimize waste during the actual test.

### 3. Mastering the Practical Performance Criteria

Assessors evaluate three distinct domains:
- **Process Skills:** Adherence to occupational health and safety (OHS) regulations, proper personal protective equipment (PPE), and systematic workflow.
- **Product Quality:** Dimensional accuracy, neatness, structural integrity, and adherence to tolerance limits specified in the candidate tool.
- **Underpinning Attitude:** Resource conservation, workshop cleanliness, and professional communication.

### 4. Preparation Checklist

- [ ] Review past candidate tools and assessor guides for your specific competency unit.
- [ ] Practice setting up your work area within the first 15 minutes of assessment time.
- [ ] Clarify any ambiguous instructions with your lead trainer before the assessment window opens.
- [ ] Ensure all safety gear is ready and meets institutional standards.`,
  },
  {
    id: 'article-cbet-levels-explained-002',
    author_id: 'author-hillary-kipkorir-001',
    title: 'Understanding Kenya National Qualifications Framework: Level 3 to Level 6 Explained',
    slug: 'knqf-tvet-levels-3-to-6-explained',
    excerpt:
      'Understand the progression, minimum entry criteria, certification types, and occupational equivalence across TVET Levels 3, 4, 5, and 6 under KNQF.',
    category: 'curriculum_update',
    source_name: 'Kenya National Qualifications Authority (KNQA) Framework',
    source_url: 'https://knqa.go.ke',
    is_official_source: true,
    featured_image_url: 'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&w=1200&q=80',
    featured_image_alt: 'Kenyan graduates celebrating their national TVET technical diploma awards',
    is_cover_mockup: false,
    published: true,
    noindex: false,
    published_at: '2026-09-20T08:00:00Z',
    updated_at: '2026-10-30T14:00:00Z',
    content: `## Demystifying the KNQF TVET Levels in Kenya

With the reforms under the **Kenya National Qualifications Framework (KNQF)**, technical vocational pathways offer seamless progression from basic artisanal skills up to higher national diplomas and technology degrees.

### TVET Level Breakdown

| Level | Qualification Award | Equivalent Standard | General Entry Requirement |
| :--- | :--- | :--- | :--- |
| **Level 3** | National Certificate I | Artisan / Foundation Skill | KCPE Certificate or Equivalent |
| **Level 4** | National Certificate II | Craft Certificate | KCSE D- or Level 3 Certification |
| **Level 5** | National Diploma (Level 5) | Craft / Technician | KCSE D (Plain) or Level 4 Certification |
| **Level 6** | National Diploma (Level 6) | Higher Diploma / Technologist | KCSE C- (Minus) or Level 5 Certification |

### Horizontal & Vertical Mobility

One of the greatest advantages of the CBET curriculum is **credit accumulation and transfer**:
- If you master units in Level 4, relevant competencies can be credited when you advance to Level 5.
- Common competencies such as *Communication Skills*, *Entrepreneurship Education*, and *Digital Literacy* carry across departments, reducing redundancy.

### Choosing Your Progression Strategy

Evaluate your career goals carefully:
- If your aim is rapid entry into technical employment, completing a Level 5 certificate gives immediate workplace competence.
- Trainees seeking supervisory and project management roles should target Level 6 diploma qualifications, which bridge toward university engineering and technology degrees.`,
  },
  {
    id: 'article-knec-cdacc-timetable-verification-003',
    author_id: 'author-editorial-team-002',
    title: 'How to Verify Official Examination Dates and Avoid Circulated Hoaxes',
    slug: 'how-to-verify-official-tvet-examination-dates',
    excerpt:
      'Guidance on distinguishing genuine KNEC and TVET-CDACC circulars from provisional social media timetables, with official verification steps.',
    category: 'exam_news',
    source_name: 'KNEC & TVET-CDACC Verification Directives',
    source_url: 'https://knec.ac.ke',
    is_official_source: true,
    featured_image_url: 'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?auto=format&fit=crop&w=1200&q=80',
    featured_image_alt: 'Student reviewing an examination schedule on a laptop and notebook',
    is_cover_mockup: false,
    published: true,
    noindex: false,
    published_at: '2026-10-01T10:00:00Z',
    updated_at: '2026-11-05T09:00:00Z',
    content: `## Guarding Against Unverified Examination Schedules

During the weeks leading up to the **March/April**, **July/August**, and **November/December** TVET assessment cycles, unverified draft timetables frequently circulate on WhatsApp groups and social media channels. Relying on unauthorized schedules can lead to missed assessment dates and logistical complications.

### How to Confirm Authentic Examination Circulars

1. **Check for Official Circular References:** Genuine examination schedules from the Kenya National Examinations Council (KNEC) or TVET-CDACC bear official reference numbers, the official coat of arms, and the signature of the Chief Executive Officer or Council Secretary.
2. **Verify via Institutional Examination Officers:** Every TVET institute has an accredited Examination Officer who receives direct portal dispatches. Never book travel or accommodations without confirmation from your institutional coordinator.
3. **Inspect the Series Code:** Ensure the paper code matches the curriculum edition you are studying (e.g., modular CBET codes vs traditional craft syllabus codes).

### EasyTVET Verification Standard

At **EasyTVET Hub**, any calendar entry labeled with a green \`[Confirmed]\` badge has been independently verified against an active circular. Dates marked as \`[Provisional]\` represent historical schedule projections and should be treated as guidance until official confirmation.`,
  },
];

function calculateReadingTime(text: string): number {
  const wordsPerMinute = 200;
  const wordCount = text.trim().split(/\s+/).length;
  return Math.max(1, Math.ceil(wordCount / wordsPerMinute));
}

export async function getAuthors(): Promise<Author[]> {
  const supabase = getSupabaseClient();
  try {
    const { data, error } = await supabase
      .from('authors')
      .select('*')
      .order('created_at', { ascending: true });

    if (!error && data && data.length > 0) {
      return data as Author[];
    }
  } catch {
    // Fall back to default authors if table doesn't exist yet
  }
  return DEFAULT_AUTHORS;
}

export async function getAuthorBySlug(slug: string): Promise<Author | null> {
  const authors = await getAuthors();
  return authors.find((a) => a.slug === slug) || null;
}

export async function getAuthorById(id: string): Promise<Author | null> {
  const authors = await getAuthors();
  return authors.find((a) => a.id === id) || null;
}

export async function getAllArticles(): Promise<Article[]> {
  const supabase = getSupabaseClient();
  try {
    const { data, error } = await supabase
      .from('articles')
      .select('*')
      .order('published_at', { ascending: false });

    if (!error && data && data.length > 0) {
      return data as Article[];
    }
  } catch {
    // Fall back to default articles if table doesn't exist yet
  }
  return DEFAULT_ARTICLES;
}

export async function getPublishedArticles(): Promise<EnrichedArticle[]> {
  const allArticles = await getAllArticles();
  const authors = await getAuthors();
  const authorMap = new Map(authors.map((a) => [a.id, a]));

  const fallbackAuthor = DEFAULT_AUTHORS[0];

  return allArticles
    .filter((a) => a.published)
    .map((article) => {
      const author = authorMap.get(article.author_id) || fallbackAuthor;
      return {
        ...article,
        author,
        path: `/blog/${article.slug}/`,
        reading_time_minutes: calculateReadingTime(article.content),
      };
    });
}

export async function getArticleBySlug(slug: string): Promise<EnrichedArticle | null> {
  const articles = await getPublishedArticles();
  return articles.find((a) => a.slug === slug) || null;
}

export async function getArticlesByAuthorId(authorId: string): Promise<EnrichedArticle[]> {
  const articles = await getPublishedArticles();
  return articles.filter((a) => a.author_id === authorId);
}
