#!/usr/bin/env bash
# qa-build.sh — Mintlify build/schema gate for BASE docs.
# Runs `mint validate` (strict: exits non-zero on warnings/errors). Installs the
# CLI via `npm i -g mint`, or falls back to `npx mint`, if not present.
# Idempotent + safe to re-run. Exits 0 on PASS, non-zero on FAIL.
set -uo pipefail

# shellcheck source=_lib.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/_lib.sh"

echo "== qa-build: Mintlify schema/build validation =="
echo "docs root: $DOCS_ROOT"

MINT="$(qa_resolve_mint)" || {
  qa_fail "could not resolve or install a Mintlify CLI (mint/mintlify/npx all unavailable)"
  exit 2
}
echo "using CLI: $MINT"

cd "$DOCS_ROOT" || { qa_fail "cannot cd to docs root"; exit 2; }

# `mint validate` is the strict build check on the modern CLI.
# Legacy `mintlify` had no `validate`; fall back to `broken-links` which also
# parses docs.json + every page and surfaces schema errors.
OUT=""
RC=0
if echo "$MINT" | grep -qw "mintlify" && ! echo "$MINT" | grep -q "mint@"; then
  OUT="$($MINT broken-links 2>&1)"; RC=$?
else
  OUT="$($MINT validate 2>&1)"; RC=$?
  # Older `mint` builds may not have `validate`; fall back gracefully.
  if echo "$OUT" | grep -qiE "unknown (argument|command)|not a (valid )?command"; then
    echo "note: 'validate' unsupported by this CLI build; falling back to 'broken-links'"
    OUT="$($MINT broken-links 2>&1)"; RC=$?
  fi
fi

echo "----- CLI output -----"
echo "$OUT"
echo "----------------------"

if [ "$RC" -eq 0 ]; then
  qa_pass "Mintlify build/schema validation succeeded"
  exit 0
else
  qa_fail "Mintlify build/schema validation failed (exit $RC)"
  exit 1
fi
