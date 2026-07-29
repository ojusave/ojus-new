#!/bin/sh
set -eu

SKILL_NAME="content-graph-director"
REPOSITORY="ojusave/ojus-new"
REF=${CONTENT_GRAPH_DIRECTOR_REF:-main}
ARCHIVE_URL=${CONTENT_GRAPH_DIRECTOR_ARCHIVE_URL:-"https://codeload.github.com/$REPOSITORY/zip/refs/heads/$REF"}
TMP_ROOT=${TMPDIR:-/tmp}
WORK_DIR="$TMP_ROOT/${SKILL_NAME}.install.$$"
ARCHIVE_PATH="$WORK_DIR/repository.zip"
EXTRACT_DIR="$WORK_DIR/extracted"

cleanup() {
  rm -rf "$WORK_DIR"
}
trap cleanup EXIT HUP INT TERM

fail() {
  printf 'Install failed: %s\n' "$1" >&2
  exit 1
}

download() {
  url=$1
  destination=$2

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url" -o "$destination"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$destination" "$url"
  else
    fail "curl or wget is required"
  fi
}

mkdir -p "$WORK_DIR" "$EXTRACT_DIR"
download "$ARCHIVE_URL" "$ARCHIVE_PATH"

if command -v unzip >/dev/null 2>&1; then
  unzip -q "$ARCHIVE_PATH" -d "$EXTRACT_DIR"
elif command -v python3 >/dev/null 2>&1; then
  python3 -m zipfile -e "$ARCHIVE_PATH" "$EXTRACT_DIR"
else
  fail "unzip or python3 is required"
fi

SKILL_FILE=$(find "$EXTRACT_DIR" -type f -path "*/skills/$SKILL_NAME/SKILL.md" -print | head -n 1)
[ -n "$SKILL_FILE" ] || fail "the repository archive does not contain skills/$SKILL_NAME/SKILL.md"
SKILL_ROOT=${SKILL_FILE%/SKILL.md}

for required in \
  "SKILL.md" \
  "references/core-graph.md" \
  "references/operations-and-delivery.md" \
  "references/regression-scenarios.md" \
  "scripts/install.sh" \
  "scripts/validate_content_graph.py"
do
  [ -f "$SKILL_ROOT/$required" ] || fail "the downloaded skill is missing $required"
done

grep -Eq '^name:[[:space:]]*content-graph-director[[:space:]]*$' "$SKILL_FILE" \
  || fail "the downloaded SKILL.md failed validation"

sh "$SKILL_ROOT/scripts/install.sh" "$@"
