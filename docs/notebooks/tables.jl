try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# Dataset tables

For every dataset in AgriDatasets, a summary of its columns and the data itself. The dataset pages of
the documentation show them.
"""

#%% code id=setup
using AgriDatasets, DataFrames, AgriViz

# The column summary as a table: one row per column. The share missing is drawn as a bar against
# 0–100%, so a column missing a few values shows a short bar, not a full one.
columns_table(name) = slate_table(column_summary(load_dataset(name)); align = (summary = :left,),
                                  format = (missing = :percent,), viz = (missing = (kind = :bar, domain = (0, 1)),))

# The first rows of a dataset; the page says how many there are in all.
const PREVIEW = 25
preview(name) = first(load_dataset(name), PREVIEW)

#%% code id=alfalfa_soil_columns
columns_table("alfalfa_soil")

#%% code id=alfalfa_soil_data
preview("alfalfa_soil")

#%% code id=apple_canker_columns
columns_table("apple_canker")

#%% code id=apple_canker_data
preview("apple_canker")

#%% code id=apple_uniformity_columns
columns_table("apple_uniformity")

#%% code id=apple_uniformity_data
preview("apple_uniformity")

#%% code id=arabica_soil_columns
columns_table("arabica_soil")

#%% code id=arabica_soil_data
preview("arabica_soil")

#%% code id=arabica_temp_columns
columns_table("arabica_temp")

#%% code id=arabica_temp_data
preview("arabica_temp")

#%% code id=arabica_terrain_columns
columns_table("arabica_terrain")

#%% code id=arabica_terrain_data
preview("arabica_terrain")

#%% code id=arabica_water_columns
columns_table("arabica_water")

#%% code id=arabica_water_data
preview("arabica_water")

#%% code id=avocado_us_sale_columns
columns_table("avocado_us_sale")

#%% code id=avocado_us_sale_data
preview("avocado_us_sale")

#%% code id=bamboo_growth_columns
columns_table("bamboo_growth")

#%% code id=bamboo_growth_data
preview("bamboo_growth")

#%% code id=biological_control_columns
columns_table("biological_control")

#%% code id=biological_control_data
preview("biological_control")

#%% code id=bird_grazing_columns
columns_table("bird_grazing")

#%% code id=bird_grazing_data
preview("bird_grazing")

#%% code id=black_duck_survival_columns
columns_table("black_duck_survival")

#%% code id=black_duck_survival_data
preview("black_duck_survival")

#%% code id=blackgrass_herbicide_columns
columns_table("blackgrass_herbicide")

#%% code id=blackgrass_herbicide_data
preview("blackgrass_herbicide")

#%% code id=broiler_growth_columns
columns_table("broiler_growth")

#%% code id=broiler_growth_data
preview("broiler_growth")

#%% code id=budworm_pyrethroid_columns
columns_table("budworm_pyrethroid")

#%% code id=budworm_pyrethroid_data
preview("budworm_pyrethroid")

#%% code id=carrot_fly_infestation_columns
columns_table("carrot_fly_infestation")

#%% code id=carrot_fly_infestation_data
preview("carrot_fly_infestation")

#%% code id=carrot_insecticide_columns
columns_table("carrot_insecticide")

#%% code id=carrot_insecticide_data
preview("carrot_insecticide")

#%% code id=cattle_butterfat_columns
columns_table("cattle_butterfat")

#%% code id=cattle_butterfat_data
preview("cattle_butterfat")

#%% code id=cauliflower_growth_columns
columns_table("cauliflower_growth")

#%% code id=cauliflower_growth_data
preview("cauliflower_growth")

#%% code id=coffee_composition_columns
columns_table("coffee_composition")

#%% code id=coffee_composition_data
preview("coffee_composition")

#%% code id=coffee_production_columns
columns_table("coffee_production")

#%% code id=coffee_production_data
preview("coffee_production")

#%% code id=cork_tree_direction_columns
columns_table("cork_tree_direction")

#%% code id=cork_tree_direction_data
preview("cork_tree_direction")

#%% code id=corn_hybrid_density_columns
columns_table("corn_hybrid_density")

#%% code id=corn_hybrid_density_data
preview("corn_hybrid_density")

#%% code id=cotton_pesticide_columns
columns_table("cotton_pesticide")

#%% code id=cotton_pesticide_data
preview("cotton_pesticide")

#%% code id=cowpea_maize_yield_columns
columns_table("cowpea_maize_yield")

#%% code id=cowpea_maize_yield_data
preview("cowpea_maize_yield")

#%% code id=cows_insemination_columns
columns_table("cows_insemination")

#%% code id=cows_insemination_data
preview("cows_insemination")

#%% code id=earthworm_crop_soils_columns
columns_table("earthworm_crop_soils")

#%% code id=earthworm_crop_soils_data
preview("earthworm_crop_soils")

#%% code id=earthworm_population_columns
columns_table("earthworm_population")

#%% code id=earthworm_population_data
preview("earthworm_population")

#%% code id=eelworm_fumigation_columns
columns_table("eelworm_fumigation")

#%% code id=eelworm_fumigation_data
preview("eelworm_fumigation")

#%% code id=egg_weight_daily_columns
columns_table("egg_weight_daily")

#%% code id=egg_weight_daily_data
preview("egg_weight_daily")

#%% code id=eucalyptus_progenies_columns
columns_table("eucalyptus_progenies")

#%% code id=eucalyptus_progenies_data
preview("eucalyptus_progenies")

#%% code id=fish_feeding_columns
columns_table("fish_feeding")

#%% code id=fish_feeding_data
preview("fish_feeding")

#%% code id=fungicide_latin_square_columns
columns_table("fungicide_latin_square")

#%% code id=fungicide_latin_square_data
preview("fungicide_latin_square")

#%% code id=grape_uniformity_columns
columns_table("grape_uniformity")

#%% code id=grape_uniformity_data
preview("grape_uniformity")

#%% code id=guinea_pig_sleep_columns
columns_table("guinea_pig_sleep")

#%% code id=guinea_pig_sleep_data
preview("guinea_pig_sleep")

#%% code id=hawaii_plant_size_columns
columns_table("hawaii_plant_size")

#%% code id=hawaii_plant_size_data
preview("hawaii_plant_size")

#%% code id=hawaii_tree_growth_columns
columns_table("hawaii_tree_growth")

#%% code id=hawaii_tree_growth_data
preview("hawaii_tree_growth")

#%% code id=idn_rice_farms_columns
columns_table("idn_rice_farms")

#%% code id=idn_rice_farms_data
preview("idn_rice_farms")

#%% code id=kiwi_crop_design_columns
columns_table("kiwi_crop_design")

#%% code id=kiwi_crop_design_data
preview("kiwi_crop_design")

#%% code id=lady_bird_fungus_columns
columns_table("lady_bird_fungus")

#%% code id=lady_bird_fungus_data
preview("lady_bird_fungus")

#%% code id=lamb_births_columns
columns_table("lamb_births")

#%% code id=lamb_births_data
preview("lamb_births")

#%% code id=nitrofen_toxicity_columns
columns_table("nitrofen_toxicity")

#%% code id=nitrofen_toxicity_data
preview("nitrofen_toxicity")

#%% code id=orange_rootstocks_columns
columns_table("orange_rootstocks")

#%% code id=orange_rootstocks_data
preview("orange_rootstocks")

#%% code id=peach_uniformity_columns
columns_table("peach_uniformity")

#%% code id=peach_uniformity_data
preview("peach_uniformity")

#%% code id=pig_weight_gain_columns
columns_table("pig_weight_gain")

#%% code id=pig_weight_gain_data
preview("pig_weight_gain")

#%% code id=plant_growth_regulator_columns
columns_table("plant_growth_regulator")

#%% code id=plant_growth_regulator_data
preview("plant_growth_regulator")

#%% code id=pollen_removal_columns
columns_table("pollen_removal")

#%% code id=pollen_removal_data
preview("pollen_removal")

#%% code id=potato_scab_sulfur_columns
columns_table("potato_scab_sulfur")

#%% code id=potato_scab_sulfur_data
preview("potato_scab_sulfur")

#%% code id=rabbit_body_mass_columns
columns_table("rabbit_body_mass")

#%% code id=rabbit_body_mass_data
preview("rabbit_body_mass")

#%% code id=red_wine_quality_columns
columns_table("red_wine_quality")

#%% code id=red_wine_quality_data
preview("red_wine_quality")

#%% code id=rice_wheat_production_columns
columns_table("rice_wheat_production")

#%% code id=rice_wheat_production_data
preview("rice_wheat_production")

#%% code id=river_deforestation_columns
columns_table("river_deforestation")

#%% code id=river_deforestation_data
preview("river_deforestation")

#%% code id=robusta_soil_columns
columns_table("robusta_soil")

#%% code id=robusta_soil_data
preview("robusta_soil")

#%% code id=robusta_temp_columns
columns_table("robusta_temp")

#%% code id=robusta_temp_data
preview("robusta_temp")

#%% code id=robusta_terrain_columns
columns_table("robusta_terrain")

#%% code id=robusta_terrain_data
preview("robusta_terrain")

#%% code id=robusta_water_columns
columns_table("robusta_water")

#%% code id=robusta_water_data
preview("robusta_water")

#%% code id=seed_germination_columns
columns_table("seed_germination")

#%% code id=seed_germination_data
preview("seed_germination")

#%% code id=soil_munsell_colors_columns
columns_table("soil_munsell_colors")

#%% code id=soil_munsell_colors_data
preview("soil_munsell_colors")

#%% code id=soil_munsell_minerals_columns
columns_table("soil_munsell_minerals")

#%% code id=soil_munsell_minerals_data
preview("soil_munsell_minerals")

#%% code id=soybean_cultivars_columns
columns_table("soybean_cultivars")

#%% code id=soybean_cultivars_data
preview("soybean_cultivars")

#%% code id=strawberry_cross_disease_columns
columns_table("strawberry_cross_disease")

#%% code id=strawberry_cross_disease_data
preview("strawberry_cross_disease")

#%% code id=strawberry_yield_columns
columns_table("strawberry_yield")

#%% code id=strawberry_yield_data
preview("strawberry_yield")

#%% code id=timber_genetics_columns
columns_table("timber_genetics")

#%% code id=timber_genetics_data
preview("timber_genetics")

#%% code id=tomato_insecticides_columns
columns_table("tomato_insecticides")

#%% code id=tomato_insecticides_data
preview("tomato_insecticides")

#%% code id=tomato_uniformity_columns
columns_table("tomato_uniformity")

#%% code id=tomato_uniformity_data
preview("tomato_uniformity")

#%% code id=toxin_lethal_dose_columns
columns_table("toxin_lethal_dose")

#%% code id=toxin_lethal_dose_data
preview("toxin_lethal_dose")

#%% code id=turnip_density_columns
columns_table("turnip_density")

#%% code id=turnip_density_data
preview("turnip_density")

#%% code id=us_state_soils_columns
columns_table("us_state_soils")

#%% code id=us_state_soils_data
preview("us_state_soils")

#%% code id=wheat_bunt_columns
columns_table("wheat_bunt")

#%% code id=wheat_bunt_data
preview("wheat_bunt")

#%% code id=wheat_splitsplit_columns
columns_table("wheat_splitsplit")

#%% code id=wheat_splitsplit_data
preview("wheat_splitsplit")

#%% code id=willow_cutting_yield_columns
columns_table("willow_cutting_yield")

#%% code id=willow_cutting_yield_data
preview("willow_cutting_yield")

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 2dee0373-3bdb-4dfc-8d57-61c216bdc64a
# ╚═╡
