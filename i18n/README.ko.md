[![English](https://img.shields.io/badge/English-Read-2b2b2b)](../README.md) [![Español](https://img.shields.io/badge/Espa%C3%B1ol-Read-e67e22)](README.es.md) [![Português](https://img.shields.io/badge/Portugu%C3%AAs-Read-27ae60)](README.pt.md) [![日本語](https://img.shields.io/badge/日本語-Read-16a085)](README.ja.md) [![한국어](https://img.shields.io/badge/한국어-Read-2980b9)](README.ko.md) [![Deutsch](https://img.shields.io/badge/Deutsch-Read-8e44ad)](README.de.md) [![Français](https://img.shields.io/badge/Fran%C3%A7ais-Read-2c3e50)](README.fr.md) [![Türkçe](https://img.shields.io/badge/T%C3%BCrk%C3%A7e-Read-c0392b)](README.tr.md) [![繁體中文](https://img.shields.io/badge/繁體中文-Read-d35400)](README.zh-Hant.md) [![简体中文](https://img.shields.io/badge/简体中文-Read-e74c3c)](README.zh-Hans.md) [![Русский](https://img.shields.io/badge/Русский-Read-7f8c8d)](README.ru.md)

![Skill X](../media/skill-x.gif)

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE)
[![Skills](https://img.shields.io/badge/skills-4-purple.svg)](#skills-at-a-glance)
[![Self-evolving](https://img.shields.io/badge/super--skill-self--evolving-brightgreen.svg)](../skills/super-skill/references/self-evolution.md)

코드, 리서치, 멀티 에이전트 오케스트레이션을 위한 작고 조합 가능한
에이전트 스킬 모음입니다. 각 스킬은 독립적이며, 근거 기반이고,
점진적 공개(progressive-disclosure) 방식의 참고 문서와 함께 제공됩니다.

> [anshmajumdar](https://github.com/anshmajumdar121)가 제작했습니다. 스킬은
> 공개 연구 자료, GPT-5.6 Sol 실행
> 청사진, [BuilderIO/skills](https://github.com/BuilderIO/skills)
> 컬렉션을 바탕으로 다듬어졌습니다.

## 빠른 시작

```bash
# 저장소 클론
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# 설치할 스킬 선택 (수동 복사)
cp -r skills/think-like-gpt-5-6   ~/.mavis/agents/<your-agent>/skills/
cp -r skills/efficient-fable      ~/.mavis/agents/<your-agent>/skills/
cp -r skills/skill-zero           ~/.mavis/agents/<your-agent>/skills/
cp -r skills/super-skill          ~/.mavis/agents/<your-agent>/skills/

# 또는 전체 설치
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# 등록 확인
mavis skill list
```

> `<your-agent>`를 사용 중인 에이전트 이름으로 바꾸세요 (예: `mavis`,
> `claude`, `codex` — 스킬이 위치하는 곳이면 어디든).

## 스킬 한눈에 보기

| 스킬 | 라인 수 | 하는 일 |
|---|---|---|
| [`think-like-gpt-5-6`](../skills/think-like-gpt-5-6/SKILL.md) | 1,547 | 완전한 엄격성 프레임워크: 7단계 루프, 10가지 원칙, 20행 위험 등록부, 8단계 검증 계층, 6개 수용 기준 + 10개 거부 기준, 18개 적대적 검토 질문, 7개 섹션의 배포 전 체크리스트. 사소하지 않은 작업 전반에 적합. |
| [`efficient-fable`](../skills/efficient-fable/SKILL.md) | 302 | 위임 패턴: 오케스트레이터 + 저비용 서브에이전트. 5단계 패턴, 인계 패킷 형식, 검증 프로토콜, 병렬화 가능한 작업에서 3~5배 저렴하고 2~4배 빠름. |
| [`skill-zero`](../skills/skill-zero/SKILL.md) | 1,598 | 전문 분야: 코딩 에이전트 LLM의 잔차 스트림(residual stream)에 대한 선형 프로브(linear probe). 현재 프로그램의 속성(정형성, 완전/부분 정확성, 회귀)을 해독하고 최대 약 25단계 앞선 편집 결과를 예측. Silva, Tu & Monperrus 2026 (arXiv:2607.05188)을 기반으로 함. |
| [`super-skill`](../skills/super-skill/SKILL.md) | 2,096 | 엄격성 + 위임의 종합. 두 가지 모드(엄격성 / 위임), 모드 선택 흐름, 검증 프로토콜, 5가지 위임 관련 위험. **7개 조항으로 구성된 헌장** 아래 **자기 진화**. |

### 어떤 스킬을 언제 사용할까

- **사소하지 않은 작업이 있고 검증 가능한 산출물을 원한다.**
  → `think-like-gpt-5-6`
- **병렬화 가능한 코드베이스 중심 작업이 있고 토큰을 절약하고 싶다.**
  → `efficient-fable`
- **코딩 에이전트의 내부 상태를 모니터링/조정하고 싶다
  (메커니즘적 해석 가능성).** → `skill-zero`
- **엄격성과 위임 효율성을 하나의 스킬로 모두 원한다.**
  → `super-skill`
- **시간이 지남에 따라 스스로 개선되는 스킬을, 쓰레기 방지를 위한
  강력한 가드레일과 함께 원한다.** → `super-skill` (자기 진화
  프로토콜을 갖춘 유일한 스킬)

## 스킬 상세

### `/think-like-gpt-5-6`

GPT-5.6 Sol 실행 지능 프레임워크를 적용합니다. 불완전한 요청을
**7단계 루프**: 관찰(Observe) → 해석(Interpret) → 결정(Decide) →
실행(Act) → 검증(Verify) → 수리(Repair) → 기록(Record)을 통해
검증되고 감사 가능한 산출물로 변환합니다. **10가지 지배 원칙**,
**9단계 아키텍처**, **20행 위험 등록부**, **6개 수용 기준 +
10개 거부 기준**, **18개 질문으로 구성된 적대적 검토**, **7개
섹션의 배포 전 체크리스트**가 뒷받침합니다.

다음에 적합: 다단계 코딩, 인용이 포함된 리서치, 산출물 제작,
운영상의 조치, 고위험 지침, 그리고 유창하지만 불투명한 답변이
아니라 검증 가능한 추론을 원하는 모든 작업.

더 읽기: [skills/think-like-gpt-5-6/SKILL.md](../skills/think-like-gpt-5-6/SKILL.md)

### `/efficient-fable`

고비용의 프런티어 모델을 **오케스트레이터, 아키텍트, 종합자,
최종 심판**으로 사용합니다. 저비용 서브에이전트는 **경계가 명확한
무거운 작업**(대규모 저장소 스캔, 긴 로그 축약, 좁은 범위의 코드
패치, 브라우저/테스트 검증)에 사용합니다. **검증 프로토콜**은
다음을 말합니다: *서브에이전트 보고서를 사실이 아니라 단서로
취급하라* — 배포 전 항상 인용된 파일을 다시 열어 줄 참조를
확인하고 diff를 검토하세요.

**5단계 위임 패턴**: 비용이 많이 드는 위험 요소 명명 →
병렬 조각으로 분할 → 무거운 작업에는 저비용 에이전트 사용 →
간결한 증거 요청 → 오케스트레이터의 토큰은 의사결정 계층에
사용.

다음에 적합: 독립적인 병렬 조각으로 나눌 수 있는 코드베이스
중심 작업. 사소한 작업, 고위험 단일 소스 작업, 또는 저비용
서브에이전트를 사용할 수 없는 경우에는 건너뛰세요.

더 읽기: [skills/efficient-fable/SKILL.md](../skills/efficient-fable/SKILL.md)

### `/skill-zero`

잔차 스트림에 대한 선형 프로브를 통한 **코딩 에이전트 LLM의
메커니즘적 해석 가능성** 전문가입니다. Silva, Tu & Monperrus
2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188))을
기반으로 합니다.

이 스킬은 다음을 수행하는 방법을 알려줍니다.

- **디스크에 기록되기 전에 편집 결과를 예측**합니다. 은닉 상태에
  로지스틱 회귀 프로브를 학습시켜, 곧 작성될 편집이 회귀
  (◆ Regression 속성)를 유발하거나 테스트에 실패(● Full
  Correctness)할지 여부를 읽어냅니다.
- **에이전트가 진행 중에 진전을 이루고 있는지 파악**합니다.
  ■ Partial Correctness 프로브는 에이전트의 은닉 상태로부터
  테스트 통과 방향에 대한 확신도를 읽습니다 (논문에서 AUC
  약 0.84).
- **에이전트의 계획을 약 25단계 앞서 내다봅니다.** "잠재
  프로그래밍 지평선(latent programming horizon)" 발견: 프로브는
  여러 단계 앞서 궤적이 실패 상태로 향하고 있음을 감지할 수
  있습니다.

이 스킬에는 논문의 구체적인 수치(AUC 0.83, 지평선 k≈25, 중간
계층의 역-U 패턴), 4가지 정형 속성, 셔플된 레이블 대조군 원칙,
벤치마크 간 전이 세부사항, 그리고 5가지 구체적인 실패 모드가
포함되어 있습니다.

더 읽기: [skills/skill-zero/SKILL.md](../skills/skill-zero/SKILL.md)

### `/super-skill`

종합: 하나의 스킬에 담긴 **엄격성 + 위임**. 두 가지 운영 모드:

- **엄격성 모드** (기본값) — GPT-5.6 Sol 7단계 루프, 10가지
  원칙, 9단계 아키텍처, 작업 분류, 위험 등록부, 검증 계층,
  수용/거부 기준, 적대적 검토, 배포 전 체크리스트를 사용합니다.
- **위임 모드** — 독립적인 병렬 조각으로 나눌 수 있는 코드베이스
  중심 또는 토큰 소모가 큰 작업의 경우, 검증 프로토콜과 함께
  Efficient Fable 위임 패턴을 사용합니다.

모드는 인테이크 단계에서 선택됩니다. 이 스킬에는 **5가지
위임 관련 위험**(R-D1~R-D5), 9번째 테스트
(**T-09: 서브에이전트 보고서 검증**), 테스트 매트릭스에 내장된
검증 프로토콜도 포함됩니다.

**자기 진화.** 이 스킬은 쓰레기를 방지하는 엄격한 내부
**7개 조항 헌장** 아래에서 시간이 지남에 따라 스스로 성장하고,
개선하고, 가지치기할 수 있습니다.
(`skills/super-skill/references/self-evolution.md`에 수록된) 헌장:

- **C-1** 근거 기반 — 모든 변경은 논문, 공식 문서, 코드 링크,
  또는 검증된 관찰을 인용해야 함
- **C-2** 범위 제한 — 엄격성 + 위임 프레임워크에만 해당, 사용자
  프로젝트는 해당 없음
- **C-3** 보수적 — 추측성 추가 금지
- **C-4** 품질 기준선 — 새 콘텐츠는 대체하는 콘텐츠와 동등하거나
  더 나아야 함
- **C-5** 되돌릴 수 있음 — 모든 변경에는 변경 이력 항목이 있음
- **C-6** 쓰레기 방지 필터 — 모호한 군더더기 거부
- **C-7** 개인정보 보호 — 개인 데이터 없음, 프로젝트별 콘텐츠
  없음

단 하나의 조항이라도 위반하면 변경 사항은 거부됩니다. 예외
없음.

더 읽기: [skills/super-skill/SKILL.md](../skills/super-skill/SKILL.md)

## 서로 어떻게 맞물리는가

<div align="center">

```
        ┌────────────────────────────────┐
        │       사용자 작업 도착          │
        └───────────────┬────────────────┘
                         │
                         ▼
           ┌────────────────────────┐
           │ 어떤 종류의 작업인가?  │
           └────────┬───────────────┘
     ┌───────────────────┼────────────────────────┐
     │                   │                        │
   일반 작업        은닉 상태 접근이         여러 에이전트가 있고
     │              가능한 코드 작업        메타 프레임워크가
     │                   │                  필요함
     ▼                   │                        │
┌─────────────────┐      ▼                        ▼
│ think-like-     │   ┌─────────────┐   ┌──────────────────┐
│ gpt-5-6         │   │ skill-zero  │   │  super-skill     │
│                 │   │             │   │  (엄격성+위임,   │
│ 7단계 루프      │   │ 은닉 상태에 │   │   자기 진화)     │
│ 10가지 원칙     │   │ 대한 선형   │   │                  │
│ 위험 등록부     │   │ 프로브      │   └──────────────────┘
│ 검증            │   │             │            │
└────────┬────────┘   └─────────────┘            │
         │                                        │
         └──────────────────┬─────────────────────┘
                             │
                             ▼
                ┌─────────────────────┐
                │ efficient-fable     │
                │ (위임 패턴)          │
                │                     │
                │ 5단계 패턴,          │
                │ 인계 패킷,           │
                │ 검증 프로토콜        │
                └─────────────────────┘
                             ▲
                             │
          super-skill의 위임 모드 내부에서 사용됨
          토큰 소모가 큰 병렬 작업에 독립적으로도 사용됨
```

</div>

`super-skill`은 대부분의 복잡한 작업에 권장되는 기본값입니다.
다음을 포함합니다.

- 완전한 TLG 엄격성 프레임워크 (외부 루프로서)
- Efficient Fable 위임 패턴 (빠른 경로로서)
- 자기 진화 프로토콜 (7개 조항 헌장 포함)

나머지 세 가지 스킬은 각자의 특정 트리거를 위해 계속
사용 가능합니다.

## 설치

이 스킬들은 어떤 에이전트의 스킬 디렉터리에든 넣을 수 있도록
설계되었습니다. 세 가지 설치 경로가 있으며, 사용 중인 에이전트가
지원하는 방식을 선택하세요.

### 경로 A — 플러그인 / 마켓플레이스 설치 (권장)

이 저장소는 **Claude Code 플러그인 마켓플레이스**와 **Codex
플러그인**으로 제공되므로 한 번의 명령으로 설치할 수 있습니다.

```bash
# Claude Code
/plugin marketplace add anshmajumdar/skill-x
/plugin install skill-x@skill-x

# Codex
codex plugin install anshmajumdar/skill-x

# 또는 범용 npx (Vercel의 skills CLI)
npx skills@latest add anshmajumdar/skill-x --skill super-skill
```

에이전트별 전체 설치 매트릭스(Claude Code, Codex, OpenCode,
Copilot, 그리고 범용 `cp -r` 대체 방법)는
[PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md)를 참고하세요.

### 경로 B — 수동 설치 (모든 에이전트에서 작동)

```bash
# 클론
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# 하나만 설치
cp -r skills/super-skill ~/.mavis/agents/<your-agent>/skills/

# 전체 설치
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# 확인
mavis skill list
```

### 에이전트별 설치 경로

| 에이전트 | 스킬 경로 | 플러그인? |
|---|---|---|
| mavis | `~/.mavis/agents/<name>/skills/` | 해당 없음 |
| Claude Code | `~/.claude/skills/` (사용자) 또는 `.claude/skills/` (프로젝트) | 지원 — `.claude-plugin/marketplace.json` |
| Codex CLI | `~/.codex/skills/` (사용자) 또는 `.codex/skills/` (프로젝트) | 지원 — `.codex-plugin/plugin.json` |
| OpenCode | `~/.config/opencode/skills/` (사용자) 또는 `.opencode/skills/` (프로젝트) | 수동만 가능 |
| GitHub Copilot | `.github/skills/` (프로젝트) 또는 VS Code 사용자 디렉터리 | 수동만 가능 |

### 스킬이 올바르게 설치되었는지 확인

```bash
# 스킬 하나 린트
node $(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)/scripts/lint-skill.js skills/super-skill/

# 이 저장소의 모든 스킬 린트
./scripts/lint-all.sh
```

## 자기 진화 (`/super-skill`에만 해당)

<br>

![Self-evolving: detect, evidence, constitution check, apply, verify](../media/banner.png)

<br>

`super-skill`은 스스로 진화하는 유일한 스킬입니다. 프로토콜은
[`skills/super-skill/references/self-evolution.md`](../skills/super-skill/references/self-evolution.md)에
있습니다. 트리거:

- **명시적**: "이 스킬을 진화시켜줘", "superskill evolve"
- **오래된 콘텐츠 감지**: 특정 수치, 링크, 또는 주장이 명백히
  구식이 된 경우
- **더 나은 기법 감지**: 명백히 더 나은 기법이 등장한 경우
- **쓰레기 콘텐츠 감지**: 더 이상 존재할 가치가 없는 섹션인
  경우

5단계 절차: 감지(Detect) → 증거(Evidence) → 헌장 확인
(Constitution check, 7개 조항 전체) → 적용(Apply) → 검증
(Verify, 재린트). `super-skill/SKILL.md` 상단의 변경 이력에
모든 변경 사항이 기록됩니다.

## 기여하기

기여를 환영합니다. 워크플로우는 [CONTRIBUTING.md](../CONTRIBUTING.md)를,
품질 기준에 대한 안내는 스킬 내부의 **자기 진화 프로토콜**을
참고하세요. 요약하면:

1. 각 스킬은 독립적입니다. 그 상태를 유지하세요.
2. 참고 문서는 점진적 공개 방식입니다 — `SKILL.md`가 전면부이고,
   `references/*.md`가 세부사항입니다.
3. 린트를 통과해야 합니다: `./scripts/lint-all.sh`.
4. 런타임에 외부 네트워크 호출 없음. 스킬은 정적 마크다운입니다.
5. 개인 데이터 없음, 프로젝트별 콘텐츠 없음.

## 스킬은 어떻게 만들어졌는가

| 스킬 | 출처 | 종합 방식 |
|---|---|---|
| `think-like-gpt-5-6` | GPT-5.6 Sol 실행 지능 청사진 (v1.0, 2026-07-16) | 7단계 루프, 10가지 원칙, 9단계 아키텍처, 20행 위험 등록부로 정제됨 |
| `efficient-fable` | [BuilderIO/skills](https://github.com/BuilderIO/skills/tree/main/skills/efficient-fable) | 재조정: Fable을 넘어 일반화, 사용하지 말아야 할 때 추가, 컬렉션의 나머지 부분과 상호 참조 |
| `skill-zero` | Silva, Tu, Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)) | 선형 프로브 방법론, 4가지 정형 속성, 예상 AUC 수치, 5가지 실패 모드를 추출 |
| `super-skill` | `think-like-gpt-5-6` + `efficient-fable`의 종합 | 5가지 위임 위험, 모드 선택 흐름, 검증 프로토콜, 9번째 테스트 T-09, 7개 조항 헌장을 갖춘 자기 진화 프로토콜 추가 |

## 라이선스

MIT. [LICENSE](../LICENSE)를 참고하세요.

## 바로가기

- [PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md) — 에이전트별 전체 설치 매트릭스 (Claude Code, Codex, OpenCode, Copilot, 수동)
- [CONTRIBUTING.md](../CONTRIBUTING.md) — 스킬을 추가하거나 수정하는 방법
- [LICENSE](../LICENSE) — MIT
- [SECURITY.md](../SECURITY.md) — 보안 문제를 신고하는 방법
- [CITATION.cff](../CITATION.cff) — 이 컬렉션을 인용하는 방법
- [.github/workflows/lint-skills.yml](../.github/workflows/lint-skills.yml) — 모든 스킬을 린트하는 CI
- [scripts/lint-all.sh](../scripts/lint-all.sh) — 로컬에서 동일하게 실행하는 스크립트
- [.claude-plugin/marketplace.json](../.claude-plugin/marketplace.json) — Claude Code 플러그인 매니페스트
- [.codex-plugin/plugin.json](../.codex-plugin/plugin.json) — Codex 플러그인 매니페스트

---

엄격성 + 위임 + 7개 조항 헌장으로 만들어졌습니다. 유용하다면
Star를 눌러주세요.
