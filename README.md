
<!-- README.md is generated from README.Rmd. Please edit that file -->

# labno

<!-- badges: start -->
<!-- badges: end -->

`labno` is a package that makes it easier to work with sample
identifiers used at the North West Genomic Laboratory Hub.

## Installation

You can install the development version of labno from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("joe-m-shaw/labno")
```

## Information Governance

**No patient identifiable information should be included in this
repository.**

If you spot some, please let me know.

For the purpose of testing functions, I have used generic examples for
worksheet (WS123456) and lab number (12345678) values. Where examples of
patient names are required, I have used character names from novels by
Leo Tolstoy.

## Example

You can use `labno` to extract sample identifiers stored in filenames,
which is useful when doing validation projects involving multiple sample
files.

``` r

library(labno)

filename <- "WS123456_12345678_AnnaKarenina"

extract_labno(filename)
#> [1] "12345678"

extract_name(filename)
#> [1] "AnnaKarenina"

filename_to_df(filename)
#>      labno worksheet suffix         name labno_suffix labno_suffix_worksheet
#> 1 12345678  WS123456        AnnaKarenina     12345678      12345678_WS123456
```
