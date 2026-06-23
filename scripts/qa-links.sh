#!/usr/bin/env bash
# qa-links.sh — broken internal link gate for BaseIntelligence docs.
# Runs `mint broken-links` (legacy: `mintlify broken-links`).
# Idempotent + safe to re-run. Exits 0 on PASS, non-zero if broken links found.
set -uo pipefail

# shellcheck source=_lib.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/_lib.sh"

echo "== qa-links: Mintlify broken-links check =="
echo "docs root: $DOCS_ROOT"

MINT="$(qa_resolve_mint)" || {
  qa_fail "could not resolve or install a Mintlify CLI (mint/mintlify/npx all unavailable)"
  exit 2
}
echo "using CLI: $MINT"

cd "$DOCS_ROOT" || { qa_fail "cannot cd to docs root"; exit 2; }

OUT="$($MINT broken-links 2>&1)"; RC=$?

echo "----- CLI output -----"
echo "$OUT"
echo "----------------------"

# The CLI exits non-zero when broken links exist. Belt-and-suspenders: also fail
# if the output reports broken links on a 0 exit — but do NOT match the success
# line "no broken links found" (filter out any "no broken link" phrasing first).
if [ "$RC" -ne 0 ] || { echo "$OUT" | grep -i "broken link" | grep -qvi "no broken link"; }; then
  qa_fail "broken internal links detected"
  exit 1
fi

qa_pass "no broken internal links"
exit 0
