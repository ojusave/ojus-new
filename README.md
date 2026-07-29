# Content Graph Director

Install the skill globally for Codex and Cursor.

## macOS or Linux

```bash
curl -fsSL https://raw.githubusercontent.com/ojusave/ojus-new/main/install.sh | sh
```

## Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/ojusave/ojus-new/main/install.ps1 | iex
```

The installer downloads the repository archive from GitHub, validates the complete skill, backs up any existing copy, and installs it to:

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

The skill may also activate automatically for substantial requests involving blogs, presentations, talks, workshops, scripts, or website content.

## What changed in this upgrade

The original skill controlled content quality but did not model what happened after the draft. This version treats four dimensions as first-class state:

```text
medium x content job x requested operation x next use
```

The requested operation can be:

```text
create
critique
revise
adapt
package
publish
install
verify
```

That distinction prevents several common failures:

- A critique request no longer triggers a silent rewrite.
- A targeted revision preserves the parts the user said already work.
- A later instruction such as `all I need is one command` resets the active graph instead of dragging obsolete artifacts forward.
- A valid package is not mislabeled as published or installed.
- A local commit is not called a GitHub push.
- The final response puts the user's next action before build history and process notes.

## How the graph works

```text
current request
  -> medium, content-job, operation, and next-use classification
  -> graph-reset check
  -> evidence and audience model
  -> meaning and format plan
  -> create, critique, revise, adapt, or delivery branch
  -> independent content and process audits
  -> targeted repair
  -> package, publication, or installation handoff when needed
  -> completion-stage verification
  -> result-first response
```

A failed audit does not trigger a blind rewrite. Unsupported claims return to evidence. A generic thesis returns to audience or judgment. An unworkable workshop exercise returns to activity mechanics. A false publication claim returns to remote verification.

## Supported work

- Blogs, articles, essays, tutorials, case studies, and launch posts
- Presentations, slide narratives, and speaker notes
- Conference talks, keynotes, panels, and spoken sessions
- Workshops, exercises, and facilitated sessions
- Talking-head, webinar, demo, voiceover, and teleprompter scripts
- Homepages, landing pages, product pages, campaign pages, and event pages
- Critique, revision, and adaptation of existing content
- Content handoffs for native artifact generation, publication, and installation

## Core guardrails

- Never invent facts, quotations, metrics, customer stories, personal experiences, or outcomes.
- Keep confidence proportional to the evidence.
- Build the argument, learning sequence, visitor journey, or activity mechanics before drafting.
- Apply rules specific to the requested medium and content job.
- Preserve what the user explicitly says already works.
- Treat the latest narrowing or correction as authoritative.
- Audit content slop and process slop separately.
- Keep one canonical editable source and treat packages or exports as derived artifacts.
- Verify the completion stage the user requested.
- Return one primary result or next action before process detail.

## Completion stages

```text
content_ready
artifact_ready
packaged
published
installed
user_path_verified
```

Each stage requires new evidence. The skill rejects convenient substitutions such as treating a valid ZIP as proof that a public installation command works.

## Alternative installation with the Agent Skills CLI

```bash
npx --yes skills@latest add https://github.com/ojusave/ojus-new \
  --skill content-graph-director \
  --global \
  --agent codex \
  --agent cursor \
  --copy \
  --yes
```

The direct installer is the default when the skill should be copied into both agent-specific global directories.

## Install a project-scoped copy

The public installer accepts the same project arguments as the bundled installer:

```bash
curl -fsSL https://raw.githubusercontent.com/ojusave/ojus-new/main/install.sh | \
  sh -s -- --all --project "$PWD"
```

PowerShell:

```powershell
$script = irm https://raw.githubusercontent.com/ojusave/ojus-new/main/install.ps1
& ([scriptblock]::Create($script)) -Target all -ProjectRoot (Get-Location)
```

## Update

Rerun the installation command. The installer moves the previous copy to a timestamped backup before activating the new version.

## Mechanical lint

The included linter catches mechanical signals such as repeated sentence openings, banned phrase patterns, unresolved placeholders, buzzword density, em dashes, long spoken sentences, and timing problems.

```bash
python skills/content-graph-director/scripts/content_lint.py draft.txt \
  --format talk \
  --target-minutes 30 \
  --strict
```

It does not assign a universal human-writing score. Argument, evidence, judgment, format, and delivery still require review.

## Maintainer validation

```bash
python skills/content-graph-director/scripts/validate_content_graph.py \
  skills/content-graph-director

python /home/oai/skills/skill-creator/scripts/quick_validate.py \
  skills/content-graph-director

python /home/oai/skills/skill-creator/scripts/package_skill.py \
  skills/content-graph-director /tmp/content-graph-director-dist

unzip -t /tmp/content-graph-director-dist/skill.zip
```

The repository CI validates the source archive and tests clean installation plus safe reinstallation on Linux and Windows.

## Repository layout

```text
.
├── .github/workflows/validate.yml
├── README.md
├── install.sh
├── install.ps1
├── install-command.txt
└── skills/
    └── content-graph-director/
        ├── INSTALL.md
        ├── SKILL.md
        ├── agents/
        ├── references/
        │   ├── operations-and-delivery.md
        │   └── regression-scenarios.md
        └── scripts/
            ├── content_lint.py
            ├── install.sh
            ├── install.ps1
            └── validate_content_graph.py
```
