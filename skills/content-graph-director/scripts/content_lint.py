#!/usr/bin/env python3
"""Mechanical lint for generic content signals.

This script does not grade writing quality. It identifies phrases, repetition,
placeholder leakage, timing mismatches, and other signals that deserve review.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from collections import Counter
from pathlib import Path
from typing import Iterable


PHRASE_RULES = [
    ("ai-opening", "high", r"\bin today'?s rapidly evolving\b"),
    ("landscape-opening", "medium", r"\bin the (?:ever[- ]changing|rapidly evolving) landscape\b"),
    ("empty-transition", "medium", r"\blet(?:'| u)s dive in\b"),
    ("empty-transition", "medium", r"\bnow that we (?:have )?(?:explored|discussed|covered)\b"),
    ("empty-transition", "medium", r"\bthis is where .{1,50} comes in\b"),
    ("empty-transition", "low", r"\bin the next section,? we (?:will|shall)\b"),
    ("fake-conversation", "medium", r"\bhere'?s the thing\b"),
    ("fake-conversation", "medium", r"\blet(?:'| u)s be honest\b"),
    ("fake-conversation", "low", r"\byou might be wondering\b"),
    ("fake-conversation", "low", r"\bspoiler alert\b"),
    ("false-contrast", "high", r"\b(?:it|this) (?:is|isn'?t|is not) not just\b"),
    ("false-contrast", "high", r"\bnot (?:just|only) .{1,100}\bbut (?:also )?\b"),
    ("false-contrast", "medium", r"\bthis is not about .{1,100}\bit is about\b"),
    ("inflated-future", "medium", r"\bthe future is (?:here|now)\b"),
    ("inflated-future", "medium", r"\bthe possibilities are endless\b"),
    ("generic-audience", "medium", r"\bwhether you(?:'re| are) a\b"),
    ("generic-core", "low", r"\bat its core\b"),
    ("generic-signpost", "low", r"\bit is worth noting that\b"),
    ("marketing-inflation", "medium", r"\bunlock the power of\b"),
    ("marketing-inflation", "medium", r"\bwe (?:are|'re) thrilled to announce\b"),
]

BUZZWORDS = {
    "unlock",
    "leverage",
    "seamless",
    "robust",
    "powerful",
    "transformative",
    "game-changing",
    "landscape",
    "journey",
    "elevate",
    "revolutionize",
    "supercharge",
    "empower",
    "innovative",
    "world-class",
}

PLACEHOLDER_PATTERN = re.compile(
    r"\[(?:todo|tbd|needed|insert|add|xx+)[^\]]*\]|\b(?:todo|tbd)\b",
    re.IGNORECASE,
)

WORD_PATTERN = re.compile(r"[A-Za-z0-9']+")
SENTENCE_PATTERN = re.compile(r"(?<=[.!?])\s+(?=[A-Z0-9\[])|\n{2,}")


def read_text(path: str | None) -> str:
    if path:
        return Path(path).read_text(encoding="utf-8")
    return sys.stdin.read()


def words(text: str) -> list[str]:
    return WORD_PATTERN.findall(text)


def sentences(text: str) -> list[str]:
    return [part.strip() for part in SENTENCE_PATTERN.split(text) if part.strip()]


def snippet(text: str, start: int, end: int, radius: int = 55) -> str:
    left = max(0, start - radius)
    right = min(len(text), end + radius)
    value = re.sub(r"\s+", " ", text[left:right]).strip()
    if left > 0:
        value = "..." + value
    if right < len(text):
        value += "..."
    return value


def add_finding(
    findings: list[dict[str, object]],
    code: str,
    severity: str,
    message: str,
    examples: Iterable[str] | None = None,
) -> None:
    finding: dict[str, object] = {
        "code": code,
        "severity": severity,
        "message": message,
    }
    if examples:
        finding["examples"] = list(examples)[:5]
    findings.append(finding)


def analyze(text: str, content_format: str, target_minutes: float | None) -> dict[str, object]:
    findings: list[dict[str, object]] = []
    all_words = words(text)
    all_sentences = sentences(text)
    word_count = len(all_words)

    if "\u2014" in text:
        add_finding(
            findings,
            "em-dash",
            "high",
            "Em dashes are present. The default voice profile forbids them.",
            [snippet(text, match.start(), match.end()) for match in re.finditer("\u2014", text)],
        )

    for code, severity, pattern in PHRASE_RULES:
        matches = list(re.finditer(pattern, text, re.IGNORECASE | re.DOTALL))
        if matches:
            add_finding(
                findings,
                code,
                severity,
                f"Found {len(matches)} phrase pattern(s) that often signal generic or manufactured writing.",
                [snippet(text, match.start(), match.end()) for match in matches],
            )

    placeholders = list(PLACEHOLDER_PATTERN.finditer(text))
    if placeholders:
        add_finding(
            findings,
            "placeholder",
            "high",
            f"Found {len(placeholders)} unresolved placeholder(s). Keep them only when intentionally visible to the user.",
            [snippet(text, match.start(), match.end()) for match in placeholders],
        )

    lowered_words = [word.lower() for word in all_words]
    buzz_counts = Counter(word for word in lowered_words if word in BUZZWORDS)
    buzz_total = sum(buzz_counts.values())
    per_thousand = (buzz_total / word_count * 1000) if word_count else 0.0
    if buzz_total >= 4 and per_thousand >= 5:
        examples = [f"{word}: {count}" for word, count in buzz_counts.most_common()]
        add_finding(
            findings,
            "buzzword-density",
            "medium",
            f"Buzzword density is {per_thousand:.1f} per 1,000 words. Check whether adjectives are replacing mechanisms or proof.",
            examples,
        )

    question_count = text.count("?")
    question_density = (question_count / max(1, len(all_sentences)))
    if question_count >= 4 and question_density >= 0.18:
        add_finding(
            findings,
            "rhetorical-question-density",
            "medium",
            f"Found {question_count} question marks across {len(all_sentences)} sentence units. Check for rhetorical-question scaffolding.",
        )

    starts: Counter[str] = Counter()
    start_examples: dict[str, list[str]] = {}
    for sentence in all_sentences:
        sentence_words = [word.lower() for word in words(sentence)]
        if len(sentence_words) < 3:
            continue
        key = " ".join(sentence_words[:3])
        starts[key] += 1
        start_examples.setdefault(key, []).append(sentence[:140])
    repeated_starts = [(key, count) for key, count in starts.items() if count >= 3]
    if repeated_starts:
        repeated_starts.sort(key=lambda item: (-item[1], item[0]))
        examples = [
            f"'{key}' x{count}: {start_examples[key][0]}"
            for key, count in repeated_starts[:5]
        ]
        add_finding(
            findings,
            "repeated-sentence-start",
            "medium",
            "Several sentences begin with the same three words. Check for templated cadence.",
            examples,
        )

    long_sentences = []
    for sentence in all_sentences:
        count = len(words(sentence))
        if count >= 45:
            long_sentences.append(f"{count} words: {sentence[:180]}")
    if long_sentences:
        severity = "high" if content_format in {"talk", "script"} else "medium"
        add_finding(
            findings,
            "long-sentence",
            severity,
            f"Found {len(long_sentences)} sentence unit(s) with at least 45 words.",
            long_sentences,
        )

    normalized = [word.lower() for word in all_words if len(word) > 2]
    fourgrams = Counter(" ".join(normalized[index : index + 4]) for index in range(max(0, len(normalized) - 3)))
    repeated_phrases = [(phrase, count) for phrase, count in fourgrams.items() if count >= 3]
    repeated_phrases = [item for item in repeated_phrases if len(set(item[0].split())) > 1]
    if repeated_phrases:
        repeated_phrases.sort(key=lambda item: (-item[1], item[0]))
        add_finding(
            findings,
            "repeated-phrase",
            "medium",
            "Repeated four-word phrases may indicate duplicated ideas or templated language.",
            [f"'{phrase}' x{count}" for phrase, count in repeated_phrases[:8]],
        )

    estimated_wpm = 130 if content_format in {"talk", "script"} else 180
    estimated_minutes = word_count / estimated_wpm if estimated_wpm else 0.0
    if target_minutes is not None and target_minutes > 0:
        lower = target_minutes * 0.78
        upper = target_minutes * 0.95
        if estimated_minutes < lower:
            add_finding(
                findings,
                "timing-short",
                "medium",
                f"Estimated spoken time is {estimated_minutes:.1f} minutes at {estimated_wpm} WPM, below the working range for a {target_minutes:g}-minute slot.",
            )
        elif estimated_minutes > upper:
            add_finding(
                findings,
                "timing-long",
                "high",
                f"Estimated spoken time is {estimated_minutes:.1f} minutes at {estimated_wpm} WPM, leaving too little room in a {target_minutes:g}-minute slot.",
            )

    severity_order = {"veto": 0, "high": 1, "medium": 2, "low": 3}
    findings.sort(key=lambda item: (severity_order.get(str(item["severity"]), 9), str(item["code"])))

    return {
        "format": content_format,
        "word_count": word_count,
        "sentence_units": len(all_sentences),
        "estimated_spoken_minutes": round(estimated_minutes, 2),
        "assumed_wpm": estimated_wpm,
        "target_minutes": target_minutes,
        "findings": findings,
        "note": "Mechanical signals only. Diagnose the missing thought, evidence, or format decision before rewriting prose.",
    }


def render_text(report: dict[str, object]) -> str:
    lines = [
        "Content lint",
        f"Format: {report['format']}",
        f"Words: {report['word_count']}",
        f"Estimated spoken time: {report['estimated_spoken_minutes']} minutes at {report['assumed_wpm']} WPM",
    ]
    if report.get("target_minutes") is not None:
        lines.append(f"Target slot: {report['target_minutes']} minutes")
    findings = report["findings"]
    lines.append(f"Findings: {len(findings)}")
    for finding in findings:
        lines.append(f"\n[{str(finding['severity']).upper()}] {finding['code']}: {finding['message']}")
        for example in finding.get("examples", []):
            lines.append(f"  - {example}")
    lines.append(f"\nNote: {report['note']}")
    return "\n".join(lines)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Lint content for mechanical AI-slop signals.")
    parser.add_argument("path", nargs="?", help="UTF-8 text file. Read stdin when omitted.")
    parser.add_argument(
        "--format",
        default="general",
        choices=["general", "blog", "presentation", "talk", "workshop", "script", "website"],
        help="Content format used for timing and severity decisions.",
    )
    parser.add_argument("--target-minutes", type=float, help="Target live or recorded duration.")
    parser.add_argument("--json", action="store_true", help="Emit JSON instead of text.")
    parser.add_argument(
        "--strict",
        action="store_true",
        help="Exit with status 1 when a high or veto finding exists.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        text = read_text(args.path)
    except (OSError, UnicodeError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2

    if not text.strip():
        print("error: input is empty", file=sys.stderr)
        return 2

    report = analyze(text, args.format, args.target_minutes)
    if args.json:
        print(json.dumps(report, indent=2, ensure_ascii=False))
    else:
        print(render_text(report))

    if args.strict and any(
        finding["severity"] in {"veto", "high"} for finding in report["findings"]
    ):
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
