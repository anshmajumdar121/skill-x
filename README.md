
![Skill X](media/skill-x.gif)

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/skills-4-purple.svg)](#skills-at-a-glance)
[![Self-evolving](https://img.shields.io/badge/super--skill-self--evolving-brightgreen.svg)](skills/super-skill/references/self-evolution.md)
[![English](https://img.shields.io/badge/English-Read-2b2b2b)](README.md) [![Español](https://img.shields.io/badge/Espa%C3%B1ol-Read-e67e22)](README.es.md) [![Português](https://img.shields.io/badge/Portugu%C3%AAs-Read-27ae60)](README.pt.md) [![日本語](https://img.shields.io/badge/日本語-Read-16a085)](README.ja.md) [![한국어](https://img.shields.io/badge/한국어-Read-2980b9)](README.ko.md) [![Deutsch](https://img.shields.io/badge/Deutsch-Read-8e44ad)](README.de.md) [![Français](https://img.shields.io/badge/Fran%C3%A7ais-Read-2c3e50)](README.fr.md) [![Türkçe](https://img.shields.io/badge/T%C3%BCrk%C3%A7e-Read-c0392b)](README.tr.md) [![繁體中文](https://img.shields.io/badge/繁體中文-Read-d35400)](README.zh-Hant.md) [![简体中文](https://img.shields.io/badge/简体中文-Read-e74c3c)](README.zh-Hans.md) [![Русский](https://img.shields.io/badge/Русский-Read-7f8c8d)](README.ru.md)


A small, composable collection of agent skills for code, research, and
multi-agent orchestration. Each skill is self-contained, evidence-based,
and ships with progressive-disclosure reference docs.

> Built by [anshmajumdar](https://github.com/anshmajumdar121). Skills
> refined from public research, the GPT-5.6 Sol execution
> blueprint, and the [BuilderIO/skills](https://github.com/BuilderIO/skills)
> collection.

## Quick Start

```bash
# Clone the repo
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# Pick a skill to install (manual copy)
cp -r skills/think-like-gpt-5-6   ~/.mavis/agents/<your-agent>/skills/
cp -r skills/efficient-fable      ~/.mavis/agents/<your-agent>/skills/
cp -r skills/skill-zero           ~/.mavis/agents/<your-agent>/skills/
cp -r skills/super-skill          ~/.mavis/agents/<your-agent>/skills/

# Or install all of them
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Verify they registered
mavis skill list
```

> Replace `<your-agent>` with your agent name (e.g., `mavis`,
> `claude`, `codex` — wherever your skills live).

## Skills at a Glance

| Skill | Lines | What it does |
|---|---|---|
| [`think-like-gpt-5-6`](skills/think-like-gpt-5-6/SKILL.md) | 1,547 | Full rigor framework: 7-step loop, 10 principles, 20-row risk register, 8 validation layers, 6 acceptance + 10 rejection criteria, 18 adversarial review questions, 7-section pre-delivery checklist. Best for any non-trivial task. |
| [`efficient-fable`](skills/efficient-fable/SKILL.md) | 302 | Delegation pattern: orchestrator + cheap subagents. 5-step pattern, handoff packet format, vetting protocol, 3-5× cheaper + 2-4× faster on parallelizable work. |
| [`skill-zero`](skills/skill-zero/SKILL.md) | 1,598 | Specialist: linear probes on the residual stream of coding-agent LLMs. Decode current program properties (well-formedness, full/partial correctness, regression) and predict future edit outcomes up to ~25 steps ahead. Built on Silva, Tu & Monperrus 2026 (arXiv:2607.05188). |
| [`super-skill`](skills/super-skill/SKILL.md) | 2,096 | Rigor + delegation synthesis. Two modes (rigor / delegation), mode-selection flow, vetting protocol, 5 delegation-specific risks. **Self-evolving** under a 7-clause constitution. |

### When to use which skill

- **I have a non-trivial task and want auditable artifacts.**
  → `think-like-gpt-5-6`
- **I have codebase-heavy work that can be parallelized and I want
  to save tokens.** → `efficient-fable`
- **I want to monitor / steer a coding agent's internal state
  (mechanistic interpretability).** → `skill-zero`
- **I want both rigor AND delegation efficiency, in one skill.**
  → `super-skill`
- **I want a skill that improves itself over time, with hard
  guardrails against garbage.** → `super-skill` (the only one
  with the self-evolution protocol)

## Skill Details

### `/think-like-gpt-5-6`

Apply the GPT-5.6 Sol execution-intelligence framework. Convert an
imperfect request into a validated, auditable deliverable through the
**7-step loop**: Observe → Interpret → Decide → Act → Verify →
Repair → Record. Backed by the **10 governing principles**, the
**9-stage architecture**, a **20-row risk register**, **6 acceptance
+ 10 rejection criteria**, an **18-question adversarial review**, and
a **7-section pre-delivery checklist**.

Best for: multi-step coding, research with citations, artifact
creation, operational actions, high-stakes guidance, and any task
where you want inspectable reasoning rather than a fluent black-box
answer.

Read more: [skills/think-like-gpt-5-6/SKILL.md](skills/think-like-gpt-5-6/SKILL.md)

### `/efficient-fable`

Use a high-cost frontier model as the **orchestrator, architect,
synthesizer, and final judge**. Use cheaper subagents for the
**bounded heavy lifting** (large repo scans, long log reduction,
narrow code patches, browser/test verification). The
**vetting protocol** says: *treat subagent reports as leads, not
facts* — always reopen the cited file, confirm the line ref, and
review the diff before shipping.

The **5-step delegation pattern**: name the expensive risk → split
into parallel slices → use cheap agents for the heavy work → ask for
concise evidence → spend orchestrator tokens on the decision layer.

Best for: codebase-heavy work that can be sliced into independent
parallel pieces. Skip for trivial tasks, high-stakes single-source
work, or when no cheap subagents are available.

Read more: [skills/efficient-fable/SKILL.md](skills/efficient-fable/SKILL.md)

### `/skill-zero`

Specialist in **mechanistic interpretability of coding-agent LLMs**
via linear probes on the residual stream. Based on Silva, Tu &
Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)).

The skill teaches you how to:

- **Predict edit outcomes** before they hit disk. Train a logistic
  regression probe on hidden states to read off whether the about-to-
  be-written edit will introduce a regression (◆ Regression
  property) or fail tests (● Full Correctness).
- **Tell whether the agent is making progress** mid-trajectory.
  ■ Partial Correctness probe reads the agent's confidence about
  test-passing direction from its hidden states (AUC ~0.84 in the
  paper).
- **See ~25 steps into the agent's plan.** The "latent programming
  horizon" finding: a probe can flag, several steps ahead, that the
  trajectory is heading toward a failing state.

The skill includes the paper's specific numbers (AUC 0.83, horizon
k≈25, mid-layer inverted-U pattern), the 4 canonical properties, the
shuffled-label control discipline, the cross-benchmark transfer
detail, and 5 concrete failure modes.

Read more: [skills/skill-zero/SKILL.md](skills/skill-zero/SKILL.md)

### `/super-skill`

The synthesis: **rigor + delegation** in one skill. Two operating
modes:

- **Rigor mode** (default) — use the GPT-5.6 Sol 7-step loop, 10
  principles, 9-stage architecture, task classification, risk
  register, validation layers, acceptance/rejection criteria,
  adversarial review, and pre-delivery checklist.
- **Delegation mode** — for codebase-heavy or token-heavy work that
  can be split into independent parallel slices, use the Efficient
  Fable delegation pattern with the vetting protocol.

The mode is selected during intake. The skill also includes **5
delegation-specific risks** (R-D1 through R-D5), a 9th test
(**T-09: subagent report vetting**), and the vetting protocol built
into the test matrix.

**Self-evolving.** The skill can grow, improve, and prune itself
over time, under a strict internal **7-clause constitution** that
prevents garbage. The constitution (in
`skills/super-skill/references/self-evolution.md`):

- **C-1** Evidence-based — every change must cite a paper, official
  doc, code link, or verified observation
- **C-2** Bounded scope — only rigor + delegation frameworks, not
  user projects
- **C-3** Conservative — no speculative additions
- **C-4** Quality floor — new content must be at least as good as
  what it replaces
- **C-5** Reversible — every change has a changelog row
- **C-6** No-garbage filter — reject vague filler
- **C-7** Privacy — no personal data, no project-specific content

Any single clause failing = reject the change. No exceptions.

Read more: [skills/super-skill/SKILL.md](skills/super-skill/SKILL.md)

## How They Fit Together

<div align="center">

```
        ┌────────────────────────────────┐
        │       user task arrives        │
        └───────────────┬────────────────┘
                         │
                         ▼
           ┌────────────────────────┐
           │ what kind of task?     │
           └────────┬───────────────┘
     ┌───────────────────┼────────────────────────┐
     │                   │                        │
general task     code-anything          I have multiple
     │            with hidden           agents + I want
     │            state access         a meta-framework
     ▼                   │                        │
┌─────────────────┐      ▼                        ▼
│ think-like-     │   ┌─────────────┐   ┌──────────────────┐
│ gpt-5-6         │   │ skill-zero  │   │  super-skill     │
│                 │   │             │   │  (rigor+deleg.,  │
│ 7-step loop     │   │ linear      │   │   self-evolving) │
│ 10 principles   │   │ probes on   │   │                  │
│ risk register   │   │ hidden      │   └──────────────────┘
│ validation      │   │ states      │            │
└────────┬────────┘   └─────────────┘            │
         │                                        │
         └──────────────────┬─────────────────────┘
                             │
                             ▼
                ┌─────────────────────┐
                │ efficient-fable     │
                │ (delegation pattern)│
                │                     │
                │ 5-step pattern,     │
                │ handoff packets,    │
                │ vetting protocol    │
                └─────────────────────┘
                             ▲
                             │
          used inside super-skill in delegation mode
          used standalone for token-heavy parallel work
```

</div>

`super-skill` is the recommended default for most complex tasks. It
contains:

- The full TLG rigor framework (as the outer loop)
- The Efficient Fable delegation pattern (as a fast lane)
- The self-evolution protocol (with the 7-clause constitution)

The other three skills remain available for their specific
triggers.

## Install

The skills are designed to be dropped into any agent's skills
directory. There are three install paths — pick whichever your
agent supports.

### Path A — Plugin / marketplace install (recommended)

This repo ships as a **Claude Code plugin marketplace** and a
**Codex plugin** so you can install with one command:

```bash
# Claude Code
/plugin marketplace add anshmajumdar/skill-x
/plugin install skill-x@skill-x

# Codex
codex plugin install anshmajumdar/skill-x

# Or generic npx (Vercel's skills CLI)
npx skills@latest add anshmajumdar/skill-x --skill super-skill
```

See [PLUGIN_INSTALL.md](PLUGIN_INSTALL.md) for the full per-agent
install matrix (Claude Code, Codex, OpenCode, Copilot, plus the
generic `cp -r` fallback).

### Path B — Manual install (works for any agent)

```bash
# Clone
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# Install one
cp -r skills/super-skill ~/.mavis/agents/<your-agent>/skills/

# Install all
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Verify
mavis skill list
```

### Per-agent install paths

| Agent | Skills path | Plugin? |
|---|---|---|
| mavis | `~/.mavis/agents/<name>/skills/` | n/a |
| Claude Code | `~/.claude/skills/` (user) or `.claude/skills/` (project) | yes — `.claude-plugin/marketplace.json` |
| Codex CLI | `~/.codex/skills/` (user) or `.codex/skills/` (project) | yes — `.codex-plugin/plugin.json` |
| OpenCode | `~/.config/opencode/skills/` (user) or `.opencode/skills/` (project) | manual only |
| GitHub Copilot | `.github/skills/` (project) or VS Code user dir | manual only |

### Verify a skill installed correctly

```bash
# Lint a single skill
node $(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)/scripts/lint-skill.js skills/super-skill/

# Lint all skills in this repo
./scripts/lint-all.sh
```

## Self-Evolution (only on `/super-skill`)

<br>

![Self-evolving: detect, evidence, constitution check, apply, verify](media/banner.png)

<br>

`super-skill` is the only skill that evolves itself. The protocol
lives in
[`skills/super-skill/references/self-evolution.md`](skills/super-skill/references/self-evolution.md).
Triggers:

- **Explicit**: "evolve this skill", "superskill evolve"
- **Stale-content detection**: a specific number, link, or claim
  is demonstrably out of date
- **Better-technique detection**: a clearly better technique
  becomes available
- **Garbage-content detection**: a section no longer earns its place

The 5-step procedure: Detect → Evidence → Constitution check
(all 7 clauses) → Apply → Verify (re-lint). The changelog at the
top of `super-skill/SKILL.md` records every change.

## Contributing

We welcome contributions. See [CONTRIBUTING.md](CONTRIBUTING.md) for
the workflow, and the in-skill **self-evolution protocol** for
guidance on the quality bar. The short version:

1. Each skill is self-contained. Keep it that way.
2. Reference docs are progressive disclosure — `SKILL.md` is the
   front matter, `references/*.md` is the detail.
3. Lint passes required: `./scripts/lint-all.sh`.
4. No external network calls at runtime. Skills are static markdown.
5. No personal data, no project-specific content.

## How the Skills Were Built

| Skill | Source | Synthesized |
|---|---|---|
| `think-like-gpt-5-6` | GPT-5.6 Sol Execution-Intelligence Blueprint (v1.0, 2026-07-16) | distilled into 7-step loop, 10 principles, 9-stage architecture, 20-row risk register |
| `efficient-fable` | [BuilderIO/skills](https://github.com/BuilderIO/skills/tree/main/skills/efficient-fable) | retweaked: generalized beyond Fable, added when-NOT-to-use, cross-referenced to the rest of the collection |
| `skill-zero` | Silva, Tu, Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)) | extracted the linear-probe methodology, 4 canonical properties, expected AUC numbers, 5 failure modes |
| `super-skill` | synthesis of `think-like-gpt-5-6` + `efficient-fable` | added 5 delegation risks, mode-selection flow, vetting protocol, 9th test T-09, self-evolution protocol with 7-clause constitution |

## License

MIT. See [LICENSE](LICENSE).

## Pointers

- [PLUGIN_INSTALL.md](PLUGIN_INSTALL.md) — full per-agent install matrix (Claude Code, Codex, OpenCode, Copilot, manual)
- [CONTRIBUTING.md](CONTRIBUTING.md) — how to add or modify a skill
- [LICENSE](LICENSE) — MIT
- [SECURITY.md](SECURITY.md) — how to report a security issue
- [CITATION.cff](CITATION.cff) — how to cite this collection
- [.github/workflows/lint-skills.yml](.github/workflows/lint-skills.yml) — CI that lints every skill
- [scripts/lint-all.sh](scripts/lint-all.sh) — local equivalent
- [.claude-plugin/marketplace.json](.claude-plugin/marketplace.json) — Claude Code plugin manifest
- [.codex-plugin/plugin.json](.codex-plugin/plugin.json) — Codex plugin manifest

---

Built with rigor + delegation + a 7-clause constitution. Star if
useful.
