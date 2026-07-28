# Evidence and Research

## Contents

- [Goal](#goal)
- [Separate evidence classes](#separate-evidence-classes)
- [Research when](#research-when)
- [Evidence ledger](#evidence-ledger)
- [Calibrate wording](#calibrate-wording)
- [Missing information](#missing-information)
- [Source quality](#source-quality)
- [Citation behavior](#citation-behavior)
- [Research stop rule](#research-stop-rule)

## Goal

Keep factual confidence, claim scope, and wording aligned. Research to support the work, not to decorate it.

## Separate evidence classes

Maintain five categories:

1. User-supplied fact
2. Verified external or connected-source fact
3. Interpretation based on facts
4. Author opinion or judgment
5. Assumption or unresolved gap

Do not merge them.

## Research when

Research before drafting when the content depends on:

- Current facts, dates, prices, laws, schedules, product behavior, or named roles
- A specific paper, report, webpage, dataset, company claim, or public event
- Statistics or benchmark results
- Historical claims that are central and not confidently known
- Competitor or market comparisons
- Technical documentation that may have changed
- Medical, legal, financial, or other high-stakes guidance

Use connected internal sources first for private company facts. Use primary sources for technical or research claims whenever possible.

Do not browse merely to add fashionable facts or citations.

## Evidence ledger

Record major claims in this form:

```text
Claim:
Type: fact | interpretation | opinion | recommendation
Evidence:
Source:
Date or version:
Confidence: high | medium | low
Allowed wording:
Limitation:
```

Example:

```text
Claim: Developers abandoned the flow at the deployment-choice step.
Type: interpretation
Evidence: 18 of 31 observed sessions ended on that screen.
Source: internal usability study, June 2026.
Confidence: medium.
Allowed wording: "In this study, most observed drop-offs happened at the deployment-choice step."
Limitation: Small sample from one onboarding flow.
```

Not allowed:

```text
"Developers always abandon products when they see multiple deployment choices."
```

## Calibrate wording

Use stronger wording only when evidence permits it.

```text
One observation -> "we observed" or "in this case"
Small sample -> "in this sample"
Consistent repeated evidence -> "we repeatedly saw"
Broad representative evidence -> "the data indicates"
Author judgment -> "I believe" or direct opinion when context makes authorship clear
Unverified possibility -> "may," "could," or a visible question
```

Do not use hedging to disguise weak thinking. Narrow the claim instead.

## Missing information

When a private or unknowable fact is missing:

- Use a visible placeholder.
- Keep the placeholder specific.
- Draft surrounding language so the user can fill it safely.

Good placeholders:

```text
[NEEDED: verified number of activated accounts from the campaign]
[NEEDED: exact product availability date and eligible plans]
[NEEDED: first-person example the speaker is comfortable sharing]
```

Bad placeholders:

```text
[add stat]
[insert story]
```

Ask a question only when no safe draft can exist without the answer.

## Source quality

Prefer, in order:

1. User-provided primary material
2. Connected company systems for internal facts
3. Official documentation, original data, or research papers
4. Reputable reporting or expert analysis
5. Secondary summaries for orientation only

Check dates and version context. A recently uploaded copy can still contain old information.

## Citation behavior

Cite factual claims when the medium and user request support citations. For talks and decks, place sources in notes or a final sources section rather than cluttering every slide. For websites, cite or link proof near the relevant claim when appropriate. For scripts, include source notes outside spoken lines.

Do not fabricate a citation or cite a source that does not support the exact claim.

## Research stop rule

Stop researching when:

- Each load-bearing claim is supported or narrowed.
- Additional sources repeat the same evidence.
- Remaining gaps require private user material.
- Research would not change the structure, claim, or recommendation.
