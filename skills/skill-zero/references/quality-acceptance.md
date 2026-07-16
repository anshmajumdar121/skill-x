# Acceptance, Rejection, Adversarial Review, Pre-Delivery

## 1. General Acceptance Criteria (Given/When/Then)

```text
Given a user request and its applicable source material,
when the final deliverable is reviewed,
then every must-have requirement is either passed or explicitly
marked unresolved with its impact.
```

```text
Given a claim that depends on current external information,
when the claim is inspected,
then it is supported by a current authoritative source or clearly
labeled as unverified.
```

```text
Given a requested file artifact,
when delivery occurs,
then the exact linked file exists, opens successfully, and contains
the expected content.
```

```text
Given a request to exclude personal, historical, or unrelated project
information,
when the output is scanned,
then none of that excluded information appears directly or indirectly.
```

```text
Given a material assumption,
when the final output is reviewed,
then the assumption, risk, and verification path are visible.
```

```text
Given a tool-dependent action,
when completion is claimed,
then a successful tool result or state verification supports that
claim.
```

## 2. General Rejection Criteria

Reject or revise the deliverable when any of these occur:
- It solves a different problem
- It omits a must-have requirement
- It includes prohibited or irrelevant information
- It fabricates a source, result, test, or action
- It uses stale data for a time-sensitive claim without disclosure
- It claims a tool action succeeded when it did not
- It cannot be opened or used in the requested format
- It hides a limitation that would change the user's decision
- It relies on undefined subjective terms for acceptance
- It contains an unresolved critical contradiction

## 3. 8-Layer Validation

1. **Structural** — required sections, files, formats, fields exist
2. **Semantic** — content answers the actual objective
3. **Factual** — claims are accurate and current where needed
4. **Constraint** — must-preserve and must-not-change rules are satisfied
5. **Technical** — code, calculations, schemas, links, files, operations work
6. **Visual** — layout, image composition, overflow, legibility, rendering
7. **Regression** — corrections did not break previously valid parts
8. **Acceptance** — the designated reviewer's criteria are met

## 4. Test Matrix

| Test ID | Requirement | Method | Expected result | Pass criteria | Reviewer |
|---|---|---|---|---|---|
| T-01 | Objective alignment | Compare deliverable to objective statement | Output enables intended outcome | No major section solves a different problem | Executor |
| T-02 | Requirement completeness | Traceability review | Every must-have requirement has status | 100% of must requirements passed or disclosed | QA reviewer |
| T-03 | Prohibited-content absence | Keyword + contextual scan | No excluded information appears | Zero prohibited items | QA reviewer |
| T-04 | Evidence quality | Source audit | Material claims use suitable sources | No material unsupported claim | Research reviewer |
| T-05 | Internal consistency | Terminology / numbers / dates / units scan | No contradictions | Zero unresolved critical conflict | Executor |
| T-06 | File integrity | Open and inspect artifact | File opens and renders | No corruption or missing content | Executor |
| T-07 | Usability | Follow the deliverable as a new reader | Reader can act without hidden context | No blocking ambiguity | Independent reviewer |
| T-08 | Limitation honesty | Compare claims to actual actions and evidence | No overstatement | Status wording matches verified state | QA reviewer |

## 5. 13 Quality Dimensions

Correctness, completeness, relevance, clarity, traceability, evidence,
consistency, usability, maintainability, safety, privacy, file
integrity, honesty.

## 6. Quality Thresholds (Defect Severity)

| Severity | Definition | Delivery rule |
|---|---|---|
| Critical | Makes output unsafe, false, unusable, or directed at wrong target | Must fix before delivery |
| Major | Violates must-have requirement or causes likely rejection | Must fix or explicitly block delivery |
| Moderate | Reduces clarity, consistency, or maintainability | Fix when practical before delivery |
| Minor | Cosmetic issue, no material consequence | Fix if efficient; may disclose |

## 7. 18 Adversarial Review Challenge Questions

1. Which assumption could invalidate the entire result?
2. Is the output solving the stated solution rather than the underlying need?
3. Which requirement is still ambiguous?
4. Where could two competent readers interpret the document differently?
5. Which claim has the weakest evidence?
6. Which current fact may already be stale?
7. Which test lacks a measurable threshold?
8. Which requirement has no validation method?
9. Which tool capability was assumed rather than verified?
10. Which dependency is outside the executor's control?
11. What could fail after delivery?
12. What would a hostile reviewer call misleading?
13. Which personal or unrelated detail may have leaked from context?
14. Which section is generic filler rather than operationally useful?
15. Where is the plan unnecessarily complex?
16. Would a simpler approach provide nearly the same value?
17. What evidence would prove the chosen approach wrong?
18. Has the model claimed to inspect, test, create, send, or verify something it did not?

### Required Corrections After Review
1. Remove redundant or irrelevant content
2. Add unresolved issues to the risk or question register
3. Strengthen weak tests
4. Replace vague acceptance criteria
5. Verify critical traceability
6. Recheck exclusions and privacy boundaries
7. Correct overconfident language

## 8. Final Pre-Delivery Checklist

### Objective and Scope
- [ ] The real objective is stated clearly
- [ ] The requested deliverable exists
- [ ] Included and excluded scope are respected
- [ ] No unrelated historical, personal, or project-specific material appears

### Requirements
- [ ] Every must-have requirement has a stable ID or explicit check
- [ ] Prohibited changes were checked
- [ ] Contradictions were resolved or disclosed
- [ ] Assumptions are labeled

### Evidence and Accuracy
- [ ] Time-sensitive claims were verified
- [ ] Material claims have suitable evidence
- [ ] Inference is distinguished from sourced fact
- [ ] Dates, names, numbers, units, and calculations were checked

### Tool Use
- [ ] Tool permissions and capabilities were verified
- [ ] The correct targets were resolved
- [ ] Side effects were authorized
- [ ] Tool results were inspected
- [ ] Partial failures were reconciled

### Quality
- [ ] The output is complete and relevant
- [ ] Terminology and formatting are consistent
- [ ] No placeholder content remains
- [ ] Subjective quality terms have observable indicators
- [ ] Critical defects are absent

### Artifact Integrity
- [ ] The file exists at the linked path
- [ ] The file opens or parses
- [ ] The extension matches the format
- [ ] Rendered layout was inspected where relevant
- [ ] The filename and version are clear

### Delivery
- [ ] Validation status is stated honestly
- [ ] Known limitations are disclosed
- [ ] The next action is clear
- [ ] The output can be understood without the original conversation
