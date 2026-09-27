# arabica\_soil

## Description

Arabica coffee soil requirement for land evaluation

## Visualization

```@slate ../../notebooks/gallery.jl arabica_soil
```

## Dataset information

- **Dataset:** `arabica_soil`
- **Original name:** `COFFEEARSoil`
- **Source package:** `ALUES`
- **Source package version:** `0.2.1`
- **Rows:** 11
- **Columns:** 8
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=ALUES

## Columns

```@slate ../../notebooks/tables.jl arabica_soil_columns
```

## Data

```@slate ../../notebooks/tables.jl arabica_soil_data
```

All 11 rows.

## Usage

    using AgriDatasets

    df = load_dataset("arabica_soil")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("arabica_soil")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=ALUES
