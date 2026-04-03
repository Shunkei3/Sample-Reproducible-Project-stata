# Sample Reproducible Project with Stata code

> NOTE: This sample project was created for the Reproducibility Workshop at the APEC Student Seminar for demonstration purposes. The data and code are not intended for actual research use.


## Overview
This repository contains the full code for the research project: **"The Impact of Weather on Flight Delay"**. All results are generated using Stata, and and the manuscript is compiled using Quarto.


# Project Structure

The main structure of the project is as follows:

```
Sample-Reproducible-Project-stata/
├─ code/          # Scripts for data processing, analysis, and figure generation
├─ data/ 
│  ├─ raw/        # Original, unmodified data
│  ├─ processed/  # Cleaned and processed data used for analysis
├─ results/
│  ├─ figures/    # Generated figures
│  ├─ tables/     # Generated tables 
├─ writing/       # Manuscript and supplementary materials
├─ README.md
```

# How to Reproduce the Project

## Requirements:

+ Stata (tested on Stata 19.5)
+ Quarto CLI (https://quarto.org/docs/get-started/)
+ LaTeX (any distribution; TinyTeX can be installed via `quarto install tinytex` in the terminal if needed)

<br>

Stata packages:

+ `reghdfe`
+ `estout`

All required packages will be installed automatically (if missing) when running the code.


## Steps to Reproduce:

**Step 1.** Clone the repository to your local machine (or download and extract the ZIP file).

**Step 2.** In Stata, run:

```stata
cd "path/to/Sample-Reproducible-Project-stata"
do "code/main.do"
```

Replace "path/to/Sample-Reproducible-Project-stata" with the location where you saved the project on your computer. 

This will execute all the Stata scripts sequentially to process the data, run the analyses, and generate the tables and figures. The generated tables and figures will be saved in the `results/` folder.

**Step 3.** Open `writing/manuscript_to_pdf.qmd` on Rstudio or any text editor that supports Quarto, and render it to PDF. This will compile the manuscript and include the generated tables and figures.


## Script Details
- `code/0_process_data.do`: Processes the raw data and creates the cleaned dataset.
- `code/1_reg_analysis.do`: Runs regression analysis and saves estimation results.
- `code/2_make_tables_figures.do`: Generates tables and figures used in the manuscript.
- `writing/manuscript_to_pdf.qmd`: Produces the manuscript in PDF format, including tables and figures.

## Data Sources

See `data/metadata.md` for details on the data sources used in this project, and variables definitions. 