# rice\_wheat\_production

## Description

Modeling rice and wheat production

## Visualization

```@slate ../../notebooks/gallery.jl rice_wheat_production_pick
```
```@slate ../../notebooks/gallery.jl rice_wheat_production
```

## Dataset information

- **Dataset:** `rice_wheat_production`
- **Original name:** `RiceWheat`
- **Source package:** `gpk`
- **Source package version:** `1.0`
- **Rows:** 106
- **Columns:** 6
- **Original license:** GPL-2
- **Source:** https://cran.r-project.org/package=gpk

## Columns

```@slate ../../notebooks/tables.jl rice_wheat_production_columns
```

## Data

```@slate ../../notebooks/tables.jl rice_wheat_production_data
```

The first 25 of 106 rows. `load_dataset("rice_wheat_production")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("rice_wheat_production")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("rice_wheat_production")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL-2**.

For additional information, see the original source:

https://cran.r-project.org/package=gpk
