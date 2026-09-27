# guinea\_pig\_sleep

## Description

Sleep times for guinea pigs

## Visualization

```@slate ../../notebooks/gallery.jl guinea_pig_sleep
```

## Dataset information

- **Dataset:** `guinea_pig_sleep`
- **Original name:** `gpsleep`
- **Source package:** `GLMsData`
- **Source package version:** `1.4`
- **Rows:** 30
- **Columns:** 2
- **Original license:** GPL (>= 2)
- **Source:** https://cran.r-project.org/package=GLMsData

## Columns

```@slate ../../notebooks/tables.jl guinea_pig_sleep_columns
```

## Data

```@slate ../../notebooks/tables.jl guinea_pig_sleep_data
```

The first 25 of 30 rows. `load_dataset("guinea_pig_sleep")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("guinea_pig_sleep")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("guinea_pig_sleep")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 2)**.

For additional information, see the original source:

https://cran.r-project.org/package=GLMsData
