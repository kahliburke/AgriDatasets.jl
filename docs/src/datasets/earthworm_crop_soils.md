# earthworm\_crop\_soils

## Description

Earthworms in cultivated soils

## Visualization

```@slate ../../notebooks/gallery.jl earthworm_crop_soils
```

## Dataset information

- **Dataset:** `earthworm_crop_soils`
- **Original name:** `Earthwormbiomass`
- **Source package:** `gpk`
- **Source package version:** `1.0`
- **Rows:** 12
- **Columns:** 5
- **Original license:** GPL-2
- **Source:** https://cran.r-project.org/package=gpk

## Columns

```@slate ../../notebooks/tables.jl earthworm_crop_soils_columns
```

## Data

```@slate ../../notebooks/tables.jl earthworm_crop_soils_data
```

All 12 rows.

## Usage

    using AgriDatasets

    df = load_dataset("earthworm_crop_soils")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("earthworm_crop_soils")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **GPL-2**.

For additional information, see the original source:

https://cran.r-project.org/package=gpk
