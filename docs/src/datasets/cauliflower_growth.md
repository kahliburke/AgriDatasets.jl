# cauliflower\_growth

## Description

Leaves for cauliflower plants at different times

## Visualization

```@slate ../../notebooks/gallery.jl cauliflower_growth
```

## Dataset information

- **Dataset:** `cauliflower_growth`
- **Original name:** `mead.cauliflower`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 14
- **Columns:** 3
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl cauliflower_growth_columns
```

## Data

```@slate ../../notebooks/tables.jl cauliflower_growth_data
```

All 14 rows.

## Usage

    using AgriDatasets

    df = load_dataset("cauliflower_growth")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("cauliflower_growth")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
