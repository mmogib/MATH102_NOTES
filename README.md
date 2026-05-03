# MATH102: Calculus II (Term 252)

This repository contains Pluto.jl notes, exercises, and static course materials for MATH102 Calculus II at King Fahd University of Petroleum & Minerals (KFUPM).

## Course Material

Open the published course site:

- [Course landing page](./docs/index.html)
- [Chapter 5 notes](./docs/MATH_102_CH5.html)
- [Chapter 7 notes](./docs/MATH_102_CH7.html)
- [Chapter 8 notes](./docs/MATH_102_CH8.html)
- [Chapter 9 notes](./docs/MATH_102_CH9.html)

## Source Notebooks

The chapter notes are standalone Pluto notebooks:

- `src/MATH_102_CH5.jl`
- `src/MATH_102_CH7.jl`
- `src/MATH_102_CH8.jl`
- `src/MATH_102_CH9.jl`

Each notebook includes its own imports and helper definitions so it can be opened and exported independently.

The legacy combined source notebook is still kept in place while the chapter split workflow remains in active use:

- `src/MATH102_NOTES.jl`

Use the generic splitter to regenerate standalone chapter notebooks from a Pluto source notebook:

```bash
julia --project=. scripts/split_pluto_chapters.jl --source src/MATH102_NOTES.jl --output-prefix MATH_102
```

You can also limit the split to selected chapters:

```bash
julia --project=. scripts/split_pluto_chapters.jl --source src/MATH102_NOTES.jl --output-prefix MATH_102 --chapters 5,7
```

## Build And Export

Install Julia dependencies:

```bash
julia --project=. -e 'using Pkg; Pkg.instantiate()'
```

Export the chapter notebooks:

```bash
julia --project=. src/export.jl
```

The exporter updates only the chapter HTML files in `docs/`. It does not regenerate `docs/index.html`.

Export only selected chapters:

```bash
julia --project=. src/export.jl --ch=5
julia --project=. src/export.jl --ch=5,7
```

Publish with a commit message:

```bash
./export_push.sh "Update MATH102 notes"
```

On Windows:

```bat
export_push.bat "Update MATH102 notes"
```

Pass export arguments through the publish scripts after the commit message:

```bash
./export_push.sh "Update selected chapters" --ch=5,7
```

```bat
export_push.bat "Update selected chapters" --ch=5,7
```

## Landing Page

The landing page is maintained directly at `docs/index.html`.

- It is a static branded page, not a generated Julia template.
- Published landing-page assets live under `docs/assets/`.
- Repo-level source assets can remain under `imgs/`, but `docs/index.html` should reference only published paths inside `docs/`.

## Repository Layout

- `src/`: Pluto notebooks and export scripts.
- `docs/`: published static-site output, including the static landing page.
- `docs/assets/`: published assets used by the landing page.
- `imgs/`: course image assets.
- `refs/`: syllabus/reference material and archived legacy sources.
- `notes/`: project plans, specs, and discussion notes.
- `AGENTS.md`: repository-specific guidance for future agent sessions.

## Course Description

Definite and indefinite integrals of single-variable functions. Fundamental Theorem of Calculus. Techniques of integration. Hyperbolic functions. Applications of the definite integral to area, volume, arc length, and surface area. Improper integrals. Sequences and series: convergence tests, power series, and Taylor/Maclaurin series.

## Textbook

Calculus: Early Transcendental Functions, 7th Edition (Metric Version), by Ron Larson and Bruce Edwards.
