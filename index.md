# labno

`labno` is a package that makes it easier to work with sample
identifiers used at the North West Genomic Laboratory Hub.

Each sample is given a DNA “lab number” which is stored as “labno” in
sample databases.

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
worksheet (WS123456) and lab number (12345678) values.

Where examples of patient names are required, I have used character
names from novels by Leo Tolstoy (Anna Karenina, Pierre Bezukhov etc).

## Example

You can use `labno` to extract sample identifiers stored in filenames,
which is useful when doing data projects involving multiple sample
files.

A more detailed example is given in the “Reading files” vignette.

``` r

library(labno)

filename <- "WS123456_12345678a_AnnaKarenina"
```

Using `labno`, you can quickly extract the worksheet number that the
sample was tested on

``` r

extract_worksheet(filename)
#> [1] "WS123456"
```

You can extract the lab number, and its suffix (if present). Samples
which are tested multiple times per worksheet will have suffixes of a,
b, c etc.

``` r

extract_labno(filename)
#> [1] "12345678"

extract_suffix(filename)
#> [1] "a"
```

You can also extract the name of the patient (if present).

``` r

extract_name(filename)
#> [1] "AnnaKarenina"
```

`labno` also includes a wrapper function to extract all this information
in one go.

``` r

filename_to_df(filename)
#>      labno worksheet suffix         name labno_suffix labno_suffix_worksheet
#> 1 12345678  WS123456      a AnnaKarenina    12345678a     12345678a_WS123456
```
