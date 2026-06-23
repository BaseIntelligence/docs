#!/usr/bin/env bash
# qa-placeholder.sh — placeholder/incomplete-content gate for BaseIntelligence docs.
# Scans the docs tree (excluding .git, node_modules, scripts/, and the meta
# working-note files in QA_META_EXCLUDES — see _lib.sh) for placeholders:
#   - TODO / FIXME / lorem (case-insensitive)
# The single approved marker token `unverified` is ALLOWED and never reported.
# Idempotent + safe to re-run. Exits 0 on PASS, non-zero on disallowed placeholders.
set -uo pipefail

# shellcheck source=_lib.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/_lib.sh"

SCAN_ROOT="${1:-$DOCS_ROOT}"

# Disallowed placeholder tokens (extended regex, case-insensitive).
PLACEHOLDERS='TODO|FIXME|lorem'
# Approved marker token (explicitly allowed). Lines that match a placeholder are
# kept regardless; `unverified` is simply NOT in the disallowed set above.
ALLOWED_MARKER='unverified'

echo "== qa-placeholder: placeholder scan =="
echo "scan root: $SCAN_ROOT"
echo "allowed marker (not flagged): ${ALLOWED_MARKER}"

MATCHES="$(grep -rnIE -i \
  --exclude-dir=.git \
  --exclude-dir=node_modules \
  --exclude-dir=scripts \
  "${QA_META_EXCLUDES[@]}" \
  "$PLACEHOLDERS" "$SCAN_ROOT" 2>/dev/null || true)"

if [ -n "$MATCHES" ]; then
  echo "----- placeholders found -----"
  printf '%s\n' "$MATCHES"
  echo "------------------------------"
  COUNT="$(printf '%s\n' "$MATCHES" | grep -c '')"
  qa_fail "$COUNT disallowed placeholder(s) found"
  exit 1
fi

qa_pass "no disallowed placeholders ('${ALLOWED_MARKER}' marker is allowed)"
exit 0
