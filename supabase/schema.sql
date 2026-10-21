create table questions (
  id text primary key,
  topic text not null,
  subtopic text,
  difficulty text,
  question text not null,
  options jsonb not null,
  correct text not null,
  explanations jsonb not null,
  african_example text
);

create table attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users,
  question_id text references questions(id),
  chosen text not null,
  is_correct boolean not null,
  answered_at timestamptz default now()
);