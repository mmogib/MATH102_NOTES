# Generic Pluto Chapter Splitter Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build one reusable Julia splitter that can extract chapter notebooks from a Pluto notebook by inferring chapter boundaries, preserving `common start` and `common end`, and stopping before export.

**Architecture:** Refactor the current one-off splitter into a generic chapter splitter with explicit phases: parse Pluto cells, classify shared start/end cells, infer chapter blocks from headings, and emit standalone chapter notebooks with preserved execution order. Keep physical notebook layout separate from execution order so shared setup can live where it belongs visually while still executing in the right order.

**Tech Stack:** Julia 1.12+, Pluto notebook text format, standard library only for the splitter, existing repository notebook/export workflow.

---

### Task 1: Replace the one-off chapter 5 splitter with a generic notebook parser

**Files:**
- Modify: `scripts/split_math102_notebook.jl`
- Create: `scripts/split_pluto_chapters.jl`

- [ ] **Step 1: Add a failing parser smoke test by running the script against the current notebook**

Run:
```bash
julia --project=. scripts/split_math102_notebook.jl
```
Expected: the current one-off script only knows chapter 5 and cannot yet split arbitrary notebooks.

- [ ] **Step 2: Implement a reusable Pluto parser**

```julia
struct Cell
    id::String
    marker_prefix::String
    text::String
end

function read_notebook(source::String)
    text = read(source, String)
    parts = split(text, CELL_ORDER_START; limit=2)
    length(parts) == 2 || error("Missing Pluto Cell order section.")
    body, order_text = parts
    cells = split_cells(body)
    order_ids = [m.captures[2] for m in eachmatch(CELL_ORDER_RE, order_text)]
    return body[1:prevind(body, first(eachmatch(CELL_RE, body)).offset)], cells, order_ids
end
```

- [ ] **Step 3: Verify the parser with the current notebook**

Run:
```bash
julia --project=. -e 'include("scripts/split_pluto_chapters.jl"); prefix, cells, order_ids = read_notebook("src/MATH102_NOTES.jl"); println(length(cells), " cells"); println(length(order_ids), " ordered ids")'
```
Expected: nonzero cell counts and no parse errors.

- [ ] **Step 4: Commit the parser refactor**

```bash
git add scripts/split_pluto_chapters.jl scripts/split_math102_notebook.jl
git commit -m "refactor: add generic Pluto notebook parser"
```

### Task 2: Infer common start, common end, and chapter blocks from notebook content

**Files:**
- Modify: `scripts/split_pluto_chapters.jl`

- [ ] **Step 1: Add chapter-heading detection and shared-block classification**

```julia
function heading_chapter(text::String)
    patterns = [
        r"md\"\"\"[\s\r\n]*#\s*([0-9]+)\.",
        r"md\"\s*#\s*([0-9]+)\.",
        r"(?m)^\s*#\s*([0-9]+)\.",
    ]
    for pattern in patterns
        m = match(pattern, text)
        m === nothing || return m.captures[1]
    end
    return nothing
end

function classify_shared_cells(cells, order_ids)
    # common start = cells before the first detected chapter heading
    # common end = shared helper/style/setup cells after the last chapter block
end
```

- [ ] **Step 2: Add a user prompt fallback for ambiguous notebooks**

```julia
function ask_user_for_chapters()
    println("Could not infer chapter boundaries.")
    println("Enter chapter headings to split, comma-separated:")
    readline() |> strip
end
```

- [ ] **Step 3: Validate chapter inference on the current notebook**

Run:
```bash
julia --project=. -e 'include("scripts/split_pluto_chapters.jl"); prefix, cells, order_ids = read_notebook("src/MATH102_NOTES.jl"); println(heading_chapter(cells[1].text))'
```
Expected: chapter detection works on real chapter heading cells and returns a chapter number.

- [ ] **Step 4: Commit the chapter inference logic**

```bash
git add scripts/split_pluto_chapters.jl
git commit -m "feat: infer chapter boundaries from Pluto headings"
```

### Task 3: Emit chapter notebooks with correct physical and execution order

**Files:**
- Modify: `scripts/split_pluto_chapters.jl`

- [ ] **Step 1: Add notebook writing with separate physical and execution order**

```julia
function write_notebook(output::String, prefix::AbstractString; physical_cells, execution_cells)
    body = join((normalize_generated_cell(cell.text) for cell in physical_cells), "\n\n") * "\n\n"
    write(output, String(prefix) * body * cell_order(execution_cells))
end
```

- [ ] **Step 2: Preserve the required common start and common end for each chapter**

```julia
physical_cells = vcat(common_start_cells, chapter_cells, common_end_cells, package_cells)
execution_cells = vcat(package_cells, common_start_cells, chapter_cells, common_end_cells)
```

- [ ] **Step 3: Generate all chapter notebooks for the current notebook without exporting**

Run:
```bash
julia --project=. scripts/split_pluto_chapters.jl --source src/MATH102_NOTES.jl
```
Expected: chapter notebooks are written to `src/` and no export step runs.

- [ ] **Step 4: Verify `Cell order` includes the package cells and shared CSS/setup cells**

Run:
```bash
Select-String -Path src\MATH_102_CH*.jl -Pattern "initialize_eqref|custom.css|TableOfContents|Cell order"
```
Expected: shared start and shared end cells are present in each generated chapter notebook.

- [ ] **Step 5: Commit the notebook writer**

```bash
git add scripts/split_pluto_chapters.jl src/MATH_102_CH*.jl
git commit -m "feat: generate standalone chapter notebooks"
```

### Task 4: Make the splitter reusable across courses

**Files:**
- Modify: `scripts/split_pluto_chapters.jl`
- Modify: `README.md`
- Modify: `AGENTS.md` only if workflow guidance changes

- [ ] **Step 1: Remove course-specific assumptions from the splitter**

```julia
function main(args)
    source = parse_source_arg(args)
    chapters = parse_chapter_spec(args)
    # no hard-coded MATH102 chapter IDs
end
```

- [ ] **Step 2: Add command-line options for source notebook and optional chapter list**

```julia
# Example usage:
# julia --project=. scripts/split_pluto_chapters.jl --source src/MATH102_NOTES.jl
# julia --project=. scripts/split_pluto_chapters.jl --source src/MATH201_NOTES.jl --chapters 5,7,8,9
```

- [ ] **Step 3: Update project notes with the reusable workflow**

Document:
- where to place source notebooks
- how chapter headings are inferred
- how to override ambiguous boundaries
- that export is a separate later step

- [ ] **Step 4: Commit the reusable CLI workflow**

```bash
git add scripts/split_pluto_chapters.jl README.md AGENTS.md
git commit -m "feat: make Pluto chapter splitter reusable"
```

### Task 5: Verify against the current notebook and a second course structure

**Files:**
- No code changes unless verification exposes a bug

- [ ] **Step 1: Run the splitter on the current notebook and inspect one generated chapter**

Run:
```bash
julia --project=. scripts/split_pluto_chapters.jl --source src/MATH102_NOTES.jl
```
Expected: chapter notebooks are generated and chapter 5 includes the shared start, chapter content, and shared end.

- [ ] **Step 2: Run the splitter on a second notebook shape if available**

Run:
```bash
julia --project=. scripts/split_pluto_chapters.jl --source src/MATH201_NOTES.jl
```
Expected: the same code path works without editing chapter UUID lists.

- [ ] **Step 3: Stop before export**

Expected: no `src/export.jl` invocation in this plan.

