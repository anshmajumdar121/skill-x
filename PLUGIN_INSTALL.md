# Plugin Install

This repo also works as a **Claude Code plugin marketplace** and
a **Codex plugin** so users can install individual skills with
one command instead of manual `cp -r`.

## Claude Code (plugin marketplace)

```bash
# Inside Claude Code, add this repo as a marketplace
/plugin marketplace add anshmajumdar/skill-x

# Install all skills as a managed plugin
/plugin install skill-x@skill-x

# Or install just one
/plugin install think-like-gpt-5-6@skill-x
/plugin install super-skill@skill-x

# Pull future updates
/plugin marketplace update skill-x
```

The skills then appear namespaced under the plugin (for example,
`/skill-x:super-skill`).

The marketplace manifest lives at
[`.claude-plugin/marketplace.json`](.claude-plugin/marketplace.json).

## Codex CLI (plugin)

```bash
# Codex reads the .codex-plugin/ directory automatically when
# this repo is loaded as a plugin source.
codex plugin install anshmajumdar/skill-x

# Or point Codex at a local checkout
codex plugin install /path/to/skill-x
```

The plugin manifest lives at
[`.codex-plugin/plugin.json`](.codex-plugin/plugin.json).

## OpenCode

OpenCode supports skills via `.opencode/skills/` (project) or
`~/.config/opencode/skills/` (user). The simplest install is a
copy:

```bash
# Project-level
mkdir -p .opencode/skills
cp -r skills/* .opencode/skills/

# User-level
mkdir -p ~/.config/opencode/skills
cp -r skills/* ~/.config/opencode/skills/
```

OpenCode does not currently use the `.claude-plugin/` or
`.codex-plugin/` manifests; the manual `cp -r` is the path until
OpenCode ships a marketplace pattern.

## GitHub Copilot / VS Code

Copilot reads skills from `.github/skills/` in the project root or
from the user-level skills directory configured in VS Code:

```bash
# Project-level
mkdir -p .github/skills
cp -r skills/* .github/skills/
```

## Generic `npx skills` install (Vercel's CLI)

```bash
npx skills@latest add anshmajumdar/skill-x --skill super-skill
npx skills@latest add anshmajumdar/skill-x --skill think-like-gpt-5-6
```

## Manual install (any agent)

```bash
# Pick your agent's skills directory
SKILLS_DIR=~/.mavis/agents/mavis/skills   # mavis
# SKILLS_DIR=~/.claude/skills              # Claude Code user
# SKILLS_DIR=~/.codex/skills              # Codex user
# SKILLS_DIR=~/.config/opencode/skills    # OpenCode user

# Install all
for d in skills/*/; do
  cp -r "$d" "$SKILLS_DIR/"
done

# Or just one
cp -r skills/super-skill "$SKILLS_DIR/"
```

## Why both manual and plugin paths?

The plugin / marketplace paths give you **versioning, updates, and
managed installation** — but they require the target agent to
support plugins. The manual `cp -r` path works on every agent
that scans a `skills/` directory, which is essentially all of
them as of 2026. We document both so the same repo serves the
full range of agent frameworks.
