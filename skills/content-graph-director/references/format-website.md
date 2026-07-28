# Website and Landing Page Branch

## Contents

- [Classify the page](#classify-the-page)
- [Visitor model](#visitor-model)
- [Page graph](#page-graph)
- [Section contract](#section-contract)
- [Hero behavior](#hero-behavior)
- [Proof](#proof)
- [CTA design](#cta-design)
- [Copy and interface relationship](#copy-and-interface-relationship)
- [Website build behavior](#website-build-behavior)
- [Default copy deliverable](#default-copy-deliverable)

## Classify the page

- Homepage
- Product or feature page
- Campaign landing page
- Event page
- Pricing or plan explanation
- Documentation or tutorial page
- Comparison page
- Case study
- Signup or activation flow

Do not apply a generic SaaS homepage structure to every page.

## Visitor model

Record:

```text
who arrived
what brought them here
what they already know
what they need to decide or do
what they distrust
what proof they need
what action they are ready for
what could stop them
```

A broad persona such as "modern teams" is not enough.

## Page graph

Use this default for persuasive pages:

```text
visitor situation
-> precise promise
-> mechanism
-> proof
-> key use cases or decisions
-> objections and tradeoffs
-> action
```

Use this for task pages:

```text
target task
-> prerequisites
-> first success
-> steps
-> verification
-> failure recovery
-> next task
```

Use this for event pages:

```text
what the event is
-> who it is for
-> what happens
-> why the participants are credible
-> date, time, place, and access
-> what attendees leave with
-> registration action
```

## Section contract

Every section must answer a real visitor question.

```text
visitor question
answer
proof or mechanism
next action or transition
```

Examples:

- What is this?
- Is it for someone like me?
- What can I do with it?
- How does it work?
- Why should I believe the claim?
- What does it replace or simplify?
- What is the tradeoff?
- What happens next?

Delete sections that exist only because landing pages usually contain them.

## Hero behavior

A useful hero should establish:

```text
specific audience or situation
specific value or outcome
what the product or event actually is
credible next action
```

Do not use a vague category claim followed by an inflated adjective stack.

Weak:

```text
The powerful platform for modern teams.
```

Stronger pattern:

```text
Deploy a web service from a Git repository without managing a server.
```

Use only claims supported by the product and evidence.

## Proof

Place proof near the related promise:

- Product behavior
- Demonstration
- Customer evidence
- Performance data
- Security or compliance facts
- Screenshots
- Architecture
- Clear limitations

Never invent logos, customer quotes, usage numbers, benchmarks, awards, or testimonials.

## CTA design

Match the CTA to visitor readiness.

- High readiness: start, deploy, register, buy
- Medium readiness: see example, compare, view demo
- Low readiness: learn how it works, read guide

Keep one primary action per page region. Make secondary actions genuinely secondary.

## Copy and interface relationship

- Write for scanning, but do not turn every sentence into a fragment.
- Let headings carry decisions or answers, not generic labels.
- Keep labels and buttons literal enough to predict the result.
- Use microcopy to remove specific uncertainty.
- Avoid repeating the hero promise in every section.
- Plan mobile order separately from desktop layout when the page is being built.

## Website build behavior

When the user requests a coded or designed page:

1. Finalize the visitor model, page graph, section contracts, and proof inventory.
2. Use the available coding or design capability.
3. Preserve the approved information hierarchy in the implementation.
4. Verify responsive order, legibility, CTA behavior, accessibility, and factual claims.
5. Do not let template components dictate the story.

## Default copy deliverable

When no native build is requested, return:

```text
Page goal and visitor
Page hierarchy
Section by section:
- Visitor question
- Heading
- Copy
- Proof or visual
- CTA
```

Provide finished copy, not only strategic commentary, when the user asks for website content.
