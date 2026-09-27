# lady\_bird\_fungus

## Description

Ladybird transmission of fungus

## Visualization

```@slate ../../notebooks/gallery.jl lady_bird_fungus
```

## Dataset information

- **Dataset:** `lady_bird_fungus`
- **Original name:** `ladybird`
- **Source package:** `smbdata`
- **Source package version:** `0.2.0`
- **Rows:** 72
- **Columns:** 8
- **Original license:** GPL (>= 3)
- **Source:** https://cran.r-project.org/package=smbdata

## Columns

```@slate ../../notebooks/tables.jl lady_bird_fungus_columns
```

## Data

```@slate ../../notebooks/tables.jl lady_bird_fungus_data
```

The first 25 of 72 rows. `load_dataset("lady_bird_fungus")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("lady_bird_fungus")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("lady_bird_fungus")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 3)**.

For additional information, see the original source:

https://cran.r-project.org/package=smbdata
