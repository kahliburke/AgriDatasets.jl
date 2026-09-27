# coffee\_production

## Description

World coffee production data

## Visualization

```@slate ../../notebooks/gallery.jl coffee_production
```

## Dataset information

- **Dataset:** `coffee_production`
- **Original name:** `coffee_data`
- **Source package:** `spData`
- **Source package version:** `2.3.5`
- **Rows:** 47
- **Columns:** 3
- **Original license:** CC0
- **Source:** https://cran.r-project.org/package=spData

## Columns

```@slate ../../notebooks/tables.jl coffee_production_columns
```

## Data

```@slate ../../notebooks/tables.jl coffee_production_data
```

The first 25 of 47 rows. `load_dataset("coffee_production")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("coffee_production")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("coffee_production")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **CC0**.

For additional information, see the original source:

https://cran.r-project.org/package=spData
