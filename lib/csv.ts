export function parseCsv(text: string): Record<string, string>[] {
  const rows: string[][] = [];
  let currentRow: string[] = [];
  let currentField = '';
  let inQuotes = false;

  for (let i = 0; i < text.length; i++) {
    const ch = text[i];
    const next = text[i + 1];

    if (inQuotes) {
      if (ch === '"' && next === '"') {
        currentField += '"';
        i++;
      } else if (ch === '"') {
        inQuotes = false;
      } else {
        currentField += ch;
      }
    } else {
      if (ch === '"') {
        inQuotes = true;
      } else if (ch === ',') {
        currentRow.push(currentField.trim());
        currentField = '';
      } else if (ch === '\n' || (ch === '\r' && next === '\n')) {
        if (ch === '\r') i++;
        currentRow.push(currentField.trim());
        if (currentRow.some((cell) => cell.length > 0)) {
          rows.push(currentRow);
        }
        currentRow = [];
        currentField = '';
      } else {
        currentField += ch;
      }
    }
  }

  if (currentField.length > 0 || currentRow.length > 0) {
    currentRow.push(currentField.trim());
    if (currentRow.some((cell) => cell.length > 0)) {
      rows.push(currentRow);
    }
  }

  if (rows.length < 2) return [];
  const headers = rows[0].map((h) => h.toLowerCase().trim());

  return rows.slice(1).map((cells) => {
    const obj: Record<string, string> = {};
    headers.forEach((h, idx) => {
      obj[h] = cells[idx] ?? '';
    });
    return obj;
  });
}

export const CSV_TEMPLATES: Record<string, { filename: string; content: string; requiredColumns: string[] }> = {
  programmes: {
    filename: 'programmes_template.csv',
    requiredColumns: ['name', 'slug'],
    content: `name,slug,description,sort_order,seo_title,seo_description
"Modular CDACC Courses (Cycle 3)","modular-cdacc-courses-cycle-3","TVET CDACC Cycle 3 modular courses",1,"",""`,
  },
  departments: {
    filename: 'departments_template.csv',
    requiredColumns: ['programme_slug', 'name', 'slug'],
    content: `programme_slug,name,slug,description,sort_order
"modular-cdacc-courses-cycle-3","AGRICULTURE AND AQUACULTURE DEPARTMENT","agriculture-and-aquaculture-department","Accredited Agriculture & Aquaculture courses",1`,
  },
  courses: {
    filename: 'courses_template.csv',
    requiredColumns: ['programme_slug', 'department_slug', 'name', 'slug'],
    content: `programme_slug,department_slug,name,slug,level,published
"modular-cdacc-courses-cycle-3","agriculture-and-aquaculture-department","AGRI-PRENEURSHIP LEVEL 6","agri-preneurship-level-6",6,true`,
  },
  modules: {
    filename: 'modules_template.csv',
    requiredColumns: ['programme_slug', 'department_slug', 'course_slug', 'module_number'],
    content: `programme_slug,department_slug,course_slug,module_number,title
"modular-cdacc-courses-cycle-3","agriculture-and-aquaculture-department","agri-preneurship-level-6",1,"Module 1"`,
  },
  units: {
    filename: 'units_template.csv',
    requiredColumns: ['programme_slug', 'department_slug', 'course_slug', 'module_number', 'name', 'slug'],
    content: `programme_slug,department_slug,course_slug,module_number,name,slug,unit_code,published
"modular-cdacc-courses-cycle-3","agriculture-and-aquaculture-department","agri-preneurship-level-6",1,"ESTABLISH AGRI-ENTERPRISE","establish-agri-enterprise","",true`,
  },
  resources: {
    filename: 'resources_template.csv',
    requiredColumns: [
      'programme_slug',
      'department_slug',
      'course_slug',
      'module_number',
      'unit_slug',
      'type',
      'title',
      'file_url',
      'year',
    ],
    content: `programme_slug,department_slug,course_slug,module_number,unit_slug,type,title,file_url,year
"modular-cdacc-courses-cycle-3","agriculture-and-aquaculture-department","agri-preneurship-level-6",1,"establish-agri-enterprise","cutting_list","Download Cutting List","https://easytvet.com/1/1/Agripreneurship_L6/1/CR/AgriEnterprise_Establishment/pp/2025n_cl.pdf",2025`,
  },
};
