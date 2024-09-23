
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mmdb

<!-- badges: start -->
<!-- badges: end -->

The goal of mmdb is to …

## Installation

You can install the development version of mmdb from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("xprimexinverse/mmdb")
```

## Example

This is a basic example which shows you how to solve a common problem:

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
#>         "1999"        "1"        "0.994073444626497"  "0.886711125130727"  
#>         "1999.25"     "2"        "0.0835976423752953" "-0.868561944915427" 
#>         "1999.5"      "3"        "0.375169630916918"  "0.550567489424181"  
#>         "1999.75"     "4"        "0.0352623295102396" "-1.13865011108788"  
#>         "2000"        "5"        "-0.486287295772744" "0.325842764573239"  
#>         "2000.25"     "6"        "0.809493933582733"  "-0.0375090414304081"
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
