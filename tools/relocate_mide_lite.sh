#!/usr/bin/env bash
set -euo pipefail

DRY_RUN="${DRY_RUN:-1}"
BACKUP_EXT=".bak_mide"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

cd "$ROOT"

# Target text file globs (adjust if needed)
GLOBS=( "*.md" "*.yaml" "*.yml" )

# Replacements (ordered; most specific first)
declare -a FROM=(
  "content/contracts/"
  "content/rules/"
  "content/workflows/"
  "content/agents/"
  "content/"
)
declare -a TO=(
  ".mide-lite/contracts/"
  ".mide-lite/rules/"
  ".mide-lite/workflows/"
  ".mide-lite/agents/"
  ".mide-lite/"
)

# List candidate files
mapfile -t FILES < <(git ls-files -- "${GLOBS[@]}")

# Dry-run preview
if [[ "$DRY_RUN" != "0" ]]; then
  echo "Dry run. Set DRY_RUN=0 to apply changes."
  for f in "${FILES[@]}"; do
    for i in "${!FROM[@]}"; do
      if grep -q "${FROM[$i]}" "$f"; then
        echo "Would update: $f : ${FROM[$i]} -> ${TO[$i]}"
      fi
    done
  done
  exit 0
fi

# Apply replacements with backups
for f in "${FILES[@]}"; do
  updated=0
  for i in "${!FROM[@]}"; do
    if grep -q "${FROM[$i]}" "$f"; then
      [[ "$updated" -eq 0 ]] && cp -n "$f" "$f$BACKUP_EXT" || true
      sed -i "s|${FROM[$i]}|${TO[$i]}|g" "$f"
      updated=1
    fi
  done
done

echo "Done. Backups created with suffix $BACKUP_EXT. Review and remove when satisfied."


