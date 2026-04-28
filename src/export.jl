using PlutoSliderServer

const DOCS_DIR = "docs"

const NOTEBOOKS = [
    ("5", "MATH_102_CH5", "Chapter 5: Integration"),
    ("7", "MATH_102_CH7", "Chapter 7: Applications of Integration"),
    ("8", "MATH_102_CH8", "Chapter 8: Integration Techniques and Improper Integrals"),
    ("9", "MATH_102_CH9", "Chapter 9: Sequences and Series"),
]

function parse_chapter_list(raw::AbstractString)
    chapters = [strip(chapter) for chapter in split(raw, ",")]
    filter!(!isempty, chapters)
    isempty(chapters) && error("No chapter numbers were provided.")
    return unique(chapters)
end

function parse_args(args::Vector{String})
    chapters = nothing
    i = 1
    while i <= length(args)
        arg = args[i]
        if startswith(arg, "--ch=")
            chapters = parse_chapter_list(arg[6:end])
        elseif arg == "--ch"
            i += 1
            i > length(args) && error("--ch requires a comma-separated list, e.g. --ch=5,7.")
            chapters = parse_chapter_list(args[i])
        elseif arg in ("-h", "--help")
            println("Usage: julia --project=. src/export.jl [--ch=5,7]")
            println("If --ch is omitted, all chapter notebooks are exported.")
            exit(0)
        else
            error("Unknown argument: $arg")
        end
        i += 1
    end
    return chapters
end

function selected_notebooks(selected_chapters)
    selected = isnothing(selected_chapters) ? NOTEBOOKS : [entry for entry in NOTEBOOKS if entry[1] in selected_chapters]
    isempty(selected) && error("No notebooks matched the requested chapter filter.")
    return selected
end

function export_chapter_notebooks(notebooks)
    mkpath(DOCS_DIR)
    for (_, notebook_name, _) in notebooks
        notebook_path = joinpath("src", notebook_name * ".jl")
        PlutoSliderServer.export_notebook(notebook_path; Export_output_dir = DOCS_DIR)
    end
end

function write_landing_page(notebooks)
    links = join(
        [
            """
            <article class="chapter-card">
              <div class="chapter-label">Chapter $(chapter)</div>
              <a class="chapter-link" href="$(name).html">$(title)</a>
            </article>
            """
            for (chapter, name, title) in notebooks
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
          --ink: #1d2430;
          --muted: #5c6573;
          --paper: #f4f1e8;
          --card: rgba(255, 255, 255, 0.92);
          --accent: #0f766e;
          --accent-soft: rgba(15, 118, 110, 0.12);
        }
        * {
          box-sizing: border-box;
        }
        body {
          margin: 0;
          font-family: Georgia, "Times New Roman", serif;
          color: var(--ink);
          background:
            radial-gradient(circle at top left, rgba(15, 118, 110, 0.16), transparent 28rem),
            radial-gradient(circle at 90% 10%, rgba(220, 138, 47, 0.12), transparent 18rem),
            linear-gradient(135deg, #f8f5ee 0%, #eef2ef 100%);
        }
        main {
          max-width: 56rem;
          margin: 0 auto;
          padding: 4.5rem 1.25rem 5rem;
        }
        .card {
          background: var(--card);
          border: 1px solid rgba(31, 41, 51, 0.12);
          border-radius: 1.5rem;
          box-shadow: 0 1.5rem 4rem rgba(31, 41, 51, 0.12);
          padding: clamp(1.5rem, 4vw, 3rem);
          backdrop-filter: blur(12px);
        }
        h1 {
          margin: 0;
          font-size: clamp(2.4rem, 7vw, 4.75rem);
          line-height: 0.95;
          letter-spacing: -0.06em;
        }
        .lede {
          color: var(--muted);
          font-size: 1.15rem;
          line-height: 1.7;
          max-width: 42rem;
          margin: 1rem 0 0;
        }
        .meta {
          display: flex;
          flex-wrap: wrap;
          gap: 0.65rem;
          margin: 1.4rem 0 0;
        }
        .chip {
          display: inline-flex;
          align-items: center;
          border-radius: 999px;
          padding: 0.35rem 0.8rem;
          background: var(--accent-soft);
          color: var(--accent);
          font-size: 0.88rem;
          font-weight: 700;
          letter-spacing: 0.03em;
          text-transform: uppercase;
        }
        .chapter-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));
          gap: 0.95rem;
          margin: 2rem 0 0;
          padding: 0;
        }
        .chapter-card {
          border: 1px solid rgba(15, 118, 110, 0.18);
          border-radius: 1rem;
          padding: 1rem 1.05rem;
          background: rgba(15, 118, 110, 0.04);
          transition: transform 150ms ease, background 150ms ease, border-color 150ms ease;
        }
        .chapter-card:hover {
          transform: translateY(-2px);
          background: rgba(15, 118, 110, 0.09);
          border-color: rgba(15, 118, 110, 0.28);
        }
        .chapter-label {
          color: var(--muted);
          font-size: 0.82rem;
          letter-spacing: 0.08em;
          text-transform: uppercase;
        }
        .chapter-link {
          display: inline-block;
          margin-top: 0.35rem;
          color: var(--accent);
          font-size: 1.08rem;
          font-weight: 700;
          text-decoration: none;
        }
        .chapter-link:hover {
          text-decoration: underline;
        }
        .footer {
          margin-top: 1.5rem;
          color: var(--muted);
          font-size: 0.95rem;
        }
      </style>
    </head>
    <body>
      <main>
        <section class="card">
          <h1>MATH102<br>Calculus II</h1>
          <p class="lede">
            Course notes for MATH102, organized as standalone Pluto notebook exports.
            Select a chapter below to open the static notes.
          </p>
          <div class="meta">
            <span class="chip">Pluto exports</span>
            <span class="chip">Static notes</span>
            <span class="chip">$(length(notebooks)) $(length(notebooks) == 1 ? "chapter" : "chapters")</span>
          </div>
          <div class="chapter-grid">
            $(links)
          </div>
          <p class="footer">
            Each chapter opens as a standalone static notebook export.
          </p>
        </section>
      </main>
    </body>
    </html>
    """

    write(joinpath(DOCS_DIR, "index.html"), html)
end

function main(args=ARGS)
    selected_chapters = parse_args(args)
    notebooks = selected_notebooks(selected_chapters)
    export_chapter_notebooks(notebooks)
    write_landing_page(notebooks)
end

main()
