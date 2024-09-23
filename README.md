
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mmdb

<!-- badges: start -->
<!-- badges: end -->

UNDER CONSTRUCTION - come back later…

The goal of mmdb is to provide a set of data structures (S4 classes) and
tools to be able to create a lightweight database for macroeconomic
modelling.

## Installation

You can install the development version of mmdb from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("xprimexinverse/mmdb")
```

## Example

This is a basic example which shows you how to create a database and add
series to it:

``` r
library(mmdb)

trend <- new("series-obj", description="Trend", raw_data = ts(1:10, start = c(2000, 1), frequency = 4))
time  <- new("series-obj", description="Time", raw_data = ts(seq(from = 2000, length.out = 10, by = 0.25), start = c(2000, 1), frequency = 4))

my_db <- mmdb::create_db()

x <- new("series-obj", description="X", raw_data = ts(rnorm(15), start = c(1999, 1), frequency = 4), table = "rnorm", units = "number")
y <- new("series-obj", description="Y", raw_data = ts(rnorm(30), start = c(1999, 1), frequency = 4), table = "rnorm", units = "number")

my_db <- mmdb::add_db(my_db, x)
my_db <- mmdb::add_db(my_db, y)

head(my_db@db,n=10)
#>         Time          Trend      x                    y                   
#> varname "Variable"    "T"        "x"                  "y"                 
#> descrip "Description" "Trend"    "X"                  "Y"                 
#> unis    "Units"       "1999Q1=1" "number"             "number"            
#> src     "Source"      "Formula"  "rnorm"              "rnorm"             
#> 1999    "1999"        "1"        "0.833242702052301"  "0.258526503510622" 
#> 1999.25 "1999.25"     "2"        "-0.202587995703175" "0.861393918458616" 
#> 1999.5  "1999.5"      "3"        "1.81052494528398"   "-1.83115784055647" 
#> 1999.75 "1999.75"     "4"        "0.0274990455695406" "0.731470360933202" 
#> 2000    "2000"        "5"        "-1.30044983050699"  "-0.664762081840303"
#> 2000.25 "2000.25"     "6"        "0.206957613798921"  "0.834460302830218"
```
