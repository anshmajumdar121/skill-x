# Changelog

All notable changes to this collection are documented here. Skills
have their own internal changelogs where applicable (e.g.,
`super-skill`'s self-evolution changelog).

## [1.0.0] — 2026-07-17

### Added
- `think-like-gpt-5-6` skill (1,547 lines) — full rigor framework
  distilled from the GPT-5.6 Sol Execution-Intelligence Blueprint
- `efficient-fable` skill (302 lines) — retweaked for the
  collection; generalizes the orchestrator role beyond Claude
  Fable and adds when-NOT-to-use
- `skill-zero` skill (1,598 lines) — specialist in mechanistic
  interpretability of coding-agent LLMs via linear probes,
  distilled from arXiv:2607.05188
- `super-skill` skill (2,096 lines) — rigor + delegation synthesis
  with a self-evolution protocol under a 7-clause constitution
- `scripts/lint-all.sh` — local equivalent of the CI lint
- `.github/workflows/lint-skills.yml` — CI that lints every skill
  on push and PR
- `README.md` — the main entry point
- `CONTRIBUTING.md`, `LICENSE` (MIT), `SECURITY.md`, `CITATION.cff`
- `media/banner.svg` — repo banner

### Notes
- `super-skill` is the only self-evolving skill in the collection.
  Its self-evolution protocol uses a 7-clause constitution to
  prevent garbage changes.
- All skills pass the mavis skill linter (8 checks each).
- All skills are self-contained — no cross-file dependencies on
  files outside their own directory.
