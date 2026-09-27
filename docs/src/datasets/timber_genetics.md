# timber\_genetics

## Description

Genetic and environmental components of tree characteristics

## Visualization

```@slate ../../notebooks/gallery.jl timber_genetics
```

## Dataset information

- **Dataset:** `timber_genetics`
- **Original name:** `Timber`
- **Source package:** `gpk`
- **Source package version:** `1.0`
- **Rows:** 224
- **Columns:** 10
- **Original license:** GPL-2
- **Source:** https://cran.r-project.org/package=gpk

## Columns

```@slate ../../notebooks/tables.jl timber_genetics_columns
```

## Data

```@slate ../../notebooks/tables.jl timber_genetics_data
```

The first 25 of 224 rows. `load_dataset("timber_genetics")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("timber_genetics")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("timber_genetics")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL-2**.

For additional information, see the original source:

https://cran.r-project.org/package=gpk
