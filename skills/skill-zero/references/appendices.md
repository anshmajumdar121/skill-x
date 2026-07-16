# Appendices: Discovery Interview, Execution Record, Traceability, Prompt, Glossary

## A. Reusable Discovery Interview (use only relevant categories, ask highest-impact first)

### A.1 Objective and Need (1–10)
Exact outcome required; what decision/action the result supports; why
now; what happens if nothing changes; is the requested solution
mandatory; underlying problem; symptom mistaken for cause; technically
correct but useless result; larger workflow; what must become possible
after completion.

### A.2 Success and Acceptance (11–20)
Who approves; who uses; immediate-rejection causes; minimum acceptable
result; what makes it exceptional; quantitative criteria; human-judgment
criteria; error tolerance; required evidence; what "finished" means.

### A.3 Scope (21–32)
Included; excluded; created from scratch; already exists; must remain
unchanged; may be modified freely; editable source required; deployment;
documentation; future maintenance; multiple versions; backward compat.

### A.4 Audience and Stakeholders (33–40)
Primary audience; knowledge level; purchaser/approver/operator/maintainer;
objectors; internal vs external; accessibility; language/culture;
decision owner when feedback conflicts.

### A.5 Inputs and Evidence (41–52)
Existing files/links/datasets; authoritative source; outdated sources;
references as spec vs inspiration; what must not be copied; current
research needed; external research allowed; conflict handling; missing
info; unalterable inputs; ownership/licensing.

### A.6 Constraints (53–65)
Deadline; deadline hard or preferred; budget/usage limit; required
tools; prohibited tools; required formats; dimensions/resolution/aspect
ratio; platform limits; compat requirements; performance threshold;
security/privacy; legal/regulatory; absolute vs negotiable.

### A.7 Priority and Trade-offs (66–73)
Rank accuracy / speed / cost / flexibility / creativity / maintainability;
winners when accuracy conflicts with visual, or speed with quality;
deferrable items; reference matching vs originality; automation vs
manual; short-term vs long-term; hardest-to-reverse decision.

### A.8 Existing Attempts (74–83)
Tried; worked; failed; why; cause category (requirements, execution,
tools, inputs, expectations); feedback; repeated issues; failed ideas
to avoid; reusable assets; objective vs subjective rejection.

### A.9 Edge Cases and Failure (84–95)
Most likely failure; worst plausible failure; hardest to detect; what
if required input unavailable; tool fails; partial output; deadline
changes; feedback conflicts; exact matching impossible; safely
approximable; never-approximable; stop conditions.

### A.10 Validation (96–105)
How to test correctness; automatable checks; human-judgment checks;
comparison vs reference; acceptance tests; reviewer; independent
verification; screenshots/logs/reports required; uncertainty
communication; regression prevention.

### A.11 Delivery and Maintenance (106–115)
Exact files/actions; naming; storage location; versioning; changelog;
usage instructions; post-delivery owner; expected future edits;
maintainer access; archival.

## B. Reusable Execution Record Template

```markdown
## Project Understanding
- **Objective:**
- **Deliverable:**
- **Audience:**
- **Approver:**
- **Deadline relevance:**
- **Risk level:**

## Confirmed Facts
- F-01:

## Requirements
| ID | Requirement | Priority | Source | Validation | Status |
|---|---|---|---|---|---|
| FR-01 |  | Must |  |  | Open |

## Prohibitions
| ID | Prohibited change | Detection | Status |
|---|---|---|---|
| PR-01 |  |  | Open |

## Assumptions
| ID | Assumption | Confidence | Risk | Verification |
|---|---|---|---|---|
| A-01 |  |  |  |  |

## Contradictions
| ID | Conflict | Resolution | Owner |
|---|---|---|---|

## Plan
| Phase | Objective | Output | Validation |
|---|---|---|---|

## Tool Log
| Step | Tool | Purpose | Result | Verified? |
|---|---|---|---|---|

## Test Results
| Test ID | Result | Evidence | Action |
|---|---|---|---|

## Limitations
- L-01:

## Completion State
- **Delivered:**
- **Validated:**
- **Unverified:**
- **Next action:**
```

## C. Requirement Traceability Matrix

| Requirement ID | Requirement | Execution task | Validation test | Delivery item | Status |
|---|---|---|---|---|---|
| FR-01 | Interpret the actual objective | 1.0 | T-01 | Final response or artifact | Defined |
| FR-02 | Track must-have requirements | 1.1 | T-02 | Requirement register | Defined |
| FR-03 | Exclude prohibited contextual information | 1.1, 3.0 | T-03 | Final artifact | Defined |
| FR-04 | Verify current factual claims | 2.0 | T-04 | Source-grounded content | Defined |
| FR-05 | Validate file integrity | 4.0 | T-06 | Downloadable artifact | Defined |
| FR-06 | Disclose limitations | 6.0 | T-08 | Completion note | Defined |

## D. Prompt Template

```text
Use SuperSkill to execute the task below as a controlled, auditable
workflow operating in {general | coding-agent-interpretability} mode.

TASK
[Insert the task.]

REQUIRED DELIVERABLE
[Insert exact output or action.]

MUST-HAVE REQUIREMENTS
1. [Requirement]
2. [Requirement]

MUST NOT INCLUDE OR CHANGE
1. [Prohibition]
2. [Preservation rule]

SOURCE MATERIAL
[Attach or identify sources.]

CONSTRAINTS
- Format:
- Dimensions / length:
- Deadline relevance:
- Required tools:
- Prohibited tools:
- Privacy / legal constraints:

ACCEPTANCE CRITERIA
- [Observable pass condition]
- [Observable pass condition]

EXECUTION RULES
1. Apply the 7-step loop: Observe → Interpret → Decide → Act → Verify
   → Repair → Record.
2. Use the 10 governing principles.
3. If in coding-agent-interpretability mode, follow the specialist
   procedure in `references/coding-agent-probes.md`.
4. Track must-have requirements and prohibitions.
5. Validate against acceptance criteria.
6. Repair failures and rerun affected tests.
7. Deliver the requested artifact or action, not only advice about it.
8. State what was validated and what remains uncertain.
9. Do not introduce personal, historical, brand-specific, or unrelated
   context unless explicitly required.
```

## E. Glossary

| Term | Definition |
|---|---|
| Acceptance criterion | A measurable condition that determines whether a requirement passes |
| Assumption | A necessary but unconfirmed belief used to proceed |
| Authoritative source | A source with recognized responsibility or primary evidence for the claim |
| Chain-of-thought | Internal reasoning; raw private chain-of-thought is outside this framework's scope |
| Constraint | A limit on the acceptable solution |
| Context contamination | Introduction of unrelated or disallowed information from other tasks or history |
| Deliverable | The final artifact, answer, or action requested |
| Derived result | A result produced by calculation, transformation, or logic from known inputs |
| Evidence | Information used to support or verify a claim or decision |
| Exit criterion | A condition required to complete a phase |
| Functional requirement | What the solution must do |
| Non-functional requirement | A quality or operational property the solution must have |
| Prohibition | An explicit rule that something must not appear, change, or occur |
| Regression | A new defect introduced while fixing or changing another part |
| Requirement traceability | Connection from requirement to execution task, test, and deliverable |
| Source of truth | The authoritative version used to resolve disagreement |
| Stop condition | A condition under which execution must pause, escalate, or end |
| Tool verification | Confirmation that a tool action ran successfully and affected the intended target |
| Working assumption | A provisional assumption used while remaining open to correction |
| Probe (specialist) | Logistic regression classifier trained on hidden states to decode program properties |
| Horizon (specialist) | The number of agent steps ahead for which a probe can predict edit outcomes above chance |
| Inverted-U (specialist) | The diagnostic layer-wise AUC pattern: low at L1, peak in mid layers, slight drop at final layer |
