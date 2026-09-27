try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# Markets

Two of the AgriDatasets tables follow crops to market: weekly avocado sales in the United States from
2017 to 2024, and coffee production by country in 2016 and 2017.
"""

#%% code id=setup
using AgriDatasets, DataFrames, Statistics, Dates, AgriViz

avo = load_dataset("avocado_us_sale")
avo.type = String.(avo.type)
avo.year = year.(avo.week_ending)
avo.week = week.(avo.week_ending)
kinds = ["Conventional", "Organic"]
prices = unstack(avo, :week_ending, :type, :avg_selling_price)
(weeks = nrow(prices), first = prices.week_ending[1], last = prices.week_ending[end],
 missing = count(ismissing, Matrix(prices[:, kinds])), years = sort(unique(avo.year)))

#%% md id=avo_head
@md"""
## Avocados

`avocado_us_sale` records each week's average selling price and units sold across the US, separately
for conventional and organic fruit.
"""

#%% code id=yearly
vol = unstack(avo, :week_ending, :type, :total_bulk_and_bags_units)
yearly = combine(groupby(transform(prices, :week_ending => ByRow(year) => :year), :year),
    :Conventional => (x -> round(mean(x); digits = 2)) => :conventional,
    :Organic => (x -> round(mean(x); digits = 2)) => :organic)
yearly.premium = round.(100 .* (yearly.organic ./ yearly.conventional .- 1); digits = 1)
share = combine(groupby(transform(vol, :week_ending => ByRow(year) => :year), :year),
    [:Conventional, :Organic] => ((c, o) -> round(100 * sum(o) / (sum(c) + sum(o)); digits = 1)) => :organic_share)
leftjoin(yearly, share; on = :year)

#%% md id=avocados
@md"""
By these yearly averages, organic avocados cost between {{ minimum(yearly.premium) }}% and
{{ maximum(yearly.premium) }}% more than conventional ones, and their share of the units sold grew from
{{ first(share.organic_share) }}% in 2017 to {{ last(share.organic_share) }}% in 2024.

Week by week, the two prices move together. The shaded band between them is the organic premium. It
stays open all through the eight years except for a few weeks in the autumn of 2017, when conventional
fruit briefly cost more. The breaks in the lines are weeks missing from the data, in December 2018 and
at the end of 2020.
"""

#%% code id=pricechart hidecode
# Weekly price per avocado for each kind. The band between the lines is the organic premium: an
# invisible base at the conventional price with the difference stacked on top (`stackStrategy = all`,
# since for a few weeks in 2017 conventional cost more). Weeks with no data break the lines.
function pts(y)
    out = Any[]
    for (i, (d, v)) in enumerate(zip(prices.week_ending, y))
        i > 1 && d - prices.week_ending[i - 1] > Day(8) && push!(out, [string(d - Day(7)), nothing])
        push!(out, [string(d), round(v; digits = 2)])
    end
    return out
end
kindline(k) = (type = :line, name = k, showSymbol = false, lineStyle = (width = 1.5,), z = 3,
               endLabel = (show = true, formatter = "{a}", distance = 6, fontSize = 12),
               data = pts(prices[!, k]))
band(name, y, style) = (type = :line, name = name, stack = "premium", stackStrategy = :all, showSymbol = false,
                        silent = true, lineStyle = (width = 0,), areaStyle = style, tooltip = (show = false,),
                        data = pts(y))

echart(;
    grid = (left = 48, right = 92, top = 36, bottom = 28),
    legend = (data = kinds, top = 0, icon = :roundRect, itemWidth = 14, itemHeight = 4),
    xAxis = (type = :time, splitLine = (show = false,)),
    yAxis = (type = :value, min = 0.6, max = 2.2, interval = 0.4, axisLabel = (formatter = "\${value}",),
             splitLine = (lineStyle = (opacity = 0.35,),)),
    tooltip = (trigger = :axis,),
    series = [band("base", prices.Conventional, (opacity = 0,)),
              band("premium", prices.Organic .- prices.Conventional, (opacity = 0.14,)),
              kindline("Conventional"), kindline("Organic")],
    height = 320,
    modes(m -> (series = [(silent = true,), (areaStyle = (color = INK[m].muted,),),
                          ((itemStyle = (color = c,), lineStyle = (color = c,), endLabel = (color = INK[m].secondary,))
                           for c in CATEGORICAL[m][1:2])...],))...,
)

#%% md id=season_head
@md"""
### Through the year

Averaging each month over the eight years separates the seasonal cycle from the year-to-year swings.
Pick a kind to compare its cycle with 2024.
"""

#%% code id=controls
@bind kind Radio(kinds, "Conventional"; label = "avocados")

#%% code id=seasons hidecode
# The price year by year, month by month: the band spans 2017–2024 (lowest to highest monthly
# average), the grey line is its median, and 2024 is drawn over it. The radio above picks the kind.
years = sort(unique(avo.year))
months = Dates.monthabbr.(1:12)
avg(v) = isempty(v) ? NaN : mean(v)          # a month the data skips (Dec 2018, Nov–Dec 2020)
monthly(k) = (r = avo[avo.type .== k, :];
              [avg(r.avg_selling_price[(r.year .== y) .& (month.(r.week_ending) .== m)]) for y in years, m in 1:12])
prof(k, f) = [round(f(filter(!isnan, c)); digits = 2) for c in eachcol(monthly(k))]
latest(k) = round.(monthly(k)[end, :]; digits = 2)
rangeband(name, y, style) = (type = :line, name = name, stack = "range", showSymbol = false, silent = true,
                             lineStyle = (width = 0,), areaStyle = style, tooltip = (show = false,), data = y)
profline(name, y, w) = (type = :line, name = name, symbol = :circle, symbolSize = 5, lineStyle = (width = w,), data = y)

echart(;
    grid = (left = 48, right = 48, top = 40, bottom = 28),
    legend = (data = [(name = "2017–2024 range", icon = :roundRect), "median", "2024"], top = 0,
              itemWidth = 14, itemHeight = 8),
    xAxis = (type = :category, data = months, boundaryGap = false),
    yAxis = (type = :value, min = 0.6, max = 2.2, interval = 0.4, axisLabel = (formatter = "\${value}",),
             splitLine = (lineStyle = (opacity = 0.35,),)),
    tooltip = (trigger = :axis,),
    series = [rangeband("low", @replay(kind, prof(kind, minimum)), (opacity = 0,)),
              rangeband("2017–2024 range", @replay(kind, prof(kind, maximum) .- prof(kind, minimum)), (opacity = 0.2,)),
              profline("median", @replay(kind, prof(kind, median)), 1.5),
              profline("2024", @replay(kind, latest(kind)), 2.5)],
    height = 320,
    modes(m -> (series = [(silent = true,),
                          (itemStyle = (color = INK[m].muted,), areaStyle = (color = INK[m].muted,)),
                          (itemStyle = (color = INK[m].secondary,), lineStyle = (color = INK[m].secondary,)),
                          (itemStyle = (color = CATEGORICAL[m][1],), lineStyle = (color = CATEGORICAL[m][1],))],))...,
)

#%% md id=season_read
@md raw"""
In a typical year, {{ lowercase(kind) }} avocados are cheapest in
{{ Dates.monthname(argmin(prof(kind, median))) }} ({{ "\$" }}{{ minimum(prof(kind, median)) }}) and dearest in
{{ Dates.monthname(argmax(prof(kind, median))) }} ({{ "\$" }}{{ maximum(prof(kind, median)) }}). In 2024 they sold
above that median in {{ count(latest(kind) .> prof(kind, median)) }} of the twelve months.
"""

#%% md id=coffee_head
@md"""
## Coffee

`coffee_production` gives the output of each producing country in 2016 and 2017. It comes from
spData's `coffee_data`, which does not state a unit, so the figures are best read for relative size
and change.
"""

#%% code id=coffee hidecode
# Coffee production in 2016 and 2017 for the fifteen largest producers, one row per country: the grey
# dot is 2016, the blue dot 2017, and the bar between them is the change. The bar is an invisible
# segment up to the smaller year stacked under a thin one spanning the difference.
cof = dropmissing(load_dataset("coffee_production"))
top = last(sort(cof, :coffee_production_2017), 15)
a, b = top.coffee_production_2016, top.coffee_production_2017
pct(c) = (r = only(eachrow(cof[cof.name_long .== c, :]));
          round(100 * (r.coffee_production_2017 / r.coffee_production_2016 - 1); digits = 1))
seg(name, y, w) = (type = :bar, name = name, stack = "change", barWidth = w, silent = true,
                   tooltip = (show = false,), data = y)
dot(name, y, s) = (type = :scatter, name = name, symbolSize = s, z = 3, data = y)

echart(;
    grid = (left = 132, right = 32, top = 36, bottom = 40),
    legend = (data = ["2016", "2017"], top = 0),
    xAxis = (type = :value, name = "production", nameLocation = :middle, nameGap = 26,
             splitLine = (lineStyle = (opacity = 0.35,),)),
    yAxis = (type = :category, data = String.(top.name_long), axisTick = (show = false,),
             axisLine = (show = false,)),
    tooltip = (trigger = :axis, axisPointer = (type = :shadow,)),
    series = [seg("from", min.(a, b), 2), seg("change", abs.(b .- a), 2),
              dot("2016", a, 9), dot("2017", b, 11)],
    height = 460,
    modes(m -> (series = [(itemStyle = (color = :transparent,),),
                          (itemStyle = (color = INK[m].axis,),),
                          (itemStyle = (color = INK[m].muted,),),
                          (itemStyle = (color = CATEGORICAL[m][1],),)],))...,
)

#%% md id=coffee_read
@md"""
Across the {{ nrow(cof) }} countries with figures for both years, production fell
{{ round(100 * (1 - sum(cof.coffee_production_2017) / sum(cof.coffee_production_2016)); digits = 1) }}%.
Brazil, by far the largest producer, fell {{ -pct("Brazil") }}% and Indonesia's output halved
({{ pct("Indonesia") }}%). Among the fifteen shown, Mexico ({{ "+" }}{{ pct("Mexico") }}%) and Ethiopia
({{ "+" }}{{ pct("Ethiopia") }}%) grew the most.
"""

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 83c9312b-cd15-4ccc-9eec-067fd59d3f3f
# ╚═╡
