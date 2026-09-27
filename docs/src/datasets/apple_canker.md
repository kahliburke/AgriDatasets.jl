# apple\_canker

## Description

Infestation of apple shoots by apple canker

## Visualization

```@slate ../../notebooks/gallery.jl apple_canker
```

## Dataset information

- **Dataset:** `apple_canker`
- **Original name:** `jansen.apple`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 36
- **Columns:** 5
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl apple_canker_columns
```

## Data

```@slate ../../notebooks/tables.jl apple_canker_data
```

The first 25 of 36 rows. `load_dataset("apple_canker")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("apple_canker")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("apple_canker")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
