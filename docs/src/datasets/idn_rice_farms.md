# idn\_rice\_farms

## Description

Production of rice in Indonesia

## Visualization

```@slate ../../notebooks/gallery.jl idn_rice_farms
```

## Dataset information

- **Dataset:** `idn_rice_farms`
- **Original name:** `RiceFarms`
- **Source package:** `plm`
- **Source package version:** `2.6-7`
- **Rows:** 1026
- **Columns:** 20
- **Original license:** GPL (>= 2)
- **Source:** https://cran.r-project.org/package=plm

## Columns

```@slate ../../notebooks/tables.jl idn_rice_farms_columns
```

## Data

```@slate ../../notebooks/tables.jl idn_rice_farms_data
```

The first 25 of 1,026 rows. `load_dataset("idn_rice_farms")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("idn_rice_farms")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("idn_rice_farms")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 2)**.

For additional information, see the original source:

https://cran.r-project.org/package=plm
