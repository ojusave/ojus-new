#!/bin/sh
set -eu

REPOSITORY="ojusave/ojus-new"
REMOTE_URL="https://github.com/$REPOSITORY.git"

fail() {
  printf 'Publish failed: %s\n' "$1" >&2
  exit 1
}

command -v gh >/dev/null 2>&1 || fail "GitHub CLI is required: https://cli.github.com/"
gh auth status >/dev/null 2>&1 || fail "authenticate first with: gh auth login"

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || fail "run this from the repository checkout"
[ -z "$(git status --porcelain)" ] || fail "commit or discard local changes before publishing"

gh repo view "$REPOSITORY" >/dev/null 2>&1 || fail "repository is not accessible: $REPOSITORY"

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REMOTE_URL"
else
  git remote add origin "$REMOTE_URL"
fi

git push -u origin main

gh repo view "$REPOSITORY" --web=false >/dev/null
printf 'Published: https://github.com/%s\n' "$REPOSITORY"
