#!/bin/sh
set -eu

SKILL_NAME="content-graph-director"
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
SKILL_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd -P)
TARGET_MODE="all"
SCOPE="user"
PROJECT_ROOT=""

usage() {
  cat <<'USAGE'
Install Content Graph Director as an Agent Skill.

Usage:
  sh scripts/install.sh [--all | --codex | --cursor] [--user | --project PATH]

Defaults:
  --all --user

Global locations:
  Codex:  ~/.agents/skills/content-graph-director
  Cursor: ~/.cursor/skills/content-graph-director

Project locations:
  Codex:  <project>/.agents/skills/content-graph-director
  Cursor: <project>/.cursor/skills/content-graph-director

Existing installations are moved to timestamped backup folders before replacement.
USAGE
}

fail() {
  printf 'Install failed: %s\n' "$1" >&2
  exit 1
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --all)
      TARGET_MODE="all"
      ;;
    --codex)
      TARGET_MODE="codex"
      ;;
    --cursor)
      TARGET_MODE="cursor"
      ;;
    --user)
      SCOPE="user"
      PROJECT_ROOT=""
      ;;
    --project)
      shift
      [ "$#" -gt 0 ] || fail "--project requires a path"
      SCOPE="project"
      PROJECT_ROOT="$1"
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      fail "unknown option: $1"
      ;;
  esac
  shift
done

[ -f "$SKILL_ROOT/SKILL.md" ] || fail "SKILL.md was not found beside the installer"
grep -Eq '^name:[[:space:]]*content-graph-director[[:space:]]*$' "$SKILL_ROOT/SKILL.md" \
  || fail "SKILL.md does not declare name: content-graph-director"

if [ "$SCOPE" = "project" ]; then
  [ -d "$PROJECT_ROOT" ] || fail "project path does not exist: $PROJECT_ROOT"
  PROJECT_ROOT=$(CDPATH= cd -- "$PROJECT_ROOT" && pwd -P)
  CODEX_BASE="$PROJECT_ROOT/.agents/skills"
  CURSOR_BASE="$PROJECT_ROOT/.cursor/skills"
else
  [ -n "${HOME:-}" ] || fail "HOME is not set"
  CODEX_BASE="$HOME/.agents/skills"
  CURSOR_BASE="$HOME/.cursor/skills"
fi

TIMESTAMP=$(date +%Y%m%d%H%M%S)
INSTALLED_PATHS=""

install_copy() {
  base="$1"
  label="$2"
  target="$base/$SKILL_NAME"

  mkdir -p "$base"

  if [ -d "$target" ]; then
    target_real=$(CDPATH= cd -- "$target" && pwd -P)
    if [ "$target_real" = "$SKILL_ROOT" ]; then
      printf '%s already points to the source skill: %s\n' "$label" "$target"
      INSTALLED_PATHS="${INSTALLED_PATHS}\n- $target"
      return 0
    fi
  fi

  temp="$base/.${SKILL_NAME}.install.$$"
  backup=""
  rm -rf "$temp"
  cp -R "$SKILL_ROOT" "$temp"

  [ -f "$temp/SKILL.md" ] || {
    rm -rf "$temp"
    fail "copy verification failed for $label"
  }

  if [ -e "$target" ] || [ -L "$target" ]; then
    backup="${target}.backup-${TIMESTAMP}"
    if [ -e "$backup" ] || [ -L "$backup" ]; then
      backup="${backup}-$$"
    fi
    mv "$target" "$backup"
  fi

  if ! mv "$temp" "$target"; then
    rm -rf "$temp"
    if [ -n "$backup" ] && { [ -e "$backup" ] || [ -L "$backup" ]; }; then
      mv "$backup" "$target" || true
    fi
    fail "could not activate the $label installation"
  fi

  chmod u+x "$target/scripts/content_lint.py" 2>/dev/null || true
  chmod u+x "$target/scripts/install.sh" 2>/dev/null || true

  grep -Eq '^name:[[:space:]]*content-graph-director[[:space:]]*$' "$target/SKILL.md" \
    || fail "installed SKILL.md failed validation at $target"

  printf 'Installed for %s: %s\n' "$label" "$target"
  if [ -n "$backup" ]; then
    printf 'Previous copy backed up to: %s\n' "$backup"
  fi
  INSTALLED_PATHS="${INSTALLED_PATHS}\n- $target"
}

case "$TARGET_MODE" in
  all)
    install_copy "$CODEX_BASE" "Codex"
    install_copy "$CURSOR_BASE" "Cursor"
    ;;
  codex)
    install_copy "$CODEX_BASE" "Codex"
    ;;
  cursor)
    install_copy "$CURSOR_BASE" "Cursor"
    ;;
esac

printf '\nInstallation complete. Start a new Codex or Cursor chat so it reloads the skill catalog.\n'
printf 'Invoke it as $content-graph-director in Codex or /content-graph-director in Cursor.\n'
