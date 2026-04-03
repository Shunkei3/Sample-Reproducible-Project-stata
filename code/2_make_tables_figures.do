****************************************************
* 2_make_tables_figures.do
****************************************************

/* Objective
Create figures and tables for manuscript
*/


clear all
set more off

* Define project root (adjust the path as needed)
//cd "~/Dropbox/git/Sample-Reproducible-Project-stata"


*-----------------------------*
* Install packages if missing
*-----------------------------*
cap which esttab
if _rc ssc install estout


*-----------------------------*
* Load processed data
*-----------------------------*
use "data/processed/reg_data.dta", clear


*-----------------------------*
* Create summary statistics table
*-----------------------------*
estpost summarize dep_delay temp precip wind_speed

//esttab, cells("mean sd max") label

* save the table as .tex (for PDF)
esttab using "results/tables/summary_stats.tex", replace ///
	cells("mean(fmt(2)) sd(fmt(2)) max(fmt(2))") ///
	collabels("Mean" "SD" "Max") ///
    label ///
    varlabels( ///
        dep_delay   "Departure Delay" ///
        temp        "Temperature" ///
        precip      "Precipitation" ///
        wind_speed  "Wind Speed" ///
    )

*-----------------------------*
* Make figure
* Distribution of departure delay by carrier,separately for each origin
*-----------------------------*
graph box dep_delay, ///
    over(carrier, label(angle(45))) ///
    by(origin, cols(1) note("")) ///
    ytitle("Departure Delay") ///
    title("") ///
    caption("Note: The figure shows the distribution of departure delay by carrier for each of the airports.")

graph export "results/figures/delay_box.png", replace width(2400)


*-----------------------------*
* Create regression table
*-----------------------------*
* Load regression results

* Model 1: no fixed effects
estimates use "results/reg_results_1.ster"
estimates store reg_results_1

* Model 2: two-way fixed effects
estimates use "results/reg_results_2.ster"
estimates store reg_results_2

* Model 3: two-way fixed effects with clustering by origin
estimates use "results/reg_results_3.ster"
estimates store reg_results_3


* Make table (save as .tex)
esttab reg_results_1 reg_results_2 reg_results_3 ///
    using "results/tables/reg_table.tex", replace ///
    star(* 0.10 ** 0.05 *** 0.01) ///
    se ///
	label ///
    mtitle("Model 1" "Model 2" "Model 3") ///
    varlabels( ///
        temp "Temperature" ///
        precip "Precipitation" ///
        wind_speed "Wind Speed" ///
    ) ///
    drop(_cons) ///
    stats(N r2, labels("Observations" "R-squared"))


