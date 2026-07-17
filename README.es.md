[![English](https://img.shields.io/badge/English-Read-2b2b2b)](README.md) [![Español](https://img.shields.io/badge/Espa%C3%B1ol-Read-e67e22)](README.es.md) [![Português](https://img.shields.io/badge/Portugu%C3%AAs-Read-27ae60)](README.pt.md) [![日本語](https://img.shields.io/badge/日本語-Read-16a085)](README.ja.md) [![한국어](https://img.shields.io/badge/한국어-Read-2980b9)](README.ko.md) [![Deutsch](https://img.shields.io/badge/Deutsch-Read-8e44ad)](README.de.md) [![Français](https://img.shields.io/badge/Fran%C3%A7ais-Read-2c3e50)](README.fr.md) [![Türkçe](https://img.shields.io/badge/T%C3%BCrk%C3%A7e-Read-c0392b)](README.tr.md) [![繁體中文](https://img.shields.io/badge/繁體中文-Read-d35400)](README.zh-Hant.md) [![简体中文](https://img.shields.io/badge/简体中文-Read-e74c3c)](README.zh-Hans.md) [![Русский](https://img.shields.io/badge/Русский-Read-7f8c8d)](README.ru.md)

![Skill X](media/skill-x.gif)

[![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/skills-4-purple.svg)](#skills-at-a-glance)
[![Self-evolving](https://img.shields.io/badge/super--skill-self--evolving-brightgreen.svg)](skills/super-skill/references/self-evolution.md)

Una colección pequeña y componible de skills de agente para código, investigación y
orquestación multi-agente. Cada skill es autocontenida, basada en evidencia,
y se entrega con documentación de referencia de divulgación progresiva.

> Creado por [anshmajumdar](https://github.com/anshmajumdar121). Skills
> refinadas a partir de investigación pública, el plano de ejecución
> GPT-5.6 Sol, y la colección
> [BuilderIO/skills](https://github.com/BuilderIO/skills).

## Inicio Rápido

```bash
# Clonar el repositorio
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# Elegir una skill para instalar (copia manual)
cp -r skills/think-like-gpt-5-6   ~/.mavis/agents/<your-agent>/skills/
cp -r skills/efficient-fable      ~/.mavis/agents/<your-agent>/skills/
cp -r skills/skill-zero           ~/.mavis/agents/<your-agent>/skills/
cp -r skills/super-skill          ~/.mavis/agents/<your-agent>/skills/

# O instalarlas todas
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Verificar que se registraron
mavis skill list
```

> Reemplaza `<your-agent>` con el nombre de tu agente (por ejemplo, `mavis`,
> `claude`, `codex`, donde sea que vivan tus skills).

## Skills de un Vistazo

| Skill | Líneas | Qué hace |
|---|---|---|
| [`think-like-gpt-5-6`](skills/think-like-gpt-5-6/SKILL.md) | 1,547 | Marco de rigor completo: bucle de 7 pasos, 10 principios, registro de riesgos de 20 filas, 8 capas de validación, 6 criterios de aceptación + 10 de rechazo, 18 preguntas de revisión adversarial, lista de verificación previa a la entrega de 7 secciones. Ideal para cualquier tarea no trivial. |
| [`efficient-fable`](skills/efficient-fable/SKILL.md) | 302 | Patrón de delegación: orquestador + subagentes económicos. Patrón de 5 pasos, formato de paquete de traspaso, protocolo de verificación, de 3 a 5 veces más económico y de 2 a 4 veces más rápido en trabajo paralelizable. |
| [`skill-zero`](skills/skill-zero/SKILL.md) | 1,598 | Especialista: sondas lineales en el flujo residual de los LLM de agentes de codificación. Decodifica las propiedades actuales del programa (buena formación, corrección total/parcial, regresión) y predice resultados de ediciones futuras hasta ~25 pasos por adelantado. Construido sobre Silva, Tu y Monperrus 2026 (arXiv:2607.05188). |
| [`super-skill`](skills/super-skill/SKILL.md) | 2,096 | Síntesis de rigor + delegación. Dos modos (rigor / delegación), flujo de selección de modo, protocolo de verificación, 5 riesgos específicos de delegación. **Auto-evolutiva** bajo una constitución de 7 cláusulas. |

### Cuándo usar cada skill

- **Tengo una tarea no trivial y quiero artefactos auditables.**
  → `think-like-gpt-5-6`
- **Tengo trabajo intensivo en código base que se puede paralelizar y
  quiero ahorrar tokens.** → `efficient-fable`
- **Quiero monitorear / dirigir el estado interno de un agente de
  codificación (interpretabilidad mecanística).** → `skill-zero`
- **Quiero rigor Y eficiencia de delegación, en una sola skill.**
  → `super-skill`
- **Quiero una skill que se mejore a sí misma con el tiempo, con
  barreras estrictas contra la basura.** → `super-skill` (la única
  con el protocolo de autoevolución)

## Detalles de las Skills

### `/think-like-gpt-5-6`

Aplica el marco de inteligencia de ejecución GPT-5.6 Sol. Convierte una
solicitud imperfecta en un entregable validado y auditable a través del
**bucle de 7 pasos**: Observar → Interpretar → Decidir → Actuar → Verificar →
Reparar → Registrar. Respaldado por los **10 principios rectores**, la
**arquitectura de 9 etapas**, un **registro de riesgos de 20 filas**, **6
criterios de aceptación + 10 de rechazo**, una **revisión adversarial de
18 preguntas**, y una **lista de verificación previa a la entrega de 7
secciones**.

Ideal para: codificación de varios pasos, investigación con citas, creación
de artefactos, acciones operativas, orientación de alto riesgo, y cualquier
tarea donde se desee un razonamiento inspeccionable en lugar de una
respuesta fluida de caja negra.

Leer más: [skills/think-like-gpt-5-6/SKILL.md](skills/think-like-gpt-5-6/SKILL.md)

### `/efficient-fable`

Usa un modelo de frontera de alto costo como el **orquestador, arquitecto,
sintetizador y juez final**. Usa subagentes más económicos para el
**trabajo pesado acotado** (escaneos de repositorios grandes, reducción de
registros largos, parches de código acotados, verificación de navegador/
pruebas). El **protocolo de verificación** dice: *trata los informes de
los subagentes como pistas, no como hechos* — siempre reabre el archivo
citado, confirma la referencia de línea y revisa el diff antes de
publicar.

El **patrón de delegación de 5 pasos**: nombra el riesgo costoso → divide
en fragmentos paralelos → usa agentes económicos para el trabajo pesado →
solicita evidencia concisa → gasta los tokens del orquestador en la capa
de decisión.

Ideal para: trabajo intensivo en código base que se pueda dividir en
piezas paralelas independientes. Evitar para tareas triviales, trabajo de
fuente única de alto riesgo, o cuando no hay subagentes económicos
disponibles.

Leer más: [skills/efficient-fable/SKILL.md](skills/efficient-fable/SKILL.md)

### `/skill-zero`

Especialista en **interpretabilidad mecanística de LLM de agentes de
codificación** mediante sondas lineales en el flujo residual. Basado en
Silva, Tu y Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)).

La skill enseña cómo:

- **Predecir resultados de ediciones** antes de que lleguen al disco.
  Entrenar una sonda de regresión logística sobre estados ocultos para
  leer si la edición a punto de escribirse introducirá una regresión
  (propiedad ◆ Regresión) o fallará las pruebas (● Corrección Total).
- **Saber si el agente está progresando** a mitad de la trayectoria.
  La sonda ■ Corrección Parcial lee la confianza del agente sobre la
  dirección de aprobación de pruebas a partir de sus estados ocultos
  (AUC ~0.84 en el artículo).
- **Ver ~25 pasos hacia adelante en el plan del agente.** El hallazgo del
  "horizonte de programación latente": una sonda puede señalar, varios
  pasos por adelantado, que la trayectoria se dirige hacia un estado de
  fallo.

La skill incluye los números específicos del artículo (AUC 0.83,
horizonte k≈25, patrón de U invertida en capas intermedias), las 4
propiedades canónicas, la disciplina de control de etiquetas mezcladas,
el detalle de transferencia entre benchmarks, y 5 modos de fallo
concretos.

Leer más: [skills/skill-zero/SKILL.md](skills/skill-zero/SKILL.md)

### `/super-skill`

La síntesis: **rigor + delegación** en una sola skill. Dos modos de
operación:

- **Modo rigor** (predeterminado) — usa el bucle de 7 pasos GPT-5.6 Sol,
  10 principios, arquitectura de 9 etapas, clasificación de tareas,
  registro de riesgos, capas de validación, criterios de aceptación/
  rechazo, revisión adversarial, y lista de verificación previa a la
  entrega.
- **Modo delegación** — para trabajo intensivo en código base o en
  tokens que se pueda dividir en fragmentos paralelos independientes,
  usa el patrón de delegación Efficient Fable con el protocolo de
  verificación.

El modo se selecciona durante la admisión. La skill también incluye **5
riesgos específicos de delegación** (R-D1 a R-D5), una novena prueba
(**T-09: verificación de informes de subagentes**), y el protocolo de
verificación integrado en la matriz de pruebas.

**Auto-evolutiva.** La skill puede crecer, mejorar y podarse a sí misma
con el tiempo, bajo una estricta **constitución interna de 7 cláusulas**
que evita la basura. La constitución (en
`skills/super-skill/references/self-evolution.md`):

- **C-1** Basada en evidencia — cada cambio debe citar un artículo,
  documentación oficial, enlace de código, u observación verificada
- **C-2** Alcance acotado — solo marcos de rigor + delegación, no
  proyectos de usuario
- **C-3** Conservadora — sin adiciones especulativas
- **C-4** Piso de calidad — el contenido nuevo debe ser al menos tan
  bueno como lo que reemplaza
- **C-5** Reversible — cada cambio tiene una fila de registro de cambios
- **C-6** Filtro anti-basura — rechaza relleno vago
- **C-7** Privacidad — sin datos personales, sin contenido específico de
  proyecto

Cualquier cláusula individual que falle = cambio rechazado. Sin
excepciones.

Leer más: [skills/super-skill/SKILL.md](skills/super-skill/SKILL.md)

## Cómo Encajan Entre Sí

<div align="center">

```
        ┌────────────────────────────────┐
        │    llega una tarea del usuario │
        └───────────────┬────────────────┘
                         │
                         ▼
           ┌────────────────────────┐
           │ ¿qué tipo de tarea es? │
           └────────┬───────────────┘
     ┌───────────────────┼────────────────────────┐
     │                   │                        │
tarea general    código con acceso     tengo múltiples
     │            a estado oculto      agentes y quiero
     │                                 un meta-marco
     ▼                   │                        │
┌─────────────────┐      ▼                        ▼
│ think-like-     │   ┌─────────────┐   ┌──────────────────┐
│ gpt-5-6         │   │ skill-zero  │   │  super-skill     │
│                 │   │             │   │  (rigor+deleg.,  │
│ bucle de 7      │   │ sondas      │   │   autoevolutiva) │
│ pasos           │   │ lineales    │   │                  │
│ 10 principios   │   │ en estados  │   └──────────────────┘
│ registro de     │   │ ocultos     │            │
│ riesgos         │   └─────────────┘            │
│ validación      │                              │
└────────┬────────┘                              │
         │                                        │
         └──────────────────┬─────────────────────┘
                             │
                             ▼
                ┌─────────────────────┐
                │ efficient-fable     │
                │ (patrón de          │
                │  delegación)        │
                │                     │
                │ patrón de 5 pasos,  │
                │ paquetes de         │
                │ traspaso,           │
                │ protocolo de        │
                │ verificación        │
                └─────────────────────┘
                             ▲
                             │
     usada dentro de super-skill en modo delegación
     usada de forma independiente para trabajo paralelo
     intensivo en tokens
```

</div>

`super-skill` es la opción predeterminada recomendada para la mayoría de
las tareas complejas. Contiene:

- El marco de rigor TLG completo (como el bucle externo)
- El patrón de delegación Efficient Fable (como carril rápido)
- El protocolo de autoevolución (con la constitución de 7 cláusulas)

Las otras tres skills siguen disponibles para sus disparadores
específicos.

## Instalación

Las skills están diseñadas para colocarse en el directorio de skills de
cualquier agente. Hay tres rutas de instalación; elige la que soporte tu
agente.

### Ruta A — Instalación por plugin / marketplace (recomendado)

Este repositorio se distribuye como un **marketplace de plugins de
Claude Code** y un **plugin de Codex** para que puedas instalarlo con
un solo comando:

```bash
# Claude Code
/plugin marketplace add anshmajumdar/skill-x
/plugin install skill-x@skill-x

# Codex
codex plugin install anshmajumdar/skill-x

# O npx genérico (CLI de skills de Vercel)
npx skills@latest add anshmajumdar/skill-x --skill super-skill
```

Consulta [PLUGIN_INSTALL.md](PLUGIN_INSTALL.md) para la matriz completa
de instalación por agente (Claude Code, Codex, OpenCode, Copilot, más
el respaldo genérico `cp -r`).

### Ruta B — Instalación manual (funciona para cualquier agente)

```bash
# Clonar
git clone https://github.com/anshmajumdar/skill-x.git
cd skill-x

# Instalar una
cp -r skills/super-skill ~/.mavis/agents/<your-agent>/skills/

# Instalar todas
for d in skills/*/; do
  cp -r "$d" ~/.mavis/agents/<your-agent>/skills/
done

# Verificar
mavis skill list
```

### Rutas de instalación por agente

| Agente | Ruta de skills | ¿Plugin? |
|---|---|---|
| mavis | `~/.mavis/agents/<name>/skills/` | n/a |
| Claude Code | `~/.claude/skills/` (usuario) o `.claude/skills/` (proyecto) | sí — `.claude-plugin/marketplace.json` |
| Codex CLI | `~/.codex/skills/` (usuario) o `.codex/skills/` (proyecto) | sí — `.codex-plugin/plugin.json` |
| OpenCode | `~/.config/opencode/skills/` (usuario) o `.opencode/skills/` (proyecto) | solo manual |
| GitHub Copilot | `.github/skills/` (proyecto) o directorio de usuario de VS Code | solo manual |

### Verificar que una skill se instaló correctamente

```bash
# Verificar una sola skill
node $(mavis skill show skill-creator | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' | xargs dirname)/scripts/lint-skill.js skills/super-skill/

# Verificar todas las skills en este repositorio
./scripts/lint-all.sh
```

## Autoevolución (solo en `/super-skill`)

<br>

![Self-evolving: detect, evidence, constitution check, apply, verify](media/banner.png)

<br>

`super-skill` es la única skill que evoluciona por sí misma. El
protocolo se encuentra en
[`skills/super-skill/references/self-evolution.md`](skills/super-skill/references/self-evolution.md).
Disparadores:

- **Explícito**: "evolve this skill", "superskill evolve"
- **Detección de contenido obsoleto**: un número, enlace o afirmación
  específicos están demostrablemente desactualizados
- **Detección de técnica mejor**: una técnica claramente mejor está
  disponible
- **Detección de contenido basura**: una sección ya no se justifica

El procedimiento de 5 pasos: Detectar → Evidenciar → Verificación
constitucional (las 7 cláusulas) → Aplicar → Verificar (relint). El
registro de cambios en la parte superior de `super-skill/SKILL.md`
registra cada cambio.

## Contribuir

Aceptamos contribuciones. Consulta [CONTRIBUTING.md](CONTRIBUTING.md)
para conocer el flujo de trabajo, y el **protocolo de autoevolución**
dentro de la skill para orientación sobre el nivel de calidad. La
versión corta:

1. Cada skill es autocontenida. Mantenlo así.
2. Los documentos de referencia son de divulgación progresiva —
   `SKILL.md` es la portada, `references/*.md` es el detalle.
3. Se requiere pasar el lint: `./scripts/lint-all.sh`.
4. Sin llamadas de red externas en tiempo de ejecución. Las skills son
   markdown estático.
5. Sin datos personales, sin contenido específico de proyecto.

## Cómo se Construyeron las Skills

| Skill | Fuente | Sintetizado |
|---|---|---|
| `think-like-gpt-5-6` | GPT-5.6 Sol Execution-Intelligence Blueprint (v1.0, 2026-07-16) | destilado en un bucle de 7 pasos, 10 principios, arquitectura de 9 etapas, registro de riesgos de 20 filas |
| `efficient-fable` | [BuilderIO/skills](https://github.com/BuilderIO/skills/tree/main/skills/efficient-fable) | reajustado: generalizado más allá de Fable, se añadió cuándo NO usarlo, referenciado de forma cruzada con el resto de la colección |
| `skill-zero` | Silva, Tu, Monperrus 2026 ([arXiv:2607.05188](https://arxiv.org/abs/2607.05188)) | se extrajo la metodología de sondas lineales, las 4 propiedades canónicas, los números de AUC esperados, 5 modos de fallo |
| `super-skill` | síntesis de `think-like-gpt-5-6` + `efficient-fable` | se añadieron 5 riesgos de delegación, flujo de selección de modo, protocolo de verificación, novena prueba T-09, protocolo de autoevolución con constitución de 7 cláusulas |

## Licencia

MIT. Consulta [LICENSE](LICENSE).

## Referencias

- [PLUGIN_INSTALL.md](PLUGIN_INSTALL.md) — matriz completa de instalación por agente (Claude Code, Codex, OpenCode, Copilot, manual)
- [CONTRIBUTING.md](CONTRIBUTING.md) — cómo agregar o modificar una skill
- [LICENSE](LICENSE) — MIT
- [SECURITY.md](SECURITY.md) — cómo reportar un problema de seguridad
- [CITATION.cff](CITATION.cff) — cómo citar esta colección
- [.github/workflows/lint-skills.yml](.github/workflows/lint-skills.yml) — CI que verifica cada skill
- [scripts/lint-all.sh](scripts/lint-all.sh) — equivalente local
- [.claude-plugin/marketplace.json](.claude-plugin/marketplace.json) — manifiesto de plugin de Claude Code
- [.codex-plugin/plugin.json](.codex-plugin/plugin.json) — manifiesto de plugin de Codex

---

Construido con rigor + delegación + una constitución de 7 cláusulas. Danos
una estrella si te resulta útil.
