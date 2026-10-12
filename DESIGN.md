# 100x Fitness — design.md (brief)

Two reference schemes, split and recombined for a non-clinical fitness app built in Flutter: Android first, iOS second.
Frames are in `design/frames/`. The curated set for Claude Design is `design/frames/key/` (17 frames, kept in the private app folder and not published here).

| Source | Frames | What it is |
|---|---|---|
| **Trackable**, 17 s screen recording | `design/frames/trackable/` (10) | Glanceable hero-tile dashboard. Each tile zooms into a full-bleed detail page. |
| **Bevel**, 75 s screen recording | `design/frames/bevel/` (50) | Calm, light dashboard with AI narrative insight cards, metric lists, journal, quick-add sheet and "what's new" stories. |

`bevel/_not-app/` holds 9 frames of the design-gallery website the Bevel recording was captured from. They are not app UI; ignore them.

---

## Scheme A — Trackable: "one glance, one glyph"

- **Canvas.** A full-screen sky-blue vertical gradient, deeper blue at the top and lighter at the bottom. No cards on white.
- **Identity.** A centred avatar with a name pill ("Raffi ›") at the top. This is the only chrome. There is no tab bar.
- **2×2 hero tiles**, about 28 px radius, each a solid saturated colour with one oversized glyph:
  - **Activity:** black tile, Apple-style triple rings.
  - **Heart:** red tile, a white 3-D heart with "51 avg.".
  - **Sleep:** violet tile, a moon texture with "83 Good".
  - **Steps:** slate tile, a gauge arc reading "15.4k".
- **Under each glyph**, three label/value rows: muted label on the left, value on the right, units smaller and lighter ("6 h 28 m", "38–96 bpm").
- **Time travel.** A "Today →" pill plus a horizontally scrolling **date-pill strip** at the bottom. The selected day is a raised white pill. Past days with no data show "No Data" in the glyph (`key/trackable-05`).
- **Motion.** Tap a tile and it **zooms (container transform)** into a full-bleed page in the tile's colour. The reverse animation scales the page back into its tile (`key/trackable-04`).
- **Detail page anatomy** (`key/trackable-02`, `-03`):
  1. Top segmented text tabs (Activity · **Heart** · Sleep · Steps), scrollable.
  2. Week strip of mini glyphs with values per day.
  3. Big hero glyph.
  4. Three-stat row with caps labels (RESTING / RANGE / HRV).
  5. Date heading with an ⓘ.
  6. White chart card: a 24 h axis with moon and sun markers.
  7. Floating back button and "Today →" pill.
  8. History section below.
- **Type.** SF-Pro-style rounded sans with very large, light numerals in the glyphs and tabular digits in the rows.

## Scheme B — Bevel: "calm data, narrated"

- **Canvas.** Off-white with a faint lavender tint. White cards with soft shadows and about 20 px radius.
- **Header.** A large date title with a chevron ("Today, February 18 ⌄") and the avatar top-right. Status chips sit below it (Active · weather). An amber **"Why do I have no data? →"** row appears when sync is missing (`key/bevel-01`).
- **Score card.** Three ring gauges side by side (Strain · Recovery · Sleep), with "–%" shown when there is no data (`key/bevel-02`).
- **Narrative insight card.** An emoji, a bold title ("Productive Monday Rebound") and 3–4 lines of plain-language summary. It has a faint rainbow-gradient border, an expand icon and a "✦ View insights →" row. This is the AI's voice.
- **Metric list** (`key/bevel-04`): an icon and label, a big value with a small unit, a green "✓ Normal range" line, and a sparkline on the right with an end dot. Each row opens a detail page.
- **Hero detail** (`key/bevel-03`): a scenic photo background (sky, snow), a big centred ring ("61 % Recovered"), two stat tiles, an insight card and a timeline.
- **Navigation.** A **floating pill tab bar** (Home · Journal · Fitness · Biology) with a separate round **+** button. The + opens a **quick-add sheet**, a 3×3 icon grid (`key/bevel-09`) whose centre item is "Ask Bevel", the AI entry point.
- **Journal** (`key/bevel-07`): a week strip and a habit list with ✕ / – / ✓ toggles, split into Daytime and Nighttime.
- **"What's new" stories** (`key/bevel-10`..`12`): dark, immersive, full-bleed cards with a big two-tone title, a product render, body copy, page dots and a "Continue" pill.

---

## The split: what 100x Fitness takes from each

| Surface | Take from | Notes |
|---|---|---|
| **Home** | **Trackable** tile grid on a 100x-blue gradient | Tiles: **Move** (steps, active minutes, workouts), **Heart** (resting HR, HRV, range), **Sleep** (asleep, in bed, consistency), **Breathe** (minutes today, streak). Below them: a "Next session" booking card and a "Your circle" rank strip. |
| **Metric detail** | **Trackable** zoom and tabs, with **Bevel** metric rows | Week strip, hero, 3 stats, chart card. Ranges are the member's own baseline ("usual for you"), not clinical norms. |
| **AI insight + chat** | **Bevel** narrative card and "Ask" entry in the quick-add sheet | A guardrailed, non-clinical voice. The chat opens full-screen from the + sheet and from "View insights". |
| **Navigation** | **Bevel** floating pill + FAB | Tabs: **Home · Book · Circles · Breathe**. + opens: Book a session · Start breathwork · Ask 100x · Log workout · Invite to circle · Connect wearable. |
| **Booking** | Neither reference has one; build it in **Bevel's** light card language | Flow: location → service → day strip (Trackable date pills) → time-slot chips → confirm sheet → booking card with reminders. |
| **Circles / leaderboard** | **Bevel** list rows with Trackable glyph accents | Effort metrics only (steps, active minutes, breathwork minutes). Rank rows: avatar or nickname, value, sparkline. |
| **Breathwork** | **Trackable** full-bleed detail with **Bevel** scenic hero | A full-screen calm gradient with a breathing orb that scales on inhale and exhale. Patterns: box 4-4-4-4, 4-7-8, coherent 5.5. Haptics on phase change. |
| **Onboarding / what's new** | **Bevel** dark story cards | Wearable connection, permissions rationale, consent. |
| **Empty / no-sync states** | **Bevel** "Why do I have no data?" row and **Trackable** "No Data" glyph | Absent is never zero. |

## Tokens (starting proposal; the full set is in the design-system repo)

- **Brand:** 100x Blue seed `#2A6FD6` (from 100x-build D1P), with a sky gradient from `#2F6BD0` to `#8EC3F0`.
- **Metric hues** (each always paired with a label, never colour alone):
  - Move: lime/green rings `#7BE03A` / `#2FD15B`.
  - Heart: `#E0243A`.
  - Sleep: violet `#4B16D9`.
  - Steps / Effort: slate `#8C96A8`.
  - Breathe: teal `#14B8A6`.
- **Neutrals:** canvas `#F6F5FB` (Bevel lavender-white), card `#FFFFFF`, ink `#14152A`, muted `#6B6F86`. Dark mode is a near-black canvas `#0B0C14` with tiles kept saturated.
- **Not used:** the old 100x gold `#C68B3D` (excluded by the 100x Redesign brief).
- **Type:** Inter for UI (SF Pro on iOS). Large numerals use weight 300–400 with `fontFeatures: tabular`. Units are about 55 % of the numeral size, in the muted colour.
- **Shape:** hero tiles 28 radius, cards 20, pills and chips fully rounded, bottom sheets 28 on top.
- **Spacing:** 4-pt grid; 16 screen gutter; 12 between tiles.
- **Motion:** container transform 350 ms with emphasized easing; the breath orb follows the pattern timing. Every animation has a reduced-motion fallback (cross-fade).
- **Flutter mapping:**
  - Tile zoom: `OpenContainer` (animations pkg).
  - Rings, heart, moon and gauge: `CustomPainter`.
  - Charts: `fl_chart`.
  - Floating pill nav: a custom `NavigationBar` in a `Stack`.

## Rules carried over from the 100x Redesign brief (apply to every screen)

1. Absent is not zero. A missing sync is a gap with a "Why no data?" link.
2. Colour always comes with a word or icon.
3. No health values in notifications on the lock screen.
4. Employer and corporate views show **group totals only**, for groups of 10 or more opted-in members (100x-build used 5; the legal brief recommends 10).
5. The AI never diagnoses, never invents a value and never sets a plan. It cites the member's own data.
6. Touch targets are at least 48 dp. Light and dark modes. Reduced-motion fallbacks.
7. India context: ₹, Indian phone numbers, IST days.

## Open design decisions

- **Composite scores.** Both references lead with scores (Trackable "83 Good", Bevel "61 % Recovered"). The 100x brief bans scores in the clinical app. **Recommendation:** v1 shows values against the member's own baseline and no computed "Recovery %". This avoids an implied health assessment, and leaves no unvalidated algorithm to build or defend.
- **The name "Circles".** The 100x-build glossary bans the word (user-journeys.md:138). That ban was written for the clinical app, so this standalone app can choose its own term.
