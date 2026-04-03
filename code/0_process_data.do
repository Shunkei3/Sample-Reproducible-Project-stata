****************************************************
* 0_process_data.do
****************************************************

/* Objective:
+ Read raw datasets and process them for analysis.
*/


clear all
set more off


*-----------------------------*
* Read flights data
*-----------------------------*
import delimited "data/raw/flights.csv", clear

* Convert variables to numeric if needed
destring dep_delay, replace ignore("NA")

tempfile flights
save `flights'


*-----------------------------*
* Read weather data
*-----------------------------*
import delimited "data/raw/weather.csv", clear

* Convert weather variables to numeric if needed
destring wind_speed temp precip, replace ignore("NA")


*-----------------------------*
* Aggregate weather data (hourly -> daily)
*-----------------------------*
collapse ///
    (mean) wind_speed temp precip, ///
    by(month day origin)

tempfile weather_daily
save `weather_daily'


*-----------------------------*
* Merge datasets
*-----------------------------*
use `flights', clear

merge m:1 month day origin using `weather_daily'

* Keep all flights (left join equivalent)
keep if _merge == 1 | _merge == 3
drop _merge


*-----------------------------*
* Save processed data
*-----------------------------*
save "data/processed/reg_data.dta", replace
