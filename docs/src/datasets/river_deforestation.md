# river\_deforestation

## Description

River deforestation: air and water temperatures before/after

## Visualization

```@slate ../../notebooks/gallery.jl river_deforestation
```

## Dataset information

- **Dataset:** `river_deforestation`
- **Original name:** `deforestation`
- **Source package:** `EnTraineR`
- **Source package version:** `1.0.0`
- **Rows:** 56
- **Columns:** 3
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=EnTraineR

## Columns

```@slate ../../notebooks/tables.jl river_deforestation_columns
```

## Data

```@slate ../../notebooks/tables.jl river_deforestation_data
```

The first 25 of 56 rows. `load_dataset("river_deforestation")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("river_deforestation")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("river_deforestation")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=EnTraineR
