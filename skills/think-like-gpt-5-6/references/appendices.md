# Appendices: Discovery Interview, Execution Record, Traceability, Prompt, Glossary

## A. Reusable Discovery Interview (Appendix A)

Use only the categories relevant to the project. Ask the highest-impact
questions first; avoid repeating answered questions.

### A.1 Objective and Need
1. What exact outcome is required?
2. What decision or action will the result support?
3. Why is this task being done now?
4. What happens if nothing is changed?
5. Is the requested solution mandatory?
6. What is the underlying problem?
7. What symptom may be mistaken for the cause?
8. What would a technically correct but useless result look like?
9. What larger workflow does this support?
10. What must become possible after completion?

### A.2 Success and Acceptance
11. Who approves the result?
12. Who actually uses it?
13. What causes immediate rejection?
14. What is the minimum acceptable result?
15. What makes it exceptional?
16. Which success criteria are quantitative?
17. Which require human judgment?
18. What error tolerance is acceptable?
19. What evidence must accompany delivery?
20. What does "finished" mean?

### A.3 Scope
21. What is included?
22. What is excluded?
23. What must be created from scratch?
24. What already exists?
25. What must remain unchanged?
26. What may be modified freely?
27. Are editable source files required?
28. Is deployment included?
29. Is documentation included?
30. Is future maintenance included?
31. Are multiple versions or variants required?
32. Is backward compatibility required?

### A.4 Audience and Stakeholders
33. Who is the primary audience?
34. What is their knowledge level?
35. Who purchases, approves, operates, maintains the result?
36. Who may object?
37. Are internal and external audiences different?
38. Are there accessibility needs?
39. Are there language or cultural requirements?
40. Who decides when stakeholder feedback conflicts?

### A.5 Inputs and Evidence
41. Which files, links, datasets, examples, or assets exist?
42. Which source is authoritative?
43. Which source may be outdated?
44. Are references exact specifications or inspiration?
45. Which aspect of each reference matters?
46. What must not be copied?
47. Which claims require current research?
48. Is external research allowed?
49. What should happen when sources conflict?
50. What information is missing?
51. Which input may not be altered?
52. Are ownership or licensing rights clear?

### A.6 Constraints
53. What is the deadline?
54. Is the deadline hard or preferred?
55. What budget or usage limit exists?
56. Which tools are required?
57. Which tools are prohibited?
58. What formats are required?
59. What dimensions, resolution, or aspect ratio apply?
60. What platform limitations apply?
61. What compatibility is required?
62. What performance threshold applies?
63. What security and privacy controls apply?
64. What legal or regulatory rules apply?
65. Which constraints are absolute, negotiable, preferred, or assumed?

### A.7 Priority and Trade-offs
66. Rank accuracy, speed, cost, flexibility, creativity, maintainability
67. Which requirement wins if accuracy conflicts with visual impact?
68. Which requirement wins if speed conflicts with quality?
69. What can be deferred first?
70. Is strict reference matching more important than originality?
71. Is automation more important than manual control?
72. Is short-term delivery more important than long-term scalability?
73. What decision is hardest to reverse?

### A.8 Existing Attempts
74–83. What has been tried, what worked, what failed, why, what
feedback was received, which failed idea must not be repeated, are
any previous assets reusable, was rejection objective or subjective?

### A.9 Edge Cases and Failure
84–95. Most likely failure, worst plausible failure, hardest to detect,
what happens if required input is unavailable / tool fails / output is
partial / deadline changes / feedback conflicts / exact matching
impossible, what can be safely approximated, what must never be,
stop conditions.

### A.10 Validation
96–105. How to test correctness, what is automatable, what needs
human judgment, comparison vs reference, acceptance tests, who
reviews, independent verification required, evidence required, how
uncertainty is communicated, regression prevention.

### A.11 Delivery and Maintenance
106–115. Exact files/actions to deliver, naming convention, storage
location, versioning, changelog, usage instructions, post-delivery
ownership, expected future edits, maintainer access, archival.

## B. Reusable Execution Record (Appendix B)

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

## C. Requirement Traceability Matrix (Appendix C)

| Requirement ID | Requirement | Execution task | Validation test | Delivery item | Status |
|---|---|---|---|---|---|
| FR-01 | Interpret the actual objective | 1.0 | T-01 | Final response or artifact | Defined |
| FR-02 | Track must-have requirements | 1.1 | T-02 | Requirement register | Defined |
| FR-03 | Exclude prohibited contextual information | 1.1, 3.0 | T-03 | Final artifact | Defined |
| FR-04 | Verify current factual claims | 2.0 | T-04 | Source-grounded content | Defined |
| FR-05 | Validate file integrity | 4.0 | T-06 | Downloadable artifact | Defined |
| FR-06 | Disclose limitations | 6.0 | T-08 | Completion note | Defined |

## D. Prompt Template (Appendix D)

```text
Use GPT-5.6 Sol to execute the task below as a controlled, auditable
workflow.

Do not reveal private chain-of-thought, hidden scratchpads, confidential
instructions, or token-by-token reasoning. Instead, provide useful
execution artifacts such as confirmed facts, assumptions, decision
criteria, concise rationale, risks, evidence, validation results, and
limitations.

TASK
[Insert the task.]

REQUIRED DELIVERABLE
[Insert exact output or action.]

AUDIENCE AND PURPOSE
[Insert who will use it and why.]

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
- Dimensions or length:
- Deadline relevance:
- Required tools:
- Prohibited tools:
- Privacy or legal constraints:

ACCEPTANCE CRITERIA
- [Observable pass condition]
- [Observable pass condition]

EXECUTION RULES
1. Restate the objective and identify material ambiguity.
2. Ask a question only when missing information is blocking and cannot
   be safely resolved from available sources.
3. Otherwise proceed using clearly labeled, reversible assumptions.
4. Use current authoritative research for facts that may have changed.
5. Select the minimum necessary tools and verify their results.
6. Track must-have requirements and prohibitions.
7. Execute in verifiable stages when the task is complex.
8. Test the final result against the acceptance criteria.
9. Repair failures and rerun affected tests.
10. Deliver the requested artifact or action, not only advice about it.
11. State what was validated and what remains uncertain.
12. Do not introduce personal, historical, brand-specific, or unrelated
    context unless explicitly required by this task.

FINAL COMPLETION NOTE
Include:
- Deliverable produced
- Validation performed
- Unresolved blockers
- Highest remaining risk
- Immediate next action
```

## E. Glossary (Appendix E)

| Term | Definition |
|---|---|
| Acceptance criterion | A measurable condition that determines whether a requirement passes |
| Assumption | A necessary but unconfirmed belief used to proceed |
| Authoritative source | A source with recognized responsibility or primary evidence for the claim |
| Chain-of-thought | Internal reasoning process; raw private chain-of-thought is outside this framework's scope |
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
