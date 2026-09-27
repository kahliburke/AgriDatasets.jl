# lamb\_births

## Description

Number of lambs born to 3 breeds on 3 farms

## Visualization

```@slate ../../notebooks/gallery.jl lamb_births
```

## Dataset information

- **Dataset:** `lamb_births`
- **Original name:** `mead.lamb`
- **Source package:** `agridat`
- **Source package version:** `1.26`
- **Rows:** 36
- **Columns:** 4
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=agridat

## Columns

```@slate ../../notebooks/tables.jl lamb_births_columns
```

## Data

```@slate ../../notebooks/tables.jl lamb_births_data
```

The first 25 of 36 rows. `load_dataset("lamb_births")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("lamb_births")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("lamb_births")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=agridat
