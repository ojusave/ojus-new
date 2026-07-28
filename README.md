# Content Graph Director

Install it globally for Codex and Cursor with one command.

## macOS or Linux

```bash
curl -fsSL https://raw.githubusercontent.com/ojusave/ojus-new/main/install.sh | sh
```

## Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/ojusave/ojus-new/main/install.ps1 | iex
```

The installer downloads the packaged skill, verifies its SHA-256 checksum, backs up any existing copy, and installs it to both agent-specific locations:

```text
~/.agents/skills/content-graph-director
~/.cursor/skills/content-graph-director
```

Start a new Codex or Cursor chat after installation so the agent reloads its skill catalog.

## Use it

Codex:

```text
$content-graph-director Create a 30-minute conference talk about...
```

Cursor:

```text
/content-graph-director Create a 30-minute conference talk about...
```

The skill can also be selected automatically when a request asks for a blog, presentation, talk, workshop, script, or website and calls for specific, evidence-backed writing that avoids generic AI language.

## What it does

The user provides one prompt. The skill determines what is being made, what the content must accomplish, what evidence is available, and which format-specific checks must pass before it returns the finished work.

```text
prompt
  -> request interpretation
  -> source sufficiency check
  -> meaning and argument design
  -> format-specific plan
  -> first complete draft
  -> independent audits
  -> targeted repair
  -> final content or native artifact
```

A failed audit does not trigger a blind rewrite. It routes the problem back to the stage that caused it. Unsupported claims return to evidence. A generic thesis returns to audience or judgment. A bad workshop exercise returns to activity mechanics. An unnatural talk returns to spoken-language editing.

## Supported formats

- Blogs, articles, essays, tutorials, case studies, and launch posts
- Presentations, slide narratives, and speaker notes
- Conference talks, keynotes, panels, and spoken sessions
- Workshops, exercises, and facilitated sessions
- Talking-head, webinar, demo, voiceover, and teleprompter scripts
- Homepages, landing pages, product pages, campaign pages, and event pages

The skill also separates the format from the content job. A presentation may teach, persuade, announce, compare, facilitate, or change a belief. Different jobs receive different structures and pass conditions.

## Core guardrails

- Never invent facts, quotations, metrics, customer stories, personal experiences, or outcomes.
- Keep confidence proportional to the available evidence.
- Use visible placeholders when a required fact is missing.
- Build the argument, learning sequence, visitor journey, or activity mechanics before drafting.
- Apply rules specific to the requested medium.
- Audit factuality, audience fit, format integrity, usefulness, voice, constraints, and generic AI language separately.
- Repair the responsible stage instead of polishing the symptom.
- Stop after at most two targeted revision rounds.
- Return the requested content rather than replacing it with process commentary.

## Alternative installation with the Agent Skills CLI

The repository also follows the open Agent Skills layout:

```bash
npx --yes skills@latest add https://github.com/ojusave/ojus-new \
  --skill content-graph-director \
  --global \
  --agent codex \
  --agent cursor \
  --copy \
  --yes
```

The direct installer above is the recommended route because it explicitly writes both agent-specific global directories.

## Install the ChatGPT ZIP

The standalone ChatGPT package is available at [`dist/skill.zip`](dist/skill.zip).

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
questions before choosing sections, and do not add sections just because SaaS
homepages usually contain them.
```

## Mechanical lint

The included linter catches mechanical warning signs such as repeated sentence openings, banned phrase patterns, unresolved placeholders, excessive buzzwords, em dashes, long spoken sentences, and timing problems.

```bash
python skills/content-graph-director/scripts/content_lint.py draft.txt \
  --format talk \
  --target-minutes 30 \
  --strict
```

The linter produces signals, not a universal human-writing score. A clean result does not prove that the content is good. The argument, evidence, judgment, and format still matter.

## Repository layout

```text
.
├── README.md
├── install.sh
├── install.ps1
├── install-command.txt
├── SHA256SUMS
├── dist/
│   └── skill.zip
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

## Development checks

```bash
unzip -t dist/skill.zip
python /home/oai/skills/skill-creator/scripts/quick_validate.py skills/content-graph-director
python skills/content-graph-director/scripts/content_lint.py --help
```
