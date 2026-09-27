# arabica\_terrain

## Description

Arabica coffee terrain requirement for land evaluation

## Visualization

```@slate ../../notebooks/gallery.jl arabica_terrain
```

## Dataset information

- **Dataset:** `arabica_terrain`
- **Original name:** `COFFEEARTerrain`
- **Source package:** `ALUES`
- **Source package version:** `0.2.1`
- **Rows:** 6
- **Columns:** 8
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=ALUES

## Columns

```@slate ../../notebooks/tables.jl arabica_terrain_columns
```

## Data

```@slate ../../notebooks/tables.jl arabica_terrain_data
```

All 6 rows.

## Usage

    using AgriDatasets

    df = load_dataset("arabica_terrain")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("arabica_terrain")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=ALUES
