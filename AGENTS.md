# AGENTS.md

## Project

This repository contains MATH102 Calculus II course notes authored as Pluto notebooks and exported as a static site.

## Workflow

- Edit notebooks in Pluto.
- Export/publish through `export_push.sh` or `export_push.bat` with a commit message.
- Use `src/export.jl` as the build/export entry point.
- Treat `docs/` as generated static-site output.
- Prefer Julia for repository automation scripts. Do not add Python or a Python environment unless there is a clear technical reason.

## Notebook Split Conventions

- Chapter notebooks should be standalone Pluto notebooks.
- Do not introduce a shared `common.jl` dependency for chapter notebooks.
- Duplicate required imports, helper functions, and setup cells into each standalone chapter notebook.
- Split by Pluto cell boundaries, not by raw line ranges inside a cell.
- Preserve valid Pluto headers and `Cell order` sections.
- Keep `src/MATH102_NOTES.jl` until split exports are validated.
- After validation, archive the legacy notebook under `refs/`.

## Repository Folders

- `src/`: Pluto notebooks and export scripts.
- `docs/`: generated static-site output.
- `imgs/`: course image assets.
- `refs/`: syllabus/reference files and archived legacy sources.
- `notes/`: project plans, specs, and discussion notes.

## Agent Notes

- Save project specs and planning notes under `notes/`, not `docs/superpowers/...`.
- Review `.gitignore` before staging broad generated changes.
- Do not delete or reorganize assets unless explicitly requested.
- Avoid reverting user cleanup or generated changes unless explicitly approved.
