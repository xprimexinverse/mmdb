
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mmdb

<a href="https://xprimexinverse.github.io/mmdb/"><img src="man/figures/logo.png" align="right" height="139" alt="mmdb website" /></a>

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

my_db@db
#>         Time          Trend      x                    y                     
#> varname "Variable"    "T"        "x"                  "y"                   
#> descrip "Description" "Trend"    "simulated data 1"   "simulated data 2"    
#> unis    "Units"       "1995Q1=1" "number"             "number"              
#> src     "Source"      "Formula"  "rnorm"              "rnorm"               
#> 1995    "1995"        "1"        NA                   "0.46935823825687"    
#> 1995.25 "1995.25"     "2"        NA                   "-1.36874765309818"   
#> 1995.5  "1995.5"      "3"        NA                   "-0.782394768326111"  
#> 1995.75 "1995.75"     "4"        NA                   "0.518052621651203"   
#> 1996    "1996"        "5"        NA                   "1.95184137008304"    
#> 1996.25 "1996.25"     "6"        NA                   "0.0365104989877566"  
#> 1996.5  "1996.5"      "7"        NA                   "-0.863109386491993"  
#> 1996.75 "1996.75"     "8"        NA                   "1.90338489582371"    
#> 1997    "1997"        "9"        NA                   "0.613903388469461"   
#> 1997.25 "1997.25"     "10"       NA                   "-0.517142458154492"  
#> 1997.5  "1997.5"      "11"       NA                   "0.000581409211890919"
#> 1997.75 "1997.75"     "12"       NA                   "-0.987861034741544"  
#> 1998    "1998"        "13"       NA                   "-0.311954358932907"  
#> 1998.25 "1998.25"     "14"       NA                   "-0.675603454254265"  
#> 1998.5  "1998.5"      "15"       NA                   "-0.452555221662718"  
#> 1998.75 "1998.75"     "16"       NA                   "0.124014818706994"   
#> 1999    "1999"        "17"       "0.29317392455371"   "-0.868555694995367"  
#> 1999.25 "1999.25"     "18"       "0.907437098986886"  "0.268759578965299"   
#> 1999.5  "1999.5"      "19"       "-0.416935555521663" "0.429892257082258"   
#> 1999.75 "1999.75"     "20"       "-0.599745899538752" "0.551067505262942"   
#> 2000    "2000"        "21"       "-0.210282362053429" "1.3643902339371"     
#> 2000.25 "2000.25"     "22"       "-0.668810300903699" "-0.8895642197107"    
#> 2000.5  "2000.5"      "23"       "-2.15254060555"     "1.55197547028612"    
#> 2000.75 "2000.75"     "24"       "1.32385673709543"   "-0.376010845860997"  
#> 2001    "2001"        "25"       "1.74498196950422"   "-1.27333052579055"   
#> 2001.25 "2001.25"     "26"       "1.54325057556048"   "-1.82695016220219"   
#> 2001.5  "2001.5"      "27"       "0.112645115755676"  "-2.39852795901949"   
#> 2001.75 "2001.75"     "28"       "0.620362052974323"  "-1.63383172169487"   
#> 2002    "2002"        "29"       "1.03180741315992"   "0.341261381613333"   
#> 2002.25 "2002.25"     "30"       "0.933345940467668"  "0.644212636650992"   
#> 2002.5  "2002.5"      "31"       "0.940706872798723"  NA
```
