# Convert a filename into a dataframe of identifiers

Convert a filename into a dataframe of identifiers

## Usage

``` r
filename_to_df(filename)
```

## Arguments

- filename:

  A filename with identifiers in specified format

## Value

A dataframe of sample identifiers

## Examples

``` r
filename_to_df("Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx")
#>      labno worksheet suffix           name labno_suffix labno_suffix_worksheet
#> 1 12345678  WS123456      a PierreBEZUKHOV    12345678a     12345678a_WS123456
```
