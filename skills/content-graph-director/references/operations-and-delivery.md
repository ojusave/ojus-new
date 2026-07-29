# Operations and Delivery

## Contents

- [Purpose](#purpose)
- [Classify the operation](#classify-the-operation)
- [Reset on user correction](#reset-on-user-correction)
- [Define the delivery contract](#define-the-delivery-contract)
- [Use the completion ladder](#use-the-completion-ladder)
- [Respect authority boundaries](#respect-authority-boundaries)
- [Keep one canonical source](#keep-one-canonical-source)
- [Hand off operational work](#hand-off-operational-work)
- [Verify the user path](#verify-the-user-path)
- [Return the result first](#return-the-result-first)
- [Failure patterns](#failure-patterns)

## Purpose

Extend the content graph beyond drafting. Classify what the user wants done now, where the result must go, what they will do next, and what observable evidence proves completion.

Use four dimensions:

```text
medium x content job x requested operation x next use
```

Do not let an earlier creation task dominate a later critique, publication, installation, or verification request.

## Classify the operation

Choose one current operation.

### Create

Produce new authored material. Run source, audience, meaning, format, draft, audit, and repair stages.

### Critique

Inspect an existing artifact and return diagnosis. Quote or locate failures, explain why they matter, and rank them. Do not silently replace the artifact unless the user also requests revision.

### Revise

Change an existing artifact. Record what must be preserved, identify the earliest responsible failure, and make targeted changes. Do not restart from a blank page when most of the artifact works.

### Adapt

Transform approved content for another medium, audience, duration, channel, or context. Preserve the evidence ledger, factual meaning, and author judgment. Rebuild the format plan rather than compressing or expanding mechanically.

### Package

Turn approved source into a native or distributable artifact such as PPTX, DOCX, PDF, ZIP, or a build output. Use the appropriate artifact capability. Verify the resulting file, not only the source text.

### Publish

Place the approved artifact at an external destination such as GitHub, a CMS, a document system, or a website. Require authority for the side effect. Verify the remote object, version, URL, or commit after the write.

### Install

Install the published artifact into the requested environment. Use the real public or local installation path, then verify the expected files, registration, or runtime behavior.

### Verify

Inspect the actual artifact or environment. Do not regenerate it merely to avoid collecting evidence. Repair only when a failed check and the user's authority justify a change.

## Reset on user correction

Treat explicit narrowing or replacement as a new outcome contract.

Signals include:

```text
all I need is
just give me
do not do X
instead
stop doing X
I only want
that is not what I asked
```

When a signal appears:

1. Re-read the latest instruction.
2. Reclassify the operation.
3. Recompute the next user action and required completion stage.
4. Remove obsolete branches and deliverables.
5. Preserve only facts and artifacts still required.
6. Do not continue work merely because it already exists.

A graph reset does not erase useful evidence. It erases obsolete goals.

## Define the delivery contract

Record:

```text
output_artifact
delivery_destination
next_user_action
external_side_effect_authority
canonical_source
derived_artifacts
required_completion_stage
acceptance_evidence
```

Write acceptance evidence as observations, not adjectives.

Weak:

```text
The installer is reliable.
```

Strong:

```text
- the public command downloads successfully
- the package checksum matches
- installation creates both expected skill directories
- a second installation backs up the prior copy
- a new agent session discovers the skill
```

## Use the completion ladder

Use these stages:

```text
content_ready
artifact_ready
packaged
published
installed
user_path_verified
```

Each stage includes the earlier ones but requires new evidence.

### content_ready

The approved authored source passes content gates.

### artifact_ready

The requested native or built artifact exists and passes format-specific inspection.

### packaged

A distributable package exists, has the expected structure, and passes integrity checks.

### published

The package or artifact exists at the requested external destination. Verify the remote version, commit, object, or URL.

### installed

The artifact is present in the requested environment at the expected paths or registration points.

### user_path_verified

Exercise the action the user will actually take. Verify the same command, link, flow, or equivalent end-to-end route they will use.

Do not infer a later stage from an earlier proxy.

```text
valid source != valid package
valid package != published package
published package != successful installation
successful installation != discovered or usable skill
```

## Respect authority boundaries

Classify the side effect:

- Local, reversible artifact creation: proceed within scope.
- External publication or message: require explicit user authority.
- Production deployment, permission change, purchase, destructive action, or migration: require explicit approval and the relevant specialist workflow.

Do not turn a content-generation skill into a generic operational executor. Route the action to the capability that owns it.

## Keep one canonical source

Select one editable source of truth.

Examples:

- A repository directory for an Agent Skill
- A source document for a PDF export
- A slide model for PPTX and PDF variants
- A CMS draft for a published article

Treat exports, archives, packages, copies, and published versions as derived artifacts.

Before delivery, verify:

- every derived artifact came from the canonical source
- names, versions, claims, and links agree
- public commands reference the actual destination
- installers and examples contain no stale repository, branch, product, or file names
- the final response points to the artifact that was verified

Do not independently edit a derived artifact and let it drift from the source.

## Hand off operational work

When another capability owns the final action, provide an explicit handoff:

```text
FROM: Content Graph Director
TO: <capability>
APPROVED SOURCE: <path or artifact>
OPERATION: <package | publish | install | verify>
DESTINATION: <system, repository, file type, or environment>
NEXT USER ACTION: <what the user will do>
MUST PRESERVE: <facts, voice, structure, identifiers>
MAY CHANGE: <format-specific implementation details>
REQUIRED COMPLETION STAGE: <stage>
ACCEPTANCE EVIDENCE: <observable checks>
PROHIBITED COMPLETION CLAIMS: <claims unsupported by lower-stage evidence>
```

Require the receiving capability to return:

```text
observed result
artifact or destination identifier
version or commit when applicable
checks executed
failed or untested paths
completion stage reached
```

Do not finalize from a handoff promise.

## Verify the user path

Test the path the user will take, not a nearby developer shortcut.

Examples:

- Run the exact public installation command rather than only the inner installer.
- Open or render the exported presentation rather than only validating its source model.
- Fetch the remote GitHub file or commit rather than trusting a local commit.
- Submit the real form flow rather than only checking that the page renders.
- Confirm a newly opened agent session discovers the installed skill when the host allows it.

When exact execution is impossible, state the untested boundary precisely. Do not broaden a partial check into a platform claim.

## Return the result first

Structure the final response in this order:

1. Requested result or executable next action
2. Destination, artifact, or link
3. Essential verification evidence
4. One material limitation, only when present

The user should not need to read a build diary to find the result.

Present one primary artifact by default. Add alternatives only when the user requested them or they are required for different platforms.

## Failure patterns

### Process substitution

The response describes work instead of delivering the result.

Repair: return to `next_user_action` and place it first.

### Artifact inflation

The workflow produces ZIPs, tarballs, bundles, reports, and copies without a user need.

Repair: select one canonical source and the minimum derived artifact required for the next action.

### Status inflation

The response says `ready`, `published`, `installed`, or `verified` without stage-specific evidence.

Repair: downgrade the claim or collect the missing evidence.

### Scope inertia

The workflow continues serving an older request after the user narrows or replaces it.

Repair: reset the graph from the latest instruction.

### Verification laundering

A convenient proxy is presented as proof of the requested outcome.

Repair: define the real user path and exercise it.

### Capability sprawl

The skill duplicates packaging, GitHub, deployment, or installer implementation that another capability owns.

Repair: keep the content contract, create an explicit handoff, and verify the returned result.
