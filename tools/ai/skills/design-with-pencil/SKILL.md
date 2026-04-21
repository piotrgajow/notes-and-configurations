---
name: design-with-pencil
description: Design a screen, page, or overlay in Pencil.dev for any web or mobile project, using the project's own design guidelines and sitemap docs as the sole source of truth for all visual decisions.
argument-hint: [screen name or number, e.g. "dashboard" or "task editor overlay"]
allowed-tools: mcp__pencil__*
---

# Design with Pencil.dev

You are designing screens for a project in Pencil.dev. The user is not a designer —
you drive all visual decisions, deriving every style choice from the project's own
documentation. Consistency across screens is your primary quality goal.

---

## Phase 0 — Project orientation

Before anything else, load the project's design context. Do this once per session;
reuse what you've loaded across phases.

1. **Find the design guidelines** using this ordered fallback:
   1. Check if the current conversation context already references a design
      documentation path or directory. If yes, use that as the source of truth and skip
      the remaining steps.
   2. Otherwise, check whether `docs/design/` or `design/` directories exist. If found,
      look for a guidelines file inside them (e.g. `guidelines.md`, `design-guidelines.md`).
   3. If neither directory exists, ask the user where the design documentation lives. 
      Once the documentation path is confirmed, suggest adding it to CLAUDE.md so it persists across sessions
      (e.g. with "Want me to add this to CLAUDE.md so I don't need to ask next time?").
   4. If the user confirms there is none, **stop here** and suggest running the
      `design-guidelines-create` skill first before designing any screens.

2. **Find the sitemap index** — look for `docs/sitemap/00-index.md`,
   `docs/sitemap/index.md`, or a file listing all screens in the project.

3. **Extract and hold in context** for the rest of this session:
   - Canvas target (viewport size, e.g. 1920×1080 desktop)
   - Color tokens (every named color with its hex value)
   - Type scale (font families, sizes, weights, line heights per role)
   - Spacing scale (base unit and named steps)
   - Border radius values and shadow levels
   - Key component patterns (buttons, inputs, cards, overlays, etc.)
   - Overlay dimensions if specified

---

## Phase 1 — Identify the screen

Map the user's argument to a specific sitemap file. If the sitemap index exists,
use it to find the matching file by name or number.

- If the match is clear: proceed to Phase 2.
- If ambiguous or no argument was given: list the available screens from the index
  and ask the user to pick one before continuing.

Read the target screen's sitemap file in full. Extract:
- Route (page vs overlay)
- Purpose and key content
- User interactions
- Data dependencies (to know what placeholder content to use)
- Any open questions or assumptions already recorded

---

## Phase 2 — Complexity check

Estimate how many `batch_design` calls the screen will need. Use this rubric:

| Level | Indicator | Action |
|---|---|---|
| Simple | ≤2 `batch_design` calls, ≤1 form or short list | Proceed immediately |
| Medium | 2–3 calls, multiple sections or conditional states | State your brief plan, then proceed |
| Complex | >3 calls, many distinct regions or many state variants | Suggest a breakdown into sub-phases; ask the user which to start with |

A good split for complex screens:
1. Page shell, background, header, navigation
2. Primary content region (main list, main form)
3. Secondary panels, sidebars, metadata
4. States and variants (completed, warning, empty state, edit mode)
5. Overlays or modals triggered from this screen

Present the breakdown, confirm with the user, then begin the agreed phase.

---

## Phase 3 — Canvas setup

1. Call `get_editor_state({ include_schema: true })` to read the current canvas state.

2. **If no document is active**: call `open_document("new")` to create a blank canvas.
   Remind the user: "Save this file to your project's `design/` directory so it stays
   with the codebase."

3. Call `get_guidelines({ category: "guide", name: "Web App" })` for Pencil's structural
   layout rules (frame sizes, auto-layout conventions, etc.).

4. **Discover existing components**: call `batch_get` searching for any design system
   frame, component library frame, or reusable component nodes already on the canvas.
   Read their structure before creating anything new — reuse beats recreating.

---

## Phase 4 — Component strategy

Before inserting any element, ask: does a reusable version of this component already
exist on the canvas?

- **If yes**: use `C` (copy) to instantiate it; apply only the necessary property
  overrides. Do not recreate it from scratch.

- **If no**: design it as a proper reusable component the first time, not as an ad-hoc
  shape group. Name it clearly (e.g. `Button/Primary`, `TaskRow/Default`,
  `Badge/Daily`) so it can be found and reused on subsequent screens.

After completing the screen, create or update a `components.md` inventory file in the
same design documentation directory discovered in Phase 0 (e.g. `design/components.md`
or `docs/design/components.md`). For each reusable component: append new entries
(name, one-line description, canvas location) and remove entries for any components
that were deleted. Report the changes to the user — what was added, updated, or removed.
This inventory becomes the component catalogue for all subsequent screens.

**Always prefer generic, reusable components** over screen-specific shapes — even if it
takes one extra step to parameterise them. Consistency compounds: every screen that
reuses a component inherits any future corrections automatically.

---

## Phase 5 — Design execution

Apply tokens from Phase 0 exactly — never approximate. If a token's value is ambiguous,
re-read the guidelines rather than guessing.

**Placeholder content strategy** — before the first `batch_design` call, ask the user:

> "How should I generate placeholder content for this screen?
> (a) realistic dummy data I invent, (b) a specific theme or character set you describe,
> (c) actual data snippets you paste in, or (d) generic labels like 'Item 1 / Item 2'."

Use the user's answer to drive all placeholder text in the subsequent batches.

**Batch strategy** — maximum 25 operations per `batch_design` call:
1. Page shell: background rectangle, max-width container, header region
2. Primary content: the dominant list, form, or content area
3. Secondary content: supporting panels, sidebars, resource links
4. States and variants: hover, completed, warning, empty, edit-mode affordances

After each `batch_design` call:
- Use `get_screenshot` to visually verify the result, or re-read changed nodes with
  `batch_get` to confirm properties were applied correctly.
- Fix any issues before continuing to the next batch.

**Overlay-specific rules** (when the screen's route is "overlay"):
- Center the overlay over a dimmed dashboard background
- Use the shadow level marked "strong" in the guidelines (or the deepest defined level)
- Use the `lg` border radius
- Apply 24px internal padding unless the guidelines specify otherwise
- Use the overlay width from the sitemap file; if not specified, default to 560px

---

## Phase 6 — Consistency check

After completing the screen (or each sub-phase), work through this checklist and report
any failures before declaring the work done:

- [ ] Every font family, size, and weight comes from the project's type scale
- [ ] Every color value comes from the project's token list (exact hex, no approximations)
- [ ] All spacing values follow the project's base unit scale
- [ ] Cards and overlays use the defined shadow level and border radius
- [ ] All interactive component states the sitemap describes are present (hover, active,
      completed, warning, error, disabled)
- [ ] The primary action is visually dominant; destructive actions use the error color
- [ ] An empty state is shown (what the screen looks like with no data loaded)
- [ ] Reusable components were used or created; no ad-hoc one-off shapes for repeated
      patterns

If any item fails, fix it in the same session before wrapping up.

---

## Guardrails

- **Never invent a style** not present in the loaded guidelines — if uncertain, re-read
  the guidelines rather than guessing
- **Do not design for unspecified platforms** — if the guidelines say "desktop only",
  do not produce mobile layouts
- **Do not design screens not in the sitemap** — if the user asks for something not
  listed, suggest adding it to the sitemap first, then come back to design it
- **One screen at a time** — if the user asks for multiple screens in one request,
  complete Phase 6 for the first screen before starting the next
- **If the guidelines file is missing or incomplete**, stop and ask the user to provide
  it rather than making up a design system
