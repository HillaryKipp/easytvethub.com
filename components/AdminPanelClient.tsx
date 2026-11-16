'use client';

import { useState, useEffect, useCallback } from 'react';
import {
  ChevronDown,
  ChevronRight,
  Plus,
  Trash2,
  Edit3,
  Upload,
  Download,
  LogOut,
  CheckCircle2,
  AlertTriangle,
  RefreshCw,
  Wand2,
  Eye,
  EyeOff,
  Database,
  FileText,
  Users,
} from 'lucide-react';
import { AdminArticlesTab } from './admin/AdminArticlesTab';
import { AdminAuthorsTab } from './admin/AdminAuthorsTab';
import { getSupabaseClient } from '@/lib/supabase';
import {
  Course,
  Department,
  FAQItem,
  Module,
  Programme,
  Resource,
  ResourceType,
  Unit,
} from '@/lib/types';
import {
  convertGoogleDriveLink,
  detectLevelFromName,
  getAutoResourceTitle,
  makeUniqueSlug,
  slugify,
} from '@/lib/utils';
import { CSV_TEMPLATES, parseCsv } from '@/lib/csv';
import {
  AGRICULTURE_COURSES_RAW,
  AGRIPRENEURSHIP_L6_MODULES,
  ESTABLISH_AGRI_ENTERPRISE_RESOURCES,
  PROGRAMMES_SEED,
} from '@/scripts/seed-data-client';

const RESOURCE_TYPES: ResourceType[] = [
  'cutting_list',
  'candidate_tool',
  'assessor_guide',
  'past_paper',
  'marking_scheme',
  'other',
];

type EntityKind = 'programme' | 'department' | 'course' | 'module' | 'unit';

interface SelectedEntity {
  kind: EntityKind;
  id: string;
}

export function AdminPanelClient() {
  const supabase = getSupabaseClient();
  const [sessionUser, setSessionUser] = useState<{ id: string; email?: string } | null>(null);
  const [isAdmin, setIsAdmin] = useState<boolean | null>(null);
  const [authLoading, setAuthLoading] = useState(true);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [authError, setAuthError] = useState('');

  // Data state
  const [programmes, setProgrammes] = useState<Programme[]>([]);
  const [departments, setDepartments] = useState<Department[]>([]);
  const [courses, setCourses] = useState<Course[]>([]);
  const [modules, setModules] = useState<Module[]>([]);
  const [units, setUnits] = useState<Unit[]>([]);
  const [resources, setResources] = useState<Resource[]>([]);
  const [dataLoading, setDataLoading] = useState(false);
  const [statusMsg, setStatusMsg] = useState<{ type: 'success' | 'error'; text: string } | null>(
    null
  );

  // Tree expansion state
  const [expanded, setExpanded] = useState<Record<string, boolean>>({});
  const [selected, setSelected] = useState<SelectedEntity | null>(null);
  const [activeTab, setActiveTab] = useState<'tree' | 'csv' | 'articles' | 'authors'>('tree');

  // Bulk add state
  const [bulkCourseText, setBulkCourseText] = useState('');
  const [bulkUnitText, setBulkUnitText] = useState('');

  // Quick-add resources state on unit editor
  const [draftResources, setDraftResources] = useState<
    { id?: string; type: ResourceType; title: string; file_url: string; year: string; sort_order: number }[]
  >([]);

  // CSV state
  const [csvTable, setCsvTable] = useState<keyof typeof CSV_TEMPLATES>('resources');
  const [csvRawText, setCsvRawText] = useState('');
  const [csvPreviewRows, setCsvPreviewRows] = useState<Record<string, string>[]>([]);
  const [csvRowErrors, setCsvRowErrors] = useState<string[]>([]);
  const [csvImporting, setCsvImporting] = useState(false);

  const checkAdminAndLoad = useCallback(async (userId: string, userEmail?: string) => {
    setSessionUser({ id: userId, email: userEmail });
    const { data: adminRow, error } = await supabase
      .from('admins')
      .select('user_id')
      .eq('user_id', userId)
      .maybeSingle();

    if (error || !adminRow) {
      setIsAdmin(false);
      setAuthLoading(false);
      return;
    }

    setIsAdmin(true);
    setAuthLoading(false);
    await loadAllAdminData();
  }, [supabase]);

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (session?.user) {
        checkAdminAndLoad(session.user.id, session.user.email);
      } else {
        setAuthLoading(false);
      }
    });
  }, [supabase, checkAdminAndLoad]);

  async function fetchTableAll<T>(table: string, orderCol: string): Promise<T[]> {
    const out: T[] = [];
    let from = 0;
    const step = 1000;
    while (true) {
      const { data, error } = await supabase
        .from(table)
        .select('*')
        .order(orderCol, { ascending: true })
        .range(from, from + step - 1);
      if (error) throw error;
      if (!data || data.length === 0) break;
      out.push(...(data as T[]));
      if (data.length < step) break;
      from += step;
    }
    return out;
  }

  async function loadAllAdminData() {
    setDataLoading(true);
    try {
      const [p, d, c, m, u, r] = await Promise.all([
        fetchTableAll<Programme>('programmes', 'sort_order'),
        fetchTableAll<Department>('departments', 'sort_order'),
        fetchTableAll<Course>('courses', 'name'),
        fetchTableAll<Module>('modules', 'module_number'),
        fetchTableAll<Unit>('units', 'name'),
        fetchTableAll<Resource>('resources', 'sort_order'),
      ]);
      setProgrammes(p);
      setDepartments(d);
      setCourses(c);
      setModules(m);
      setUnits(u);
      setResources(r);
    } catch (err: unknown) {
      setStatusMsg({
        type: 'error',
        text: err instanceof Error ? err.message : 'Failed to load data',
      });
    } finally {
      setDataLoading(false);
    }
  }

  async function handleLogin(e: React.FormEvent) {
    e.preventDefault();
    setAuthError('');
    setAuthLoading(true);
    const { data, error } = await supabase.auth.signInWithPassword({ email, password });
    if (error || !data.user) {
      setAuthError(error?.message || 'Login failed');
      setAuthLoading(false);
      return;
    }
    await checkAdminAndLoad(data.user.id, data.user.email);
  }

  async function handleLogout() {
    await supabase.auth.signOut();
    setSessionUser(null);
    setIsAdmin(null);
  }

  const toggleExpand = (key: string) => {
    setExpanded((prev) => ({ ...prev, [key]: !prev[key] }));
  };

  // Sync draftResources when a unit is selected
  useEffect(() => {
    if (selected?.kind === 'unit') {
      const unitRes = resources
        .filter((r) => r.unit_id === selected.id)
        .sort((a, b) => a.sort_order - b.sort_order);
      setDraftResources(
        unitRes.map((r) => ({
          id: r.id,
          type: r.type,
          title: r.title || '',
          file_url: r.file_url,
          year: r.year ? String(r.year) : '',
          sort_order: r.sort_order,
        }))
      );
    }
  }, [selected, resources]);

  // Quick Add / Delete helpers
  async function handleAddProgramme() {
    const name = prompt('Enter new Programme name:');
    if (!name?.trim()) return;
    const existingSlugs = new Set(programmes.map((p) => p.slug));
    const slug = makeUniqueSlug(name.trim(), existingSlugs);
    const { data, error } = await supabase
      .from('programmes')
      .insert({ name: name.trim(), slug, sort_order: programmes.length + 1 })
      .select()
      .single();
    if (error) {
      setStatusMsg({ type: 'error', text: error.message });
    } else if (data) {
      setProgrammes((prev) => [...prev, data]);
      setSelected({ kind: 'programme', id: data.id });
      setStatusMsg({ type: 'success', text: `Created programme "${data.name}"` });
    }
  }

  async function handleAddDepartment(programmeId: string) {
    const name = prompt('Enter new Department name:');
    if (!name?.trim()) return;
    const existingSlugs = new Set(
      departments.filter((d) => d.programme_id === programmeId).map((d) => d.slug)
    );
    const slug = makeUniqueSlug(name.trim(), existingSlugs);
    const { data, error } = await supabase
      .from('departments')
      .insert({
        programme_id: programmeId,
        name: name.trim(),
        slug,
        sort_order: departments.filter((d) => d.programme_id === programmeId).length + 1,
      })
      .select()
      .single();
    if (error) {
      setStatusMsg({ type: 'error', text: error.message });
    } else if (data) {
      setDepartments((prev) => [...prev, data]);
      setExpanded((prev) => ({ ...prev, [`prog-${programmeId}`]: true }));
      setSelected({ kind: 'department', id: data.id });
      setStatusMsg({ type: 'success', text: `Created department "${data.name}"` });
    }
  }

  async function handleAddModule(courseId: string) {
    const courseMods = modules.filter((m) => m.course_id === courseId);
    const nextNum =
      courseMods.length > 0 ? Math.max(...courseMods.map((m) => m.module_number)) + 1 : 1;
    const { data, error } = await supabase
      .from('modules')
      .insert({ course_id: courseId, module_number: nextNum, title: `Module ${nextNum}` })
      .select()
      .single();
    if (error) {
      setStatusMsg({ type: 'error', text: error.message });
    } else if (data) {
      setModules((prev) => [...prev, data]);
      setExpanded((prev) => ({ ...prev, [`course-${courseId}`]: true }));
      setSelected({ kind: 'module', id: data.id });
      setStatusMsg({ type: 'success', text: `Added Module ${nextNum}` });
    }
  }

  async function handleBulkAddCourses(departmentId: string) {
    const lines = bulkCourseText
      .split(/\r?\n/)
      .map((l) => l.trim())
      .filter(Boolean);
    if (lines.length === 0) return;

    const existingSlugs = new Set(
      courses.filter((c) => c.department_id === departmentId).map((c) => c.slug)
    );

    const payload = lines.map((line) => ({
      department_id: departmentId,
      name: line,
      slug: makeUniqueSlug(line, existingSlugs),
      level: detectLevelFromName(line),
      published: true,
    }));

    // Chunk inserts to stay under request limits
    const inserted: Course[] = [];
    for (let i = 0; i < payload.length; i += 200) {
      const chunk = payload.slice(i, i + 200);
      const { data, error } = await supabase.from('courses').insert(chunk).select();
      if (error) {
        setStatusMsg({ type: 'error', text: error.message });
        return;
      }
      if (data) inserted.push(...(data as Course[]));
    }

    setCourses((prev) => [...prev, ...inserted]);
    setBulkCourseText('');
    setExpanded((prev) => ({ ...prev, [`dept-${departmentId}`]: true }));
    setStatusMsg({ type: 'success', text: `Bulk added ${inserted.length} courses!` });
  }

  async function handleBulkAddUnits(module: Module) {
    const lines = bulkUnitText
      .split(/\r?\n/)
      .map((l) => l.trim())
      .filter(Boolean);
    if (lines.length === 0) return;

    const courseUnits = units.filter((u) => u.course_id === module.course_id);
    const existingSlugs = new Set(courseUnits.map((u) => u.slug));
    const existingUnitByName = new Map(
      courseUnits.map((u) => [u.name.trim().toUpperCase(), u.id])
    );

    const payload = lines.map((line) => {
      const upper = line.toUpperCase();
      const baseSlug = slugify(line);
      const canonicalId = existingUnitByName.get(upper) || null;
      let slug: string;
      if (canonicalId) {
        const candidate = `${baseSlug}-module-${module.module_number}`;
        slug = existingSlugs.has(candidate)
          ? makeUniqueSlug(candidate, existingSlugs)
          : (existingSlugs.add(candidate), candidate);
      } else {
        slug = makeUniqueSlug(line, existingSlugs);
      }
      return {
        module_id: module.id,
        course_id: module.course_id,
        name: line,
        slug,
        canonical_unit_id: canonicalId,
        published: true,
      };
    });

    const inserted: Unit[] = [];
    for (let i = 0; i < payload.length; i += 200) {
      const chunk = payload.slice(i, i + 200);
      const { data, error } = await supabase.from('units').insert(chunk).select();
      if (error) {
        setStatusMsg({ type: 'error', text: error.message });
        return;
      }
      if (data) inserted.push(...(data as Unit[]));
    }

    setUnits((prev) => [...prev, ...inserted]);
    setBulkUnitText('');
    setExpanded((prev) => ({ ...prev, [`mod-${module.id}`]: true }));
    setStatusMsg({ type: 'success', text: `Bulk added ${inserted.length} units!` });
  }

  async function handleDeleteEntity(kind: EntityKind, id: string, label: string) {
    if (!confirm(`Delete ${kind} "${label}" and all its nested children?`)) return;
    const tableMap: Record<EntityKind, string> = {
      programme: 'programmes',
      department: 'departments',
      course: 'courses',
      module: 'modules',
      unit: 'units',
    };
    const { error } = await supabase.from(tableMap[kind]).delete().eq('id', id);
    if (error) {
      setStatusMsg({ type: 'error', text: error.message });
      return;
    }
    setSelected(null);
    await loadAllAdminData();
    setStatusMsg({ type: 'success', text: `Deleted ${kind} "${label}".` });
  }

  async function handleSaveAllUnitResources(unitId: string) {
    const validRows = draftResources.filter((r) => r.file_url.trim().length > 0);
    // Replace unit resources cleanly
    const { error: delErr } = await supabase.from('resources').delete().eq('unit_id', unitId);
    if (delErr) {
      setStatusMsg({ type: 'error', text: delErr.message });
      return;
    }

    if (validRows.length > 0) {
      const payload = validRows.map((r, idx) => ({
        unit_id: unitId,
        type: r.type,
        title: r.title.trim() || getAutoResourceTitle(r.type),
        file_url: r.file_url.trim(),
        year: r.year.trim() ? parseInt(r.year.trim(), 10) : null,
        sort_order: idx + 1,
      }));
      const { error: insErr } = await supabase.from('resources').insert(payload);
      if (insErr) {
        setStatusMsg({ type: 'error', text: insErr.message });
        return;
      }
    }

    await loadAllAdminData();
    setStatusMsg({
      type: 'success',
      text: `Saved ${validRows.length} resources for unit.`,
    });
  }

  async function handleOneClickSeedSampleData() {
    setDataLoading(true);
    setStatusMsg(null);
    try {
      const { data: progData, error: pErr } = await supabase
        .from('programmes')
        .upsert(PROGRAMMES_SEED, { onConflict: 'slug' })
        .select();
      if (pErr) throw pErr;

      const cycle3 = progData?.find((p) => p.slug === 'modular-cdacc-courses-cycle-3');
      if (!cycle3) throw new Error('Could not find Modular CDACC Cycle 3 programme');

      const deptName = 'AGRICULTURE AND AQUACULTURE DEPARTMENT';
      const deptSlug = slugify(deptName);
      const { data: deptData, error: dErr } = await supabase
        .from('departments')
        .upsert(
          [
            {
              programme_id: cycle3.id,
              name: deptName,
              slug: deptSlug,
              description:
                'Accredited CDACC Agriculture, Agribusiness, Animal Production, Dairy, Horticulture, and Aquaculture TVET courses in Kenya.',
              sort_order: 1,
            },
          ],
          { onConflict: 'programme_id,slug' }
        )
        .select()
        .single();
      if (dErr || !deptData) throw dErr || new Error('Failed to seed department');

      const usedCourseSlugs = new Set<string>();
      const coursesPayload = AGRICULTURE_COURSES_RAW.map((name) => ({
        department_id: deptData.id,
        name,
        slug: makeUniqueSlug(name, usedCourseSlugs),
        level: detectLevelFromName(name),
        published: true,
      }));

      const { data: insertedCourses, error: cErr } = await supabase
        .from('courses')
        .upsert(coursesPayload, { onConflict: 'department_id,slug' })
        .select();
      if (cErr || !insertedCourses) throw cErr || new Error('Failed to seed courses');

      const agriL6 = insertedCourses.find((c) => c.name === 'AGRI-PRENEURSHIP LEVEL 6');
      if (agriL6) {
        const modPayload = AGRIPRENEURSHIP_L6_MODULES.map((m) => ({
          course_id: agriL6.id,
          module_number: m.module_number,
          title: m.title,
        }));
        const { data: insMods, error: mErr } = await supabase
          .from('modules')
          .upsert(modPayload, { onConflict: 'course_id,module_number' })
          .select();
        if (mErr || !insMods) throw mErr || new Error('Failed to seed modules');

        const modIdByNum = new Map<number, string>();
        insMods.forEach((m) => modIdByNum.set(m.module_number, m.id));

        const firstUnitSlugByName = new Map<string, string>();
        const usedUnitSlugs = new Set<string>();
        const unitsList: {
          module_id: string;
          course_id: string;
          name: string;
          slug: string;
          canonicalSlug: string | null;
        }[] = [];

        for (const mod of AGRIPRENEURSHIP_L6_MODULES) {
          const modId = modIdByNum.get(mod.module_number)!;
          for (const uName of mod.units) {
            const norm = uName.trim().toUpperCase();
            const baseSlug = slugify(uName);
            if (firstUnitSlugByName.has(norm)) {
              const canonSlug = firstUnitSlugByName.get(norm)!;
              let dupSlug = `${baseSlug}-module-${mod.module_number}`;
              if (usedUnitSlugs.has(dupSlug)) {
                dupSlug = makeUniqueSlug(dupSlug, usedUnitSlugs);
              } else {
                usedUnitSlugs.add(dupSlug);
              }
              unitsList.push({
                module_id: modId,
                course_id: agriL6.id,
                name: uName,
                slug: dupSlug,
                canonicalSlug: canonSlug,
              });
            } else {
              const uSlug = makeUniqueSlug(uName, usedUnitSlugs);
              firstUnitSlugByName.set(norm, uSlug);
              unitsList.push({
                module_id: modId,
                course_id: agriL6.id,
                name: uName,
                slug: uSlug,
                canonicalSlug: null,
              });
            }
          }
        }

        const { data: insUnits, error: uErr } = await supabase
          .from('units')
          .upsert(
            unitsList.map((u) => ({
              module_id: u.module_id,
              course_id: u.course_id,
              name: u.name,
              slug: u.slug,
              published: true,
            })),
            { onConflict: 'course_id,slug' }
          )
          .select();
        if (uErr || !insUnits) throw uErr || new Error('Failed to seed units');

        const unitIdBySlug = new Map<string, string>();
        insUnits.forEach((u) => unitIdBySlug.set(u.slug, u.id));

        for (const u of unitsList) {
          if (u.canonicalSlug) {
            const uid = unitIdBySlug.get(u.slug);
            const cid = unitIdBySlug.get(u.canonicalSlug);
            if (uid && cid) {
              await supabase.from('units').update({ canonical_unit_id: cid }).eq('id', uid);
            }
          }
        }

        const establishId = unitIdBySlug.get('establish-agri-enterprise');
        if (establishId) {
          await supabase.from('resources').delete().eq('unit_id', establishId);
          await supabase.from('resources').insert(
            ESTABLISH_AGRI_ENTERPRISE_RESOURCES.map((r, idx) => ({
              unit_id: establishId,
              type: r.type,
              title: r.title,
              file_url: r.file_url,
              year: r.year,
              sort_order: idx + 1,
            }))
          );
        }
      }

      await loadAllAdminData();
      setStatusMsg({
        type: 'success',
        text: 'Seeded all sample Programmes, Agriculture & Aquaculture courses, Agri-Preneurship Level 6 modules/units, and resources!',
      });
    } catch (err: unknown) {
      setStatusMsg({
        type: 'error',
        text: err instanceof Error ? err.message : 'Seed failed',
      });
    } finally {
      setDataLoading(false);
    }
  }

  // CSV Validation & Preview
  function handleCsvTextChange(text: string, tableKey = csvTable) {
    setCsvRawText(text);
    const parsed = parseCsv(text);
    setCsvPreviewRows(parsed);
    const errs: string[] = [];
    const reqCols = CSV_TEMPLATES[tableKey].requiredColumns;

    parsed.forEach((row, idx) => {
      const missing = reqCols.filter((c) => !row[c] || !row[c].trim());
      if (missing.length > 0) {
        errs.push(`Row ${idx + 2}: Missing required columns (${missing.join(', ')})`);
      }
    });
    setCsvRowErrors(errs);
  }

  function downloadCsvTemplate(tableKey: keyof typeof CSV_TEMPLATES) {
    const tpl = CSV_TEMPLATES[tableKey];
    const blob = new Blob([tpl.content], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = tpl.filename;
    a.click();
    URL.revokeObjectURL(url);
  }

  async function handleRunCsvImport() {
    if (csvPreviewRows.length === 0) return;
    setCsvImporting(true);
    const rowErrors: string[] = [];
    let successCount = 0;

    try {
      const progBySlug = new Map(programmes.map((p) => [p.slug, p]));
      const deptByKey = new Map(
        departments.map((d) => {
          const p = programmes.find((pr) => pr.id === d.programme_id);
          return [`${p?.slug || ''}::${d.slug}`, d];
        })
      );
      const courseByKey = new Map(
        courses.map((c) => {
          const d = departments.find((dp) => dp.id === c.department_id);
          const p = programmes.find((pr) => pr.id === d?.programme_id);
          return [`${p?.slug || ''}::${d?.slug || ''}::${c.slug}`, c];
        })
      );

      if (csvTable === 'programmes') {
        const batch = csvPreviewRows.map((r, idx) => ({
          name: r.name,
          slug: r.slug || slugify(r.name),
          description: r.description || null,
          sort_order: r.sort_order ? parseInt(r.sort_order, 10) : idx + 1,
          seo_title: r.seo_title || null,
          seo_description: r.seo_description || null,
        }));
        for (let i = 0; i < batch.length; i += 200) {
          const chunk = batch.slice(i, i + 200);
          const { error } = await supabase.from('programmes').upsert(chunk, { onConflict: 'slug' });
          if (error) rowErrors.push(`Chunk ${i / 200 + 1}: ${error.message}`);
          else successCount += chunk.length;
        }
      } else if (csvTable === 'departments') {
        const validPayload: Record<string, unknown>[] = [];
        csvPreviewRows.forEach((r, idx) => {
          const prog = progBySlug.get(r.programme_slug);
          if (!prog) {
            rowErrors.push(`Row ${idx + 2}: Programme slug "${r.programme_slug}" not found`);
            return;
          }
          validPayload.push({
            programme_id: prog.id,
            name: r.name,
            slug: r.slug || slugify(r.name),
            description: r.description || null,
            sort_order: r.sort_order ? parseInt(r.sort_order, 10) : idx + 1,
          });
        });
        for (let i = 0; i < validPayload.length; i += 200) {
          const chunk = validPayload.slice(i, i + 200);
          const { error } = await supabase
            .from('departments')
            .upsert(chunk, { onConflict: 'programme_id,slug' });
          if (error) rowErrors.push(`Chunk error: ${error.message}`);
          else successCount += chunk.length;
        }
      } else if (csvTable === 'courses') {
        const validPayload: Record<string, unknown>[] = [];
        csvPreviewRows.forEach((r, idx) => {
          const dept = deptByKey.get(`${r.programme_slug}::${r.department_slug}`);
          if (!dept) {
            rowErrors.push(
              `Row ${idx + 2}: Department "${r.programme_slug}/${r.department_slug}" not found`
            );
            return;
          }
          validPayload.push({
            department_id: dept.id,
            name: r.name,
            slug: r.slug || slugify(r.name),
            level: r.level ? parseInt(r.level, 10) : detectLevelFromName(r.name),
            published: r.published ? r.published.toLowerCase() !== 'false' : true,
          });
        });
        for (let i = 0; i < validPayload.length; i += 200) {
          const chunk = validPayload.slice(i, i + 200);
          const { error } = await supabase
            .from('courses')
            .upsert(chunk, { onConflict: 'department_id,slug' });
          if (error) rowErrors.push(`Chunk error: ${error.message}`);
          else successCount += chunk.length;
        }
      } else if (csvTable === 'modules') {
        const validPayload: Record<string, unknown>[] = [];
        csvPreviewRows.forEach((r, idx) => {
          const course = courseByKey.get(
            `${r.programme_slug}::${r.department_slug}::${r.course_slug}`
          );
          if (!course) {
            rowErrors.push(`Row ${idx + 2}: Course "${r.course_slug}" not found`);
            return;
          }
          validPayload.push({
            course_id: course.id,
            module_number: parseInt(r.module_number, 10) || 1,
            title: r.title || `Module ${r.module_number}`,
          });
        });
        for (let i = 0; i < validPayload.length; i += 200) {
          const chunk = validPayload.slice(i, i + 200);
          const { error } = await supabase
            .from('modules')
            .upsert(chunk, { onConflict: 'course_id,module_number' });
          if (error) rowErrors.push(`Chunk error: ${error.message}`);
          else successCount += chunk.length;
        }
      } else if (csvTable === 'units') {
        const validPayload: Record<string, unknown>[] = [];
        csvPreviewRows.forEach((r, idx) => {
          const course = courseByKey.get(
            `${r.programme_slug}::${r.department_slug}::${r.course_slug}`
          );
          if (!course) {
            rowErrors.push(`Row ${idx + 2}: Course "${r.course_slug}" not found`);
            return;
          }
          const modNum = parseInt(r.module_number, 10) || 1;
          const mod = modules.find(
            (m) => m.course_id === course.id && m.module_number === modNum
          );
          if (!mod) {
            rowErrors.push(
              `Row ${idx + 2}: Module ${modNum} in course "${r.course_slug}" not found`
            );
            return;
          }
          validPayload.push({
            module_id: mod.id,
            course_id: course.id,
            name: r.name,
            slug: r.slug || slugify(r.name),
            unit_code: r.unit_code || null,
            published: r.published ? r.published.toLowerCase() !== 'false' : true,
          });
        });
        for (let i = 0; i < validPayload.length; i += 200) {
          const chunk = validPayload.slice(i, i + 200);
          const { error } = await supabase
            .from('units')
            .upsert(chunk, { onConflict: 'course_id,slug' });
          if (error) rowErrors.push(`Chunk error: ${error.message}`);
          else successCount += chunk.length;
        }
      } else if (csvTable === 'resources') {
        const validPayload: Record<string, unknown>[] = [];
        csvPreviewRows.forEach((r, idx) => {
          const course = courseByKey.get(
            `${r.programme_slug}::${r.department_slug}::${r.course_slug}`
          );
          if (!course) {
            rowErrors.push(
              `Row ${idx + 2}: Course "${r.programme_slug}/${r.department_slug}/${r.course_slug}" not found`
            );
            return;
          }
          const unit = units.find(
            (u) => u.course_id === course.id && u.slug === r.unit_slug
          );
          if (!unit) {
            rowErrors.push(
              `Row ${idx + 2}: Unit slug "${r.unit_slug}" in course "${r.course_slug}" not found`
            );
            return;
          }
          const rType = (RESOURCE_TYPES.includes(r.type as ResourceType)
            ? r.type
            : 'other') as ResourceType;
          validPayload.push({
            unit_id: unit.id,
            type: rType,
            title: r.title?.trim() || getAutoResourceTitle(rType),
            file_url: convertGoogleDriveLink(r.file_url),
            year: r.year ? parseInt(r.year, 10) : null,
            sort_order: idx + 1,
          });
        });
        for (let i = 0; i < validPayload.length; i += 200) {
          const chunk = validPayload.slice(i, i + 200);
          const { error } = await supabase.from('resources').insert(chunk);
          if (error) rowErrors.push(`Chunk error: ${error.message}`);
          else successCount += chunk.length;
        }
      }

      setCsvRowErrors(rowErrors);
      await loadAllAdminData();
      setStatusMsg({
        type: rowErrors.length > 0 ? 'error' : 'success',
        text: `Imported ${successCount} rows into ${csvTable}.${
          rowErrors.length > 0 ? ` (${rowErrors.length} errors reported below)` : ''
        }`,
      });
    } finally {
      setCsvImporting(false);
    }
  }

  if (authLoading) {
    return (
      <div className="py-16 text-center text-sm text-slate-500">
        Checking administrator authentication...
      </div>
    );
  }

  if (!sessionUser) {
    return (
      <div className="mx-auto max-w-md py-12">
        <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-8 shadow-sm">
          <h1 className="text-2xl font-extrabold text-slate-900 dark:text-white mb-2">
            Admin Panel Login
          </h1>
          <p className="text-sm text-slate-600 dark:text-slate-400 mb-6">
            Sign in with your Supabase administrator email and password.
          </p>

          {authError && (
            <div className="mb-4 rounded-xl bg-red-50 dark:bg-red-950/60 border border-red-200 dark:border-red-900 p-3 text-xs font-medium text-red-700 dark:text-red-300">
              {authError}
            </div>
          )}

          <form onSubmit={handleLogin} className="space-y-4">
            <div>
              <label className="block text-xs font-semibold uppercase text-slate-600 dark:text-slate-400 mb-1">
                Email Address
              </label>
              <input
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full rounded-xl border border-slate-300 dark:border-slate-700 bg-slate-50 dark:bg-slate-800 px-3.5 py-2.5 text-sm"
              />
            </div>
            <div>
              <label className="block text-xs font-semibold uppercase text-slate-600 dark:text-slate-400 mb-1">
                Password
              </label>
              <input
                type="password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className="w-full rounded-xl border border-slate-300 dark:border-slate-700 bg-slate-50 dark:bg-slate-800 px-3.5 py-2.5 text-sm"
              />
            </div>
            <button
              type="submit"
              className="w-full rounded-xl bg-emerald-600 hover:bg-emerald-700 py-2.5 text-sm font-bold text-white transition-colors cursor-pointer"
            >
              Sign In
            </button>
          </form>
        </div>
      </div>
    );
  }

  if (isAdmin === false) {
    return (
      <div className="mx-auto max-w-lg py-12">
        <div className="rounded-2xl border border-red-200 dark:border-red-900 bg-white dark:bg-slate-900 p-8 text-center">
          <AlertTriangle className="h-10 w-10 text-red-600 mx-auto mb-3" />
          <h1 className="text-2xl font-bold text-slate-900 dark:text-white mb-2">
            Not authorized
          </h1>
          <p className="text-sm text-slate-600 dark:text-slate-400 mb-4">
            Signed in as <strong>{sessionUser.email}</strong> (<code className="text-xs">{sessionUser.id}</code>), but your user ID is not in the <code className="text-xs">public.admins</code> table.
          </p>
          <p className="text-xs text-slate-500 mb-6">
            Run <code className="bg-slate-100 dark:bg-slate-800 px-1.5 py-0.5 rounded">INSERT INTO public.admins (user_id) VALUES (&apos;{sessionUser.id}&apos;);</code> in your Supabase SQL Editor, then refresh.
          </p>
          <button
            type="button"
            onClick={handleLogout}
            className="rounded-xl bg-slate-200 dark:bg-slate-800 px-4 py-2 text-xs font-semibold cursor-pointer"
          >
            Sign Out
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* Top Bar & Rebuild Site Help Box */}
      <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-4 rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-5 shadow-xs">
        <div>
          <h1 className="text-2xl font-extrabold text-slate-900 dark:text-white">
            TVET Papers Kenya - Admin Panel
          </h1>
          <p className="text-xs text-slate-500 mt-0.5">
            Authenticated as {sessionUser.email} • Manage hierarchy, SEO, FAQs, resources &amp; CSV imports
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-2.5">
          <button
            type="button"
            onClick={() => setActiveTab('tree')}
            className={`rounded-xl px-4 py-2 text-xs font-bold cursor-pointer transition-colors ${
              activeTab === 'tree'
                ? 'bg-emerald-600 text-white'
                : 'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300'
            }`}
          >
            Curriculum Tree &amp; Editor
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('articles')}
            className={`inline-flex items-center gap-1.5 rounded-xl px-4 py-2 text-xs font-bold cursor-pointer transition-colors ${
              activeTab === 'articles'
                ? 'bg-emerald-600 text-white'
                : 'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300'
            }`}
          >
            <FileText className="h-3.5 w-3.5" />
            Articles &amp; Guides
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('authors')}
            className={`inline-flex items-center gap-1.5 rounded-xl px-4 py-2 text-xs font-bold cursor-pointer transition-colors ${
              activeTab === 'authors'
                ? 'bg-emerald-600 text-white'
                : 'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300'
            }`}
          >
            <Users className="h-3.5 w-3.5" />
            Author Profiles
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('csv')}
            className={`inline-flex items-center gap-1.5 rounded-xl px-4 py-2 text-xs font-bold cursor-pointer transition-colors ${
              activeTab === 'csv'
                ? 'bg-emerald-600 text-white'
                : 'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300'
            }`}
          >
            <Upload className="h-3.5 w-3.5" />
            CSV Import &amp; Templates
          </button>
          <button
            type="button"
            onClick={handleOneClickSeedSampleData}
            disabled={dataLoading}
            className="inline-flex items-center gap-1.5 rounded-xl bg-sky-600 hover:bg-sky-700 px-3.5 py-2 text-xs font-bold text-white cursor-pointer"
          >
            <Database className="h-3.5 w-3.5" />
            Seed Sample Data
          </button>
          <button
            type="button"
            onClick={loadAllAdminData}
            className="inline-flex items-center gap-1 rounded-xl border border-slate-200 dark:border-slate-700 px-3 py-2 text-xs font-semibold cursor-pointer"
          >
            <RefreshCw className={`h-3.5 w-3.5 ${dataLoading ? 'animate-spin' : ''}`} />
            Refresh
          </button>
          <button
            type="button"
            onClick={handleLogout}
            className="inline-flex items-center gap-1 rounded-xl border border-slate-200 dark:border-slate-700 px-3 py-2 text-xs font-semibold text-red-600 cursor-pointer"
          >
            <LogOut className="h-3.5 w-3.5" />
            Logout
          </button>
        </div>
      </div>

      {/* Rebuild Site Help Box */}
      <div className="rounded-2xl border border-emerald-200 dark:border-emerald-900/60 bg-emerald-50/70 dark:bg-emerald-950/30 p-4 text-xs sm:text-sm text-emerald-950 dark:text-emerald-200 flex items-start gap-3">
        <CheckCircle2 className="h-5 w-5 text-emerald-600 shrink-0 mt-0.5" />
        <div>
          <strong className="font-bold">Rebuild site notice:</strong> All changes you save here are written immediately to Supabase Postgres. Because public pages are statically exported for maximum speed and zero hosting cost, public pages update automatically on the next nightly build (<code className="font-mono">.github/workflows/rebuild.yml</code>) or whenever you trigger a manual redeploy in Cloudflare Pages / GitHub Actions.
        </div>
      </div>

      {statusMsg && (
        <div
          className={`rounded-xl border p-3.5 text-xs font-semibold flex items-center justify-between ${
            statusMsg.type === 'success'
              ? 'bg-emerald-50 border-emerald-200 text-emerald-800 dark:bg-emerald-950/50 dark:border-emerald-800 dark:text-emerald-200'
              : 'bg-red-50 border-red-200 text-red-800 dark:bg-red-950/50 dark:border-red-800 dark:text-red-200'
          }`}
        >
          <span>{statusMsg.text}</span>
          <button
            type="button"
            onClick={() => setStatusMsg(null)}
            className="underline ml-4 cursor-pointer"
          >
            Dismiss
          </button>
        </div>
      )}

      {activeTab === 'tree' && (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
          {/* Left Column: Hierarchy Tree View Programme > Department > Course > Module > Unit */}
          <div className="lg:col-span-5 rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-5 shadow-xs max-h-[80vh] overflow-y-auto">
            <div className="flex items-center justify-between mb-4 pb-3 border-b border-slate-100 dark:border-slate-800">
              <h2 className="text-base font-bold text-slate-900 dark:text-white">
                Directory Hierarchy Tree
              </h2>
              <button
                type="button"
                onClick={handleAddProgramme}
                className="inline-flex items-center gap-1 rounded-lg bg-emerald-600 hover:bg-emerald-700 px-2.5 py-1 text-xs font-bold text-white cursor-pointer"
              >
                <Plus className="h-3.5 w-3.5" /> Programme
              </button>
            </div>

            {programmes.length === 0 ? (
              <p className="text-xs text-slate-500 py-6 text-center">
                No programmes yet. Click &ldquo;Seed Sample Data&rdquo; above or &ldquo;+ Programme&rdquo;.
              </p>
            ) : (
              <ul className="space-y-2 text-xs">
                {programmes.map((prog) => {
                  const pKey = `prog-${prog.id}`;
                  const isOpen = Boolean(expanded[pKey]);
                  const progDepts = departments.filter((d) => d.programme_id === prog.id);
                  return (
                    <li
                      key={prog.id}
                      className="rounded-xl border border-slate-200 dark:border-slate-800 p-2.5"
                    >
                      <div className="flex items-center justify-between gap-2">
                        <button
                          type="button"
                          onClick={() => toggleExpand(pKey)}
                          className="flex items-center gap-1.5 font-bold text-slate-900 dark:text-white text-left cursor-pointer"
                        >
                          {isOpen ? (
                            <ChevronDown className="h-4 w-4 text-slate-400 shrink-0" />
                          ) : (
                            <ChevronRight className="h-4 w-4 text-slate-400 shrink-0" />
                          )}
                          <span>{prog.name}</span>
                        </button>
                        <div className="flex items-center gap-1 shrink-0">
                          <button
                            type="button"
                            onClick={() => handleAddDepartment(prog.id)}
                            title="Add Department"
                            className="rounded bg-slate-100 dark:bg-slate-800 px-1.5 py-0.5 text-[11px] font-semibold hover:bg-emerald-100 cursor-pointer"
                          >
                            +Dept
                          </button>
                          <button
                            type="button"
                            onClick={() => setSelected({ kind: 'programme', id: prog.id })}
                            className="p-1 text-slate-500 hover:text-emerald-600 cursor-pointer"
                          >
                            <Edit3 className="h-3.5 w-3.5" />
                          </button>
                          <button
                            type="button"
                            onClick={() => handleDeleteEntity('programme', prog.id, prog.name)}
                            className="p-1 text-slate-400 hover:text-red-600 cursor-pointer"
                          >
                            <Trash2 className="h-3.5 w-3.5" />
                          </button>
                        </div>
                      </div>

                      {isOpen && (
                        <ul className="mt-2 pl-4 border-l border-slate-200 dark:border-slate-800 space-y-2">
                          {progDepts.map((dept) => {
                            const dKey = `dept-${dept.id}`;
                            const dOpen = Boolean(expanded[dKey]);
                            const deptCourses = courses.filter((c) => c.department_id === dept.id);
                            return (
                              <li key={dept.id} className="pt-1">
                                <div className="flex items-center justify-between gap-2">
                                  <button
                                    type="button"
                                    onClick={() => toggleExpand(dKey)}
                                    className="flex items-center gap-1 font-semibold text-slate-800 dark:text-slate-200 text-left cursor-pointer"
                                  >
                                    {dOpen ? (
                                      <ChevronDown className="h-3.5 w-3.5 text-slate-400 shrink-0" />
                                    ) : (
                                      <ChevronRight className="h-3.5 w-3.5 text-slate-400 shrink-0" />
                                    )}
                                    <span>
                                      {dept.name} ({deptCourses.length})
                                    </span>
                                  </button>
                                  <div className="flex items-center gap-1 shrink-0">
                                    <button
                                      type="button"
                                      onClick={() =>
                                        setSelected({ kind: 'department', id: dept.id })
                                      }
                                      className="rounded bg-emerald-50 dark:bg-emerald-950 px-1.5 py-0.5 text-[11px] font-semibold text-emerald-700 dark:text-emerald-300 cursor-pointer"
                                    >
                                      Edit / Bulk Courses
                                    </button>
                                    <button
                                      type="button"
                                      onClick={() =>
                                        handleDeleteEntity('department', dept.id, dept.name)
                                      }
                                      className="p-1 text-slate-400 hover:text-red-600 cursor-pointer"
                                    >
                                      <Trash2 className="h-3.5 w-3.5" />
                                    </button>
                                  </div>
                                </div>

                                {dOpen && (
                                  <ul className="mt-1.5 pl-4 border-l border-slate-200 dark:border-slate-800 space-y-1.5">
                                    {deptCourses.map((course) => {
                                      const cKey = `course-${course.id}`;
                                      const cOpen = Boolean(expanded[cKey]);
                                      const courseMods = modules
                                        .filter((m) => m.course_id === course.id)
                                        .sort((a, b) => a.module_number - b.module_number);

                                      return (
                                        <li key={course.id}>
                                          <div className="flex items-center justify-between gap-2">
                                            <button
                                              type="button"
                                              onClick={() => toggleExpand(cKey)}
                                              className="flex items-center gap-1 text-slate-700 dark:text-slate-300 text-left cursor-pointer"
                                            >
                                              {cOpen ? (
                                                <ChevronDown className="h-3 w-3 shrink-0" />
                                              ) : (
                                                <ChevronRight className="h-3 w-3 shrink-0" />
                                              )}
                                              <span className={!course.published ? 'line-through opacity-60' : ''}>
                                                {course.name}
                                              </span>
                                            </button>
                                            <div className="flex items-center gap-1 shrink-0">
                                              <button
                                                type="button"
                                                onClick={() => handleAddModule(course.id)}
                                                className="rounded bg-slate-100 dark:bg-slate-800 px-1.5 py-0.5 text-[10px] font-semibold hover:bg-emerald-100 cursor-pointer"
                                              >
                                                +Mod
                                              </button>
                                              <button
                                                type="button"
                                                onClick={() =>
                                                  setSelected({ kind: 'course', id: course.id })
                                                }
                                                className="p-1 text-slate-500 hover:text-emerald-600 cursor-pointer"
                                              >
                                                <Edit3 className="h-3 w-3" />
                                              </button>
                                              <button
                                                type="button"
                                                onClick={() =>
                                                  handleDeleteEntity('course', course.id, course.name)
                                                }
                                                className="p-1 text-slate-400 hover:text-red-600 cursor-pointer"
                                              >
                                                <Trash2 className="h-3 w-3" />
                                              </button>
                                            </div>
                                          </div>

                                          {cOpen && (
                                            <ul className="mt-1 pl-4 border-l border-slate-200 dark:border-slate-800 space-y-1">
                                              {courseMods.map((mod) => {
                                                const mKey = `mod-${mod.id}`;
                                                const mOpen = Boolean(expanded[mKey]);
                                                const modUnits = units.filter(
                                                  (u) => u.module_id === mod.id
                                                );
                                                return (
                                                  <li key={mod.id}>
                                                    <div className="flex items-center justify-between gap-2">
                                                      <button
                                                        type="button"
                                                        onClick={() => toggleExpand(mKey)}
                                                        className="flex items-center gap-1 text-slate-600 dark:text-slate-400 cursor-pointer"
                                                      >
                                                        {mOpen ? (
                                                          <ChevronDown className="h-3 w-3 shrink-0" />
                                                        ) : (
                                                          <ChevronRight className="h-3 w-3 shrink-0" />
                                                        )}
                                                        <span>
                                                          Module {mod.module_number} ({modUnits.length} units)
                                                        </span>
                                                      </button>
                                                      <div className="flex items-center gap-1">
                                                        <button
                                                          type="button"
                                                          onClick={() =>
                                                            setSelected({
                                                              kind: 'module',
                                                              id: mod.id,
                                                            })
                                                          }
                                                          className="rounded bg-emerald-50 dark:bg-emerald-950 px-1.5 py-0.5 text-[10px] font-semibold text-emerald-700 dark:text-emerald-300 cursor-pointer"
                                                        >
                                                          +Bulk Units
                                                        </button>
                                                        <button
                                                          type="button"
                                                          onClick={() =>
                                                            handleDeleteEntity(
                                                              'module',
                                                              mod.id,
                                                              `Module ${mod.module_number}`
                                                            )
                                                          }
                                                          className="p-0.5 text-slate-400 hover:text-red-600 cursor-pointer"
                                                        >
                                                          <Trash2 className="h-3 w-3" />
                                                        </button>
                                                      </div>
                                                    </div>

                                                    {mOpen && (
                                                      <ul className="mt-1 pl-4 border-l border-slate-200 dark:border-slate-800 space-y-1">
                                                        {modUnits.map((u) => {
                                                          const resCount = resources.filter(
                                                            (r) => r.unit_id === u.id
                                                          ).length;
                                                          return (
                                                            <li
                                                              key={u.id}
                                                              className="flex items-center justify-between gap-2 py-0.5"
                                                            >
                                                              <button
                                                                type="button"
                                                                onClick={() =>
                                                                  setSelected({
                                                                    kind: 'unit',
                                                                    id: u.id,
                                                                  })
                                                                }
                                                                className={`text-left truncate hover:text-emerald-600 cursor-pointer ${
                                                                  selected?.id === u.id
                                                                    ? 'font-bold text-emerald-700 dark:text-emerald-400'
                                                                    : 'text-slate-700 dark:text-slate-300'
                                                                }`}
                                                              >
                                                                {u.name} ({resCount} PDF)
                                                              </button>
                                                              <button
                                                                type="button"
                                                                onClick={() =>
                                                                  handleDeleteEntity(
                                                                    'unit',
                                                                    u.id,
                                                                    u.name
                                                                  )
                                                                }
                                                                className="p-0.5 text-slate-400 hover:text-red-600 cursor-pointer shrink-0"
                                                              >
                                                                <Trash2 className="h-3 w-3" />
                                                              </button>
                                                            </li>
                                                          );
                                                        })}
                                                      </ul>
                                                    )}
                                                  </li>
                                                );
                                              })}
                                            </ul>
                                          )}
                                        </li>
                                      );
                                    })}
                                  </ul>
                                )}
                              </li>
                            );
                          })}
                        </ul>
                      )}
                    </li>
                  );
                })}
              </ul>
            )}
          </div>

          {/* Right Column: Entity Editor & Bulk Actions */}
          <div className="lg:col-span-7 rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-6 shadow-xs">
            {!selected ? (
              <div className="py-16 text-center text-sm text-slate-500">
                Select any Programme, Department, Course, Module, or Unit from the tree on the left to edit its fields, SEO metadata, FAQs, bulk items, or downloadable resources.
              </div>
            ) : (
              <EntityEditorPanel
                selected={selected}
                programmes={programmes}
                departments={departments}
                courses={courses}
                modules={modules}
                units={units}
                bulkCourseText={bulkCourseText}
                setBulkCourseText={setBulkCourseText}
                onBulkAddCourses={handleBulkAddCourses}
                bulkUnitText={bulkUnitText}
                setBulkUnitText={setBulkUnitText}
                onBulkAddUnits={handleBulkAddUnits}
                draftResources={draftResources}
                setDraftResources={setDraftResources}
                onSaveResources={handleSaveAllUnitResources}
                onSaved={async (msg) => {
                  await loadAllAdminData();
                  setStatusMsg({ type: 'success', text: msg });
                }}
                onError={(msg) => setStatusMsg({ type: 'error', text: msg })}
              />
            )}
          </div>
        </div>
      )}

      {/* Articles & Guides Tab */}
      {activeTab === 'articles' && (
        <AdminArticlesTab onStatusMsg={(msg) => setStatusMsg(msg)} />
      )}

      {/* Author Profiles Tab */}
      {activeTab === 'authors' && (
        <AdminAuthorsTab onStatusMsg={(msg) => setStatusMsg(msg)} />
      )}

      {/* CSV Import Tab */}
      {activeTab === 'csv' && (
        <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 p-6 shadow-xs space-y-6">
          <div className="flex flex-wrap items-center justify-between gap-4 pb-4 border-b border-slate-100 dark:border-slate-800">
            <div>
              <h2 className="text-xl font-bold text-slate-900 dark:text-white">
                CSV Import &amp; Downloadable Templates
              </h2>
              <p className="text-xs text-slate-500 mt-1">
                Validate and upsert records by slug path in chunked batches of 200 rows.
              </p>
            </div>
            <div className="flex flex-wrap items-center gap-2">
              {(Object.keys(CSV_TEMPLATES) as Array<keyof typeof CSV_TEMPLATES>).map((tKey) => (
                <button
                  key={tKey}
                  type="button"
                  onClick={() => {
                    setCsvTable(tKey);
                    handleCsvTextChange(csvRawText, tKey);
                  }}
                  className={`rounded-xl px-3 py-1.5 text-xs font-bold capitalize cursor-pointer ${
                    csvTable === tKey
                      ? 'bg-emerald-600 text-white'
                      : 'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300'
                  }`}
                >
                  {tKey}
                </button>
              ))}
            </div>
          </div>

          <div className="flex flex-wrap items-center justify-between gap-4 bg-slate-50 dark:bg-slate-800/60 p-4 rounded-xl text-xs">
            <div>
              <span className="font-bold text-slate-800 dark:text-slate-200">
                Required columns for <code className="font-mono">{csvTable}</code>:{' '}
              </span>
              <code className="font-mono text-emerald-700 dark:text-emerald-400">
                {CSV_TEMPLATES[csvTable].requiredColumns.join(', ')}
              </code>
            </div>
            <button
              type="button"
              onClick={() => downloadCsvTemplate(csvTable)}
              className="inline-flex items-center gap-1.5 rounded-lg bg-white dark:bg-slate-900 border border-slate-300 dark:border-slate-700 px-3 py-1.5 font-semibold text-slate-800 dark:text-slate-200 hover:border-emerald-500 cursor-pointer"
            >
              <Download className="h-3.5 w-3.5 text-emerald-600" />
              Download {csvTable} CSV Template
            </button>
          </div>

          <div className="space-y-3">
            <label className="block text-xs font-bold uppercase text-slate-600 dark:text-slate-400">
              Upload CSV File or Paste CSV Content Below
            </label>
            <input
              type="file"
              accept=".csv,text/csv"
              onChange={(e) => {
                const file = e.target.files?.[0];
                if (!file) return;
                const reader = new FileReader();
                reader.onload = () => {
                  handleCsvTextChange(String(reader.result || ''), csvTable);
                };
                reader.readAsText(file);
              }}
              className="block text-xs text-slate-600 file:mr-3 file:rounded-lg file:border-0 file:bg-emerald-50 file:px-3 file:py-1.5 file:text-xs file:font-semibold file:text-emerald-700"
            />
            <textarea
              rows={6}
              value={csvRawText}
              onChange={(e) => handleCsvTextChange(e.target.value, csvTable)}
              placeholder={CSV_TEMPLATES[csvTable].content}
              className="w-full rounded-xl border border-slate-300 dark:border-slate-700 bg-slate-50 dark:bg-slate-800 p-3 font-mono text-xs"
            />
          </div>

          {csvRowErrors.length > 0 && (
            <div className="rounded-xl border border-red-200 bg-red-50 dark:bg-red-950/40 p-4 text-xs text-red-800 dark:text-red-300 space-y-1">
              <p className="font-bold">Row-Level Validation Errors ({csvRowErrors.length}):</p>
              <ul className="list-disc list-inside max-h-40 overflow-y-auto">
                {csvRowErrors.map((err, i) => (
                  <li key={i}>{err}</li>
                ))}
              </ul>
            </div>
          )}

          {csvPreviewRows.length > 0 && (
            <div>
              <div className="flex items-center justify-between mb-3">
                <h3 className="text-sm font-bold text-slate-900 dark:text-white">
                  Validation Preview ({csvPreviewRows.length} rows parsed)
                </h3>
                <button
                  type="button"
                  disabled={csvImporting || csvRowErrors.length > 0}
                  onClick={handleRunCsvImport}
                  className="inline-flex items-center gap-1.5 rounded-xl bg-emerald-600 hover:bg-emerald-700 disabled:opacity-50 px-5 py-2 text-xs font-bold text-white cursor-pointer"
                >
                  <Upload className="h-3.5 w-3.5" />
                  {csvImporting ? 'Importing...' : `Upsert ${csvPreviewRows.length} Rows into ${csvTable}`}
                </button>
              </div>
              <div className="overflow-x-auto max-h-64 border border-slate-200 dark:border-slate-800 rounded-xl">
                <table className="w-full text-left border-collapse text-xs">
                  <thead className="bg-slate-100 dark:bg-slate-800">
                    <tr>
                      {Object.keys(csvPreviewRows[0]).map((col) => (
                        <th key={col} className="p-2 font-mono font-semibold">
                          {col}
                        </th>
                      ))}
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-100 dark:divide-slate-800">
                    {csvPreviewRows.slice(0, 15).map((r, i) => (
                      <tr key={i}>
                        {Object.keys(csvPreviewRows[0]).map((col) => (
                          <td key={col} className="p-2 truncate max-w-[200px]">
                            {r[col]}
                          </td>
                        ))}
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}

function EntityEditorPanel({
  selected,
  programmes,
  departments,
  courses,
  modules,
  units,
  bulkCourseText,
  setBulkCourseText,
  onBulkAddCourses,
  bulkUnitText,
  setBulkUnitText,
  onBulkAddUnits,
  draftResources,
  setDraftResources,
  onSaveResources,
  onSaved,
  onError,
}: {
  selected: SelectedEntity;
  programmes: Programme[];
  departments: Department[];
  courses: Course[];
  modules: Module[];
  units: Unit[];
  bulkCourseText: string;
  setBulkCourseText: (v: string) => void;
  onBulkAddCourses: (deptId: string) => Promise<void>;
  bulkUnitText: string;
  setBulkUnitText: (v: string) => void;
  onBulkAddUnits: (mod: Module) => Promise<void>;
  draftResources: {
    id?: string;
    type: ResourceType;
    title: string;
    file_url: string;
    year: string;
    sort_order: number;
  }[];
  setDraftResources: React.Dispatch<
    React.SetStateAction<
      {
        id?: string;
        type: ResourceType;
        title: string;
        file_url: string;
        year: string;
        sort_order: number;
      }[]
    >
  >;
  onSaveResources: (unitId: string) => Promise<void>;
  onSaved: (msg: string) => Promise<void>;
  onError: (msg: string) => void;
}) {
  const supabase = getSupabaseClient();

  const entity: any =
    selected.kind === 'programme'
      ? programmes.find((p) => p.id === selected.id)
      : selected.kind === 'department'
      ? departments.find((d) => d.id === selected.id)
      : selected.kind === 'course'
      ? courses.find((c) => c.id === selected.id)
      : selected.kind === 'module'
      ? modules.find((m) => m.id === selected.id)
      : units.find((u) => u.id === selected.id);

  const [name, setName] = useState('');
  const [slug, setSlug] = useState('');
  const [level, setLevel] = useState('');
  const [unitCode, setUnitCode] = useState('');
  const [sortOrder, setSortOrder] = useState('0');
  const [published, setPublished] = useState(true);
  const [description, setDescription] = useState('');
  const [intro, setIntro] = useState('');
  const [seoTitle, setSeoTitle] = useState('');
  const [seoDescription, setSeoDescription] = useState('');
  const [ogImageUrl, setOgImageUrl] = useState('');
  const [faq, setFaq] = useState<FAQItem[]>([]);
  const [moduleTitle, setModuleTitle] = useState('');
  const [moduleNumber, setModuleNumber] = useState('1');

  useEffect(() => {
    if (!entity) return;
    setName(entity.name || '');
    setSlug(entity.slug || '');
    setLevel(entity.level !== undefined && entity.level !== null ? String(entity.level) : '');
    setUnitCode(entity.unit_code || '');
    setSortOrder(String(entity.sort_order ?? 0));
    setPublished(entity.published ?? true);
    setDescription(entity.description || '');
    setIntro(entity.intro || '');
    setSeoTitle(entity.seo_title || '');
    setSeoDescription(entity.seo_description || '');
    setOgImageUrl(entity.og_image_url || '');
    setFaq(Array.isArray(entity.faq) ? entity.faq : []);
    setModuleTitle(entity.title || '');
    setModuleNumber(String(entity.module_number ?? 1));
  }, [entity]);

  if (!entity) return null;

  async function handleSaveEntity(e: React.FormEvent) {
    e.preventDefault();
    if (selected.kind === 'module') {
      const { error } = await supabase
        .from('modules')
        .update({
          module_number: parseInt(moduleNumber, 10) || 1,
          title: moduleTitle || null,
        })
        .eq('id', entity.id);
      if (error) onError(error.message);
      else await onSaved(`Updated Module ${moduleNumber}`);
      return;
    }

    const common: Record<string, unknown> = {
      name: name.trim(),
      slug: slug.trim() || slugify(name),
      description: description.trim() || null,
      intro: intro.trim() || null,
      seo_title: seoTitle.trim() || null,
      seo_description: seoDescription.trim() || null,
      og_image_url: ogImageUrl.trim() || null,
      faq: faq.filter((f) => f.question.trim() && f.answer.trim()),
    };

    if (selected.kind === 'programme' || selected.kind === 'department') {
      common.sort_order = parseInt(sortOrder, 10) || 0;
    }
    if (selected.kind === 'course') {
      common.level = level.trim() ? parseInt(level.trim(), 10) : null;
      common.published = published;
    }
    if (selected.kind === 'unit') {
      common.unit_code = unitCode.trim() || null;
      common.published = published;
    }

    const tableMap: Record<EntityKind, string> = {
      programme: 'programmes',
      department: 'departments',
      course: 'courses',
      module: 'modules',
      unit: 'units',
    };

    const { error } = await supabase
      .from(tableMap[selected.kind])
      .update(common)
      .eq('id', entity.id);

    if (error) onError(error.message);
    else await onSaved(`Saved ${selected.kind} "${name}"`);
  }

  return (
    <div className="space-y-8">
      {/* Bulk Add Courses under Department */}
      {selected.kind === 'department' && (
        <div className="rounded-xl border border-emerald-200 dark:border-emerald-900/60 bg-emerald-50/40 dark:bg-emerald-950/20 p-4 space-y-3">
          <h3 className="text-sm font-bold text-slate-900 dark:text-white">
            Bulk Add Courses under {entity.name}
          </h3>
          <p className="text-xs text-slate-600 dark:text-slate-400">
            Paste one course name per line. Trailing &ldquo;LEVEL N&rdquo; is auto-detected, and slugs are auto-generated (appending <code className="font-mono">-2</code> on collision).
          </p>
          <textarea
            rows={4}
            value={bulkCourseText}
            onChange={(e) => setBulkCourseText(e.target.value)}
            placeholder={`AGRI-PRENEURSHIP LEVEL 6\nAQUACULTURE LEVEL 5\nDAIRY FARM OPERATOR LEVEL 4`}
            className="w-full rounded-xl border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-900 p-3 text-xs font-mono"
          />
          <button
            type="button"
            onClick={() => onBulkAddCourses(entity.id)}
            className="rounded-xl bg-emerald-600 hover:bg-emerald-700 px-4 py-2 text-xs font-bold text-white cursor-pointer"
          >
            Bulk Add Courses
          </button>
        </div>
      )}

      {/* Bulk Add Units under Module */}
      {selected.kind === 'module' && (
        <div className="rounded-xl border border-emerald-200 dark:border-emerald-900/60 bg-emerald-50/40 dark:bg-emerald-950/20 p-4 space-y-3">
          <h3 className="text-sm font-bold text-slate-900 dark:text-white">
            Bulk Add Units under Module {entity.module_number}
          </h3>
          <p className="text-xs text-slate-600 dark:text-slate-400">
            Paste one unit name per line. Repeated unit names across modules automatically receive a <code className="font-mono">-module-{entity.module_number}</code> slug suffix and link their <code className="font-mono">canonical_unit_id</code>.
          </p>
          <textarea
            rows={5}
            value={bulkUnitText}
            onChange={(e) => setBulkUnitText(e.target.value)}
            placeholder={`ESTABLISH AGRI-ENTERPRISE\nKEEP AGRI-ENTERPRISE RECORDS\nOPERATE AGRI-ENTERPRISE`}
            className="w-full rounded-xl border border-slate-300 dark:border-slate-700 bg-white dark:bg-slate-900 p-3 text-xs font-mono"
          />
          <button
            type="button"
            onClick={() => onBulkAddUnits(entity as Module)}
            className="rounded-xl bg-emerald-600 hover:bg-emerald-700 px-4 py-2 text-xs font-bold text-white cursor-pointer"
          >
            Bulk Add Units
          </button>
        </div>
      )}

      {/* Resources Quick-Add Editor on Unit Screen */}
      {selected.kind === 'unit' && (
        <div className="rounded-xl border border-slate-200 dark:border-slate-800 bg-slate-50/70 dark:bg-slate-800/40 p-5 space-y-4">
          <div className="flex flex-wrap items-center justify-between gap-2">
            <div>
              <h3 className="text-base font-bold text-slate-900 dark:text-white">
                Unit Assessment Resources (PDF Downloads)
              </h3>
              <p className="text-xs text-slate-500">
                Leave title empty to auto-title from type (e.g., &ldquo;Download Cutting List&rdquo;). Paste Google Drive share links and click the wand icon to convert to direct download URLs.
              </p>
            </div>
            <button
              type="button"
              onClick={() =>
                setDraftResources((prev) => [
                  ...prev,
                  {
                    type: 'past_paper',
                    title: '',
                    file_url: '',
                    year: String(new Date().getFullYear()),
                    sort_order: prev.length + 1,
                  },
                ])
              }
              className="inline-flex items-center gap-1 rounded-lg bg-slate-900 dark:bg-slate-700 px-3 py-1.5 text-xs font-bold text-white cursor-pointer"
            >
              <Plus className="h-3.5 w-3.5" /> Add Resource Row
            </button>
          </div>

          <div className="space-y-2.5">
            {draftResources.map((row, idx) => (
              <div
                key={idx}
                className="grid grid-cols-1 sm:grid-cols-12 gap-2 items-center bg-white dark:bg-slate-900 p-2.5 rounded-xl border border-slate-200 dark:border-slate-800 text-xs"
              >
                <div className="sm:col-span-3">
                  <select
                    value={row.type}
                    onChange={(e) => {
                      const next = [...draftResources];
                      next[idx].type = e.target.value as ResourceType;
                      setDraftResources(next);
                    }}
                    className="w-full rounded-lg border border-slate-300 dark:border-slate-700 bg-slate-50 dark:bg-slate-800 px-2 py-1.5"
                  >
                    {RESOURCE_TYPES.map((t) => (
                      <option key={t} value={t}>
                        {t}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="sm:col-span-3">
                  <input
                    type="text"
                    value={row.title}
                    onChange={(e) => {
                      const next = [...draftResources];
                      next[idx].title = e.target.value;
                      setDraftResources(next);
                    }}
                    placeholder={getAutoResourceTitle(row.type)}
                    className="w-full rounded-lg border border-slate-300 dark:border-slate-700 px-2.5 py-1.5"
                  />
                </div>
                <div className="sm:col-span-4 flex items-center gap-1">
                  <input
                    type="url"
                    value={row.file_url}
                    onChange={(e) => {
                      const next = [...draftResources];
                      next[idx].file_url = e.target.value;
                      setDraftResources(next);
                    }}
                    placeholder="https://... or Google Drive link"
                    className="w-full rounded-lg border border-slate-300 dark:border-slate-700 px-2.5 py-1.5"
                  />
                  <button
                    type="button"
                    title="Convert Google Drive share link to direct download URL"
                    onClick={() => {
                      const next = [...draftResources];
                      next[idx].file_url = convertGoogleDriveLink(next[idx].file_url);
                      setDraftResources(next);
                    }}
                    className="rounded-lg bg-emerald-50 dark:bg-emerald-950 p-1.5 text-emerald-700 dark:text-emerald-300 hover:bg-emerald-100 cursor-pointer shrink-0"
                  >
                    <Wand2 className="h-3.5 w-3.5" />
                  </button>
                </div>
                <div className="sm:col-span-1">
                  <input
                    type="number"
                    value={row.year}
                    onChange={(e) => {
                      const next = [...draftResources];
                      next[idx].year = e.target.value;
                      setDraftResources(next);
                    }}
                    placeholder="Year"
                    className="w-full rounded-lg border border-slate-300 dark:border-slate-700 px-2 py-1.5"
                  />
                </div>
                <div className="sm:col-span-1 text-right">
                  <button
                    type="button"
                    onClick={() =>
                      setDraftResources((prev) => prev.filter((_, i) => i !== idx))
                    }
                    className="p-1 text-slate-400 hover:text-red-600 cursor-pointer"
                  >
                    <Trash2 className="h-4 w-4" />
                  </button>
                </div>
              </div>
            ))}
          </div>

          <button
            type="button"
            onClick={() => onSaveResources(entity.id)}
            className="rounded-xl bg-emerald-600 hover:bg-emerald-700 px-5 py-2 text-xs font-bold text-white cursor-pointer"
          >
            Save All Unit Resources ({draftResources.length})
          </button>
        </div>
      )}

      {/* Main Entity Form */}
      <form onSubmit={handleSaveEntity} className="space-y-4">
        <div className="flex items-center justify-between border-b border-slate-100 dark:border-slate-800 pb-3">
          <h3 className="text-lg font-bold capitalize text-slate-900 dark:text-white">
            Edit {selected.kind}: {entity.name || `Module ${entity.module_number}`}
          </h3>
          {(selected.kind === 'course' || selected.kind === 'unit') && (
            <button
              type="button"
              onClick={() => setPublished(!published)}
              className={`inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-bold cursor-pointer ${
                published
                  ? 'bg-emerald-100 text-emerald-800 dark:bg-emerald-950 dark:text-emerald-300'
                  : 'bg-amber-100 text-amber-800 dark:bg-amber-950 dark:text-amber-300'
              }`}
            >
              {published ? <Eye className="h-3.5 w-3.5" /> : <EyeOff className="h-3.5 w-3.5" />}
              {published ? 'Published' : 'Unpublished'}
            </button>
          )}
        </div>

        {selected.kind === 'module' ? (
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                Module Number
              </label>
              <input
                type="number"
                value={moduleNumber}
                onChange={(e) => setModuleNumber(e.target.value)}
                className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
              />
            </div>
            <div>
              <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                Module Title
              </label>
              <input
                type="text"
                value={moduleTitle}
                onChange={(e) => setModuleTitle(e.target.value)}
                className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
              />
            </div>
          </div>
        ) : (
          <>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                  Name
                </label>
                <input
                  type="text"
                  required
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                />
              </div>
              <div>
                <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                  Slug
                </label>
                <input
                  type="text"
                  required
                  value={slug}
                  onChange={(e) => setSlug(e.target.value)}
                  className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm font-mono"
                />
              </div>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
              {(selected.kind === 'programme' || selected.kind === 'department') && (
                <div>
                  <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                    Sort Order
                  </label>
                  <input
                    type="number"
                    value={sortOrder}
                    onChange={(e) => setSortOrder(e.target.value)}
                    className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                  />
                </div>
              )}
              {selected.kind === 'course' && (
                <div>
                  <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                    Qualification Level (3, 4, 5, 6)
                  </label>
                  <input
                    type="number"
                    value={level}
                    onChange={(e) => setLevel(e.target.value)}
                    className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                  />
                </div>
              )}
              {selected.kind === 'unit' && (
                <div>
                  <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                    Unit Code (optional)
                  </label>
                  <input
                    type="text"
                    value={unitCode}
                    onChange={(e) => setUnitCode(e.target.value)}
                    className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm font-mono"
                  />
                </div>
              )}
              <div className="sm:col-span-2">
                <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                  OG Social Image URL (optional override)
                </label>
                <input
                  type="text"
                  value={ogImageUrl}
                  onChange={(e) => setOgImageUrl(e.target.value)}
                  placeholder="/og-default.png or https://..."
                  className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                />
              </div>
            </div>

            <div>
              <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                40–60 Word Answer Intro Paragraph (leave blank to auto-generate from template)
              </label>
              <textarea
                rows={3}
                value={intro}
                onChange={(e) => setIntro(e.target.value)}
                className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
              />
            </div>

            <div>
              <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                Detailed Description / &ldquo;What is {'{unit}'}?&rdquo; Summary
              </label>
              <textarea
                rows={3}
                value={description}
                onChange={(e) => setDescription(e.target.value)}
                className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
              />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                  SEO Title Override
                </label>
                <input
                  type="text"
                  value={seoTitle}
                  onChange={(e) => setSeoTitle(e.target.value)}
                  className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                />
              </div>
              <div>
                <label className="block text-xs font-bold uppercase text-slate-500 mb-1">
                  SEO Meta Description Override (150–160 chars)
                </label>
                <input
                  type="text"
                  value={seoDescription}
                  onChange={(e) => setSeoDescription(e.target.value)}
                  className="w-full rounded-xl border border-slate-300 dark:border-slate-700 px-3 py-2 text-sm"
                />
              </div>
            </div>

            {/* FAQ Editor (Question / Answer pairs) */}
            <div className="border-t border-slate-100 dark:border-slate-800 pt-4 space-y-3">
              <div className="flex items-center justify-between">
                <label className="block text-xs font-bold uppercase text-slate-500">
                  Custom FAQ Pairs (leave empty to auto-generate SEO FAQs)
                </label>
                <button
                  type="button"
                  onClick={() => setFaq([...faq, { question: '', answer: '' }])}
                  className="inline-flex items-center gap-1 rounded-lg bg-slate-100 dark:bg-slate-800 px-2.5 py-1 text-xs font-semibold cursor-pointer"
                >
                  <Plus className="h-3 w-3" /> Add FAQ
                </button>
              </div>
              {faq.map((item, idx) => (
                <div
                  key={idx}
                  className="rounded-xl border border-slate-200 dark:border-slate-800 p-3 space-y-2 bg-slate-50/50 dark:bg-slate-800/30"
                >
                  <div className="flex items-center justify-between gap-2">
                    <input
                      type="text"
                      value={item.question}
                      onChange={(e) => {
                        const next = [...faq];
                        next[idx].question = e.target.value;
                        setFaq(next);
                      }}
                      placeholder="Question..."
                      className="w-full rounded-lg border border-slate-300 dark:border-slate-700 px-2.5 py-1.5 text-xs font-semibold"
                    />
                    <button
                      type="button"
                      onClick={() => setFaq(faq.filter((_, i) => i !== idx))}
                      className="text-slate-400 hover:text-red-600 cursor-pointer"
                    >
                      <Trash2 className="h-3.5 w-3.5" />
                    </button>
                  </div>
                  <textarea
                    rows={2}
                    value={item.answer}
                    onChange={(e) => {
                      const next = [...faq];
                      next[idx].answer = e.target.value;
                      setFaq(next);
                    }}
                    placeholder="Direct answer..."
                    className="w-full rounded-lg border border-slate-300 dark:border-slate-700 px-2.5 py-1.5 text-xs"
                  />
                </div>
              ))}
            </div>
          </>
        )}

        <button
          type="submit"
          className="rounded-xl bg-emerald-600 hover:bg-emerald-700 px-6 py-2.5 text-sm font-bold text-white cursor-pointer"
        >
          Save {selected.kind} Changes
        </button>
      </form>
    </div>
  );
}
