# fish\_feeding

## Description

Food consumption for fish

## Visualization

```@slate ../../notebooks/gallery.jl fish_feeding
```

## Dataset information

- **Dataset:** `fish_feeding`
- **Original name:** `fishfood`
- **Source package:** `GLMsData`
- **Source package version:** `1.4`
- **Rows:** 33
- **Columns:** 6
- **Original license:** GPL (>= 2)
- **Source:** https://cran.r-project.org/package=GLMsData

## Columns

```@slate ../../notebooks/tables.jl fish_feeding_columns
```

## Data

```@slate ../../notebooks/tables.jl fish_feeding_data
```

The first 25 of 33 rows. `load_dataset("fish_feeding")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("fish_feeding")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("fish_feeding")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 2)**.

For additional information, see the original source:

https://cran.r-project.org/package=GLMsData
