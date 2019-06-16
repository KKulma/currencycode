
<!-- README.md is generated from README.Rmd. Please edit that file -->

# currencycode

<!-- badges: start -->

<!-- badges: end -->

This package provides a dataset with country and currency names, as well
as ISO codes.

## Installation

You can install the current version of `currencycode` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("KKulma/currencycode")
```

## Example

``` r
library(currencycode)
## basic example code
data("currency_list")

str(currency_list)
#> 'data.frame':    249 obs. of  7 variables:
#>  $ countrycode_2   : chr  "AW" "AF" "AO" "AI" ...
#>  $ countrycode_3   : chr  "ABW" "AFG" "AGO" "AIA" ...
#>  $ countrycode_num : chr  "533" "004" "024" "660" ...
#>  $ country_name    : chr  "Aruba" "Afghanistan" "Angola" "Anguilla" ...
#>  $ country_fullname: chr  NA "Islamic Republic of Afghanistan" "Republic of Angola" NA ...
#>  $ currency_code   : chr  "AWG" NA NA NA ...
#>  $ currency_name   : chr  "Aruban Florin" NA NA NA ...
```
