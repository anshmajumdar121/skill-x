[![English](https://img.shields.io/badge/English-Read-2b2b2b)](../README.md) [![Español](https://img.shields.io/badge/Espa%C3%B1ol-Read-e67e22)](README.es.md) [![Português](https://img.shields.io/badge/Portugu%C3%AAs-Read-27ae60)](README.pt.md) [![日本語](https://img.shields.io/badge/日本語-Read-16a085)](README.ja.md) [![한국어](https://img.shields.io/badge/한국어-Read-2980b9)](README.ko.md) [![Deutsch](https://img.shields.io/badge/Deutsch-Read-8e44ad)](README.de.md) [![Français](https://img.shields.io/badge/Fran%C3%A7ais-Read-2c3e50)](README.fr.md) [![Türkçe](https://img.shields.io/badge/T%C3%BCrk%C3%A7e-Read-c0392b)](README.tr.md) [![繁體中文](https://img.shields.io/badge/繁體中文-Read-d35400)](README.zh-Hant.md) [![简体中文](https://img.shields.io/badge/简体中文-Read-e74c3c)](README.zh-Hans.md) [![Русский](https://img.shields.io/badge/Русский-Read-7f8c8d)](README.ru.md)

![Skill X](../media/skill-x.gif)

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE)
[![Skills](https://img.shields.io/badge/skills-4-purple.svg)](#skills-at-a-glance)
[![Self-evolving](https://img.shields.io/badge/super--skill-self--evolving-brightgreen.svg)](../skills/super-skill/references/self-evolution.md)

Eine kleine, kombinierbare Sammlung von Agenten-Skills für Code, Recherche und
Multi-Agenten-Orchestrierung. Jeder Skill ist eigenständig, evidenzbasiert
und enthält Referenzdokumente nach dem Prinzip der schrittweisen Offenlegung.

> Entwickelt von [anshmajumdar](https://github.com/anshmajumdar121). Skills
> abgeleitet aus öffentlicher Forschung, dem GPT-5.6-Sol-Ausführungs-
> Blueprint und der [BuilderIO/skills](https://github.com/BuilderIO/skills)-
> Sammlung.

## Schnellstart

```bash
# Clone the repo
git clone https://github.com/anshmajumdar/skill-x.git
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

> Ersetze `<your-agent>` durch deinen Agentennamen (z. B. `mavis`,
> `claude`, `codex` — je nachdem, wo deine Skills liegen).

## Skills auf einen Blick

| Skill | Zeilen | Was er tut |
|---|---|---|
| [`think-like-gpt-5-6`](../skills/think-like-gpt-5-6/SKILL.md) | 1.547 | Vollständiges Rigor-Framework: 7-Schritte-Schleife, 10 Prinzipien, 20-zeiliges Risikoregister, 8 Validierungsebenen, 6 Akzeptanz- + 10 Ablehnungskriterien, 18 kontradiktorische Prüffragen, 7-teilige Checkliste vor Auslieferung. Am besten für jede nicht-triviale Aufgabe geeignet. |
| [`efficient-fable`](../skills/efficient-fable/SKILL.md) | 302 | Delegationsmuster: Orchestrator + günstige Subagenten. 5-Schritte-Muster, Handoff-Paket-Format, Prüfprotokoll, 3-5× günstiger + 2-4× schneller bei parallelisierbarer Arbeit. |
| [`skill-zero`](../skills/skill-zero/SKILL.md) | 1.598 | Spezialist: lineare Sonden auf dem Residualstrom von Coding-Agenten-LLMs. Dekodiert aktuelle Programmeigenschaften (Wohlgeformtheit, vollständige/teilweise Korrektheit, Regression) und sagt zukünftige Bearbeitungsergebnisse bis zu ~25 Schritte im Voraus vorher. Basiert auf Silva, Tu & Monperrus 2026 (arXiv:2607.05188). |
| [`super-skill`](../skills/super-skill/SKILL.md) | 2.096 | Synthese aus Rigor + Delegation. Zwei Modi (Rigor / Delegation), Modusauswahl-Ablauf, Prüfprotokoll, 5 delegationsspezifische Risiken. **Selbst-evolvierend** unter einer Verfassung mit 7 Klauseln. |

### Wann welchen Skill verwenden

- **Ich habe eine nicht-triviale Aufgabe und möchte prüfbare Arbeitsergebnisse.**
  → `think-like-gpt-5-6`
- **Ich habe codebasislastige Arbeit, die parallelisiert werden kann, und
  möchte Tokens sparen.** → `efficient-fable`
- **Ich möchte den internen Zustand eines Coding-Agenten überwachen / steuern
  (mechanistische Interpretierbarkeit).** → `skill-zero`
- **Ich möchte sowohl Rigor ALS AUCH Delegationseffizienz in einem Skill.**
  → `super-skill`
- **Ich möchte einen Skill, der sich mit der Zeit selbst verbessert, mit
  harten Schutzmechanismen gegen Müll.** → `super-skill` (der einzige
  mit dem Selbst-Evolutions-Protokoll)

## Skill-Details

### `/think-like-gpt-5-6`

Wendet das GPT-5.6-Sol-Framework für Ausführungsintelligenz an. Wandelt eine
unvollständige Anfrage über die **7-Schritte-Schleife** in ein validiertes,
prüfbares Arbeitsergebnis um: Beobachten → Interpretieren → Entscheiden → Handeln →
Verifizieren → Reparieren → Protokollieren. Gestützt durch die **10 leitenden
Prinzipien**, die **9-stufige Architektur**, ein **20-zeiliges Risikoregister**,
**6 Akzeptanz- + 10 Ablehnungskriterien**, eine **18-Fragen-kontradiktorische
Prüfung** und eine **7-teilige Checkliste vor Auslieferung**.

Am besten geeignet für: mehrstufiges Programmieren, Recherche mit Zitaten,
Erstellung von Arbeitsergebnissen, operative Maßnahmen, folgenreiche Beratung
und jede Aufgabe, bei der du eine nachvollziehbare Argumentation anstelle
einer flüssigen Blackbox-Antwort möchtest.

Mehr lesen: [skills/think-like-gpt-5-6/SKILL.md](../skills/think-like-gpt-5-6/SKILL.md)

### `/efficient-fable`

Verwendet ein teures Frontier-Modell als **Orchestrator, Architekt,
Synthesizer und finalen Gutachter**. Verwendet günstigere Subagenten für die
**begrenzte Schwerstarbeit** (große Repository-Scans, lange Log-Reduktion,
eng begrenzte Code-Patches, Browser-/Test-Verifizierung). Das
**Prüfprotokoll** besagt: *behandle Subagenten-Berichte als Hinweise, nicht
als Fakten* — öffne stets die zitierte Datei erneut, bestätige die Zeilenangabe
und prüfe den Diff vor der Auslieferung.

Das **5-Schritte-Delegationsmuster**: das teure Risiko benennen → in
parallele Abschnitte aufteilen → günstige Agenten für die Schwerstarbeit
einsetzen → um prägnante Belege bitten → Orchestrator-Tokens für die
Entscheidungsebene aufwenden.

Am besten geeignet für: codebasislastige Arbeit, die sich in unabhängige,
parallele Teile aufteilen lässt. Nicht geeignet für triviale Aufgaben,
folgenreiche Arbeit aus einer einzigen Quelle oder wenn keine günstigen
Subagenten verfügbar sind.

Mehr lesen: [skills/efficient-fable/SKILL.md](../skills/efficient-fable/SKILL.md)

### `/skill-zero`

Spezialist für **mechanistische Interpretierbarkeit von Coding-Agenten-LLMs**
mittels linearer Sonden auf dem Residualstrom. Basiert auf Silva, Tu &
Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)).

Der Skill vermittelt dir, wie man:

- **Bearbeitungsergebnisse vorhersagt**, bevor sie auf die Festplatte
  geschrieben werden. Trainiert eine logistische Regressionssonde auf
  verborgenen Zuständen, um abzulesen, ob die kurz bevorstehende Bearbeitung
  eine Regression (◆ Regressionseigenschaft) einführt oder Tests fehlschlagen
  lässt (● Vollständige Korrektheit).
- **Feststellt, ob der Agent mitten in der Ausführung Fortschritte macht.**
  Die ■ Sonde für teilweise Korrektheit liest die Zuversicht des Agenten
  bezüglich der Test-Bestehens-Richtung aus seinen verborgenen Zuständen ab
  (AUC ~0,84 in der Studie).
- **~25 Schritte in den Plan des Agenten hineinsieht.** Der Befund zum
  "latenten Programmierhorizont": eine Sonde kann bereits mehrere Schritte
  im Voraus anzeigen, dass die Trajektorie auf einen fehlschlagenden Zustand
  zusteuert.

Der Skill enthält die konkreten Zahlen der Studie (AUC 0,83, Horizont
k≈25, invertiertes-U-Muster in mittleren Schichten), die 4 kanonischen
Eigenschaften, die Kontrolldisziplin mit vertauschten Labels, das Detail
zur benchmarkübergreifenden Übertragbarkeit sowie 5 konkrete
Fehlermodi.

Mehr lesen: [skills/skill-zero/SKILL.md](../skills/skill-zero/SKILL.md)

### `/super-skill`

Die Synthese: **Rigor + Delegation** in einem Skill. Zwei Betriebsmodi:

- **Rigor-Modus** (Standard) — verwendet die GPT-5.6-Sol-7-Schritte-Schleife,
  10 Prinzipien, 9-stufige Architektur, Aufgabenklassifizierung, Risikoregister,
  Validierungsebenen, Akzeptanz-/Ablehnungskriterien, kontradiktorische Prüfung
  und Checkliste vor Auslieferung.
- **Delegationsmodus** — für codebasislastige oder tokenintensive Arbeit, die
  sich in unabhängige, parallele Abschnitte aufteilen lässt, wird das
  Efficient-Fable-Delegationsmuster mit dem Prüfprotokoll verwendet.

Der Modus wird während der Aufnahme ausgewählt. Der Skill enthält außerdem
**5 delegationsspezifische Risiken** (R-D1 bis R-D5), einen 9. Test
(**T-09: Prüfung von Subagenten-Berichten**) und das in die Testmatrix
eingebaute Prüfprotokoll.

**Selbst-evolvierend.** Der Skill kann im Laufe der Zeit wachsen, sich
verbessern und sich selbst zurückschneiden, unter einer strengen internen
**Verfassung mit 7 Klauseln**, die Müll verhindert. Die Verfassung (in
`skills/super-skill/references/self-evolution.md`):

- **C-1** Evidenzbasiert — jede Änderung muss eine Studie, offizielle
  Dokumentation, einen Code-Link oder eine verifizierte Beobachtung zitieren
- **C-2** Begrenzter Umfang — nur Rigor- + Delegations-Frameworks, keine
  Nutzerprojekte
- **C-3** Konservativ — keine spekulativen Ergänzungen
- **C-4** Qualitätsuntergrenze — neue Inhalte müssen mindestens so gut sein
  wie das, was sie ersetzen
- **C-5** Reversibel — jede Änderung hat eine Changelog-Zeile
- **C-6** Anti-Müll-Filter — vage Füllinhalte werden abgelehnt
- **C-7** Datenschutz — keine personenbezogenen Daten, keine
  projektspezifischen Inhalte

Jede einzelne fehlgeschlagene Klausel = Ablehnung der Änderung. Keine
Ausnahmen.

Mehr lesen: [skills/super-skill/SKILL.md](../skills/super-skill/SKILL.md)

## Wie sie zusammenpassen

<div align="center">

```
        ┌────────────────────────────────┐
        │       Nutzeraufgabe trifft ein │
        └───────────────┬────────────────┘
                         │
                         ▼
           ┌────────────────────────┐
           │ welche Art von Aufgabe?│
           └────────┬───────────────┘
     ┌───────────────────┼────────────────────────┐
     │                   │                        │
allgemeine        Code-alles mit          ich habe mehrere
Aufgabe           Zugriff auf             Agenten + möchte
     │            verborgenem Zustand     ein Meta-Framework
     ▼                   │                        │
┌─────────────────┐      ▼                        ▼
│ think-like-     │   ┌─────────────┐   ┌──────────────────┐
│ gpt-5-6         │   │ skill-zero  │   │  super-skill     │
│                 │   │             │   │  (rigor+deleg.,  │
│ 7-Schritte-     │   │ lineare     │   │   selbst-        │
│ Schleife        │   │ Sonden auf  │   │   evolvierend)   │
│ 10 Prinzipien   │   │ verborgenen │   │                  │
│ Risikoregister  │   │ Zuständen   │   └──────────────────┘
│ Validierung     │   │             │            │
└────────┬────────┘   └─────────────┘            │
         │                                        │
         └──────────────────┬─────────────────────┘
                             │
                             ▼
                ┌─────────────────────┐
                │ efficient-fable     │
                │ (Delegationsmuster) │
                │                     │
                │ 5-Schritte-Muster,  │
                │ Handoff-Pakete,     │
                │ Prüfprotokoll       │
                └─────────────────────┘
                             ▲
                             │
          innerhalb von super-skill im Delegationsmodus verwendet
          eigenständig für tokenintensive Parallelarbeit verwendet
```

</div>

`super-skill` ist die empfohlene Standardwahl für die meisten komplexen
Aufgaben. Er enthält:

- Das vollständige TLG-Rigor-Framework (als äußere Schleife)
- Das Efficient-Fable-Delegationsmuster (als Schnellspur)
- Das Selbst-Evolutions-Protokoll (mit der Verfassung mit 7 Klauseln)

Die anderen drei Skills bleiben für ihre spezifischen Auslöser weiterhin
verfügbar.

## Installation

Die Skills sind dafür ausgelegt, in das Skills-Verzeichnis eines beliebigen
Agenten eingefügt zu werden. Es gibt drei Installationswege — wähle den, der
zu deinem Agenten passt.

### Weg A — Plugin-/Marketplace-Installation (empfohlen)

Dieses Repository wird als **Claude-Code-Plugin-Marketplace** und als
**Codex-Plugin** ausgeliefert, sodass du mit einem einzigen Befehl
installieren kannst:

```bash
# Claude Code
/plugin marketplace add anshmajumdar/skill-x
/plugin install skill-x@skill-x

# Codex
codex plugin install anshmajumdar/skill-x

# Or generic npx (Vercel's skills CLI)
npx skills@latest add anshmajumdar/skill-x --skill super-skill
```

Siehe [PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md) für die vollständige
Installationsmatrix pro Agent (Claude Code, Codex, OpenCode, Copilot,
sowie den generischen `cp -r`-Fallback).

### Weg B — Manuelle Installation (funktioniert für jeden Agenten)

```bash
# Clone
git clone https://github.com/anshmajumdar/skill-x.git
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

### Installationspfade pro Agent

| Agent | Skills-Pfad | Plugin? |
|---|---|---|
| mavis | `~/.mavis/agents/<name>/skills/` | k. A. |
| Claude Code | `~/.claude/skills/` (Nutzer) oder `.claude/skills/` (Projekt) | ja — `.claude-plugin/marketplace.json` |
| Codex CLI | `~/.codex/skills/` (Nutzer) oder `.codex/skills/` (Projekt) | ja — `.codex-plugin/plugin.json` |
| OpenCode | `~/.config/opencode/skills/` (Nutzer) oder `.opencode/skills/` (Projekt) | nur manuell |
| GitHub Copilot | `.github/skills/` (Projekt) oder VS-Code-Nutzerverzeichnis | nur manuell |

### Überprüfen, ob ein Skill korrekt installiert wurde

```bash
# Lint a single skill
node $(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)/scripts/lint-skill.js skills/super-skill/

# Lint all skills in this repo
./scripts/lint-all.sh
```

## Selbst-Evolution (nur bei `/super-skill`)

<br>

![Self-evolving: detect, evidence, constitution check, apply, verify](../media/banner.png)

<br>

`super-skill` ist der einzige Skill, der sich selbst weiterentwickelt. Das
Protokoll befindet sich in
[`skills/super-skill/references/self-evolution.md`](../skills/super-skill/references/self-evolution.md).
Auslöser:

- **Explizit**: "evolve this skill", "superskill evolve"
- **Erkennung veralteter Inhalte**: eine bestimmte Zahl, ein Link oder eine
  Behauptung ist nachweislich veraltet
- **Erkennung besserer Techniken**: eine eindeutig bessere Technik wird
  verfügbar
- **Erkennung von Müllinhalten**: ein Abschnitt hat seine Daseinsberechtigung
  verloren

Das 5-Schritte-Verfahren: Erkennen → Belege sammeln → Verfassungsprüfung
(alle 7 Klauseln) → Anwenden → Verifizieren (erneutes Linting). Das
Changelog oben in `super-skill/SKILL.md` protokolliert jede Änderung.

## Mitwirken

Wir freuen uns über Beiträge. Siehe [CONTRIBUTING.md](../CONTRIBUTING.md) für
den Arbeitsablauf sowie das im Skill enthaltene **Selbst-Evolutions-
Protokoll** für Hinweise zum Qualitätsmaßstab. Kurzfassung:

1. Jeder Skill ist eigenständig. Das sollte so bleiben.
2. Referenzdokumente folgen dem Prinzip der schrittweisen Offenlegung —
   `SKILL.md` ist die Übersicht, `references/*.md` enthält die Details.
3. Lint-Durchläufe sind erforderlich: `./scripts/lint-all.sh`.
4. Keine externen Netzwerkaufrufe zur Laufzeit. Skills sind statisches
   Markdown.
5. Keine personenbezogenen Daten, keine projektspezifischen Inhalte.

## Wie die Skills entstanden sind

| Skill | Quelle | Synthetisiert |
|---|---|---|
| `think-like-gpt-5-6` | GPT-5.6-Sol-Execution-Intelligence-Blueprint (v1.0, 2026-07-16) | destilliert in 7-Schritte-Schleife, 10 Prinzipien, 9-stufige Architektur, 20-zeiliges Risikoregister |
| `efficient-fable` | [BuilderIO/skills](https://github.com/BuilderIO/skills/tree/main/skills/efficient-fable) | überarbeitet: über Fable hinaus verallgemeinert, Hinweise hinzugefügt, wann NICHT zu verwenden, mit dem Rest der Sammlung querverwiesen |
| `skill-zero` | Silva, Tu, Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)) | die lineare Sondenmethodik extrahiert, 4 kanonische Eigenschaften, erwartete AUC-Werte, 5 Fehlermodi |
| `super-skill` | Synthese aus `think-like-gpt-5-6` + `efficient-fable` | 5 Delegationsrisiken, Modusauswahl-Ablauf, Prüfprotokoll, 9. Test T-09, Selbst-Evolutions-Protokoll mit Verfassung mit 7 Klauseln hinzugefügt |

## Lizenz

MIT. Siehe [LICENSE](../LICENSE).

## Verweise

- [PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md) — vollständige Installationsmatrix pro Agent (Claude Code, Codex, OpenCode, Copilot, manuell)
- [CONTRIBUTING.md](../CONTRIBUTING.md) — wie man einen Skill hinzufügt oder ändert
- [LICENSE](../LICENSE) — MIT
- [SECURITY.md](../SECURITY.md) — wie man ein Sicherheitsproblem meldet
- [CITATION.cff](../CITATION.cff) — wie man diese Sammlung zitiert
- [.github/workflows/lint-skills.yml](../.github/workflows/lint-skills.yml) — CI, das jeden Skill lintet
- [scripts/lint-all.sh](../scripts/lint-all.sh) — lokales Äquivalent
- [.claude-plugin/marketplace.json](../.claude-plugin/marketplace.json) — Claude-Code-Plugin-Manifest
- [.codex-plugin/plugin.json](../.codex-plugin/plugin.json) — Codex-Plugin-Manifest

---

Erstellt mit Rigor + Delegation + einer Verfassung mit 7 Klauseln. Gib
einen Stern, wenn es nützlich ist.
