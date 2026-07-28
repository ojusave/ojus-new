# Routing and Calibration Examples

## Contents

- [Example 1: Thought leadership talk](#example-1-thought-leadership-talk)
- [Example 2: Technical tutorial](#example-2-technical-tutorial)
- [Example 3: Launch presentation](#example-3-launch-presentation)
- [Example 4: Theater-seating workshop](#example-4-theater-seating-workshop)
- [Example 5: Product landing page](#example-5-product-landing-page)
- [Example 6: Live demo script](#example-6-live-demo-script)
- [Example 7: Incident update](#example-7-incident-update)
- [Example 8: Neutral comparison](#example-8-neutral-comparison)
- [Calibration: generic versus specific](#calibration-generic-versus-specific)
- [Calibration: false contrast versus direct claim](#calibration-false-contrast-versus-direct-claim)
- [Calibration: workshop activity](#calibration-workshop-activity)

Use these examples to calibrate graph selection. Do not copy their subject matter or wording into unrelated work.

## Example 1: Thought leadership talk

Prompt:

```text
Create a 30-minute conference talk about why request rate is a bad capacity metric for long-running AI agents. The audience is senior infrastructure engineers.
```

Route:

```text
primary medium: talk
secondary medium: presentation if slides are requested
primary job: argue or change belief
secondary job: explain
required nodes: audience prior belief, thesis, mechanism, evidence, objection, spoken-language, timing, ending
```

Do not begin with a definition of AI agents. Do not invent production data. If data is absent, build the mechanism and mark exact evidence slots.

## Example 2: Technical tutorial

Prompt:

```text
Write a blog showing how to deploy a FastAPI service with Postgres.
```

Route:

```text
primary medium: blog
primary job: teach or enable
secondary job: explain
required nodes: prerequisites, first success, exact sequence, verification, likely failures, recovery
```

Do not force a bold thesis or long industry introduction. Confirm current product commands and settings before publishing.

## Example 3: Launch presentation

Prompt:

```text
Make a 12-slide deck announcing a new workflow product to existing customers.
```

Route:

```text
primary medium: presentation
primary job: announce or update
secondary job: persuade or convert
required nodes: exact change, audience impact, mechanism, proof, availability, limitation, CTA, slide jobs, speaker notes
```

Do not create customer enthusiasm, adoption numbers, or performance gains without evidence. A slide count is a constraint, not a narrative.

## Example 4: Theater-seating workshop

Prompt:

```text
Design a 55-minute workshop for 150 people in fixed theater seating. They have phones but no desks or laptops.
```

Route:

```text
primary medium: workshop
secondary medium: presentation
primary job: facilitate participation
secondary job: teach or enable
required nodes: observable outcome, room constraints, phone-compatible actions, timing simulation, fallback, debrief, transfer
```

Reject laptop exercises, table work, and activities that require moving into large groups.

## Example 5: Product landing page

Prompt:

```text
Write a landing page for a tool that turns a Git repository into a preview deployment.
```

Route:

```text
primary medium: website
primary job: persuade or convert
secondary job: explain
required nodes: visitor intent, promise, mechanism, proof inventory, objections, CTA, section contracts
```

Do not use invented benchmarks, customer logos, or "modern teams" as a substitute for an audience.

## Example 6: Live demo script

Prompt:

```text
Write a 10-minute live demo script showing an app moving from local development to production.
```

Route:

```text
primary medium: script
primary job: teach or enable
secondary job: persuade or convert
required nodes: beat sheet, starting state, first visible success, screen actions, proof, wait-time lines, technical fallback, CTA, timing
```

Do not narrate every click. Explain decisions and visible outcomes.

## Example 7: Incident update

Prompt:

```text
Write a public incident update explaining that deploys were delayed by a GitHub outage and service has recovered.
```

Route:

```text
primary medium: blog or public post, depending requested channel
primary job: announce or update
secondary job: explain
required nodes: exact time, affected behavior, cause confidence, current status, user action, update source
```

Do not add emotional marketing language. Verify the incident status and exact timestamps.

## Example 8: Neutral comparison

Prompt:

```text
Explain the difference between PostgreSQL and Supabase for a developer choosing a backend.
```

Route:

```text
primary medium: article or answer
primary job: explain or compare
secondary job: teach
required nodes: decision criteria, category distinction, mechanisms, tradeoffs, recommendation conditions
```

Do not frame products as direct substitutes when they operate at different layers.

## Calibration: generic versus specific

Generic:

```text
In today's rapidly evolving developer landscape, teams need seamless tools that empower them to innovate faster.
```

Diagnosis:

```text
No identifiable audience, event, mechanism, proof, decision, or consequence.
```

Specific:

```text
The setup flow asks developers to choose a deployment model before they have seen the application run. The product requires an architecture decision at the moment the developer has the least context.
```

Why it works:

```text
Names the actor, moment, action, mechanism, and consequence. A reader can inspect or disagree with it.
```

## Calibration: false contrast versus direct claim

Weak:

```text
This is not just about better documentation. It is about transforming the entire developer journey.
```

Better:

```text
Documentation cannot fix a setup flow that asks for three irreversible choices before the first successful result.
```

The repair is not a synonym change. It replaces an empty contrast with a mechanism and boundary.

## Calibration: workshop activity

Weak:

```text
Discuss onboarding friction with the person next to you.
```

Stronger:

```text
Read the three-step onboarding scenario on screen. Choose the exact step where you would stop, then tell your neighbor what information you needed at that moment. You have 90 seconds. We will compare the room's choices before revealing the completion data.
```

The stronger activity defines input, action, decision, time, and debrief value.
