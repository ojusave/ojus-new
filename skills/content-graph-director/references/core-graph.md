# Core Content Graph

## Contents

- [Purpose](#purpose)
- [Common backbone](#common-backbone)
- [State schema](#state-schema)
- [Graph compiler](#graph-compiler)
- [Node contracts](#node-contracts)
- [Revision budget](#revision-budget)
- [Final response behavior](#final-response-behavior)

## Purpose

Compile a small workflow from the request instead of applying one universal writing prompt. Use two dimensions:

1. Medium: where the content will live or be delivered.
2. Content job: what the content must make the audience understand, do, decide, or feel.

The same medium can perform different jobs. A deck that teaches an API needs a different graph from a deck that changes an executive belief.

## Common backbone

```text
request
-> interpreter
-> graph compiler
-> source sufficiency gate
-> audience model
-> meaning layer
-> format plan
-> first draft
-> independent audits
-> targeted repair
-> finalization gate
```

Skip a node only when its output is already explicit in the request or irrelevant to the selected job.

## State schema

Maintain this state internally. Do not expose private reasoning.

```text
request_raw
artifact_type
primary_content_job
secondary_content_jobs
purpose
audience
audience_knowledge
audience_prior_belief_or_task
audience_resistance
desired_change_or_outcome
delivery_context
length_or_time
hard_constraints
soft_preferences
source_facts
researched_facts
interpretations
opinions
assumptions
unresolved_gaps
claims
evidence_ledger
voice_profile
meaning_plan
format_plan
draft
audit_findings
repair_log
revision_count
final_output
```

Keep categories separate. Never let an interpretation silently become a fact.

## Graph compiler

### Select the medium

Choose one primary medium:

- Blog or article
- Presentation or slide deck
- Talk or keynote
- Workshop or facilitated session
- Spoken, video, webinar, demo, or host script
- Website or landing page

Mark hybrids explicitly. Examples:

- A conference talk with slides: primary talk, secondary presentation.
- A workshop with a deck: primary workshop, secondary presentation.
- A launch page plus announcement blog: two deliverables, each with its own format branch but a shared evidence ledger.

### Select the content job

Choose one primary job:

- Argue or change belief
- Teach or enable
- Persuade or convert
- Announce or update
- Facilitate participation
- Explain or compare
- Narrate or inspire

Use no more than two secondary jobs. Too many jobs usually mean the scope is unclear.

### Select optional nodes

Add a node only when it has a distinct output, pass condition, or failure route.

Possible optional nodes:

- Research
- Skeptical objection
- Mechanism explanation
- Story selection
- Demonstration plan
- Visual evidence plan
- Activity simulation
- CTA design
- SEO pass
- Timing pass
- Read-aloud pass
- Accessibility pass
- Brand pass

Do not add an agent merely to restate the same instructions in a new voice.

## Node contracts

### Request interpreter

Input: raw prompt and available context.

Output:

```text
medium
content job
purpose
audience
desired outcome
constraints
known facts
missing facts
safe assumptions
requested output mode
```

Pass when the request can be executed without inventing material.

Failure routes:

- Missing current fact -> research node.
- Missing private fact -> placeholder or one strictly necessary question.
- Conflicting constraints -> prioritize explicit user instructions and note the conflict.

### Source sufficiency gate

Input: requested claims and available evidence.

Output: evidence ledger and a list of claims that must be narrowed, researched, or replaced.

Pass when every major factual claim has support, qualification, or a visible placeholder.

Failure routes:

- Verifiable public fact -> research.
- Company-internal fact -> connected company source when available.
- Personal experience -> user-supplied material only.
- Unsupported generalization -> narrow wording or remove.

### Audience model

Input: audience description, venue, channel, and purpose.

Output:

```text
what they know
what they believe
what they are tired of hearing
what they resist
what they can do next
what language they use
```

Pass when the model is specific enough to remove unnecessary explanation and predict resistance.

Failure route: narrow to the most likely audience and mark the assumption.

### Meaning layer

Input: content job, audience model, evidence ledger, and author judgment.

Output: the smallest logical or experiential structure needed to achieve the desired outcome.

Pass when each step changes understanding, enables an action, resolves an objection, or prepares the next step.

Failure routes:

- Obvious claim -> find a sharper judgment or reduce ambition.
- Missing mechanism -> explain how or why.
- Missing consequence -> state what changes because of the claim.
- No evidence -> source sufficiency gate.

### Format plan

Input: meaning layer and medium rules.

Output: ordered units with one job each.

Examples:

```text
section -> claim or task
slide -> establish, prove, contrast, reveal, involve, or resolve
talk beat -> tension, story, mechanism, proof, reflection, or decision
activity -> action, prompt, timebox, artifact, debrief, and transfer
website section -> visitor question, answer, proof, and next action
```

Pass when no unit exists merely because the format usually contains it.

### First draft

Input: approved meaning and format plans.

Output: one complete draft.

Pass when the draft fulfills the requested medium and remains within the evidence ledger.

Do not self-edit every sentence during drafting. Finish the artifact, then audit it.

### Independent audits

Run each audit with a narrow contract:

- Factuality: support, accuracy, qualification, and invented detail.
- Audience: relevance, assumed knowledge, resistance, and usefulness.
- Format: medium-specific integrity.
- Anti-slop: genericness, empty language, false insight, and repetition.
- Voice: authorial fit and confidence level.
- Constraint: length, timing, venue, file type, brand, and requested structure.

Rate findings:

- Veto: cannot ship.
- High: materially weakens trust or usefulness.
- Medium: meaningful improvement.
- Low: taste or polish only.

### Repair router

Repair the earliest responsible node.

```text
fabricated or unsupported fact -> source sufficiency
obvious thesis -> judgment or audience model
missing why -> mechanism
weak proof -> evidence
repeated point -> meaning or format plan
generic prose -> source detail, mechanism, example, or judgment
crowded slide -> slide job or visual plan
unnatural speech -> spoken-language pass
unworkable exercise -> activity mechanics
weak CTA -> visitor intent or persuasion logic
```

Do not respond to every failure with a full rewrite.

### Finalization gate

Confirm:

- No new facts, promises, or examples were introduced during polish.
- Veto and high findings are resolved.
- Placeholders are either filled or visible.
- The requested output mode is honored.
- The artifact can be used without reading the process notes.

## Revision budget

Allow at most two targeted repair rounds by default.

Round 1: resolve vetoes, evidence gaps, architecture failures, and medium mismatch.

Round 2: resolve remaining high findings and voice problems.

Stop before repeated polishing removes specificity or personality.

## Final response behavior

Return the finished work first. Add only what the user needs to use it:

- a short assumptions note,
- a short list of unresolved evidence placeholders, or
- a native artifact link.

Do not dump the graph, the internal state, or the full audit unless requested.
