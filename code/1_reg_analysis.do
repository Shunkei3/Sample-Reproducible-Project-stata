****************************************************
* 1_reg_analysis.do
****************************************************

/* Objective:
+ Run regression analyses and save the results.
*/


clear all
set more off

* Define project root (adjust the path as needed)
//cd "~/Dropbox/git/Sample-Reproducible-Project-stata"


*-----------------------------*
* Install package if missing
*-----------------------------*
cap which reghdfe
if _rc ssc install reghdfe

* also install dependency if missing
cap which ftools
if _rc ssc install ftools


*-----------------------------*
* Load analysis-ready data
*-----------------------------*
use "data/processed/reg_data.dta", clear


*-----------------------------*
* Regression analysis
*-----------------------------*
* Model 1: no fixed effects
reg dep_delay temp precip wind_speed
estimates store reg_results_1
estimates save "results/reg_results_1", replace

* Model 2: two-way fixed effects
reghdfe dep_delay temp precip wind_speed, absorb(month origin)
estimates store reg_results_2
estimates save "results/reg_results_2", replace

* Model 3: two-way fixed effects with clustering by origin
reghdfe dep_delay temp precip wind_speed, absorb(month origin) vce(cluster origin)
estimates store reg_results_3
estimates save "results/reg_results_3", replace


