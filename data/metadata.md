# Metadata

This file describes the metadata of the datasets used in this project. The datasets are stored in the `data/raw` folder.

Two raw datasets are used in this project: `flights.csv` and `weather.csv`. The metadata of each dataset is described below.



## flights.csv

source: [nycflights13::flights](https://www.rdocumentation.org/packages/nycflights13/versions/1.0.0/topics/flights)

+ year: (int) Year
+ month: (int) Month
+ day: (int) Day
+ dep_time: (int) Departure time
+ sched_dep_time: (int) Scheduled departure time
+ dep_delay: (dbl) Departure delay
+ ...
+ ...
+ ...

## weather.csv

source: [nycflights13::weather](https://www.rdocumentation.org/packages/nycflights13/versions/1.0.0/topics/weather)


+ origin: (chr) Airport an airplane departed from  
+ year: (int) Year
+ month: (int) Month
+ day: (int) Day
+ hour: (int) Hour
+ temp: (dbl) Temperature in Fahrenheit
+ ...
+ ...
+ ...

