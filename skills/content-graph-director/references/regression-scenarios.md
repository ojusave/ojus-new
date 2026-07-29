# Regression Scenarios

Use these scenarios when updating the skill. Test routing and completion claims, not only prose quality.

## Scenario 1: Create from one prompt

Input:

```text
Create a 30-minute conference talk about why request rate is insufficient for long-running agents.
```

Expected:

```text
operation: create
primary medium: talk
primary job: argue or change belief
required stage: content_ready, or artifact_ready if a native deck is requested
```

Reject:

- drafting before the thesis and evidence gate
- invented production numbers
- returning an outline when a complete script was requested

## Scenario 2: Critique without replacement

Input:

```text
Review this talk and tell me what is weak.
```

Expected:

```text
operation: critique
```

Require:

- located findings
- severity and cause
- preservation of the original artifact

Reject a silent full rewrite.

## Scenario 3: Targeted revision

Input:

```text
The opening and conclusion work. Fix the middle, which repeats itself and loses the mechanism.
```

Expected:

```text
operation: revise
must preserve: opening, conclusion, evidence ledger
repair route: architecture and mechanism
```

Reject regenerating the entire talk.

## Scenario 4: Midstream graph reset

Sequence:

```text
User: Create an installable skill and document every installation option.
User later: All I want is one command that installs it in Codex and Cursor.
```

Expected:

- treat the second instruction as authoritative
- reclassify the current operation as install or delivery preparation
- make the single command the first actionable block
- remove archive catalogs, architecture explanations, and obsolete options

Reject continuing to optimize the earlier documentation request.

## Scenario 5: Native artifact boundary

Input:

```text
Create a presentation.
```

Expected:

- infer or determine whether the user wants slide content or an actual PPTX
- complete the content graph first
- hand off native generation when PPTX is required
- verify the rendered artifact

Reject calling a Markdown outline a finished presentation.

## Scenario 6: Publication is blocked

Input:

```text
Push this skill to a new GitHub repository.
```

Environment:

```text
The available capability can update existing repositories but cannot create one.
```

Expected:

```text
operation: publish
required stage: published
terminal result: BLOCKED unless another authorized creation path succeeds
```

Reject:

- calling local commits `pushed`
- substituting downloadable bundles and claiming success
- saying `GitHub-ready` as though it means published

## Scenario 7: Create, publish, and install

Input:

```text
Create the skill, publish it publicly, and give me one command that installs it for Codex and Cursor.
```

Expected stages:

```text
content_ready
packaged
published
installed
user_path_verified
```

Required evidence:

- canonical repository and remote commit
- installer references the canonical repository and branch
- public command downloads the published package
- clean installation creates both expected paths
- reinstall behavior is safe
- untested platform claims are qualified
- final response begins with the command

## Scenario 8: Verify without regeneration

Input:

```text
Make sure the GitHub version contains the latest installer changes.
```

Expected:

```text
operation: verify
```

Require:

- inspect the remote files or commit
- compare them with the canonical source
- report exact drift
- change the repository only when authorized

Reject recreating another local package and treating it as remote verification.

## Scenario 9: One canonical artifact

Input:

```text
Give me the finished skill so another agent can install it.
```

Expected:

- choose one canonical source
- return one primary installable artifact or one public installation command
- include alternatives only when needed for platform differences

Reject returning a ZIP, source ZIP, tarball, Git bundle, and repository archive without a stated need.

## Scenario 10: Result-first response

Input:

```text
What command should I give Cursor?
```

Expected first actionable block:

```text
<the command>
```

Reject opening with implementation history, file counts, validation summaries, or architecture.
