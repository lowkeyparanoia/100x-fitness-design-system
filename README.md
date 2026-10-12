# 100x Fitness — Design System

**100x Fitness** is a consumer fitness and recovery app from 100x Longevity (Bengaluru). It reads a member's wearable data from Health Connect and Apple Health and does five things with it:

- Glanceable daily metrics.
- Booking of on-site recovery sessions at the 100x Lounge (sauna, cold plunge, compression and other therapies).
- Workplace "circles" with effort leaderboards.
- Guided breathwork.
- A guardrailed AI coach, "Ask 100x".

It is a **wellness app, not a medical device**. It does not diagnose, treat or score health.

This repo holds the design-system source that Claude Design (and the Flutter app) build from.

| File | What it is |
|---|---|
| `tokens.css` | **Source of truth.** Colour, type, radius, spacing, elevation and motion tokens. Light and dark. |
| `components.html` | Live specimen of every component, plus five phone screens (Home, Book, Circles, Breathe, Ask 100x). Open it in a browser. |
| `flutter/app_theme.dart` | Flutter `ThemeData` and a `MetricColors` extension mirroring `tokens.css`. |
| `DESIGN.md` | The design rationale: two reference schemes and what we take from each. |
| `brand/` | The 100x mark. |

## Design in one paragraph

Home is a **sky-blue gradient with four saturated hero tiles**: Move (rings), Heart, Sleep (moon) and Breathe (orb). Each tile carries one oversized glyph and three label/value rows. Tapping a tile **zooms** it into a full-bleed detail page in its own colour. Everything else (booking, circles, chat, settings) sits on a **calm lavender-white canvas with soft white cards**. Navigation is a **floating pill tab bar** (Home · Book · Circles · Breathe) with a separate round **+**, which opens a quick-add sheet. One AI voice writes short, plain-language insight cards that cite the member's own data.

## Rules (every screen)

1. **Absent is not zero.** A missing sync shows "—" and a "Why don't I see data?" link, never 0.
2. **Colour never works alone.** Every hue carries a word or icon ("Usual for you", "Below your usual", "Not synced yet").
3. **No composite health scores in v1.** Show values against the member's *own* usual range, not clinical norms or "Recovery %".
4. **Employers see group totals only**, and only for circles of 10 or more opted-in members (configurable; 100x-build used 5). Leaderboards rank *effort* only: steps, active minutes, breathwork minutes, and consistency (days the member hit their own goal). Manually entered records don't count. Nicknames are allowed, and appearing on the board is a separate opt-in from contributing to circle totals.
5. **AI guardrails, visible in the UI:**
   - A permanent "Wellness guidance · not medical advice" line.
   - Emergency phrases switch to a fixed "call 112" card.
   - The AI never diagnoses, never names medicines and never invents a value.
   - Every AI message can be reported in-app.
6. **Consent is per purpose and reversible.** There are three toggles: health data, leaderboards, AI insights. Account deletion is in Settings.
7. **No health values on the lock screen.** Notifications say "Your weekly summary is ready", not numbers.
8. **Accessibility:** 48 dp touch targets, dynamic type to 200 %, light and dark modes, and a reduced-motion fallback for every animation (the zoom becomes a cross-fade; the breath orb becomes a countdown ring).
9. **India context:** ₹, +91 numbers, IST days, Indian names, and "Pay at lounge" until online payment ships.

## Voice

- Plain, warm and specific. Lead with the number, then what's usual for this member.
- **Never use:** diagnose, detect, screen for, treat, cure, reverse, prevent, predict, "monitor your [condition]", "alert you to", "medical-grade".
- Prefer: "usual for you", "below your usual", "you might try", "many people find".

## Components (inventory)

| Component | Flutter mapping |
|---|---|
| Hero tile (Move / Heart / Sleep / Breathe / no-data) | `OpenContainer` (package:animations) + `CustomPainter` glyph |
| Date strip + "Today →" pill | `ListView.builder` horizontal + `ScrollController` snap |
| Metric row (value, status line, sparkline) | `Card` + `fl_chart` `LineChart` (minimal) |
| Stat trio (RESTING / RANGE / HRV) | `Row` of 3 `Expanded` |
| Insight card (AI voice, gradient edge, source line) | `Card` with `ShaderMask` border |
| "Why no data?" row | `ListTile` on amber surface |
| Floating pill nav + FAB | Custom `NavigationBar` in a `Stack` with `BackdropFilter` |
| Quick-add sheet (3×3 actions) | `showModalBottomSheet` + `GridView` |
| Service card, slot grid, booking card | `Card`, `Wrap` of `ChoiceChip`-styled slots (full = disabled + strikethrough) |
| Leaderboard + segmented metric switch | `SegmentedButton` + `ListView` (the "you" row is highlighted) |
| Breath orb + pattern chips | `AnimationController` driven by the pattern; `HapticFeedback` per phase |
| Chat bubbles, data-citation chips, suggestion chips, emergency card | `ListView` + `Chip`s |
| Consent toggle row | `SwitchListTile` |

**Icons:** the specimen uses placeholder glyphs. Use **Material Symbols Rounded** (weight 400, grade 0, filled for the active tab).

**Fonts:** Inter (Google Fonts, OFL) for everything. SF Pro may be used on iOS. Use tabular numerals for every value.

## Inspiration (described here; screenshots are attached separately, not stored in this repo)

- **Trackable** (iOS): home tile grid, per-metric colours, zoom-into-detail motion, date-pill time travel, detail-page anatomy.
- **Bevel** (iOS): light lavender canvas, ring score cards, narrative AI insight cards, metric rows with sparklines, floating pill nav with a separate +, quick-add sheet, dark "what's new" story cards.
