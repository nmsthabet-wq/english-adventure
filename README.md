# English Adventure — Grade 1 / Term 1

Starter website for مدرسة كدرة رياض والحلقة الاولى والثانية والثالثة بنات
Teacher: Noor Mohamed AlQaydi

## Included
- 9 curriculum units (curriculum.json)
- Vocabulary station with Arabic meanings, provisional emoji illustrations and browser text-to-speech
- 3 sequential 10-question levels per unit; 7/10 to unlock the next
- Question pool assembled from curriculum vocabulary, letters, meanings and approved sample sentences; shuffled questions and answer choices
- Local browser progress; optional Supabase anonymous authentication and cloud progress
- Teacher email/password login and protected CSV progress dashboard
- Printable bilingual participation certificate (browser Print → Save as PDF)

## Run locally
Use a local HTTP server, not file://.
`python -m http.server 8000`
Open `http://localhost:8000`.

## Supabase setup
1. Create a Supabase project. In Authentication > Providers, enable **Anonymous Sign-ins**. Configure email/password authentication for the teacher.
2. Run `supabase-schema.sql` in SQL Editor. If running the schema more than once, review existing policies first.
3. Copy Project URL and **publishable/anon key** (never the service_role/secret key) into `config.js`.
4. Create a teacher account through Supabase Authentication, then insert its auth user UUID in the `teachers` table using SQL Editor. Do not expose teacher email/password in source code.
5. Use separate test accounts to confirm students cannot see other students' records.

## GitHub Pages
1. Create a GitHub repository, upload all files from this folder to its root.
2. Settings → Pages → Build and deployment → Deploy from a branch → main → /(root) → Save.
3. Wait for the published HTTPS URL and test it. The application is a static client with Supabase as its backend.

## Important limitations / next steps before school-wide deployment
- This is a **functional starter**, not a completed school production system. Official Meethaq artwork is not included: replace emoji with licensed/approved image assets supplied by the school.
- The image cards currently use emoji placeholders; replace with clear reviewed illustrations for reliable picture-based questions.
- Question bank sizes vary with each unit; some distractors and sentence-ordering tasks need teacher review. No guarantee of 30 distinct high-quality questions per level from the provided limited vocabulary.
- Teacher content editing, question import, visit counter, GA4 analytics, unique certificate IDs, server-side certificate issuing, cross-device student login and a secure student identity recovery mechanism are **not implemented**.
- Anonymous accounts are bound to a browser session; deleting site storage or changing devices can lose access to cloud progress. A student name and section are **not** secure identifiers.
- Progress is checked on the client and can be manipulated by a technical user; use a server-side assessment service for high-stakes scoring.
- For minors, obtain school privacy approval and define retention/deletion policies before collecting personal data. Avoid including student names in GA4.
- Do not publish real student data or private school assets in a public GitHub repository.

## Content note
The 9 units follow the user's visual unit numbering. The SOW PDF labels the final three topics as weeks 8, 9 and 10. Phonics and sight words are from the supplied SOW, with a simplified phonics list in this starter.
