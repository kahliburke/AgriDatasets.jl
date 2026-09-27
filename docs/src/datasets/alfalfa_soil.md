# alfalfa\_soil

## Description

Alfalfa soil requirement for land evaluation

## Visualization

```@slate ../../notebooks/gallery.jl alfalfa_soil
```

## Dataset information

- **Dataset:** `alfalfa_soil`
- **Original name:** `ALFALFASoil`
- **Source package:** `ALUES`
- **Source package version:** `0.2.1`
- **Rows:** 12
- **Columns:** 8
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=ALUES

## Columns

```@slate ../../notebooks/tables.jl alfalfa_soil_columns
```

## Data

```@slate ../../notebooks/tables.jl alfalfa_soil_data
```

All 12 rows.

## Usage

    using AgriDatasets

    df = load_dataset("alfalfa_soil")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("alfalfa_soil")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=ALUES
