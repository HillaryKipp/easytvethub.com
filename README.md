# TVET Papers Kenya (`easytvethub.com`)

A zero-cost, static-exported public directory of Kenyan TVET courses, modular competency units, and downloadable past papers/assessment documents (`cutting_list`, `candidate_tool`, `assessor_guide`, `past_paper`, `marking_scheme`), optimized for Google SEO, Featured Snippets, and AI Overviews — plus a client-side admin panel powered by Supabase Auth and Row-Level Security (RLS).

---

## Stack & Architecture

- **Framework**: Next.js (App Router, TypeScript, Tailwind CSS) configured for **Static Export** (`output: 'export'`, `trailingSlash: true`, `images: { unoptimized: true }`).
- **Hosting**: Deploys as 100% static HTML/CSS/JS files to **Cloudflare Pages** (`npm run build` → `out/` directory). Zero runtime server code, zero API routes, zero middleware.
- **Database & Auth**: Supabase Postgres (`supabase/schema.sql`) using `@supabase/supabase-js` with **ONLY** the public `anon` key. Security is enforced by Postgres Row-Level Security (`public.is_admin()`).
- **Client-Side Search**: At build time (`prebuild` / `predev`), `scripts/generate-search-index.ts` queries Supabase in paginated batches of 1,000 rows and writes `public/search-index.json`. The header search box and `/search/` page lazy-load this index and search client-side with `MiniSearch`.

---

## 1. Environment Variables

Create or edit `.env.local` in the project root:

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project-id.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
NEXT_PUBLIC_SITE_URL=https://easytvethub.com
```

> **Note:** If any of these three environment variables are missing or invalid, the build fails immediately with a clear error message.

---

## 2. Database Setup & Seeding

1. Open your **Supabase Dashboard → SQL Editor**.
2. Run the schema in [`supabase/schema.sql`](./supabase/schema.sql) (if you haven't already).
3. To seed the sample data (the 3 Programmes, `AGRICULTURE AND AQUACULTURE DEPARTMENT`, all 32 Level 6/5/4/3 courses, all 9 modules and 25 units of `AGRI-PRENEURSHIP LEVEL 6` including duplicate-unit `canonical_unit_id` links, and the 3 downloadable PDFs for `ESTABLISH AGRI-ENTERPRISE`):
   - **Option A (Fastest — SQL Editor)**: Run `npm run seed` locally to generate [`supabase/seed.sql`](./supabase/seed.sql), then paste and run `supabase/seed.sql` in the Supabase SQL Editor.
   - **Option B (Via Admin UI)**: Log in to `/admin/` as an authorized admin and click the **"Seed Sample Data"** button in the top bar.
   - **Option C (Via CLI with Admin Credentials)**:
     ```bash
     ADMIN_EMAIL=you@example.com ADMIN_PASSWORD=yourpassword npm run seed
     ```

### Adding Yourself as an Admin

1. Sign up or create a user in **Supabase Dashboard → Authentication → Users** and copy the user's `UID`.
2. In the **Supabase SQL Editor**, run:
   ```sql
   INSERT INTO public.admins (user_id) VALUES ('YOUR-USER-UUID-HERE');
   ```
3. Visit `/admin/` and sign in with your email and password.

---

## 3. Running Locally & Building Static Export

```bash
# Install dependencies
npm install

# Start development server (auto-generates public/search-index.json first)
npm run dev

# Build static export into /out
npm run build
```

The static site is exported to `./out/`.

---

## 4. How to Add Content & Run CSV Imports

Visit `/admin/` and log in:

1. **Hierarchy Tree & Inline Editor**:
   - Expand `Programme > Department > Course > Module > Unit`.
   - Edit `seo_title`, `seo_description`, `intro` (40–60 word plain-language answer paragraph), `description`, `og_image_url`, `sort_order`, `published` toggle, and custom FAQ pairs.
2. **Bulk Add Courses & Units**:
   - Select a **Department** to paste one course name per line (auto-detects `LEVEL N` and generates unique slugs).
   - Select a **Module** to paste one unit name per line (automatically suffixes `-module-N` and links `canonical_unit_id` when a unit name repeats across modules).
3. **Quick-Add Unit Resources & Google Drive Link Helper**:
   - Select any **Unit** to add multiple resource rows (`cutting_list`, `candidate_tool`, `assessor_guide`, `past_paper`, `marking_scheme`, `other`) and save them all at once. Click the wand icon next to any Google Drive share link to convert it into a direct download link.
4. **CSV Import**:
   - Switch to the **CSV Import & Templates** tab in `/admin/`.
   - Select a table (`programmes`, `departments`, `courses`, `modules`, `units`, or `resources`), download the CSV template, upload or paste your CSV, review the validation preview and row-level error report, and click **Upsert**.

---

## 5. Nightly Rebuild & Cloudflare Pages Deployment

- Configure Cloudflare Pages with:
  - **Build command**: `npm run build`
  - **Build output directory**: `out`
  - **Environment variables**: `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `NEXT_PUBLIC_SITE_URL`
- Create a **Deploy Hook** in Cloudflare Pages and save the URL as a GitHub Actions secret named `CF_DEPLOY_HOOK_URL`.
- [`.github/workflows/rebuild.yml`](./.github/workflows/rebuild.yml) triggers a nightly rebuild (`0 0 * * *`) or manual `workflow_dispatch` via `curl -X POST`.
