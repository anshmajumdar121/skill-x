#!/usr/bin/env bash
# Lint every skill in skills/ using the mavis skill linter.
# This is a CI-friendly equivalent of `mavis skill lint <skill>`.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$REPO_ROOT/skills"

# Locate the mavis skill linter.
if command -v mavis &> /dev/null; then
  LINT_PATH="$(mavis skill show skill-creator 2>/dev/null | python3 -c 'import json,sys;print(json.load(sys.stdin)["location"])' 2>/dev/null | xargs dirname)/scripts/lint-skill.js"
  if [ -z "$LINT_PATH" ] || [ ! -f "$LINT_PATH" ]; then
    LINT_PATH=""
  fi
fi

if [ -z "$LINT_PATH" ]; then
  echo "ERROR: mavis skill linter not found."
  echo "Install mavis (https://github.com/<your-org>/mavis) and ensure 'mavis skill show skill-creator' works."
  exit 1
fi

echo "Linting skills in: $SKILLS_DIR"
echo "Linter: $LINT_PATH"
echo ""

fail_count=0
for skill_dir in "$SKILLS_DIR"/*/; do
  skill_name="$(basename "$skill_dir")"
  echo "--- $skill_name ---"
  if node "$LINT_PATH" "$skill_dir"; then
    echo "OK: $skill_name"
  else
    echo "FAIL: $skill_name"
    fail_count=$((fail_count + 1))
  fi
  echo ""
done

if [ "$fail_count" -eq 0 ]; then
  echo "All skills passed lint."
  exit 0
else
  echo "$fail_count skill(s) failed lint."
  exit 1
fi
