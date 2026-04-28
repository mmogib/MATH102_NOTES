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
