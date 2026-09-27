try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# Field trials

No two plots in a field yield the same, even when they are sown with the same seed and treated the
same way. Soil, water and slope vary across the ground, and an experiment has to be laid out with
that variation in mind. A **uniformity trial** measures it directly: the whole field is grown as one
crop, harvested in a grid of small plots, and each plot's yield recorded.

This notebook maps four such trials from AgriDatasets: grape, peach, tomato and apple. Each plot is
coloured by how far its yield sits above or below the field's mean. Merging neighbouring plots into
larger ones averages the patchiness out, and the slider below shows how quickly.
"""

#%% code id=setup
using AgriDatasets, DataFrames, Statistics, AgriViz

trials = ["grape_uniformity" => "Grape", "peach_uniformity" => "Peach",
          "tomato_uniformity" => "Tomato", "apple_uniformity" => "Apple"]

# A trial as a matrix of yields, one entry per plot: `row` down the field, `col` across it. A plot
# with no recorded yield is NaN, and is left out of every average below.
function yield_grid(df)
    z = fill(NaN, maximum(df.row), maximum(df.col))
    for r in eachrow(df)
        z[r.row, r.col] = coalesce(r.yield, NaN)
    end
    return z
end

fields = Dict(label => yield_grid(load_dataset(name)) for (name, label) in trials)
[(field = k, size = size(v), missing = count(isnan, v)) for (k, v) in fields]

#%% code id=merging
nanmean(x) = (v = filter(!isnan, x); isempty(v) ? NaN : mean(v))

# Merge plots into k×k blocks. Every plot takes its block's mean, so the field keeps its shape and a
# larger plot shows as a patch of one colour.
function merged(z, k)
    nr, nc = size(z)
    block(i, n) = ((i - 1) ÷ k * k + 1):min(((i - 1) ÷ k + 1) * k, n)
    return [isnan(z[i, j]) ? NaN : nanmean(z[block(i, nr), block(j, nc)]) for i in 1:nr, j in 1:nc]
end

# Each plot's yield as a percentage above or below the field mean.
deviation(z, k) = round.(100 .* (merged(z, k) ./ nanmean(z) .- 1); digits = 1)

#%% code id=controls
@bind plotsize Slider(1:4; default = 1, label = "plots merged per side")

#%% code id=maps hidecode
# Colour classes: how far a plot's yield sits from its field's mean, in %. Grey is "about average".
bands = [(lt = -30, label = "< −30%"), (gte = -30, lt = -15, label = "−30…−15"), (gte = -15, lt = -5, label = "−15…−5"),
         (gte = -5, lte = 5, label = "±5"), (gt = 5, lte = 15, label = "5…15"), (gt = 15, lte = 30, label = "15…30"),
         (gt = 30, label = "> 30%")]

# Small multiples on one scale. The tomato field (6 rows × 30) is turned on its side so all four
# stand upright in a row; every plot is drawn the same size, as a tile with a gap around it. The
# whole figure fits in 500px, the width of a docs page's content column.
order = ["Grape", "Peach", "Apple", "Tomato"]
upright(f) = f == "Tomato" ? permutedims(fields[f]) : fields[f]
cells(f, k) = (d = deviation(upright(f), k); [[j - 1, i - 1, d[i, j]] for i in axes(d, 1) for j in axes(d, 2)])

px, gap, left0, top = 12, 40, 12, 64
dims = [size(upright(f)) for f in order]
widths = [c * px for (_, c) in dims]
heights = [r * px for (r, _) in dims]
lefts = left0 .+ cumsum([0; (widths .+ gap)[1:end-1]])
hidden(i, n) = (gridIndex = i - 1, type = :category, data = string.(1:n), show = false)
plots(f) = (n = count(!isnan, fields[f]); "$n plots")

echart(;
    title = [(text = order[i], subtext = plots(order[i]), left = lefts[i] + widths[i] ÷ 2, top = 12,
              textAlign = :center, itemGap = 4, textStyle = (fontSize = 13, fontWeight = :normal),
              subtextStyle = (fontSize = 11,)) for i in 1:4],
    grid = [(left = lefts[i], top = top, width = widths[i], height = heights[i]) for i in 1:4],
    xAxis = [hidden(i, dims[i][2]) for i in 1:4],
    yAxis = [(hidden(i, dims[i][1])..., inverse = true) for i in 1:4],
    tooltip = (trigger = :item, formatter = "{a}<br/>{@[2]}% from the field mean"),
    visualMap = (type = :piecewise, pieces = bands, dimension = 2, seriesIndex = 0:3,
                 orient = :horizontal, left = left0, bottom = 4, itemWidth = 12, itemHeight = 12,
                 itemGap = 8, itemSymbol = :roundRect, textStyle = (fontSize = 11,)),
    series = [(type = :scatter, name = order[i], xAxisIndex = i - 1, yAxisIndex = i - 1,
               symbol = :roundRect, symbolSize = px - 2, emphasis = (scale = 1.3,),
               data = @replay(plotsize, cells(order[i], plotsize))) for i in 1:4],
    height = top + maximum(heights) + 52,
    modes(m -> (visualMap = (pieces = [(color = c,) for c in DIVERGING[m]],),))...,
)

#%% md id=law_intro
@md"""
## How big should a plot be?

Larger plots average out more of the ground under them, so they differ from each other less. H. Fairfield
Smith found in 1938 that the variance between plots falls as a power of their size, V(x) = V₁ / xᵇ, where
x is the plot size in basic plots. The exponent says how the field varies. Near 1, neighbouring plots are
independent and merging keeps paying off. Near 0, neighbours rise and fall together, because the variation
comes from broad gradients across the field that no plot size can average away.

The coefficient of variation (CV) below is measured on whole blocks only, and b is fitted to the four
sizes.
"""

#%% code id=smith
# Variability of the merged plots, as a coefficient of variation (%). Only whole k×k blocks count: a
# strip left over at an edge would be a smaller plot, measured at the wrong size.
function cv(z, k)
    nr, nc = size(z)
    means = [nanmean(z[(i - 1) * k .+ (1:k), (j - 1) * k .+ (1:k)]) for i in 1:nr ÷ k, j in 1:nc ÷ k]
    m = filter(!isnan, vec(means))
    return 100 * std(m) / mean(m)
end

# Smith's law: V(x) = V₁ / xᵇ for plots x times the basic size. On log axes that is a straight line of
# slope -b, fitted here by least squares.
sizes = 1:4
function smith(z)
    x, v = log.(sizes .^ 2), log.([cv(z, k)^2 for k in sizes])
    b = -sum((x .- mean(x)) .* (v .- mean(v))) / sum((x .- mean(x)) .^ 2)
    return round(b; digits = 2)
end

[(field = f, (Symbol("CV $k×$k") => round(cv(fields[f], k); digits = 1) for k in sizes)...,
  b = smith(fields[f])) for f in order]

#%% code id=lawchart hidecode
# One line per field, CV against plot area on log axes, named at its right end. Grape, apple and
# tomato finish close together, so their names are spread apart. The dot on each line follows the slider.
spread = Dict("Tomato" => -8, "Apple" => -3, "Grape" => 10)
cv1(f, k) = round(cv(fields[f], k); digits = 1)
line(f) = (type = :line, name = f, symbol = :circle, symbolSize = 7, lineStyle = (width = 2,),
           endLabel = (show = true, formatter = "{a}", distance = 8, offset = [0, get(spread, f, 0)],
                       fontSize = 12, textBorderWidth = 0),
           data = [[k^2, cv1(f, k)] for k in sizes])
chosen(f) = (type = :scatter, symbolSize = 13, z = 5, tooltip = (show = false,),
             data = @replay(plotsize, [[plotsize^2, cv1(f, plotsize)]]))
logaxis(name, lo, hi) = (type = :log, logBase = 2, min = lo, max = hi, name = name,
                         nameLocation = :middle, splitLine = (lineStyle = (opacity = 0.35,),))

echart(;
    grid = (left = 64, right = 72, top = 48, bottom = 56),
    legend = (data = order, top = 4, icon = :roundRect, itemWidth = 14, itemHeight = 4),
    xAxis = (logaxis("plot size, in basic plots", 1, 16)..., nameGap = 32),
    yAxis = (logaxis("CV between plots (%)", 8, 48)..., nameGap = 36),
    tooltip = (trigger = :item, formatter = "{a}<br/>{@[0]} plots merged: CV {@[1]}%"),
    series = [[line(f) for f in order]; [chosen(f) for f in order]],
    height = 360,
    modes(m -> (series = [(itemStyle = (color = c,), lineStyle = (color = c,),
                           endLabel = (color = INK[m].secondary,))
                          for c in repeat(CATEGORICAL[m][1:4], 2)],))...,
)

#%% md id=reading
@md"""
With plots of **{{ plotsize }} × {{ plotsize }}** ({{ plotsize^2 }} basic plots each), the CV between
plots is {{ cv1("Grape", plotsize) }}% for grape, {{ cv1("Peach", plotsize) }}% for peach,
{{ cv1("Apple", plotsize) }}% for apple and {{ cv1("Tomato", plotsize) }}% for tomato.

Grape starts out the most variable and falls fastest (b = {{ smith(fields["Grape"]) }}): its plots vary
almost independently, so merging them works. Peach (b = {{ smith(fields["Peach"]) }}) barely improves
past four basic plots. Its map shows why, with whole bands of the field above or below average.
"""

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 02209b38-7118-4bee-9c0b-a71d9fb804ad
# ╚═╡
