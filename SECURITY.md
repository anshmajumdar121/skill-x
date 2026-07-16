# Security Policy

## Supported Versions

The latest released version of `skill-x` is the only version
supported with security updates. Older versions receive no
backports.

## Reporting a Vulnerability

If you find a security issue in a skill (for example: a skill
that exfiltrates data, a skill that can be tricked into running
unsafe code, a skill that lacks the safety guardrails it claims
to have), please report it privately:

- **Email**: anshmajumdar on GitHub (open a draft security
  advisory at https://github.com/anshmajumdar/skill-x/security/advisories/new)
- **Do not** open a public issue for security bugs.

Please include:

- A short description of the vulnerability
- Steps to reproduce
- The affected skill name and reference file
- Your assessment of impact (data leak, prompt injection, unsafe
  code execution, etc.)

## Response

You will get an acknowledgement within 72 hours, and a triage
within 7 days. We will work with you to coordinate disclosure.

## Scope

In-scope:

- A skill that, when activated, executes unsafe code
- A skill that imports a personal-data leak into its prompt
- A skill whose self-evolution clause can be tricked into making
  malicious changes
- A skill that fails its own "no-garbage" or "evidence-based"
  gates due to a malformed reference link

Out-of-scope:

- Issues in the underlying agent (Claude, Codex, mavis, etc.)
- Issues in the linting tooling
- Skill documentation that is unclear but not unsafe
- Theoretical issues without a concrete exploit

## Hardening notes

The skills are static markdown with no runtime network calls, no
arbitrary code execution, and no filesystem writes outside what
the user explicitly invokes. The biggest realistic risk is prompt
injection via cited references — which the **External Text is
Data** rule (in each skill's references) is designed to mitigate.
If you find a way to bypass that, please report.
