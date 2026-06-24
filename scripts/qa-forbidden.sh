#!/usr/bin/env bash
# qa-forbidden.sh — forbidden-string gate for BASE docs.
# Scans the docs tree (excluding .git, node_modules, scripts/, and the meta
# working-note files in QA_META_EXCLUDES — see _lib.sh) for:
#   - PlatformNetwork (forbidden non-BASE source/org)
#   - starter-kit greens 16a34a / 07c983 / 15803d (case-insensitive)
#   - paid font argent-pixel / pjc8nxd
#   - old/non-BASE org URLs (github.com/PlatformNetwork, github.com/mintlify)
# The success green #b2ff22 is WHITELISTED and is NEVER reported.
# Idempotent + safe to re-run. Exits 0 on PASS, non-zero if any forbidden string found.
set -uo pipefail

# shellcheck source=_lib.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/_lib.sh"

# Optional override of scan root (used by the fixture test). Defaults to docs root.
SCAN_ROOT="${1:-$DOCS_ROOT}"

# WHITELIST: the approved BASE success green. Must NEVER be flagged.
WHITELIST_GREEN="b2ff22"

# Forbidden patterns (extended regex, case-insensitive). NOTE: none of these
# match the whitelisted green b2ff22, so it is structurally safe; we additionally
# strip any accidental whitelist-only hit below as belt-and-suspenders.
FORBIDDEN='PlatformNetwork|16a34a|07c983|15803d|argent-pixel|pjc8nxd|github\.com/PlatformNetwork|github\.com/mintlify'

echo "== qa-forbidden: forbidden-string scan =="
echo "scan root: $SCAN_ROOT"
echo "whitelisted (allowed): #${WHITELIST_GREEN}"

# grep -rnIE: recursive, line numbers, skip binary, extended regex, case-insensitive.
# Exclude VCS, deps, and this scripts/ dir.
MATCHES="$(grep -rnIE -i \
  --exclude-dir=.git \
  --exclude-dir=node_modules \
  --exclude-dir=scripts \
  "${QA_META_EXCLUDES[@]}" \
  "$FORBIDDEN" "$SCAN_ROOT" 2>/dev/null || true)"

# Belt-and-suspenders: drop any match whose ONLY forbidden token is the
# whitelisted green (it cannot match $FORBIDDEN, but we guard explicitly).
# We remove lines that match the whitelist AND do not match $FORBIDDEN.
if [ -n "$MATCHES" ]; then
  MATCHES="$(printf '%s\n' "$MATCHES" | grep -E -i "$FORBIDDEN" || true)"
fi

if [ -n "$MATCHES" ]; then
  echo "----- forbidden strings found -----"
  printf '%s\n' "$MATCHES"
  echo "-----------------------------------"
  COUNT="$(printf '%s\n' "$MATCHES" | grep -c '' )"
  qa_fail "$COUNT forbidden-string occurrence(s) found"
  exit 1
fi

qa_pass "no forbidden strings (success green #${WHITELIST_GREEN} is allowed)"
exit 0
