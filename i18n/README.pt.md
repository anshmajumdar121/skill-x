[![English](https://img.shields.io/badge/English-Read-2b2b2b)](../README.md) [![Español](https://img.shields.io/badge/Espa%C3%B1ol-Read-e67e22)](README.es.md) [![Português](https://img.shields.io/badge/Portugu%C3%AAs-Read-27ae60)](README.pt.md) [![日本語](https://img.shields.io/badge/日本語-Read-16a085)](README.ja.md) [![한국어](https://img.shields.io/badge/한국어-Read-2980b9)](README.ko.md) [![Deutsch](https://img.shields.io/badge/Deutsch-Read-8e44ad)](README.de.md) [![Français](https://img.shields.io/badge/Fran%C3%A7ais-Read-2c3e50)](README.fr.md) [![Türkçe](https://img.shields.io/badge/T%C3%BCrk%C3%A7e-Read-c0392b)](README.tr.md) [![繁體中文](https://img.shields.io/badge/繁體中文-Read-d35400)](README.zh-Hant.md) [![简体中文](https://img.shields.io/badge/简体中文-Read-e74c3c)](README.zh-Hans.md) [![Русский](https://img.shields.io/badge/Русский-Read-7f8c8d)](README.ru.md)

![Skill X](../media/skill-x.gif)

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](../LICENSE)
[![Skills](https://img.shields.io/badge/skills-4-purple.svg)](#skills-at-a-glance)
[![Self-evolving](https://img.shields.io/badge/super--skill-self--evolving-brightgreen.svg)](../skills/super-skill/references/self-evolution.md)

Uma coleção pequena e componível de skills de agente para código, pesquisa
e orquestração multiagente. Cada skill é autocontida, baseada em evidências,
e acompanha documentação de referência com divulgação progressiva.

> Desenvolvido por [anshmajumdar](https://github.com/anshmajumdar121). Skills
> refinadas a partir de pesquisas públicas, do blueprint de execução
> GPT-5.6 Sol, e da coleção [BuilderIO/skills](https://github.com/BuilderIO/skills).

## Início Rápido

```bash
# Clone o repositório
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# Escolha uma skill para instalar (cópia manual)
cp -r skills/think-like-gpt-5-6   ~/.mavis/agents/<your-agent>/skills/
cp -r skills/efficient-fable      ~/.mavis/agents/<your-agent>/skills/
cp -r skills/skill-zero           ~/.mavis/agents/<your-agent>/skills/
cp -r skills/super-skill          ~/.mavis/agents/<your-agent>/skills/

# Ou instale todas
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Verifique se foram registradas
mavis skill list
```

> Substitua `<your-agent>` pelo nome do seu agente (por exemplo, `mavis`,
> `claude`, `codex` — onde quer que suas skills residam).

## Skills em Resumo

| Skill | Linhas | O que faz |
|---|---|---|
| [`think-like-gpt-5-6`](../skills/think-like-gpt-5-6/SKILL.md) | 1.547 | Framework de rigor completo: loop de 7 etapas, 10 princípios, registro de riscos com 20 linhas, 8 camadas de validação, 6 critérios de aceitação + 10 de rejeição, 18 perguntas de revisão adversarial, checklist de pré-entrega com 7 seções. Ideal para qualquer tarefa não trivial. |
| [`efficient-fable`](../skills/efficient-fable/SKILL.md) | 302 | Padrão de delegação: orquestrador + subagentes de baixo custo. Padrão de 5 etapas, formato de pacote de transferência (handoff), protocolo de verificação, 3-5× mais barato e 2-4× mais rápido em trabalhos paralelizáveis. |
| [`skill-zero`](../skills/skill-zero/SKILL.md) | 1.598 | Especialista: sondas lineares (linear probes) no fluxo residual de LLMs de agentes de codificação. Decodifica propriedades do programa atual (boa formação, correção total/parcial, regressão) e prevê resultados de edições futuras até ~25 passos à frente. Baseado em Silva, Tu & Monperrus 2026 (arXiv:2607.05188). |
| [`super-skill`](../skills/super-skill/SKILL.md) | 2.096 | Síntese de rigor + delegação. Dois modos (rigor / delegação), fluxo de seleção de modo, protocolo de verificação, 5 riscos específicos de delegação. **Autoevolutiva** sob uma constituição de 7 cláusulas. |

### Quando usar qual skill

- **Tenho uma tarefa não trivial e quero artefatos auditáveis.**
  → `think-like-gpt-5-6`
- **Tenho trabalho intenso em código-base que pode ser paralelizado e
  quero economizar tokens.** → `efficient-fable`
- **Quero monitorar / direcionar o estado interno de um agente de
  codificação (interpretabilidade mecanicista).** → `skill-zero`
- **Quero rigor E eficiência de delegação, em uma única skill.**
  → `super-skill`
- **Quero uma skill que se aprimora ao longo do tempo, com barreiras
  rígidas contra conteúdo de baixa qualidade.** → `super-skill` (a
  única com o protocolo de autoevolução)

## Detalhes das Skills

### `/think-like-gpt-5-6`

Aplique o framework de inteligência de execução GPT-5.6 Sol. Converta
uma solicitação imperfeita em um entregável validado e auditável através
do **loop de 7 etapas**: Observar → Interpretar → Decidir → Agir →
Verificar → Reparar → Registrar. Sustentado pelos **10 princípios
norteadores**, pela **arquitetura de 9 estágios**, por um **registro de
riscos com 20 linhas**, **6 critérios de aceitação + 10 de rejeição**,
uma **revisão adversarial de 18 perguntas**, e um **checklist de
pré-entrega com 7 seções**.

Ideal para: codificação em múltiplas etapas, pesquisa com citações,
criação de artefatos, ações operacionais, orientação de alto risco, e
qualquer tarefa em que você queira um raciocínio inspecionável em vez
de uma resposta fluente de caixa-preta.

Leia mais: [skills/think-like-gpt-5-6/SKILL.md](../skills/think-like-gpt-5-6/SKILL.md)

### `/efficient-fable`

Use um modelo de ponta de alto custo como **orquestrador, arquiteto,
sintetizador e juiz final**. Use subagentes mais baratos para o
**trabalho pesado delimitado** (varreduras de repositórios grandes,
redução de logs longos, patches de código estreitos, verificação via
navegador/testes). O **protocolo de verificação** determina: *trate os
relatórios de subagentes como pistas, não como fatos* — sempre reabra
o arquivo citado, confirme a referência de linha e revise o diff antes
de entregar.

O **padrão de delegação de 5 etapas**: nomeie o risco caro → divida em
fatias paralelas → use agentes baratos para o trabalho pesado → peça
evidências concisas → gaste os tokens do orquestrador na camada de
decisão.

Ideal para: trabalho intenso em código-base que pode ser dividido em
partes paralelas independentes. Evite para tarefas triviais, trabalho
de fonte única de alto risco, ou quando não há subagentes baratos
disponíveis.

Leia mais: [skills/efficient-fable/SKILL.md](../skills/efficient-fable/SKILL.md)

### `/skill-zero`

Especialista em **interpretabilidade mecanicista de LLMs de agentes de
codificação** via sondas lineares no fluxo residual. Baseado em Silva,
Tu & Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)).

A skill ensina como:

- **Prever resultados de edições** antes que cheguem ao disco. Treinar
  uma sonda de regressão logística sobre estados ocultos para
  identificar se a edição prestes a ser escrita introduzirá uma
  regressão (propriedade ◆ Regressão) ou falhará em testes
  (● Correção Total).
- **Saber se o agente está progredindo** no meio da trajetória. A sonda
  ■ Correção Parcial lê a confiança do agente sobre a direção de
  aprovação nos testes a partir de seus estados ocultos (AUC ~0,84 no
  artigo).
- **Enxergar ~25 passos à frente no plano do agente.** A descoberta do
  "horizonte de programação latente": uma sonda pode sinalizar, vários
  passos antes, que a trajetória está caminhando para um estado de
  falha.

A skill inclui os números específicos do artigo (AUC 0,83, horizonte
k≈25, padrão de U invertido em camadas intermediárias), as 4
propriedades canônicas, a disciplina de controle com rótulos
embaralhados, o detalhe de transferência entre benchmarks, e 5 modos de
falha concretos.

Leia mais: [skills/skill-zero/SKILL.md](../skills/skill-zero/SKILL.md)

### `/super-skill`

A síntese: **rigor + delegação** em uma única skill. Dois modos de
operação:

- **Modo rigor** (padrão) — use o loop de 7 etapas do GPT-5.6 Sol, os
  10 princípios, a arquitetura de 9 estágios, a classificação de
  tarefas, o registro de riscos, as camadas de validação, os critérios
  de aceitação/rejeição, a revisão adversarial e o checklist de
  pré-entrega.
- **Modo delegação** — para trabalho intenso em código-base ou em
  tokens que pode ser dividido em fatias paralelas independentes, use
  o padrão de delegação Efficient Fable com o protocolo de verificação.

O modo é selecionado durante a admissão (intake). A skill também inclui
**5 riscos específicos de delegação** (R-D1 a R-D5), um 9º teste
(**T-09: verificação de relatório de subagente**), e o protocolo de
verificação incorporado na matriz de testes.

**Autoevolutiva.** A skill pode crescer, melhorar e se podar ao longo
do tempo, sob uma rígida **constituição interna de 7 cláusulas** que
impede conteúdo de baixa qualidade. A constituição (em
`skills/super-skill/references/self-evolution.md`):

- **C-1** Baseada em evidências — toda mudança deve citar um artigo,
  documentação oficial, link de código, ou observação verificada
- **C-2** Escopo delimitado — apenas frameworks de rigor + delegação,
  não projetos do usuário
- **C-3** Conservadora — sem adições especulativas
- **C-4** Piso de qualidade — o novo conteúdo deve ser pelo menos tão
  bom quanto o que substitui
- **C-5** Reversível — toda mudança tem uma linha no changelog
- **C-6** Filtro anticonteúdo-de-baixa-qualidade — rejeita
  preenchimento vago
- **C-7** Privacidade — sem dados pessoais, sem conteúdo específico de
  projeto

Qualquer cláusula que falhe = mudança rejeitada. Sem exceções.

Leia mais: [skills/super-skill/SKILL.md](../skills/super-skill/SKILL.md)

## Como Elas se Encaixam

<div align="center">

```
        ┌────────────────────────────────┐
        │   chega uma tarefa do usuário  │
        └───────────────┬────────────────┘
                         │
                         ▼
           ┌────────────────────────┐
           │  que tipo de tarefa?   │
           └────────┬───────────────┘
     ┌───────────────────┼────────────────────────┐
     │                   │                        │
tarefa geral      código com acesso        tenho vários agentes
     │            a estado oculto          + quero um
     │                                     meta-framework
     ▼                   │                        │
┌─────────────────┐      ▼                        ▼
│ think-like-     │   ┌─────────────┐   ┌──────────────────┐
│ gpt-5-6         │   │ skill-zero  │   │  super-skill     │
│                 │   │             │   │  (rigor+deleg.,  │
│ loop de 7       │   │ sondas      │   │   autoevolutiva) │
│ etapas          │   │ lineares em │   │                  │
│ 10 princípios   │   │ estados     │   └──────────────────┘
│ registro de     │   │ ocultos     │            │
│ riscos          │   └─────────────┘            │
│ validação       │                              │
└────────┬────────┘                              │
         │                                        │
         └──────────────────┬─────────────────────┘
                             │
                             ▼
                ┌─────────────────────┐
                │ efficient-fable     │
                │ (padrão de          │
                │  delegação)         │
                │                     │
                │ padrão de 5 etapas, │
                │ pacotes de          │
                │ transferência,      │
                │ protocolo de        │
                │ verificação         │
                └─────────────────────┘
                             ▲
                             │
    usada dentro da super-skill no modo delegação
    usada de forma independente para trabalho paralelo intenso em tokens
```

</div>

`super-skill` é a recomendação padrão para a maioria das tarefas
complexas. Ela contém:

- O framework completo de rigor TLG (como o loop externo)
- O padrão de delegação Efficient Fable (como faixa rápida)
- O protocolo de autoevolução (com a constituição de 7 cláusulas)

As outras três skills continuam disponíveis para seus gatilhos
específicos.

## Instalação

As skills foram projetadas para serem colocadas no diretório de skills
de qualquer agente. Existem três caminhos de instalação — escolha o que
seu agente suportar.

### Caminho A — Instalação via plugin / marketplace (recomendado)

Este repositório é distribuído como um **marketplace de plugins do
Claude Code** e um **plugin do Codex**, para que você possa instalar
com um único comando:

```bash
# Claude Code
/plugin marketplace add anshmajumdar/skill-x
/plugin install skill-x@skill-x

# Codex
codex plugin install anshmajumdar/skill-x

# Ou npx genérico (CLI de skills da Vercel)
npx skills@latest add anshmajumdar/skill-x --skill super-skill
```

Veja [PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md) para a matriz completa de
instalação por agente (Claude Code, Codex, OpenCode, Copilot, além do
fallback genérico `cp -r`).

### Caminho B — Instalação manual (funciona para qualquer agente)

```bash
# Clone
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# Instale uma
cp -r skills/super-skill ~/.mavis/agents/<your-agent>/skills/

# Instale todas
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Verifique
mavis skill list
```

### Caminhos de instalação por agente

| Agente | Caminho das skills | Plugin? |
|---|---|---|
| mavis | `~/.mavis/agents/<name>/skills/` | n/a |
| Claude Code | `~/.claude/skills/` (usuário) ou `.claude/skills/` (projeto) | sim — `.claude-plugin/marketplace.json` |
| Codex CLI | `~/.codex/skills/` (usuário) ou `.codex/skills/` (projeto) | sim — `.codex-plugin/plugin.json` |
| OpenCode | `~/.config/opencode/skills/` (usuário) ou `.opencode/skills/` (projeto) | somente manual |
| GitHub Copilot | `.github/skills/` (projeto) ou diretório de usuário do VS Code | somente manual |

### Verificar se uma skill foi instalada corretamente

```bash
# Lintar uma única skill
node $(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)/scripts/lint-skill.js skills/super-skill/

# Lintar todas as skills deste repositório
./scripts/lint-all.sh
```

## Autoevolução (apenas na `/super-skill`)

<br>

![Autoevolutiva: detectar, evidenciar, verificar constituição, aplicar, verificar](../media/banner.png)

<br>

`super-skill` é a única skill que evolui a si mesma. O protocolo está
em
[`skills/super-skill/references/self-evolution.md`](../skills/super-skill/references/self-evolution.md).
Gatilhos:

- **Explícito**: "evolua esta skill", "superskill evolve"
- **Detecção de conteúdo desatualizado**: um número, link ou afirmação
  específicos estão comprovadamente desatualizados
- **Detecção de técnica melhor**: uma técnica claramente melhor se
  torna disponível
- **Detecção de conteúdo de baixa qualidade**: uma seção não justifica
  mais seu lugar

O procedimento de 5 etapas: Detectar → Evidenciar → Verificar
constituição (todas as 7 cláusulas) → Aplicar → Verificar (relintar).
O changelog no topo de `super-skill/SKILL.md` registra cada mudança.

## Contribuindo

Contribuições são bem-vindas. Veja [CONTRIBUTING.md](../CONTRIBUTING.md)
para o fluxo de trabalho, e o **protocolo de autoevolução** embutido na
skill para orientação sobre o padrão de qualidade. Resumo:

1. Cada skill é autocontida. Mantenha assim.
2. Documentos de referência seguem divulgação progressiva —
   `SKILL.md` é a introdução, `references/*.md` é o detalhe.
3. É necessário passar no lint: `./scripts/lint-all.sh`.
4. Nenhuma chamada de rede externa em tempo de execução. As skills são
   markdown estático.
5. Sem dados pessoais, sem conteúdo específico de projeto.

## Como as Skills Foram Construídas

| Skill | Fonte | Sintetizado |
|---|---|---|
| `think-like-gpt-5-6` | GPT-5.6 Sol Execution-Intelligence Blueprint (v1.0, 2026-07-16) | destilado em loop de 7 etapas, 10 princípios, arquitetura de 9 estágios, registro de riscos com 20 linhas |
| `efficient-fable` | [BuilderIO/skills](https://github.com/BuilderIO/skills/tree/main/skills/efficient-fable) | reajustado: generalizado além do Fable, adicionado quando-NÃO-usar, referenciado de forma cruzada com o restante da coleção |
| `skill-zero` | Silva, Tu, Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)) | extraída a metodologia de sondas lineares, as 4 propriedades canônicas, os números esperados de AUC, 5 modos de falha |
| `super-skill` | síntese de `think-like-gpt-5-6` + `efficient-fable` | adicionados 5 riscos de delegação, fluxo de seleção de modo, protocolo de verificação, 9º teste T-09, protocolo de autoevolução com constituição de 7 cláusulas |

## Licença

MIT. Veja [LICENSE](../LICENSE).

## Referências

- [PLUGIN_INSTALL.md](../PLUGIN_INSTALL.md) — matriz completa de instalação por agente (Claude Code, Codex, OpenCode, Copilot, manual)
- [CONTRIBUTING.md](../CONTRIBUTING.md) — como adicionar ou modificar uma skill
- [LICENSE](../LICENSE) — MIT
- [SECURITY.md](../SECURITY.md) — como reportar um problema de segurança
- [CITATION.cff](../CITATION.cff) — como citar esta coleção
- [.github/workflows/lint-skills.yml](../.github/workflows/lint-skills.yml) — CI que linta cada skill
- [scripts/lint-all.sh](../scripts/lint-all.sh) — equivalente local
- [.claude-plugin/marketplace.json](../.claude-plugin/marketplace.json) — manifesto do plugin Claude Code
- [.codex-plugin/plugin.json](../.codex-plugin/plugin.json) — manifesto do plugin Codex

---

Construído com rigor + delegação + uma constituição de 7 cláusulas.
Deixe uma estrela se for útil.
