# red\_wine\_quality

## Description

Red wine characteristics and quality

## Visualization

```@slate ../../notebooks/gallery.jl red_wine_quality_pick
```
```@slate ../../notebooks/gallery.jl red_wine_quality
```

## Dataset information

- **Dataset:** `red_wine_quality`
- **Original name:** `wine`
- **Source package:** `live`
- **Source package version:** `1.5.13`
- **Rows:** 1599
- **Columns:** 12
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=live

## Columns

```@slate ../../notebooks/tables.jl red_wine_quality_columns
```

## Data

```@slate ../../notebooks/tables.jl red_wine_quality_data
```

The first 25 of 1,599 rows. `load_dataset("red_wine_quality")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("red_wine_quality")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("red_wine_quality")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=live
