try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# Dataset gallery

One chart for each dataset in AgriDatasets, each cell named after the dataset it draws. The dataset
pages of the documentation show them.
"""

#%% code id=setup
using AgriDatasets, DataFrames, Statistics, Dates, AgriViz

# A proportion column: `k` of `n`.
share(df, k, n) = transform(df, [k, n] => ByRow((a, b) -> b > 0 ? a / b : missing) => :proportion)

#%% code id=alfalfa_soil
echart(; suitability(load_dataset("alfalfa_soil"))...)

#%% code id=apple_canker
let df = share(load_dataset("apple_canker"), :y, :n)
    echart(; curve(combine(groupby(df, [:gen, :inoculum]), :proportion => mean => :proportion),
                   :inoculum, :proportion; group = :gen)...)
end

#%% code id=apple_uniformity
echart(; fieldmap(load_dataset("apple_uniformity"), :col, :row, :yield)...)

#%% code id=arabica_soil
echart(; suitability(load_dataset("arabica_soil"))...)

#%% code id=arabica_temp
echart(; suitability(load_dataset("arabica_temp"))...)

#%% code id=arabica_terrain
echart(; suitability(load_dataset("arabica_terrain"))...)

#%% code id=arabica_water
echart(; suitability(load_dataset("arabica_water"))...)

#%% code id=avocado_us_sale_pick
@bind avocado_kind Radio(["Conventional", "Organic"], "Conventional"; label = "avocados")

#%% code id=avocado_us_sale
# Weekly price and units sold for the chosen kind, on two stacked panels that share the time axis.
let df = sort(load_dataset("avocado_us_sale"), :week_ending)
    ms(d) = 1000 * Dates.datetime2unix(DateTime(d))     # a time axis takes milliseconds since 1970
    pts(k, c, scale) = (r = df[df.type .== k, :];
                        [[ms(d), round(v / scale; sigdigits = 4)] for (d, v) in zip(r.week_ending, r[!, c])])
    echart(;
        grid = [(left = 64, right = 24, top = 16, height = 150), (left = 64, right = 24, top = 206, height = 110)],
        xAxis = [(type = :time, gridIndex = 0, axisLabel = (show = false,)), (type = :time, gridIndex = 1)],
        yAxis = [(valaxis("price (US\$)")..., gridIndex = 0, nameGap = 44),
                 (valaxis("units sold (millions)")..., gridIndex = 1, nameGap = 44)],
        axisPointer = (link = [(xAxisIndex = :all,)],),
        tooltip = (trigger = :axis,),
        series = [(type = :line, name = "price", showSymbol = false, lineStyle = (width = 1.5,),
                   data = @replay(avocado_kind, pts(avocado_kind, :avg_selling_price, 1))),
                  (type = :line, name = "units sold", xAxisIndex = 1, yAxisIndex = 1, showSymbol = false,
                   lineStyle = (width = 1.5,), areaStyle = (opacity = 0.15,),
                   data = @replay(avocado_kind, pts(avocado_kind, :total_bulk_and_bags_units, 1e6)))],
        height = 360,
        modes(m -> (color = fill(CATEGORICAL[m][1], 2),))...,
    )
end

#%% code id=bamboo_growth
echart(; scatter(load_dataset("bamboo_growth"), :Old_Shoots, :New_Shoots; bubbles = true, size = 5)...)

#%% code id=biological_control
echart(; scatter(load_dataset("biological_control"), :Load, :Mass; size = 10)...)

#%% code id=bird_grazing
echart(; dots(load_dataset("bird_grazing"), :Grazed, :Birds; group = :When)...)

#%% code id=black_duck_survival
echart(; scatter(load_dataset("black_duck_survival"), :weight, :time; group = :status)...)

#%% code id=blackgrass_herbicide
echart(; dots(load_dataset("blackgrass_herbicide"), :Population, :Fwt; group = :Herbicide)...)

#%% code id=broiler_growth
let df = load_dataset("broiler_growth")
    long = stack(df[:, [:age, :bw, :targetbw]], [:bw, :targetbw]; variable_name = :weight)
    long.weight = replace(long.weight, "bw" => "body weight", "targetbw" => "target")
    echart(; curve(long, :age, :value; group = :weight)...)
end

#%% code id=budworm_pyrethroid
echart(; curve(share(load_dataset("budworm_pyrethroid"), :Killed, :Number), :Dose, :proportion;
               group = :Gender, logx = true)...)

#%% code id=carrot_fly_infestation
echart(; dots(share(load_dataset("carrot_fly_infestation"), :y, :n), :gen, :proportion; group = :trt)...)

#%% code id=carrot_insecticide
echart(; dots(share(load_dataset("carrot_insecticide"), :damaged, :total), :treatment, :proportion;
              group = :insecticide)...)

#%% code id=cattle_butterfat
echart(; dots(load_dataset("cattle_butterfat"), :Breed, :Butterfat; group = :Age)...)

#%% code id=cauliflower_growth
echart(; curve(load_dataset("cauliflower_growth"), :degdays, :leaves; group = :year)...)

#%% code id=coffee_composition_pick
@bind coffee_measure Select(["Caffine" => "caffeine", "Trigonelline" => "trigonelline",
                             "Chlorogenic Acid" => "chlorogenic acid", "Fat" => "fat",
                             "Extract Yield" => "extract yield", "ph Value" => "pH", "Water" => "water",
                             "Bean Weight" => "bean weight", "Mineral Content" => "mineral content",
                             "Free Acid" => "free acid"], "Caffine"; label = "measure")

#%% code id=coffee_composition
# The chosen measure for each sample, arabica against robusta.
let df = load_dataset("coffee_composition")
    kinds = unique(df.Variety)
    pts(k, c) = [[x, i - 1 + 0.3 * (((j * 0.618034) % 1) - 0.5)] for (i, v) in enumerate(kinds)
                 for (j, x) in enumerate(df[df.Variety .== v, c]) if v == k]
    echart(;
        grid = (left = 16, right = 24, top = 32, bottom = 44, containLabel = true),
        legend = (data = String.(kinds), top = 0),
        xAxis = valaxis("value"),
        yAxis = [cataxis("", String.(kinds); boundaryGap = true, axisLine = (show = false,)),
                 (type = :value, min = -0.5, max = length(kinds) - 0.5, show = false)],
        tooltip = (trigger = :item, formatter = "{a}: {@[0]}"),
        series = [(type = :scatter, name = String(k), yAxisIndex = 1, symbolSize = 10, itemStyle = (opacity = 0.8,),
                   data = @replay(coffee_measure, pts(k, coffee_measure.value))) for k in kinds],
        height = 220,
        modes(m -> (color = CATEGORICAL[m][1:2],))...,
    )
end

#%% code id=coffee_production
let df = load_dataset("coffee_production")
    echart(; dumbbell(df.name_long, df.coffee_production_2016, df.coffee_production_2017;
                      names = ("2016", "2017"))...)
end

#%% code id=cork_tree_direction
echart(; dots(load_dataset("cork_tree_direction"), :dir, :y)...)

#%% code id=corn_hybrid_density
echart(; dots(load_dataset("corn_hybrid_density"), :A, :Resp; group = :B)...)

#%% code id=cotton_pesticide
echart(; scatter(load_dataset("cotton_pesticide"), :H, :Weight; group = :I)...)

#%% code id=cowpea_maize_yield
echart(; dots(load_dataset("cowpea_maize_yield"), :nitro, :myield; group = :cowpea)...)

#%% code id=cows_insemination
let df = load_dataset("cows_insemination")
    long = vcat([DataFrame(Time = df.Time, centre = "C$k",
                           rate = df[!, "Sillod_Conception_C$k"] ./ df[!, "Sillod_Insemination_C$k"]) for k in 1:3]...)
    echart(; curve(long, :Time, :rate; group = :centre, xtype = :category)...)
end

#%% code id=earthworm_crop_soils
echart(; scatter(load_dataset("earthworm_crop_soils"), :Density, :Biomass; group = :Crop, size = 10)...)

#%% code id=earthworm_population
echart(; curve(load_dataset("earthworm_population"), :Month, :Density; xtype = :category, area = true)...)

#%% code id=eelworm_fumigation
echart(; fieldmap(load_dataset("eelworm_fumigation"), :col, :row, :grain; label = :fumigant)...)

#%% code id=egg_weight_daily
echart(; scatter(load_dataset("egg_weight_daily"), :day, :weight; size = 6)...)

#%% code id=eucalyptus_progenies
echart(; dots(load_dataset("eucalyptus_progenies"), :trati, :resp; group = :exp)...)

#%% code id=fish_feeding
echart(; scatter(load_dataset("fish_feeding"), :MaxWt, :FoodCon; group = :Food, logx = true, logy = true, size = 10)...)

#%% code id=fungicide_latin_square
echart(; fieldmap(load_dataset("fungicide_latin_square"), :col, :row, :yield; label = :trt)...)

#%% code id=grape_uniformity
echart(; fieldmap(load_dataset("grape_uniformity"), :col, :row, :yield)...)

#%% code id=guinea_pig_sleep
echart(; scatter(load_dataset("guinea_pig_sleep"), :Dose, :Sleep; size = 10)...)

#%% code id=hawaii_plant_size
echart(; scatter(load_dataset("hawaii_plant_size"), :d95, :dmax3; group = Symbol("native.status"),
                 logx = true, logy = true)...)

#%% code id=hawaii_tree_growth
echart(; scatter(load_dataset("hawaii_tree_growth"), :dbh, :toth)...)

#%% code id=idn_rice_farms
echart(; scatter(load_dataset("idn_rice_farms"), :size, :goutput; group = :region, logx = true, logy = true,
                 size = 6)...)

#%% code id=kiwi_crop_design
load_dataset("kiwi_crop_design")

#%% code id=lady_bird_fungus
echart(; dots(load_dataset("lady_bird_fungus"), :Host, :Infected; group = :Ladybird)...)

#%% code id=lamb_births
echart(; dots(load_dataset("lamb_births"), :lambclass, :y; group = :breed)...)

#%% code id=nitrofen_toxicity
echart(; dots(load_dataset("nitrofen_toxicity"), :conc, :total)...)

#%% code id=orange_rootstocks
echart(; dots(load_dataset("orange_rootstocks"), :trat, :resp)...)

#%% code id=peach_uniformity
echart(; fieldmap(load_dataset("peach_uniformity"), :col, :row, :yield)...)

#%% code id=pig_weight_gain
echart(; dots(load_dataset("pig_weight_gain"), :treatment, :g; group = :sex)...)

#%% code id=plant_growth_regulator
echart(; fieldmap(load_dataset("plant_growth_regulator"), :Column, :Row, :Height; label = :Dose)...)

#%% code id=pollen_removal
echart(; scatter(load_dataset("pollen_removal"), :DurationOfVisit, :PollenRemoved; group = :BeeType)...)

#%% code id=potato_scab_sulfur
echart(; fieldmap(load_dataset("potato_scab_sulfur"), :col, :row, :inf; label = :trt)...)

#%% code id=rabbit_body_mass
echart(; scatter(load_dataset("rabbit_body_mass"), :Hind_Foot_Length, :Body_Weight)...)

#%% code id=red_wine_quality_pick
@bind wine_measure Select(["alcohol", "volatile_acidity", "sulphates", "citric_acid", "fixed_acidity",
                           "residual_sugar", "chlorides", "free_sulfur_dioxide", "total_sulfur_dioxide",
                           "density", "pH"] .=> ["alcohol", "volatile acidity", "sulphates", "citric acid",
                           "fixed acidity", "residual sugar", "chlorides", "free SO₂", "total SO₂", "density", "pH"],
                          "alcohol"; label = "measure")

#%% code id=red_wine_quality
# Every wine's value of the chosen measure against its quality score, with the mean at each score.
let df = load_dataset("red_wine_quality")
    qs = sort(unique(df.quality))
    jit(j) = 0.3 * (((j * 0.618034) % 1) - 0.5)
    pts(c) = [[q - first(qs) + jit(j), x] for (j, (q, x)) in enumerate(zip(df.quality, df[!, c]))]
    means(c) = [[i - 1, round(mean(df[df.quality .== q, c]); sigdigits = 4)] for (i, q) in enumerate(qs)]
    echart(;
        grid = (left = 16, right = 24, top = 16, bottom = 44, containLabel = true),
        xAxis = [cataxis("quality score", string.(qs); boundaryGap = true, axisLine = (show = false,)),
                 (type = :value, min = -0.5, max = length(qs) - 0.5, show = false)],
        yAxis = valaxis("value"),
        tooltip = (trigger = :item, formatter = "{@[1]}"),
        series = [(type = :scatter, name = "wines", xAxisIndex = 1, symbolSize = 5, itemStyle = (opacity = 0.35,),
                   large = true, data = @replay(wine_measure, pts(wine_measure.value))),
                  (type = :scatter, name = "mean", xAxisIndex = 1, symbol = :rect, symbolSize = [24, 3], z = 4,
                   data = @replay(wine_measure, means(wine_measure.value)))],
        height = 340,
        modes(m -> (series = [(itemStyle = (color = CATEGORICAL[m][1],),), (itemStyle = (color = INK[m].primary,),)],))...,
    )
end

#%% code id=rice_wheat_production_pick
@bind rice_measure Radio(["Production", "Area", "Yield"], "Production"; label = "measure")

#%% code id=rice_wheat_production
# Values alone, in the year axis's order. Two year labels are written differently for rice
# ("1999-01" for 2000-01, "2002-03*"), so labels are normalised before the crops are lined up.
let df = transform(load_dataset("rice_wheat_production"),
                   :Year => ByRow(y -> replace(String(y), "*" => "", "1999-01" => "2000-01")) => :Year)
    crops = unique(df.Food)
    years = sort(unique(df.Year))
    pts(k, c) = (r = df[df.Food .== k, :]; at = Dict(zip(r.Year, r[!, c])); [at[y] for y in years])
    echart(;
        grid = (left = 24, right = 64, top = 32, bottom = 44, containLabel = true),
        legend = (data = String.(crops), top = 0),
        xAxis = cataxis("year", years; boundaryGap = false),
        yAxis = (valaxis("")..., scale = false),
        tooltip = (trigger = :axis,),
        series = [(type = :line, name = String(k), showSymbol = false, lineStyle = (width = 2,),
                   data = @replay(rice_measure, pts(k, rice_measure))) for k in crops],
        height = 340,
        modes(m -> (color = CATEGORICAL[m][1:2],))...,
    )
end

#%% code id=river_deforestation
echart(; scatter(load_dataset("river_deforestation"), :Temp_air, :Temp_water; group = :Deforestation)...)

#%% code id=robusta_soil
echart(; suitability(load_dataset("robusta_soil"))...)

#%% code id=robusta_temp
echart(; suitability(load_dataset("robusta_temp"))...)

#%% code id=robusta_terrain
echart(; suitability(load_dataset("robusta_terrain"))...)

#%% code id=robusta_water
echart(; suitability(load_dataset("robusta_water"))...)

#%% code id=seed_germination
echart(; dots(share(load_dataset("seed_germination"), :germ, :seeds), :conc, :proportion; group = :temp)...)

#%% code id=soil_munsell_colors
echart(; counts(load_dataset("soil_munsell_colors").traditional_name; name = "Munsell colours")...)

#%% code id=soil_munsell_minerals
echart(; scatter(load_dataset("soil_munsell_minerals"), :chroma, :value; group = :hue, size = 11)...)

#%% code id=soybean_cultivars
echart(; dots(load_dataset("soybean_cultivars"), :cult, :prod)...)

#%% code id=strawberry_cross_disease
echart(; dots(load_dataset("strawberry_cross_disease"), :female, :count; group = :category)...)

#%% code id=strawberry_yield
echart(; fieldmap(load_dataset("strawberry_yield"), :col, :row, :yield; label = :gen)...)

#%% code id=timber_genetics
echart(; dots(load_dataset("timber_genetics"), :Locality, :Elongation; group = :Year)...)

#%% code id=tomato_insecticides
echart(; counts(load_dataset("tomato_insecticides").target_pest; name = "products")...)

#%% code id=tomato_uniformity
echart(; fieldmap(load_dataset("tomato_uniformity"), :col, :row, :yield)...)

#%% code id=toxin_lethal_dose
echart(; curve(share(transform(load_dataset("toxin_lethal_dose"), [:dead, :alive] => (+) => :n), :dead, :n),
               :dose, :proportion)...)

#%% code id=turnip_density
echart(; scatter(load_dataset("turnip_density"), :density, :yield; group = :spacing)...)

#%% code id=us_state_soils
load_dataset("us_state_soils")

#%% code id=wheat_bunt
echart(; dots(load_dataset("wheat_bunt"), :gen, :pct)...)

#%% code id=wheat_splitsplit
echart(; fieldmap(load_dataset("wheat_splitsplit"), :col, :row, :yield; label = :gen)...)

#%% code id=willow_cutting_yield
echart(; dots(load_dataset("willow_cutting_yield"), :Type, :Yield; group = :Size)...)

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = d575453d-f919-4dc3-8be5-e449193b5d53
# ╚═╡
