# Anti-Slop Audit

## Contents

- [Diagnose the cause](#diagnose-the-cause)
- [Content audit passes](#content-audit-passes)
- [Process-slop audit](#process-slop-audit)
- [High-signal phrase patterns](#high-signal-phrase-patterns)
- [Repair map](#repair-map)
- [Severity](#severity)

## Diagnose the cause

Generic AI writing usually comes from missing source material, judgment, mechanism, audience specificity, or format discipline. Agent-response slop usually comes from a missing operation contract, next-use contract, completion-stage definition, or graph reset.

Treat phrases and formatting as signals, not the whole disease. Do not repair weak work by asking for it to be `more human`, `punchier`, `more engaging`, or `more complete`. Route the problem to the earliest responsible stage.

## Content audit passes

Run each pass separately. Locate the problem before revising it.

### 1. Transfer test

Flag any sentence or paragraph that could appear unchanged in:

- a competitor's content
- an unrelated industry article
- a generic LinkedIn post
- another speaker's keynote
- a template landing page

Pass when the passage contains a specific observation, mechanism, judgment, example, tradeoff, decision, or consequence.

### 2. Specificity test

Flag abstract claims that lack an observable referent.

Weak:

```text
Developers need a seamless onboarding journey.
```

Better:

```text
The quickstart asks developers to choose among four deployment paths before they have seen one successful response.
```

### 3. Insight test

Flag statements presented as insight when they are universally agreeable, circular, or obvious.

```text
Good documentation matters.
The future is changing quickly.
Teams should focus on users.
Technology is only as powerful as the people using it.
```

Find a sharper judgment, mechanism, boundary, or decision. Delete the sentence when no stronger thought exists.

### 4. Evidence test

Flag:

- unsupported generalizations
- invented specificity
- numbers without sources
- quotes without provenance
- stories the author did not supply
- causal language supported only by correlation
- confidence stronger than the evidence

Route these to evidence and research, not copyediting.

### 5. False contrast test

Flag constructions that manufacture importance through symmetry:

```text
It is not just X. It is Y.
This is not about X. It is about Y.
The future is not X, but Y.
```

Keep a contrast only when X and Y are genuinely competing interpretations and evidence distinguishes them.

### 6. Empty signposting test

Flag sentences that merely announce structure:

```text
Let us dive in.
Now that we have explored X, let us turn to Y.
This is where X comes in.
In the next section, we will discuss...
```

Replace with the actual transition in thought or delete.

### 7. Manufactured voice test

Flag fake conversationality:

```text
Here is the thing.
Let us be honest.
You might be wondering...
Sounds great, right?
Spoiler alert...
```

Keep conversational language only when it reflects how the author naturally speaks and performs a real job.

### 8. Symmetry test

Flag:

- repeated groups of three with no conceptual reason
- identical paragraph lengths
- repeated sentence openings
- every section ending with a slogan
- excessive one-line paragraphs used for drama
- headings that form a generic taxonomy

Natural variation must come from the material, not randomness.

### 9. Adjective substitution test

Flag adjectives standing in for proof or mechanism:

```text
powerful
seamless
robust
transformative
game-changing
innovative
revolutionary
intuitive
world-class
```

A precise technical use may remain. Marketing use requires proof.

### 10. Earned emotion test

Flag emotional or inspirational language that appears before concrete events, stakes, or evidence have earned it.

Do not manufacture vulnerability, urgency, excitement, or optimism.

### 11. Repetition test

Flag repeated ideas even when the wording changes. Common locations:

- introduction and first section
- slide title and speaker note
- final section and conclusion
- hero, subhead, and first feature block
- workshop instructions and debrief

Delete before expanding.

### 12. Format test

Flag medium mismatch:

- a talk that reads like an essay
- a deck that stores paragraphs on slides
- a workshop that is mostly lecture
- a website that reads like a manifesto
- a script that hides stage directions inside spoken lines
- a blog that is a transcript without editorial structure

Route to the relevant format plan.

## Process-slop audit

Run this pass on the agent's proposed final response and delivery workflow.

### 1. Process substitution

Flag when the response describes activity instead of giving the requested result.

Example failure:

```text
I created 20 files, validated the package, generated a bundle, and prepared the repository...
```

when the user asked for one installation command.

Pass when the first actionable block contains the content, command, artifact, link, or decision the user requested.

### 2. Artifact inflation

Flag unnecessary proliferation of:

- ZIPs
- source ZIPs
- tarballs
- Git bundles
- reports
- audits
- alternate formats
- copies of the same canonical source

Pass when one primary artifact serves the next user action, with alternatives only for required platform differences.

### 3. Status inflation

Flag completion language unsupported by the observed stage:

```text
ready
published
pushed
installed
verified
works on Windows
production-ready
```

Require stage-specific evidence. A valid package is not published. A local commit is not pushed. A script present in a repository is not a verified installation path.

### 4. Scope inertia

Flag work that continues serving an older request after the user narrows, replaces, or rejects it.

Signals:

- obsolete artifacts remain prominent
- the response explains earlier work the user no longer wants
- the graph keeps optimizing a superseded outcome
- the latest correction is acknowledged but not reflected in the result

Route to request reinterpretation and graph reset.

### 5. Verification laundering

Flag a proxy presented as proof of the actual outcome.

```text
ZIP validates -> therefore public install works
README exists -> therefore instructions are correct
repository contains files -> therefore the agent discovers the skill
page renders -> therefore the form works
local commit exists -> therefore GitHub is updated
```

Require evidence tied to the real user path.

### 6. Capability sprawl

Flag when Content Graph Director starts implementing a GitHub manager, deployment system, installer framework, document renderer, or other operational capability instead of handing off the approved content contract.

Pass when the owning capability performs the action and returns observable evidence.

### 7. Result burial

Flag when the user must scan headings, status narratives, or verification notes to find the answer.

Pass when:

1. The requested result appears first.
2. Verification follows.
3. Limitations follow only when material.

### 8. Choice overload

Flag several equivalent next actions when one is sufficient.

Pass when the response recommends one default and includes another only for a real platform or authority difference.

## High-signal phrase patterns

Treat these as warnings, not automatic bans:

```text
In today's rapidly evolving...
At its core...
In the ever-changing landscape...
Let us dive in.
Imagine a world where...
It is worth noting that...
This is where X comes in.
Whether you are a...
By leveraging...
Unlock the power of...
More than ever...
The possibilities are endless.
The future is here.
```

Also inspect repeated use of:

```text
unlock
leverage
seamless
robust
powerful
transformative
game-changing
landscape
journey
elevate
revolutionize
supercharge
```

Do not perform thesaurus replacement. Replace the missing thought.

## Repair map

```text
generic opening -> opening event, claim, task, or contradiction
empty paragraph -> source observation, mechanism, example, or deletion
unsupported insight -> evidence, qualification, or deletion
fake emotion -> concrete stakes or deletion
false contrast -> direct claim
repeated point -> architecture change
corporate voice -> author judgment and plain language
unnatural speech -> spoken-language pass
feature adjectives -> mechanism and proof
process substitution -> next-user-action and final-response contract
artifact inflation -> canonical source and delivery contract
status inflation -> completion-stage evidence
scope inertia -> request reinterpretation and graph reset
verification laundering -> end-to-end user-path verification
capability sprawl -> operational handoff
result burial -> result-first finalization
choice overload -> one recommended default
```

## Severity

### Veto

- fabricated detail
- misrepresented source
- material unsupported claim
- hidden product, legal, safety, or financial limitation
- false claim that an external action completed
- publication, installation, or production side effect without authority

### High

- generic core thesis
- medium mismatch
- repeated central idea
- empty opening or ending
- voice that materially misrepresents the author
- scope inertia after an explicit user correction
- required result replaced with process commentary
- completion stage claimed from a proxy

### Medium

- local abstraction
- weak transition
- unnecessary heading
- adjective without proof
- overwritten sentence
- unnecessary secondary artifact
- result buried below nonessential detail

### Low

- taste differences that do not affect trust, use, or user progress

Resolve veto and high findings before finalization.
