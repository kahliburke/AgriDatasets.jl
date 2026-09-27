# hawaii\_tree\_growth

## Description

Diameter growth increments of a tropical tree species in Hawaii

## Visualization

```@slate ../../notebooks/gallery.jl hawaii_tree_growth
```

## Dataset information

- **Dataset:** `hawaii_tree_growth`
- **Original name:** `hawaii`
- **Source package:** `biometrics`
- **Source package version:** `1.0.4`
- **Rows:** 63
- **Columns:** 8
- **Original license:** GPL (>= 3)
- **Source:** https://cran.r-project.org/package=biometrics

## Columns

```@slate ../../notebooks/tables.jl hawaii_tree_growth_columns
```

## Data

```@slate ../../notebooks/tables.jl hawaii_tree_growth_data
```

The first 25 of 63 rows. `load_dataset("hawaii_tree_growth")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("hawaii_tree_growth")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("hawaii_tree_growth")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 3)**.

For additional information, see the original source:

https://cran.r-project.org/package=biometrics
