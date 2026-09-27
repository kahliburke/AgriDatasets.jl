# bamboo\_growth

## Description

Data set relating growth of bamboo to geographic location

## Visualization

```@slate ../../notebooks/gallery.jl bamboo_growth
```

## Dataset information

- **Dataset:** `bamboo_growth`
- **Original name:** `BambooGrowth`
- **Source package:** `gpk`
- **Source package version:** `1.0`
- **Rows:** 595
- **Columns:** 5
- **Original license:** GPL-2
- **Source:** https://cran.r-project.org/package=gpk

## Columns

```@slate ../../notebooks/tables.jl bamboo_growth_columns
```

## Data

```@slate ../../notebooks/tables.jl bamboo_growth_data
```

The first 25 of 595 rows. `load_dataset("bamboo_growth")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("bamboo_growth")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("bamboo_growth")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL-2**.

For additional information, see the original source:

https://cran.r-project.org/package=gpk
