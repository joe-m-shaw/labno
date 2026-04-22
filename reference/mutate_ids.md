# Add sample identifiers from filename as additional data columns

Add sample identifiers from filename as additional data columns

## Usage

``` r
mutate_ids(df, filename)
```

## Arguments

- df:

  The dataframe to add identifiers to

- filename:

  The filename of the dataframe

## Value

The original dataframe with additional columns of identifiers from the
filename

## Examples

``` r
data_df <- data.frame(
"col1" = c(1, 2),
"col2" = c("a", "b"))

mutate_ids(df = data_df,
filename = "Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx")
#>   col1 col2    labno worksheet suffix           name labno_suffix
#> 1    1    a 12345678  WS123456      a PierreBEZUKHOV    12345678a
#> 2    2    b 12345678  WS123456      a PierreBEZUKHOV    12345678a
#>   labno_suffix_worksheet
#> 1     12345678a_WS123456
#> 2     12345678a_WS123456
```
