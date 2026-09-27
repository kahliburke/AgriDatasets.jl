"""
    AgriViz

The colour policy for the AgriDatasets notebooks: a validated data palette, stepped separately for
light and dark pages, and helpers that turn it into ECharts option fragments. A chart passes them as
`__light`/`__dark`, and Slate merges the one for the page's mode, so a figure is colour-blind-safe
and correct on either a light or a dark docs page.

The values are the reference data-viz palette: eight categorical slots in a fixed, CVD-validated
order, a one-hue blue ramp for magnitude, and a blue↔red diverging ramp around a neutral grey.

Only ECharts figures use this. A Makie figure in these notebooks would need the same values applied
as a Makie theme overlay (`set_theme!(slate_theme(), overlay)`) to match.
"""
module AgriViz

using Dates

export CATEGORICAL, SEQUENTIAL, DIVERGING, INK, series_color, modes
export fieldmap, dots, scatter, curve, bars, counts, dumbbell, suitability, valaxis, cataxis, column_summary

"Categorical slots, in the order they must be assigned (never cycled past 8)."
const CATEGORICAL = (
    light = ["#2a78d6", "#eb6834", "#1baf7a", "#eda100", "#e87ba4", "#008300", "#4a3aa7", "#e34948"],
    dark  = ["#3987e5", "#d95926", "#199e70", "#c98500", "#d55181", "#008300", "#9085e9", "#e66767"],
)

# The blue ramp, light → dark (steps 100 … 700).
const _BLUE = ["#cde2fb", "#b7d3f6", "#9ec5f4", "#86b6ef", "#6da7ec", "#5598e7", "#3987e5", "#2a78d6",
               "#256abf", "#1c5cab", "#184f95", "#104281", "#0d366b"]

"""
Sequential ramp, low → high. On a light page low values sit near the surface (light) and high ones are
dark; on a dark page the same steps run the other way, so low values still recede into the surface.
"""
const SEQUENTIAL = (light = _BLUE, dark = reverse(_BLUE[3:end]))

"""
Diverging ramp, negative → positive: red arm, neutral grey midpoint, blue arm. The midpoint is a
grey that still shows against the page, so an average plot reads as present but unremarkable.
"""
const DIVERGING = (
    light = ["#b83030", "#e34948", "#ec9796", "#d6d5ce", "#86b6ef", "#2a78d6", "#1c5cab"],
    dark  = ["#f29b9a", "#e66767", "#9a3a3a", "#383835", "#1c5cab", "#3987e5", "#86b6ef"],
)

"Ink for text that must not take a series colour, and hairlines."
const INK = (
    light = (primary = "#0b0b0b", secondary = "#52514e", muted = "#898781", grid = "#e1e0d9", axis = "#c3c2b7"),
    dark  = (primary = "#ffffff", secondary = "#c3c2b7", muted = "#898781", grid = "#2c2c2a", axis = "#383835"),
)

"The colour of categorical slot `i` in `mode` (`:light` or `:dark`)."
series_color(i::Integer, mode::Symbol) = getfield(CATEGORICAL, mode)[i]

"""
    modes(f) -> NamedTuple

`(__light = f(:light), __dark = f(:dark))`, to splat into an `echart` call or merge into an option:
`echart(:line, x, y; modes(m -> (color = CATEGORICAL[m][1:2],))...)`.
"""
modes(f) = (__light = f(:light), __dark = f(:dark))

include("charts.jl")

end
