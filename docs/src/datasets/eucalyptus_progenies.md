# eucalyptus\_progenies

## Description

Eucalyptus grandis Barbin (2013) progenies dataset

## Visualization

```@slate ../../notebooks/gallery.jl eucalyptus_progenies
```

## Dataset information

- **Dataset:** `eucalyptus_progenies`
- **Original name:** `eucalyptus`
- **Source package:** `AgroR`
- **Source package version:** `1.3.7`
- **Rows:** 72
- **Columns:** 4
- **Original license:** GPL (>= 2)
- **Source:** https://cran.r-project.org/package=AgroR

## Columns

```@slate ../../notebooks/tables.jl eucalyptus_progenies_columns
```

## Data

```@slate ../../notebooks/tables.jl eucalyptus_progenies_data
```

The first 25 of 72 rows. `load_dataset("eucalyptus_progenies")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("eucalyptus_progenies")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("eucalyptus_progenies")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 2)**.

For additional information, see the original source:

https://cran.r-project.org/package=AgroR
