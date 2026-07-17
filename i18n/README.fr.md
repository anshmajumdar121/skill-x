[![English](https://img.shields.io/badge/English-Read-2b2b2b)](../README.md) [![Español](https://img.shields.io/badge/Espa%C3%B1ol-Read-e67e22)](README.es.md) [![Português](https://img.shields.io/badge/Portugu%C3%AAs-Read-27ae60)](README.pt.md) [![日本語](https://img.shields.io/badge/日本語-Read-16a085)](README.ja.md) [![한국어](https://img.shields.io/badge/한국어-Read-2980b9)](README.ko.md) [![Deutsch](https://img.shields.io/badge/Deutsch-Read-8e44ad)](README.de.md) [![Français](https://img.shields.io/badge/Fran%C3%A7ais-Read-2c3e50)](README.fr.md) [![Türkçe](https://img.shields.io/badge/T%C3%BCrk%C3%A7e-Read-c0392b)](README.tr.md) [![繁體中文](https://img.shields.io/badge/繁體中文-Read-d35400)](README.zh-Hant.md) [![简体中文](https://img.shields.io/badge/简体中文-Read-e74c3c)](README.zh-Hans.md) [![Русский](https://img.shields.io/badge/Русский-Read-7f8c8d)](README.ru.md)

![Skill X](../media/skill-x.gif)

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE)
[![Skills](https://img.shields.io/badge/skills-4-purple.svg)](#skills-en-un-coup-doeil)
[![Self-evolving](https://img.shields.io/badge/super--skill-self--evolving-brightgreen.svg)](../skills/super-skill/references/self-evolution.md)

Une collection de skills d'agents petite et composable pour le code, la
recherche et l'orchestration multi-agents. Chaque skill est autonome,
fondé sur des preuves, et accompagné de documents de référence à
divulgation progressive.

> Créé par [anshmajumdar](https://github.com/anshmajumdar121). Skills
> affinés à partir de recherches publiques, du blueprint d'exécution
> GPT-5.6 Sol, et de la collection
> [BuilderIO/skills](https://github.com/BuilderIO/skills).

## Démarrage rapide

```bash
# Cloner le dépôt
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# Choisir un skill à installer (copie manuelle)
cp -r skills/think-like-gpt-5-6   ~/.mavis/agents/<your-agent>/skills/
cp -r skills/efficient-fable      ~/.mavis/agents/<your-agent>/skills/
cp -r skills/skill-zero           ~/.mavis/agents/<your-agent>/skills/
cp -r skills/super-skill          ~/.mavis/agents/<your-agent>/skills/

# Ou les installer tous
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Vérifier qu'ils sont bien enregistrés
mavis skill list
```

> Remplacez `<your-agent>` par le nom de votre agent (par exemple
> `mavis`, `claude`, `codex` — l'endroit où vivent vos skills).

## Skills en un coup d'œil

| Skill | Lignes | Ce qu'il fait |
|---|---|---|
| [`think-like-gpt-5-6`](../skills/think-like-gpt-5-6/SKILL.md) | 1 547 | Cadre de rigueur complet : boucle en 7 étapes, 10 principes, registre des risques à 20 lignes, 8 couches de validation, 6 critères d'acceptation + 10 critères de rejet, 18 questions de revue contradictoire, checklist de pré-livraison en 7 sections. Idéal pour toute tâche non triviale. |
| [`efficient-fable`](../skills/efficient-fable/SKILL.md) | 302 | Modèle de délégation : orchestrateur + sous-agents économiques. Modèle en 5 étapes, format de paquet de transfert, protocole de vérification, 3 à 5 fois moins cher et 2 à 4 fois plus rapide sur le travail parallélisable. |
| [`skill-zero`](../skills/skill-zero/SKILL.md) | 1 598 | Spécialiste : sondes linéaires sur le flux résiduel des LLM d'agents de codage. Décode les propriétés du programme en cours (bonne formation, correction totale/partielle, régression) et prédit les résultats des futures modifications jusqu'à environ 25 étapes à l'avance. Basé sur Silva, Tu & Monperrus 2026 (arXiv:2607.05188). |
| [`super-skill`](../skills/super-skill/SKILL.md) | 2 096 | Synthèse rigueur + délégation. Deux modes (rigueur / délégation), flux de sélection de mode, protocole de vérification, 5 risques spécifiques à la délégation. **Auto-évolutif** sous une constitution en 7 clauses. |

### Quand utiliser quel skill

- **J'ai une tâche non triviale et je veux des artefacts vérifiables.**
  → `think-like-gpt-5-6`
- **J'ai un travail lourd sur une base de code qui peut être
  parallélisé et je veux économiser des tokens.** → `efficient-fable`
- **Je veux surveiller / piloter l'état interne d'un agent de codage
  (interprétabilité mécaniste).** → `skill-zero`
- **Je veux à la fois de la rigueur ET de l'efficacité de délégation,
  dans un seul skill.** → `super-skill`
- **Je veux un skill qui s'améliore lui-même au fil du temps, avec
  des garde-fous stricts contre les dérives.** → `super-skill` (le
  seul avec le protocole d'auto-évolution)

## Détails des skills

### `/think-like-gpt-5-6`

Applique le cadre d'intelligence d'exécution GPT-5.6 Sol. Transforme
une demande imparfaite en un livrable validé et vérifiable via la
**boucle en 7 étapes** : Observer → Interpréter → Décider → Agir →
Vérifier → Réparer → Enregistrer. Soutenu par les **10 principes
directeurs**, l'**architecture en 9 étapes**, un **registre des
risques à 20 lignes**, **6 critères d'acceptation + 10 critères de
rejet**, une **revue contradictoire en 18 questions**, et une
**checklist de pré-livraison en 7 sections**.

Idéal pour : le codage en plusieurs étapes, la recherche avec
citations, la création d'artefacts, les actions opérationnelles, les
conseils à enjeux élevés, et toute tâche pour laquelle vous voulez un
raisonnement inspectable plutôt qu'une réponse fluide en boîte noire.

En savoir plus : [skills/think-like-gpt-5-6/SKILL.md](../skills/think-like-gpt-5-6/SKILL.md)

### `/efficient-fable`

Utilise un modèle de pointe coûteux comme **orchestrateur,
architecte, synthétiseur et juge final**. Utilise des sous-agents
moins coûteux pour le **travail lourd mais borné** (analyse de gros
dépôts, réduction de longs journaux, correctifs de code ciblés,
vérification via navigateur/tests). Le **protocole de vérification**
indique : *traitez les rapports des sous-agents comme des pistes, pas
comme des faits* — rouvrez toujours le fichier cité, confirmez la
référence de ligne, et examinez le diff avant de livrer.

Le **modèle de délégation en 5 étapes** : nommer le risque coûteux →
le diviser en tranches parallèles → utiliser des agents économiques
pour le travail lourd → demander des preuves concises → consacrer les
tokens de l'orchestrateur à la couche de décision.

Idéal pour : le travail lourd sur une base de code qui peut être
découpé en tranches parallèles indépendantes. À éviter pour les
tâches triviales, le travail à source unique et à enjeux élevés, ou
lorsqu'aucun sous-agent économique n'est disponible.

En savoir plus : [skills/efficient-fable/SKILL.md](../skills/efficient-fable/SKILL.md)

### `/skill-zero`

Spécialiste de l'**interprétabilité mécaniste des LLM d'agents de
codage** via des sondes linéaires sur le flux résiduel. Basé sur
Silva, Tu & Monperrus 2026
([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)).

Le skill vous apprend à :

- **Prédire les résultats des modifications** avant qu'elles ne
  soient écrites sur le disque. Entraîner une sonde de régression
  logistique sur les états cachés pour déterminer si la modification
  sur le point d'être écrite introduira une régression (propriété
  ◆ Régression) ou échouera aux tests (● Correction totale).
- **Savoir si l'agent progresse** en cours de trajectoire. La sonde
  ■ Correction partielle lit la confiance de l'agent quant à la
  direction de réussite des tests à partir de ses états cachés (AUC
  ~0,84 dans l'article).
- **Voir environ 25 étapes à l'avance dans le plan de l'agent.** La
  découverte de « l'horizon de programmation latent » : une sonde
  peut signaler, plusieurs étapes à l'avance, que la trajectoire se
  dirige vers un état d'échec.

Le skill inclut les chiffres spécifiques de l'article (AUC 0,83,
horizon k≈25, motif en U inversé des couches intermédiaires), les 4
propriétés canoniques, la discipline de contrôle par étiquettes
mélangées, le détail du transfert inter-référentiels, et 5 modes
d'échec concrets.

En savoir plus : [skills/skill-zero/SKILL.md](../skills/skill-zero/SKILL.md)

### `/super-skill`

La synthèse : **rigueur + délégation** en un seul skill. Deux modes
de fonctionnement :

- **Mode rigueur** (par défaut) — utilise la boucle en 7 étapes GPT-5.6
  Sol, les 10 principes, l'architecture en 9 étapes, la
  classification des tâches, le registre des risques, les couches de
  validation, les critères d'acceptation/rejet, la revue
  contradictoire, et la checklist de pré-livraison.
- **Mode délégation** — pour le travail lourd sur une base de code ou
  gourmand en tokens qui peut être divisé en tranches parallèles
  indépendantes, utilise le modèle de délégation Efficient Fable avec
  le protocole de vérification.

Le mode est sélectionné lors de la prise en charge. Le skill inclut
également **5 risques spécifiques à la délégation** (R-D1 à R-D5),
un 9e test (**T-09 : vérification des rapports des sous-agents**), et
le protocole de vérification intégré dans la matrice de tests.

**Auto-évolutif.** Le skill peut croître, s'améliorer et s'élaguer
lui-même au fil du temps, sous une **constitution interne stricte en
7 clauses** qui empêche les dérives. La constitution (dans
`skills/super-skill/references/self-evolution.md`) :

- **C-1** Fondé sur des preuves — chaque changement doit citer un
  article, une documentation officielle, un lien de code, ou une
  observation vérifiée
- **C-2** Portée limitée — uniquement les cadres de rigueur +
  délégation, pas les projets des utilisateurs
- **C-3** Conservateur — pas d'ajouts spéculatifs
- **C-4** Seuil de qualité — le nouveau contenu doit être au moins
  aussi bon que ce qu'il remplace
- **C-5** Réversible — chaque changement a une ligne de journal des
  modifications
- **C-6** Filtre anti-dérive — rejeter le remplissage vague
- **C-7** Confidentialité — aucune donnée personnelle, aucun contenu
  spécifique à un projet

Le manquement à une seule clause = rejet du changement. Sans
exception.

En savoir plus : [skills/super-skill/SKILL.md](../skills/super-skill/SKILL.md)

## Comment ils s'articulent

<div align="center">

```
        ┌────────────────────────────────┐
        │    une tâche utilisateur       │
        │           arrive               │
        └───────────────┬────────────────┘
                         │
                         ▼
           ┌────────────────────────┐
           │ quel type de tâche ?   │
           └────────┬───────────────┘
     ┌───────────────────┼────────────────────────┐
     │                   │                        │
tâche générale    coder n'importe quoi     J'ai plusieurs
     │             avec accès à           agents et je veux
     │             l'état caché           un méta-cadre
     ▼                   │                        │
┌─────────────────┐      ▼                        ▼
│ think-like-     │   ┌─────────────┐   ┌──────────────────┐
│ gpt-5-6         │   │ skill-zero  │   │  super-skill     │
│                 │   │             │   │  (rigueur+délég.,│
│ boucle en       │   │ sondes      │   │   auto-évolutif) │
│ 7 étapes        │   │ linéaires   │   │                  │
│ 10 principes    │   │ sur les     │   └──────────────────┘
│ registre des    │   │ états       │            │
│ risques         │   │ cachés      │            │
│ validation      │   └─────────────┘            │
└────────┬────────┘                              │
         │                                        │
         └──────────────────┬─────────────────────┘
                             │
                             ▼
                ┌─────────────────────┐
                │ efficient-fable     │
                │ (modèle de          │
                │  délégation)        │
                │                     │
                │ modèle en 5 étapes, │
                │ paquets de          │
                │ transfert,          │
                │ protocole de        │
                │ vérification        │
                └─────────────────────┘
                             ▲
                             │
     utilisé au sein de super-skill en mode délégation
     utilisé seul pour le travail parallèle gourmand en tokens
```

</div>

`super-skill` est la valeur par défaut recommandée pour la plupart
des tâches complexes. Il contient :

- Le cadre de rigueur TLG complet (comme boucle externe)
- Le modèle de délégation Efficient Fable (comme voie rapide)
- Le protocole d'auto-évolution (avec la constitution en 7 clauses)

Les trois autres skills restent disponibles pour leurs déclencheurs
spécifiques.

## Installation

Les skills sont conçus pour être déposés dans le répertoire de skills
de n'importe quel agent. Il existe trois chemins d'installation —
choisissez celui que votre agent prend en charge.

### Voie A — Installation via plugin / marketplace (recommandée)

Ce dépôt est fourni comme une **marketplace de plugins Claude Code**
et un **plugin Codex**, afin que vous puissiez installer en une seule
commande :

```bash
# Claude Code
/plugin marketplace add anshmajumdar/skill-x
/plugin install skill-x@skill-x

# Codex
codex plugin install anshmajumdar/skill-x

# Ou npx générique (le CLI de skills de Vercel)
npx skills@latest add anshmajumdar/skill-x --skill super-skill
```

Voir [PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md) pour la matrice
d'installation complète par agent (Claude Code, Codex, OpenCode,
Copilot, plus le repli générique `cp -r`).

### Voie B — Installation manuelle (fonctionne pour tout agent)

```bash
# Cloner
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# En installer un
cp -r skills/super-skill ~/.mavis/agents/<your-agent>/skills/

# Les installer tous
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Vérifier
mavis skill list
```

### Chemins d'installation par agent

| Agent | Chemin des skills | Plugin ? |
|---|---|---|
| mavis | `~/.mavis/agents/<name>/skills/` | n/a |
| Claude Code | `~/.claude/skills/` (utilisateur) ou `.claude/skills/` (projet) | oui — `.claude-plugin/marketplace.json` |
| Codex CLI | `~/.codex/skills/` (utilisateur) ou `.codex/skills/` (projet) | oui — `.codex-plugin/plugin.json` |
| OpenCode | `~/.config/opencode/skills/` (utilisateur) ou `.opencode/skills/` (projet) | manuel uniquement |
| GitHub Copilot | `.github/skills/` (projet) ou répertoire utilisateur VS Code | manuel uniquement |

### Vérifier qu'un skill s'est correctement installé

```bash
# Vérifier un seul skill
node $(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)/scripts/lint-skill.js skills/super-skill/

# Vérifier tous les skills de ce dépôt
./scripts/lint-all.sh
```

## Auto-évolution (uniquement sur `/super-skill`)

<br>

![Auto-évolutif : détecter, prouver, vérifier la constitution, appliquer, valider](../media/banner.png)

<br>

`super-skill` est le seul skill qui évolue de lui-même. Le protocole
se trouve dans
[`skills/super-skill/references/self-evolution.md`](../skills/super-skill/references/self-evolution.md).
Déclencheurs :

- **Explicite** : « fais évoluer ce skill », « superskill evolve »
- **Détection de contenu obsolète** : un chiffre, un lien ou une
  affirmation spécifique est manifestement dépassé
- **Détection d'une meilleure technique** : une technique nettement
  meilleure devient disponible
- **Détection de contenu superflu** : une section ne justifie plus sa
  place

La procédure en 5 étapes : Détecter → Prouver → Vérifier la
constitution (les 7 clauses) → Appliquer → Valider (nouvelle
vérification). Le journal des modifications en haut de
`super-skill/SKILL.md` enregistre chaque changement.

## Contribuer

Nous accueillons volontiers les contributions. Voir
[CONTRIBUTING.md](../CONTRIBUTING.md) pour le processus, et le
**protocole d'auto-évolution** intégré au skill pour des conseils sur
le niveau de qualité attendu. En résumé :

1. Chaque skill est autonome. Gardez-le ainsi.
2. Les documents de référence relèvent de la divulgation
   progressive — `SKILL.md` est la vitrine, `references/*.md` est le
   détail.
3. Les vérifications doivent passer : `./scripts/lint-all.sh`.
4. Aucun appel réseau externe à l'exécution. Les skills sont du
   markdown statique.
5. Aucune donnée personnelle, aucun contenu spécifique à un projet.

## Comment les skills ont été créés

| Skill | Source | Synthèse |
|---|---|---|
| `think-like-gpt-5-6` | Blueprint d'intelligence d'exécution GPT-5.6 Sol (v1.0, 2026-07-16) | condensé en boucle de 7 étapes, 10 principes, architecture en 9 étapes, registre des risques à 20 lignes |
| `efficient-fable` | [BuilderIO/skills](https://github.com/BuilderIO/skills/tree/main/skills/efficient-fable) | retravaillé : généralisé au-delà de Fable, ajout du « quand ne pas l'utiliser », référencé de manière croisée au reste de la collection |
| `skill-zero` | Silva, Tu, Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)) | extraction de la méthodologie des sondes linéaires, des 4 propriétés canoniques, des chiffres d'AUC attendus, des 5 modes d'échec |
| `super-skill` | synthèse de `think-like-gpt-5-6` + `efficient-fable` | ajout de 5 risques de délégation, du flux de sélection de mode, du protocole de vérification, du 9e test T-09, du protocole d'auto-évolution avec constitution en 7 clauses |

## Licence

MIT. Voir [LICENSE](../LICENSE).

## Pointeurs

- [PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md) — matrice d'installation complète par agent (Claude Code, Codex, OpenCode, Copilot, manuelle)
- [CONTRIBUTING.md](../CONTRIBUTING.md) — comment ajouter ou modifier un skill
- [LICENSE](../LICENSE) — MIT
- [SECURITY.md](../SECURITY.md) — comment signaler un problème de sécurité
- [CITATION.cff](../CITATION.cff) — comment citer cette collection
- [.github/workflows/lint-skills.yml](../.github/workflows/lint-skills.yml) — CI qui vérifie chaque skill
- [scripts/lint-all.sh](../scripts/lint-all.sh) — équivalent local
- [.claude-plugin/marketplace.json](../.claude-plugin/marketplace.json) — manifeste du plugin Claude Code
- [.codex-plugin/plugin.json](../.codex-plugin/plugin.json) — manifeste du plugin Codex

---

Construit avec rigueur + délégation + une constitution en 7 clauses.
Mettez une étoile si utile.
