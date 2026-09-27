# blackgrass\_herbicide

## Description

Herbicide efficacy

## Visualization

```@slate ../../notebooks/gallery.jl blackgrass_herbicide
```

## Dataset information

- **Dataset:** `blackgrass_herbicide`
- **Original name:** `herbicide`
- **Source package:** `smbdata`
- **Source package version:** `0.2.0`
- **Rows:** 135
- **Columns:** 7
- **Original license:** GPL (>= 3)
- **Source:** https://cran.r-project.org/package=smbdata

## Columns

```@slate ../../notebooks/tables.jl blackgrass_herbicide_columns
```

## Data

```@slate ../../notebooks/tables.jl blackgrass_herbicide_data
```

The first 25 of 135 rows. `load_dataset("blackgrass_herbicide")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("blackgrass_herbicide")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("blackgrass_herbicide")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 3)**.

For additional information, see the original source:

https://cran.r-project.org/package=smbdata
