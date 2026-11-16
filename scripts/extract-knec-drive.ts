import * as fs from 'fs';
import * as path from 'path';

const ROOT_FOLDER_ID = '1sYj2TQul32FLFzh2qAURHj-58rYDQuCj';

export interface DriveEntry {
  id: string;
  name: string;
  href: string;
  isFolder: boolean;
}

export interface DriveUnitFolder {
  id: string;
  name: string;
  files: DriveEntry[];
}

export interface DriveCourseModuleFolder {
  id: string;
  name: string;
  unitFolders: DriveUnitFolder[];
  directFiles: DriveEntry[];
}

function decodeHtml(str: string): string {
  return str
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&#x27;/g, "'")
    .replace(/&nbsp;/g, ' ')
    .trim();
}

async function listFolder(folderId: string, retries = 2): Promise<DriveEntry[]> {
  const url = `https://drive.google.com/embeddedfolderview?id=${folderId}#list`;
  for (let attempt = 0; attempt <= retries; attempt++) {
    try {
      const res = await fetch(url, {
        headers: { 'User-Agent': 'Mozilla/5.0 (compatible; EasyTVETHub-Seeder/1.0)' },
      });
      if (!res.ok) {
        if (attempt < retries) {
          await new Promise((r) => setTimeout(r, 400 * (attempt + 1)));
          continue;
        }
        throw new Error(`HTTP ${res.status} for folder ${folderId}`);
      }
      const html = await res.text();
      const entries: DriveEntry[] = [];
      const regex = /<a[^>]+href="([^"]+)"[^>]*>[\s\S]*?<div class="flip-entry-title">([^<]+)<\/div>/g;
      let match: RegExpExecArray | null;
      while ((match = regex.exec(html)) !== null) {
        const href = decodeHtml(match[1]);
        const name = decodeHtml(match[2]);
        const folderMatch = href.match(/\/folders\/([^/?#]+)/);
        const fileMatch = href.match(/\/file\/d\/([^/?#]+)/);
        const isFolder = Boolean(folderMatch);
        const id = folderMatch?.[1] || fileMatch?.[1] || '';
        if (id) {
          entries.push({
            id,
            name,
            href: isFolder
              ? `https://drive.google.com/drive/folders/${id}`
              : `https://drive.google.com/file/d/${id}/view`,
            isFolder,
          });
        }
      }
      return entries;
    } catch (err) {
      if (attempt >= retries) {
        console.error(`Failed folder ${folderId}:`, err);
        return [];
      }
      await new Promise((r) => setTimeout(r, 500 * (attempt + 1)));
    }
  }
  return [];
}

async function mapWithConcurrency<T, R>(
  items: T[],
  concurrency: number,
  fn: (item: T, idx: number) => Promise<R>
): Promise<R[]> {
  const results: R[] = new Array(items.length);
  let nextIdx = 0;

  async function worker() {
    while (true) {
      const idx = nextIdx++;
      if (idx >= items.length) break;
      results[idx] = await fn(items[idx], idx);
    }
  }

  const workers = Array.from({ length: Math.min(concurrency, items.length) }, () => worker());
  await Promise.all(workers);
  return results;
}

async function main() {
  console.log('Fetching root KNEC PAST PAPERS folder...');
  const rootEntries = await listFolder(ROOT_FOLDER_ID);
  const courseFolders = rootEntries.filter((e) => e.isFolder);
  console.log(`Found ${courseFolders.length} top-level course/module folders.`);

  let totalUnitFolders = 0;
  let totalFiles = 0;

  const crawledCourses: DriveCourseModuleFolder[] = await mapWithConcurrency(
    courseFolders,
    8,
    async (cf, idx) => {
      const children = await listFolder(cf.id);
      const subFolders = children.filter((c) => c.isFolder);
      const directFiles = children.filter((c) => !c.isFolder);

      const unitFolders: DriveUnitFolder[] = await mapWithConcurrency(
        subFolders,
        6,
        async (uf) => {
          const files = (await listFolder(uf.id)).filter((f) => !f.isFolder);
          return { id: uf.id, name: uf.name, files };
        }
      );

      totalUnitFolders += unitFolders.length;
      const folderFilesCount =
        directFiles.length + unitFolders.reduce((acc, u) => acc + u.files.length, 0);
      totalFiles += folderFilesCount;

      if ((idx + 1) % 10 === 0 || idx + 1 === courseFolders.length) {
        console.log(
          `Progress: ${idx + 1}/${courseFolders.length} course folders (units so far: ${totalUnitFolders}, files so far: ${totalFiles})`
        );
      }

      return {
        id: cf.id,
        name: cf.name,
        unitFolders,
        directFiles,
      };
    }
  );

  const outPath = path.resolve(__dirname, 'data/knec-drive-resources.json');
  fs.writeFileSync(outPath, JSON.stringify(crawledCourses, null, 2), 'utf-8');
  console.log(`\nDone! Saved to ${outPath}`);
  console.log(`Course-module folders: ${crawledCourses.length}`);
  console.log(`Unit folders: ${totalUnitFolders}`);
  console.log(`Total files: ${totalFiles}`);
}

main();
