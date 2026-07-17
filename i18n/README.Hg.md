# Introducing Skill X

I built **Skill X**, an open-source collection of reusable agent skills for **Claude Code, OpenAI Codex, GitHub Copilot, OpenCode, and other compatible AI coding agents**.

Repository:

**https://github.com/anshmajumdar121/skill-x**

Skill X is designed for developers who want their coding agents to plan more carefully, delegate work efficiently, verify results, and handle complex tasks with greater execution discipline.

This is not a generic collection of prompts. Each skill is a structured workflow with defined activation conditions, execution steps, verification requirements, and safety boundaries.

---

## What is included?

### 1. Think Like GPT-5.6

A rigorous execution framework for complex tasks.

It encourages an agent to:

- Inspect the available evidence before acting
- Separate confirmed facts from assumptions
- Detect ambiguity and hidden requirements
- Plan around dependencies and risks
- Verify outputs before claiming completion
- Repair failures instead of hiding them
- Produce auditable artifacts and evidence

Useful for:

- Multi-step coding tasks
- Technical research
- Debugging
- Repository changes
- Document and artifact creation
- High-stakes analysis

> This is an independent workflow inspired by rigorous agent execution. It is not an official OpenAI skill and does not reproduce any model’s private reasoning.

---

### 2. Efficient Fable

A delegation and multi-agent orchestration pattern.

It keeps a capable primary agent responsible for planning and final review while assigning bounded work to cheaper or parallel helper agents.

Useful for:

- Large repository scans
- Parallel technical investigations
- Log analysis
- Targeted code patches
- Test execution
- Browser verification
- Reducing expensive context usage

The primary agent remains responsible for integrating and verifying all delegated work.

---

### 3. Skill Zero

A specialist skill for coding-agent interpretability and linear-probe research.

It covers workflows involving:

- Coding-agent hidden states
- Residual-stream analysis
- Linear probes
- Edit-outcome prediction
- Latent programming horizons
- Monitor-and-steer systems
- Mechanistic interpretability for coding agents

This skill is aimed primarily at researchers and developers experimenting with the internal representations of coding models.

---

### 4. Super Skill

A combined agent workflow that brings together:

- GPT-5.6-style execution rigor
- Efficient task delegation
- Multi-agent orchestration
- Verification and failure repair
- Guarded workflow evolution

It is intended for larger coding or research projects where the agent may need to switch between careful direct execution and parallel delegation.

---

## Why I built it

Coding agents are powerful, but they can still:

- Begin implementation before fully understanding the task
- Miss buried requirements
- Make unsupported assumptions
- Read too much irrelevant repository context
- Delegate tasks without clear boundaries
- Skip tests or verification
- Claim completion despite unresolved problems
- Repeat the same mistakes in later workflows

Skill X attempts to address these problems through explicit planning, evidence collection, controlled delegation, verification, repair, and reusable execution procedures.

---

## Supported agent environments

The skills are designed to be adaptable across:

- Claude Code
- OpenAI Codex
- GitHub Copilot
- OpenCode
- Agent Skills-compatible tools
- Custom coding-agent systems
- Multi-agent orchestration frameworks

Installation paths and supported features may differ between platforms.

---

## Quick start

Clone the repository:

```bash
git clone https://github.com/anshmajumdar121/skill-x.git
cd skill-x

Explore the available skills:

skills/
├── think-like-gpt-5-6/
├── efficient-fable/
├── skill-zero/
└── super-skill/

Each directory contains its own SKILL.md file and supporting resources.

Read the complete installation guide:

https://github.com/anshmajumdar121/skill-x/blob/main/PLUGIN_INSTALL.md

What I would appreciate feedback on

I would especially value feedback from people using Claude Code, Codex, GitHub Copilot, or other coding agents:

Are the skill activation descriptions specific enough?
Does the execution framework improve real task reliability?
Which parts feel too long or restrictive?
How well does the delegation pattern work in large repositories?
Are the installation instructions clear for your preferred agent?
What evaluations or benchmarks would make the project more useful?
Which additional agent workflows should be added?

Issues, pull requests, experiments, and honest criticism are welcome.

Project links
Repository: https://github.com/anshmajumdar121/skill-x
Installation guide: https://github.com/anshmajumdar121/skill-x/blob/main/PLUGIN_INSTALL.md
Contributing: https://github.com/anshmajumdar121/skill-x/blob/main/CONTRIBUTING.md
Security policy: https://github.com/anshmajumdar121/skill-x/blob/main/SECURITY.md
Changelog: https://github.com/anshmajumdar121/skill-x/blob/main/CHANGELOG.md

If the project sounds useful, consider trying one skill on a real task and sharing what worked—or what failed.


Leave the category as **Show and tell**, then click **Start discussion**.

This discussion will help repository visitors understand the project and may create another indexable GitHub page, but it should complement—not duplicate—the README and Wiki word for word.
write a readme full in Hinglish Easy way to explaining peoples

Neeche Skill X ke liye complete, easy-to-understand Hinglish README diya hai. Isse directly apne README.md mein paste kar sakte ho.

# Skill X

> Open-source Agent Skills for Claude Code, OpenAI Codex, GitHub Copilot, OpenCode aur dusre AI Coding Agents.

**Skill X** ek open-source collection hai jisme reusable AI agent skills diye gaye hain.

Simple language mein:

Skill X, AI coding agents ko sirf answer generate karna nahi, balki task ko properly samajhna, plan banana, kaam divide karna, result verify karna aur mistakes fix karna sikhata hai.

Repository:

https://github.com/anshmajumdar121/skill-x

---

## Skill X kya hai?

Aaj ke AI coding agents kaafi powerful hain, lekin complex tasks mein woh kabhi-kabhi:

- Task ko properly samjhe bina kaam start kar dete hain
- Important requirements miss kar dete hain
- Assumptions ko facts samajh lete hain
- Bina testing ke task complete bol dete hain
- Bahut zyada unnecessary files padh lete hain
- Helper agents ko unclear instructions dete hain
- Same mistakes baar-baar repeat karte hain

**Skill X** in problems ko solve karne ke liye structured workflows provide karta hai.

Har skill agent ko batati hai:

1. Skill kab activate honi chahiye
2. Task ko kaise samajhna hai
3. Planning kaise karni hai
4. Kaam ko smaller tasks mein kaise divide karna hai
5. Dusre agents ko safely kaise delegate karna hai
6. Final result ko kaise verify karna hai
7. Failure aane par usse kaise repair karna hai

Skill X ek normal prompt collection nahi hai.

Yeh reusable operating procedures ka collection hai jo AI agents ko zyada disciplined aur reliable banane ke liye design kiya gaya hai.

---

# Skill X kis ke liye hai?

Skill X useful ho sakta hai:

- Developers ke liye
- AI coding-agent users ke liye
- Claude Code users ke liye
- OpenAI Codex users ke liye
- GitHub Copilot users ke liye
- OpenCode users ke liye
- AI researchers ke liye
- Multi-agent system builders ke liye
- Mechanistic interpretability researchers ke liye
- Autonomous coding workflow banane wale users ke liye

Beginner users bhi ise use kar sakte hain, lekin iska maximum benefit complex coding aur research tasks mein milta hai.

---

# Skill X mein kya included hai?

Currently repository mein 4 main skills hain:

| Skill | Simple Explanation |
|---|---|
| Think Like GPT-5.6 | Complex tasks ko carefully plan, execute aur verify karne ka workflow |
| Efficient Fable | Main agent aur helper agents ke beech efficient delegation pattern |
| Skill Zero | Coding agents ki hidden states aur linear probes ke liye research workflow |
| Super Skill | Planning, delegation, verification aur guarded self-improvement ka combined system |

---

# 1. Think Like GPT-5.6

**Think Like GPT-5.6** ek rigorous execution skill hai.

Iska purpose kisi model ko GPT-5.6 banana nahi hai.

Yeh ek workflow ka naam hai jo AI agent ko complex tasks par zyada carefully kaam karne ke liye guide karta hai.

## Yeh skill agent ko kya sikhati hai?

Agent ko encourage kiya jata hai ki woh:

- Pehle task ko properly observe kare
- User ki exact requirement identify kare
- Facts aur assumptions ko separate rakhe
- Hidden ambiguity detect kare
- Dependencies identify kare
- Risks ke according plan banaye
- Execution ke baad result verify kare
- Errors milne par unhe fix kare
- Bina evidence ke success claim na kare

## Kab use karein?

Think Like GPT-5.6 useful hai jab:

- Task multiple steps ka ho
- Repository mein changes karne ho
- Bug ka root cause find karna ho
- Important technical research karni ho
- Documents, code ya reports create karne ho
- User request mein hidden ambiguity ho
- Final result ko carefully verify karna zaroori ho

## Example

Normal approach:

```text
User ne feature manga → Agent ne directly code likhna start kar diya.

Think Like GPT-5.6 approach:

User ki requirement samjho
→ Repository inspect karo
→ Existing architecture identify karo
→ Risks aur ambiguity note karo
→ Implementation plan banao
→ Code implement karo
→ Tests run karo
→ Result verify karo
→ Failure ho to repair karo
→ Final answer evidence ke saath do

Skill directory:

skills/think-like-gpt-5-6/
2. Efficient Fable

Efficient Fable ek delegation skill hai.

Iska purpose ek powerful primary agent ko har chhota kaam khud karne se bachana hai.

Main agent planning, decision-making aur final verification handle karta hai. Smaller aur bounded tasks helper agents ko diye ja sakte hain.

Simple example

Maan lo ek large repository mein bug hai.

Main agent ko yeh sab khud karne ki zaroorat nahi:

Frontend files inspect karna
Backend logs check karna
Tests identify karna
Documentation search karna
Similar code patterns find karna

Efficient Fable mein main agent kaam divide kar sakta hai:

Helper Agent 1 → Frontend files inspect karo

Helper Agent 2 → Backend error ka root cause find karo

Helper Agent 3 → Existing tests aur failing cases check karo

Primary Agent → Sab reports ko compare karke final decision lo
Important rule

Helper agent ka output automatically correct nahi maana jata.

Primary agent ki responsibility hoti hai:

Task clearly define karna
Scope limited rakhna
Output review karna
Conflicting reports resolve karna
Final result verify karna
Kab use karein?

Efficient Fable useful hai jab:

Repository bahut large ho
Multiple independent investigations possible ho
Context window save karni ho
Parallel work useful ho
Repetitive scanning karni ho
Logs ya tests inspect karne ho
Multiple small patches evaluate karne ho

Skill directory:

skills/efficient-fable/
3. Skill Zero

Skill Zero coding-agent mechanistic interpretability ke liye specialist skill hai.

Yeh normal app development ke liye nahi, mainly AI research workflows ke liye useful hai.

Skill Zero kin topics par focus karta hai?
Coding-agent hidden states
Residual stream analysis
Linear probes
Edit-outcome prediction
Model activations
Latent programming horizons
Monitor-and-steer systems
Coding agents ki internal representations
Mechanistic interpretability experiments
Easy explanation

Maan lo ek coding model code edit kar raha hai.

Research question ho sakta hai:

Kya model ke internal hidden states ko dekhkar pehle se predict kiya ja sakta hai ki edit successful hoga ya fail?

Skill Zero aise experiments ko properly structure karne mein help karta hai.

Possible workflow
Research question define karo
→ Model activations collect karo
→ Dataset clean karo
→ Train-test split banao
→ Linear probe train karo
→ Baseline se compare karo
→ Leakage check karo
→ Results interpret karo
→ Limitations clearly report karo
Kab use karein?

Skill Zero useful hai agar aap:

AI interpretability researcher ho
Linear probes par kaam kar rahe ho
Coding model activations study kar rahe ho
Model behavior predict karna chahte ho
Hidden-state based monitoring system build kar rahe ho

Skill directory:

skills/skill-zero/
4. Super Skill

Super Skill Skill X ka combined operating workflow hai.

Yeh multiple ideas ko ek saath use karta hai:

Rigorous task understanding
Structured planning
Efficient delegation
Verification
Failure repair
Reusable knowledge
Guarded workflow improvement
Simple explanation

Super Skill agent ko decide karne mein help karta hai:

Kaunsa task khud karna chahiye
Kaunsa task helper agent ko dena chahiye
Kab deeper research karni chahiye
Kab implementation start karna chahiye
Kab test ya verification zaroori hai
Workflow se kya learning preserve ki ja sakti hai
Guarded self-improvement ka meaning

Self-improvement ka matlab yeh nahi ki agent apne rules freely rewrite karta rahe.

Super Skill ka goal controlled improvement hai.

Agent useful learnings preserve kar sakta hai, lekin:

Safety rules remove nahi hone chahiye
Verification weak nahi honi chahiye
Unverified information permanent rule nahi banani chahiye
Temporary workaround ko universal solution nahi maana chahiye
User intent ke against workflow modify nahi hona chahiye
Kab use karein?

Super Skill useful hai jab:

Project bada aur complex ho
Task long-running ho
Multiple agents use karne ho
Research aur coding dono involved ho
Workflow ko future mein reuse karna ho
Agent ko different execution modes ke beech switch karna ho

Skill directory:

skills/super-skill/
Skill X ka basic workflow

Skill ke according exact process change ho sakta hai, lekin general workflow kuch aisa hota hai:

1. Task samjho
2. Expected output identify karo
3. Available evidence inspect karo
4. Facts aur assumptions separate karo
5. Ambiguity aur risks identify karo
6. Execution plan banao
7. Bounded work delegate karo
8. Main implementation complete karo
9. Tests aur verification run karo
10. Failures repair karo
11. Final result evidence ke saath present karo
Installation

Repository clone karein:

git clone https://github.com/anshmajumdar121/skill-x.git

Project directory open karein:

cd skill-x

Available skills check karein:

skills/
├── think-like-gpt-5-6/
├── efficient-fable/
├── skill-zero/
└── super-skill/

Har skill directory ke andar us skill ka main instruction file available hoga:

SKILL.md

Detailed installation steps ke liye read karein:

PLUGIN_INSTALL.md

Installation guide:

https://github.com/anshmajumdar121/skill-x/blob/main/PLUGIN_INSTALL.md

Skill kaise use karein?

Exact process aapke AI coding agent par depend karega.

General method:

Required skill folder choose karein
Folder ko apne agent ke supported skills directory mein copy karein
SKILL.md ko change karne se pehle read karein
Agent restart ya reload karein
Ek suitable real task ke saath skill test karein
Agent ke plan, execution aur verification behavior ko observe karein

Example:

Mujhe is repository mein authentication bug ka root cause find karke fix karna hai.
Pehle repository inspect karo, assumptions note karo, implementation plan banao,
tests run karo aur final answer mein verification evidence include karo.
Kaunsi skill choose karein?
Think Like GPT-5.6 choose karein agar:
Task complex hai
Planning important hai
Accuracy important hai
Multiple files change honi hain
Testing aur verification compulsory hai
Efficient Fable choose karein agar:
Repository large hai
Kaam parallel divide kiya ja sakta hai
Multiple helper agents available hain
Main model ka context save karna hai
Skill Zero choose karein agar:
Aap coding-agent interpretability research kar rahe hain
Hidden states ya activations analyze kar rahe hain
Linear probes train karna chahte hain
Super Skill choose karein agar:
Aapko planning aur delegation dono chahiye
Task long-running aur complex hai
Multiple working modes required hain
Workflow learning safely preserve karni hai
Real-world use cases

Skill X in tasks mein useful ho sakta hai:

Complex feature implementation
Large repository analysis
Bug investigation
Root-cause analysis
Code review
Test failure investigation
Repository migration
Architecture planning
Technical research
Documentation creation
Browser verification
Multi-agent coding
Parallel repository scanning
AI-agent evaluation
Coding-agent interpretability
Linear-probe experiments
Long-running autonomous tasks
Reusable AI workflows
Skill X kya nahi hai?

Skill X:

Koi AI model nahi hai
GPT-5.6 ka replacement nahi hai
Claude Code ka official plugin nahi hai
OpenAI ka official product nahi hai
Anthropic ka official product nahi hai
GitHub ka official Copilot extension nahi hai
Perfect output guarantee nahi karta
Model ke private chain of thought ko expose nahi karta
Kisi proprietary model ke internal reasoning ko copy nahi karta

Skill X ek independent open-source project hai.

Product aur company names sirf compatibility aur use-case explanation ke liye mention kiye gaye hain.

Think Like GPT-5.6 naam ka kya meaning hai?

“Think Like GPT-5.6” ek workflow name hai.

Iska meaning yeh nahi hai ki:

Yeh GPT-5.6 model provide karta hai
Yeh kisi proprietary model ko copy karta hai
Yeh OpenAI ka official skill hai
Yeh private model reasoning expose karta hai

Is naam ka purpose rigorous execution style ko describe karna hai:

Understand deeply
→ Plan carefully
→ Execute properly
→ Verify honestly
→ Repair failures
Skill aur prompt mein difference

Normal prompt mostly agent ko batata hai:

Kya karna hai?

Structured skill agent ko batati hai:

Skill kab activate hogi?
Task ko kaise inspect karna hai?
Planning kaise karni hai?
Tools kaise use karne hain?
Delegation kab karni hai?
Result kaise verify karna hai?
Failure ko kaise handle karna hai?

Isi wajah se Skill X sirf prompts ka folder nahi hai.

Important limitations

Skill install karne ke baad bhi result depend karega:

Base model ki capability par
Agent ko available tools par
User request ki clarity par
Repository access par
Context-window limits par
Testing environment par
Skill instructions ko agent kitna accurately follow karta hai

Skill X execution discipline improve karne ke liye design kiya gaya hai, perfect result guarantee karne ke liye nahi.

Safety

Kisi bhi autonomous agent workflow ko use karte waqt:

Important changes review karein
Destructive commands blindly execute na karein
Credentials share na karein
Production changes se pehle backup rakhein
Tests run karein
Generated code manually inspect karein
Security-sensitive output verify karein
Third-party scripts ko run karne se pehle read karein

Security policy:

https://github.com/anshmajumdar121/skill-x/blob/main/SECURITY.md

Project structure

Repository ka simplified structure:

skill-x/
├── skills/
│   ├── think-like-gpt-5-6/
│   │   └── SKILL.md
│   ├── efficient-fable/
│   │   └── SKILL.md
│   ├── skill-zero/
│   │   └── SKILL.md
│   └── super-skill/
│       └── SKILL.md
│
├── README.md
├── PLUGIN_INSTALL.md
├── CONTRIBUTING.md
├── SECURITY.md
├── CHANGELOG.md
└── LICENSE

Actual repository structure future updates ke saath change ho sakta hai.

Contributing

Contributions welcome hain.

Aap contribute kar sakte hain:

Documentation improve karke
Hinglish ya other-language translations add karke
Installation instructions improve karke
New examples add karke
Bugs report karke
Skill triggers improve karke
Verification steps improve karke
Real-world evaluations share karke
New agent workflows suggest karke
Pull request submit karke

Contributing guide:

https://github.com/anshmajumdar121/skill-x/blob/main/CONTRIBUTING.md

Issue report karte waqt

Issue create karte waqt yeh information include karein:

Agent/Platform:
Model:
Operating System:
Skill Used:
Task:
Expected Behavior:
Actual Behavior:
Error Message:
Steps to Reproduce:

Isse problem ko samajhna aur fix karna easy ho jayega.

Feedback

Aapka honest feedback project improve karne mein help karega.

Specially yeh feedback useful hai:

Skill instructions clear hain ya nahi?
Agent sahi time par skill activate karta hai ya nahi?
Planning useful hai ya unnecessarily long?
Verification improve hui ya nahi?
Delegation pattern practical hai ya nahi?
Kis platform par installation difficult thi?
Kaunsi additional skill useful hogi?
Kaunsa section confusing laga?

Aap GitHub Issue ya Discussion ke through feedback share kar sakte hain.

Frequently Asked Questions
Kya main sirf ek skill install kar sakta hoon?

Haan.

Aapko complete collection install karna compulsory nahi hai. Har skill independently use ki ja sakti hai.

Kya Skill X beginners ke liye hai?

Haan, lekin kuch skills advanced concepts cover karti hain.

Think Like GPT-5.6 aur Efficient Fable ko general coding tasks mein use kiya ja sakta hai.

Skill Zero mainly AI researchers ke liye hai.

Kya Skill X free hai?

Skill X open-source repository hai.

Exact usage rights ke liye repository ka LICENSE file check karein.

Kya yeh Claude Code ke saath kaam karega?

Skills ko Claude Code-style agent workflows ke liye adapt kiya ja sakta hai.

Exact installation aur supported behavior platform ke current skill system par depend karega.

Kya yeh OpenAI Codex ke saath kaam karega?

Skills ko Codex aur similar coding-agent workflows ke liye adapt kiya ja sakta hai.

Platform-specific setup ke liye installation documentation check karein.

Kya yeh GitHub Copilot ke saath kaam karega?

Skill instructions ko compatible GitHub Copilot agent workflow mein adapt kiya ja sakta hai.

Available functionality Copilot ke current agent features par depend karegi.

Kya yeh better coding guarantee karta hai?

Nahi.

Skill X planning, verification aur execution discipline improve kar sakta hai, lekin output ki quality model aur environment par bhi depend karti hai.

Kya yeh model ka chain of thought show karta hai?

Nahi.

Skill X kisi model ka private chain of thought expose nahi karta.

Yeh observable planning, structured execution aur verification procedures define karta hai.

Roadmap

Possible future improvements:

More platform-specific installation guides
Real-world skill evaluations
Example coding tasks
Skill comparison guide
Automated validation tools
Agent behavior benchmarks
More delegation patterns
Additional research skills
Community-created skills
Hindi aur other-language documentation
Better failure-analysis examples
Skill trigger testing framework

Roadmap community feedback ke according change ho sakta hai.

Support the project

Project useful lage to:

Repository ko star karein
Real task par skill test karein
GitHub issue create karein
Discussion start karein
Pull request submit karein
Honest evaluation share karein
Dusre AI-agent developers ke saath repository share karein

Repository:

https://github.com/anshmajumdar121/skill-x

Disclaimer

Skill X ek independent open-source community project hai.

OpenAI, GPT, Codex, Anthropic, Claude, GitHub, Copilot aur dusre product names unke respective owners ke trademarks ho sakte hain.

In names ka use sirf compatibility, comparison aur educational explanation ke liye kiya gaya hai.

Is repository ka OpenAI, Anthropic, GitHub ya kisi dusri mentioned company ke saath official affiliation, sponsorship ya endorsement nahi hai.

License

Project use ya modify karne se pehle repository ka license read karein:

LICENSE
Final summary

Skill X ka goal simple hai:

AI coding agents ko jaldi answer dene ke bajaye, task ko properly samajhne, carefully plan karne, efficiently execute karne aur honestly verify karne mein help karna.

Understand
→ Plan
→ Delegate
→ Execute
→ Verify
→ Repair
→ Improve

⭐ Repository useful lage to GitHub par star zaroor karein.

https://github.com/anshmajumdar121/skill-x


### Recommended GitHub repository description

GitHub ke **About** section mein yeh description use karo:

```text
Open-source agent skills for Claude Code, Codex, GitHub Copilot and AI coding agents—focused on rigorous execution, delegation, interpretability and guarded self-improvement.
Recommended GitHub topics
ai-agents
agent-skills
coding-agents
claude-code
openai-codex
github-copilot
opencode
multi-agent-systems
agentic-ai
developer-tools
prompt-engineering
mechanistic-interpretability
linear-probes
llm-agents
autonomous-coding
