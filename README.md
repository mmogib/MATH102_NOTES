# MATH102: Calculus II (Term 252)

This repository contains Pluto.jl notes, exercises, and static course materials for MATH102 Calculus II at King Fahd University of Petroleum & Minerals (KFUPM).

## Course Material

Open the generated course site:

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

## Build And Export

Install Julia dependencies:

```bash
julia --project=. -e 'using Pkg; Pkg.instantiate()'
```

Export the static site:

```bash
julia --project=. src/export.jl
```

Publish with a commit message:

```bash
./export_push.sh "Update MATH102 notes"
```

On Windows:

```bat
export_push.bat "Update MATH102 notes"
```

## Repository Layout

- `src/`: Pluto notebooks and export scripts.
- `docs/`: generated static-site output.
- `imgs/`: course image assets.
- `refs/`: syllabus/reference material and archived legacy sources.
- `notes/`: project plans, specs, and discussion notes.
- `AGENTS.md`: repository-specific guidance for future agent sessions.

## Course Description

Definite and indefinite integrals of single-variable functions. Fundamental Theorem of Calculus. Techniques of integration. Hyperbolic functions. Applications of the definite integral to area, volume, arc length, and surface area. Improper integrals. Sequences and series: convergence tests, power series, and Taylor/Maclaurin series.

## Textbook

Calculus: Early Transcendental Functions, 7th Edition (Metric Version), by Ron Larson and Bruce Edwards.
