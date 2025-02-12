# Sampling of the Papers Included in the Study

This directory contains data and scripts for sampling the papers to be used in the study.

- `sampling_2024.Rmd` - R script used to perform binning and permutation of the PhilPapers dataset; a detailed description of the procedure can be found within the file.
  - `sampling_2024.html` - Compiled report.
  - `experimental_philosophy_philpapers_13_01_2025_bibertool.bib` - PhilPapers dataset (all entries from the "Experimental philosophy" curated category).
- `power_simulation.R` - R script used to simulate data for the purpose of power analysis.
- `data/{1-4}.{csv|xlsx}` - Directory containing the permuted and binned entries from the PhilPapers dataset.

**Note:** Bins 5 and 6 will be processed in the second half of 2025 due to a delay in updates to the PhilPapers database.
