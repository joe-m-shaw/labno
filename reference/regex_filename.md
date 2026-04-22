# Regular expressions for filenames

Regular expressions for filenames

## Usage

``` r
regex_filename()
```

## Value

A named list of regular expressions for different filename formats

## Examples

``` r
regex_filename()$filename_with_names
#> [1] "^.*(WS\\d{6})_(\\d{8})(a|b|c|d|)_([:alnum:]{2,30}).*$"
```
