# tomato\_insecticides

## Description

Dataset created by Renzo Caceres Rossi on tomato insecticide treatments

## Visualization

```@slate ../../notebooks/gallery.jl tomato_insecticides
```

## Dataset information

- **Dataset:** `tomato_insecticides`
- **Original name:** `tomato_insecticides`
- **Source package:** `Zenodo (original work)`
- **Source package version:** `-`
- **Rows:** 15
- **Columns:** 4
- **Original license:** CC BY 4.0
- **Source:** https://zenodo.org/records/21611429

## Columns

```@slate ../../notebooks/tables.jl tomato_insecticides_columns
```

## Data

```@slate ../../notebooks/tables.jl tomato_insecticides_data
```

All 15 rows.

## Usage

    using AgriDatasets

    df = load_dataset("tomato_insecticides")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("tomato_insecticides")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **CC BY 4.0**.

For additional information, see the original source:

https://zenodo.org/records/21611429
