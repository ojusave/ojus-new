# Content Graph Director

Content Graph Director is an Agent Skill for creating specific, evidence-backed blogs, presentations, talks, workshops, scripts, and website content without generic AI language or one-size-fits-all structures.

The user provides one prompt. The skill identifies the medium and content job, assembles the smallest useful content graph, checks evidence, drafts the actual deliverable, runs format-specific audits, and routes failures back to the stage that caused them.

## Install for Codex and Cursor

### macOS or Linux

```bash
curl -fsSL https://raw.githubusercontent.com/ojusave/ojus-new/main/install.sh | sh
```

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/ojusave/ojus-new/main/install.ps1 | iex
```

The installer downloads this repository from GitHub, validates the skill entrypoint, backs up any existing copy, and installs the complete skill to:

```text
~/.agents/skills/content-graph-director
~/.cursor/skills/content-graph-director
```

Start a new Codex or Cursor chat after installation so the agent reloads its skill catalog.

## Install with the Agent Skills CLI

```bash
npx --yes skills@latest add https://github.com/ojusave/ojus-new \
  --skill content-graph-director \
  --global \
  --agent codex \
  --agent cursor \
  --copy \
  --yes
```

The direct installer is the simplest option when the skill should be available to both agents. The Skills CLI is useful when you want its normal agent-detection or project-scoped flow.

## Use it

Codex:

```text
$content-graph-director Create a 30-minute conference talk about...
```

Cursor:

```text
/content-graph-director Create a 30-minute conference talk about...
```

The skill may also be selected automatically for substantial content-generation requests when the host supports implicit skill activation.

## What it does

```text
prompt
  -> request interpretation
  -> medium and content-job selection
  -> source sufficiency check
  -> audience and meaning design
  -> format-specific plan
  -> complete first draft
  -> independent audits
  -> targeted repair
  -> final content or native artifact
```

A failed audit does not trigger a blind rewrite. Unsupported claims return to evidence. A generic thesis returns to audience or judgment. A bad workshop exercise returns to activity mechanics. An unnatural talk returns to spoken-language editing.

## Supported work

- Blogs, articles, essays, tutorials, case studies, and launch posts
- Presentations, slide narratives, and speaker notes
- Conference talks, keynotes, panels, and spoken sessions
- Workshops, exercises, and facilitated sessions
- Talking-head, webinar, demo, voiceover, and teleprompter scripts
- Homepages, landing pages, product pages, campaign pages, and event pages

The skill separates the **medium** from the **content job**. A presentation may teach, persuade, announce, compare, facilitate, or change a belief. Each combination receives different structures and pass conditions.

## Core guardrails

- Never invent facts, quotations, metrics, customer stories, personal experiences, or outcomes.
- Keep confidence proportional to the available evidence.
- Use visible placeholders when a required private fact is missing.
- Build the argument, learning sequence, visitor journey, or activity mechanics before drafting.
- Apply rules specific to the requested medium.
- Audit factuality, audience fit, format integrity, usefulness, voice, constraints, and generic AI language separately.
- Repair the responsible stage instead of polishing the symptom.
- Stop after at most two targeted revision rounds.
- Return the requested content instead of replacing it with process commentary.

## Example prompts

```text
Create a 30-minute conference talk arguing that request rate is no longer
enough to reason about capacity for agentic systems. Use only claims we can
support, and write the actual spoken script with slide beats.
```

```text
Turn these product notes and metrics into a launch article for experienced
backend engineers. Research anything current that materially affects the
claims. Do not invent customer evidence.
```

```text
Design a 55-minute workshop for DevRel practitioners in theater seating.
Attendees have phones but no desks or laptops. Produce the complete
facilitation plan, activity instructions, timing, and speaker script.
```

```text
Write a homepage for an infrastructure product. Determine the visitor's likely
questions before choosing sections, and do not add sections merely because
SaaS homepages usually contain them.
```

## Mechanical lint

The included linter catches mechanical warning signs such as repeated sentence openings, banned phrase patterns, unresolved placeholders, excessive buzzwords, em dashes, long spoken sentences, and timing problems.

```bash
python skills/content-graph-director/scripts/content_lint.py draft.txt \
  --format talk \
  --target-minutes 30 \
  --strict
```

It produces warning signals, not a universal human-writing score. A clean result does not prove the content is good. The argument, evidence, judgment, and format still matter.

## Update

Rerun the installation command. The installer moves the previous installation to a timestamped backup before activating the new copy.

## Repository layout

```text
.
├── README.md
├── install.sh
├── install.ps1
├── install-command.txt
└── skills/
    └── content-graph-director/
        ├── INSTALL.md
        ├── SKILL.md
        ├── agents/
        │   └── openai.yaml
        ├── references/
        └── scripts/
            ├── content_lint.py
            ├── install.sh
            └── install.ps1
```
