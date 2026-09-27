# budworm\_pyrethroid

## Description

Insecticide doses and tobacco budworm

## Visualization

```@slate ../../notebooks/gallery.jl budworm_pyrethroid
```

## Dataset information

- **Dataset:** `budworm_pyrethroid`
- **Original name:** `budworm`
- **Source package:** `GLMsData`
- **Source package version:** `1.4`
- **Rows:** 12
- **Columns:** 4
- **Original license:** GPL (>= 2)
- **Source:** https://cran.r-project.org/package=GLMsData

## Columns

```@slate ../../notebooks/tables.jl budworm_pyrethroid_columns
```

## Data

```@slate ../../notebooks/tables.jl budworm_pyrethroid_data
```

All 12 rows.

## Usage

    using AgriDatasets

    df = load_dataset("budworm_pyrethroid")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("budworm_pyrethroid")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 2)**.

For additional information, see the original source:

https://cran.r-project.org/package=GLMsData
