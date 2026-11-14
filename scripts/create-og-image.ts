import * as fs from 'fs';
import * as path from 'path';

// Creates a minimal valid 1200x630 PNG image for /public/og-default.png
// using zlib deflate so no external native image libraries are required.
import * as zlib from 'zlib';

function crc32(buf: Buffer): number {
  let c = -1;
  for (let i = 0; i < buf.length; i++) {
    c = (c >>> 8) ^ crcTable[(c ^ buf[i]) & 0xff];
  }
  return (c ^ -1) >>> 0;
}

const crcTable: number[] = [];
for (let n = 0; n < 256; n++) {
  let c = n;
  for (let k = 0; k < 8; k++) {
    c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1;
  }
  crcTable[n] = c >>> 0;
}

function makeChunk(type: string, data: Buffer): Buffer {
  const len = Buffer.alloc(4);
  len.writeUInt32BE(data.length, 0);
  const typeBuf = Buffer.from(type, 'ascii');
  const crcBuf = Buffer.alloc(4);
  const crcVal = crc32(Buffer.concat([typeBuf, data]));
  crcBuf.writeUInt32BE(crcVal, 0);
  return Buffer.concat([len, typeBuf, data, crcBuf]);
}

function createOgPng(width = 1200, height = 630): Buffer {
  const signature = Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]);

  const ihdr = Buffer.alloc(13);
  ihdr.writeUInt32BE(width, 0);
  ihdr.writeUInt32BE(height, 4);
  ihdr[8] = 8; // bit depth
  ihdr[9] = 2; // color type RGB
  ihdr[10] = 0;
  ihdr[11] = 0;
  ihdr[12] = 0;

  const rowSize = width * 3 + 1;
  const raw = Buffer.alloc(rowSize * height);

  for (let y = 0; y < height; y++) {
    const rowStart = y * rowSize;
    raw[rowStart] = 0; // filter type 0
    const isAccentBar = y < 18 || y > height - 18;
    for (let x = 0; x < width; x++) {
      const px = rowStart + 1 + x * 3;
      if (isAccentBar) {
        // Emerald green accent bar (#10b981)
        raw[px] = 16;
        raw[px + 1] = 185;
        raw[px + 2] = 129;
      } else {
        // Deep slate/emerald gradient (#0f172a -> #064e3b)
        const ratio = x / width;
        raw[px] = Math.round(15 * (1 - ratio) + 6 * ratio);
        raw[px + 1] = Math.round(23 * (1 - ratio) + 78 * ratio);
        raw[px + 2] = Math.round(42 * (1 - ratio) + 59 * ratio);
      }
    }
  }

  const compressed = zlib.deflateSync(raw, { level: 6 });

  return Buffer.concat([
    signature,
    makeChunk('IHDR', ihdr),
    makeChunk('IDAT', compressed),
    makeChunk('IEND', Buffer.alloc(0)),
  ]);
}

const publicDir = path.resolve(process.cwd(), 'public');
if (!fs.existsSync(publicDir)) {
  fs.mkdirSync(publicDir, { recursive: true });
}
fs.writeFileSync(path.join(publicDir, 'og-default.png'), createOgPng());
console.log('Generated public/og-default.png (1200x630)');
