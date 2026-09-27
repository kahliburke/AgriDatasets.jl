# broiler\_growth

## Description

Daily weight, feed, egg measurements for a broiler chicken

## Visualization

```@slate ../../notebooks/gallery.jl broiler_growth
```

## Dataset information

- **Dataset:** `broiler_growth`
- **Original name:** `zuidhof.broiler`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 59
- **Columns:** 6
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl broiler_growth_columns
```

## Data

```@slate ../../notebooks/tables.jl broiler_growth_data
```

The first 25 of 59 rows. `load_dataset("broiler_growth")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("broiler_growth")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("broiler_growth")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
