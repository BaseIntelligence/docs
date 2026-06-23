#!/usr/bin/env bash
# qa-all.sh — run every BaseIntelligence docs QA gate in sequence.
# Static gates (forbidden, placeholder) run first (fast, offline-safe), then the
# CLI gates (build, links). Prints a summary and exits non-zero if any gate fails.
set -uo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -a GATES=("qa-forbidden.sh" "qa-placeholder.sh" "qa-build.sh" "qa-links.sh")
declare -a RESULTS=()
OVERALL=0

for g in "${GATES[@]}"; do
  echo ""
  echo "################ $g ################"
  if bash "$DIR/$g"; then
    RESULTS+=("PASS  $g")
  else
    RESULTS+=("FAIL  $g")
    OVERALL=1
  fi
done

echo ""
echo "================ QA SUMMARY ================"
for r in "${RESULTS[@]}"; do echo "  $r"; done
echo "==========================================="
if [ "$OVERALL" -eq 0 ]; then echo "ALL GATES PASSED"; else echo "ONE OR MORE GATES FAILED"; fi
exit "$OVERALL"
