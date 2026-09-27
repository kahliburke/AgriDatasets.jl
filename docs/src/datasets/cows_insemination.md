# cows\_insemination

## Description

Crossbreeding of cows

## Visualization

```@slate ../../notebooks/gallery.jl cows_insemination
```

## Dataset information

- **Dataset:** `cows_insemination`
- **Original name:** `COWSDATA`
- **Source package:** `gpk`
- **Source package version:** `1.0`
- **Rows:** 10
- **Columns:** 7
- **Original license:** GPL-2
- **Source:** https://cran.r-project.org/package=gpk

## Columns

```@slate ../../notebooks/tables.jl cows_insemination_columns
```

## Data

```@slate ../../notebooks/tables.jl cows_insemination_data
```

All 10 rows.

## Usage

    using AgriDatasets

    df = load_dataset("cows_insemination")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("cows_insemination")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL-2**.

For additional information, see the original source:

https://cran.r-project.org/package=gpk
