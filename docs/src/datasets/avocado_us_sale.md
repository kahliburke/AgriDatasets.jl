# avocado\_us\_sale

## Description

Hass avocado weekly US sales

## Visualization

```@slate ../../notebooks/gallery.jl avocado_us_sale_pick
```
```@slate ../../notebooks/gallery.jl avocado_us_sale
```

## Dataset information

- **Dataset:** `avocado_us_sale`
- **Original name:** `hass_usa`
- **Source package:** `avocado`
- **Source package version:** `0.2.0`
- **Rows:** 810
- **Columns:** 11
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=avocado

## Columns

```@slate ../../notebooks/tables.jl avocado_us_sale_columns
```

## Data

```@slate ../../notebooks/tables.jl avocado_us_sale_data
```

The first 25 of 810 rows. `load_dataset("avocado_us_sale")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("avocado_us_sale")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("avocado_us_sale")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=avocado
