[![English](https://img.shields.io/badge/English-Read-2b2b2b)](README.md) [![Español](https://img.shields.io/badge/Espa%C3%B1ol-Read-e67e22)](README.es.md) [![Português](https://img.shields.io/badge/Portugu%C3%AAs-Read-27ae60)](README.pt.md) [![日本語](https://img.shields.io/badge/日本語-Read-16a085)](README.ja.md) [![한국어](https://img.shields.io/badge/한국어-Read-2980b9)](README.ko.md) [![Deutsch](https://img.shields.io/badge/Deutsch-Read-8e44ad)](README.de.md) [![Français](https://img.shields.io/badge/Fran%C3%A7ais-Read-2c3e50)](README.fr.md) [![Türkçe](https://img.shields.io/badge/T%C3%BCrk%C3%A7e-Read-c0392b)](README.tr.md) [![繁體中文](https://img.shields.io/badge/繁體中文-Read-d35400)](README.zh-Hant.md) [![简体中文](https://img.shields.io/badge/简体中文-Read-e74c3c)](README.zh-Hans.md) [![Русский](https://img.shields.io/badge/Русский-Read-7f8c8d)](README.ru.md)

![Skill X](media/skill-x.gif)

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/skills-4-purple.svg)](#skills-at-a-glance)
[![Self-evolving](https://img.shields.io/badge/super--skill-self--evolving-brightgreen.svg)](skills/super-skill/references/self-evolution.md)

コード、リサーチ、マルチエージェント・オーケストレーションのための、小さく組み合わせ可能なエージェントスキル集です。各スキルは自己完結型で、根拠に基づいており、段階的開示（progressive-disclosure）型のリファレンスドキュメントが付属しています。

> 制作: [anshmajumdar](https://github.com/anshmajumdar121)。スキルは公開されている研究、GPT-5.6 Sol
> 実行ブループリント、そして [BuilderIO/skills](https://github.com/BuilderIO/skills)
> コレクションを元に磨き上げられています。

## クイックスタート

```bash
# リポジトリをクローン
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# インストールするスキルを選ぶ（手動コピー）
cp -r skills/think-like-gpt-5-6   ~/.mavis/agents/<your-agent>/skills/
cp -r skills/efficient-fable      ~/.mavis/agents/<your-agent>/skills/
cp -r skills/skill-zero           ~/.mavis/agents/<your-agent>/skills/
cp -r skills/super-skill          ~/.mavis/agents/<your-agent>/skills/

# またはすべてインストール
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# 登録されたことを確認
mavis skill list
```

> `<your-agent>` はあなたのエージェント名（例: `mavis`、
> `claude`、`codex` — スキルが置かれている場所）に置き換えてください。

## スキル一覧

| スキル | 行数 | 内容 |
|---|---|---|
| [`think-like-gpt-5-6`](skills/think-like-gpt-5-6/SKILL.md) | 1,547 | 完全な厳密性フレームワーク: 7ステップループ、10の原則、20行のリスクレジスター、8つの検証レイヤー、6つの受け入れ基準+10の却下基準、18の敵対的レビュー質問、7セクションの納品前チェックリスト。些細ではないあらゆるタスクに最適。 |
| [`efficient-fable`](skills/efficient-fable/SKILL.md) | 302 | 委任パターン: オーケストレーター + 低コストのサブエージェント。5ステップのパターン、ハンドオフパケット形式、検証プロトコル、並列化可能な作業で3〜5倍安く、2〜4倍速い。 |
| [`skill-zero`](skills/skill-zero/SKILL.md) | 1,598 | スペシャリスト: コーディングエージェントLLMの残差ストリームに対する線形プローブ。現在のプログラムの特性（整形式であるか、完全/部分的な正しさ、リグレッション）をデコードし、最大約25ステップ先までの将来の編集結果を予測。Silva, Tu & Monperrus 2026 (arXiv:2607.05188) をベースにしている。 |
| [`super-skill`](skills/super-skill/SKILL.md) | 2,096 | 厳密性と委任の統合。2つのモード（厳密性 / 委任）、モード選択フロー、検証プロトコル、5つの委任固有リスク。**自己進化型**であり、7条項からなる憲法のもとで動作する。 |

### どのスキルを使うべきか

- **些細ではないタスクがあり、監査可能な成果物が欲しい。**
  → `think-like-gpt-5-6`
- **並列化可能なコードベース中心の作業があり、トークンを節約したい。** → `efficient-fable`
- **コーディングエージェントの内部状態を監視・制御したい（機械論的解釈可能性）。** → `skill-zero`
- **厳密性と委任効率の両方を1つのスキルで欲しい。**
  → `super-skill`
- **時間をかけて自己改善していく、ゴミを防ぐ強固なガードレールを備えたスキルが欲しい。** → `super-skill`（自己進化プロトコルを備えた唯一のスキル）

## スキルの詳細

### `/think-like-gpt-5-6`

GPT-5.6 Sol の実行インテリジェンス・フレームワークを適用します。**7ステップループ**（観察 → 解釈 → 決定 → 実行 → 検証 →
修復 → 記録）を通じて、不完全な依頼を検証済みの監査可能な成果物に変換します。**10の統治原則**、**9段階アーキテクチャ**、**20行のリスクレジスター**、**6つの受け入れ基準
+ 10の却下基準**、**18問の敵対的レビュー**、**7セクションの納品前チェックリスト**に裏付けられています。

最適な用途: 複数ステップにわたるコーディング、引用付きのリサーチ、成果物の作成、運用上のアクション、リスクの高い助言、そして流暢なブラックボックス的回答ではなく検証可能な推論が欲しいあらゆるタスク。

詳細はこちら: [skills/think-like-gpt-5-6/SKILL.md](skills/think-like-gpt-5-6/SKILL.md)

### `/efficient-fable`

高コストのフロンティアモデルを**オーケストレーター、アーキテクト、統合者、最終判定者**として使用します。より安価なサブエージェントには**境界の定まった重労働**（大規模リポジトリのスキャン、長いログの要約、限定的なコードパッチ、ブラウザ／テスト検証）を任せます。**検証プロトコル**が示す原則は次の通りです。*サブエージェントの報告は事実ではなく手がかりとして扱う* —
出荷前には必ず引用されたファイルを再度開き、行参照を確認し、差分をレビューすること。

**5ステップの委任パターン**: 高コストなリスクを特定する → 並列に分割可能な単位に切り分ける → 重労働には安価なエージェントを使う → 簡潔な証拠を求める → オーケストレーターのトークンは判断のレイヤーに使う。

最適な用途: 独立した並列パーツに分割できるコードベース中心の作業。些細なタスク、リスクの高い単一情報源の作業、または安価なサブエージェントが利用できない場合はスキップしてください。

詳細はこちら: [skills/efficient-fable/SKILL.md](skills/efficient-fable/SKILL.md)

### `/skill-zero`

線形プローブを用いた**コーディングエージェントLLMの機械論的解釈可能性**のスペシャリストです。
Silva, Tu & Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)) に基づいています。

このスキルは以下の方法を教えます。

- **編集結果をディスクに書き込まれる前に予測する。** 隠れ状態に対してロジスティック回帰プローブを学習させ、これから書き込まれる編集がリグレッションを引き起こすか（◆ Regression
  プロパティ）、テストに失敗するか（● Full Correctness）を読み取ります。
- **エージェントが軌道の途中で進捗しているかどうかを判断する。**
  ■ Partial Correctness プローブは、隠れ状態からエージェントのテスト通過方向に対する確信度を読み取ります（論文中のAUCは約0.84）。
- **エージェントの計画を約25ステップ先まで見通す。**「潜在的プログラミング地平線（latent programming
  horizon）」の発見: プローブは、軌道が失敗状態に向かっていることを数ステップ前に検知できます。

このスキルには、論文の具体的な数値（AUC 0.83、地平線 k≈25、中間層の逆U字パターン）、4つの正準特性、シャッフルラベルによる対照実験の規律、ベンチマーク間の転移に関する詳細、5つの具体的な失敗モードが含まれます。

詳細はこちら: [skills/skill-zero/SKILL.md](skills/skill-zero/SKILL.md)

### `/super-skill`

統合版: **厳密性 + 委任**を1つのスキルに。2つの動作モードがあります。

- **厳密性モード**（デフォルト） — GPT-5.6 Sol の7ステップループ、10の原則、9段階アーキテクチャ、タスク分類、リスクレジスター、検証レイヤー、受け入れ／却下基準、敵対的レビュー、納品前チェックリストを使用。
- **委任モード** — 独立した並列単位に分割できるコードベース中心またはトークン消費の大きい作業向けに、検証プロトコルを備えた Efficient Fable の委任パターンを使用。

モードはインテーク段階で選択されます。このスキルにはさらに、**5つの委任固有リスク**（R-D1〜R-D5）、9番目のテスト
（**T-09: サブエージェント報告の検証**）、そしてテストマトリクスに組み込まれた検証プロトコルが含まれています。

**自己進化型。** このスキルは、ゴミの発生を防ぐ厳格な内部**7条項憲法**のもとで、時間をかけて成長・改善・剪定していくことができます。
その憲法（`skills/super-skill/references/self-evolution.md` に記載）は以下の通りです。

- **C-1** 根拠に基づく — すべての変更は論文、公式ドキュメント、コードリンク、または検証済みの観察結果を引用しなければならない
- **C-2** 範囲の限定 — 厳密性と委任のフレームワークのみを対象とし、ユーザーのプロジェクトは対象外
- **C-3** 保守的 — 憶測に基づく追加は行わない
- **C-4** 品質の下限 — 新しいコンテンツは、置き換える対象と少なくとも同等以上の品質でなければならない
- **C-5** 可逆性 — すべての変更にはチェンジログの行が存在する
- **C-6** ゴミ除去フィルター — あいまいな水増しコンテンツは却下する
- **C-7** プライバシー — 個人データやプロジェクト固有のコンテンツを含まない

いずれか1条項でも満たさない場合、その変更は却下されます。例外はありません。

詳細はこちら: [skills/super-skill/SKILL.md](skills/super-skill/SKILL.md)

## それぞれの位置づけ

<div align="center">

```
        ┌────────────────────────────────┐
        │     ユーザーのタスクが届く      │
        └───────────────┬────────────────┘
                         │
                         ▼
           ┌────────────────────────┐
           │  どんな種類のタスクか？  │
           └────────┬───────────────┘
     ┌───────────────────┼────────────────────────┐
     │                   │                        │
  一般的なタスク    隠れ状態にアクセス       複数のエージェントを持ち、
     │             できるコードなら何でも   メタフレームワークが欲しい
     │                    │                        │
     ▼                    │                        ▼
┌─────────────────┐       ▼                        ▼
│ think-like-     │   ┌─────────────┐   ┌──────────────────┐
│ gpt-5-6         │   │ skill-zero  │   │  super-skill     │
│                 │   │             │   │  （厳密性+委任、 │
│ 7ステップループ │   │ 隠れ状態の  │   │   自己進化型）   │
│ 10の原則        │   │ 線形プローブ│   │                  │
│ リスクレジスター│   │             │   └──────────────────┘
│ 検証            │   └─────────────┘            │
└────────┬────────┘                              │
         │                                        │
         └──────────────────┬─────────────────────┘
                             │
                             ▼
                ┌─────────────────────┐
                │ efficient-fable     │
                │ （委任パターン）    │
                │                     │
                │ 5ステップパターン、 │
                │ ハンドオフパケット、│
                │ 検証プロトコル      │
                └─────────────────────┘
                             ▲
                             │
        super-skink の委任モード内で使用される
     トークン消費の大きい並列作業では単体でも使用される
```

</div>

`super-skill` は、ほとんどの複雑なタスクに推奨されるデフォルトです。次の要素を含んでいます。

- 完全なTLG厳密性フレームワーク（外側のループとして）
- Efficient Fable の委任パターン（高速レーンとして）
- 自己進化プロトコル（7条項憲法付き）

他の3つのスキルは、それぞれ固有のトリガーに応じて引き続き利用可能です。

## インストール

これらのスキルは、あらゆるエージェントのスキルディレクトリに配置できるよう設計されています。3つのインストール経路があるので、お使いのエージェントがサポートするものを選んでください。

### 経路A — プラグイン／マーケットプレイス経由のインストール（推奨）

このリポジトリは**Claude Code プラグインマーケットプレイス**および**Codex プラグイン**として提供されているため、コマンド一発でインストールできます。

```bash
# Claude Code
/plugin marketplace add anshmajumdar/skill-x
/plugin install skill-x@skill-x

# Codex
codex plugin install anshmajumdar/skill-x

# または汎用の npx（Vercel の skills CLI）
npx skills@latest add anshmajumdar/skill-x --skill super-skill
```

エージェントごとの完全なインストール一覧（Claude Code、Codex、OpenCode、Copilot、そして汎用の
`cp -r` フォールバック）は [PLUGIN_INSTALL.md](PLUGIN_INSTALL.md) を参照してください。

### 経路B — 手動インストール（どのエージェントでも利用可能）

```bash
# クローン
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# 1つだけインストール
cp -r skills/super-skill ~/.mavis/agents/<your-agent>/skills/

# すべてインストール
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# 確認
mavis skill list
```

### エージェント別のインストールパス

| エージェント | スキルパス | プラグイン対応？ |
|---|---|---|
| mavis | `~/.mavis/agents/<name>/skills/` | 該当なし |
| Claude Code | `~/.claude/skills/`（ユーザー） または `.claude/skills/`（プロジェクト） | 対応 — `.claude-plugin/marketplace.json` |
| Codex CLI | `~/.codex/skills/`（ユーザー） または `.codex/skills/`（プロジェクト） | 対応 — `.codex-plugin/plugin.json` |
| OpenCode | `~/.config/opencode/skills/`（ユーザー） または `.opencode/skills/`（プロジェクト） | 手動のみ |
| GitHub Copilot | `.github/skills/`（プロジェクト） または VS Code ユーザーディレクトリ | 手動のみ |

### スキルが正しくインストールされたか確認する

```bash
# 単一スキルをリント
node $(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)/scripts/lint-skill.js skills/super-skill/

# このリポジトリ内のすべてのスキルをリント
./scripts/lint-all.sh
```

## 自己進化（`/super-skill` のみ）

<br>

![Self-evolving: detect, evidence, constitution check, apply, verify](media/banner.png)

<br>

`super-skill` は自己進化する唯一のスキルです。そのプロトコルは
[`skills/super-skill/references/self-evolution.md`](skills/super-skill/references/self-evolution.md)
に記載されています。トリガーは以下の通りです。

- **明示的**: 「このスキルを進化させて」「superskill evolve」
- **陳腐化コンテンツの検知**: 特定の数値、リンク、主張が明らかに古くなっている場合
- **より優れた手法の検知**: 明らかに優れた手法が利用可能になった場合
- **ゴミコンテンツの検知**: あるセクションがもはや存在価値を持たなくなった場合

5ステップの手順: 検知 → 根拠の収集 → 憲法チェック
（7条項すべて） → 適用 → 検証（再リント）。`super-skill/SKILL.md`
の先頭にあるチェンジログには、すべての変更が記録されます。

## コントリビュート

コントリビュートを歓迎します。ワークフローについては [CONTRIBUTING.md](CONTRIBUTING.md) を参照し、品質基準についてはスキル内の**自己進化プロトコル**を参考にしてください。要点は以下の通りです。

1. 各スキルは自己完結型です。その状態を保ってください。
2. リファレンスドキュメントは段階的開示方式です — `SKILL.md`
   がフロントマター、`references/*.md` が詳細です。
3. リントの通過が必須です: `./scripts/lint-all.sh`。
4. 実行時に外部ネットワーク呼び出しは行いません。スキルは静的なマークダウンです。
5. 個人データやプロジェクト固有のコンテンツは含めないでください。

## スキルの構築方法

| スキル | 出典 | 統合内容 |
|---|---|---|
| `think-like-gpt-5-6` | GPT-5.6 Sol Execution-Intelligence Blueprint (v1.0, 2026-07-16) | 7ステップループ、10の原則、9段階アーキテクチャ、20行のリスクレジスターに抽出・整理 |
| `efficient-fable` | [BuilderIO/skills](https://github.com/BuilderIO/skills/tree/main/skills/efficient-fable) | 再調整: Fable を超えて一般化し、使うべきでない場面を追加し、コレクション内の他のスキルと相互参照 |
| `skill-zero` | Silva, Tu, Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)) | 線形プローブ手法、4つの正準特性、期待されるAUC数値、5つの失敗モードを抽出 |
| `super-skill` | `think-like-gpt-5-6` + `efficient-fable` の統合 | 5つの委任リスク、モード選択フロー、検証プロトコル、9番目のテスト T-09、7条項憲法を備えた自己進化プロトコルを追加 |

## ライセンス

MIT。[LICENSE](LICENSE) を参照してください。

## リンク集

- [PLUGIN_INSTALL.md](PLUGIN_INSTALL.md) — エージェント別の完全なインストール一覧（Claude Code、Codex、OpenCode、Copilot、手動）
- [CONTRIBUTING.md](CONTRIBUTING.md) — スキルの追加・変更方法
- [LICENSE](LICENSE) — MIT
- [SECURITY.md](SECURITY.md) — セキュリティ問題の報告方法
- [CITATION.cff](CITATION.cff) — このコレクションの引用方法
- [.github/workflows/lint-skills.yml](.github/workflows/lint-skills.yml) — すべてのスキルをリントするCI
- [scripts/lint-all.sh](scripts/lint-all.sh) — ローカルでの同等コマンド
- [.claude-plugin/marketplace.json](.claude-plugin/marketplace.json) — Claude Code プラグインマニフェスト
- [.codex-plugin/plugin.json](.codex-plugin/plugin.json) — Codex プラグインマニフェスト

---

厳密性 + 委任 + 7条項憲法で構築されています。役に立ったらスターをお願いします。
