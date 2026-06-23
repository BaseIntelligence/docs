# OG / Social Card — Notes (Task T4)

Asset: `/images/og.png` (repo path `images/og.png`) — the Open Graph / social
card for the BASE Mintlify docs site. Wired by T2 in `docs.json`.

## Image specs
- **Dimensions:** 1200 × 630 px (standard Open Graph 1.91:1).
- **Format:** PNG, 8-bit RGB, non-interlaced (~105 KB).
- **Render pipeline:** authored with Pillow at 2× supersample (2400×1260) then
  Lanczos-downscaled to 1200×630 for crisp anti-aliased edges.

## Colors (from platform-network design system)
Sourced from `frontend/src/app/globals.css` + `frontend/tailwind.config.ts`:
- **Brand red (accent):** `#d91f35`  (`--acid`)
- **Background:** `#000`  (`--bg`)
- **Foreground text:** `#fff`  (`--fg`)
- Muted text uses white at ~58% / lower alpha (`--muted` = `rgba(255,255,255,0.58)`).
- Rail hairlines / corner ticks use `rgba(255,255,255,0.14)` (`--line`).
- (Brand `--success` `#b2ff22` intentionally NOT used on the card — red-on-black
  is the primary identity; lime is a status accent only.)

## Tagline text used
> **A Bittensor subnet for decentralized AI research.**

Eyebrow label (mono): `BITTENSOR SUBNET // NETUID 100`
Sub-label: `decentralized collaborative AI research`
Footer: `BASEINTELLIGENCE` (left) · `subnet 100 // bittensor` (right, red)

Framing is accurate to the project: BASE is a Bittensor subnet (**netuid 100**)
for decentralized collaborative AI research via challenges.

## Brand mark
The geometric BASE mark (two stacked horizontal hexagons + a diamond) is taken
from `frontend/public/logo.png` and **recolored from its native `#f90324` red to
the design-system brand red `#d91f35`** (per-pixel lerp red↔white preserving the
white shapes and anti-aliased edges). It appears twice:
1. a crisp 104px tile top-left, and
2. a large low-opacity "ghost" mark bleeding off the right edge for atmosphere.

## Fonts — Google Fonts confirmation (for T2 wiring)
Both typefaces are available on Google Fonts. Confirmed by successfully fetching
the Google Fonts CSS2 API (`https://fonts.googleapis.com/css2?family=...`) for
each and finding the canonical `font-family` declarations and `.ttf` URLs on
`fonts.gstatic.com`:

| Role | **Exact Google Fonts family name** | Weights available / used |
|------|------------------------------------|--------------------------|
| Body | **`Rethink Sans`** | 400, 500, 600, 700 (+800 var.); card uses 500 / ExtraBold |
| Mono | **`Space Mono`** | 400, 700; card uses both |

T2 should wire these **exact** family names (`Rethink Sans`, `Space Mono`).
This matches the existing platform-network usage in `globals.css` line 2:
`family=Rethink+Sans:wght@400;500;600;700&family=Space+Mono:wght@400;700`.

> NOTE: The card uses ONLY these two Google Fonts. It does **not** reference the
> paid serif font / Typekit kit listed in `globals.css` line 1 (which is
> explicitly forbidden for this docs project per `CONTRIBUTING-DOCS.md`).

## Verification
- `file og.png` → `PNG image data, 1200 x 630, 8-bit/color RGB`.
- `Image.open(...).size` → `(1200, 630)`.
- Evidence: `/root/.omo/evidence/task-4-og.txt`, `/root/.omo/evidence/task-4-fonts.txt`.
