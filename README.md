# English Learning Hub — V3 preview

Grades 1 & 2, Term 1 (2026–2027). Original supplied book-cover images and Meethaq group artwork are included under `assets/`.

## Deploy on the existing GitHub Pages site
1. Unzip the archive.
2. Open `https://github.com/nmsthabet-wq/english-adventure` → **Add file → Upload files**.
3. Upload the **contents** of the unzipped folder, including the `assets` directory, to the repository root. Replace `index.html`, `app.js`, `style.css`, and `config.js`. `grade1.json` and `grade2.json` are new files.
4. Commit changes. Wait for the Pages deployment; reload with Ctrl+Shift+R.
5. Do not delete the previous `curriculum.json` or `supabase-schema.sql` until cloud migration is planned.

## Important limitations (do not use for real student records yet)
- Student names, scores, and progress in this preview are stored **only in the browser**. They do not sync across devices and can be cleared. Use fictional student names for testing.
- The old Grade 1 Supabase schema does **not** support Grade 2 identifiers or the 100-point tests. The schema is intentionally not auto-migrated. Do not assume the cloud is connected.
- Visitor count is a dash until a privacy-reviewed counter is configured. Never use fabricated visitor counts.
- The 100-mark tests are formative multiple-choice practice (25 questions × 4 marks); they do **not** yet measure independent writing or human-graded dictation. The exact curriculum mapping and assessment rubric need teacher review before official use.
- Where a word lacks a verified illustration, the interface displays the written word instead of a misleading emoji. Custom word images are still needed for a complete illustrated bank.
- Browser speech synthesis is used for audio and requires a device with English voice support.
- Test models draw randomized questions from the same curriculum bank; questions are unique within each attempt, but separate tests may overlap. Distinct non-overlapping fixed forms require a larger reviewed bank.
- Progress is tracked per browser/grade/unit, not securely per individual student. The local profile does not authenticate users.

## Quick local test
From this folder run `python -m http.server 8000`, then visit `http://localhost:8000`.

## Before launch to children
Implement secure authenticated student identities and teacher access; update Supabase schema with `grade` and assessment tables and row-level security; validate content, images, and scoring; obtain school approval for collecting student data and analytics. Never put a Supabase service-role key in browser code.
