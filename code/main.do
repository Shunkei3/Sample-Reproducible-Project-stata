****************************************************
* main.do
****************************************************

/* Replicating the results of the paper: "Title of the Paper" 

Code written by Shunkei Kakimoto
Date: 4/2/2026

This do file creates the dataset used for the analysis and reproduces the main results of the paper. It runs the following steps:

1. 0_process_data.do: Reads raw datasets, processes them, and saves the cleaned dataset for analysis.
2. 1_reg_analysis.do: Runs the regression analysis and saves the results.
3. 2_make_tables.do: Creates tables and figures for the paper.
*/

/* **NOTE**:
- Make sure to set the correct path for the working directory. This path should point to the root of the project where the "data" and "code" folders are located. It will be used in the subsequent do files to read and save datasets.

*/


// The original results were produced under Stata 19.5

clear all
set more off

*-----------------------------*
* Start log
*-----------------------------*
log using "code/main.log", replace text

*-----------------------------*
* Reproducing the results
*-----------------------------*
// 1. Run the data processing script
do code/0_process_data.do

// 2. Run the regression analysis script
do code/1_reg_analysis.do

// 3. Run the script to create tables and figures
do code/2_make_tables_figures.do

*-----------------------------*
* End log
*-----------------------------*
log close
