# Workshop Branch

## Contents

- [Start from participant change](#start-from-participant-change)
- [Workshop state](#workshop-state)
- [Activity contract](#activity-contract)
- [Session graph](#session-graph)
- [Instruction design](#instruction-design)
- [Room and material tests](#room-and-material-tests)
- [Timing simulation](#timing-simulation)
- [Participation failure plan](#participation-failure-plan)
- [Facilitation script](#facilitation-script)
- [Workshop integrity audit](#workshop-integrity-audit)
- [Default deliverable](#default-deliverable)

## Start from participant change

Define what participants will be able to identify, decide, create, diagnose, or practice by the end. The outcome must be observable.

Weak:

```text
Participants will understand developer friction.
```

Stronger:

```text
Participants will identify the exact step where a developer is likely to stop, name the cause, and choose one intervention that can be tested.
```

## Workshop state

Record:

```text
participant outcome
audience knowledge
session length
room layout
available materials
technology access
accessibility constraints
facilitator count
participant count or range
activities
artifacts or decisions produced
debrief method
transfer to real work
failure modes
```

Treat venue constraints as design inputs, not footnotes.

## Activity contract

Every activity must define:

```text
purpose
participant action
input or prompt
materials
individual, pair, group, or room mode
timebox
artifact or decision produced
what a good response may contain
debrief question
principle extracted
recovery if participation is low or time runs long
```

An activity without an action and produced result is usually a discussion prompt, not a workshop exercise.

## Session graph

Use this adaptable sequence:

```text
orient to outcome
-> create a shared example
-> let participants make a prediction or diagnosis
-> reveal a mechanism or method
-> let participants apply it
-> compare decisions
-> debrief the pattern
-> transfer it to their own context
```

Do not require every workshop to follow this exact order. Preserve the learning dependency.

## Instruction design

Before each activity, state:

1. What participants will do
2. What they will use
3. What they will produce
4. How long they have
5. What happens when time ends

Demonstrate the first step when confusion is likely. Do not explain the debrief before participants have done the work.

## Room and material tests

Check explicitly:

- Chairs only or tables
- Phones, laptops, paper, pens, sticky notes, or no materials
- Fixed seating or movable groups
- Microphones
- Screen visibility
- Internet reliability
- Accessibility and mobility
- Group size

Do not design laptop exercises for a room without desks. Do not assume participants can move into groups in fixed theater seating.

## Timing simulation

Build a run-of-show with realistic transitions.

Include time for:

- Explaining instructions
- Participant hesitation
- Pair or group formation
- Reporting back
- Facilitator synthesis
- Technical failure
- A shorter fallback path

Do not allocate the full session to ideal execution.

## Participation failure plan

For every public response moment, define a recovery:

```text
If nobody responds -> offer two concrete options or use a prepared example.
If one person dominates -> switch to silent individual thinking or a constrained round.
If time runs long -> skip report-outs, not the debrief principle.
If technology fails -> use a screenshot, printed example, or verbal scenario.
If the room is too large -> use prediction, polling, or neighbor comparison rather than open discussion.
```

## Facilitation script

Separate:

- Exact participant instructions
- Facilitator notes
- Expected responses
- Misconceptions to watch for
- Debrief questions
- Transition to the next activity

The facilitator should not need to infer the mechanics while presenting.

## Workshop integrity audit

Reject the design when:

- More than half the session is lecture without a deliberate reason
- Activities do not produce a decision, artifact, diagnosis, or practice attempt
- The room cannot support the interaction
- The debrief merely asks "what did you think?"
- The activity has no connection to the participant's real work
- Success depends on unusually enthusiastic participation
- Timing works only if every transition is instant

## Default deliverable

For a complete workshop, return:

1. Participant outcome
2. Assumptions and room constraints
3. Timed run-of-show
4. Activity instructions
5. Facilitator script or notes
6. Expected responses and misconceptions
7. Failure and fallback plan
8. Participant takeaway or transfer method

When a workshop deck is requested, apply the presentation branch after the workshop mechanics are stable.
