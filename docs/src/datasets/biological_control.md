# biological\_control

## Description

Biological pest control experiment

## Visualization

```@slate ../../notebooks/gallery.jl biological_control
```

## Dataset information

- **Dataset:** `biological_control`
- **Original name:** `ex0817`
- **Source package:** `Sleuth3`
- **Source package version:** `1.0-6`
- **Rows:** 15
- **Columns:** 2
- **Original license:** GPL (>= 2)
- **Source:** https://cran.r-project.org/package=Sleuth3

## Columns

```@slate ../../notebooks/tables.jl biological_control_columns
```

## Data

```@slate ../../notebooks/tables.jl biological_control_data
```

All 15 rows.

## Usage

    using AgriDatasets

    df = load_dataset("biological_control")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("biological_control")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 2)**.

For additional information, see the original source:

https://cran.r-project.org/package=Sleuth3
