
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

my_db@db
#>         Time          Trend      x                     y                    
#> varname "Variable"    "T"        "x"                   "y"                  
#> descrip "Description" "Trend"    "simulated data 1"    "simulated data 2"   
#> unis    "Units"       "1995Q1=1" "number"              "number"             
#> src     "Source"      "Formula"  "rnorm"               "rnorm"              
#> 1995    "1995"        "1"        NA                    "0.435099843610337"  
#> 1995.25 "1995.25"     "2"        NA                    "0.305436920030802"  
#> 1995.5  "1995.5"      "3"        NA                    "-0.0110325178638104"
#> 1995.75 "1995.75"     "4"        NA                    "0.134944259210326"  
#> 1996    "1996"        "5"        NA                    "0.582760591220262"  
#> 1996.25 "1996.25"     "6"        NA                    "1.27927660760226"   
#> 1996.5  "1996.5"      "7"        NA                    "0.197373529213436"  
#> 1996.75 "1996.75"     "8"        NA                    "0.737865268831942"  
#> 1997    "1997"        "9"        NA                    "-0.0302439819025905"
#> 1997.25 "1997.25"     "10"       NA                    "-0.0960386228847986"
#> 1997.5  "1997.5"      "11"       NA                    "-0.195295218548045" 
#> 1997.75 "1997.75"     "12"       NA                    "2.22701626865563"   
#> 1998    "1998"        "13"       NA                    "-1.74374232897799"  
#> 1998.25 "1998.25"     "14"       NA                    "0.0853844308129567" 
#> 1998.5  "1998.5"      "15"       NA                    "-1.66842297691403"  
#> 1998.75 "1998.75"     "16"       NA                    "-0.488824155967965" 
#> 1999    "1999"        "17"       "-0.144047681850214"  "-0.615256584754332" 
#> 1999.25 "1999.25"     "18"       "-0.199239772888886"  "1.79092342309286"   
#> 1999.5  "1999.5"      "19"       "-0.456046654102201"  "-0.494687506262408" 
#> 1999.75 "1999.75"     "20"       "0.929260552490954"   "0.728638576656554"  
#> 2000    "2000"        "21"       "0.917782616313169"   "-0.335969133279319" 
#> 2000.25 "2000.25"     "22"       "-0.506481044995014"  "0.668837365475544"  
#> 2000.5  "2000.5"      "23"       "-0.579940255442724"  "-0.530927668841117" 
#> 2000.75 "2000.75"     "24"       "-0.297229958409657"  "-0.930358270125055" 
#> 2001    "2001"        "25"       "0.906989608718692"   "-1.00431526273849"  
#> 2001.25 "2001.25"     "26"       "0.877997753693302"   "-0.582863601428777" 
#> 2001.5  "2001.5"      "27"       "-0.0376480185950761" "-0.403854118029326" 
#> 2001.75 "2001.75"     "28"       "-1.23169956294476"   "-1.09661563290071"  
#> 2002    "2002"        "29"       "2.89438166558774"    "0.422179720172542"  
#> 2002.25 "2002.25"     "30"       "1.00255881443016"    "1.28871267409435"   
#> 2002.5  "2002.5"      "31"       "-0.713760019749405"  NA
```
