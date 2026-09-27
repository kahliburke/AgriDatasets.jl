# rabbit\_body\_mass

## Description

Relating foot length to body mass

## Visualization

```@slate ../../notebooks/gallery.jl rabbit_body_mass
```

## Dataset information

- **Dataset:** `rabbit_body_mass`
- **Original name:** `Rabbit`
- **Source package:** `gpk`
- **Source package version:** `1.0`
- **Rows:** 141
- **Columns:** 2
- **Original license:** GPL-2
- **Source:** https://cran.r-project.org/package=gpk

## Columns

```@slate ../../notebooks/tables.jl rabbit_body_mass_columns
```

## Data

```@slate ../../notebooks/tables.jl rabbit_body_mass_data
```

The first 25 of 141 rows. `load_dataset("rabbit_body_mass")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("rabbit_body_mass")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("rabbit_body_mass")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL-2**.

For additional information, see the original source:

https://cran.r-project.org/package=gpk
