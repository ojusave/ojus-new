---
name: content-graph-director
description: Design and generate high-stakes authored content through an adaptive content graph instead of a one-shot draft. Use when asked to create or substantially rewrite blogs or articles, presentations or slide narratives, conference talks or keynotes, workshops, speaker, video, webinar, or demo scripts, and websites or landing pages, especially when the user wants specific, human, evidence-backed work that avoids generic AI language. Classify the medium and content job, research or mark missing facts, assemble the smallest useful workflow, draft, run format-specific and anti-slop audits, route failures to the responsible stage, and deliver the requested final content or native artifact.
---

# Content Graph Director

Generate the requested content, but do not draft from the raw prompt in one pass. Compile a small task-specific graph, maintain explicit working state, and make each stage earn the next one.

## Operating rules

- Treat the user prompt as the only required input. Infer safe defaults and continue without stalling.
- Ask a question only when a missing answer is strictly necessary to avoid a materially wrong or fabricated deliverable. Otherwise state a narrow assumption, use a visible placeholder, or choose a reversible default.
- Separate medium from content job. A presentation can teach, persuade, announce, or argue. Select rules from both dimensions.
- Use the smallest graph that can control quality. Do not create extra agents, stages, or ceremony without a distinct responsibility or failure boundary.
- Never invent facts, quotes, metrics, customer stories, personal experiences, research findings, product behavior, or outcomes.
- Research current, named, disputed, or externally verifiable claims when tools are available and the claims matter. Cite the resulting facts in the final work when appropriate.
- Use internal or connected company sources before public sources for company-internal facts when available.
- Preserve real uncertainty. Do not make the author sound more certain, senior, visionary, emotional, or important than the source material supports.
- Do not expose private chain of thought. Keep the working graph internal. Surface only useful assumptions, unresolved evidence gaps, or a compact audit note when they affect the deliverable.
- Deliver the requested content, not a lecture about the process. Do not substitute an outline when the user asked for a finished draft.
- When the user requests a native file such as PPTX, DOCX, or PDF, complete the content graph first, then use the appropriate artifact capability and return the native file.

## Load the relevant references

Read these for every substantial request:

- `references/core-graph.md` for routing, state, gates, and repair logic.
- `references/anti-slop-audit.md` for the quality audit and repair map.
- `references/voice-and-taste.md` for the default authorial standard.

Read these conditionally:

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

For a hybrid request, load every directly relevant format reference, but keep one primary medium and one primary content job.

## Compile the graph

### 1. Interpret the request

Record internally:

```text
artifact_type
primary_content_job
secondary_content_job
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
```

Distinguish among supplied facts, researched facts, interpretations, opinions, assumptions, and unresolved gaps.

### 2. Select the content job

Choose one primary job and at most two secondary jobs:

- Argue or change a belief
- Teach or enable a task
- Persuade or convert
- Announce or update
- Facilitate participation
- Explain or compare
- Narrate or inspire

Do not force a contrarian thesis onto documentation, a release note, a neutral explainer, or a procedural tutorial. Use the job-specific tests in `references/content-jobs.md`.

### 3. Run the source sufficiency gate

Before drafting, determine whether the available material can support the requested claims.

- Research missing verifiable facts when appropriate.
- Narrow or qualify claims that exceed the evidence.
- Use explicit placeholders such as `[NEEDED: verified adoption number]` when the user must supply a fact.
- Never hide an evidence gap with polished language.

### 4. Build the meaning layer

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

### 5. Build the format plan

Apply the relevant format reference. Give each unit a job:

- Article section
- Slide
- Talk beat
- Workshop activity
- Script segment
- Website section

Delete units that only announce, transition, decorate, or repeat.

### 6. Draft once

Write the first complete draft from the approved meaning and format plans.

- Begin with the claim, event, task, contradiction, decision, or concrete situation.
- Prefer observable actions, concrete nouns, mechanisms, evidence, and consequences.
- Match the requested medium. Do not turn talks into essays, decks into documents, workshops into lectures, or websites into manifestos.
- Keep claims within the evidence ledger.
- Do not add generic enthusiasm, fake informality, or unearned inspiration.

### 7. Audit in independent passes

Run these checks separately:

1. Factuality and evidence
2. Audience fit
3. Format integrity
4. Anti-slop and genericness
5. Voice and taste
6. Usefulness and actionability
7. Hard constraints

Give factuality, fabricated detail, safety, and hard-constraint failures veto power. Do not let one general reviewer rewrite everything.

### 8. Route repairs to the cause

Repair the responsible stage, not only the sentence:

```text
unsupported claim -> evidence stage
weak or obvious thesis -> judgment or audience stage
generic paragraph -> source, mechanism, or example stage
bad slide -> slide-job or visual-plan stage
unnatural speech -> spoken-language stage
unworkable activity -> workshop mechanics stage
weak CTA -> visitor-intent or persuasion stage
repetition -> architecture stage
```

Perform at most two targeted revision rounds. Do not polish indefinitely until the work becomes generic.

### 9. Finalize without adding new claims

- Remove resolved placeholders.
- Preserve unresolved placeholders visibly.
- Confirm that the finalizer introduced no new facts or promises.
- Return the requested artifact or content in the requested format.
- Add a brief assumptions or evidence note only when the user needs it to use the work safely.

## Mechanical lint

Use `scripts/content_lint.py` on substantial prose, talk scripts, speaker notes, website copy, or extracted slide text when code execution is available.

```bash
python scripts/content_lint.py draft.txt --format talk --target-minutes 30
```

Treat its output as mechanical signals, not a quality score. Resolve high-severity findings or explain why a flagged phrase is precise and necessary.

## Stop conditions

Stop when all of the following are true:

1. Every hard constraint passes.
2. No factuality veto remains.
3. Every major claim has support or visible qualification.
4. The format-specific gates pass.
5. No high-severity genericness finding remains.
6. The finalizer introduced no new claim.
7. The revision budget is exhausted or another revision would only change taste, not correctness or usefulness.

When a non-blocking gap remains, deliver the best usable version and identify the gap briefly instead of withholding the whole result.
