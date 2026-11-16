import * as fs from 'fs';
import * as path from 'path';

const ROOT_FOLDER_ID = '1QenZZflcwITkrRq7IybaHK-qRBIz_2k-';

export interface DriveEntry {
  id: string;
  name: string;
  href: string;
  isFolder: boolean;
}

export interface DriveFileRecord {
  folderPath: string[];
  folderIds: string[];
  file: DriveEntry;
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

async function main() {
  console.log(`Crawling Modular CDACC Google Drive folder ${ROOT_FOLDER_ID}...`);

  interface QueueItem {
    id: string;
    folderPath: string[];
    folderIds: string[];
  }

  const queue: QueueItem[] = [{ id: ROOT_FOLDER_ID, folderPath: [], folderIds: [] }];
  const allFiles: DriveFileRecord[] = [];
  const allFolderPaths: string[][] = [];
  const CONCURRENCY = 12;

  let visitedFolders = 0;

  while (queue.length > 0) {
    const batch = queue.splice(0, CONCURRENCY);
    const results = await Promise.all(
      batch.map(async (item) => {
        const entries = await listFolder(item.id);
        return { item, entries };
      })
    );

    for (const { item, entries } of results) {
      visitedFolders++;
      if (item.folderPath.length > 0) {
        allFolderPaths.push(item.folderPath);
      }
      for (const entry of entries) {
        if (entry.isFolder) {
          queue.push({
            id: entry.id,
            folderPath: [...item.folderPath, entry.name],
            folderIds: [...item.folderIds, entry.id],
          });
        } else {
          allFiles.push({
            folderPath: item.folderPath,
            folderIds: item.folderIds,
            file: entry,
          });
        }
      }
    }

    if (visitedFolders % 50 === 0 || queue.length === 0) {
      console.log(`Visited ${visitedFolders} folders | Queue: ${queue.length} | Files so far: ${allFiles.length}`);
    }
  }

  const outPath = path.resolve(__dirname, 'data/modular-drive-resources.json');
  fs.mkdirSync(path.dirname(outPath), { recursive: true });
  fs.writeFileSync(outPath, JSON.stringify({ visitedFolders, allFiles }, null, 2), 'utf-8');

  console.log(`\nDone! Visited ${visitedFolders} folders, found ${allFiles.length} files.`);
  console.log(`Saved to ${outPath}`);

  const topFolders = new Set(allFolderPaths.map((p) => p[0]));
  console.log(`Top-level folders (${topFolders.size}):`, [...topFolders].slice(0, 20));
  console.log('Sample file paths:');
  for (const rec of allFiles.slice(0, 15)) {
    console.log(`  /${rec.folderPath.join('/')}/${rec.file.name}`);
  }
}

main();
