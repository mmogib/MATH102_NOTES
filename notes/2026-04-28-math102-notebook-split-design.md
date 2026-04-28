# MATH102 Notebook Split Design

## Goal

Split the large Pluto notebook `src/MATH102_NOTES.jl` into smaller standalone chapter notebooks for the MATH102 Calculus II static course site.

Target notebooks:

- `src/MATH_102_CH5.jl`
- `src/MATH_102_CH7.jl`
- `src/MATH_102_CH8.jl`
- `src/MATH_102_CH9.jl`

The split should preserve course content, package setup, helper functions, local/remote image usage, and Pluto notebook validity.

## Constraints

- Each chapter notebook must be standalone and open/export independently in Pluto.
- Shared setup code may be duplicated across notebooks.
- Do not create a shared `common.jl` dependency.
- Keep `docs/` as generated static-site output.
- Use `notes/` for project plans, specs, and discussion notes.
- Use `refs/` for reference files, including the syllabus and the archived legacy notebook.
- Do not delete or reorganize assets unless explicitly approved.
- Add an `AGENTS.md` project guide so future Codex sessions follow the repository-specific workflow.
- Add/update Codex project memory so future sessions remember the MATH102 split conventions.
- Prefer Julia for repository automation scripts; do not add Python environments unless there is a clear technical reason.

## Split Strategy

Use a conservative hybrid workflow:

1. Analyze `src/MATH102_NOTES.jl` to identify Pluto cell boundaries, chapter heading cells, setup cells, helper functions, and asset references.
2. Define a shared preamble containing the Pluto header, imports, mock `@bind`, helper structs/functions, and course/site setup needed by chapter content.
3. Create one standalone notebook per chapter by combining the shared preamble with the relevant chapter cells.
4. Regenerate each notebook's Pluto `Cell order` section so Pluto recognizes every included cell and no excluded cells remain.
5. Keep `src/MATH102_NOTES.jl` in place during validation.
6. After successful validation, archive the original notebook to `refs/MATH102_NOTES_legacy.jl` or another approved legacy name.

## Chapter Boundaries

Use chapter numbers as they appear in the notes:

- Chapter 5: all section heading/content cells from `5.x` until before `7.1`.
- Chapter 7: all section heading/content cells from `7.x` until before `8.1`.
- Chapter 8: all section heading/content cells from `8.x` until before `9.1`.
- Chapter 9: all section heading/content cells from `9.x` through the end of course content.

The implementation should split on Pluto cell boundaries, not raw line ranges inside a cell.

## Export And Static Site

Update `src/export.jl` to export all chapter notebooks:

- `MATH_102_CH5.jl`
- `MATH_102_CH7.jl`
- `MATH_102_CH8.jl`
- `MATH_102_CH9.jl`

Expected static outputs:

- `docs/index.html`
- `docs/MATH_102_CH5.html`
- `docs/MATH_102_CH7.html`
- `docs/MATH_102_CH8.html`
- `docs/MATH_102_CH9.html`

`docs/index.html` should be a lightweight generated landing page with the course title, a short description, and links to the chapter pages.

Keep the existing user workflow:

- Edit notebooks in Pluto.
- Run `export_push.sh` or `export_push.bat` with a commit message.
- Let the script export, add, commit, and push.

## Validation

Before archiving the original notebook:

1. Confirm each generated `.jl` file has a valid Pluto header and valid `Cell order`.
2. Run `julia --project=. src/export.jl`.
3. Confirm all four chapter HTML files are generated in `docs/`.
4. Confirm `docs/index.html` links to all chapter pages.
5. Spot-check each exported chapter page for expected headings and visible images.
6. Search for obvious broken local references.
7. Review `.gitignore` before staging to decide which generated files, references, notebook outputs, and local artifacts should be tracked.
8. Only after successful validation, archive `src/MATH102_NOTES.jl` under `refs/`.

## Project Guidance Files

Create or update `AGENTS.md` with repository-specific instructions:

- This is a MATH102 Calculus II Pluto/static-site project.
- Chapter notebooks are standalone and should not depend on a shared `common.jl`.
- `src/export.jl` is the build entry point.
- `export_push.sh` and `export_push.bat` are the normal publish workflow.
- `docs/` is generated static-site output.
- `refs/` is for syllabus/reference material and archived legacy sources.
- `notes/` is for plans, specs, and discussion notes.
- Review `.gitignore` before staging broad generated changes.
- Prefer Julia for repository automation.

Add/update Codex memory with the same durable project conventions, especially:

- Use `notes/`, not `docs/superpowers/...`, for project specs.
- Keep chapter notebook splits standalone.
- Keep the original notebook until split exports are validated.
- Treat `docs/` as generated static output.

## README Update

At the end of the implementation session, update `README.md` to:

- Fix encoding artifacts.
- State that this is MATH102 Calculus II.
- Document the standalone chapter notebooks.
- Document the export workflow using `export_push.sh` and `export_push.bat`.
- Clarify that `docs/` is generated static-site output.
- Clarify that `refs/` contains reference material and archived legacy sources.
- Clarify that `notes/` contains planning notes and project remarks.
- Point future contributors to `AGENTS.md`.

## Out Of Scope

- Removing duplicate assets.
- Converting remote Dropbox image URLs to local files.
- Rewriting course content.
- Changing the visual design of exported Pluto pages beyond the landing page.
