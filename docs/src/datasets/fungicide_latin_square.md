# fungicide\_latin\_square

## Description

Latin square experiment for testing fungicide

## Visualization

```@slate ../../notebooks/gallery.jl fungicide_latin_square
```

## Dataset information

- **Dataset:** `fungicide_latin_square`
- **Original name:** `goulden.latin`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 25
- **Columns:** 4
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl fungicide_latin_square_columns
```

## Data

```@slate ../../notebooks/tables.jl fungicide_latin_square_data
```

All 25 rows.

## Usage

    using AgriDatasets

    df = load_dataset("fungicide_latin_square")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("fungicide_latin_square")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
