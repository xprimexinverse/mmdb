
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

x <- new("series-obj", description="simulated data 1", raw_data = ts(rnorm(15), start = c(1999, 1), frequency = 4), table = "rnorm", units = "number")
y <- new("series-obj", description="simulated data 2", raw_data = ts(rnorm(30), start = c(1995, 1), frequency = 4), table = "rnorm", units = "number")

my_db <- mmdb::add_db(my_db, x)
my_db <- mmdb::add_db(my_db, y)

head(my_db@db,n=10)
#>         Time          Trend      x                  y                   
#> varname "Variable"    "T"        "x"                "y"                 
#> descrip "Description" "Trend"    "simulated data 1" "simulated data 2"  
#> unis    "Units"       "1995Q1=1" "number"           "number"            
#> src     "Source"      "Formula"  "rnorm"            "rnorm"             
#> 1995    "1995"        "1"        NA                 "0.566664004979733" 
#> 1995.25 "1995.25"     "2"        NA                 "1.54246020700802"  
#> 1995.5  "1995.5"      "3"        NA                 "1.05943615767794"  
#> 1995.75 "1995.75"     "4"        NA                 "0.974758621154468" 
#> 1996    "1996"        "5"        NA                 "-0.233933633349589"
#> 1996.25 "1996.25"     "6"        NA                 "-0.822215334215772"
```
