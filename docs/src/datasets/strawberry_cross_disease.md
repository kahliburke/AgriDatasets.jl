# strawberry\_cross\_disease

## Description

Ordered disease ratings of strawberry crosses

## Visualization

```@slate ../../notebooks/gallery.jl strawberry_cross_disease
```

## Dataset information

- **Dataset:** `strawberry_cross_disease`
- **Original name:** `jansen.strawberry`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 144
- **Columns:** 5
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl strawberry_cross_disease_columns
```

## Data

```@slate ../../notebooks/tables.jl strawberry_cross_disease_data
```

The first 25 of 144 rows. `load_dataset("strawberry_cross_disease")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("strawberry_cross_disease")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("strawberry_cross_disease")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
