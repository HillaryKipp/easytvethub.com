import { getSupabaseClient } from './supabase';
import {
  Course,
  Department,
  DirectoryData,
  EnrichedCourse,
  EnrichedModule,
  EnrichedUnit,
  Module,
  Programme,
  Resource,
  Unit,
} from './types';

const BATCH_SIZE = 1000;

async function fetchAllPaginated<T>(
  table: string,
  orderBy: string,
  ascending = true,
  filterPublished = false
): Promise<T[]> {
  const supabase = getSupabaseClient();
  const allRows: T[] = [];
  let from = 0;

  while (true) {
    let query = supabase
      .from(table)
      .select('*')
      .order(orderBy, { ascending })
      .range(from, from + BATCH_SIZE - 1);

    if (filterPublished) {
      query = query.eq('published', true);
    }

    const { data, error } = await query;

    if (error) {
      throw new Error(`Failed to fetch table "${table}" from Supabase: ${error.message}`);
    }

    if (!data || data.length === 0) {
      break;
    }

    allRows.push(...(data as T[]));

    if (data.length < BATCH_SIZE) {
      break;
    }

    from += BATCH_SIZE;
  }

  return allRows;
}

let cachedDirectoryPromise: Promise<DirectoryData> | null = null;

export async function getDirectoryData(forceRefresh = false): Promise<DirectoryData> {
  if (cachedDirectoryPromise && !forceRefresh) {
    return cachedDirectoryPromise;
  }

  cachedDirectoryPromise = (async () => {
    const [programmes, departments, rawCourses, modules, rawUnits, resources] = await Promise.all([
      fetchAllPaginated<Programme>('programmes', 'sort_order', true, false),
      fetchAllPaginated<Department>('departments', 'sort_order', true, false),
      fetchAllPaginated<Course>('courses', 'name', true, true),
      fetchAllPaginated<Module>('modules', 'module_number', true, false),
      fetchAllPaginated<Unit>('units', 'name', true, true),
      fetchAllPaginated<Resource>('resources', 'sort_order', true, false),
    ]);

    const progById = new Map<string, Programme>();
    for (const p of programmes) {
      progById.set(p.id, { ...p, faq: Array.isArray(p.faq) ? p.faq : [] });
    }

    const deptById = new Map<string, Department>();
    for (const d of departments) {
      if (progById.has(d.programme_id)) {
        deptById.set(d.id, { ...d, faq: Array.isArray(d.faq) ? d.faq : [] });
      }
    }

    const courseById = new Map<string, Course>();
    for (const c of rawCourses) {
      if (deptById.has(c.department_id)) {
        courseById.set(c.id, { ...c, faq: Array.isArray(c.faq) ? c.faq : [] });
      }
    }

    const modById = new Map<string, Module>();
    for (const m of modules) {
      if (courseById.has(m.course_id)) {
        modById.set(m.id, m);
      }
    }

    const resourcesByUnitId = new Map<string, Resource[]>();
    for (const r of resources) {
      const list = resourcesByUnitId.get(r.unit_id) || [];
      list.push(r);
      resourcesByUnitId.set(r.unit_id, list);
    }

    const enrichedUnitsMap = new Map<string, EnrichedUnit>();
    const enrichedUnits: EnrichedUnit[] = [];

    for (const u of rawUnits) {
      const mod = modById.get(u.module_id);
      const course = courseById.get(u.course_id);
      if (!mod || !course) continue;
      const dept = deptById.get(course.department_id);
      if (!dept) continue;
      const prog = progById.get(dept.programme_id);
      if (!prog) continue;

      const unitResources = (resourcesByUnitId.get(u.id) || []).sort(
        (a, b) => a.sort_order - b.sort_order || (b.year || 0) - (a.year || 0)
      );

      const enriched: EnrichedUnit = {
        ...u,
        faq: Array.isArray(u.faq) ? u.faq : [],
        module: mod,
        course,
        department: dept,
        programme: prog,
        resources: unitResources,
        path: `/${prog.slug}/${dept.slug}/${course.slug}/${u.slug}/`,
        canonicalPath: null,
        duplicatePaths: [],
      };

      enrichedUnitsMap.set(u.id, enriched);
      enrichedUnits.push(enriched);
    }

    // Wire up canonical_unit_id and duplicate units
    for (const u of enrichedUnits) {
      if (u.canonical_unit_id && enrichedUnitsMap.has(u.canonical_unit_id)) {
        const canonical = enrichedUnitsMap.get(u.canonical_unit_id)!;
        u.canonicalPath = canonical.path;
        u.duplicatePaths.push({ unit: canonical, moduleNumber: canonical.module.module_number });
        canonical.duplicatePaths.push({ unit: u, moduleNumber: u.module.module_number });
      }
    }

    // Build enriched courses
    const enrichedCourses: EnrichedCourse[] = [];
    const levelsSet = new Set<number>();

    for (const c of courseById.values()) {
      const dept = deptById.get(c.department_id)!;
      const prog = progById.get(dept.programme_id)!;
      if (c.level !== null && c.level !== undefined) {
        levelsSet.add(c.level);
      }

      const courseModules = modules
        .filter((m) => m.course_id === c.id)
        .sort((a, b) => a.module_number - b.module_number);

      const courseUnits = enrichedUnits
        .filter((u) => u.course_id === c.id)
        .sort((a, b) => a.module.module_number - b.module.module_number || a.name.localeCompare(b.name));

      const enrichedMods: EnrichedModule[] = courseModules.map((m) => ({
        ...m,
        units: courseUnits.filter((u) => u.module_id === m.id),
      }));

      enrichedCourses.push({
        ...c,
        department: dept,
        programme: prog,
        modules: enrichedMods,
        units: courseUnits,
        path: `/${prog.slug}/${dept.slug}/${c.slug}/`,
      });
    }

    // Default levels 3, 4, 5, 6 so level hubs always exist even before all levels are populated
    [3, 4, 5, 6].forEach((lvl) => levelsSet.add(lvl));
    const levels = Array.from(levelsSet).sort((a, b) => a - b);

    return {
      programmes: Array.from(progById.values()),
      departments: Array.from(deptById.values()),
      courses: enrichedCourses,
      modules: Array.from(modById.values()),
      units: enrichedUnits,
      resources,
      levels,
    };
  })();

  return cachedDirectoryPromise;
}
