# peach\_uniformity

## Description

Uniformity trial of peach

## Visualization

```@slate ../../notebooks/gallery.jl peach_uniformity
```

## Dataset information

- **Dataset:** `peach_uniformity`
- **Original name:** `strickland.peach.uniformity`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 144
- **Columns:** 3
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl peach_uniformity_columns
```

## Data

```@slate ../../notebooks/tables.jl peach_uniformity_data
```

The first 25 of 144 rows. `load_dataset("peach_uniformity")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("peach_uniformity")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("peach_uniformity")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
