# Delegation Pattern and Handoff Packets

Apply this when SuperSkill is in **delegation mode** (parallelizable
work + cheap subagents available + orchestrator can vet the result).

> Source: `efficient-fable` — Claude Fable as orchestrator + cheap
> subagents for heavy lifting. Cost: 3-5× more efficient, 2-4×
> faster for parallelizable work. Treat as workload-dependent
> estimates, not guarantees.

## 1. The 5-Step Delegation Pattern

1. **Name the expensive-token risk.** Large repo search, long logs,
   broad docs, repetitive edits — anything where naive execution
   would burn orchestrator tokens.
2. **Split independent work into subagents BEFORE reading everything
   yourself.** Parallel slices for independent work; keep blocking or
   highly coupled work local.
3. **Use cheap subagents** for: research scans, inventory, search
   summaries, narrow bug hunts, browser/testing passes, test output
   reduction, bounded code edits.
4. **Ask subagents for concise evidence** (see §2 handoff packet
   format). Files, line refs, commands, diffs, failures, screenshots,
   uncertainty, stop conditions they hit.
5. **Spend orchestrator tokens on the decision layer.** Compare
   results, resolve conflicts, choose the implementation path, review
   the final patch.

**Parallelize only independent actions.** Do not run actions in
parallel when one depends on the result, identifier, decision, or
side effect of another.

## 2. Handoff Packet Format

Write delegated prompts as if the subagent has no useful chat context.
Include only the context it needs:

- **The repo path and exact objective.** What does "done" look like?
- **The files, packages, or surfaces in scope and anything
  explicitly out of scope.** Boundaries reduce drift.
- **The evidence format to return.** Files, line refs, commands,
  diffs, failures, screenshots, uncertainty.
- **The verification commands or browser flows to run**, plus what
  success should look like when knowable.
- **Stop conditions.** If the code does not match the prompt, a
  command fails after a reasonable retry, or the task needs
  out-of-scope files, **stop and report instead of improvising**.

## 3. The Vetting Protocol (CRITICAL)

**Treat subagent reports as leads, not facts.**

Before using a high-impact finding, opening a PR, or telling the
user the work is done, the orchestrator should:

1. **Reopen the important cited files** — confirm the subagent looked
   at the right thing.
2. **Confirm the relevant line refs or failures** — line numbers and
   error messages must match the actual state.
3. **Review the final diff against the task** — does the change
   actually solve the problem, not just something adjacent?
4. **Test the change if material** — run the verification, don't
   trust the subagent's "it worked" report.
5. **Look for silent assumptions** — subagents often invent defaults
   that the orchestrator wouldn't.

**Let lighter agents gather signal; keep truth-judgment with the
orchestrator.** This is the line that, if dropped, makes delegation
unsafe.

## 4. Soft Scenario Defaults

Treat these as defaults, not rigid rules. Adapt to the task.

### 4.1 Research
- Ask lighter agents to scan docs, prior art, APIs, and repo surfaces.
- Orchestrator decides what evidence changes the plan.
- Subagent output: list of relevant files + 1-line summary each, or
  detailed answer to a narrow question.

### 4.2 Coding
- Give cheaper agents bounded edits or candidate patches.
- Orchestrator owns: shared-file coordination, integration, final
  review.
- Subagent output: diff with before/after, line refs, test run results.

### 4.3 Testing
- Orchestrator suggests validation direction and the scripts / browser
  checks that matter.
- Lighter agents run targeted tests, browser flows, screenshots, log
  reduction.
- Subagent output: exact commands, failures, likely causes, whether
  failures look flaky, environmental, or real.

### 4.4 Debugging
- Use cheaper agents to cluster logs, reproduce issues, try small
  fixes.
- Orchestrator decides which diagnosis is most trustworthy.
- Subagent output: ranked list of likely root causes with evidence.

**If a task is tiny or the validation itself needs delicate judgment,
keep it with the orchestrator.**

## 5. When Delegation Is Wrong

Skip delegation mode if any of these:

- The work cannot be sliced into independent chunks
- No cheap subagents are available
- The task needs human-in-the-loop at every step (medical, legal, etc.)
- The cost of a wrong answer exceeds the cost of orchestrator
  slowness (high-stakes guidance profile)
- Validation requires reading the entire output carefully (e.g., a
  30-page legal memo)

For tasks above, run in rigor mode — orchestrator does the work.

## 6. Claims (from efficient-fable)

For codebase-heavy work, this pattern is "up to 3-5× more
cost-efficient and 2-4× faster" when independent research, coding,
or testing slices can run in parallel. Treat those as
workload-dependent estimates, not guarantees.

## 7. Common Pitfalls

| Pitfall | Symptom | Fix |
|---|---|---|
| Orchestrator micromanages | Subagent prompt is 5000 words | Trust the handoff packet; only intervene on edge cases |
| Subagent over-delegates | Final report cites sub-subagent reports | Reject; orchestrator vets the leaf report only |
| Scope drift | Subagent refactored 50 files when asked to fix 1 | Reject, redispatch with explicit in/out of scope |
| Silent assumption | Subagent used "the standard test command" without saying what | Reject; require "uncertainty + stop conditions" in handoff |
| Vetting skipped | "Subagent said it works" in completion note | Block delivery; require T-09 (vet) to pass |
| Sequential when could be parallel | 3 subagents dispatched one after another | Restructure into parallel slices |
| Parallel when coupled | Subagent 2 needed subagent 1's output | Combine into one subagent or sequence explicitly |
