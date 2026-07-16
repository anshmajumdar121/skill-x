# Self-Evolution Protocol

The full protocol for the SuperSkill to grow, improve, and prune itself
over time. Designed so the skill improves **automatically** but
**only legitimate improvements** — never garbage.

> Front-matter summary is in `SKILL.md` §"Self-Evolution Protocol".
> This file is the operational spec.

## 1. The 7-Clause Constitution (hard gates)

Every change must pass all 7 clauses. Any failure = reject.

### C-1: Evidence-based

A change must cite at least one of:

- A peer-reviewed paper, arXiv preprint, or official specification
- An official documentation page from the maintainer of a tool/library
- A code link (commit SHA, PR, repo file) showing the new state
- A verified measurement or observation (with the test/command that
  produced it)
- A direct user instruction (the user asked for this change)

What does NOT count as evidence:
- "I think this is better" / "this feels more useful"
- Vague recollection of a blog post
- Speculative future scenarios
- "Common knowledge" without a source

### C-2: Bounded scope

Allowed change zones:
- The 10 governing principles (modify only if a better principle is documented)
- The 7-step loop (steps are stable; descriptions can be sharpened)
- The 9-stage architecture (stable; descriptions can be sharpened)
- The 20-row risk register (rows can be added, updated, removed)
- The 8 failure playbooks (can be added, updated, removed)
- The 6 acceptance + 10 rejection criteria (can be added, updated, removed)
- The 18 adversarial review questions (can be added, updated, removed)
- The 8-layer validation (can be added, updated, removed)
- The 8 task profiles (can be added, updated, removed)
- The 5 delegation patterns (can be added, updated, removed)
- Anti-patterns (can be added, updated, removed)

Disallowed change zones:
- The frontmatter `name` (rename, not evolution)
- The frontmatter `description` trigger surface (only widen/narrow with strong evidence)
- The 10 governing principles' fundamental identity (each principle is fixed; wording can be tightened)
- The Self-Evolution section itself
- The constitution
- The changelog
- Any reference file's *existence* (files can be shrunk to 1 line, but not deleted, to preserve the audit trail)

### C-3: Conservative

A change must have a concrete trigger. Allowed triggers:
- A specific outdated fact (with the new fact and source)
- A specific new technique (with the source)
- A specific garbage section (with the reason)
- An explicit user instruction

What does NOT count as a trigger:
- "It might be useful someday"
- "This could be a nice-to-have"
- "The skill would be more complete with..."
- Personal preference without evidence

### C-4: Quality floor

New content must be at least as good as what it replaces. The test:
- Is it as **specific**? (concrete numbers, file paths, command names
  > abstract "you should consider...")
- Is it as **actionable**? (a procedure > a description of a
  procedure)
- Is it as **verifiable**? (something you can check > something you
  can only believe)
- Is it as **non-redundant**? (doesn't duplicate existing content)
- Is it as **concise**? (every line earns its place)

If the new content is *worse* on any of these axes, reject the
change. The bar is "as good or better", not "good enough".

### C-5: Reversible

Every change must be recoverable. The mechanisms:
- Changelog row with date, class, summary, evidence, diff
- Skill directory under git (recommended; mavis skill paths are in
  the home dir which may already be in a git-tracked parent)
- Never overwrite a section without the previous version in the
  changelog

If a change is later found to be wrong, the rollback procedure (§5)
must restore the prior state exactly.

### C-6: No-garbage filter

Reject any change that:
- Adds vague filler ("It's important to think carefully about...")
- Adds content already in the skill
- Adds content that doesn't earn its place (an obscure edge case
  with no real-world trigger)
- Adds content that contradicts the 10 governing principles
- Adds content with no evidence
- Edits in personal voice, jokes, or stylistic flourishes that don't
  aid clarity
- Introduces new jargon without defining it

The "garbage test": would removing this content make the skill worse
for a real user doing a real task? If no, it's garbage.

### C-7: Privacy

Reject any change that:
- Adds personal data (names, emails, locations, project names) of any
  identifiable person
- Adds project-specific content that could leak into unrelated tasks
- Adds content that quotes private conversations or files
- Adds content that could only have come from a specific user's
  context (not a generalizable pattern)

The skill is shared across all users/tasks; it must be safe to load
for anyone.

## 2. Update Classes (what the protocol can do)

### 2.1 ADD
Insert new content. Must have a concrete trigger. Quality floor
applies against the empty space (so the bar is "useful new addition",
not "marginal addition").

### 2.2 UPDATE
Replace content with a newer equivalent. The diff must be a strict
improvement on the quality axes (C-4).

### 2.3 REMOVE
Delete content that no longer earns its place. Must cite why the
content is now wrong / outdated / superseded / unused. The
changelog row must record what was removed (in case rollback is
needed).

### 2.4 REORDER
Move content for clarity without changing substance. Rarely used; only
when the new order materially improves usability. No content can be
both added and reordered in the same change.

## 3. Evidence Formats

For each change, the changelog row must include the evidence in one
of these forms:

### 3.1 Paper / arXiv
```
arXiv:NNNN.NNNNN  (Authors, Year, Title)
```

### 3.2 Official documentation
```
https://docs.<tool>.io/path#section  (last verified YYYY-MM-DD)
```

### 3.3 Code reference
```
https://github.com/<org>/<repo>/blob/<sha>/<path>
```

### 3.4 Measurement
```
$ <command>
<output>
Measured on YYYY-MM-DD on <system>
```

### 3.5 User instruction
```
User said: "<exact quote>"
Date: YYYY-MM-DD
```

If the evidence is not in one of these forms, the change fails C-1.

## 4. Procedure (5 steps, repeated for every change)

1. **Detect.** A trigger fires (one of the 4 in SKILL.md §"When
   self-evolution activates"). Identify:
   - Class (ADD / UPDATE / REMOVE / REORDER)
   - Target (which section / row / question)
   - The new content (or the deletion instruction)

2. **Evidence.** Write down the evidence in one of the 5 formats
   (§3). If no evidence, **stop**. Log the rejection in the
   changelog with reason "no evidence (C-1, C-3)".

3. **Constitution check.** Walk all 7 clauses. For each clause,
   answer pass / fail with one sentence of justification. Any fail
   = reject. Log the rejection with the failing clause number.

4. **Apply.** Make the change to the file. Write the changelog row
   at the top of SKILL.md BEFORE making the change (so the previous
   state is recorded even if the change fails mid-way).

5. **Verify.** Re-lint:
   ```
   SKILL_DIR=$(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)
   node "$SKILL_DIR/scripts/lint-skill.js" /Users/anshmajumdar/.mavis/agents/mavis/skills/super-skill/
   ```
   If lint fails, **roll back** (revert the file to its pre-change
   state from the changelog) and log the failure.

## 5. Rollback Procedure

If a change is later found to be wrong, or if the verify step fails:

1. Read the changelog to find the change being reverted.
2. Re-apply the previous content (the "before" state from the
   changelog row).
3. Update the changelog: add a "Reverted on YYYY-MM-DD" note to the
   row, with the reason.
4. Re-lint.

If the change touched a reference file, restore the reference file
too. If the change added a new file, delete it.

## 6. The Changelog (audit trail)

The changelog is the recovery mechanism and the audit trail. Format:

```markdown
| Date | Change | Reason | Evidence | Reversible? |
|---|---|---|---|---|
| 2026-07-17 | [class] [one-line summary] | [why this change] | [evidence citation] | Yes/No |
```

Rows are append-only. Never delete a row (mark it as reverted if
needed).

## 7. Quality-Floor Examples

| Case | Pass / Fail | Reason |
|---|---|---|
| Add a risk row: "R-D6: Subagent loops (calls itself infinitely)" | Pass | Concrete failure mode, new, useful |
| Add: "Always remember to think carefully about your work" | Fail | Vague filler (C-4, C-6) |
| Replace "the user might want this" with "the user requested FR-01 = X" | Pass | Specific > vague |
| Replace a real number (0.83 AUC) with "approximately 0.8" | Fail | Loss of precision (C-4) |
| Remove a tool reference to a tool that no longer exists | Pass | The reference is no longer valid (C-2, C-6) |
| Remove a section because "I don't think it's useful" | Fail | No evidence (C-1, C-3) |
| Add a task profile for "AI safety" without a specific procedure | Fail | Vague, no actionable procedure (C-4) |
| Reorder so the risk register is before the task profiles | Pass | Clarity improvement (C-4) |
| Add a personal anecdote about a real user's project | Fail | Privacy violation (C-7) |
| Update a deprecated tool name to its current name | Pass | Evidence-based update |

## 8. Garbage Heuristics (the "is this garbage?" test)

A change is garbage if any of:

- **It's already in the skill.** Reject (C-6, C-4).
- **It's a rephrasing of an existing rule with no new information.**
  Reject (C-4, C-6).
- **It's a personal preference without evidence.** Reject (C-1, C-3).
- **It's a vague platitude.** Reject (C-4, C-6).
- **It's an "edge case" without a real-world trigger.** Reject (C-3).
- **It introduces jargon without defining it.** Reject (C-4).
- **It imports a user's project-specific content.** Reject (C-7).
- **It contradicts the 10 governing principles.** Reject (always).
- **It makes the skill longer without proportional value.** Reject (C-4).
- **It makes the skill less specific / more hand-wavy.** Reject (C-4).

## 9. When to NOT Self-Evolve

Do not run the protocol if:

- The user is asking a one-off question (not a trigger)
- The task is trivial (complexity ≤ 4)
- The change would be high-impact and reversible only by hand
  (e.g., changing the 10 principles' fundamental identity)
- The evidence is speculative
- The user is currently mid-task and would be interrupted

In any of these cases, complete the current task, then surface the
candidate change to the user for an explicit decision.

## 10. Periodic Self-Assessment (optional, runs on explicit trigger)

If the user says "superskill audit" or "superskill health check",
the agent should:

1. Read every file in the skill directory.
2. For each reference, check whether its pointers (URLs, paper IDs,
   tool names) are still valid (best-effort, no network if offline).
3. For each anti-pattern, check whether it's still empirically
   true.
4. For each example, check whether it's still relevant.
5. Produce a one-page report of candidate changes (class + evidence
   for each), but DO NOT apply them — surface to the user for
   approval.

This is the only mode where multiple changes are batched. All other
modes apply one change per protocol run.

## 11. Related

- `SKILL.md` §"Self-Evolution Protocol" — front matter and the
  constitution summary
- The 10 governing principles in `references/principles-and-loop.md`
  — the skill's identity, fixed by C-2
- The 20-row risk register in `references/risk-failure.md` — the
  primary mutation target
- The 8 failure playbooks, 8 task profiles, 6 acceptance + 10
  rejection criteria, 18 adversarial questions — all mutable per
  this protocol
