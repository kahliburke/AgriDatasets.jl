# robusta\_temp

## Description

Robusta coffee temperature requirement for land evaluation

## Visualization

```@slate ../../notebooks/gallery.jl robusta_temp
```

## Dataset information

- **Dataset:** `robusta_temp`
- **Original name:** `COFFEEROTemp`
- **Source package:** `ALUES`
- **Source package version:** `0.2.1`
- **Rows:** 3
- **Columns:** 8
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=ALUES

## Columns

```@slate ../../notebooks/tables.jl robusta_temp_columns
```

## Data

```@slate ../../notebooks/tables.jl robusta_temp_data
```

All 3 rows.

## Usage

    using AgriDatasets

    df = load_dataset("robusta_temp")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("robusta_temp")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=ALUES
