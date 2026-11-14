import * as fs from 'fs';
import * as path from 'path';
import * as dotenv from 'dotenv';
import { getDirectoryData } from '../lib/data';
import { getPublishedArticles } from '../lib/blog-data';
import { SearchDocument } from '../lib/types';
import { toTitleCase } from '../lib/utils';

dotenv.config({ path: path.resolve(process.cwd(), '.env.local') });
dotenv.config({ path: path.resolve(process.cwd(), '.env') });

async function generateSearchIndex() {
  console.log('Generating public/search-index.json from Supabase...');
  const data = await getDirectoryData(true);

  const docs: SearchDocument[] = [];

  for (const course of data.courses) {
    docs.push({
      id: `course-${course.id}`,
      type: 'course',
      name: toTitleCase(course.name),
      level: course.level,
      path: course.path,
      breadcrumb: `${course.programme.name} › ${toTitleCase(course.department.name)}${
        course.level ? ` › Level ${course.level}` : ''
      }`,
      resourceCount: course.units.reduce((acc, u) => acc + u.resources.length, 0),
    });
  }

  for (const unit of data.units) {
    docs.push({
      id: `unit-${unit.id}`,
      type: 'unit',
      name: toTitleCase(unit.name),
      code: unit.unit_code,
      level: unit.course.level,
      path: unit.path,
      breadcrumb: `${course.breadcrumbForUnit(unit)}`,
      resourceCount: unit.resources.length,
    });
  }

  const articles = await getPublishedArticles();
  for (const article of articles) {
    docs.push({
      id: `article-${article.id}`,
      type: 'article',
      name: article.title,
      level: null,
      path: article.path,
      breadcrumb: `Blog › ${article.category.replace('_', ' ')}`,
      resourceCount: 0,
    });
  }

  const publicDir = path.resolve(process.cwd(), 'public');
  if (!fs.existsSync(publicDir)) {
    fs.mkdirSync(publicDir, { recursive: true });
  }

  const outPath = path.join(publicDir, 'search-index.json');
  fs.writeFileSync(outPath, JSON.stringify(docs, null, 2), 'utf8');
  console.log(`Wrote ${docs.length} searchable items (${data.courses.length} courses, ${data.units.length} units) to public/search-index.json`);
}

const course = {
  breadcrumbForUnit(unit: {
    programme: { name: string };
    department: { name: string };
    course: { name: string };
    module: { module_number: number };
  }) {
    return `${unit.programme.name} › ${toTitleCase(unit.department.name)} › ${toTitleCase(
      unit.course.name
    )} › Module ${unit.module.module_number}`;
  },
};

generateSearchIndex().catch((err) => {
  console.error('Error generating search index:', err.message || err);
  process.exit(1);
});
