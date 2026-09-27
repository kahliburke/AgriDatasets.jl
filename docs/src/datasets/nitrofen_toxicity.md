# nitrofen\_toxicity

## Description

Toxicity of nitrofen in aquatic systems

## Visualization

```@slate ../../notebooks/gallery.jl nitrofen_toxicity
```

## Dataset information

- **Dataset:** `nitrofen_toxicity`
- **Original name:** `nitrofen`
- **Source package:** `boot`
- **Source package version:** `1.3-32`
- **Rows:** 50
- **Columns:** 5
- **Original license:** Unlimited
- **Source:** https://cran.r-project.org/package=boot

## Columns

```@slate ../../notebooks/tables.jl nitrofen_toxicity_columns
```

## Data

```@slate ../../notebooks/tables.jl nitrofen_toxicity_data
```

The first 25 of 50 rows. `load_dataset("nitrofen_toxicity")` returns them all.

## Usage

    using AgriDatasets

    df = load_dataset("nitrofen_toxicity")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("nitrofen_toxicity")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **Unlimited**.

For additional information, see the original source:

https://cran.r-project.org/package=boot
