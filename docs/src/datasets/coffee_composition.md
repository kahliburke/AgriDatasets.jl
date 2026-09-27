# coffee\_composition

## Description

Chemical composition of Arabica and Robusta coffee samples

## Visualization

```@slate ../../notebooks/gallery.jl coffee_composition_pick
```
```@slate ../../notebooks/gallery.jl coffee_composition
```

## Dataset information

- **Dataset:** `coffee_composition`
- **Original name:** `coffee`
- **Source package:** `IMIFA`
- **Source package version:** `2.2.0`
- **Rows:** 43
- **Columns:** 14
- **Original license:** GPL (>= 3)
- **Source:** https://cran.r-project.org/package=IMIFA

## Columns

```@slate ../../notebooks/tables.jl coffee_composition_columns
```

## Data

```@slate ../../notebooks/tables.jl coffee_composition_data
```

The first 25 of 43 rows. `load_dataset("coffee_composition")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("coffee_composition")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("coffee_composition")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 3)**.

For additional information, see the original source:

https://cran.r-project.org/package=IMIFA
