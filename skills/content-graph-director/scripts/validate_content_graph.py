#!/usr/bin/env python3
"""Validate Content Graph Director's structural and semantic contracts.

This is a maintainer check. It does not score writing quality. It verifies that
routing, delivery, regression, and reference contracts remain present and that
SKILL.md does not point at missing resources.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


REQUIRED_FILES = [
    "SKILL.md",
    "agents/openai.yaml",
    "references/core-graph.md",
    "references/anti-slop-audit.md",
    "references/voice-and-taste.md",
    "references/operations-and-delivery.md",
    "references/regression-scenarios.md",
    "references/content-jobs.md",
    "references/evidence-and-research.md",
    "references/argument-and-structure.md",
    "references/format-blog.md",
    "references/format-presentation.md",
    "references/format-talk.md",
    "references/format-workshop.md",
    "references/format-script.md",
    "references/format-website.md",
    "references/examples.md",
    "scripts/content_lint.py",
    "scripts/install.sh",
    "scripts/install.ps1",
]

REQUIRED_CONTRACTS = {
    "SKILL.md": [
        "requested_operation",
        "next_user_action",
        "required_completion_stage",
        "Reset the graph",
        "user_path_verified",
        "scope inertia",
        "verification laundering",
        "Final response gate",
    ],
    "references/core-graph.md": [
        "Requested operation",
        "Next use",
        "Graph-reset node",
        "Preserve-contract node",
        "Delivery contract",
        "completion-stage verification",
    ],
    "references/anti-slop-audit.md": [
        "Process-slop audit",
        "Process substitution",
        "Artifact inflation",
        "Status inflation",
        "Scope inertia",
        "Verification laundering",
        "Capability sprawl",
    ],
    "references/operations-and-delivery.md": [
        "Classify the operation",
        "Reset on user correction",
        "Use the completion ladder",
        "Keep one canonical source",
        "Hand off operational work",
        "Verify the user path",
    ],
    "references/regression-scenarios.md": [
        "Midstream graph reset",
        "Publication is blocked",
        "Create, publish, and install",
        "Verify without regeneration",
        "Result-first response",
    ],
}

FORBIDDEN_SOURCE_MARKERS = [
    "ojusave/ojus-new",
    "raw.githubusercontent.com/ojusave",
]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Validate the Content Graph Director skill contract."
    )
    parser.add_argument(
        "skill_root",
        nargs="?",
        type=Path,
        default=Path(__file__).resolve().parent.parent,
        help="Path to the content-graph-director skill directory.",
    )
    return parser.parse_args()


def load_text(path: Path, errors: list[str]) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except OSError as exc:
        errors.append(f"could not read {path}: {exc}")
        return ""


def validate_frontmatter(skill_text: str, errors: list[str]) -> None:
    match = re.match(r"\A---\n(.*?)\n---\n", skill_text, flags=re.DOTALL)
    if not match:
        errors.append("SKILL.md is missing valid YAML frontmatter delimiters")
        return

    keys: list[str] = []
    values: dict[str, str] = {}
    for line in match.group(1).splitlines():
        if not line.strip():
            continue
        if ":" not in line:
            errors.append(f"invalid frontmatter line: {line!r}")
            continue
        key, value = line.split(":", 1)
        key = key.strip()
        keys.append(key)
        values[key] = value.strip()

    if keys != ["name", "description"]:
        errors.append(
            "SKILL.md frontmatter must contain only name and description in that order"
        )
    if values.get("name") != "content-graph-director":
        errors.append("SKILL.md must declare name: content-graph-director")
    if len(values.get("description", "")) < 100:
        errors.append("SKILL.md description is too short to route reliably")


def validate_references(
    skill_root: Path, skill_text: str, errors: list[str]
) -> None:
    references = set(
        re.findall(r"`((?:references|scripts)/[^`]+)`", skill_text)
    )
    for reference in sorted(references):
        if not (skill_root / reference).is_file():
            errors.append(f"SKILL.md references missing resource: {reference}")


def main() -> int:
    args = parse_args()
    skill_root = args.skill_root.resolve()
    errors: list[str] = []

    if not skill_root.is_dir():
        print(f"ERROR: skill root does not exist: {skill_root}", file=sys.stderr)
        return 1

    for relative in REQUIRED_FILES:
        if not (skill_root / relative).is_file():
            errors.append(f"missing required file: {relative}")

    skill_text = load_text(skill_root / "SKILL.md", errors)
    validate_frontmatter(skill_text, errors)
    validate_references(skill_root, skill_text, errors)

    line_count = len(skill_text.splitlines())
    if line_count > 500:
        errors.append(f"SKILL.md has {line_count} lines; keep it at or below 500")

    for relative, required_terms in REQUIRED_CONTRACTS.items():
        text = load_text(skill_root / relative, errors)
        for term in required_terms:
            if term not in text:
                errors.append(f"{relative} is missing required contract text: {term}")

    all_text_parts: list[str] = []
    for path in sorted(skill_root.rglob("*")):
        if path.name == Path(__file__).name:
            continue
        if path.is_file() and path.suffix.lower() in {".md", ".yaml", ".yml", ".py", ".sh", ".ps1"}:
            all_text_parts.append(load_text(path, errors))
    all_text = "\n".join(all_text_parts)

    for marker in FORBIDDEN_SOURCE_MARKERS:
        if marker in all_text:
            errors.append(
                f"skill source contains repository-specific delivery marker: {marker}"
            )

    if "—" in all_text:
        errors.append("skill source contains an em dash despite the default style contract")

    if errors:
        print("Content Graph Director validation failed:", file=sys.stderr)
        for error in errors:
            print(f"- {error}", file=sys.stderr)
        return 1

    print(
        "Content Graph Director validation passed: "
        f"{len(REQUIRED_FILES)} required files, "
        f"{line_count} SKILL.md lines, operation and delivery contracts present."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
