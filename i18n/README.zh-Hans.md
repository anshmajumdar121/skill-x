[![English](https://img.shields.io/badge/English-Read-2b2b2b)](../README.md) [![Español](https://img.shields.io/badge/Espa%C3%B1ol-Read-e67e22)](README.es.md) [![Português](https://img.shields.io/badge/Portugu%C3%AAs-Read-27ae60)](README.pt.md) [![日本語](https://img.shields.io/badge/日本語-Read-16a085)](README.ja.md) [![한국어](https://img.shields.io/badge/한국어-Read-2980b9)](README.ko.md) [![Deutsch](https://img.shields.io/badge/Deutsch-Read-8e44ad)](README.de.md) [![Français](https://img.shields.io/badge/Fran%C3%A7ais-Read-2c3e50)](README.fr.md) [![Türkçe](https://img.shields.io/badge/T%C3%BCrk%C3%A7e-Read-c0392b)](README.tr.md) [![繁體中文](https://img.shields.io/badge/繁體中文-Read-d35400)](README.zh-Hant.md) [![简体中文](https://img.shields.io/badge/简体中文-Read-e74c3c)](README.zh-Hans.md) [![Русский](https://img.shields.io/badge/Русский-Read-7f8c8d)](README.ru.md)

![Skill X](../media/skill-x.gif)

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE)
[![Skills](https://img.shields.io/badge/skills-4-purple.svg)](#skills-at-a-glance)
[![Self-evolving](https://img.shields.io/badge/super--skill-self--evolving-brightgreen.svg)](../skills/super-skill/references/self-evolution.md)

一个小巧、可组合的智能体技能集合，涵盖代码、研究和多智能体编排。每个技能都是自包含的、基于证据的，并附带渐进式披露的参考文档。

> 由 [anshmajumdar](https://github.com/anshmajumdar121) 构建。技能提炼自公开研究、GPT-5.6 Sol 执行蓝图，以及 [BuilderIO/skills](https://github.com/BuilderIO/skills) 合集。

## 快速开始

```bash
# Clone the repo
git clone https://github.com/anshmajumdar121/skill-x.git
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

> 将 `<your-agent>` 替换为你的智能体名称（例如 `mavis`、`claude`、`codex` —— 也就是你的技能所在的位置）。

## 技能一览

| 技能 | 行数 | 功能说明 |
|---|---|---|
| [`think-like-gpt-5-6`](../skills/think-like-gpt-5-6/SKILL.md) | 1,547 | 完整严谨框架：7 步循环、10 条原则、20 行风险登记表、8 层验证、6 条验收 + 10 条拒收标准、18 个对抗性审查问题、7 部分交付前检查清单。适用于任何非平凡任务。 |
| [`efficient-fable`](../skills/efficient-fable/SKILL.md) | 302 | 委派模式：编排者 + 低成本子智能体。5 步模式、交接包格式、审核协议，在可并行化工作上成本降低 3-5 倍、速度提升 2-4 倍。 |
| [`skill-zero`](../skills/skill-zero/SKILL.md) | 1,598 | 专精技能：对编码智能体 LLM 的残差流进行线性探测。解码当前程序属性（良构性、完全/部分正确性、回归）并预测未来最多约 25 步的编辑结果。基于 Silva, Tu & Monperrus 2026（arXiv:2607.05188）。 |
| [`super-skill`](../skills/super-skill/SKILL.md) | 2,096 | 严谨性与委派的综合体。两种模式（严谨模式/委派模式）、模式选择流程、审核协议、5 类委派专属风险。**自我进化**，受 7 条准则宪章约束。 |

### 该使用哪个技能

- **我有一个非平凡任务，希望获得可审计的成果。**
  → `think-like-gpt-5-6`
- **我有大量代码库相关工作，可以并行化，并希望节省 token。** → `efficient-fable`
- **我想监控/引导编码智能体的内部状态（机制可解释性）。** → `skill-zero`
- **我既想要严谨性，又想要委派效率，合二为一。**
  → `super-skill`
- **我想要一个能随时间自我提升、且有严格防劣化护栏的技能。** → `super-skill`（唯一具备自我进化协议的技能）

## 技能详情

### `/think-like-gpt-5-6`

应用 GPT-5.6 Sol 执行智能框架。通过**7 步循环**：观察 → 解读 → 决策 → 行动 → 验证 → 修复 → 记录，将一个不完善的请求转化为经过验证、可审计的交付成果。以**10 条指导原则**、**9 阶段架构**、**20 行风险登记表**、**6 条验收 + 10 条拒收标准**、**18 个问题的对抗性审查**以及**7 部分交付前检查清单**为支撑。

适用场景：多步骤编码、带引用的研究、成果创建、操作性行动、高风险指导，以及任何你希望获得可检查推理过程而非流畅黑箱答案的任务。

阅读更多：[skills/think-like-gpt-5-6/SKILL.md](../skills/think-like-gpt-5-6/SKILL.md)

### `/efficient-fable`

将高成本的前沿模型用作**编排者、架构师、综合者和最终裁判**。使用更低成本的子智能体处理**有边界的繁重工作**（大型代码库扫描、长日志归约、局部代码补丁、浏览器/测试验证）。**审核协议**指出：*将子智能体的报告视为线索而非事实*——务必重新打开被引用的文件，核实行号引用，并在交付前审查差异。

**5 步委派模式**：明确高成本风险点 → 拆分为可并行的切片 → 用低成本智能体处理繁重工作 → 要求提供简明证据 → 将编排者的 token 用于决策层。

适用场景：可拆分为独立并行片段的大量代码库工作。对于琐碎任务、高风险单一来源工作，或没有低成本子智能体可用的情况，请跳过。

阅读更多：[skills/efficient-fable/SKILL.md](../skills/efficient-fable/SKILL.md)

### `/skill-zero`

专精于通过残差流上的线性探测对**编码智能体 LLM 进行机制可解释性分析**。基于 Silva, Tu & Monperrus 2026（[arXiv:2607.05188](https://arxiv.org/abs/2607.05188)）。

该技能教你如何：

- **在编辑落盘前预测其结果。** 在隐藏状态上训练逻辑回归探测器，判断即将写入的编辑是否会引入回归（◆ 回归属性）或未通过测试（● 完全正确性）。
- **判断智能体在轨迹中途是否在取得进展。** ■ 部分正确性探测器从隐藏状态中读取智能体对测试通过方向的置信度（论文中 AUC 约为 0.84）。
- **提前约 25 步预见智能体的计划走向。** “潜在编程视野”这一发现表明：探测器可以提前若干步标记出轨迹正在走向失败状态。

该技能包含论文中的具体数值（AUC 0.83，视野 k≈25，中间层倒 U 型模式）、4 个规范属性、打乱标签的对照规范、跨基准迁移细节，以及 5 种具体失效模式。

阅读更多：[skills/skill-zero/SKILL.md](../skills/skill-zero/SKILL.md)

### `/super-skill`

综合体：**严谨性 + 委派**合二为一。两种运行模式：

- **严谨模式**（默认）—— 使用 GPT-5.6 Sol 的 7 步循环、10 条原则、9 阶段架构、任务分类、风险登记表、验证层、验收/拒收标准、对抗性审查和交付前检查清单。
- **委派模式**——针对可拆分为独立并行片段的代码库密集型或 token 密集型工作，使用 Efficient Fable 的委派模式配合审核协议。

模式在意图接收阶段选定。该技能还包含 **5 项委派专属风险**（R-D1 至 R-D5）、第 9 项测试（**T-09：子智能体报告审核**），以及内置于测试矩阵中的审核协议。

**自我进化。** 该技能可以随时间增长、改进并自我修剪，受严格的内部**7 条准则宪章**约束，防止劣质内容混入。宪章内容（位于
`skills/super-skill/references/self-evolution.md`）：

- **C-1** 基于证据 —— 每次变更都必须引用论文、官方文档、代码链接或经验证的观察结果
- **C-2** 范围有界 —— 仅限严谨性 + 委派框架，不涉及用户项目
- **C-3** 保守克制 —— 不做推测性添加
- **C-4** 质量下限 —— 新内容必须至少与被替换内容同等优秀
- **C-5** 可逆性 —— 每次变更都有一条变更日志记录
- **C-6** 无劣质内容过滤 —— 拒绝含糊填充内容
- **C-7** 隐私保护 —— 不含个人数据，不含项目特定内容

任何一条准则未通过 = 拒绝该变更。没有例外。

阅读更多：[skills/super-skill/SKILL.md](../skills/super-skill/SKILL.md)

## 它们如何协同工作

<div align="center">

```
        ┌────────────────────────────────┐
        │         用户任务到达            │
        └───────────────┬────────────────┘
                         │
                         ▼
           ┌────────────────────────┐
           │      这是哪种任务？     │
           └────────┬───────────────┘
     ┌───────────────────┼────────────────────────┐
     │                   │                        │
   通用任务          可访问隐藏状态           我有多个智能体
     │              的代码类任务            并想要一个元框架
     │                   │                        │
     ▼                   │                        ▼
┌─────────────────┐      ▼                        ▼
│ think-like-     │   ┌─────────────┐   ┌──────────────────┐
│ gpt-5-6         │   │ skill-zero  │   │  super-skill     │
│                 │   │             │   │  （严谨性+委派，│
│ 7 步循环        │   │ 隐藏状态上  │   │   自我进化）     │
│ 10 条原则       │   │ 的线性探测  │   │                  │
│ 风险登记表      │   │             │   │                  │
│ 验证            │   │             │   └──────────────────┘
└────────┬────────┘   └─────────────┘            │
         │                                        │
         └──────────────────┬─────────────────────┘
                             │
                             ▼
                ┌─────────────────────┐
                │ efficient-fable     │
                │ （委派模式）        │
                │                     │
                │ 5 步模式，          │
                │ 交接包，            │
                │ 审核协议            │
                └─────────────────────┘
                             ▲
                             │
          在 super-skill 的委派模式中使用
          也可独立用于 token 密集型的并行工作
```

</div>

`super-skill` 是大多数复杂任务的推荐默认选项。它包含：

- 完整的 TLG 严谨框架（作为外层循环）
- Efficient Fable 委派模式（作为快速通道）
- 自我进化协议（含 7 条准则宪章）

其余三个技能仍可用于各自的特定触发场景。

## 安装

这些技能被设计为可放入任何智能体的技能目录中。共有三条安装路径 —— 选择你的智能体所支持的那一条即可。

### 路径 A —— 插件/市场安装（推荐）

本仓库以 **Claude Code 插件市场**和 **Codex 插件**的形式发布，因此你可以一条命令完成安装：

```bash
# Claude Code
/plugin marketplace add anshmajumdar121/skill-x
/plugin install skill-x@skill-x

# Codex
codex plugin install anshmajumdar121/skill-x

# Or generic npx (Vercel's skills CLI)
npx skills@latest add anshmajumdar121/skill-x --skill super-skill
```

完整的按智能体安装矩阵（Claude Code、Codex、OpenCode、Copilot，以及通用的 `cp -r` 兜底方案）请参见 [PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md)。

### 路径 B —— 手动安装（适用于任何智能体）

```bash
# Clone
git clone https://github.com/anshmajumdar121/skill-x.git
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

### 各智能体的安装路径

| 智能体 | 技能路径 | 是否支持插件？ |
|---|---|---|
| mavis | `~/.mavis/agents/<name>/skills/` | 不适用 |
| Claude Code | `~/.claude/skills/`（用户级）或 `.claude/skills/`（项目级） | 是 —— `.claude-plugin/marketplace.json` |
| Codex CLI | `~/.codex/skills/`（用户级）或 `.codex/skills/`（项目级） | 是 —— `.codex-plugin/plugin.json` |
| OpenCode | `~/.config/opencode/skills/`（用户级）或 `.opencode/skills/`（项目级） | 仅支持手动安装 |
| GitHub Copilot | `.github/skills/`（项目级）或 VS Code 用户目录 | 仅支持手动安装 |

### 验证技能是否安装正确

```bash
# Lint a single skill
node $(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)/scripts/lint-skill.js skills/super-skill/

# Lint all skills in this repo
./scripts/lint-all.sh
```

## 自我进化（仅限 `/super-skill`）

<br>

![Self-evolving: detect, evidence, constitution check, apply, verify](../media/banner.png)

<br>

`super-skill` 是唯一会自我进化的技能。该协议位于
[`skills/super-skill/references/self-evolution.md`](../skills/super-skill/references/self-evolution.md)。触发条件：

- **显式触发**："evolve this skill"、"superskill evolve"
- **过时内容检测**：某个具体数字、链接或说法已被证实过时
- **更优技术检测**：出现明显更优的技术
- **劣质内容检测**：某个章节不再值得保留

5 步流程：检测 → 取证 → 宪章核查（全部 7 条准则）→ 应用 → 验证（重新 lint）。`super-skill/SKILL.md` 顶部的变更日志会记录每一次变更。

## 贡献

我们欢迎贡献。工作流程请参见 [CONTRIBUTING.md](../CONTRIBUTING.md)，质量标准的指导则请参考技能内置的**自我进化协议**。简要版本如下：

1. 每个技能都是自包含的。请保持这一点。
2. 参考文档采用渐进式披露 —— `SKILL.md` 是概览，`references/*.md` 是细节。
3. 必须通过 Lint 检查：`./scripts/lint-all.sh`。
4. 运行时不进行外部网络调用。技能是静态的 Markdown 文件。
5. 不包含个人数据，不包含项目特定内容。

## 这些技能是如何构建的

| 技能 | 来源 | 综合方式 |
|---|---|---|
| `think-like-gpt-5-6` | GPT-5.6 Sol 执行智能蓝图（v1.0，2026-07-16） | 提炼为 7 步循环、10 条原则、9 阶段架构、20 行风险登记表 |
| `efficient-fable` | [BuilderIO/skills](https://github.com/BuilderIO/skills/tree/main/skills/efficient-fable) | 重新调整：泛化超出 Fable 范围，增加了何时不该使用的说明，并与合集中的其他技能建立交叉引用 |
| `skill-zero` | Silva, Tu, Monperrus 2026（[arXiv:2607.05188](https://arxiv.org/abs/2607.05188)） | 提取了线性探测方法论、4 个规范属性、预期 AUC 数值、5 种失效模式 |
| `super-skill` | `think-like-gpt-5-6` + `efficient-fable` 的综合体 | 增加了 5 项委派风险、模式选择流程、审核协议、第 9 项测试 T-09、含 7 条准则宪章的自我进化协议 |

## 许可证

MIT。详见 [LICENSE](../LICENSE)。

## 相关链接

- [PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md) —— 完整的按智能体安装矩阵（Claude Code、Codex、OpenCode、Copilot、手动安装）
- [CONTRIBUTING.md](../CONTRIBUTING.md) —— 如何添加或修改技能
- [LICENSE](../LICENSE) —— MIT
- [SECURITY.md](../SECURITY.md) —— 如何报告安全问题
- [CITATION.cff](../CITATION.cff) —— 如何引用本合集
- [.github/workflows/lint-skills.yml](../.github/workflows/lint-skills.yml) —— 对每个技能进行 lint 检查的 CI
- [scripts/lint-all.sh](../scripts/lint-all.sh) —— 本地等效脚本
- [.claude-plugin/marketplace.json](../.claude-plugin/marketplace.json) —— Claude Code 插件清单
- [.codex-plugin/plugin.json](../.codex-plugin/plugin.json) —— Codex 插件清单

---

以严谨性 + 委派 + 一部 7 条准则宪章构建而成。如果觉得有用，欢迎 Star。
