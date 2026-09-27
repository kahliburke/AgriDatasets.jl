# carrot\_insecticide

## Description

Insecticide treatments for carrot fly larvae

## Visualization

```@slate ../../notebooks/gallery.jl carrot_insecticide
```

## Dataset information

- **Dataset:** `carrot_insecticide`
- **Original name:** `wheatley.carrot`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 36
- **Columns:** 6
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl carrot_insecticide_columns
```

## Data

```@slate ../../notebooks/tables.jl carrot_insecticide_data
```

The first 25 of 36 rows. `load_dataset("carrot_insecticide")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("carrot_insecticide")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("carrot_insecticide")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
