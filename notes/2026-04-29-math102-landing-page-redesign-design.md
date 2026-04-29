# MATH102 Landing Page Redesign Design

## Goal

Redesign the landing page as a static, branded course homepage for MATH102 that reflects KFUPM university branding and the College of Computing and Mathematics identity while remaining simple, minimalistic, and easy to maintain.

The landing page should:

- prioritize the course identity first
- present clear and inviting chapter links as the main action
- include stable course information that is reusable across terms
- avoid term-specific wording such as a semester label in the hero
- remain a hand-maintained static file rather than being regenerated on every export

## Inputs And Constraints

### Branding inputs

Brand assets and references are available under `D:\Dropbox\KFUPMWork\Brand`.

Relevant brand signals gathered from the provided material:

- KFUPM Green: `#008540`
- KFUPM Gold: `#DAC961`
- KFUPM Petrol: `#003E51`
- KFUPM Forest: `#00573F`
- KFUPM Light Gray: `#D9DAE4`
- KFUPM Dark Gray: `#373938`
- College of Computing and Mathematics color: `#97A5B9`

Available identity assets include:

- KFUPM main logos
- KFUPM secondary logos
- KFUPM seal

### Course content inputs

Course information is drawn from `refs/math102-252.pdf`, but the landing page should only use course-level content that remains valid across terms where practical.

Stable content selected for the landing page:

- course title: `MATH102: Calculus II`
- prerequisite: `MATH101`
- credit hours: `4-0-4`
- textbook
- learning outcomes
- grading policy structure
- chapter navigation for chapters `5`, `7`, `8`, and `9`

### Explicit user decisions

- landing page should be static
- chapter links should be visually clear and inviting
- page should use the KFUPM logo only in the header
- external links should live in a quiet footer
- the page should not mention a specific academic term

## Recommended Direction

Use the `Academic Card` direction.

This approach centers a single composed course card on a subtle branded background. It is formal enough for an official academic page, minimal enough to avoid clutter, and flexible enough to support future term reuse with limited edits.

Alternative directions were considered:

- `Split Hero`: visually stronger but heavier than needed
- `Department Bulletin`: elegant but too document-like for a notes landing page

`Academic Card` is the best balance between institutional tone, readability, and maintainability.

## Page Structure

The page will be a single static HTML page located at `docs/index.html`.

### 1. Header

The top of the card contains:

- KFUPM logo
- course title: `MATH102: Calculus II`
- short metadata line with:
  - `Department of Mathematics`
  - `College of Computing and Mathematics`
  - `Prerequisite: MATH101`
  - `Credit Hours: 4-0-4`

The header should communicate official institutional identity without overpowering the course itself.

### 2. Chapter Navigation

This is the primary action area and should appear immediately below the header.

It contains inviting, prominent chapter links for:

- Chapter 5
- Chapter 7
- Chapter 8
- Chapter 9

Each link should read more like a navigational card than a plain text hyperlink. The treatment should remain minimal but should still feel clickable and important.

### 3. Textbook Section

This section includes:

- textbook image from `imgs/`
- textbook title, authors, and edition

This should be a balanced two-column or responsive stacked layout depending on width. The image should add visual warmth without dominating the page.

### 4. Learning Outcomes

This section presents the selected course learning outcomes in a clean numbered list.

The list should be readable and well spaced, without becoming visually dense.

### 5. Grading Policy

This section provides a concise but concrete grading summary. It should communicate the grading structure clearly without pulling in term-specific exam dates or room assignments.

Planned items:

- Exam I: `23.33%` or `70/300`
- Exam II: `23.33%` or `70/300`
- Final Exam: `33.34%` or `100/300`
- Lab Python: `10%` or `30/300`
- Class Work: `10%` or `30/300`

The section should also explain the classwork normalization rule from the syllabus in a readable way.

The formula to show is:

```text
y = 3 * (median(Exam I %) + median(Exam II %)) / 20
```

and the page should explain that the section classwork average out of `30` is expected to stay within:

```text
[y - 1, y + 1]
```

The formula should not be dropped or hidden, because it is part of how the course grading policy is actually communicated.

The page should also include one small worked example in plain language. For example:

- if the median of Exam I is `72%`
- and the median of Exam II is `68%`
- then:

```text
y = 3 * (72 + 68) / 20 = 21
```

so the classwork average should lie in the interval:

```text
[20, 22]
```

This example should be presented as an illustration, not as a term-specific policy change.

### 6. Course Description

A short course description appears near the lower portion of the card.

This should summarize the course topics:

- integration
- applications of integration
- improper integrals
- sequences and series
- power series and Taylor/Maclaurin series

### 7. Footer

The footer remains visually quiet and includes external links to:

- instructor website: `https://mshahrani.website/`
- KFUPM: `https://www.kfupm.edu.sa/`
- Department of Mathematics: `https://math.kfupm.edu.sa/`

## Visual System

### Overall tone

The visual language should feel:

- academic
- official
- composed
- minimal

It should not feel corporate-startup, flashy, or overdesigned.

### Color strategy

Use a restrained palette:

- white or off-white base
- soft neutral gray surfaces
- KFUPM Green as the main action color
- KFUPM Petrol for depth and typographic emphasis
- College gray-blue as a subtle secondary accent
- gold only as a very small highlight if needed

The college color should support the layout, not dominate it.

### Typography

Use typography that feels editorial and academic rather than product-marketing oriented.

Desired behavior:

- strong title hierarchy
- clean body readability
- restrained metadata styling
- chapter links readable at a glance

### Layout and spacing

The page should feel open and calm:

- generous spacing
- centered card layout
- clear section dividers
- mobile-safe stacking

### Motion

Keep motion minimal.

Allowed:

- light hover treatment for chapter cards or footer links

Avoid:

- animated hero effects
- decorative motion
- attention-grabbing transitions

## Implementation Implications

### Static ownership

`docs/index.html` should become the source of truth for the landing page and should be edited directly.

### Export behavior

`src/export.jl` should stop generating `docs/index.html`.

It should only export the notebook chapter HTML files. This separates:

- static branded homepage design
- generated notebook export artifacts

This separation is preferable because branding-sensitive page design should not be embedded as a Julia string template that is rewritten on every export.

## Success Criteria

The redesign is successful if:

- the page clearly reads as a KFUPM course homepage
- the chapter links are the most obvious action on the page
- the visual tone is simple and minimalistic
- the page includes the requested academic information without becoming crowded
- the page can be reused across terms without changing hero text
- `docs/index.html` remains static across notebook export runs
