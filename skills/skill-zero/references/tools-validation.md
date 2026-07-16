# Tools and Validation

## 1. Tool Selection Questions

Before using a tool, determine:
- What uncertainty or operation does the tool resolve?
- Is it the authoritative method?
- What permissions or side effects exist?
- What input schema is required?
- What evidence of success will be returned?
- What happens if the tool fails?
- Is the action reversible?
- Does data leave the current environment?
- Does the result require human review?

## 2. Tool Categories

| Tool type | Use when | Validation | Common failure |
|---|---|---|---|
| Web search | Current or externally verifiable info needed | Cross-check authoritative sources and dates | Stale, low-quality, or irrelevant sources |
| File search/read | Answer depends on supplied/stored documents | Cite exact passages and inspect surrounding context | Partial retrieval or wrong file version |
| Calculator | Arithmetic or unit conversion | Recalculate or sanity-check | Wrong expression or units |
| Code execution | Reproducible processing, data analysis, testing, file generation | Tests, assertions, file inspection | Environment mismatch or silent assumptions |
| Connector action | Email, calendar, contacts, storage, other private systems | Read after write or inspect returned status | Wrong target or unauthorized side effect |
| Image generation / edit | Visual creation or transformation | Visual inspection against constraints | Identity drift, text errors, object distortion |
| Document / artifact tools | Produce structured files | Open / render / inspect final artifact | Corrupt file, overflow, missing content |
| Automation | Future or recurring action | Confirm schedule and condition | Wrong timezone or recurrence |

## 3. Minimum Necessary Tool Principle

Use the smallest set of tools that can produce a reliable result. More
calls increase failure surface, latency, cost, and opportunity for
inconsistent state.

## 4. Tool Call Sequencing

1. Resolve identifiers before write actions
2. Read before editing existing state
3. Validate input schema
4. Prefer reversible or draft actions before irreversible actions
5. Execute
6. Inspect tool result
7. Confirm the changed state when material
8. Report exact completion status

## 5. Parallelism

Parallelize only independent actions. Do not run actions in parallel
when one depends on the result, identifier, decision, or side effect of
another.

## 6. Tool Failure Fallbacks

| Failure | Fallback |
|---|---|
| Search returns weak sources | Refine query, restrict domains, use primary source, disclose insufficiency |
| File parsing is incomplete | Read additional ranges or inspect page image |
| Code fails | Inspect traceback, isolate minimal failing case, patch, rerun tests |
| Write action fails | Do not claim success; preserve draft and report failure |
| Image edit drifts | Reapply stronger preservation constraints or use a more controlled method |
| Artifact renders poorly | Inspect pages/slides/sheets, adjust layout, regenerate, re-render |
| Connector unavailable | State access limitation; provide a local draft or manual procedure only when useful |

## 7. Validation Evidence (any of)

- Test output
- Calculation result
- Screenshot
- Rendered pages
- File listing and checksum
- Source citation
- Before-and-after comparison
- Tool response
- Human approval
- Requirement checklist

## 8. Revalidation Rule

After a correction, rerun:
1. The test that failed
2. Any test affected by the changed component
3. A lightweight regression check on previously passing critical requirements
