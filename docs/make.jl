using Documenter, DocumenterVitepress, DocumenterSlate
using AgriDatasets

const REPO = "github.com/kahliburke/AgriDatasets.jl"

# Pages that place a notebook render it through Slate: the hub running on this machine, or, in CI,
# a Kaimon host the build starts. The rendered bundles land in `docs/slate/` (git-ignored).
datasets = sort!(["datasets/$f" for f in readdir(joinpath(@__DIR__, "src", "datasets")) if endswith(f, ".md")])

makedocs(;
    sitename = "AgriDatasets.jl",
    modules = [AgriDatasets],
    repo = Remotes.GitHub("kahliburke", "AgriDatasets.jl"),
    format = MarkdownVitepress(; repo = REPO, devbranch = "main", devurl = "dev"),
    plugins = [SlateDocs()],
    pages = [
        "Home" => "index.md",
        "Guide" => "guide.md",
        "Stories" => ["Field trials" => "field_trials.md", "Markets" => "markets.md"],
        "Datasets" => datasets,
    ],
)

DocumenterVitepress.deploydocs(; repo = REPO, target = joinpath(@__DIR__, "build"),
                               branch = "gh-pages", devbranch = "main", push_preview = true)
