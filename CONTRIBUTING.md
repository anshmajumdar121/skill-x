# Contributing to skill-x

Thanks for your interest. This collection aims to be a small, sharp
set of agent skills — easy to install, easy to reason about, easy to
extend.

## Quick rules

1. **Each skill is self-contained.** It must work without any other
   file in this repo. If your change requires another skill's
   content, copy the relevant content into your skill (with
   attribution).
2. **`SKILL.md` is the front matter.** Keep it under 500 lines.
   Bulk content goes into `references/*.md`.
3. **Lint passes required.** Run `./scripts/lint-all.sh` before
   opening a PR. CI will fail otherwise.
4. **No network calls at runtime.** Skills are static markdown.
5. **No personal data, no project-specific content.** Skills are
   shared across users.
6. **No new dependencies.** The only runtime dep is the lint
   script in `.mavis/`.

## Adding a new skill

1. Create `skills/<your-skill>/SKILL.md` with valid frontmatter
   (`name`, `description`).
2. Add `references/` for any bulk content. Each `references/*.md`
   should be linkable from `SKILL.md`.
3. Run `./scripts/lint-all.sh`. Fix any errors.
4. Add a one-line entry to the **Skills at a Glance** table in
   `README.md`.
5. Add a one-line entry to the **"How They Fit Together"** diagram
   (if your skill is for a new category).
6. Open a PR with the title format: `skill: <your-skill> — <one-line
   summary>`.

## Modifying an existing skill

1. Make the change in the skill's directory.
2. If the change is significant (a new section, a new risk row, a
   corrected number), update the skill's own `references/` docs to
   match.
3. Run `./scripts/lint-all.sh`.
4. Open a PR.

For `super-skill` specifically: the skill is **self-evolving** under
its own 7-clause constitution. If your PR changes
`super-skill/`, the constitution gates apply. Add a changelog row
to the top of `super-skill/SKILL.md`.

## Style

- Use H2 (`##`) for top-level sections in `SKILL.md`, H3 (`###`)
  for sub-sections.
- Tables over bullet lists when the data is tabular (rows and
  columns of comparable items).
- Code references in backticks (`SKILL.md`,
  `mavis skill list`, etc.).
- One topic per reference file. Don't combine "principles" and
  "task profiles" in one file.
- Active voice, present tense. "Apply the framework", not "The
  framework should be applied".

## Reporting issues

For skill bugs, missing triggers, or unclear descriptions: open an
issue. For security issues: see [SECURITY.md](SECURITY.md).

## License

By contributing, you agree your contributions are licensed under
the project's MIT license.
