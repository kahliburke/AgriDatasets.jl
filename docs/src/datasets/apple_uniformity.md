# apple\_uniformity

## Description

Uniformity trial in apple

## Visualization

```@slate ../../notebooks/gallery.jl apple_uniformity
```

## Dataset information

- **Dataset:** `apple_uniformity`
- **Original name:** `strickland.apple.uniformity`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 198
- **Columns:** 3
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl apple_uniformity_columns
```

## Data

```@slate ../../notebooks/tables.jl apple_uniformity_data
```

The first 25 of 198 rows. `load_dataset("apple_uniformity")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("apple_uniformity")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("apple_uniformity")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
