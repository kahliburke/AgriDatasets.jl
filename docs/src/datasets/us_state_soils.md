# us\_state\_soils

## Description

US state soils

## Visualization

```@slate ../../notebooks/gallery.jl us_state_soils
```

## Dataset information

- **Dataset:** `us_state_soils`
- **Original name:** `us.state.soils`
- **Source package:** `aqp`
- **Source package version:** `2.3.2`
- **Rows:** 52
- **Columns:** 3
- **Original license:** GPL (>= 3)
- **Source:** https://cran.r-project.org/package=aqp

## Columns

```@slate ../../notebooks/tables.jl us_state_soils_columns
```

## Data

```@slate ../../notebooks/tables.jl us_state_soils_data
```

The first 25 of 52 rows. `load_dataset("us_state_soils")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("us_state_soils")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("us_state_soils")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL (>= 3)**.

For additional information, see the original source:

https://cran.r-project.org/package=aqp
