# Chart builders for the dataset gallery. Each returns the keyword arguments of an `echart` call,
# colours included for both page modes: `echart(; dots(df, :gen, :yield)...)`. They take a table
# by column name and need nothing from it beyond `df[!, col]`.

const _SPLIT = (lineStyle = (opacity = 0.35,),)
const _CONTENT_WIDTH = 520            # a docs page's content column, less the chart's own margins

_label(c) = replace(string(c), '_' => ' ')
_present(v) = !(v === missing || (v isa AbstractFloat && isnan(v)))
_num(v) = v isa AbstractFloat ? round(v; sigdigits = 4) : v
_text(v) = (x = _num(v); x isa AbstractFloat && isinteger(x) ? string(Int(x)) : string(x))

valaxis(name; kw...) = (type = :value, name = _label(name), nameLocation = :middle, nameGap = 30, scale = true,
                        splitLine = _SPLIT, kw...)
cataxis(name, cats; kw...) = (type = :category, name = _label(name), nameLocation = :middle, nameGap = 30,
                              data = cats, axisTick = (show = false,), kw...)

# Text as a plain `String`: a column's strings can be another `AbstractString` type, which must not
# reach the chart option.
_s(x) = String(string(x))
_key(x) = x isa AbstractString ? _s(x) : x

# A sort key that orders "T2" before "T10": runs of digits compare as numbers.
_natural(s) = [(d = tryparse(Int, m.match)) === nothing ? (1, 0, String(m.match)) : (0, d, "")
               for m in eachmatch(r"\d+|\D+", _s(s))]

# Levels of a column in a sensible order: numbers numerically, anything else as first seen.
function _levels(v)
    u = unique(filter(_present, v))
    return all(x -> x isa Number, u) ? sort(u) : _s.(u)
end

# The legend for colours by `group`, titled with the group's column name so a reader knows what
# "A, B, C" are levels of. The title is a `title` component, which takes the page's text colour.
function _legend(group, names)
    length(names) > 1 || return (;)
    t = _label(group)
    return (title = (text = t, left = 12, top = 0, textStyle = (fontSize = 12, fontWeight = :bold)),
            legend = (data = names, top = 0, left = 24 + 7 * length(t), icon = :circle, itemWidth = 10, itemHeight = 10))
end
_names(df, group, groups) = group === nothing ? [nothing] : [g isa Number ? _text(g) : _s(g) for g in groups]
_colors(n) = modes(m -> (color = getfield(CATEGORICAL, m)[1:min(n, 8)],))

"""
    fieldmap(df, col, row, value; label = nothing)

A field laid out as it was planted: one tile per plot at its row and column, shaded by `value` on the
sequential ramp. `label` names a column (a treatment) whose text is written on each tile.
"""
function fieldmap(df, col, row, value; label = nothing)
    cs, rs = _levels(df[!, col]), _levels(df[!, row])
    px = clamp(min(_CONTENT_WIDTH ÷ length(cs), 440 ÷ length(rs)), 8, 24)
    fits = label !== nothing && px >= 6 * maximum(length ∘ _s, filter(_present, df[!, label])) + 6
    vals = filter(_present, df[!, value])
    pts = [Any[_s(c), _s(r), _num(v), label === nothing ? "" : _s(l)]
           for (c, r, v, l) in zip(df[!, col], df[!, row], df[!, value],
                                   label === nothing ? df[!, value] : df[!, label]) if _present(v)]
    w, h = px * length(cs), px * length(rs)
    return (
        grid = (left = 44, top = 16, width = w, height = h),
        xAxis = cataxis(col, _s.(cs); position = :top, nameLocation = :middle, nameGap = 22,
                        axisLine = (show = false,), axisLabel = (fontSize = 10,)),
        yAxis = cataxis(row, _s.(rs); inverse = true, nameGap = 28, axisLine = (show = false,),
                        axisLabel = (fontSize = 10,)),
        tooltip = (trigger = :item, formatter = label === nothing ?
            "$(_label(row)) {@[1]}, $(_label(col)) {@[0]}<br/>$(_label(value)): {@[2]}" :
            "$(_label(row)) {@[1]}, $(_label(col)) {@[0]}<br/>$(_label(label)) {@[3]} · $(_label(value)) {@[2]}"),
        visualMap = (type = :continuous, dimension = 2, min = minimum(vals), max = maximum(vals),
                     orient = :horizontal, left = 44, top = h + 40, itemWidth = 10, itemHeight = min(w, 200),
                     text = [_text(maximum(vals)), _label(value) * "  " * _text(minimum(vals))],
                     textGap = 8),
        series = [(type = :scatter, symbol = :roundRect, symbolSize = px - 2, data = pts,
                   label = (show = fits, formatter = "{@[3]}", fontSize = 9),
                   emphasis = (scale = 1.2,))],
        height = h + 76,
        modes(m -> (visualMap = (inRange = (color = getfield(SEQUENTIAL, m),),),
                    series = [(label = (color = getfield(INK, m).primary,),)]))...,
    )
end

"""
    dots(df, cat, value; group = nothing, horizontal = nothing)

Every observation of `value` as a dot against its level of `cat`, with a bar at each level's mean.
Up to six named levels keep their order (numbered ones by number, others as the table lists them);
more are ranked by their mean. Numeric levels (a dose, a spacing) keep their order. `group` colours the dots by a second factor. Levels run down the page when there are
many of them or their names are long.
"""
function dots(df, cat, value; group = nothing, horizontal = nothing)
    cats = _levels(df[!, cat])
    mean_of(c) = (v = [x for (k, x) in zip(df[!, cat], df[!, value]) if _key(k) == c && _present(x)];
                  isempty(v) ? NaN : sum(v) / length(v))
    # A few levels read best in their own order: numbered ones (L0 < L1 < L2) by number, others as the
    # table lists them ("Before", "After"). Many are easier to scan ranked by their mean.
    if !all(c -> c isa Number, cats)
        cats = length(cats) > 6 ? sort(cats; by = c -> -mean_of(c)) :
               all(c -> occursin(r"\d", _s(c)), cats) ? sort(cats; by = _natural) : cats
    end
    horiz = something(horizontal, length(cats) > 6 || maximum(length ∘ string, cats) > 12)
    horiz && (cats = reverse(cats))                 # largest at the top
    idx = Dict(c => i - 1 for (i, c) in enumerate(cats))
    groups = group === nothing ? [nothing] : _levels(df[!, group])
    # A little deterministic jitter across the level's band, so repeated values stay visible.
    jit(i) = 0.28 * (((i * 0.618034) % 1) - 0.5)
    function pts(g)
        out = Any[]
        for (i, (k, x)) in enumerate(zip(df[!, cat], df[!, value]))
            (_present(x) && _present(k) && (g === nothing || _key(df[i, group]) == g)) || continue
            p = idx[k] + jit(i)
            push!(out, horiz ? [_num(x), p, _s(k)] : [p, _num(x), _s(k)])
        end
        out
    end
    means = [horiz ? [_num(mean_of(c)), idx[c]] : [idx[c], _num(mean_of(c))] for c in cats]
    pos = (type = :value, min = -0.5, max = length(cats) - 0.5, interval = 1, splitLine = (show = false,),
           axisLabel = (show = false,), axisTick = (show = false,), axisLine = (show = false,))
    # Level names run down the left when horizontal, so the axis name goes above them there.
    above = horiz ? (nameLocation = :end, nameGap = 10, nameTextStyle = (align = :right,)) : (;)
    cax = cataxis(cat, _s.(cats); above..., boundaryGap = true, axisLine = (show = false,),
                  splitLine = (show = true, lineStyle = (opacity = 0.2,)))
    vax = horiz ? valaxis(value) : (valaxis(value)..., nameGap = 44)
    n = length(groups)
    names = _names(df, group, groups)
    return (
        grid = horiz ? (left = 16, right = 24, top = n > 1 ? 56 : 32, bottom = 44, containLabel = true) :
                       (left = 48, right = 16, top = n > 1 ? 36 : 16, bottom = 44, containLabel = true),
        _legend(group, names)...,
        xAxis = horiz ? [vax] : [cax, (pos..., position = :bottom)],
        yAxis = horiz ? [cax, (pos..., position = :left)] : [vax],
        tooltip = (trigger = :item, formatter = horiz ? "{@[2]}: {@[0]}" : "{@[2]}: {@[1]}"),
        series = [[(type = :scatter, name = something(nm, _label(value)), symbolSize = 8,
                    itemStyle = (opacity = 0.8,), (horiz ? (yAxisIndex = 1,) : (xAxisIndex = 1,))...,
                    data = pts(g)) for (g, nm) in zip(groups, names)];
                  [(type = :scatter, name = "mean", symbol = :rect, symbolSize = horiz ? [3, 20] : [20, 3], z = 4,
                    silent = true, (horiz ? (yAxisIndex = 1,) : (xAxisIndex = 1,))..., data = means)]],
        height = horiz ? max(200, 72 + 28 * length(cats) + (n > 1 ? 20 : 0)) : 340,
        modes(m -> (color = getfield(CATEGORICAL, m)[1:min(n, 8)],
                    series = [fill((;), n); [(itemStyle = (color = getfield(INK, m).primary,),)]]))...,
    )
end

"""
    scatter(df, x, y; group = nothing, logx = false, logy = false, bubbles = false, size = 8)

`y` against `x`, one colour per level of `group`. With `bubbles`, points that repeat (counts, scores)
are drawn once, sized by how many there are.
"""
function scatter(df, x, y; group = nothing, logx = false, logy = false, bubbles = false, size = 8)
    groups = group === nothing ? [nothing] : _levels(df[!, group])
    raw(g) = [[_num(a), _num(b)] for (i, (a, b)) in enumerate(zip(df[!, x], df[!, y]))
              if _present(a) && _present(b) && (g === nothing || _key(df[i, group]) == g)]
    function pts(g)
        p = raw(g)
        bubbles || return p
        u = unique(p)
        return [(value = q, symbolSize = round(size * sqrt(count(==(q), p)); digits = 1)) for q in u]
    end
    ax(name, lg) = lg ? (valaxis(name)..., type = :log) : valaxis(name)
    n = length(groups)
    names = _names(df, group, groups)
    return (
        grid = (left = 48, right = 24, top = n > 1 ? 36 : 16, bottom = 44, containLabel = true),
        _legend(group, names)...,
        xAxis = ax(x, logx), yAxis = (ax(y, logy)..., nameGap = 44),
        tooltip = (trigger = :item, formatter = (n > 1 ? "{a}<br/>" : "") * "$(_label(x)) {@[0]}<br/>$(_label(y)) {@[1]}"),
        series = [(type = :scatter, name = something(nm, _label(y)), symbolSize = size,
                   itemStyle = (opacity = 0.75,), data = pts(g)) for (g, nm) in zip(groups, names)],
        height = 360,
        _colors(n)...,
    )
end

"""
    curve(df, x, y; group = nothing, xtype = :value, logx = false, area = false, symbols = true)

`y` along `x` as a line per level of `group`, points marked: a dose-response, a growth curve, a
series over time (`xtype = :time` for dates, `:category` for named periods kept in table order).
"""
function curve(df, x, y; group = nothing, xtype = :value, logx = false, area = false, symbols = true)
    groups = group === nothing ? [nothing] : _levels(df[!, group])
    fmt(a) = a isa Number ? _num(a) : _s(a)
    function pts(g)
        p = [[fmt(a), _num(b)] for (i, (a, b)) in enumerate(zip(df[!, x], df[!, y]))
             if _present(a) && _present(b) && (g === nothing || _key(df[i, group]) == g)]
        xtype === :category ? p : sort!(p; by = first)
    end
    xax = xtype === :value ? (valaxis(x)..., (logx ? (type = :log, logBase = 2) : (;))...) :
          xtype === :category ? cataxis(x, unique(fmt.(filter(_present, df[!, x])))) :
          (type = xtype, name = _label(x), nameLocation = :middle, nameGap = 30)
    n = length(groups)
    names = _names(df, group, groups)
    return (
        grid = (left = 48, right = n > 1 ? 72 : 24, top = n > 1 ? 36 : 16, bottom = 44, containLabel = true),
        _legend(group, names)...,
        xAxis = xax,
        yAxis = (valaxis(y)..., nameGap = 44),
        tooltip = (trigger = :axis,),
        series = [(type = :line, name = something(nm, _label(y)), showSymbol = symbols, symbolSize = 6,
                   lineStyle = (width = 2,), (area ? (areaStyle = (opacity = 0.12,),) : (;))...,
                   endLabel = (show = n > 1, formatter = "{a}", fontSize = 11), data = pts(g))
                  for (g, nm) in zip(groups, names)],
        height = 340,
        modes(m -> (color = getfield(CATEGORICAL, m)[1:min(n, 8)],
                    series = fill((endLabel = (color = getfield(INK, m).secondary,),), n)))...,
    )
end

"""
    bars(labels, values; name = "", horizontal = true)

One bar per label, longest first.
"""
function bars(labels, values; name = "", horizontal = true)
    o = sortperm(values; rev = !horizontal)
    labs, vals = _s.(labels[o]), _num.(values[o])
    cax, vax = cataxis("", labs; axisLine = (show = false,)), (valaxis(name)..., scale = false)
    return (
        grid = (left = 16, right = 32, top = 12, bottom = 40, containLabel = true),
        xAxis = horizontal ? vax : cax, yAxis = horizontal ? cax : vax,
        tooltip = (trigger = :axis, axisPointer = (type = :shadow,)),
        series = [(type = :bar, name = name, barWidth = "55%", itemStyle = (borderRadius = horizontal ? [0, 4, 4, 0] : [4, 4, 0, 0],),
                   data = vals)],
        height = horizontal ? 60 + 24 * length(labs) : 340,
        _colors(1)...,
    )
end

"""
    suitability(df)

A land-suitability table (ALUES) as one ruler per factor: the classes N, S3, S2, S1 and back out, each
band as wide as the next, with the factor's thresholds written at the band edges. Factors with only a
lower (or upper) limit end in S1.
"""
function suitability(df)
    rows = collect(eachrow(df))
    classes = ["N", "S3", "S2", "S1", "S2", "S3", "N"]
    edges = [:s3_a, :s2_a, :s1_a, :s1_b, :s2_b, :s3_b]
    twosided(r) = _present(r.s1_b)
    # Segment k (1..7) of row r: its width, and the threshold written at its left edge.
    function seg(r, k)
        two = twosided(r)
        (!two && k > 4) && return (value = 0, label = (show = false,))
        w = (!two && k == 4) ? 1.4 : 1
        edge = k == 1 ? nothing : getproperty(r, edges[k - 1])
        lab = edge === nothing || !_present(edge) ? (show = false,) :
              (show = true, formatter = _text(edge), position = [0, -14], align = :center, fontSize = 10)
        return (value = w, label = lab)
    end
    codes = [_s(r.code) for r in rows]
    return (
        grid = (left = 16, right = 24, top = 36, bottom = 8, containLabel = true),
        legend = (data = ["S1", "S2", "S3", "N"], top = 0, icon = :roundRect, itemWidth = 14, itemHeight = 10),
        xAxis = (type = :value, show = false, max = 7),
        yAxis = (type = :category, data = reverse(codes), axisTick = (show = false,), axisLine = (show = false,)),
        tooltip = (show = false,),
        series = [(type = :bar, name = classes[k], stack = "ruler", barWidth = 12, silent = true,
                   data = [seg(r, k) for r in reverse(rows)]) for k in 1:7],
        height = 56 + 40 * length(rows),
        modes(m -> (series = [(itemStyle = (color = _classcolor(m, c),), label = (color = getfield(INK, m).secondary,))
                              for c in classes],))...,
    )
end

function _classcolor(m, c)
    s = getfield(SEQUENTIAL, m)
    c == "N" && return getfield(INK, m).grid
    i = Dict("S3" => 0.3, "S2" => 0.6, "S1" => 1.0)[c]
    return s[clamp(round(Int, i * length(s)), 1, length(s))]
end

"""
    dumbbell(labels, a, b; names = ("before", "after"), top = 15)

Two values per label as a pair of dots joined by a bar: the first muted, the second in colour. The
`top` labels by their second value are shown, largest at the top.
"""
function dumbbell(labels, a, b; names = ("before", "after"), top = 15)
    keep = [i for i in eachindex(a) if _present(a[i]) && _present(b[i])]
    o = keep[sortperm(b[keep])][max(1, end - top + 1):end]
    x, y = _num.(a[o]), _num.(b[o])
    seg(name, v, w) = (type = :bar, name = name, stack = "change", barWidth = w, silent = true,
                       tooltip = (show = false,), data = v)
    return (
        grid = (left = 16, right = 32, top = 36, bottom = 16, containLabel = true),
        legend = (data = collect(string.(names)), top = 0),
        xAxis = (type = :value, splitLine = _SPLIT),
        yAxis = cataxis("", _s.(labels[o]); axisLine = (show = false,)),
        tooltip = (trigger = :axis, axisPointer = (type = :shadow,)),
        series = [seg("from", min.(x, y), 2), seg("change", abs.(y .- x), 2),
                  (type = :scatter, name = string(names[1]), symbolSize = 9, z = 3, data = x),
                  (type = :scatter, name = string(names[2]), symbolSize = 11, z = 3, data = y)],
        height = 72 + 26 * length(o),
        modes(m -> (series = [(itemStyle = (color = :transparent,),), (itemStyle = (color = getfield(INK, m).axis,),),
                              (itemStyle = (color = getfield(INK, m).muted,),),
                              (itemStyle = (color = getfield(CATEGORICAL, m)[1],),)],))...,
    )
end

"""
    counts(v; top = 20, name = "count")

How often each value of `v` occurs, as bars, the `top` most frequent.
"""
function counts(v; top = 20, name = "count")
    u = unique(filter(_present, v))
    n = [count(==(x), v) for x in u]
    o = sortperm(n; rev = true)[1:min(top, end)]
    return bars(_s.(u[o]), n[o]; name = name)
end

# A number for reading: four significant figures, thousands grouped.
function _grouped(x)
    t = _text(x)
    m = match(r"^(-?)(\d+)(\.\d+)?$", t)
    m === nothing && return t
    digits = reverse(join(Iterators.partition(reverse(m[2]), 3) .|> String, ","))
    return string(m[1], digits, something(m[3], ""))
end

# A text column in a line: its commonest values with their counts, or a few examples when every
# value is different (an identifier, a name).
function _text_summary(have)
    u = unique(have)
    length(u) == length(have) && length(u) > 3 && return string("all distinct, e.g. ", join(_s.(u[1:3]), ", "), ", …")
    n = Dict(x => 0 for x in u)
    foreach(x -> n[x] += 1, have)
    top = sort(u; by = x -> -n[x])[1:min(3, end)]
    return join((string(_s(x), " ×", n[x]) for x in top), ", ") * (length(u) > 3 ? ", …" : "")
end

"""
    column_summary(df) -> Vector{NamedTuple}

One row per column: its kind of value, how many values it has, the share of rows missing one, how
many are distinct, and a one-line summary (the range and mean of a number, the commonest values of anything
else).
"""
function column_summary(df)
    kind(T) = T <: Bool ? "yes/no" : T <: Integer ? "integer" : T <: Real ? "decimal" :
              T <: AbstractString ? "text" : T <: Dates.TimeType ? "date" : string(T)
    rows = NamedTuple[]
    for c in names(df)
        v = df[!, c]
        have = [x for x in v if _present(x)]
        T = isempty(have) ? Missing : mapreduce(typeof, typejoin, have)
        summary = isempty(have) ? "" :
                  T <: Real && !(T <: Bool) ?
                      (minimum(have) == maximum(have) ? _grouped(first(have)) :
                       string(_grouped(minimum(have)), " – ", _grouped(maximum(have)), " · mean ",
                              _grouped(sum(have) / length(have)))) :
                  T <: Dates.TimeType ? string(minimum(have), " – ", maximum(have)) :
                  _text_summary(have)
        push!(rows, (column = String(c), type = kind(T), values = length(have), missing = (length(v) - length(have)) / max(length(v), 1),
                     distinct = length(unique(have)), summary = summary))
    end
    return rows
end
