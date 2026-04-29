# Generic Pluto Chapter Splitter Design

## Goal

Create one reusable Julia splitter that can extract chapter notebooks from a Pluto source notebook for this course and future courses such as `MATH201`.

The splitter must preserve the structure we agreed on:

- `common start`
- `chapter content`
- `common end`
- Pluto metadata / package cells as required for valid execution

It must not hard-code `MATH102` chapter IDs.

## Requirements

- Use Julia only.
- Operate on Pluto cell boundaries, not raw text ranges.
- Preserve the original notebook `Cell order`.
- Generate standalone chapter notebooks.
- Preserve shared setup cells that every chapter needs.
- Preserve chapter-local content only in the chapter file.
- Keep physical notebook layout separate from execution order.
- Do not export HTML in the splitter step.
- Support a future course without rewriting the script.

## Structural Model

The splitter will treat a notebook as four logical regions:

1. Common start
1. Chapter block
1. Common end
1. Pluto package / metadata cells

The important distinction is that physical position and execution order are not the same thing.

Physical layout for each chapter notebook:

- common start first
- chapter content next
- common end later
- package / metadata cells last

Execution order for each chapter notebook:

- package / metadata cells first if required by Pluto
- common start
- chapter content
- common end

If a cell is needed by later notebook code, it must appear in execution order before the first consumer, even if it is physically placed later.

## Chapter Detection

The splitter should infer chapter boundaries from heading cells in `Cell order`.

Preferred inference strategy:

- detect chapter headings by Markdown heading text
- use chapter numbers / titles from the notebook headings
- treat the first chapter heading as the start of chapter 1 of the split output
- use the next chapter heading as the boundary for the current chapter

If the notebook structure is unusual or the heading pattern is ambiguous, the script should ask the user for:

- the list of chapter headings to split
- the chapter numbering scheme
- any special shared blocks that need to be treated as common start or common end

## Common Start

`common start` is everything that must run before chapter content and is shared across chapters.

This can include:

- package/import cells
- `TableOfContents(...)`
- notebook-level setup cells
- any shared cells that chapter code uses immediately

For the current notebook family, `common start` includes the syllabus and course introduction block only if it is intended to appear at the top of every extracted chapter.

## Common End

`common end` is everything shared across chapters that belongs near the bottom of the notebook or is used by later cells.

This can include:

- helper function definitions
- HTML/CSS style setup
- shared example/theorem block helpers
- shared image helpers
- any notebook-level setup that chapter content depends on

The CSS block and `initialize_eqref()` setup cell must be carried with the shared tail when they are used by chapter content.

## Detection Rules

The splitter should use a combination of heuristics:

- chapter heading detection from Markdown text
- shared cell detection from explicit content patterns
- package cell detection from Pluto metadata IDs or notebook cell markers
- optional user-supplied overrides for ambiguous notebooks

It should not rely on hard-coded chapter UUIDs for the full workflow.

## Output

For each chapter notebook:

- write a standalone `.jl` Pluto notebook
- preserve valid Pluto header metadata
- preserve the original chapter cell content
- preserve required shared setup
- preserve `Cell order`

The current implementation should stop before export.

## Error Handling

The splitter should fail loudly when:

- no chapter headings are detected
- the notebook has no `Cell order` section
- a required shared block cannot be classified
- a chapter boundary would be ambiguous

When ambiguity occurs, the script should prefer asking the user instead of guessing.

## Initial Implementation Target

The first implementation pass should support the current notebook and be usable for future courses without rewriting the code.

That means:

- current `MATH102` notebook is supported
- the script does not hard-code course-specific chapter UUIDs as the primary mechanism
- chapter 5 can still be validated first as the known example

## Acceptance Criteria

- The splitter can generate chapter notebooks for the current course.
- Chapter selection comes from headings or user input, not fixed UUID lists.
- `common start` and `common end` are preserved correctly.
- Common CSS and helper cells are carried into every chapter notebook as needed.
- No export step runs during splitting.
- The script can be reused for another course with minimal or no code changes.
