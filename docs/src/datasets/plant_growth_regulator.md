# plant\_growth\_regulator

## Description

Plant heights in glasshouse

## Visualization

```@slate ../../notebooks/gallery.jl plant_growth_regulator
```

## Dataset information

- **Dataset:** `plant_growth_regulator`
- **Original name:** `heights`
- **Source package:** `smbdata`
- **Source package version:** `0.2.0`
- **Rows:** 24
- **Columns:** 5
- **Original license:** GPL (>= 3)
- **Source:** https://cran.r-project.org/package=smbdata

## Columns

```@slate ../../notebooks/tables.jl plant_growth_regulator_columns
```

## Data

```@slate ../../notebooks/tables.jl plant_growth_regulator_data
```

All 24 rows.

## Usage

    using AgriDatasets

    df = load_dataset("plant_growth_regulator")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("plant_growth_regulator")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 3)**.

For additional information, see the original source:

https://cran.r-project.org/package=smbdata
