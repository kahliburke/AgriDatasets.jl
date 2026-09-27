# pig\_weight\_gain

## Description

Weight gain in pigs for different treatments

## Visualization

```@slate ../../notebooks/gallery.jl pig_weight_gain
```

## Dataset information

- **Dataset:** `pig_weight_gain`
- **Original name:** `woodman.pig`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 30
- **Columns:** 10
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl pig_weight_gain_columns
```

## Data

```@slate ../../notebooks/tables.jl pig_weight_gain_data
```

The first 25 of 30 rows. `load_dataset("pig_weight_gain")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("pig_weight_gain")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("pig_weight_gain")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
