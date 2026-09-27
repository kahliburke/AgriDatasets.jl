# egg\_weight\_daily

## Description

Sample of egg weights on 24 consecutive days

## Visualization

```@slate ../../notebooks/gallery.jl egg_weight_daily
```

## Dataset information

- **Dataset:** `egg_weight_daily`
- **Original name:** `goulden.eggs`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 240
- **Columns:** 2
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl egg_weight_daily_columns
```

## Data

```@slate ../../notebooks/tables.jl egg_weight_daily_data
```

The first 25 of 240 rows. `load_dataset("egg_weight_daily")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("egg_weight_daily")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("egg_weight_daily")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
