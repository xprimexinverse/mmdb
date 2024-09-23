
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mmdb

<!-- badges: start -->
<!-- badges: end -->

UNDER CONSTRUCTION - come back later…

The goal of mmdb is to provide a set of data structures (S4 classes) and
tools to be able to create and a lightweight database for macroeconomic
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
#> 1999    "1999"        "1"        "-2.0565282079421"   "-1.40624168090532" 
#> 1999.25 "1999.25"     "2"        "-0.627373222796198" "-0.160278769205221"
#> 1999.5  "1999.5"      "3"        "-0.966193454022005" "-0.391157720680662"
#> 1999.75 "1999.75"     "4"        "-0.232671780923346" "-0.609631434394134"
#> 2000    "2000"        "5"        "0.109235724177169"  "0.844051244771288" 
#> 2000.25 "2000.25"     "6"        "2.00387343870055"   "0.819031877509908"
```
