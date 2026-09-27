# robusta\_terrain

## Description

Robusta coffee terrain requirement for land evaluation

## Visualization

```@slate ../../notebooks/gallery.jl robusta_terrain
```

## Dataset information

- **Dataset:** `robusta_terrain`
- **Original name:** `COFFEEROTerrain`
- **Source package:** `ALUES`
- **Source package version:** `0.2.1`
- **Rows:** 5
- **Columns:** 8
- **Original license:** MIT + file LICENSE
- **Source:** https://cran.r-project.org/package=ALUES

## Columns

```@slate ../../notebooks/tables.jl robusta_terrain_columns
```

## Data

```@slate ../../notebooks/tables.jl robusta_terrain_data
```

All 5 rows.

## Usage

    using AgriDatasets

    df = load_dataset("robusta_terrain")

The dataset is returned as a `DataFrame`.

## Metadata

    dataset_info("robusta_terrain")

This displays the metadata associated with the dataset.

## Source and licensing

The dataset is included in `AgriDatasets.jl` with attribution to its original source.

The original dataset license is **MIT + file LICENSE**.

For additional information, see the original source:

https://cran.r-project.org/package=ALUES
