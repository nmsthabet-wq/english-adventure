
-- Run in Supabase SQL Editor. Enable Anonymous Sign-ins in Authentication settings.
create table if not exists public.students (
 user_id uuid primary key references auth.users(id) on delete cascade,
 full_name text not null check (char_length(full_name) between 2 and 70),
 grade text not null default '1',
 section text not null,
 created_at timestamptz not null default now()
);
create table if not exists public.progress (
 user_id uuid not null references auth.users(id) on delete cascade,
 unit_id integer not null check (unit_id between 1 and 9),
 level integer not null check (level between 1 and 3),
 best_score integer not null check (best_score between 0 and 10),
 updated_at timestamptz not null default now(),
 primary key (user_id,unit_id,level)
);
create table if not exists public.teachers (
 user_id uuid primary key references auth.users(id) on delete cascade
);
alter table public.students enable row level security;
alter table public.progress enable row level security;
alter table public.teachers enable row level security;
create policy "Students see own profile" on public.students for select to authenticated using (auth.uid()=user_id);
create policy "Students insert own profile" on public.students for insert to authenticated with check (auth.uid()=user_id);
create policy "Students update own profile" on public.students for update to authenticated using (auth.uid()=user_id) with check (auth.uid()=user_id);
create policy "Students see own scores" on public.progress for select to authenticated using (auth.uid()=user_id);
create policy "Students insert own scores" on public.progress for insert to authenticated with check (auth.uid()=user_id);
create policy "Students update own scores" on public.progress for update to authenticated using (auth.uid()=user_id) with check (auth.uid()=user_id);
create policy "Teachers see their membership" on public.teachers for select to authenticated using (auth.uid()=user_id);
create policy "Teachers see students" on public.students for select to authenticated using (exists(select 1 from public.teachers where user_id=auth.uid()));
create policy "Teachers see progress" on public.progress for select to authenticated using (exists(select 1 from public.teachers where user_id=auth.uid()));
-- After creating a teacher account in Authentication, add its UUID using SQL editor:
-- insert into public.teachers(user_id) values ('TEACHER_AUTH_USER_UUID');
-- IMPORTANT: Student-side scoring is for formative practice, not tamper-proof examinations.
