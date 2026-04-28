# MATH102 Notebook Split Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Split `src/MATH102_NOTES.jl` into standalone Pluto chapter notebooks for Chapters 5, 7, 8, and 9, then export them as a static site with a generated landing page.

**Architecture:** Add a small deterministic splitter script that parses Pluto cells and cell-order metadata, writes standalone chapter notebooks, and preserves the original notebook until validation passes. Update `src/export.jl` to export every chapter notebook and generate `docs/index.html`.

**Tech Stack:** Julia, Pluto.jl, PlutoSliderServer.jl, PowerShell/Bash, Python standard library for the one-off splitter.

---

## File Structure

- Create: `scripts/split_math102_notebook.py`
  - Parses `src/MATH102_NOTES.jl`.
  - Extracts Pluto cells and cell-order metadata.
  - Copies shared preamble cells into each chapter notebook.
  - Writes `src/MATH_102_CH5.jl`, `src/MATH_102_CH7.jl`, `src/MATH_102_CH8.jl`, and `src/MATH_102_CH9.jl`.
- Create: `notes/2026-04-28-math102-split-report.md`
  - Records detected chapter boundaries, generated notebooks, validation results, `.gitignore` decision, and legacy archive status.
- Modify: `src/export.jl`
  - Exports all chapter notebooks.
  - Generates `docs/index.html`.
- Modify: `README.md`
  - Documents the new workflow after validation.
- Modify: `.gitignore`
  - Only if review shows generated/local artifacts should be ignored.
- Later archive: `refs/MATH102_NOTES_legacy.jl`
  - Copy of the original notebook after split validation succeeds.

---

### Task 1: Baseline Inventory And Gitignore Review

**Files:**
- Create: `notes/2026-04-28-math102-split-report.md`
- Review: `.gitignore`
- Read-only: `src/MATH102_NOTES.jl`, `Project.toml`, `Manifest.toml`, `AGENTS.md`

- [ ] **Step 1: Capture current git status**

Run:

```powershell
git status --short
```

Expected: Shows existing user cleanup changes plus no unplanned implementation files yet. Do not revert unrelated deletions, moved images, or notebook edits.

- [ ] **Step 2: Record notebook headings and asset references**

Run:

```powershell
Select-String -Path src\MATH102_NOTES.jl -Pattern '# 5\.|# 7\.|# 8\.|# 9\.|Resource\(|post_img\(|LocalImage\(|\.png|\.gif|\.jpg|\.pdf|\.csv' | Set-Content notes\math102-heading-asset-scan.txt
```

Expected: `notes/math102-heading-asset-scan.txt` contains Chapter 5/7/8/9 heading hits and local/remote asset references.

- [ ] **Step 3: Review `.gitignore` before broad staging**

Read `.gitignore` and decide whether it should track or ignore these categories:

```text
Track:
- src/MATH_102_CH*.jl
- src/export.jl
- docs/index.html
- docs/MATH_102_CH*.html if the static site is committed/published from repo
- refs/math102-252.pdf
- refs/MATH102_NOTES_legacy.jl
- notes/*.md

Consider ignoring:
- temporary scan files under notes/ if they are purely scratch
- temporary rendered images
- local Pluto cache files if any appear
- OS/editor artifacts
```

Expected: No `.gitignore` change unless a concrete unwanted artifact exists. If changed, keep it narrow.

- [ ] **Step 4: Create the split report scaffold**

Create `notes/2026-04-28-math102-split-report.md`:

```markdown
# MATH102 Split Report

## Baseline

- Source notebook: `src/MATH102_NOTES.jl`
- Target notebooks: `src/MATH_102_CH5.jl`, `src/MATH_102_CH7.jl`, `src/MATH_102_CH8.jl`, `src/MATH_102_CH9.jl`
- Static output: `docs/index.html` plus one exported HTML page per chapter.

## Gitignore Review

- Decision:
- Rationale:

## Chapter Boundary Check

- Chapter 5:
- Chapter 7:
- Chapter 8:
- Chapter 9:

## Export Validation

- `julia --project=. src/export.jl`:
- Generated chapter HTML:
- Landing page links:
- Heading checks:
- Broken local reference scan:

## Legacy Archive

- Archive path:
- Archive completed:
```

- [ ] **Step 5: Commit baseline notes if `.gitignore` or report changed**

Run:

```powershell
git add notes\2026-04-28-math102-split-report.md .gitignore
git commit -m "Document MATH102 split baseline"
```

Expected: Commit succeeds if files changed. If `.gitignore` is unchanged, stage only the report.

---

### Task 2: Build The Pluto Splitter

**Files:**
- Create: `scripts/split_math102_notebook.py`
- Modify: `notes/2026-04-28-math102-split-report.md`

- [ ] **Step 1: Create the scripts directory if needed**

Run:

```powershell
New-Item -ItemType Directory -Force -Path scripts
```

Expected: `scripts/` exists.

- [ ] **Step 2: Add the splitter script**

Create `scripts/split_math102_notebook.py`:

```python
from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "src" / "MATH102_NOTES.jl"
OUT_DIR = ROOT / "src"

CELL_MARKER_RE = re.compile(r"^# [╔╠╟]═[╡╪─] ([0-9a-f-]{36})\s*$")
CELL_ORDER_START = "# ╔═╡ Cell order:"
CELL_ORDER_RE = re.compile(r"^# [╠╟]═([0-9a-f-]{36})\s*$")

CHAPTERS = [
    ("5", "MATH_102_CH5.jl"),
    ("7", "MATH_102_CH7.jl"),
    ("8", "MATH_102_CH8.jl"),
    ("9", "MATH_102_CH9.jl"),
]


@dataclass(frozen=True)
class Cell:
    cell_id: str
    marker: str
    text: str


def split_cells(body: str) -> list[Cell]:
    matches = list(CELL_MARKER_RE.finditer(body))
    if not matches:
        raise SystemExit("No Pluto cells found.")
    cells: list[Cell] = []
    for index, match in enumerate(matches):
        start = match.start()
        end = matches[index + 1].start() if index + 1 < len(matches) else len(body)
        cell_text = body[start:end].rstrip() + "\n"
        cells.append(Cell(cell_id=match.group(1), marker=match.group(0), text=cell_text))
    return cells


def read_notebook() -> tuple[str, list[Cell], list[str]]:
    text = SOURCE.read_text(encoding="utf-8")
    if CELL_ORDER_START not in text:
        raise SystemExit("Missing Pluto Cell order section.")
    body, order_text = text.split(CELL_ORDER_START, 1)
    cells = split_cells(body)
    order_ids = [m.group(1) for m in CELL_ORDER_RE.finditer(order_text)]
    if not order_ids:
        raise SystemExit("No cell IDs found in Pluto Cell order section.")
    return body, cells, order_ids


def heading_chapter(cell_text: str) -> str | None:
    patterns = [
        r'md"""[\s\r\n]*#\s*([5789])\.',
        r'md"\s*#\s*([5789])\.',
        r"^\s*#\s*([5789])\.",
    ]
    for pattern in patterns:
        match = re.search(pattern, cell_text, flags=re.MULTILINE)
        if match:
            return match.group(1)
    return None


def choose_preamble(cells: list[Cell], first_chapter_cell_id: str) -> list[Cell]:
    preamble: list[Cell] = []
    for cell in cells:
        if cell.cell_id == first_chapter_cell_id:
            break
        preamble.append(cell)
    return preamble


def assign_chapter_cells(cells: list[Cell], preamble_ids: set[str]) -> dict[str, list[Cell]]:
    assigned = {chapter: [] for chapter, _ in CHAPTERS}
    active: str | None = None
    for cell in cells:
        if cell.cell_id in preamble_ids:
            continue
        chapter = heading_chapter(cell.text)
        if chapter in assigned:
            active = chapter
        if active is not None:
            assigned[active].append(cell)
    for chapter, chapter_cells in assigned.items():
        if not chapter_cells:
            raise SystemExit(f"No cells assigned to Chapter {chapter}.")
    return assigned


def cell_order(cells: list[Cell]) -> str:
    lines = [CELL_ORDER_START]
    for cell in cells:
        lines.append(f"# ╠═{cell.cell_id}")
    return "\n".join(lines) + "\n"


def write_notebook(filename: str, cells: list[Cell]) -> None:
    output = OUT_DIR / filename
    header = "### A Pluto.jl notebook ###\n# v0.20.24\n\nusing Markdown\nusing InteractiveUtils\n\n"
    body = "\n".join(cell.text.rstrip() for cell in cells).rstrip() + "\n\n"
    output.write_text(header + body + cell_order(cells), encoding="utf-8")
    print(f"Wrote {output.relative_to(ROOT)} with {len(cells)} cells")


def main() -> None:
    _, cells, order_ids = read_notebook()
    cells_by_id = {cell.cell_id: cell for cell in cells}
    ordered_cells = [cells_by_id[cell_id] for cell_id in order_ids if cell_id in cells_by_id]
    first_ch5 = next((cell.cell_id for cell in ordered_cells if heading_chapter(cell.text) == "5"), None)
    if first_ch5 is None:
        raise SystemExit("Could not find first Chapter 5 cell.")
    preamble = choose_preamble(ordered_cells, first_ch5)
    preamble_ids = {cell.cell_id for cell in preamble}
    assigned = assign_chapter_cells(ordered_cells, preamble_ids)
    for chapter, filename in CHAPTERS:
        write_notebook(filename, preamble + assigned[chapter])


if __name__ == "__main__":
    main()
```

- [ ] **Step 3: Run the splitter**

Run:

```powershell
python scripts\split_math102_notebook.py
```

Expected output:

```text
Wrote src\MATH_102_CH5.jl with ...
Wrote src\MATH_102_CH7.jl with ...
Wrote src\MATH_102_CH8.jl with ...
Wrote src\MATH_102_CH9.jl with ...
```

- [ ] **Step 4: Verify generated notebooks exist**

Run:

```powershell
Get-ChildItem src\MATH_102_CH*.jl | Select-Object Name,Length
```

Expected: four non-empty files.

- [ ] **Step 5: Verify generated notebooks contain one target chapter each**

Run:

```powershell
Select-String -Path src\MATH_102_CH*.jl -Pattern '# 5\.|# 7\.|# 8\.|# 9\.'
```

Expected: Chapter 5 headings only in `MATH_102_CH5.jl`, Chapter 7 headings only in `MATH_102_CH7.jl`, Chapter 8 headings only in `MATH_102_CH8.jl`, and Chapter 9 headings only in `MATH_102_CH9.jl`, aside from harmless textual references inside examples.

- [ ] **Step 6: Commit splitter and generated notebooks**

Run:

```powershell
git add scripts\split_math102_notebook.py src\MATH_102_CH5.jl src\MATH_102_CH7.jl src\MATH_102_CH8.jl src\MATH_102_CH9.jl notes\2026-04-28-math102-split-report.md
git commit -m "Split MATH102 notebook by chapter"
```

Expected: Commit succeeds.

---

### Task 3: Update Multi-Chapter Export

**Files:**
- Modify: `src/export.jl`
- Modify: `notes/2026-04-28-math102-split-report.md`

- [ ] **Step 1: Replace `src/export.jl`**

Use this content:

```julia
using PlutoSliderServer

const DOCS_DIR = "docs"

const NOTEBOOKS = [
    ("MATH_102_CH5", "Chapter 5: Integration"),
    ("MATH_102_CH7", "Chapter 7: Applications of Integration"),
    ("MATH_102_CH8", "Chapter 8: Integration Techniques and Improper Integrals"),
    ("MATH_102_CH9", "Chapter 9: Sequences and Series"),
]

function export_chapter_notebooks()
    mkpath(DOCS_DIR)
    for (notebook_name, _) in NOTEBOOKS
        notebook_path = joinpath("src", notebook_name * ".jl")
        PlutoSliderServer.export_notebook(notebook_path; Export_output_dir = DOCS_DIR)
    end
end

function write_landing_page()
    links = join(
        [
            """
            <li>
              <a href="$(name).html">$(title)</a>
            </li>
            """
            for (name, title) in NOTEBOOKS
        ],
        "\n",
    )

    html = """
    <!doctype html>
    <html lang="en">
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>MATH102 Calculus II</title>
      <style>
        :root {
          color-scheme: light;
          --ink: #1f2933;
          --muted: #52606d;
          --paper: #f7f4ed;
          --card: #ffffff;
          --accent: #0f766e;
        }
        body {
          margin: 0;
          font-family: Georgia, "Times New Roman", serif;
          color: var(--ink);
          background:
            radial-gradient(circle at top left, rgba(15, 118, 110, 0.16), transparent 32rem),
            linear-gradient(135deg, #f7f4ed 0%, #eef2ef 100%);
        }
        main {
          max-width: 56rem;
          margin: 0 auto;
          padding: 5rem 1.25rem;
        }
        .card {
          background: var(--card);
          border: 1px solid rgba(31, 41, 51, 0.12);
          border-radius: 1.25rem;
          box-shadow: 0 1.5rem 4rem rgba(31, 41, 51, 0.12);
          padding: clamp(1.5rem, 4vw, 3rem);
        }
        h1 {
          margin: 0;
          font-size: clamp(2.25rem, 7vw, 4.5rem);
          line-height: 0.95;
          letter-spacing: -0.05em;
        }
        p {
          color: var(--muted);
          font-size: 1.15rem;
          line-height: 1.7;
          max-width: 42rem;
        }
        ul {
          display: grid;
          gap: 0.9rem;
          list-style: none;
          margin: 2rem 0 0;
          padding: 0;
        }
        a {
          display: block;
          border: 1px solid rgba(15, 118, 110, 0.22);
          border-radius: 0.85rem;
          padding: 1rem 1.1rem;
          color: var(--accent);
          font-size: 1.1rem;
          font-weight: 700;
          text-decoration: none;
          background: rgba(15, 118, 110, 0.04);
        }
        a:hover {
          background: rgba(15, 118, 110, 0.1);
        }
      </style>
    </head>
    <body>
      <main>
        <section class="card">
          <h1>MATH102<br>Calculus II</h1>
          <p>
            Course notes for MATH102, organized as standalone Pluto notebook exports.
            Select a chapter below to open the static notes.
          </p>
          <ul>
            $(links)
          </ul>
        </section>
      </main>
    </body>
    </html>
    """

    write(joinpath(DOCS_DIR, "index.html"), html)
end

export_chapter_notebooks()
write_landing_page()
```

- [ ] **Step 2: Run the exporter**

Run:

```powershell
julia --project=. src/export.jl
```

Expected: PlutoSliderServer exports all four notebooks and writes `docs/index.html`.

- [ ] **Step 3: Verify exported files**

Run:

```powershell
Get-ChildItem docs\MATH_102_CH*.html,docs\index.html | Select-Object Name,Length
```

Expected: `index.html` plus four non-empty chapter HTML files.

- [ ] **Step 4: Verify landing page links**

Run:

```powershell
Select-String -Path docs\index.html -Pattern 'MATH_102_CH5.html|MATH_102_CH7.html|MATH_102_CH8.html|MATH_102_CH9.html'
```

Expected: all four links are present.

- [ ] **Step 5: Commit export changes**

Run:

```powershell
git add src\export.jl docs\index.html docs\MATH_102_CH5.html docs\MATH_102_CH7.html docs\MATH_102_CH8.html docs\MATH_102_CH9.html notes\2026-04-28-math102-split-report.md
git commit -m "Export MATH102 chapter notebooks"
```

Expected: Commit succeeds.

---

### Task 4: Validate Content And Asset References

**Files:**
- Modify: `notes/2026-04-28-math102-split-report.md`

- [ ] **Step 1: Check chapter headings in generated HTML**

Run:

```powershell
Select-String -Path docs\MATH_102_CH5.html -Pattern '5.2 Area|5.3 Riemann|5.5 Integration'
Select-String -Path docs\MATH_102_CH7.html -Pattern '7.1 Area|7.2 Volume|7.3 Volume|7.4 Arc'
Select-String -Path docs\MATH_102_CH8.html -Pattern '8.1 Basic|8.2 Integration by Parts|8.8 Improper'
Select-String -Path docs\MATH_102_CH9.html -Pattern '9.1 Sequences|9.2 Series|9.10'
```

Expected: Each command finds the expected chapter headings in its matching HTML file.

- [ ] **Step 2: Check local file references in chapter notebooks**

Run:

```powershell
Select-String -Path src\MATH_102_CH*.jl -Pattern 'LocalImage\(|read\(|\.png|\.gif|\.jpg|\.pdf|\.csv'
```

Expected: Any local references point to existing files relative to the notebook execution/export context. Remote Dropbox URLs are acceptable.

- [ ] **Step 3: Check for missing generated cell-order IDs**

Run:

```powershell
python -c "from pathlib import Path; import re; ok=True; \
for p in Path('src').glob('MATH_102_CH*.jl'): \
 t=p.read_text(encoding='utf-8'); body, order=t.split('# ╔═╡ Cell order:',1); \
 cells=set(re.findall(r'^# [╔╠╟]═[╡╪─] ([0-9a-f-]{36})', body, re.M)); \
 ordered=set(re.findall(r'^# [╠╟]═([0-9a-f-]{36})', order, re.M)); \
 missing=cells-ordered; extra=ordered-cells; \
 print(p, 'cells', len(cells), 'ordered', len(ordered), 'missing', len(missing), 'extra', len(extra)); \
 ok=ok and not missing and not extra; \
raise SystemExit(0 if ok else 1)"
```

Expected: each notebook reports `missing 0 extra 0`.

- [ ] **Step 4: Update the split report validation section**

Edit `notes/2026-04-28-math102-split-report.md` so it records:

```markdown
## Export Validation

- `julia --project=. src/export.jl`: passed
- Generated chapter HTML: passed
- Landing page links: passed
- Heading checks: passed
- Broken local reference scan: no unresolved required local assets found
```

- [ ] **Step 5: Commit validation report**

Run:

```powershell
git add notes\2026-04-28-math102-split-report.md
git commit -m "Validate MATH102 chapter split"
```

Expected: Commit succeeds if report changed.

---

### Task 5: Archive Legacy Notebook

**Files:**
- Create: `refs/MATH102_NOTES_legacy.jl`
- Keep initially: `src/MATH102_NOTES.jl`
- Modify: `notes/2026-04-28-math102-split-report.md`

- [ ] **Step 1: Copy the legacy notebook into refs**

Run:

```powershell
Copy-Item -LiteralPath src\MATH102_NOTES.jl -Destination refs\MATH102_NOTES_legacy.jl -Force
```

Expected: `refs/MATH102_NOTES_legacy.jl` exists and matches current `src/MATH102_NOTES.jl`.

- [ ] **Step 2: Verify the archive copy**

Run:

```powershell
Compare-Object (Get-Content src\MATH102_NOTES.jl) (Get-Content refs\MATH102_NOTES_legacy.jl)
```

Expected: No output.

- [ ] **Step 3: Decide whether to remove `src/MATH102_NOTES.jl`**

Default: keep `src/MATH102_NOTES.jl` for one more cycle unless the user explicitly approves removal. If removal is approved, use:

```powershell
git rm src\MATH102_NOTES.jl
```

Expected: Legacy archive exists before any removal from `src/`.

- [ ] **Step 4: Update split report archive section**

Edit `notes/2026-04-28-math102-split-report.md`:

```markdown
## Legacy Archive

- Archive path: `refs/MATH102_NOTES_legacy.jl`
- Archive completed: yes
- Source removal: kept in `src/` pending explicit approval
```

- [ ] **Step 5: Commit archive**

Run:

```powershell
git add refs\MATH102_NOTES_legacy.jl notes\2026-04-28-math102-split-report.md
git commit -m "Archive legacy MATH102 notebook"
```

Expected: Commit succeeds.

---

### Task 6: Update README

**Files:**
- Modify: `README.md`

- [ ] **Step 1: Replace README with clean project documentation**

Use this content:

```markdown
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
```

- [ ] **Step 2: Verify README has no encoding artifacts**

Run:

```powershell
Select-String -Path README.md -Pattern 'â|ð|�'
```

Expected: No output.

- [ ] **Step 3: Commit README**

Run:

```powershell
git add README.md
git commit -m "Document MATH102 chapter notebook workflow"
```

Expected: Commit succeeds.

---

### Task 7: Final Verification

**Files:**
- Read-only: all modified/generated files

- [ ] **Step 1: Run final export**

Run:

```powershell
julia --project=. src/export.jl
```

Expected: Command exits successfully and regenerates the landing page plus four chapter pages.

- [ ] **Step 2: Check final git status**

Run:

```powershell
git status --short
```

Expected: Only expected generated changes remain. User cleanup changes may still appear if they were present before implementation; do not revert them.

- [ ] **Step 3: Summarize final state**

Prepare a final summary with:

```text
- New standalone notebooks created.
- Export script now exports chapter notebooks and writes landing page.
- README updated.
- Legacy notebook archived under refs/ if validation reached that point.
- Validation command run: julia --project=. src/export.jl
- Any unresolved risks or user cleanup changes left untouched.
```

