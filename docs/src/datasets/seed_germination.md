# seed\_germination

## Description

Seed germination with different temperatures/concentrations

## Visualization

```@slate ../../notebooks/gallery.jl seed_germination
```

## Dataset information

- **Dataset:** `seed_germination`
- **Original name:** `mead.germination`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 64
- **Columns:** 5
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl seed_germination_columns
```

## Data

```@slate ../../notebooks/tables.jl seed_germination_data
```

The first 25 of 64 rows. `load_dataset("seed_germination")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("seed_germination")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("seed_germination")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
