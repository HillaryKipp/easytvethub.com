create extension if not exists pg_trgm;

create type resource_type as enum
  ('cutting_list','candidate_tool','assessor_guide','past_paper','marking_scheme','other');

create table programmes (
  id uuid primary key default gen_random_uuid(),
  name text not null, slug text not null unique,
  description text, intro text, faq jsonb not null default '[]',
  og_image_url text, seo_title text, seo_description text,
  sort_order int not null default 0,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);

create table departments (
  id uuid primary key default gen_random_uuid(),
  programme_id uuid not null references programmes(id) on delete cascade,
  name text not null, slug text not null,
  description text, intro text, faq jsonb not null default '[]',
  og_image_url text, seo_title text, seo_description text,
  sort_order int not null default 0,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(),
  unique (programme_id, slug)
);

create table courses (
  id uuid primary key default gen_random_uuid(),
  department_id uuid not null references departments(id) on delete cascade,
  name text not null, slug text not null, level int,
  description text, intro text, faq jsonb not null default '[]',
  og_image_url text, seo_title text, seo_description text,
  published boolean not null default true,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(),
  unique (department_id, slug)
);

create table modules (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references courses(id) on delete cascade,
  module_number int not null, title text,
  unique (course_id, module_number)
);

create table units (
  id uuid primary key default gen_random_uuid(),
  module_id uuid not null references modules(id) on delete cascade,
  course_id uuid not null references courses(id) on delete cascade,
  name text not null, slug text not null, unit_code text,
  description text, intro text, faq jsonb not null default '[]',
  og_image_url text, seo_title text, seo_description text,
  canonical_unit_id uuid references units(id) on delete set null,
  published boolean not null default true,
  created_at timestamptz not null default now(), updated_at timestamptz not null default now(),
  unique (course_id, slug)
);

create table resources (
  id uuid primary key default gen_random_uuid(),
  unit_id uuid not null references units(id) on delete cascade,
  type resource_type not null default 'other',
  title text, file_url text not null, year int,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

create index on units using gin (name gin_trgm_ops);
create index on courses using gin (name gin_trgm_ops);
create index on units (course_id);
create index on resources (unit_id);

create table admins (user_id uuid primary key references auth.users(id) on delete cascade);

create function public.is_admin() returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.admins where user_id = auth.uid())
$$;

create function public.touch_updated_at() returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end $$;

do $$
declare t text;
begin
  foreach t in array array['programmes','departments','courses','units'] loop
    execute format('create trigger touch before update on %I for each row execute function touch_updated_at()', t);
  end loop;
  foreach t in array array['programmes','departments','courses','modules','units','resources'] loop
    execute format('alter table %I enable row level security', t);
    execute format('create policy "admin write" on %I for all using (public.is_admin()) with check (public.is_admin())', t);
  end loop;
  foreach t in array array['programmes','departments','modules','resources'] loop
    execute format('create policy "public read" on %I for select using (true)', t);
  end loop;
end $$;

create policy "public read published" on courses for select using (published or public.is_admin());
create policy "public read published" on units   for select using (published or public.is_admin());

alter table admins enable row level security;
create policy "read own" on admins for select using (user_id = auth.uid());

-- Authors (E-E-A-T Profiles & Reviewers)
create table authors (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete set null,
  name text not null,
  slug text not null unique,
  role_title text not null,
  bio text not null,
  avatar_url text,
  social_links jsonb not null default '{}',
  is_verified boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Articles / Blog Posts (News, Circulars & Revision Guides)
create type article_category as enum (
  'exam_news',
  'revision_guide',
  'course_spotlight',
  'curriculum_update'
);

create table articles (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null references authors(id) on delete restrict,
  title text not null,
  slug text not null unique,
  excerpt text not null,
  content text not null,
  category article_category not null default 'revision_guide',
  source_name text,
  source_url text,
  is_official_source boolean not null default false,
  featured_image_url text,
  featured_image_alt text,
  is_cover_mockup boolean not null default false,
  published boolean not null default false,
  noindex boolean not null default false,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index on articles (category);
create index on articles (published, published_at desc);
create index on articles (author_id);
create index on authors (slug);

create trigger touch before update on authors for each row execute function touch_updated_at();
create trigger touch before update on articles for each row execute function touch_updated_at();

alter table authors enable row level security;
alter table articles enable row level security;

create policy "public read authors" on authors for select using (true);
create policy "admin write authors" on authors for all using (public.is_admin()) with check (public.is_admin());

create policy "public read published articles" on articles for select using (published or public.is_admin());
create policy "admin write articles" on articles for all using (public.is_admin()) with check (public.is_admin());
