# soil\_munsell\_colors

## Description

Traditional soil color names

## Visualization

```@slate ../../notebooks/gallery.jl soil_munsell_colors
```

## Dataset information

- **Dataset:** `soil_munsell_colors`
- **Original name:** `traditionalColorNames`
- **Source package:** `aqp`
- **Source package version:** `2.3.2`
- **Rows:** 482
- **Columns:** 2
- **Original license:** GPL (>= 3)
- **Source:** https://cran.r-project.org/package=aqp

## Columns

```@slate ../../notebooks/tables.jl soil_munsell_colors_columns
```

## Data

```@slate ../../notebooks/tables.jl soil_munsell_colors_data
```

The first 25 of 482 rows. `load_dataset("soil_munsell_colors")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("soil_munsell_colors")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("soil_munsell_colors")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 3)**.

For additional information, see the original source:

https://cran.r-project.org/package=aqp
