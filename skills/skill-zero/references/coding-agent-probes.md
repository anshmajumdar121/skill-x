# Coding-Agent Interpretability — Specialist Procedure

Apply this procedure when the task involves probing hidden states of a
coding agent, predicting edit outcomes, latent programming horizons, or
mechanistic interpretability of LLMs working on code. The general
framework (7-step loop, 10 principles, etc.) wraps around this
procedure; the procedure operates inside each loop step.

> Source paper: Silva, Tu, Monperrus (2026). *Latent Programming
> Horizons in Coding Agents.* arXiv:2607.05188.
> Code: `https://github.com/ASSERT-KTH/program-probes`
> Data: `https://huggingface.co/datasets/ASSERT-KTH/latent-programming-horizons-trajs`

## 1. Inputs (specialist additions)

- **Model**: open-weight only. Paper used Qwen3.6-35B-A3B and
  Laguna-XS.2 (both `d=2048`, 40 layers). Closed APIs out of scope.
- **Agent scaffold**: e.g. mini-swe-agent v2.2.8, SWE-agent, OpenHands.
- **Benchmark / task suite**: real-codebase benchmarks (SWE-Bench-Verified,
  SWE-Bench-Pro, Multi-SWE-bench).
- **Target property** (pick from §3 below).
- **Layer of interest**: default mid-layer (ℓ ∈ {11, 21, 31} on
  40-layer models — the inverted-U sweet spot).

## 2. Procedure (per loop step)

### 2.1 Observe
- Run the agent on the benchmark; capture *every* tool call that
  mutates the codebase. Record the full program version after each
  edit (git checkout the post-edit tree).
- Aim for ≥ ~5k trajectories; the paper used 22,714 across 1,231 tasks
  (median 52 steps per trajectory).
- Extract residual stream `h_t^ℓ ∈ ℝ^d` at every generated token
  position `t`, for layers of interest. To bound storage, subsample
  every 5 tokens; the paper's dataset is 22.4M hidden-state vectors at
  d=2048.

### 2.2 Interpret
- Pick the target property ϕ from the 4 canonical ones (§3).
- For each edit `e_i`, check out the resulting program and compute the
  binary label `y_i^ϕ ∈ {0,1}`. A label is sticky: every generated
  token between `e_i` and `e_{i+1}` carries the label of `e_i`. Treat
  the initial pre-agent program as a phantom edit `e_0`.

### 2.3 Decide
- Sweep layers: ℓ ∈ {1, 11, 21, 31, 40} is a reasonable default; expand
  to all 40 if compute permits.
- For current-state probe: k = 0.
- For horizon probe: k ∈ {0, 1, 5, 10, 15, 20, 25, 30, 40, 50}.
- Split trajectories by **task identifier** (not by token) — same task
  must not appear in both train and test.
- Always train a shuffled-label control probe per (layer, property).

### 2.4 Act
- Train one logistic regression probe per (layer, property) for the
  current-state analysis:
  `ŷ_t^ϕ = σ(w · h_t^ℓ)`, `w ∈ ℝ^d`.
- For the horizon: train one probe per (layer, property, k). The
  probe at hidden state `h_t^ℓ` predicts the label at step `t+k`.
- Sweep hyperparameters via random search; select by mean validation
  AUC.
- Exclude the final `k_max` steps of every trajectory to keep token
  population constant across horizons.

### 2.5 Verify (use the paper's diagnostic pattern)
- Best-layer AUC per property — confirm the expected ranges (§4).
- Layer curve — confirm the **inverted-U** pattern (low at L1, peak
  mid, slight drop at L40). If not inverted-U, something is off.
- Shuffled-label control AUC — must collapse to ~0.50. If not, the
  probe is reading label-irrelevant features (R-S1).
- For horizon: AUC vs k curve — confirm the **hockey-stick decay**
  (high at k=0, falling over ~25 steps, plateauing above chance
  through k=50).
- For transfer: apply a probe trained on benchmark A to hidden states
  on benchmark B (no retraining); confirm ● and ■ drop ≤ 0.09 AUC;
  confirm ▲ collapses (R-S3 — language distribution mismatch).

### 2.6 Repair
See §6 (5 specialist failure modes).

### 2.7 Record
- Probe artifact table: one row per (layer, property) with best AUC +
  shuffled-control AUC.
- Layer curve: AUC vs layer.
- Horizon plot: AUC vs k.
- Transfer table: in-distribution vs cross-dataset AUC per property.
- If model is Qwen-class, expect ~0.10 AUC higher than Laguna-class
  at same param count on ● and ■.

## 3. The 4 Canonical Properties

| Symbol | Property | Label = 1 when… | Why probe it |
|---|---|---|---|
| ▲ | Well-formedness | program parses/compiles at the edit | syntactic signal |
| ● | Full Correctness | program passes the benchmark's full test oracle | the ultimate goal |
| ■ | Partial Correctness | number of failing tests is strictly less than at task start | direction of progress |
| ◆ | Regression | any test that initially passed now fails | side-effect signal |

Paper found ● and ■ are the strongest decodable (AUC up to 0.84),
followed by ◆ (0.75), and ▲ is the weakest — but ▲ is the *strongest*
cross-dataset signal collapse, because syntactic failure rates differ
wildly between language distributions. The hard-to-predict properties
are the interesting ones.

## 4. Expected Numbers (sanity check)

| Property | Best AUC expected | Notes |
|---|---|---|
| ▲ Well-formedness | 0.60–0.78 | Strong on multi-language; collapses on near-always-compilable single-language |
| ● Full Correctness | up to **0.83** | Strongest semantic signal |
| ■ Partial Correctness | up to **0.84** | Strongest signal overall |
| ◆ Regression | up to 0.75 | Captures side effects on initial-passing tests |
| Programming horizon | above chance for k ≈ 25 steps | Plateaus ~0.55–0.65 AUC through k = 50 |

- **Mid-layer inverted-U.** Performance lowest at L1, peak in layers
  11–31 (40-layer models), slight drop at L40.
- **Cross-benchmark transfer.** ● and ■ drop only 0.04–0.09 AUC
  without retraining; ▲ collapses.
- **Qwen > Laguna** at same param count (~0.10 AUC gap on ●/■).

## 5. When NOT to Use This Procedure

- Closed-API models (no hidden-state access).
- Single-step code generation (this is specifically multi-step agent).
- Chain-of-thought probing on plain Q&A (different research line).
- General LLM interpretability unrelated to code.

## 6. Specialist Failure Modes

### 6.1 Probe AUC ≈ 0.50 everywhere → no signal
Check: (1) labels computed at every edit event, (2) residual stream
from generated tokens (not prompt prefix), (3) shuffled-label control
also ~0.50 (sanity), (4) `d` of vectors matches model's hidden size.

### 6.2 Probe high on real AND high on shuffled → overfitting
Reduce probe capacity (lower L2 / fewer iterations), use task-level
splits more aggressively.

### 6.3 Horizon result is flat at 0.50
Model may not plan ahead, OR action loop is too short (need 50+
steps trajectories). Check median step count first.

### 6.4 Cross-dataset transfer collapses for ●/■
Verify the agent scaffold is identical across benchmarks; verify
hidden-state dimension d matches.

### 6.5 No open-weight model available
This technique requires hidden-state access. Closed APIs are out of
scope. For closed APIs, fall back to logit/length/refusal-signal
probes (a different research line) — or refuse the task.

## 7. Pointers

- Paper: arXiv:2607.05188 (Silva, Tu, Monperrus — KTH, July 2026)
- Code: `https://github.com/ASSERT-KTH/program-probes`
- Trajectory dataset: `https://huggingface.co/datasets/ASSERT-KTH/latent-programming-horizons-trajs`
- Closely related prior work on single-step code correctness probing
  (different setup, no agent loop): Ribeiro 2025, Bui 2025, Vu 2025.
- Foundational probing methodology: Alain & Bengio 2017 (ICLR
  Workshop), Hewitt & Liang 2019 (the shuffled-label control).

## 8. Related Skills

For deeper coverage of one specific aspect, see also the dedicated
`coding-agent-interpretability` skill (the parent of this specialist
section). For the general execution framework that wraps this
specialist, see `think-like-gpt-5-6`.
