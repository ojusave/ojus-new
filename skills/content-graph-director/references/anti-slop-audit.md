# Anti-Slop Audit

## Contents

- [Diagnose the cause](#diagnose-the-cause)
- [Audit passes](#audit-passes)
- [High-signal phrase patterns](#high-signal-phrase-patterns)
- [Repair map](#repair-map)
- [Severity](#severity)

## Diagnose the cause

Generic AI writing usually comes from missing source material, judgment, mechanism, audience specificity, or format discipline. Treat phrases as signals, not the whole disease.

Do not repair weak content by asking for it to be "more human," "punchier," or "more engaging." Route the problem to the earliest responsible stage.

## Audit passes

Run each pass separately. Quote or locate the problem before revising it.

### 1. Transfer test

Flag any sentence or paragraph that could appear unchanged in:

- a competitor's content,
- an unrelated industry article,
- a generic LinkedIn post,
- another speaker's keynote,
- a template landing page.

A passage passes when it contains a specific observation, mechanism, judgment, example, tradeoff, decision, or consequence.

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

Examples:

```text
Good documentation matters.
The future is changing quickly.
Teams should focus on users.
Technology is only as powerful as the people using it.
```

Repair by finding a sharper judgment, mechanism, boundary, or decision. Delete the sentence when no sharper thought exists.

### 4. Evidence test

Flag:

- Unsupported generalizations
- Invented specificity
- Numbers without sources
- Quotes without provenance
- Stories the author did not supply
- Causal language supported only by correlation
- Confidence stronger than the evidence

Route these to evidence and research, not copyediting.

### 5. False contrast test

Flag constructions that manufacture importance through symmetry:

```text
It is not just X. It is Y.
This is not about X. It is about Y.
The future is not X, but Y.
```

Keep a contrast only when X and Y are genuinely competing interpretations and the evidence distinguishes them.

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

- Repeated groups of three with no conceptual reason
- Identical paragraph lengths
- Repeated sentence openings
- Every section ending with a slogan
- Excessive one-line paragraphs used for drama
- Headings that form a generic taxonomy

Natural variation should come from the material, not randomness.

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

- Introduction and first section
- Slide title and speaker note
- Final section and conclusion
- Hero, subhead, and first feature block
- Workshop instructions and debrief

Delete before expanding.

### 12. Format test

Flag medium mismatch:

- A talk that reads like an essay
- A deck that stores paragraphs on slides
- A workshop that is mostly lecture
- A website that reads like a manifesto
- A script that hides stage directions inside spoken lines
- A blog that is a transcript without editorial structure

Route to the relevant format plan.

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
```

## Severity

Veto:

- Fabricated detail
- Misrepresented source
- Material unsupported claim
- Hidden product, legal, safety, or financial limitation

High:

- Generic core thesis
- Medium mismatch
- Repeated central idea
- Empty opening or ending
- Voice that materially misrepresents the author

Medium:

- Local abstraction
- Weak transition
- Unnecessary heading
- Adjective without proof
- Overwritten sentence

Low:

- Taste differences that do not affect trust or use

Resolve veto and high findings before finalization.
