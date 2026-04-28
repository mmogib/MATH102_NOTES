include(joinpath(@__DIR__, "split_pluto_chapters.jl"))

function main()
    split_pluto_chapters(
        source=joinpath(ROOT, "src", "MATH102_NOTES.jl"),
        output_dir=joinpath(ROOT, "src"),
        output_prefix="MATH_102",
    )
end

main()
