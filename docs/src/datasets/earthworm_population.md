# earthworm\_population

## Description

Population dynamics of earthworms

## Visualization

```@slate ../../notebooks/gallery.jl earthworm_population
```

## Dataset information

- **Dataset:** `earthworm_population`
- **Original name:** `EarthwormSeason`
- **Source package:** `gpk`
- **Source package version:** `1.0`
- **Rows:** 46
- **Columns:** 3
- **Original license:** GPL-2
- **Source:** https://cran.r-project.org/package=gpk

## Columns

```@slate ../../notebooks/tables.jl earthworm_population_columns
```

## Data

```@slate ../../notebooks/tables.jl earthworm_population_data
```

The first 25 of 46 rows. `load_dataset("earthworm_population")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("earthworm_population")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("earthworm_population")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL-2**.

For additional information, see the original source:

https://cran.r-project.org/package=gpk
