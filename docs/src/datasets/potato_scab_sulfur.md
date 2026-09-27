# potato\_scab\_sulfur

## Description

Potato scab infection with sulfur treatments

## Visualization

```@slate ../../notebooks/gallery.jl potato_scab_sulfur
```

## Dataset information

- **Dataset:** `potato_scab_sulfur`
- **Original name:** `cochran.crd`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 32
- **Columns:** 4
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl potato_scab_sulfur_columns
```

## Data

```@slate ../../notebooks/tables.jl potato_scab_sulfur_data
```

The first 25 of 32 rows. `load_dataset("potato_scab_sulfur")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("potato_scab_sulfur")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("potato_scab_sulfur")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
