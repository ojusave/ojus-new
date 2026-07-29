# Core Content Graph

## Contents

- [Purpose](#purpose)
- [Common backbone](#common-backbone)
- [State schema](#state-schema)
- [Graph compiler](#graph-compiler)
- [Node contracts](#node-contracts)
- [Revision and retry budgets](#revision-and-retry-budgets)
- [Final response behavior](#final-response-behavior)

## Purpose

Compile the smallest workflow that can produce and deliver the requested outcome. Use four dimensions:

1. **Medium:** where the content lives or is delivered.
2. **Content job:** what the audience must understand, do, decide, or feel.
3. **Requested operation:** what the user wants done now.
4. **Next use:** what the user will do with the result and what stage must be reached first.

The same medium can perform different jobs, and the same artifact can move through different operations. A deck that teaches an API needs a different meaning graph from a deck that changes an executive belief. A finished deck that must be published needs a different operation graph from one that only needs critique.

## Common backbone

```text
current request
-> request interpreter
-> operation classifier
-> graph-reset check
-> graph compiler
-> source sufficiency gate
-> audience model
-> meaning layer
-> format plan
-> operation branch
-> independent audits
-> targeted repair
-> delivery handoff when needed
-> completion-stage verification
-> result-first finalization
```

Skip a node only when its output is already explicit or irrelevant to the current operation. Do not preserve a node merely because it ran earlier in the conversation.

## State schema

Maintain compact operational state. Do not expose private reasoning.

```text
request_raw
latest_authoritative_instruction
artifact_type
primary_medium
secondary_media
primary_content_job
secondary_content_jobs
requested_operation
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
preserve_contract
current_artifact
draft
audit_findings
repair_log
revision_count
output_artifact
delivery_destination
next_user_action
external_side_effect_authority
required_completion_stage
acceptance_evidence
canonical_source
derived_artifacts
observed_completion_stage
final_output
```

Keep categories separate. Never let an interpretation silently become a fact, a package silently become a publication, or a local commit silently become a remote push.

## Graph compiler

### Select the medium

Choose one primary medium:

- Blog or article
- Presentation or slide deck
- Talk or keynote
- Workshop or facilitated session
- Spoken, video, webinar, demo, or host script
- Website or landing page

Mark hybrids explicitly.

Examples:

- Conference talk with slides: primary talk, secondary presentation.
- Workshop with a deck: primary workshop, secondary presentation.
- Launch page plus announcement blog: two deliverables with a shared evidence ledger and separate format plans.

### Select the content job

Choose one primary job:

- Argue or change belief
- Teach or enable
- Persuade or convert
- Announce or update
- Facilitate participation
- Explain or compare
- Narrate or inspire

Use no more than two secondary jobs. Too many jobs usually indicate unbounded scope.

### Select the requested operation

Choose one:

- Create
- Critique
- Revise
- Adapt
- Package
- Publish
- Install
- Verify

Do not infer `create` merely because the artifact is content. Respect the current verb and the current stage of the work.

### Select the next use

Record:

```text
who acts next
what they will do
where they will do it
what artifact or command they need
what completion stage must be reached
what evidence proves that stage
```

Use the next use to remove unnecessary artifacts and explanations.

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
- Native artifact generation
- Publication
- Installation
- End-to-end user-path verification

Do not add an agent merely to restate the same instructions in another voice.

## Node contracts

### Request interpreter

**Input:** current prompt, conversation, source material, and existing artifact state.

**Output:**

```text
medium
content job
requested operation
purpose
audience
desired outcome
constraints
known facts
missing facts
safe assumptions
requested output mode
next user action
required completion stage
```

**Pass when:** the current request can be executed without inventing material or confusing its operation.

**Failure routes:**

- Missing current fact -> research.
- Missing private fact -> placeholder or one necessary question.
- Conflicting constraints -> prioritize the latest explicit instruction and note any unresolved conflict.
- User correction -> graph-reset node.

### Graph-reset node

**Trigger:** the latest instruction narrows, replaces, or rejects the prior outcome.

**Output:**

```text
new authoritative outcome
new requested operation
new next user action
new completion stage
branches to preserve
branches to remove
```

**Pass when:** no obsolete deliverable or explanation remains in the active graph.

**Failure route:** re-read the latest instruction without relying on sunk work.

### Source sufficiency gate

**Input:** requested claims and available evidence.

**Output:** evidence ledger and a list of claims to research, narrow, qualify, replace, or mark with a placeholder.

**Pass when:** every major factual claim has support, qualification, or a visible gap.

**Failure routes:**

- Verifiable public fact -> research.
- Company-internal fact -> connected company source when available.
- Personal experience -> user-supplied material only.
- Unsupported generalization -> narrow or remove.

### Audience model

**Input:** audience description, venue, channel, purpose, and content job.

**Output:**

```text
what they know
what they believe
what they are tired of hearing
what they resist
what they can do next
what language they use
```

**Pass when:** the model is specific enough to remove unnecessary explanation and predict resistance.

**Failure route:** narrow to the most likely audience and mark the assumption.

### Meaning layer

**Input:** content job, audience model, evidence ledger, and author judgment.

**Output:** the smallest logical or experiential structure needed to achieve the desired change.

**Pass when:** each step changes understanding, enables an action, resolves an objection, or prepares the next step.

**Failure routes:**

- Obvious claim -> sharpen judgment or reduce ambition.
- Missing mechanism -> explain how or why.
- Missing consequence -> state what changes.
- No evidence -> source sufficiency gate.

### Format plan

**Input:** meaning layer and medium rules.

**Output:** ordered units with one job each.

Examples:

```text
section -> claim or task
slide -> establish, prove, contrast, reveal, involve, or resolve
talk beat -> tension, story, mechanism, proof, reflection, or decision
activity -> action, prompt, timebox, artifact, debrief, and transfer
website section -> visitor question, answer, proof, and next action
```

**Pass when:** no unit exists merely because the format usually contains it.

### Preserve-contract node

Use for critique, revision, and adaptation.

**Input:** current artifact and user instruction.

**Output:**

```text
must preserve
may change
known strengths
known failures
factual invariants
voice invariants
```

**Pass when:** a repair cannot accidentally erase working material or alter factual meaning.

### Operation branch

#### Create

Produce one complete draft from the approved meaning and format plans. Finish the artifact before broad editing.

#### Critique

Return located findings, severity, cause, and consequence. Do not replace the artifact unless revision is also requested.

#### Revise

Repair the earliest responsible node. Change only the units affected by the failure and any transitions required for integration.

#### Adapt

Preserve the evidence ledger and judgment. Rebuild the format plan for the new medium, audience, duration, or channel.

#### Package

Hand approved source to the appropriate artifact capability. Verify the resulting native or distributable artifact.

#### Publish

Require authority, perform the external write through the owning capability, and verify the remote result.

#### Install

Use the actual installation path, then inspect expected locations, registration, or behavior.

#### Verify

Inspect the actual artifact or environment. Do not create a replacement artifact merely to avoid verification.

### Independent audits

Run narrow audits for the material risks:

- **Factuality:** support, accuracy, qualification, and invented detail.
- **Audience:** relevance, assumed knowledge, resistance, and usefulness.
- **Format:** medium-specific integrity.
- **Anti-slop:** genericness, empty language, false insight, repetition, and process slop.
- **Voice:** authorial fit and confidence level.
- **Constraint:** length, timing, venue, file type, brand, and requested structure.
- **Operation:** whether the response performed the requested verb.
- **Delivery:** whether the result supports the next use and completion stage.

Rate findings:

- `VETO`: cannot ship or claim completion.
- `HIGH`: materially weakens trust, usefulness, or user progress.
- `MEDIUM`: meaningful improvement.
- `LOW`: taste or polish only.

### Repair router

Repair the earliest responsible node.

```text
fabricated or unsupported fact -> source sufficiency
obvious thesis -> judgment or audience model
missing why -> mechanism
weak proof -> evidence
repeated point -> meaning or format plan
generic prose -> source detail, mechanism, example, judgment, or deletion
crowded slide -> slide job or visual plan
unnatural speech -> spoken-language pass
unworkable exercise -> activity mechanics
weak CTA -> visitor intent or persuasion logic
scope inertia -> request interpreter and graph reset
process substitution -> next-use and final-response contract
artifact inflation -> canonical source and delivery contract
status inflation -> completion-stage verification
verification laundering -> user-path verifier
capability sprawl -> operational handoff
```

Do not answer every failure with a full rewrite.

### Delivery contract

Use for package, publish, install, and operational verification.

**Input:** approved source, destination, next user action, authority, and required completion stage.

**Output:**

```text
canonical source
derived artifact
destination identifier
observed version or commit
checks executed
observed completion stage
untested boundary
```

**Pass when:** the requested completion stage is observed with evidence tied to the user's path.

**Failure routes:**

- Missing authority -> request approval only when required.
- Missing destination capability -> `BLOCKED`.
- Failed publication or installation -> preserve evidence, diagnose, change approach once, and retry within budget.
- Untested platform -> qualify the claim.

### Finalization gate

Confirm:

- No new facts, promises, or examples were introduced during polish.
- Veto and high findings are resolved.
- Placeholders are filled or visible.
- The current operation was performed.
- The requested output mode is honored.
- The claimed completion stage matches evidence.
- The artifact can be used without reading process notes.
- The first actionable block contains the result or next action.

## Revision and retry budgets

Allow at most two targeted content repair rounds by default.

- Round 1: resolve vetoes, evidence gaps, architecture failures, and medium mismatch.
- Round 2: resolve remaining high findings and voice problems.

Stop before repeated polishing removes specificity or personality.

For operational failures, allow bounded retries only when the next attempt changes a relevant hypothesis, method, credential, path, or environment. Change direction after the same failure twice. Do not relabel a lower completion stage as success.

## Final response behavior

Return the result in this order:

1. The requested content, command, artifact, link, or decision
2. The verified destination or identifier
3. Essential verification evidence
4. One material limitation when present

Present one primary artifact by default. Do not dump the graph, state, full audit, bundles, or build history unless requested.
