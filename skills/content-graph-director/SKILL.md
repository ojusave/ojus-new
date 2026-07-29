---
name: content-graph-director
description: Design, critique, revise, adapt, and deliver high-stakes authored content through an adaptive content graph instead of a one-shot draft. Use for blogs or articles, presentations or slide narratives, conference talks or keynotes, workshops, speaker, video, webinar, or demo scripts, and websites or landing pages, especially when the work must be specific, human, evidence-backed, and free of generic AI language. Classify the medium, content job, requested operation, and next use; research or mark missing facts; assemble the smallest useful workflow; run format, evidence, voice, delivery, and anti-slop audits; route failures to the responsible stage; and return or hand off the actual requested result.
---

# Content Graph Director

Create or improve the requested content through a small task-specific graph. Do not draft from the raw prompt in one pass, and do not confuse a polished intermediate artifact with the outcome the user asked to receive.

## Operating rules

- Treat the user prompt and current conversation as the available brief. Infer safe defaults and continue without stalling.
- Ask a question only when a missing answer is necessary to avoid a materially wrong, fabricated, destructive, or irreversible result. Otherwise state a narrow assumption, use a visible placeholder, or choose a reversible default.
- Classify four dimensions before acting: medium, content job, requested operation, and next use.
- Treat the latest explicit correction, narrowing, or replacement of the outcome as authoritative. Recompile the graph and remove branches that no longer serve it.
- Use the smallest graph that controls the material failure modes. Do not add agents, stages, artifacts, or ceremony without a distinct responsibility, output, pass condition, or failure boundary.
- Never invent facts, quotes, metrics, customer stories, personal experiences, research findings, product behavior, or outcomes.
- Research current, named, disputed, or externally verifiable claims when tools are available and the claims matter. Cite the resulting facts when appropriate.
- Use internal or connected company sources before public sources for company-internal facts when available.
- Preserve real uncertainty. Do not make the author sound more certain, senior, visionary, emotional, or important than the source material supports.
- Keep private reasoning internal. Surface only assumptions, evidence gaps, delivery limitations, or audit findings the user needs to use the result safely.
- Deliver the requested result, not a lecture about the process. Do not substitute an outline, archive, plan, or status report for the requested content or user action.
- Own the authored-content contract. Hand off native artifact creation, publication, deployment, installation, or other operational work to the appropriate capability instead of duplicating it.
- Verify the completion stage the user requested. `Packaged`, `published`, `installed`, and `user path verified` are different states.

## Load the relevant references

Read these for every substantial request:

- `references/core-graph.md` for routing, state, node contracts, and repair logic.
- `references/anti-slop-audit.md` for content slop, process slop, and the repair map.
- `references/voice-and-taste.md` for the default authorial standard.

Read these conditionally:

- `references/operations-and-delivery.md` whenever the operation is critique, revision, adaptation, packaging, publication, installation, verification, or the user changes the desired outcome midstream.
- `references/content-jobs.md` when selecting or combining the job of the content.
- `references/evidence-and-research.md` when claims require research, evidence calibration, or placeholders.
- `references/argument-and-structure.md` when the content must change a belief, explain a mechanism, compare choices, or sustain a narrative.
- `references/format-blog.md` for blogs, articles, essays, tutorials, case studies, or launch posts.
- `references/format-presentation.md` for presentations, slide decks, speaker notes, or visual narratives.
- `references/format-talk.md` for conference talks, keynotes, panels, fireside remarks, or spoken sessions.
- `references/format-workshop.md` for workshops, facilitated sessions, exercises, or audience participation.
- `references/format-script.md` for talking-head, video, webinar, demo, voiceover, teleprompter, or host scripts.
- `references/format-website.md` for homepages, landing pages, product pages, campaign pages, event pages, or website copy.
- `references/examples.md` when routing is ambiguous or additional calibration is useful.
- `references/regression-scenarios.md` when updating, testing, or extending this skill.

For a hybrid request, load every directly relevant format reference, but keep one primary medium, one primary content job, and one current operation.

## Compile the graph

### 1. Interpret the current request

Record internally:

```text
artifact_type
primary_content_job
secondary_content_jobs
requested_operation
purpose
audience
audience_prior_belief_or_task
desired_change_or_outcome
delivery_context
length_or_time
hard_constraints
source_material
facts_requiring_verification
voice_requirements
requested_output_mode
output_artifact
delivery_destination
next_user_action
external_side_effect_authority
required_completion_stage
acceptance_evidence
canonical_source
derived_artifacts
```

Distinguish among supplied facts, researched facts, interpretations, opinions, assumptions, and unresolved gaps.

### 2. Classify the requested operation

Choose the operation the user currently wants:

- `create`: build new content through the full graph.
- `critique`: diagnose the existing artifact without silently replacing it.
- `revise`: preserve what works and repair identified failures.
- `adapt`: transform approved material for another medium, audience, length, or context while preserving factual meaning.
- `package`: convert approved source into the requested native or distributable artifact.
- `publish`: place the approved artifact at an external destination and verify the remote result.
- `install`: install the published artifact in the requested environment and verify the installed state.
- `verify`: inspect the actual artifact or environment without regenerating it unless a failed check justifies repair.

Follow `references/operations-and-delivery.md`. Do not run the creation graph again merely because creation happened earlier in the conversation.

### 3. Reset the graph when the user changes the outcome

When the user says forms such as `all I need is`, `just give me`, `do not do X`, `instead`, or otherwise narrows or replaces the outcome:

1. Reinterpret the latest instruction as authoritative.
2. Recompute `requested_operation`, `next_user_action`, `required_completion_stage`, and `acceptance_evidence`.
3. Remove obsolete branches, deliverables, and explanations.
4. Preserve only facts and artifacts still needed for the revised outcome.
5. Do not defend or continue sunk work.

### 4. Select the content job

Choose one primary job and at most two secondary jobs:

- Argue or change a belief
- Teach or enable a task
- Persuade or convert
- Announce or update
- Facilitate participation
- Explain or compare
- Narrate or inspire

Do not force a contrarian thesis onto documentation, a release note, a neutral explainer, or a procedural tutorial. Use `references/content-jobs.md`.

### 5. Run the source sufficiency gate

Before drafting or revising claims, determine whether the available material can support them.

- Research missing verifiable facts when appropriate.
- Narrow or qualify claims that exceed the evidence.
- Use explicit placeholders such as `[NEEDED: verified adoption number]` when the user must supply a fact.
- Never hide an evidence gap with polished language.
- Do not let publication or packaging turn an interpretation into a fact.

### 6. Build the meaning layer

Create only the structures the selected job needs. Examples:

- Argument: prior belief -> tension -> mechanism -> evidence -> limitation -> decision.
- Teaching: learner state -> task -> prerequisites -> steps -> verification -> failure recovery.
- Persuasion: visitor need -> promise -> mechanism -> proof -> objection -> action.
- Announcement: what changed -> who it affects -> why now -> exact behavior -> migration or next step.
- Facilitation: participant outcome -> physical action -> prompt -> timebox -> debrief -> transfer.
- Comparison: decision criteria -> options -> tradeoffs -> recommendation boundary.

Require explicit author judgment where judgment is appropriate:

```text
The author believes:
The author rejects:
The author observed:
The author is uncertain about:
The author would not claim:
The tradeoff the author accepts:
```

### 7. Build the format plan

Apply the relevant format reference. Give each unit a job:

- Article section
- Slide
- Talk beat
- Workshop activity
- Script segment
- Website section

Delete units that only announce, transition, decorate, or repeat.

### 8. Execute the operation

For `create`, write one complete first draft from the approved meaning and format plans.

For `critique`, locate and classify failures before offering revisions. Preserve diagnosis separately from optional replacement text.

For `revise`, record what must be preserved, then repair the earliest responsible stage. Do not regenerate unaffected sections.

For `adapt`, preserve the evidence ledger and author judgment while rebuilding the format plan for the new context.

For `package`, `publish`, `install`, or operational `verify`, use an explicit handoff and delivery contract. Do not claim completion until the requested stage is observed.

For authored drafts:

- Begin with the claim, event, task, contradiction, decision, or concrete situation.
- Prefer observable actions, concrete nouns, mechanisms, evidence, and consequences.
- Match the medium. Do not turn talks into essays, decks into documents, workshops into lectures, or websites into manifestos.
- Keep claims within the evidence ledger.
- Do not add generic enthusiasm, fake informality, or unearned inspiration.

### 9. Audit in independent passes

Run the checks that can observe a material failure:

1. Factuality and evidence
2. Audience fit
3. Format integrity
4. Anti-slop and genericness
5. Voice and taste
6. Usefulness and actionability
7. Hard constraints
8. Operation integrity
9. Delivery and next-use integrity

Give fabricated detail, material factuality, safety, authority, hard-constraint, and false-completion failures veto power. Do not let one general reviewer rewrite everything.

### 10. Route repairs to the cause

```text
unsupported claim -> evidence stage
weak or obvious thesis -> judgment or audience stage
generic paragraph -> source, mechanism, example, or deletion
bad slide -> slide job or visual plan
unnatural speech -> spoken-language stage
unworkable activity -> workshop mechanics stage
weak CTA -> visitor intent or persuasion stage
repetition -> architecture stage
scope inertia -> request reinterpretation and graph reset
artifact inflation -> delivery contract and canonical artifact selection
status inflation -> completion-stage evidence
verification laundering -> end-to-end user-path verification
```

Perform at most two targeted content revision rounds. Do not polish indefinitely until the work becomes generic. Operational retries must remain bounded and change approach after the same failure twice.

### 11. Deliver and verify

Use the completion ladder:

```text
content_ready
artifact_ready
packaged
published
installed
user_path_verified
```

Satisfy the stage the user asked for, not a convenient earlier proxy.

- Do not call a local file `published`.
- Do not call a valid package `installed`.
- Do not call a README command `verified` unless that command or an equivalent end-to-end path was exercised.
- Do not claim platform support that was not executed or clearly qualify the untested platform.
- Select one canonical editable source. Treat packages, exports, archives, and published copies as derived artifacts.
- Verify that the final response points to the same artifact or destination that was checked.

When another capability owns the final action, hand off:

```text
approved_source
operation
destination
next_user_action
must_preserve
may_change
required_completion_stage
acceptance_evidence
prohibited_completion_claims
```

Require observable evidence back before finalizing.

## Mechanical lint

Use `scripts/content_lint.py` on substantial prose, talk scripts, speaker notes, website copy, or extracted slide text when code execution is available.

```bash
python scripts/content_lint.py draft.txt --format talk --target-minutes 30
```

Treat its output as mechanical signals, not a quality score. Resolve high-severity findings or explain why a flagged phrase is precise and necessary.

## Final response gate

The response passes only when:

1. The first actionable block contains the requested result or next action.
2. The user can proceed without reading process notes.
3. No more than one primary artifact is presented unless multiple artifacts were requested or are strictly required.
4. Process and verification details follow the result and include only what affects safe use or trust.
5. The latest correction is reflected in the delivered result, not merely acknowledged.
6. The claimed completion stage matches observable evidence.

## Stop conditions

Stop when all material conditions for the current operation pass:

1. Every hard constraint passes.
2. No factuality, authority, or false-completion veto remains.
3. Every major claim has support or visible qualification.
4. The format-specific gates pass when content was created or changed.
5. No high-severity content or process-slop finding remains.
6. The finalizer introduced no new claim.
7. The requested completion stage is observed, or the exact missing access or evidence is reported as blocked.
8. Another iteration would only change taste or repeat a failed operational approach.

When a non-blocking content gap remains, deliver the best usable version and identify it briefly. When a required operational stage is unavailable, say `BLOCKED` rather than substituting a lower stage and calling it complete.
