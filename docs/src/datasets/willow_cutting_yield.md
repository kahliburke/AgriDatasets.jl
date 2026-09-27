# willow\_cutting\_yield

## Description

Effect of type and size of cutting on willow yield

## Visualization

```@slate ../../notebooks/gallery.jl willow_cutting_yield
```

## Dataset information

- **Dataset:** `willow_cutting_yield`
- **Original name:** `cuttings`
- **Source package:** `smbdata`
- **Source package version:** `0.2.0`
- **Rows:** 25
- **Columns:** 6
- **Original license:** GPL (>= 3)
- **Source:** https://cran.r-project.org/package=smbdata

## Columns

```@slate ../../notebooks/tables.jl willow_cutting_yield_columns
```

## Data

```@slate ../../notebooks/tables.jl willow_cutting_yield_data
```

All 25 rows.

## Usage

    using AgriDatasets

    df = load_dataset("willow_cutting_yield")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("willow_cutting_yield")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 3)**.

For additional information, see the original source:

https://cran.r-project.org/package=smbdata
