# shellcheck shell=bash
# _lib.sh — shared helpers for BASE docs QA gates.
# Sourced by qa-*.sh. Not executable on its own.

# Resolve the docs repo root = the parent dir of this scripts/ dir.
_qa_script_dir() {
  cd "$(dirname "${BASH_SOURCE[0]}")" && pwd
}
SCRIPTS_DIR="$(_qa_script_dir)"
DOCS_ROOT="$(cd "$SCRIPTS_DIR/.." && pwd)"

# Resolve a runnable Mintlify CLI. Modern CLI = `mint`, legacy = `mintlify`.
# Prints the command prefix to stdout (e.g. "mint", "mintlify", "npx -y mint@latest").
# Returns 1 if none could be resolved/installed.
qa_resolve_mint() {
  if command -v mint >/dev/null 2>&1; then echo "mint"; return 0; fi
  if command -v mintlify >/dev/null 2>&1; then echo "mintlify"; return 0; fi
  # Try a global install (best effort, non-fatal).
  if command -v npm >/dev/null 2>&1; then
    if npm i -g mint >/dev/null 2>&1 && command -v mint >/dev/null 2>&1; then
      echo "mint"; return 0
    fi
  fi
  # Fall back to npx (downloads on demand, cached afterwards).
  if command -v npx >/dev/null 2>&1; then echo "npx -y mint@latest"; return 0; fi
  return 1
}

qa_pass() { echo "PASS: $1"; }
qa_fail() { echo "FAIL: $1" >&2; }

# Internal/meta working-note files: NOT published doc pages. They intentionally
# name banned tokens to document the bans, so the content-scanning gates
# (qa-forbidden, qa-placeholder) skip them. Real content (*.mdx/*.mdc, docs.json)
# is always scanned. grep --exclude matches on basename, so paths are irrelevant.
QA_META_EXCLUDES=(
  "--exclude=SOURCES.md"
  "--exclude=NAV-SLUG-MAP.md"
  "--exclude=CONTRIBUTING-DOCS.md"
  "--exclude=OG-NOTES.md"
)
