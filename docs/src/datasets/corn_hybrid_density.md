# corn\_hybrid\_density

## Description

Corn hybrid density experiment

## Visualization

```@slate ../../notebooks/gallery.jl corn_hybrid_density
```

## Dataset information

- **Dataset:** `corn_hybrid_density`
- **Original name:** `corn`
- **Source package:** `AgroR`
- **Source package version:** `1.3.7`
- **Rows:** 24
- **Columns:** 3
- **Original license:** GPL (>= 2)
- **Source:** https://cran.r-project.org/package=AgroR

## Columns

```@slate ../../notebooks/tables.jl corn_hybrid_density_columns
```

## Data

```@slate ../../notebooks/tables.jl corn_hybrid_density_data
```

All 24 rows.

## Usage

    using AgriDatasets

    df = load_dataset("corn_hybrid_density")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("corn_hybrid_density")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 2)**.

For additional information, see the original source:

https://cran.r-project.org/package=AgroR
