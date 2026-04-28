const ROOT = normpath(joinpath(@__DIR__, ".."))
const SOURCE = joinpath(ROOT, "src", "MATH102_NOTES.jl")
const OUT_DIR = joinpath(ROOT, "src")
const CELL_ORDER_START = "# ╔═╡ Cell order:"
const UUID_PATTERN = "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"
const CELL_MARKER_RE = Regex("^# ([╔╠╟]═[╡╪─]) (" * UUID_PATTERN * ")\\s*\$", "m")
const CELL_ORDER_RE = Regex("^# ([╠╟][═─])(" * UUID_PATTERN * ")\\s*\$", "m")
const CHAPTERS = [
    ("5", "MATH_102_CH5.jl"),
    ("7", "MATH_102_CH7.jl"),
    ("8", "MATH_102_CH8.jl"),
    ("9", "MATH_102_CH9.jl"),
]

struct Cell
    id::String
    marker_prefix::String
    text::String
end

function split_cells(body::AbstractString)
    matches = collect(eachmatch(CELL_MARKER_RE, body))
    isempty(matches) && error("No Pluto cells found in $SOURCE")

    cells = Cell[]
    for (index, regex_match) in pairs(matches)
        start_index = regex_match.offset
        end_index = index < length(matches) ? prevind(body, matches[index + 1].offset) : lastindex(body)
        cell_text = rstrip(body[start_index:end_index]) * "\n"
        push!(cells, Cell(regex_match.captures[2], regex_match.captures[1], cell_text))
    end
    return cells
end

function read_notebook()
    text = read(SOURCE, String)
    parts = split(text, CELL_ORDER_START; limit=2)
    length(parts) == 2 || error("Missing Pluto Cell order section.")

    body, order_text = parts
    cells = split_cells(body)
    order_ids = [regex_match.captures[2] for regex_match in eachmatch(CELL_ORDER_RE, order_text)]
    isempty(order_ids) && error("No cell IDs found in Pluto Cell order section.")
    return cells, order_ids
end

function heading_chapter(text::String)
    patterns = [
        r"md\"\"\"[\s\r\n]*#\s*([5789])\.",
        r"md\"\s*#\s*([5789])\.",
        r"(?m)^\s*#\s*([5789])\.",
    ]

    for pattern in patterns
        regex_match = match(pattern, text)
        regex_match === nothing || return regex_match.captures[1]
    end
    return nothing
end

function choose_preamble(cells, first_chapter_cell_id::String)
    preamble = Cell[]
    for cell in cells
        cell.id == first_chapter_cell_id && break
        push!(preamble, cell)
    end
    return preamble
end

function assign_chapter_cells(cells, preamble_ids)
    assigned = Dict(chapter => Cell[] for (chapter, _) in CHAPTERS)
    active = nothing

    for cell in cells
        cell.id in preamble_ids && continue
        chapter = heading_chapter(cell.text)
        if chapter !== nothing && haskey(assigned, chapter)
            active = chapter
        end
        active === nothing || push!(assigned[active], cell)
    end

    for (chapter, _) in CHAPTERS
        isempty(assigned[chapter]) && error("No cells assigned to Chapter $chapter.")
    end
    return assigned
end

function cell_order(cells)
    lines = [CELL_ORDER_START]
    for cell in cells
        # Pluto's cell order uses ╠═ for code-like cells and ╟─ for markdown-like cells.
        order_prefix = startswith(cell.marker_prefix, "╟") ? "╟─" : "╠═"
        push!(lines, "# $(order_prefix)$(cell.id)")
    end
    return join(lines, "\n") * "\n"
end

function write_notebook(filename::String, cells)
    output = joinpath(OUT_DIR, filename)
    header = "### A Pluto.jl notebook ###\n# v0.20.24\n\nusing Markdown\nusing InteractiveUtils\n\n"
    body = join((rstrip(cell.text) for cell in cells), "\n") * "\n\n"
    write(output, header * body * cell_order(cells))
    println("Wrote ", relpath(output, ROOT), " with ", length(cells), " cells")
end

function main()
    cells, order_ids = read_notebook()
    cells_by_id = Dict(cell.id => cell for cell in cells)
    ordered_cells = [cells_by_id[id] for id in order_ids if haskey(cells_by_id, id)]

    first_ch5 = nothing
    for cell in ordered_cells
        if heading_chapter(cell.text) == "5"
            first_ch5 = cell.id
            break
        end
    end
    first_ch5 === nothing && error("Could not find first Chapter 5 cell.")

    preamble = choose_preamble(ordered_cells, first_ch5)
    assigned = assign_chapter_cells(ordered_cells, Set(cell.id for cell in preamble))

    for (chapter, filename) in CHAPTERS
        write_notebook(filename, vcat(preamble, assigned[chapter]))
    end
end

main()
